Received: by 2002:a05:7022:6a3:b0:92:a90b:6588 with SMTP id y35csp3709183dly;
        Tue, 28 Jan 2025 23:20:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVTabPxC4/RXNA8rzhzcw7vQHInXkbcCK3kEEzJa6TT7KwHvl/jwwXpiS9w/Xw8m/HVIgmKcizh8tlhWA==@linaro.org
X-Google-Smtp-Source: AGHT+IG1/6nGtkYfxJk1b9uFuzJc5T3RAsSvZi2MLSbwFW03bxtJjYsbcqbf83yHnQ2+dunzZAn/
X-Received: by 2002:a05:620a:371b:b0:7b6:d237:abe5 with SMTP id af79cd13be357-7bffcce5880mr327884185a.20.1738135219142;
        Tue, 28 Jan 2025 23:20:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738135219; cv=none;
        d=google.com; s=arc-20240605;
        b=h1vmOhP5MxUPw1pIue3jj37h4wLrw2r01szrtojzj6iJbpYVZfrWOXwzU+xzKiSJaR
         zbrOZrt2QOKVTMdc9f01Js9hR9B6vBaid8Yu20c8CpsEigDjscnpNJS5o3JvGpMbbQo2
         ry+3WkuNytVnDdQ+xOv3N+cLYcDr0/VUZmfaNg7mYdnm7pa/eumTmwZGjyIVW4+9ayFJ
         VunaXw7yZcxnRDsQtyldMe/UDH8NHm/InZdP1tqOgYlTxVKmVo+elsjtdx7lPyN6G1pd
         KzhAV+xBOued7K34l88AIUvrZcx50fj6b03WJXDjsXwS8SnZt1btn0Qs2EgrsJYTANzt
         fCpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eze6jaRUaOErODMTcqq4FVwyGb8xZ9G8Z5QYQ9u0Tl4=;
        fh=XEUWnmNUzgDVltOtMw+UmOaRtoK2L8C0I2oKK3mImI4=;
        b=WZ3DmDdoCT4x1wst71Ni7FgzvAVw5L4f8NLU3hypG0hbk1XfVRnNFY0Tj/1jQAayxq
         XxPXSK44rfEm5IcHB1hF06mft1IrGYdfNFsEP5SdL7WQskAa5QjbRHmpEfb0OTPl3RjA
         kZynVkqjiSL7LleWyLJK9/dXWuJa3bV1dH9Pn6zxpVxrf44ec5nQM5jUXuKyNzBvfn8G
         fffKn+P1fYsqiQq2Qf2AqKNScP6pRaJZ9YK1HugnFX2XrD15LOoaV0oOiK2njRveyXYG
         F5gmEYJj06JsNJaWp9a1p2xEjSq7a49G1SA66kmmU+uMODA4CTOe7gkchK2MvwbFPmLv
         iu+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eAofjihw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e6686c396si158166001cf.62.2025.01.28.23.20.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2025 23:20:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eAofjihw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1td2Lv-0002AS-0t; Wed, 29 Jan 2025 02:19:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1td2Ll-000208-At
 for qemu-arm@nongnu.org; Wed, 29 Jan 2025 02:19:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1td2Lh-0003fi-Jt
 for qemu-arm@nongnu.org; Wed, 29 Jan 2025 02:19:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738135137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eze6jaRUaOErODMTcqq4FVwyGb8xZ9G8Z5QYQ9u0Tl4=;
 b=eAofjihwlHQ7YXVh4mWgtP/YmpvK0lZDIMEkjCaJzf7ai159337LFgk40d9/N85ZjKYm99
 iPhdxTToPzDraOjT+oWd/a+XI2KANjMVTbwZvTQLqxAhfFrsMmm/kURrphL7sSBI/1uR6r
 1I0WAJzUy4ztVjk59KdaLp0T5LyjwfI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-303-KTMcZY9CPwOM8zOBKVYovA-1; Wed,
 29 Jan 2025 02:18:52 -0500
X-MC-Unique: KTMcZY9CPwOM8zOBKVYovA-1
X-Mimecast-MFC-AGG-ID: KTMcZY9CPwOM8zOBKVYovA
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 50CD21800361; Wed, 29 Jan 2025 07:18:50 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.105])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 85BFA1956060; Wed, 29 Jan 2025 07:18:47 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH 4/5] tests/functional: Introduce a witherspoon machine test
Date: Wed, 29 Jan 2025 08:18:19 +0100
Message-ID: <20250129071820.1258133-5-clg@redhat.com>
In-Reply-To: <20250129071820.1258133-1-clg@redhat.com>
References: <20250129071820.1258133-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: JXgWYwr5Mwz3

Use do_test_arm_aspeed_openbmc() routine to run the latest OpenBMC
firmware build of the witherspoon BMC.

Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/functional/meson.build                  |  2 ++
 .../functional/test_arm_aspeed_witherspoon.py | 24 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100755 tests/functional/test_arm_aspeed_witherspoon.py

diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index b7719ab85f90..5c782ceb0a98 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -22,6 +22,7 @@ test_timeouts = {
   'acpi_bits' : 420,
   'arm_aspeed_palmetto' : 120,
   'arm_aspeed_romulus' : 120,
+  'arm_aspeed_witherspoon' : 120,
   'arm_aspeed_ast2500' : 480,
   'arm_aspeed_ast2600' : 720,
   'arm_aspeed_rainier' : 240,
@@ -82,6 +83,7 @@ tests_arm_system_thorough = [
   'arm_aspeed_ast1030',
   'arm_aspeed_palmetto',
   'arm_aspeed_romulus',
+  'arm_aspeed_witherspoon',
   'arm_aspeed_ast2500',
   'arm_aspeed_ast2600',
   'arm_aspeed_rainier',
diff --git a/tests/functional/test_arm_aspeed_witherspoon.py b/tests/functional/test_arm_aspeed_witherspoon.py
new file mode 100755
index 000000000000..12714323733a
--- /dev/null
+++ b/tests/functional/test_arm_aspeed_witherspoon.py
@@ -0,0 +1,24 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots the ASPEED machines
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+from qemu_test import Asset
+from aspeed import AspeedTest
+
+class WitherspoonMachine(AspeedTest):
+
+    ASSET_WITHERSPOON_FLASH = Asset(
+        'https://github.com/legoater/qemu-aspeed-boot/raw/master/images/witherspoon-bmc/openbmc-20240618035022/obmc-phosphor-image-witherspoon-20240618035022.ubi.mtd',
+        '937d9ed449ea6c6cbed983519088a42d0cafe276bcfe4fce07772ca6673f9213');
+
+    def test_arm_ast2500_witherspoon_openbmc(self):
+        image_path = self.ASSET_WITHERSPOON_FLASH.fetch()
+
+        self.do_test_arm_aspeed_openbmc('witherspoon-bmc', image=image_path,
+                                        uboot='2016.07', cpu_id='0x0',
+                                        soc='AST2500 rev A1');
+
+if __name__ == '__main__':
+    AspeedTest.main()
-- 
2.48.1

