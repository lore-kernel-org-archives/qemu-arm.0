Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3187896wrs;
        Mon, 19 Aug 2019 15:02:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyZnVRN9tg8ihWS/G0j2PDBy7hafEk2icatEt/T+k//TTfbuZKolVDgqWFIN/6DQ9IGO7/p
X-Received: by 2002:a17:906:fca8:: with SMTP id qw8mr23541704ejb.273.1566252153206;
        Mon, 19 Aug 2019 15:02:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566252153; cv=none;
        d=google.com; s=arc-20160816;
        b=otIXLdjl0wyIsCke22pqeEXMd/p/E7Wm8hytEH2k+//+kwqIlioGhhfuaVVcGwXNy5
         jhcsW7+ZpZWxQRTyOvnUdFOy2ChWNiI9eBI7KgsJHAQ8Fng8HOeftWy8i86zvUxxJWin
         CFmLX3aihLPxHvbKWmG8woAEynnTGmIw4wRRvFXGAQyEoi3AJQ3OrSjdbkTwaYJDQJ8a
         qnlQXNOlU6Mthb2r/xAj2JOwCcjYPw9jGIBrWuAqM7OzXkUv3997KRfmnVJi3QKMlejN
         EaNoq3KMUOvI439hhUEYZq9QadRZ3/Q0+tE/qRtZyCIy9FWp0bvbgNu+ay/9i9W1AXVi
         g8gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=JhmaAGzRoow6PV3mD1aboEwUvmsUrSNHW6vrm01q9UA=;
        b=JDmoxF73i5sXg5McfNNLTHII5xeSwXE/vBo9Vj55AV1AVADem6e1lg0Xw9wDNQYtoj
         FMcZ6VheVvKlTCFd60tesHIjCd92q/Gz8ezh766L4TbVzZs6YDmI31PBpR39dTrup4pP
         G3/QEiVPeKzV3Ppz74gCSlaxPl5MnWfNd36Dz7jfjVfLeHJQJgQDxNvWf/aDYd5DZktg
         ffABe9yCajxLWQxJxzU9H7bCs/RYAt56ri/3gDLba6rZogfqj5+iih0Our31ucov2kFK
         EdLLvNS6L7HS1Tc7BSo+5B5oNE9o0vdHE5IX4+X4xyacfbo0fzBJ1zXvNnGfkxklBYly
         KgvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eNhhBEL5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p8si7474696ejg.193.2019.08.19.15.02.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 15:02:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eNhhBEL5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpjT-00082v-LS
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 18:02:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59409)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMT-0002LD-Nd
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMR-0006U1-SY
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:45 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:42088)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMR-0006Td-Ms
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:43 -0400
Received: by mail-pf1-x444.google.com with SMTP id i30so1942640pfk.9
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JhmaAGzRoow6PV3mD1aboEwUvmsUrSNHW6vrm01q9UA=;
 b=eNhhBEL5W3OtD0P4jcvd636YxZSbqIkbtSAji8NqXmO/jUYNdcN9uGXP1MRb9ERTzK
 fV0r8EKdmtiqAxgt8/yiM3hALXwu3wzHOrv7Uo0Mzw4rEdCXzmVKz5p6X1XxX26LJ7By
 3ACWkDpuqkQ3QElmHwAEJedX7ULxqbuAnqN40E7HjVXLsbC+JlIDyBYoApz7DmRgSnN/
 wAAMONm3ToZG7Wme9VvyGZ78D7+GNvQe4ALsZB3KQlj10VfFJ6ua4p57fI8S/JC9S1Ay
 hA/xuwmQC3J7tH4jV5A/6QIs4uOtM+p9sSNGe+xW4kk3M5GDNQnv69xA3VY3ZUo/r22V
 m7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JhmaAGzRoow6PV3mD1aboEwUvmsUrSNHW6vrm01q9UA=;
 b=aA/TW23QcxRx4jA3Y5XJQtZt5/kuXeKTJX9xrlPgUIS0GO5k8cXwMoDo+FEtP+ohvc
 4mcl0QJKlOZOGBigkFa5MAiMjQxxrmL5phApyzP70rHhtcgSqLZhV0TXCwTIwcEqXfsw
 o8r4/LrFm87HBI0loncMFfquKQDMhE5XsZvmHnEMIUQhtuDWjGeQXuCYE5hi8oVddJ8e
 fciacKchixvDFrdj4FMdFsb3kP0xKJ1Y07uVS1vwrjkfp3i1EAu30pER2cd6HOhkDC7V
 n3MoUVAm6//hUXS+y+M7BbMX2vyotEPh0e4zXfnbdnZAWiSgIFJo0X22Z3Nq0NoD0wPw
 fr6w==
