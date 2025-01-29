Received: by 2002:a05:7022:6a3:b0:92:a90b:6588 with SMTP id y35csp3708951dly;
        Tue, 28 Jan 2025 23:19:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWICMY1zzE3pXoiV7XSrgxCVF9Ex/Fug6GCC5LA3Xgkh+u5Atv8mmahIyuB0sxP9G29zi/gcEfNANDKnA==@linaro.org
X-Google-Smtp-Source: AGHT+IG2p3GCm2Qm1BkmUhfC/hL6+NXS4MrGcNLjVcH2jqZ/tcjjcU8ze0BX8syV9HWAPCPxpilH
X-Received: by 2002:a05:622a:246:b0:46e:37b7:950d with SMTP id d75a77b69052e-46fd0b94ec6mr36228131cf.50.1738135180596;
        Tue, 28 Jan 2025 23:19:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738135180; cv=none;
        d=google.com; s=arc-20240605;
        b=Ni1HnTNjkxAvd0R7/jnaFLSRvvx2Gl5YBEXVXOtdh7u2w7yaBPNKa6B71Q6jO/n46x
         aLFFRqVtKC9+7Gl3+l57eUS2mC8Lp5duqKySJMQ+dXf6sTmGVwe9p/LqWV8lzHsr7pMb
         YAPUfiOR2+auniznQqI7f6/ZeeQ6f/dg87TG8204UQESNqtamswgKaQ2lbLaAwp5DfBv
         lw9cUF0VTBo7VSrtFBVyUoJFY5EK4wa1dLV3IAxKlEtKDGdqwBYjtXVm8etHAkFVsNLS
         4pc56/ueZw86PGC6yzkugU52gH8/pXRXsoWPiDY7fOcufiZ6KAdiJz1npzaWMmonVyhi
         N9fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=O5DJ4lIDfkbpbHA9t9WG5honVKKqbvqkze83H0QNKH8=;
        fh=XEUWnmNUzgDVltOtMw+UmOaRtoK2L8C0I2oKK3mImI4=;
        b=L21NVy1ismkjr8lRFMJNlZWR2av8LF/2jf9Be/g/Xxqzp+pK9vZa/wejI0ythoajdy
         uf+cCHwBp3072cMCcRQNjfr51CeVzzFLZuQXtqS6WQmJV2lqYIRqMm+zzHKZUmjEqwn5
         RsN5gTkFyymvvAT3TV4bejUIr4PV55FQxdIUR3LZkqWCQSQok1iECk1BLZtPi+19UjpB
         g1Uqhz1A8+wkIBqjunxO6te5lhvjxfDDeCCnxuSUn9Sf1DSCpSo9VqF0aCusnEePInl0
         cX8Te3z90VbmEGg+uWXPZSiuJXyB1EB0jdwGpNYEurezAHWVqOEfpU2B/kdxcFkpYqq4
         j9jw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cw2NKLyM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e6686d677si153340661cf.97.2025.01.28.23.19.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2025 23:19:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cw2NKLyM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1td2Lt-00029n-Ot; Wed, 29 Jan 2025 02:19:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1td2Lj-0001yd-EK
 for qemu-devel@nongnu.org; Wed, 29 Jan 2025 02:19:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1td2Lf-0003f5-M6
 for qemu-devel@nongnu.org; Wed, 29 Jan 2025 02:18:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738135135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O5DJ4lIDfkbpbHA9t9WG5honVKKqbvqkze83H0QNKH8=;
 b=Cw2NKLyMhSxiWhCBS4ljE82qv+q4C8AHol64QMkn8M+42fHEAFKr6M2UGk+3eD7KTu5ejf
 cbmc3RMHcLFTv4GgWEceOlydpzqSqkAg+YQbHrTSpBvOBR5yXKEvm7HQHYl/xtv4Bdx5sY
 bhsyMBvdWfBCLsYWDe8516Qtwmzzz3E=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-551-WKYaQb30OC6iV_qgdbD6iw-1; Wed,
 29 Jan 2025 02:18:49 -0500
