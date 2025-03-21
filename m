Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp178653njc;
        Fri, 21 Mar 2025 02:28:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUwC1AD27Jqqu58AHaPsfCIoIRFShscMLoKxU2pUn5s8lgiyjfynCQCKxJ4GgAfj9WjjKhNn0+w10PqsQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFqh3daXGV0S6bvHEKBKL2xJ9sukk1HkSYIFlRYJjckIMUJv3+cg1qDw9vBvBcnWG46CPXy
X-Received: by 2002:a05:622a:1144:b0:476:71d2:61e0 with SMTP id d75a77b69052e-4771dd92384mr43064291cf.23.1742549326173;
        Fri, 21 Mar 2025 02:28:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742549326; cv=none;
        d=google.com; s=arc-20240605;
        b=gP2I+lGfQTY45vp/6NghgEerFWr2gAmrdtVXuLgAE2z+336NZQqA0EfqLALgR9XtCq
         RVVDlUZxzdH45XgjPZfk01lvA5Pet62N0uvJIM5e/+GhppYVAKxKQznNYD5tHDtqVuAP
         oX1ItJc8n+1+SLQ01Wt+7wODrx8F1VvJZKqzeGetqu8GYqsfFa9soVqYmC5EiX3RrMMl
         cWt27IQoYJ/RR/K6iFG4t7wMifaTgbqwqbHcVz0cMscJwIatr2u58T7VNYaiJqgu7xpN
         dfC91SL2DWFrjU/8d7cBJB6gtqH3F0iPUHqCH51rmJBmL62a98TprkeIwdksQqjbk9LP
         Nz3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=INFfY8HBV1KX8pwc1aGXX+iXiqhLRwLWwHMdzMD6IZQ=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=PkdsRcm6BBMEeGk6JV9YPh+vkPraJ2x8hOKCnBaUeZGUw5ZzjO1WwhXvPCt/UJ1IM7
         zJY6I3Esi6FB71k1eA+yFIJirxnbx/fwlE4xKm8UygvakaHIqJGCY2NsPFzomB4NjenN
         a4Z6OrfBJ0SFAUd6cRD11ioStVgEyXn/lOo9NymCzFhRHZHiMHszwDb2h3uSY8YomSXS
         pVckedei/0C0EMzPTKn9PosUHYYwGrMVwsF2NnGR7QqYNt0gi+q89u8OmmQ27TDE1/hS
         jAVzS99ypRq0etOVM/TjuKIeIJxZob/uf+I7qN3F+N0cIZrFYhye5a40RkFXGkwJefHM
         RDdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4771d4fea47si15130461cf.220.2025.03.21.02.28.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Mar 2025 02:28:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tvYfX-0000F7-6n; Fri, 21 Mar 2025 05:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tvYfA-0007Nw-6o; Fri, 21 Mar 2025 05:27:36 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tvYf8-0005EC-Me; Fri, 21 Mar 2025 05:27:35 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 21 Mar
 2025 17:26:29 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 21 Mar 2025 17:26:29 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v1 16/22] test/qtest/hace: Add SHA-384 tests for AST2600
Date: Fri, 21 Mar 2025 17:26:12 +0800
Message-ID: <20250321092623.2097234-17-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321092623.2097234-1-jamin_lin@aspeedtech.com>
References: <20250321092623.2097234-1-jamin_lin@aspeedtech.com>
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
X-TUID: ipf//oIpDigP

Introduced "test_sha384_ast2600" to validate SHA-384 hashing.
Added "test_sha384_sg_ast2600" for scatter-gather SHA-384 verification.
Implemented "test_sha384_accum_ast2600" to test SHA-384 accumulation.
Registered new test cases in "main" to ensure execution.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
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

