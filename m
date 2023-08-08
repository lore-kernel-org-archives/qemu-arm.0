Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1877166ejb;
        Mon, 7 Aug 2023 20:13:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHze+3WqTU6oj743CQaj33G/pbuqD7GRHuJl6XFaGGqaEVFWI4kRbnVKgdU0Ad8OXxDqb5N
X-Received: by 2002:a05:622a:104d:b0:403:e1d1:8b91 with SMTP id f13-20020a05622a104d00b00403e1d18b91mr13108328qte.60.1691464423271;
        Mon, 07 Aug 2023 20:13:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691464423; cv=none;
        d=google.com; s=arc-20160816;
        b=0rdojiOo1BYcW7d0hccfFl2w+Pd7bwKVsMV4+9fX+DIQq6kQTgjTToWvjWxo+AqxcV
         snJ+GgoR+3e6CkUBCX0OjMSSyC3fdgIt66UqyEFDrp7Af2OfZvhIZ32lu4z845lJ7bE4
         QnrKS6yC4WCSBiOvsnN7RbGXr08bFSODLdqGYK0sG4+5PplJdAPJU6Hyfcpg8X+uxvYX
         eGsrJvkBuSqs5MKoK5vYadvKlZCPXvT/nRtQYRYc/JiulDP094py2nrxfEO54bsh1cHs
         WDe1Y8sthIvSgYF63FPYHcou9vAc7EoE1MAgfawIeaZmikIF5IU9u2ChUjlJb/D5Ekd2
         VMQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=82T4pR6asvjS0K/TieV1fa+Y+4r718itxbMRosKOlXE=;
        fh=hqs26moy805PsHbwd88lUczy2QdlfF59ojSMxj/DeWg=;
        b=AtdC+6QQ9qEkNCyiIp1AGWtEdAnauwHDxgk1Em+sesJo+upaKIYmyNEUWuydCwtAhv
         EDkwgfGNVq96nxUZTdMBKouSpMDB0a0ffxWJ1xjx182P1ySYk9hPR8PQhWrwgJHvdpHD
         htylkK2z6KR80TJqqxhaUCIDWxOZgFxGDZ5qqW8jK+UUB6Y2CHj7AHnjb/vHellXWr1E
         b7wfR4bwO1i7mPT0QCwf5e6PygUf6IAYc1YUbBa+3YWbO68cEHHYic/CVwteVPK942yb
         UJj4T46R1D0NfpIU3Hy0GbajFrV7hWhf39FiTAUie6QTXHaDNMDYXqVqx53Cel0r2h73
         YO+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="s25KEC//";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qt3-20020a05620a8a0300b0076719299db7si5151279qkn.567.2023.08.07.20.13.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 20:13:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="s25KEC//";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qTD93-0001us-Rd; Mon, 07 Aug 2023 23:12:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8k-0001GH-H2
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 23:12:10 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8W-0000F4-Tc
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 23:12:09 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5646f8ac115so3081455a12.2
 for <qemu-arm@nongnu.org>; Mon, 07 Aug 2023 20:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464315; x=1692069115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=82T4pR6asvjS0K/TieV1fa+Y+4r718itxbMRosKOlXE=;
 b=s25KEC//J923Yue9MT3neOWgtiDnaWp8QORRkEotpHCMWMrYbtgevHAZzcVm6+VaLm
 Gn1Fydct5wKNWaB7ayeOY61T3/iR8Az8M1baNW7Mk5q1v5jG7ceSHAID7T17EbBQCAcR
 TQ0xPVg/GxcyB25cAL7kkUdMWJGzZtlWElrchX1lAqAz/0y9orU0kJ2vT67hQQkfk/jJ
 J5vkKKN9utUznKQZfh0Xrtre4f61c+R8TqlV2MX9xmpgS5A/ylrllxrUPd8bIgXwWC1m
 RGIPetWGlVdC4MuR7dI53R2ZkSJQ7JIZdFtDvWFKgYGOc09L1z7QAvYMDK6RRJHzZ8Up
 I5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464315; x=1692069115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=82T4pR6asvjS0K/TieV1fa+Y+4r718itxbMRosKOlXE=;
 b=OXwozItu2WttRQ5HhneOzlnBOz/WXoJb16VqByGTVeR+jfF663+nmmV+pJA7yzEY+C
 6+2e+JReI6aQ17lIfsGVvRIsiNmJtlZwwfcHdYInfBmYMaFoquj1QjYc8kY83QlsVCo/
 IpDNlyYGEskSgvKrFIThne+oakRgFLz+u1PNnn2NhrqYwIz06lVGm+1H9GILMPMUwjQD
 SD4RYcOW7XR2uVSw5oZWmzR9MPgBhmV6Eu8jhA4iJQ5e6lqMmZCTFuVQvQEOGD+bC6OR
 HYyMRwxM5yVMfxKUSDohdf2cVrU3vhBqMRyxIV9ldXSqSiD40j8sORcDNe/m2XkcDOFS
 oFYg==
