Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp598692lft;
        Mon, 20 Jun 2022 10:57:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uABkgiobOeUEfKgKUj3CKL7+m5tqW485bYUxZP7XxqZVUGPlzmAfBNI1zF0lRGfKXwjfjZ
X-Received: by 2002:a05:620a:2453:b0:6a7:263f:3bd2 with SMTP id h19-20020a05620a245300b006a7263f3bd2mr17068536qkn.10.1655747836086;
        Mon, 20 Jun 2022 10:57:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655747836; cv=none;
        d=google.com; s=arc-20160816;
        b=I8O0BKY6ARd5vE3wE998Z/j5DZ0GZXztgwWHIR1ueYJjI3x6kSSWkWWVQq8defxOxW
         JitrDOKFvXEjFpPtM3IYxbOCLjwrlZZLcDNWzThFL3jHt4rHpmNcaLWYNcxS8LzrhWdj
         BlkOJv7/Nmp+TtiWF30i6yGrkuozyRUKcIfnyuz54DQruywHp8MCmmDHISr6LvwGQdM5
         U1YfGTpureR0sleOft+zFH+mte+eUM2Ou3Bq7Yc1N+4/MfMlWQOk3hBaV8XbRqYdo8w3
         q1FF5KGUdFqtjz7wVVA5Tj1uL+tnZ5VcTvN48f3Z0kpwskjYP54F1AAt4kaCbqVOwmi5
         ES/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1PNp/XYs5YunJOFbsiS1iEWGQfYs0LVgbeVjPPzYS3Q=;
        b=eJU8ePL7/Wa/KgEX397ec/NslozZLvJrsRxMYKGGHH4j3Taw46FO4AVLnWNvFY9AYf
         4vEuzPeAl97wz8POZOJTPVSwK6fRcrpxI5lC2GPUb3eOAoWiFYUfQVn7kUBgsIQ8TLQy
         0tGfCEhNgvmN8fKmuvvwNWU4Fbjudmnu9lPuW7k6o0VslANxWGuXMxUKrM51UPMjHGkV
         XwHePAcpOol8DHOP4GXN/3WYaD09xPgjJgjkzWHUkvd1gBVJr1rxb/p+lP+gJ0/9Wi8o
         TUtglRJdazhnn2Xxy8f/Fyui5vE3Iio0tYv34TYhosbzfcfvQPNiRoBq5ek4KPmcdo+Y
         anfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W2pNv0xg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d68-20020a379b47000000b006a00425147bsi7487079qke.501.2022.06.20.10.57.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 10:57:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W2pNv0xg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3LeF-0002gG-Jn
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 13:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZr-0005UV-Su
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:43 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:36372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZq-0001LQ-9z
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:43 -0400
Received: by mail-pf1-x436.google.com with SMTP id u37so10871622pfg.3
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1PNp/XYs5YunJOFbsiS1iEWGQfYs0LVgbeVjPPzYS3Q=;
 b=W2pNv0xghyWlimlqi3zh3qQQuVosN6cmLa4DpGRVyBEhuabJdRp6Sc0qsxlI5WULKw
 T5WDoMWOJIcJ+Ujk90ZRm0GwUag0HjI0UT2sNwf7CZ2uw+YdoYNbRyX7JrngY9Qb4/u0
 b0eKFuz4elhswytKsTKsaYacizLeC+c3udGBH5L84Y/NmdHtt2kaW/iCyGfZN6KieTz7
 cRnWPVwbaid+0D9lFqOVBrBu6WrSn53xjNBvH01ODbMHwzhiRsy1YfKDLW9+ese29coi
 jhLXRn/5UVGBocLVmQcjAKn0/OptSSedZSkCdSd0rPf2lwtPJdHKH4XeJu3i1pwXr19U
 +Gyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1PNp/XYs5YunJOFbsiS1iEWGQfYs0LVgbeVjPPzYS3Q=;
 b=00aMttAq1JaW9DiyyRJnaIz29PCjJ7Ebt/23a8Qtjrb1kJ+QgMp0fhT1wwKrGqYNVw
 o+2RivGDMfFs+gRJFHPEFu0grH12gdrvNI3Xvn0skqh98cLvwyVPD7SyVdJT0wywdrrs
 7Z08RKJutyv7iXujkFNdkNMFjgLXAa9kluJ9IMx1hDOYW0SmMFoqVoMcAbvz0W3iSDPt
 n8T9p/JqBrXqs+H8i54y3Tf8+bfqCkhptIntKQiDVhrKVntePGeIx7eypphnmcKpOsuP
 Nc5AJkwLxq+CrJ3XM+W8wg52R9hf19ZGWjGUMT70DBi3BLU5dLGUgMx3Aw2rUNu+15au
 SiUg==
