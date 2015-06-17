# -*- coding: utf-8 -*-

"""
Copyright (C) 2015 Dariusz Suchojad <dsuch at zato.io>

Licensed under LGPLv3, see LICENSE.txt for terms and conditions.
"""

from __future__ import absolute_import, division, print_function, unicode_literals

# stdlib
from logging import getLogger
from unittest import TestCase

# Zato
from zato.common.test import rand_int, rand_string

logger = getLogger(__name__)

# ################################################################################################################################

class SchedulerTestCase(TestCase):

# ################################################################################################################################

    def test_on_job_executed(self):
        self.fail('TBD')
