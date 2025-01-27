Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2319334njk;
        Mon, 27 Jan 2025 01:44:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXlqgH2Qa39CrcySJS+NV15FV6W9RAs5hPb/7SWqKfuyhmCCVpihV6mAnJNyQoXqq0OohE7NOHp8Rj8Zg==@linaro.org
X-Google-Smtp-Source: AGHT+IHDz5S43g3IHx9f3h0APcd+cemZ/tZw/guGkPPiADU8Zc8XXZLJomJKM6TahEQ+Z4nbnsm2
X-Received: by 2002:a05:620a:2687:b0:7b6:d70a:86df with SMTP id af79cd13be357-7be6320aee0mr6715843585a.27.1737971080575;
        Mon, 27 Jan 2025 01:44:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737971080; cv=none;
        d=google.com; s=arc-20240605;
        b=AnUrkvx4W/rBO36f6tYDWkj5IoicNd13ng3q+iSOqSPgbDY7Llcl+O37vZhnjIpa3o
         YKGLciHOpFz2iy1dmAodKKxQkZUa6o8JGK5bBR+r12US72+RHxGzx/XKVce4BrFMkeI0
         laTPRcHj+F2yFzgOZYeLOIAhc6UjlWqhN8UOU5eolUxIBGoMAy39OUdMfd3+gmOzUJX2
         QcgJwv5/TyRUT3ZroNUN4vGqgktCGclAUIZ/6FFHmXM8x1/EKtgHDGptIdwjQ/A1gyAh
         dtfo5XpGOue03gwfphiK44MpwadRSPkeUtbiKzpunCiFYz97LZwYtNPfmPOgE8YZry/O
         tTIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XcXoYxISKL/DfU6VNVNHW9Bx69Q6dGEESQJlXcWOLIE=;
        fh=HCNC18ZglV+EO+6QG3xAPXXwS303incvJlEkcuytr8w=;
        b=MQOcG8A7o49KH+Q8lzqto0/Q6EPERQohrlM9r9U2DsWSeQbqTekJjthdNZ9XafFQq+
         6KGZVANK8MUvJ86aKrkQzFS0qaNJWgPbFVZGX6XDcvLb5AC05bUPnmhWCFJx67LniPU1
         3lWRPtFirSdhNIGDi61EV0yblKtKCOqgl34VYLDHVriSTkHvXIYrPjdzsb1xhjcw4mQQ
         hVbenOs8btrGsGqG/waYNQl0oM5n9qLS5wp6D9iwdND8XT6jhajYzGmvjYISPSGibTsa
         b87Wl0BA2QqWLZaTplGd8xXflFVeDZW4AdvTNzkGGkHGZy0+uAeRjW5Mvl2h0S2RWUHn
         s7oQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D5OBDrtw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9af2ac68si1035171585a.592.2025.01.27.01.44.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 01:44:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D5OBDrtw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcLep-0006ed-6n; Mon, 27 Jan 2025 04:43:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tcLeH-0006LH-4N
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 04:43:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tcLeD-0005Rk-Qb
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 04:43:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737970991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XcXoYxISKL/DfU6VNVNHW9Bx69Q6dGEESQJlXcWOLIE=;
 b=D5OBDrtwSDEvvlvNmDKFzqiViG7USRZEymM2f9KeJRV0eKvGdJYzaP6gioIPi+/JQyRnbX
 FvVL8vdJqq8GGuwI54ZEDRBU/mooyUyuWO3zIMy/rABYy2MQ4HDV/Z9p/Lqra1jMluDD0n
 9RiP4ToQfpEvHS3f+Hy61AQtLwipG2w=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-66-UdmNq1B_Oy-OsGoqo13Fyg-1; Mon,
 27 Jan 2025 04:43:06 -0500
X-MC-Unique: UdmNq1B_Oy-OsGoqo13Fyg-1
X-Mimecast-MFC-AGG-ID: UdmNq1B_Oy-OsGoqo13Fyg
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 18D1B195608D; Mon, 27 Jan 2025 09:43:05 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.63])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id AA8D018008C0; Mon, 27 Jan 2025 09:43:03 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PULL 07/12] test/functional: Update the Aspeed aarch64 test
Date: Mon, 27 Jan 2025 10:42:34 +0100
Message-ID: <20250127094239.636526-8-clg@redhat.com>
In-Reply-To: <20250127094239.636526-1-clg@redhat.com>
References: <20250127094239.636526-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Kv3/59yPewuK

Bumped SDK version to v09.03. v09.04 is available but not yet
supported in QEMU.

Reviewed-by: Jamin Lin <jamin_lin@aspeedtech.com>
Link: https://lore.kernel.org/qemu-devel/20250122070909.1138598-8-clg@redhat.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/functional/test_aarch64_aspeed.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/test_aarch64_aspeed.py
index 141d86385936..9595498ace79 100755
--- a/tests/functional/test_aarch64_aspeed.py
+++ b/tests/functional/test_aarch64_aspeed.py
@@ -27,14 +27,14 @@ def do_test_aarch64_aspeed_sdk_start(self, image):
         wait_for_console_pattern(self, '## Loading kernel from FIT Image')
         wait_for_console_pattern(self, 'Starting kernel ...')
 
-    ASSET_SDK_V902_AST2700 = Asset(
-            'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.02/ast2700-default-obmc.tar.gz',
-            'ac969c2602f4e6bdb69562ff466b89ae3fe1d86e1f6797bb7969d787f82116a7')
+    ASSET_SDK_V903_AST2700 = Asset(
+            'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.03/ast2700-default-obmc.tar.gz',
+            '91225f50d255e2905ba8d8e0c80b71b9d157c3609770c7a740cd786370d85a77')
 
-    def test_aarch64_ast2700_evb_sdk_v09_02(self):
+    def test_aarch64_ast2700_evb_sdk_v09_03(self):
         self.set_machine('ast2700-evb')
 
-        self.archive_extract(self.ASSET_SDK_V902_AST2700)
+        self.archive_extract(self.ASSET_SDK_V903_AST2700)
 
         num_cpu = 4
         uboot_size = os.path.getsize(self.scratch_file('ast2700-default',
-- 
2.48.1

