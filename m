Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4223881wrg;
        Tue, 11 Jun 2019 04:20:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwgnBzzCL+fg2kS0w2W2lBYaifvXfIC2p/hskgJ3xlZMqTfNpjfA48Tn75txm9FNXzZrPRl
X-Received: by 2002:a37:2748:: with SMTP id n69mr9413627qkn.275.1560252031585;
        Tue, 11 Jun 2019 04:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560252031; cv=none;
        d=google.com; s=arc-20160816;
        b=AiB8On6DoD1rMAt7mcvuHWqzjYCnDBNTFs/O0sRpnAO1hsJ5giog8AaONUh9zxNJZ2
         2XDs9TpQuj5CAn4TGrfCGt09VfcRHilTf6cLxzwhtizRB6r3EsHczG8gTQmzc4sdCMsF
         iPXeTzHnRQr/hSye2uHDdIYuqox3j5DGmPx9pvo6tfFFsju+k5oOTveoRzWiaV06Kqjx
         SvQs9iVNMpqZ3pExpdvgqZQ9JwdEd6pZPG1rpdJ5uEBt4r8wV6W5ldsq/DXj25rqk28s
         pss653ugr6mnbehKk68iDj+kCBFrQZIFFbDagOgdjePjDRAEaXPKrJ16l5tSsMRkwPKW
         GwLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=fcAWsgac4JAw4zukSEhib/ItxuFypx2icjrecghPreY=;
        b=El0dxmSLwVag59ngrVLtMTnkJHWFjeCrdvjfjG9xcbJkgX/nmun+aGDYBaL4LQzvjp
         /ZfSFYiIYdiJ6QyIS/QbbcjDuXPrhcXc6Z6WJY6TeLuaD5mZDOgXIGGHGHTXC1KO67ak
         nAfi7MSy6NWHA3NHpKXXjbm4jLALU336fA3oC4DtQTYxoMuvYEjpzgIxY9Bu+ezcbH2l
         UAk2vrFov2sXpE1axLJK2KHBdMkSxXG2Mnq9dFUyYhsLHaaRHz/Y9bIQrvznzQBqi9Ir
         LnDSIbPMlwuiqOMMnMCQwn2/i3AtLZjpofUWW0FgckiwTY50cosomYg5NBILzeiqTy1u
         fTfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MIoEbvCM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6si253664qvf.7.2019.06.11.04.20.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 04:20:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MIoEbvCM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56362 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1haepL-0004ls-1k
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 07:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39628)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQP-0007c8-GB
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQL-0007sJ-Fe
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:45 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:37666)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haeQL-0007fx-3P
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:41 -0400
Received: by mail-wr1-x441.google.com with SMTP id v14so12481119wrr.4
 for <qemu-arm@nongnu.org>; Tue, 11 Jun 2019 03:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fcAWsgac4JAw4zukSEhib/ItxuFypx2icjrecghPreY=;
 b=MIoEbvCMPWqqtTv1HZ0nqexfsLD4r4Jb0vCP59Di1EUIV9ad7p/cK5L6A7+vlMe+Rt
 sEOCVhlI2gaA2kQT3NbCT3IbQMJ19DdBF4fOMk8BYyH8YbmIZP0t9kgzU0mf5RSNwv5N
 zycJUYvjtwaeEtQN1eY8T00W2vvQ6kJe9ShS2jhBk+WJuGEjPgPdqHpFK+LHQ9bMHur+
 CqvD5o6Vu9+r8OlVntXNMjWVzdrgFtGD2P7RpCHq8wQarrWfx1AmGOYiPGIn5sbDw3n7
 SAYxpRqOq4eeE3dgpfIllTsK+gX6Z2yPMRsXIA7iQvaDC3wemI2AMu0gL43P29o6slWo
 nm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fcAWsgac4JAw4zukSEhib/ItxuFypx2icjrecghPreY=;
 b=PGGmmQQBY+bEYtVs0Hq0MSPwG4/nUo2kQU9COCtNxoARSSKrQ9wVNgmJeTDxJWBJF7
 loy3lIH9Tvzxide0tXnLGlswVQ1L909/4VduKQng9xYCxl9YA9I1ijuf6rb7DieTJTuy
 2uCJbt9h4E63feL/ARzhVeT4OY0aMa22BLXCDA2UA3FFtQNRs1zqPNOp131a4RSy6WQu
 V7q2GWnwztpF+0UUFveV6TbrIfCi3ZfTpaLNiQr/Izf4ajT1XAUbfKk4YI3FwiKv6+lB
 QUFbhSOTskT8kYq5fS0p2UnGHurIB38szNfROI3B6eIFh3N3PxptBDoCgAf51Afzd8Cu
 568w==
X-Gm-Message-State: APjAAAXHSObQuVrA4gzXtfwGNxnuosu8SqaYAj93SR+UNZTKL+ql1suW
 al+6NPdqD+iNqpTvehiQrHf3BXHKXSeq0w==
X-Received: by 2002:adf:de90:: with SMTP id w16mr17413792wrl.217.1560250466360; 
 Tue, 11 Jun 2019 03:54:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.54.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:39 +0100
Message-Id: <20190611105351.9871-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-arm] [PATCH v2 30/42] target/arm: Convert VNEG to decodetree
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pS5lBa5MS2gL

Convert the VNEG instruction to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c | 10 ++++++++++
 target/arm/translate.c         |  6 +-----
 target/arm/vfp.decode          |  5 +++++
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index d0282f1f921..6e06b2a130a 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1898,3 +1898,13 @@ static bool trans_VABS_dp(DisasContext *s, arg_VABS_dp *a)
 {
     return do_vfp_2op_dp(s, gen_helper_vfp_absd, a->vd, a->vm);
 }
+
+static bool trans_VNEG_sp(DisasContext *s, arg_VNEG_sp *a)
+{
+    return do_vfp_2op_sp(s, gen_helper_vfp_negs, a->vd, a->vm);
+}
+
+static bool trans_VNEG_dp(DisasContext *s, arg_VNEG_dp *a)
+{
+    return do_vfp_2op_dp(s, gen_helper_vfp_negd, a->vd, a->vm);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index dc9076a60a3..b0eecb6ca8f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3098,7 +3098,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 return 1;
             case 15:
                 switch (rn) {
-                case 1:
+                case 1 ... 2:
                     /* Already handled by decodetree */
                     return 1;
                 default:
@@ -3112,7 +3112,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 /* rn is opcode, encoded as per VFP_SREG_N. */
                 switch (rn) {
                 case 0x00: /* vmov */
-                case 0x02: /* vneg */
                 case 0x03: /* vsqrt */
                     break;
 
@@ -3291,9 +3290,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                     case 0: /* cpy */
                         /* no-op */
                         break;
-                    case 2: /* neg */
-                        gen_vfp_neg(dp);
-                        break;
                     case 3: /* sqrt */
                         gen_vfp_sqrt(dp);
                         break;
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 7035861c270..79e41963be4 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -161,3 +161,8 @@ VABS_sp      ---- 1110 1.11 0000 .... 1010 11.0 .... \
              vd=%vd_sp vm=%vm_sp
 VABS_dp      ---- 1110 1.11 0000 .... 1011 11.0 .... \
              vd=%vd_dp vm=%vm_dp
+
+VNEG_sp      ---- 1110 1.11 0001 .... 1010 01.0 .... \
+             vd=%vd_sp vm=%vm_sp
+VNEG_dp      ---- 1110 1.11 0001 .... 1011 01.0 .... \
+             vd=%vd_dp vm=%vm_dp
-- 
2.20.1

