Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp696864lfi;
        Wed, 8 Apr 2020 08:27:47 -0700 (PDT)
X-Google-Smtp-Source: APiQypITLUmqdG55HDAkUZeFGiVNmjIO/9gPIGFsgWSkzqw1lfItxulE7mTXs7wy7h56p6L0Hfrb
X-Received: by 2002:a37:2d83:: with SMTP id t125mr8288460qkh.359.1586359667085;
        Wed, 08 Apr 2020 08:27:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586359667; cv=none;
        d=google.com; s=arc-20160816;
        b=JOB4TFil8t1SI8xZ3Q2Aj4mUZLW75DwnZ6TL745rCNOLja6IPYWIA+f62x6+y6mNF0
         G+4ZbpDnAJYwkoRpYVazeNw/d8vZMTlTtxUqbtNe7cyfGcft4fLuz0sg0mtNUogcAOcy
         d3ELZRy3YzmQG4uLvx0yTE4Mqu9OHxsw0FTjDnJ323KtlnWfzbifwSkq3WAKLR2UIOxe
         wcDF4Mcyd9MvSuj4UUpx1VlpnPi4vi4WSYVfoggbSUeBOQSrAAOM3zx5lY2zb9XIGc3i
         HiBrzzINhYFaPB77lTDoUiREHr5voi+/vcpc5FDnDDUBkXZyPb+8CHTi0Y+RqUMuDTPt
         W4yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=QnDZehE/AAypjmGo+OkdocTPHfJQ/kZDt++TQk77MRQ=;
        b=j/R7TK8qd4wUV3FATJKSmd+9goq3HfMppQ59jo0n7N86H3Xyj97nHAooLaJXU/R4sn
         Gmv7gDkai+vQnHPTJok4gwyHlNKqDORW/VXgfUcdBV45CBCu7/KUZz/eI+dm3Hjsny8Q
         chCK14oBgE05k88e3LM3OmQWJhKBpYubDom9/un70TCyFH1HRskxaVkEWcPr+bv2oY7B
         4lWoHP+e1vFFUtu0YfHAMCwVsobVEa5TT8115cpTPgMrLF1/MNov9I4xzJkYZ2i8Hhpk
         v06WArm2kDg26zBLwzSmW6cT4RWKB4OWNNCF7f+LoNfuyCUf5itgZNT/BNE7qOyFklkO
         Ux2g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10si1717677qvz.101.2020.04.08.08.27.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Apr 2020 08:27:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jMBtR-0001Ix-Iy
	for alex.bennee@linaro.org; Wed, 08 Apr 2020 10:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60720)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fredrik@strupe.net>) id 1jM9Nm-0004Yv-K6
 for qemu-arm@nongnu.org; Wed, 08 Apr 2020 08:00:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fredrik@strupe.net>) id 1jM9Nl-0001ZF-DR
 for qemu-arm@nongnu.org; Wed, 08 Apr 2020 08:00:38 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:41341)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fredrik@strupe.net>)
 id 1jM9Nl-0001W3-7O; Wed, 08 Apr 2020 08:00:37 -0400
Received: from consensus.lan (cm-84.210.220.251.getinternet.no
 [84.210.220.251]) (Authenticated sender: fredrik@strupe.net)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 9A984200014;
 Wed,  8 Apr 2020 12:00:33 +0000 (UTC)
From: Fredrik Strupe <fredrik@strupe.net>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 1/2] target/arm: Make VQDMULL undefined when U=1
Date: Wed,  8 Apr 2020 13:59:53 +0200
Message-Id: <20200408115953.1158-1-fredrik@strupe.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 217.70.178.232
X-Mailman-Approved-At: Wed, 08 Apr 2020 10:41:16 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Fredrik Strupe <fredrik@strupe.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8Fh6ewrsYaI4

According to Arm ARM, VQDMULL is only valid when U=0, while having
U=1 is unallocated.

Signed-off-by: Fredrik Strupe <fredrik@strupe.net>
Fixes: 695272dcb976 ("target-arm: Handle UNDEF cases for Neon 3-regs-different-widths")
---
 target/arm/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9f9f4e19e0..dfe9dbbcfd 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5817,7 +5817,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                     {0, 0, 0, 0}, /* VMLSL */
                     {0, 0, 0, 9}, /* VQDMLSL */
                     {0, 0, 0, 0}, /* Integer VMULL */
-                    {0, 0, 0, 1}, /* VQDMULL */
+                    {0, 0, 0, 9}, /* VQDMULL */
                     {0, 0, 0, 0xa}, /* Polynomial VMULL */
                     {0, 0, 0, 7}, /* Reserved: always UNDEF */
                 };
-- 
2.20.1

