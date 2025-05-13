Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp323865njb;
        Mon, 12 May 2025 23:34:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVUoKh8lxrse4pxaLC+KyMOlRZxyHxxrmSuZVXi/VRAU4xCImR9RaUi/BdFNr27LBYEaugSPGOV2gM78Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHzpQSxG2dCoUEe+wKnjMpGtHjWnZQLJ5K7mgydTsP2sQ7Vju3AvPitPmpz2n7IZt0GCrjX
X-Received: by 2002:ad4:5b87:0:b0:6f5:113a:6901 with SMTP id 6a1803df08f44-6f6e47c4843mr259709866d6.21.1747118094531;
        Mon, 12 May 2025 23:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747118094; cv=none;
        d=google.com; s=arc-20240605;
        b=Kls3sCR/LpeKGKbuo8ghhm/dbtg2+21/DSHlqx9BX1joXFq2fPWzWsDbLkCMP3uQM8
         pdQHsT1jmj9pBCAs13/lgdcfXNNK/gyUATMq0jAar9IqT0iNKj0jiWpgWKyqC4Pu+bBe
         N1BQxnHoH63kMe562Fgx+trXq9VSmIN0dmodXTf2D9sDXcxABKxNUGjW+Tjz3+8vhzOd
         8C9TEkJ1aVRn0xYLHu44skCk2l9PgRdnvLn8RhP5eJymlT4UEb3MyrPI6KrVw0eJZ9f6
         6boi3hFQuK3A6O4o1ozoiPGzeU0yYFa4RyHl+UmmxLcdX3Wn/lwX84+6LRHgRMtkk4S5
         xszw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=uUzR4MdOftzQh+baIUt+R0ZUu8QTFmzKZL3jfxQ1IXY=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=eyDh4VBTrJWZlqmH1UtrNASHxe97TTcsQrm8T7pl0OacWvmpOx48HJm00efmOK9z5o
         krogRo215GFelkUNTHlVJurI3BgevXlt+dtlOSXNRhFPFM0EjocCsen9Qq0E41rvV9GY
         1P41W9OjD/F778y6lx73huvolGXMCsM0gYbfc3vbq3R743WJ+GAwgkgI4SG4RtQr0JlE
         yLcuUmQL4UvYATkbGtoD51pqO7qf1p8+tlZApvIhfkYwjDOyBGe5A/TlHymksvEvDmzu
         i/Fmutwt0Kz/vlyp7hDCbjE30NXAOXusmNteuEHxVj+TOEeX9VBcVz1z12o6LCe7eXDJ
         Ulgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e39f7f4esi107420246d6.156.2025.05.12.23.34.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 May 2025 23:34:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEjCX-0006pl-8P; Tue, 13 May 2025 02:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEjAy-0005XB-Ny; Tue, 13 May 2025 02:31:51 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEjAw-00026a-Sb; Tue, 13 May 2025 02:31:40 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 13 May
 2025 14:29:08 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 13 May 2025 14:29:08 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v2 16/25] test/qtest/hace: Specify explicit array sizes for
 test vectors and hash results
Date: Tue, 13 May 2025 14:28:46 +0800
Message-ID: <20250513062901.2256865-17-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250513062901.2256865-1-jamin_lin@aspeedtech.com>
References: <20250513062901.2256865-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
X-TUID: aPSfjVyUyJ0v

To enhance code readability and prevent potential buffer overflows or unintended
size assumptions, this commit updates all fixed-size array declarations to use
explicit array sizes.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 tests/qtest/aspeed-hace-utils.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/tests/qtest/aspeed-hace-utils.c b/tests/qtest/aspeed-hace-utils.c
index 8582847945..777fa5b986 100644
--- a/tests/qtest/aspeed-hace-utils.c
+++ b/tests/qtest/aspeed-hace-utils.c
@@ -19,9 +19,9 @@
  *  for hash in sha512sum sha256sum md5sum; do $hash /tmp/test; done
  *
  */
-static const uint8_t test_vector[] = {0x61, 0x62, 0x63};
+static const uint8_t test_vector[3] = {0x61, 0x62, 0x63};
 