X-Gm-Message-State: AOJu0YyiVQjNEHDAz9CumJ16ACehCpm2JpIzSuY1nGxzeJX0ta2eCKuu
 uU8AtAk+gMpEvv1WkC/JXbsede8nISgh0ta5tv8=
X-Received: by 2002:a05:6a21:3e0d:b0:131:6464:217b with SMTP id
 bk13-20020a056a213e0d00b001316464217bmr9310225pzc.16.1691464315496; 
 Mon, 07 Aug 2023 20:11:55 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:11:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 12/24] tcg/aarch64: Implement negsetcond_*
Date: Mon,  7 Aug 2023 20:11:31 -0700
Message-Id: <20230808031143.50925-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808031143.50925-1-richard.henderson@linaro.org>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6AkxLwcAGYHa

Trivial, as aarch64 has an instruction for this: CSETM.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h     |  4 ++--
 tcg/aarch64/tcg-target.c.inc | 12 ++++++++++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 6080fddf73..e3faa9cff4 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -94,7 +94,7 @@ typedef enum {
 #define TCG_TARGET_HAS_mulsh_i32        0
 #define TCG_TARGET_HAS_extrl_i64_i32    0
 #define TCG_TARGET_HAS_extrh_i64_i32    0
-#define TCG_TARGET_HAS_negsetcond_i32   0
+#define TCG_TARGET_HAS_negsetcond_i32   1
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
 #define TCG_TARGET_HAS_div_i64          1
@@ -130,7 +130,7 @@ typedef enum {
 #define TCG_TARGET_HAS_muls2_i64        0
 #define TCG_TARGET_HAS_muluh_i64        1
 #define TCG_TARGET_HAS_mulsh_i64        1
-#define TCG_TARGET_HAS_negsetcond_i64   0
+#define TCG_TARGET_HAS_negsetcond_i64   1
 
 /*
  * Without FEAT_LSE2, we must use LDXP+STXP to implement atomic 128-bit load,
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 35ca80cd56..7d8d114c9e 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -2262,6 +2262,16 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                      TCG_REG_XZR, tcg_invert_cond(args[3]));
         break;
 
+    case INDEX_op_negsetcond_i32:
+        a2 = (int32_t)a2;
+        /* FALLTHRU */
+    case INDEX_op_negsetcond_i64:
+        tcg_out_cmp(s, ext, a1, a2, c2);
+        /* Use CSETM alias of CSINV Wd, WZR, WZR, invert(cond).  */
+        tcg_out_insn(s, 3506, CSINV, ext, a0, TCG_REG_XZR,
+                     TCG_REG_XZR, tcg_invert_cond(args[3]));
+        break;
+
     case INDEX_op_movcond_i32:
         a2 = (int32_t)a2;
         /* FALLTHRU */
@@ -2868,6 +2878,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_sub_i64:
     case INDEX_op_setcond_i32:
     case INDEX_op_setcond_i64:
+    case INDEX_op_negsetcond_i32:
+    case INDEX_op_negsetcond_i64:
         return C_O1_I2(r, r, rA);
 
     case INDEX_op_mul_i32:
-- 
2.34.1

