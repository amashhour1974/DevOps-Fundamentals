# Copyright 2017 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
"""`gcloud tasks queues update-pull-queue` command."""

from googlecloudsdk.api_lib.tasks import queues
from googlecloudsdk.calliope import base
from googlecloudsdk.command_lib.tasks import constants
from googlecloudsdk.command_lib.tasks import flags
from googlecloudsdk.command_lib.tasks import parsers
from googlecloudsdk.core import log


@base.ReleaseTracks(base.ReleaseTrack.ALPHA)
class UpdatePull(base.UpdateCommand):
  """Update a pull queue.

  The flags available to this command represent the fields of a pull queue
  that are mutable. Attempting to use this command on a different type of queue
  will result in an error.

  For more information about the different queue target types, see:
  https://cloud.google.com/cloud-tasks/docs/queue-types
  """

  @staticmethod
  def Args(parser):
    flags.AddQueueResourceArg(parser, 'to update')
    flags.AddLocationFlag(parser)
    flags.AddUpdatePullQueueFlags(parser)

  def Run(self, args):
    parsers.CheckUpdateArgsSpecified(args, constants.PULL_QUEUE)
    queues_client = queues.Queues()
    queue_ref = parsers.ParseQueue(args.queue, args.location)
    queue_config = parsers.ParseCreateOrUpdateQueueArgs(
        args, constants.PULL_QUEUE, queues_client.api.messages, is_update=True)
    log.warning(constants.QUEUE_MANAGEMENT_WARNING)
    update_response = queues_client.Patch(
        queue_ref, retry_config=queue_config.retryConfig)
    log.status.Print('Updated queue [{}].'.format(queue_ref.Name()))
    return update_response
