Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp323724njb;
        Mon, 12 May 2025 23:34:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCULPqJQ0LbqR7qIWk+2kaJ4rHZGPieLv2WNJi7Ewc6xnwzHUfu1TvbHeVrfyD4hsywyuQ3AtL+6TWzVsg==@linaro.org
X-Google-Smtp-Source: AGHT+IHXj31TSTLUa48WUeETJWE7lCddzeXVMF+qlg4xYtRiLuN02VfG//jmxju0ZhbWyHifXg9S
X-Received: by 2002:a05:6214:2405:b0:6f4:c824:9d4a with SMTP id 6a1803df08f44-6f6e47c339cmr240908136d6.13.1747118058356;
        Mon, 12 May 2025 23:34:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747118058; cv=none;
        d=google.com; s=arc-20240605;
        b=N1ngfx6fn4ga5a5K/eMk7VZoUcErQsCK/pQFiaZOUk+TfuonFXA7Ba+2ex+bOEtsbX
         C/9cV1zdzZf1cDO+GNooFHZgoP3iNmM8qyK+N8svyMj3qRz9aozs6N+B1oJsxkiPTIfE
         hVnMizCRMee8Z3bxf2OFtPo28WD5rPxxMdnAbQzFXNI5xV//n8dnLJ7PPxf5hR47ATFw
         i6jz7ALI8/GzGbkw8vMd4Elp/rHAksXI2DvD0TkkbKbm3XTSjW2jZD2WJhvcnUMYWRWS
         lffphwPwiNFmoVMcCzE1QB3BfUhDAbYsBz3Xd23dVmX2Bta7IxmFjUfJd1Uxr2YSYsWQ
         2RVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Aelj0p6JptkynqyMwOwGO+XhvPWCGExYZNRnQ1xws3s=;
        fh=HOpiatFOnx6Qe0fRCbmTPNKe4Ajfqa5KxAPfGCatY1Y=;
        b=UrEDleCfc0ISCgYjwz/Z8auellf2Su7BwRQEjfJ4d9ZMcDjWdztfQGpkrf2stzkgza
         vljqx0SyKj5zvWG18UTOQpXkX+6k1kdl56aX0A1GFkZswV9uoxGfb2grrS5idWLQL06V
         BCGWdvlR2DdUMVpgk2GqK6K2f/DTVAqGZqs8fps4cLy9uFNTC2S9TN9xqn9ycBezB9rG
         U+aiLxBaTYAxYLsPgS5wnFTFRCghUkWsQrS1PXGNNheM1n3eSSa6+Ib8HitWtyH7/fxK
         wjXAYWyi7+RirsDGovC304qhYA5s0D7QUnqxBipa363ftYf6+a6zGs/Yc0LMCmlpKE7u
         frHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e39f6f56si105472666d6.113.2025.05.12.23.34.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 May 2025 23:34:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEjC7-0006FH-Gi; Tue, 13 May 2025 02:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEjBF-0005bA-EC; Tue, 13 May 2025 02:32:02 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEjBB-00029w-O1; Tue, 13 May 2025 02:31:55 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 13 May
 2025 14:29:09 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 13 May 2025 14:29:09 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v2 19/25] test/qtest/hace: Add SHA-384 tests for AST2600
Date: Tue, 13 May 2025 14:28:49 +0800
Message-ID: <20250513062901.2256865-20-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250513062901.2256865-1-jamin_lin@aspeedtech.com>
References: <20250513062901.2256865-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: 2a0LFCkek+aO

Introduced "test_sha384_ast2600" to validate SHA-384 hashing.
Added "test_sha384_sg_ast2600" for scatter-gather SHA-384 verification.
Implemented "test_sha384_accum_ast2600" to test SHA-384 accumulation.
Registered new test cases in "main" to ensure execution.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 tests/qtest/aspeed_hace-test.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/qtest/aspeed_hace-test.c b/tests/qtest/aspeed_hace-test.c
index 42a306af2a..ab0c98330e 100644
--- a/tests/qtest/aspeed_hace-test.c
+++ b/tests/qtest/aspeed_hace-test.c
@@ -44,6 +44,16 @@ static void test_sha256_sg_ast2600(void)
     aspeed_test_sha256_sg("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
 }
 
+static void test_sha384_ast2600(void)
+{
+    aspeed_test_sha384("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
+}
+
+static void test_sha384_sg_ast2600(void)
+{
+    aspeed_test_sha384_sg("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
+}
+
 static void test_sha512_ast2600(void)
 {
     aspeed_test_sha512("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
@@ -59,6 +69,11 @@ static void test_sha256_accum_ast2600(void)
     aspeed_test_sha256_accum("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
 }
 
+static void test_sha384_accum_ast2600(void)
+{
+    aspeed_test_sha384_accum("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
+}
+
 static void test_sha512_accum_ast2600(void)
 {
     aspeed_test_sha512_accum("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
@@ -117,13 +132,16 @@ int main(int argc, char **argv)
 
     qtest_add_func("ast2600/hace/addresses", test_addresses_ast2600);
     qtest_add_func("ast2600/hace/sha512", test_sha512_ast2600);
+    qtest_add_func("ast2600/hace/sha384", test_sha384_ast2600);
     qtest_add_func("ast2600/hace/sha256", test_sha256_ast2600);
     qtest_add_func("ast2600/hace/md5", test_md5_ast2600);
 
     qtest_add_func("ast2600/hace/sha512_sg", test_sha512_sg_ast2600);
+    qtest_add_func("ast2600/hace/sha384_sg", test_sha384_sg_ast2600);
     qtest_add_func("ast2600/hace/sha256_sg", test_sha256_sg_ast2600);
 
     qtest_add_func("ast2600/hace/sha512_accum", test_sha512_accum_ast2600);
+    qtest_add_func("ast2600/hace/sha384_accum", test_sha384_accum_ast2600);
     qtest_add_func("ast2600/hace/sha256_accum", test_sha256_accum_ast2600);
 
     qtest_add_func("ast2500/hace/addresses", test_addresses_ast2500);
-- 
2.43.0

