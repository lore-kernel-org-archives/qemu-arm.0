Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp606821njc;
        Sun, 9 Mar 2025 06:53:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWtZmShiA2YiUJ37FyRbHW2e+G2//h/D1J4dKc4OewREZpS802dnL3+0+HJvlAEUBA4WMyOwTwlnftbqQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEYZG8D3oWHLL+jPz0OEvV9AV1Y91tA9+igDZ6SIUGzch68L9abcSkC0a6skd8eSyiAu+O5
X-Received: by 2002:a05:620a:2609:b0:7c0:9df3:a0d7 with SMTP id af79cd13be357-7c4e61763aamr1525249685a.41.1741528437717;
        Sun, 09 Mar 2025 06:53:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741528437; cv=none;
        d=google.com; s=arc-20240605;
        b=LZEGSCK83Yx0qCRjx9SkARgmCq05L4fjz++nzbnBtQx16o4S1CBjdgRJSVh9TxmlQa
         +58ywNY0nOFLUTZo09LLRhb9HWy0Z4gHMEWDLsOXdhMS5i6vWgHPBA1Bmn8a534eUB5t
         96lUCkTColAlsBP3kr+4ux5j4p5Bw/gl5DB11dAdEVw8sfJOZJK4ObYEZt7sIrxpoebc
         Fr1FHDl45A0qRVrZisRK6BswHOQyrBaAPgtL0fvuXXIrPN2z/czyKI8+FLavtUrjCHcB
         yw+udSbriSP4F1zjGAuGTBTwmP7Waktm77SqqZRv/h+LtrhVzwAgDQ2M8XswVIIBXwC+
         psAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IBZQzoAQ0WN/j8BXz2TQoyoDicLbY6P6P7lAcQaSDcs=;
        fh=gfaIlKUGnt8rgfa7AZM9HsBIOLTWjNPfe1iKGHAlZZQ=;
        b=JioZoL3I30jHyglhB+2Di9mKoEyzX5lOSPTikBXZUDSN6iGJQUy3BHQLhPf+rxFPBV
         i+Jlgl+TR3m9N/o9WqYNgoLl3V8uhLHSBN/gMqxUMzz4DGS86NKKwRYrbeoiMXnqfLpL
         U7WoTDLQybIQ7MkIcgpq5gUqeAl894+MzlP/wkAYlBr31C7yqd2zmVLRKaMTzHZ7E3iT
         jf3dWm7mk03uzfhtR0R02A96L8/MAtzbtFqNBJ59lDf9IJGZ7lWixknMrhONlPY8pNu/
         RZ6eKpjH+QyZp64F3djfWde7wtOqjFhdNpUT261kG7OPAHljySaIRwgj6RaBHaJxiqgr
         /l1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PJE5BQ+j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e55117d7si732073585a.370.2025.03.09.06.53.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 06:53:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PJE5BQ+j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trH4b-0007Zp-1a; Sun, 09 Mar 2025 09:52:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH4O-0007Vt-6v
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 09:51:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH4M-00026w-G2
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 09:51:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741528313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IBZQzoAQ0WN/j8BXz2TQoyoDicLbY6P6P7lAcQaSDcs=;
 b=PJE5BQ+jGDjl2PmzEUyzW6mDDUpRZA6x73W4Icv//oMNl5rZevtMhJ9rvNcRo296bG7Ba0
 9xcRSr/Yev4vjGzc2HeXP4DdJHv0lcz4UhvcvkpyMAX0Tdg4fO850BNCuocafGKFYO/tFk
 j1VNQlReaAtKWRnOIu3jPcbRYea7GNE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-166-5Op6ey6wNKWDgXYmUxfINA-1; Sun,
 09 Mar 2025 09:51:50 -0400
X-MC-Unique: 5Op6ey6wNKWDgXYmUxfINA-1
X-Mimecast-MFC-AGG-ID: 5Op6ey6wNKWDgXYmUxfINA_1741528309
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9BBB3180035D; Sun,  9 Mar 2025 13:51:49 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.17])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 55D861956094; Sun,  9 Mar 2025 13:51:46 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Patrick Williams <patrick@stwcx.xyz>, Thomas Huth <thuth@redhat.com>
Subject: [PULL 05/46] tests/functional: Introduce a bletchley machine test
Date: Sun,  9 Mar 2025 14:50:49 +0100
Message-ID: <20250309135130.545764-6-clg@redhat.com>
In-Reply-To: <20250309135130.545764-1-clg@redhat.com>
References: <20250309135130.545764-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 8SwHd3RDWtZj

Use do_test_arm_aspeed_openbmc() to run the latest OpenBMC firmware
build of the bletchley BMC.

Reviewed-by: Patrick Williams <patrick@stwcx.xyz>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250129071820.1258133-6-clg@redhat.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/functional/meson.build                  |  2 ++
 tests/functional/test_arm_aspeed_bletchley.py | 25 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 tests/functional/test_arm_aspeed_bletchley.py

diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 0573f0091dc7..5dc66c03fcc3 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -25,6 +25,7 @@ test_timeouts = {
   'arm_aspeed_witherspoon' : 120,
   'arm_aspeed_ast2500' : 720,
   'arm_aspeed_ast2600' : 1200,
+  'arm_aspeed_bletchley' : 120,
   'arm_aspeed_rainier' : 480,
   'arm_bpim2u' : 500,
   'arm_collie' : 180,
@@ -108,6 +109,7 @@ tests_arm_system_thorough = [
   'arm_aspeed_witherspoon',
   'arm_aspeed_ast2500',
   'arm_aspeed_ast2600',
+  'arm_aspeed_bletchley',
   'arm_aspeed_rainier',
   'arm_bpim2u',
   'arm_canona1100',
diff --git a/tests/functional/test_arm_aspeed_bletchley.py b/tests/functional/test_arm_aspeed_bletchley.py
new file mode 100644
index 000000000000..0da856c5ed4d
--- /dev/null
+++ b/tests/functional/test_arm_aspeed_bletchley.py
@@ -0,0 +1,25 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots the ASPEED machines
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+from qemu_test import Asset
+from aspeed import AspeedTest
+
+
+class BletchleyMachine(AspeedTest):
+
+    ASSET_BLETCHLEY_FLASH = Asset(
+        'https://github.com/legoater/qemu-aspeed-boot/raw/master/images/bletchley-bmc/openbmc-20250128071329/obmc-phosphor-image-bletchley-20250128071329.static.mtd.xz',
+        'db21d04d47d7bb2a276f59d308614b4dfb70b9c7c81facbbca40a3977a2d8844');
+
+    def test_arm_ast2600_bletchley_openbmc(self):
+        image_path = self.uncompress(self.ASSET_BLETCHLEY_FLASH)
+
+        self.do_test_arm_aspeed_openbmc('bletchley-bmc', image=image_path,
+                                        uboot='2019.04', cpu_id='0xf00',
+                                        soc='AST2600 rev A3');
+
+if __name__ == '__main__':
+    AspeedTest.main()
-- 
2.48.1