-static const uint8_t test_result_sha512[] = {
+static const uint8_t test_result_sha512[64] = {
     0xdd, 0xaf, 0x35, 0xa1, 0x93, 0x61, 0x7a, 0xba, 0xcc, 0x41, 0x73, 0x49,
     0xae, 0x20, 0x41, 0x31, 0x12, 0xe6, 0xfa, 0x4e, 0x89, 0xa9, 0x7e, 0xa2,
     0x0a, 0x9e, 0xee, 0xe6, 0x4b, 0x55, 0xd3, 0x9a, 0x21, 0x92, 0x99, 0x2a,
@@ -29,12 +29,12 @@ static const uint8_t test_result_sha512[] = {
     0x45, 0x4d, 0x44, 0x23, 0x64, 0x3c, 0xe8, 0x0e, 0x2a, 0x9a, 0xc9, 0x4f,
     0xa5, 0x4c, 0xa4, 0x9f};
 
-static const uint8_t test_result_sha256[] = {
+static const uint8_t test_result_sha256[32] = {
     0xba, 0x78, 0x16, 0xbf, 0x8f, 0x01, 0xcf, 0xea, 0x41, 0x41, 0x40, 0xde,
     0x5d, 0xae, 0x22, 0x23, 0xb0, 0x03, 0x61, 0xa3, 0x96, 0x17, 0x7a, 0x9c,
     0xb4, 0x10, 0xff, 0x61, 0xf2, 0x00, 0x15, 0xad};
 
-static const uint8_t test_result_md5[] = {
+static const uint8_t test_result_md5[16] = {
     0x90, 0x01, 0x50, 0x98, 0x3c, 0xd2, 0x4f, 0xb0, 0xd6, 0x96, 0x3f, 0x7d,
     0x28, 0xe1, 0x7f, 0x72};
 
@@ -48,11 +48,11 @@ static const uint8_t test_result_md5[] = {
  *  for hash in sha512sum sha256sum; do $hash /tmp/test; done
  *
  */
-static const uint8_t test_vector_sg1[] = {0x61, 0x62, 0x63, 0x64, 0x65, 0x66};
-static const uint8_t test_vector_sg2[] = {0x67, 0x68, 0x69};
-static const uint8_t test_vector_sg3[] = {0x6a, 0x6b, 0x6c};
+static const uint8_t test_vector_sg1[6] = {0x61, 0x62, 0x63, 0x64, 0x65, 0x66};
+static const uint8_t test_vector_sg2[3] = {0x67, 0x68, 0x69};
+static const uint8_t test_vector_sg3[3] = {0x6a, 0x6b, 0x6c};
 
-static const uint8_t test_result_sg_sha512[] = {
+static const uint8_t test_result_sg_sha512[64] = {
     0x17, 0x80, 0x7c, 0x72, 0x8e, 0xe3, 0xba, 0x35, 0xe7, 0xcf, 0x7a, 0xf8,
     0x23, 0x11, 0x6d, 0x26, 0xe4, 0x1e, 0x5d, 0x4d, 0x6c, 0x2f, 0xf1, 0xf3,
     0x72, 0x0d, 0x3d, 0x96, 0xaa, 0xcb, 0x6f, 0x69, 0xde, 0x64, 0x2e, 0x63,
@@ -60,7 +60,7 @@ static const uint8_t test_result_sg_sha512[] = {
     0x84, 0x25, 0x7c, 0x32, 0xc8, 0xf6, 0xd0, 0x85, 0x4a, 0xe6, 0xb5, 0x40,
     0xf8, 0x6d, 0xda, 0x2e};
 
-static const uint8_t test_result_sg_sha256[] = {
+static const uint8_t test_result_sg_sha256[32] = {
     0xd6, 0x82, 0xed, 0x4c, 0xa4, 0xd9, 0x89, 0xc1, 0x34, 0xec, 0x94, 0xf1,
     0x55, 0x1e, 0x1e, 0xc5, 0x80, 0xdd, 0x6d, 0x5a, 0x6e, 0xcd, 0xe9, 0xf3,
     0xd3, 0x5e, 0x6e, 0x4a, 0x71, 0x7f, 0xbd, 0xe4};
@@ -76,7 +76,7 @@ static const uint8_t test_result_sg_sha256[] = {
  *  echo -n -e 'abc' | dd of=/tmp/test
  *  for hash in sha512sum sha256sum; do $hash /tmp/test; done
  */
-static const uint8_t test_vector_accum_512[] = {
+static const uint8_t test_vector_accum_512[128] = {
     0x61, 0x62, 0x63, 0x80, 0x00, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
@@ -94,7 +94,7 @@ static const uint8_t test_vector_accum_512[] = {
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18};
 
-static const uint8_t test_vector_accum_256[] = {
+static const uint8_t test_vector_accum_256[64] = {
     0x61, 0x62, 0x63, 0x80, 0x00, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
@@ -104,7 +104,7 @@ static const uint8_t test_vector_accum_256[] = {
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18};
 
-static const uint8_t test_result_accum_sha512[] = {
+static const uint8_t test_result_accum_sha512[64] = {
     0xdd, 0xaf, 0x35, 0xa1, 0x93, 0x61, 0x7a, 0xba, 0xcc, 0x41, 0x73, 0x49,
     0xae, 0x20, 0x41, 0x31, 0x12, 0xe6, 0xfa, 0x4e, 0x89, 0xa9, 0x7e, 0xa2,
     0x0a, 0x9e, 0xee, 0xe6, 0x4b, 0x55, 0xd3, 0x9a, 0x21, 0x92, 0x99, 0x2a,
@@ -112,7 +112,7 @@ static const uint8_t test_result_accum_sha512[] = {
     0x45, 0x4d, 0x44, 0x23, 0x64, 0x3c, 0xe8, 0x0e, 0x2a, 0x9a, 0xc9, 0x4f,
     0xa5, 0x4c, 0xa4, 0x9f};
 
-static const uint8_t test_result_accum_sha256[] = {
+static const uint8_t test_result_accum_sha256[32] = {
     0xba, 0x78, 0x16, 0xbf, 0x8f, 0x01, 0xcf, 0xea, 0x41, 0x41, 0x40, 0xde,
     0x5d, 0xae, 0x22, 0x23, 0xb0, 0x03, 0x61, 0xa3, 0x96, 0x17, 0x7a, 0x9c,
     0xb4, 0x10, 0xff, 0x61, 0xf2, 0x00, 0x15, 0xad};
-- 
2.43.0

