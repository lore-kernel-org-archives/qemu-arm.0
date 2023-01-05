Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp639455ejb;
        Thu, 5 Jan 2023 14:47:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtyud9zBsL8iwCR3OTy7IdG6QR5aGtOmpy1EE0L8woxqIUD7KwiMYy28YPDpwlG9VNYQS3P
X-Received: by 2002:ac8:6896:0:b0:3ab:6cf1:1e7d with SMTP id m22-20020ac86896000000b003ab6cf11e7dmr73603369qtq.2.1672958823628;
        Thu, 05 Jan 2023 14:47:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672958823; cv=none;
        d=google.com; s=arc-20160816;
        b=K8LV3YPjrZJV09i5YAumn5PylGX/rN5Hb040Pg8YCdzCj2EldLIrItqLdi3fjDP3V+
         CgL7pnHgTGNFd5IZTXaQHpqHUQBJhphpH+3ZEJ3im15BZcBKbrWBh9ZBTlJqP+xC/ZhD
         C/OQE/Fetwueo0G2QmPRdRPZjt8/A+cM98XNx+M2heY+O0VfDPwPmKUHr6XMBIq0TBdP
         qCiJ7Li8p5cF9FWzd1EpzCzsn/nUr+WlLEoswJUE2RsUsAI+8hRmzlC12J0SSqjXdemm
         fws6HeuXlP+2pXwUi32SMuECq6IVcvapma0J1pSvo9WmPvP1es9+HExZ8QD1bbuQi93v
         rSlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=QoqemqlNpSGkv32PNTdWXHZygAH80j0ySECS7DqLe2c=;
        b=C80J/3kOIxGwm3WuHJTa/DQ71EgldaYNxfZ+mIx6t8If5LlCKCB5/Z6i8KbMyAQEX4
         ye1hfs4lbTfPwqQT1lf+3+XUbIZ5+28sxPIZcrwDHlSiUP0l2QvUNHg3hVG6IKnBvMMF
         kIWn5Oz4FIE7jW4erujOgUGzjV6UshV729uCjwhlZYa69gcdnMYMNqgc3s6ke6r6wTi0
         dWk2GM2naV8tkLN+nsUGako8KRuKzeaAQhLX6oE96+vUYmHoMo9l5yZy31KCFAdDlDlH
         hoyqLxYi1PmpFQzAjKYC63Ti2u118DzqqE84WX5bRmvBUQM0h4iDwfwYD8V436nYxeOW
         pOYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=dm0XrfA7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay42-20020a05622a22aa00b003abcd33bbf8si2375404qtb.341.2023.01.05.14.47.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jan 2023 14:47:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=dm0XrfA7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDYzm-00012I-9o; Thu, 05 Jan 2023 17:45:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pDYTv-0006hb-8E; Thu, 05 Jan 2023 17:13:03 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pDYTt-00023F-Me; Thu, 05 Jan 2023 17:13:03 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 3DA1120B92AC;
 Thu,  5 Jan 2023 14:12:59 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3DA1120B92AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1672956780;
 bh=QoqemqlNpSGkv32PNTdWXHZygAH80j0ySECS7DqLe2c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dm0XrfA7sEJ7mgxambZnxzQ2PxLlHm0Cwt2kLQSN4k0EuvG7Hxod37UGMuDwHpMrk
 N9DzDLF/LcIv/xuSMDLGI6x0kDYM/P+ZHTJH04yxu5EQRL3x/w1jxhnjX+V3/45VTx
 +dpoaLfrefwYa38v+P7knXqvxF2Vy6Sq6Y+sAdEE=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH 2/3] target/arm: provide RAZ/WI stubs for more DCC registers
Date: Thu,  5 Jan 2023 23:12:50 +0100
Message-Id: <20230105221251.17896-3-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105221251.17896-1-eiakovlev@linux.microsoft.com>
References: <20230105221251.17896-1-eiakovlev@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -197
X-Spam_score: -19.8
X-Spam_bar: -------------------
X-Spam_report: (-19.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 05 Jan 2023 17:45:53 -0500
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
X-TUID: 1k8tgEPrkaVa

Qemu doesn't implement Debug Communication Channel, however when running
Microsoft Hyper-V in software-emulated ARM64 as a guest, it tries to
access some of the DCM registers during an EL2 context switch.

Provide RAZ/WI stubs for OSDTRRX_EL1, OSDTRTX_EL1 and OSECCR_EL1
registers in the same way the rest of DCM is currently done. Do
account for access traps though with access_tda.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
---
 target/arm/debug_helper.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index b244e146e2..2a7c3d7e38 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -673,6 +673,18 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
       .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
       .access = PL0_R, .accessfn = access_tda,
       .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "OSDTRRX_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
+      .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 0, .opc2 = 2,
+      .access = PL1_RW, .accessfn = access_tda,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "OSDTRTX_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
+      .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 2,
+      .access = PL1_RW, .accessfn = access_tda,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "OSECCR_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
+      .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 2,
+      .access = PL1_RW, .accessfn = access_tda,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
     /*
      * DBGDSCRint[15,12,5:2] map to MDSCR_EL1[15,12,5:2].  Map all bits as
      * it is unlikely a guest will care.
-- 
2.34.1