X-Gm-Message-State: AJIora+mqexg9sYoRRvOrCIPXbIwKiucJvEvjSYLum8SYhfQSoEejBPX
 J36++lOVyt/EaOcD/BpSU1p9THsZ7zCmpg==
X-Received: by 2002:a63:3d46:0:b0:40c:76b1:3eda with SMTP id
 k67-20020a633d46000000b0040c76b13edamr12151718pga.48.1655747560917; 
 Mon, 20 Jun 2022 10:52:40 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 05/51] target/arm: Add SVCR
Date: Mon, 20 Jun 2022 10:51:49 -0700
Message-Id: <20220620175235.60881-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NuoOD8HR4Rv7

This cpreg is used to access two new bits of PSTATE
that are not visible via any other mechanism.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  6 ++++++
 target/arm/helper.c | 13 +++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e99de18097..bb8cb959d1 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -258,6 +258,7 @@ typedef struct CPUArchState {
      *  nRW (also known as M[4]) is kept, inverted, in env->aarch64
      *  DAIF (exception masks) are kept in env->daif
      *  BTYPE is kept in env->btype
+     *  SM and ZA are kept in env->svcr
      *  all other bits are stored in their correct places in env->pstate
      */
     uint32_t pstate;
@@ -292,6 +293,7 @@ typedef struct CPUArchState {
     uint32_t condexec_bits; /* IT bits.  cpsr[15:10,26:25].  */
     uint32_t btype;  /* BTI branch type.  spsr[11:10].  */
     uint64_t daif; /* exception masks, in the bits they are in PSTATE */
+    uint64_t svcr; /* PSTATE.{SM,ZA} in the bits they are in SVCR */
 
     uint64_t elr_el[4]; /* AArch64 exception link regs  */
     uint64_t sp_el[4]; /* AArch64 banked stack pointers */
@@ -1428,6 +1430,10 @@ FIELD(CPTR_EL3, TCPAC, 31, 1)
 #define PSTATE_MODE_EL1t 4
 #define PSTATE_MODE_EL0t 0
 
+/* PSTATE bits that are accessed via SVCR and not stored in SPSR_ELx. */
+FIELD(SVCR, SM, 0, 1)
+FIELD(SVCR, ZA, 1, 1)
+
 /* Write a new value to v7m.exception, thus transitioning into or out
  * of Handler mode; this may result in a change of active stack pointer.
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2c080c6cac..3acc1dc378 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6349,11 +6349,24 @@ static CPAccessResult access_tpidr2(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                       uint64_t value)
+{
+    value &= R_SVCR_SM_MASK | R_SVCR_ZA_MASK;
+    /* TODO: Side effects. */
+    env->svcr = value;
+}
+
 static const ARMCPRegInfo sme_reginfo[] = {
     { .name = "TPIDR2_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 13, .crm = 0, .opc2 = 5,
       .access = PL0_RW, .accessfn = access_tpidr2,
       .fieldoffset = offsetof(CPUARMState, cp15.tpidr2_el0) },
+    { .name = "SVCR", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 4, .crm = 2, .opc2 = 2,
+      .access = PL0_RW, .type = ARM_CP_SME,
+      .fieldoffset = offsetof(CPUARMState, svcr),
+      .writefn = svcr_write, .raw_writefn = raw_write },
 };
 #endif /* TARGET_AARCH64 */
 
-- 
2.34.1

