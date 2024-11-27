Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp640905njb;
        Wed, 27 Nov 2024 01:16:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUhRwIZBYApI1pTYUVZDeZ7uFS3JDM2CGjv/SOVgFIMunT1nMtIj1wgqbrJKFap7pbUcrqsym7A0e1BjQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHUStNAT3dwu5HteA5W0m2F+gO5l730do2Q3b0MjPKMofKiMdBe0dEhXgNtcNWMh72NGmtW
X-Received: by 2002:a05:6214:2405:b0:6d4:2806:1764 with SMTP id 6a1803df08f44-6d864e02367mr32470176d6.43.1732698968780;
        Wed, 27 Nov 2024 01:16:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732698968; cv=none;
        d=google.com; s=arc-20240605;
        b=SQ5ADCg9zT9f2yKYCM4nbkeMJFwVmjIzraDeN1hqrXcxWedBWaed4rRE1i8tenGB9V
         PA7JSJ0matwNFq6EZZDnh5PnDkmXCcOaB10fo36aj0DCcdr1jQPtTbIzJbAn+FTfCI9R
         QRfdTk0kBg+utvi1QDKzg5Eh3b1jC/6G3kKWPepuYFsvTUytPmCCw9QMV1CkDtIK5Kgp
         1uLOiTYKMrddw79yQFW/VcCsZVbTq6TrU6y4zyHZDDHJaaR2YxThnXXh0Dx7RBpBvkcs
         1zSXsQ6fD0b+ZCCI3pPRd+ad1AodEiKWCZl+1TRyZApF7XraWFo1iC37ADlQi1Xau1MX
         r2fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=hmiHyedNBjqXGrc3BSmzUGaF8i7Bp7GqG6n0TuLl+H0=;
        fh=YxB9KrK/apG3GPSS9N0BU3U6VgGYnn8GG91b26MqXlY=;
        b=cJamSd/wOi+EdnkAOwqW1fIp2RnrtwzjMUiH8nNSYQKH4xNwErkTnhD7LD35FkHXhh
         IZ29z6lOv8gaA/5Lrkahc61iVeokGcGkOy+SEKElvBBx/6EUzUeRfS+dB2AmJeENOhly
         rhgLRJn9xUam5tWIpMqziDbGwvePZagUqE3swG9SerZ2qpu79nlPm+SvZJmKjcuLiv/l
         Wl93gMHwu7Le7Xeif4s6bDEMsgDainr6/91Ge9yV6b/dYZR1zeuGUP2AaHKDkdq7fUTK
         iv2DM7zGiNZUIkTDoWtW7ZrBTRuCE6dRqobqxu1E8TlDRRSt9otfTT2FEjTJu21jOYy+
         IKKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d451b1c896si136423716d6.272.2024.11.27.01.16.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2024 01:16:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tGE9P-00027A-VP; Wed, 27 Nov 2024 04:15:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tGE9O-00026x-BS; Wed, 27 Nov 2024 04:15:58 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tGE9M-0004K2-Sk; Wed, 27 Nov 2024 04:15:58 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 27 Nov
 2024 17:15:43 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 27 Nov 2024 17:15:43 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v3 01/10] test/qtest/aspeed_smc-test: Move testcases to
 test_palmetto_bmc function
Date: Wed, 27 Nov 2024 17:15:34 +0800
Message-ID: <20241127091543.1243114-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241127091543.1243114-1-jamin_lin@aspeedtech.com>
References: <20241127091543.1243114-1-jamin_lin@aspeedtech.com>
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
X-TUID: imtnv0T5uEIr

So far, the test cases are used for testing SMC model with AST2400 BMC.
However, AST2400 is end off live and ASPEED is no longer support this SOC.
To test SMC model for AST2500, AST2600 and AST1030, move the test cases
from main to test_palmetto_bmc function.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 tests/qtest/aspeed_smc-test.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
index 4673371d95..ec1fa6ec15 100644
--- a/tests/qtest/aspeed_smc-test.c
+++ b/tests/qtest/aspeed_smc-test.c
@@ -610,14 +610,12 @@ static void test_write_block_protect_bottom_bit(void)
     flash_reset();
 }
 
-int main(int argc, char **argv)
+static int test_palmetto_bmc(void)
 {
     g_autofree char *tmp_path = NULL;
     int ret;
     int fd;
 
-    g_test_init(&argc, &argv, NULL);
-
     fd = g_file_open_tmp("qtest.m25p80.XXXXXX", &tmp_path, NULL);
     g_assert(fd >= 0);
     ret = ftruncate(fd, FLASH_SIZE);
@@ -644,8 +642,18 @@ int main(int argc, char **argv)
 
     flash_reset();
     ret = g_test_run();
-
     qtest_quit(global_qtest);
     unlink(tmp_path);
+
+    return ret;
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+
+    g_test_init(&argc, &argv, NULL);
+    ret = test_palmetto_bmc();
+
     return ret;
 }
-- 
2.34.1