X-Gm-Message-State: APjAAAVipdQRVaHrS4TW+U0AoE67v4qTVMJnk5scHDyOOL9My7lTzivV
 mGfj24OXuZ+FKi0rLqklr4h0liMOt/s=
X-Received: by 2002:aa7:9516:: with SMTP id b22mr26306293pfp.106.1566250722846; 
 Mon, 19 Aug 2019 14:38:42 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:24 -0700
Message-Id: <20190819213755.26175-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-arm] [PATCH v2 37/68] target/arm: Convert PLI, PLD, PLDW
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /iiNulHBX+We

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c       | 37 +++++++++++++++++++-----------------
 target/arm/a32-uncond.decode | 10 ++++++++++
 2 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 46e88d1d17..a30a9bb4e0 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10136,6 +10136,26 @@ static bool trans_SETEND(DisasContext *s, arg_SETEND *a)
     return true;
 }
 
+/*
+ * Preload instructions
+ * All are nops, contingent on the appropriate arch level.
+ */
+
+static bool trans_PLD(DisasContext *s, arg_PLD *a)
+{
+    return ENABLE_ARCH_5TE;
+}
+
+static bool trans_PLDW(DisasContext *s, arg_PLD *a)
+{
+    return arm_dc_feature(s, ARM_FEATURE_V7MP);
+}
+
+static bool trans_PLI(DisasContext *s, arg_PLD *a)
+{
+    return ENABLE_ARCH_7;
+}
+
 /*
  * Legacy decoder.
  */
@@ -10196,23 +10216,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             }
             return;
         }
-        if (((insn & 0x0f30f000) == 0x0510f000) ||
-            ((insn & 0x0f30f010) == 0x0710f000)) {
-            if ((insn & (1 << 22)) == 0) {
-                /* PLDW; v7MP */
-                if (!arm_dc_feature(s, ARM_FEATURE_V7MP)) {
-                    goto illegal_op;
-                }
-            }
-            /* Otherwise PLD; v5TE+ */
-            ARCH(5TE);
-            return;
-        }
-        if (((insn & 0x0f70f000) == 0x0450f000) ||
-            ((insn & 0x0f70f010) == 0x0650f000)) {
-            ARCH(7);
-            return; /* PLI; V7 */
-        }
         if (((insn & 0x0f700000) == 0x04100000) ||
             ((insn & 0x0f700010) == 0x06100000)) {
             if (!arm_dc_feature(s, ARM_FEATURE_V7MP)) {
diff --git a/target/arm/a32-uncond.decode b/target/arm/a32-uncond.decode
index d5ed48f0fd..aed381cb8e 100644
--- a/target/arm/a32-uncond.decode
+++ b/target/arm/a32-uncond.decode
@@ -54,3 +54,13 @@ SB               1111 0101 0111 1111 1111 0000 0111 0000
 
 # Set Endianness
 SETEND           1111 0001 0000 0001 0000 00 E:1 0 0000 0000  &setend
+
+# Preload instructions
+
+PLD              1111 0101 -101 ---- 1111 ---- ---- ----    # (imm, lit) 5te
+PLDW             1111 0101 -001 ---- 1111 ---- ---- ----    # (imm, lit) 7mp
+PLI              1111 0100 -101 ---- 1111 ---- ---- ----    # (imm, lit) 7
+
+PLD              1111 0111 -101 ---- 1111 ----- -- 0 ----   # (register) 5te
+PLDW             1111 0111 -001 ---- 1111 ----- -- 0 ----   # (register) 7mp
+PLI              1111 0110 -101 ---- 1111 ----- -- 0 ----   # (register) 7
-- 
2.17.1

