Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3847566njb;
        Tue, 10 Dec 2024 22:39:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX2nYfnLrcZf1UYqPfjzMSEtBmon1TmC+9DnJADWmfO5zx9Iv3Ny1AAaJQgd+wt+7BZk3YgxSqrMfOYHA==@linaro.org
X-Google-Smtp-Source: AGHT+IHL0VLUPtMvosLElnDQBOqVqSAeLXrEibBoFAVFT4D86u9DRxD2yGqQYW0Unqk2Hjqz6S55
X-Received: by 2002:a05:620a:1790:b0:7b1:4fdb:3a1c with SMTP id af79cd13be357-7b6eb5cbb6amr334065685a.47.1733899148341;
        Tue, 10 Dec 2024 22:39:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733899148; cv=none;
        d=google.com; s=arc-20240605;
        b=F4cG9crsIg3//syS31RTq2izKhhoHCj+xMlPPpAKNZBfZhzIFctoVeyOAVqWy+ib/L
         UJMnKFPE+QomnwwsZJRcjf+igMJ1aozHckJak6n3ptySvlXqrNomxp4KMwDFsuWVZ0s4
         YRibnKlLs6uDmonEYfjFG1oyCiHs0yXOYnjdIB/6aNmX1hy+5PkbKXg6t7wcH3KW6pkF
         9taNMmqTGgCqynZC+NpXXapY3FWDgRa4SLYKtB0iomhL15siQ3q2/2iuc3U8JqUCrnVu
         l0nJTbltxjPBftBMkSh9/6GtLOmekFTrutjTNaUe9NwsWBDoEU47fORMFTGKyvjXhL0J
         p78A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=laezA729Jrqs4I9HRYeFkOfoE0lAAG2rG7GSzzynBOA=;
        fh=dCqPeOMyJN6b1xLXHrHk9Vfv4bvn90zVm2nOfsHEFC8=;
        b=kIfbZP9nB+pSOwf5ntibLArXIDvT0WPDqA1rL4p1++uS1SYC6hkTz/WJ+HxFwikp57
         uyKLO3oYOan9iiH+5VRhejBbIwH9a8Lcsa+YidCwOzt5bEC9AzgateBSjr81EqIIJct3
         EM/9IBKHo5k/ZXNwKDCjVUiEgjnqisjbjvSY+G26KQiSt2KiaEFGAximwq5ouNJgDHjO
         AOqerXtWGDipQPqrvLMik8xR7lIXdWPiQxQdr8jhfD1Iwr8E1VRnP8kl0Z0Rxr4Xhr1m
         AQiIJMPZqHgmU+qurzqMNvjLwwNzuPUmC6U3ismtkJAW5zGW86YISmhEl9Ue+IJCLsM2
         5D7g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ty0K22hw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6ea23df36si184705185a.138.2024.12.10.22.39.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 22:39:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ty0K22hw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLGH3-00065x-KL; Wed, 11 Dec 2024 01:32:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tLGGC-0004ke-0H
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 01:31:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tLGG4-0008UO-3I
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 01:31:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733898698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=laezA729Jrqs4I9HRYeFkOfoE0lAAG2rG7GSzzynBOA=;
 b=Ty0K22hwqS1Nls8a80QTDIfrfuJ2+nO/oD5a9kmwJY31nRtCB3kgxbgsYl6DsR/5aruRPH
 Qn2AuN5q3QmKjdAiLPijsxySHZI1z9lP+19Gy/sETDp+fdg7+/qIAnYQAgX/y9uqDCaCW/
 0C+cP3LTr/hBN5hTO+XPM08jLcklG1Q=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-553-2eahP898Mm6RST89UTM2Rw-1; Wed,
 11 Dec 2024 01:31:35 -0500