X-MC-Unique: WKYaQb30OC6iV_qgdbD6iw-1
X-Mimecast-MFC-AGG-ID: WKYaQb30OC6iV_qgdbD6iw
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 18F2E1956080; Wed, 29 Jan 2025 07:18:47 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.105])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 52A9B19560BC; Wed, 29 Jan 2025 07:18:44 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH 3/5] tests/functional: Update OpenBMC image of romulus machine
Date: Wed, 29 Jan 2025 08:18:18 +0100
Message-ID: <20250129071820.1258133-4-clg@redhat.com>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: L85NglupdpAu

Use the new do_test_arm_aspeed_openbmc() routine to run the latest
OpenBMC firmware build of the romulus BMC. Remove the older routine
which is now unused.

Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/functional/aspeed.py                  | 16 ----------------
 tests/functional/test_arm_aspeed_romulus.py | 12 ++++++------
 2 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/tests/functional/aspeed.py b/tests/functional/aspeed.py
index 51c821944842..4b829cfb09ae 100644
--- a/tests/functional/aspeed.py
+++ b/tests/functional/aspeed.py
@@ -7,22 +7,6 @@
 
 class AspeedTest(LinuxKernelTest):
 
-    def do_test_arm_aspeed(self, machine, image):
-        self.set_machine(machine)
-        self.vm.set_console()
-        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
-                         '-net', 'nic', '-snapshot')
-        self.vm.launch()
-
-        self.wait_for_console_pattern("U-Boot 2016.07")
-        self.wait_for_console_pattern("## Loading kernel from FIT Image at 20080000")
-        self.wait_for_console_pattern("Starting kernel ...")
-        self.wait_for_console_pattern("Booting Linux on physical CPU 0x0")
-        self.wait_for_console_pattern(
-                "aspeed-smc 1e620000.spi: read control register: 203b0641")
-        self.wait_for_console_pattern("ftgmac100 1e660000.ethernet eth0: irq ")
-        self.wait_for_console_pattern("systemd[1]: Set hostname to")
-
     def do_test_arm_aspeed_openbmc(self, machine, image, uboot='2019.04',
                                    cpu_id='0x0', soc='AST2500 rev A1'):
         hostname = machine.removesuffix('-bmc')
diff --git a/tests/functional/test_arm_aspeed_romulus.py b/tests/functional/test_arm_aspeed_romulus.py
index 747b616201ce..4b223905031b 100755
--- a/tests/functional/test_arm_aspeed_romulus.py
+++ b/tests/functional/test_arm_aspeed_romulus.py
@@ -10,15 +10,15 @@
 class RomulusMachine(AspeedTest):
 
     ASSET_ROMULUS_FLASH = Asset(
-        ('https://github.com/openbmc/openbmc/releases/download/2.9.0/'
-         'obmc-phosphor-image-romulus.static.mtd'),
-        '820341076803f1955bc31e647a512c79f9add4f5233d0697678bab4604c7bb25')
+        'https://github.com/legoater/qemu-aspeed-boot/raw/master/images/romulus-bmc/openbmc-20250128071340/obmc-phosphor-image-romulus-20250128071340.static.mtd',
+        '6d031376440c82ed9d087d25e9fa76aea75b42f80daa252ec402c0bc3cf6cf5b');
 
-    def test_arm_ast2500_romulus_openbmc_v2_9_0(self):
+    def test_arm_ast2500_romulus_openbmc(self):
         image_path = self.ASSET_ROMULUS_FLASH.fetch()
 
-        self.do_test_arm_aspeed('romulus-bmc', image_path)
-
+        self.do_test_arm_aspeed_openbmc('romulus-bmc', image=image_path,
+                                        uboot='2019.04', cpu_id='0x0',
+                                        soc='AST2500 rev A1');
 
 if __name__ == '__main__':
     AspeedTest.main()
-- 
2.48.1

