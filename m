Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890A8CAC597
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Sep 2025 12:43:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uy8Xd-00020B-QF; Mon, 15 Sep 2025 08:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uy8XX-0001z3-9b
 for qemu-arm@nongnu.org; Mon, 15 Sep 2025 08:42:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uy8XK-00022L-GN
 for qemu-arm@nongnu.org; Mon, 15 Sep 2025 08:42:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757940135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=upCqd4zzEa5ipgfog/Bu7nZEUYp+giz41ke/IOKHBko=;
 b=daYKHGZz2hs5eAPaAQClVviPrKmxt2w66WEFRemiQrqNCMqEix27lqhwP0kQEqYLWk/Xcj
 MV1vwikIkaYZJARDBnzxC4c6ctVU/zmExpoyKpHuUOEnuTRO5drVf71J9d+qeeDvTMFuW/
 vW9JY4rMWM4Vr7MbyRVQUq5NMPDSHq8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-475-05meOrpoN0uIopXnenlKOQ-1; Mon,
 15 Sep 2025 08:42:12 -0400
X-MC-Unique: 05meOrpoN0uIopXnenlKOQ-1
X-Mimecast-MFC-AGG-ID: 05meOrpoN0uIopXnenlKOQ_1757940131
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0CF8E180034C; Mon, 15 Sep 2025 12:42:11 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.33.128])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 084D71800447; Mon, 15 Sep 2025 12:42:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 0/2] tests/functional: Adapt reverse_debugging to run w/o
 Avocado (yet another try)
Date: Mon, 15 Sep 2025 14:42:05 +0200
Message-ID: <20250915124207.42053-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.035,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Here's yet another attempt to remove the avocado dependency from the
reverse debugging tests: I basically took Gustavo's patches to rework
tests/functional/reverse_debugging.py, but instead of calling that
through tests/guest-debug/run-test.py and adding the cumbersome code
to support additional test execution logic, I kept our normal way of
running tests via pycotap. Instead, the essential logic for running
gdb is copied from tests/guest-debug/run-test.py into the new function
reverse_debug() that then runs gdb directly with using
tests/functional/reverse_debugging.py as the script.

Marked as an RFC since this still needs some love... The aarch64 test
seems to work already (after applying the fix for the reverse debug there
first: https://patchew.org/QEMU/20250603125459.17688-1-1844144@gmail.com/ ),
but the ppc64 and x86 tests are currently still completely broken.
Also we currently log into two different folders this way, into
tests/functional/aarch64/test_reverse_debug.ReverseDebugging_AArch64.test_aarch64_virt
for the normal outer test, and into
tests/functional/aarch64/reverse_debugging.ReverseDebugging.test_reverse_debugging
for the script that is run in gdb ... it's likely ok for the aarch64
test, but the ppc64 test contains two subtests, so we need to come up
with a better solution here for the final implementation.

Gustavo Romero (2):
  tests/functional: Provide GDB to the functional tests
  tests/functional: Adapt reverse_debugging to run w/o Avocado

 configure                                     |   2 +
 meson.build                                   |   4 +
 meson_options.txt                             |   2 +
 scripts/meson-buildoptions.sh                 |   2 +
 .../functional/aarch64/test_reverse_debug.py  |  16 +-
 tests/functional/meson.build                  |   7 +
 tests/functional/ppc64/test_reverse_debug.py  |  18 +-
 tests/functional/reverse_debugging.py         | 235 +++++++++++-------
 tests/functional/x86_64/test_reverse_debug.py |  20 +-
 9 files changed, 188 insertions(+), 118 deletions(-)

-- 
2.51.0