X-MC-Unique: 2eahP898Mm6RST89UTM2Rw-1
X-Mimecast-MFC-AGG-ID: 2eahP898Mm6RST89UTM2Rw
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D6284195605F; Wed, 11 Dec 2024 06:31:34 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.194.144])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 760A51956054; Wed, 11 Dec 2024 06:31:33 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PULL 13/24] tests/functional: Introduce a specific test for
 rainier-bmc machine
Date: Wed, 11 Dec 2024 07:30:47 +0100
Message-ID: <20241211063058.1222038-14-clg@redhat.com>
In-Reply-To: <20241211063058.1222038-1-clg@redhat.com>
References: <20241211063058.1222038-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.52,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GZ96+jFp6TUy

This simply moves the rainier-bmc test to a new test file. No changes
in the test. The test_arm_aspeed.py is deleted.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Link: https://lore.kernel.org/r/20241206131132.520911-7-clg@redhat.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/functional/meson.build                  |  4 ++--
 ...m_aspeed.py => test_arm_aspeed_rainier.py} | 22 +++++--------------
 2 files changed, 7 insertions(+), 19 deletions(-)
 rename tests/functional/{test_arm_aspeed.py => test_arm_aspeed_rainier.py} (71%)
 mode change 100755 => 100644

diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index b5fd3bededde..96f2291a39bd 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -22,7 +22,7 @@ test_timeouts = {
   'arm_aspeed_romulus' : 120,
   'arm_aspeed_ast2500' : 480,
   'arm_aspeed_ast2600' : 720,
-  'arm_aspeed' : 600,
+  'arm_aspeed_rainier' : 240,
   'arm_bpim2u' : 500,
   'arm_collie' : 180,
   'arm_orangepi' : 540,
@@ -69,12 +69,12 @@ tests_alpha_system_thorough = [
 ]
 
 tests_arm_system_thorough = [
-  'arm_aspeed',
   'arm_aspeed_ast1030',
   'arm_aspeed_palmetto',
   'arm_aspeed_romulus',
   'arm_aspeed_ast2500',
   'arm_aspeed_ast2600',
+  'arm_aspeed_rainier',
   'arm_bpim2u',
   'arm_canona1100',
   'arm_collie',
diff --git a/tests/functional/test_arm_aspeed.py b/tests/functional/test_arm_aspeed_rainier.py
old mode 100755
new mode 100644
similarity index 71%
rename from tests/functional/test_arm_aspeed.py
rename to tests/functional/test_arm_aspeed_rainier.py
index 8cf86795af3c..a60274926d6f
--- a/tests/functional/test_arm_aspeed.py
+++ b/tests/functional/test_arm_aspeed_rainier.py
@@ -1,25 +1,13 @@
 #!/usr/bin/env python3
 #
-# Functional test that boots the ASPEED SoCs with firmware
-#
-# Copyright (C) 2022 ASPEED Technology Inc
+# Functional test that boots the ASPEED machines
 #
 # SPDX-License-Identifier: GPL-2.0-or-later
 
-import os
-import time
-import subprocess
-import tempfile
-
-from qemu_test import LinuxKernelTest, Asset
-from qemu_test import exec_command_and_wait_for_pattern
-from qemu_test import interrupt_interactive_console_until_pattern
-from qemu_test import has_cmd
-from qemu_test.utils import archive_extract
-from zipfile import ZipFile
-from unittest import skipUnless
+from qemu_test import Asset
+from aspeed import AspeedTest
 
-class AST2x00MachineMMC(LinuxKernelTest):
+class RainierMachine(AspeedTest):
 
     ASSET_RAINIER_EMMC = Asset(
         ('https://fileserver.linaro.org/s/B6pJTwWEkzSDi36/download/'
@@ -49,4 +37,4 @@ def test_arm_aspeed_emmc_boot(self):
         self.wait_for_console_pattern('IBM eBMC (OpenBMC for IBM Enterprise')
 
 if __name__ == '__main__':
-    LinuxKernelTest.main()
+    AspeedTest.main()
-- 
2.47.1

