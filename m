Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1388132njm;
        Thu, 6 Mar 2025 02:43:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUPEn3UwDV9hY6AbUOmFRZ6JLWSjAnZUsJ0WM5ejNkycOna9ZRNrMATAX3KdtS7XXXqK8E1+9DaRZtiXw==@linaro.org
X-Google-Smtp-Source: AGHT+IFpqSy2himxeFT1btmBvFjKcMYFawaE8TVWrMnC4TlKuAP91ME03fxNP8M+24LGcmAdWg1X
X-Received: by 2002:a05:6214:1c4e:b0:6e8:955b:141e with SMTP id 6a1803df08f44-6e8e6cf0a63mr83582506d6.21.1741257825879;
        Thu, 06 Mar 2025 02:43:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741257825; cv=none;
        d=google.com; s=arc-20240605;
        b=IvaOfNgW/0GyU/zQ2ZFgeEkcBxv97IBzi7OtewtIsO/5QHiaFISzsetsLJG218fZat
         0sNiN9mjVWu0hiLTgrxy4TgybkQDMHZv0DygiiP27Bvosc9L0ItW8zM/PGPG8Qb/CxXm
         RbA+dGfF7HfbLw0sOQIvWqD08NQBMW64CVfOAv1vJeo6Blx2XXzO2cwaniIvLYJs5w0h
         PI8M6xR5u0eqEySAD8luauEiSHCf1mtmjTUWzi4OV3fwjwBskK/mQcA6I+RZcSo2FrLe
         x4PcWsVOxS4zJFznfANxAXZp7y+iDKAaAnWvMkjyyYqC780rHdYQxOKbMFVEfYRo60iQ
         aAGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Mjej50Gc6zr0SD2uUWfVzsCHvPUJnUHt8ds9wlvny40=;
        fh=3cFqTtzBuOtpuAUHgGIZLk2EDwH0HGw77jNYFWHrQKI=;
        b=PzR6OoqbpwEmD8j4q8tpPc22YKFxrtuu01XjTWIXgQYuz85zMxYJ5uwwrgS7dfpZ8U
         o5jSgyn/vnoBOv0paXMQ/FGo9t1BuFmLinQU9tj8n92sfGC15rUz6jDXF3iwmM36LENr
         tsAEis5QcDWqB9J+qTY2SnNOW3VUU5zToZgsLGWgOckRGQQYGx6uRlRrOOAKGVPCUX+m
         axitPmgCLPJ7Clw+xqygznWLRV+1/iTuablwv3zAHJXg+nnqdX2YubCkLfKYR57nN9Au
         9Kl06fkY3u0u8v1BZ6Ag5LYkzWGkn2rBOXstLsNwrwHhGduHiVBVIn97QGmg9n4WCDjW
         RE1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f7090a36si9160006d6.108.2025.03.06.02.43.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 02:43:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tq8gJ-0002A0-Th; Thu, 06 Mar 2025 05:42:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8fQ-0000aY-8j; Thu, 06 Mar 2025 05:41:28 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8fO-0000om-DH; Thu, 06 Mar 2025 05:41:28 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 6 Mar
 2025 18:38:56 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 6 Mar 2025 18:38:56 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v5 28/29] tests/functional/aspeed: Add test case for AST2700 A1
Date: Thu, 6 Mar 2025 18:38:36 +0800
Message-ID: <20250306103846.429221-29-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
References: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: I1avCPy5VatQ

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 tests/functional/test_aarch64_aspeed.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/test_aarch64_aspeed.py
index 8df6a97a28..c25c966278 100755
--- a/tests/functional/test_aarch64_aspeed.py
+++ b/tests/functional/test_aarch64_aspeed.py
@@ -31,6 +31,10 @@ def do_test_aarch64_aspeed_sdk_start(self, image):
             'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.05/ast2700-a0-default-obmc.tar.gz',
             'cfbbd1cce72f2a3b73b9080c41eecdadebb7077fba4f7806d72ac99f3e84b74a')
 
+    ASSET_SDK_V905_AST2700A1 = Asset(
+            'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.05/ast2700-default-obmc.tar.gz',
+            'c1f4496aec06743c812a6e9a1a18d032f34d62f3ddb6956e924fef62aa2046a5')
+
     def start_ast2700_test(self, name):
         num_cpu = 4
         uboot_size = os.path.getsize(self.scratch_file(name,
@@ -95,6 +99,12 @@ def test_aarch64_ast2700_evb_sdk_v09_05(self):
         self.archive_extract(self.ASSET_SDK_V905_AST2700)
         self.start_ast2700_test('ast2700-a0-default')
 
+    def test_aarch64_ast2700a1_evb_sdk_v09_05(self):
+        self.set_machine('ast2700a1-evb')
+
+        self.archive_extract(self.ASSET_SDK_V905_AST2700A1)
+        self.start_ast2700_test('ast2700-default')
+
 
 if __name__ == '__main__':
     QemuSystemTest.main()
-- 
2.43.0

