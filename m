Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp78695ejb;
        Wed, 15 Feb 2023 19:10:20 -0800 (PST)
X-Google-Smtp-Source: AK7set+ptZr5Sad71E5/q1kP2GhYPFqynEa2/t9Dik2xXBXLaUGcFPztVhjVmwjBPVr63kUrNyE2
X-Received: by 2002:ac8:5a41:0:b0:3b8:4e37:50ea with SMTP id o1-20020ac85a41000000b003b84e3750eamr7585760qta.58.1676517020513;
        Wed, 15 Feb 2023 19:10:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676517020; cv=none;
        d=google.com; s=arc-20160816;
        b=qfiWITiPwE8T/hPc4YR8pXGWK3JDIfALmrevtrvH0fDHjF8gTfKHhSiNTaNdUn9nBB
         3ynQGKg/TX6Bo1km84x9L2DKlv4G40gqWBTbky0NU20Ardp637FbrR4Dfv/n6JubNmwC
         kfJDEhEFCzV6v5s0TI0D5GMk3Hwh9NW6Q7B1oz21hVXSE2WM4HYz+bOw5aOKXwkPjfqS
         rdgJLOJTlCi9CGrpPF74vIuSV0Z8UvXasXdecKX46ERaQI4fV+QWXXMoTuvVTSjMkh4B
         tQKs7tnlqDjApBiND62Y5YGeVnZU+UYe0WZruolEvXg8WAOKANN1r1CmjlK2Gow3H7BW
         8hqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ifftpNbWqx3/3wdOUbpX/ZIUpWmLL1jR33HqRqthdug=;
        b=xbAVHdBNPH0doIAKw2OtW88H8gX6RMjfg0i4Iy+u9lH/6QxSBcvkZ4dv+J9QEqPUoC
         5opI2labZRYZBJUjEN85BCpMIVBlDtOhHpfxuGkz6V9yR3gwF0du9slzAFTppA2NpojO
         9WxkNTaJ8/oPVCE0EP1gwiUE6uoiRmJEmze06ekLKQV7i+P9Ku7gIbub8eZWx0Pah+Hk
         6etWlXdAExT568+rOpwtsg+ZNEFrMA1AXyqdqpRo3ouKFOEeF5bQ8mxFwYCIFs5e3oE/
         Jv6YfTIugcoOdtwp/b2FmS1lWROnExkYmclz/8YIa3IibDBw+KL5NGrJ6hIGCUpAJe5U
         zhqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J023b2Fc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f18-20020a05620a409200b0073b6a31f0e0si408329qko.160.2023.02.15.19.10.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 19:10:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J023b2Fc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUe0-0007JG-DI; Wed, 15 Feb 2023 22:09:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUdv-0007Hv-Ez
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:08 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUdt-00006b-4d
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:06 -0500
Received: by mail-pg1-x530.google.com with SMTP id 7so440698pga.1
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 19:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ifftpNbWqx3/3wdOUbpX/ZIUpWmLL1jR33HqRqthdug=;
 b=J023b2Fc0U5R45Sy6NwEFHxcQif1cj8X7rIhywFczveHhaLLORUle81wIsA4kSwHYf
 hMgsi3qbZIrLdwnx9l+isBobe+kJqZ8nZAi7ErUVWpSk4wxBrHk2ek8urJEiAa1I8eJG
 1VA+xpJ7MeGAEj1WPvFb02X+iOY0KJf5oLOrwQt/7bg6oGPV1Z2H4hYgj2xzkKeYKTdl
 y8s0lqJQWkEx+Ck6Y6HyAkuxJKVuCEp70Es2XCXf9A8FNA1XXnOpNrU9e5FJQvbpUEqt
 6GVPOp9bIStgJjbCa8VO0UMmTUrnU5F7A9a1bL6qj+97w0K3kWPm8heBl2xW/+pXnj63
 FZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ifftpNbWqx3/3wdOUbpX/ZIUpWmLL1jR33HqRqthdug=;
 b=KY+4m+BR0ICAf4ArP9VrsYUGL2caWSfT+aM/BIcXyKfqjMsFlI1G4kMzIFuoMRtpHN
 SSle+Fdrb0lqi6I5mOMZqlDvSkgSlL6bUadc2paaQl6dde+ZPG60XmS0I972fBK05gdz
 tw6tr+BIV53iNATbLsK3vMYswTszvqirQ0yAsns/ymUaCmBq8fMWltZNg8Z4rOpzd0hp
 w6k0N/nL03WzrdJ+87QV8Wu9vbOZ2fVjZDveO2mpAUBEeue7uS5W7cIK3LxnU+twPD6p
 DTOfNR1L5VKBViQpYyTMrNFaiaHiGf80ksXyWEWJM6vFL9RUkQ+Yuq5G/I0FlRnBwaaQ
 RPAQ==
X-Gm-Message-State: AO0yUKWRi74FLonK6Z2YedqqSwYwakSZF0lW/q309KY4PQoO4PYgq4qx
 eTjKHjl5uc5837bLk4YIO6xPMsx198bRLc3CrKw=
X-Received: by 2002:aa7:9591:0:b0:5a8:ab87:eda with SMTP id
 z17-20020aa79591000000b005a8ab870edamr4019127pfj.20.1676516943711; 
 Wed, 15 Feb 2023 19:09:03 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 i25-20020aa79099000000b005810a54fdefsm79051pfa.114.2023.02.15.19.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 19:09:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v1 04/19] target/arm: Use tcg_gen_qemu_st_i128 for STZG, STZ2G
Date: Wed, 15 Feb 2023 17:08:39 -1000
Message-Id: <20230216030854.1212208-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216030854.1212208-1-richard.henderson@linaro.org>
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ipb7/mkA9cOA

This fixes a bug in that these two insns should have been using atomic
16-byte stores, since MTE is ARMv8.5 and LSE2 is mandatory from ARMv8.4.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 18 +++++++++++-------
 tests/tcg/aarch64/mte-7.c  |  3 +--
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index edf92a728f..b42e5848cc 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -4207,16 +4207,20 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
 
     if (is_zero) {
         TCGv_i64 clean_addr = clean_data_tbi(s, addr);
-        TCGv_i64 tcg_zero = tcg_constant_i64(0);
+        TCGv_i64 zero64 = tcg_constant_i64(0);
+        TCGv_i128 zero128 = tcg_temp_new_i128();
         int mem_index = get_mem_index(s);
-        int i, n = (1 + is_pair) << LOG2_TAG_GRANULE;
+        MemOp mop = MO_128 | MO_ALIGN;
 
-        tcg_gen_qemu_st_i64(tcg_zero, clean_addr, mem_index,
-                            MO_UQ | MO_ALIGN_16);
-        for (i = 8; i < n; i += 8) {
-            tcg_gen_addi_i64(clean_addr, clean_addr, 8);
-            tcg_gen_qemu_st_i64(tcg_zero, clean_addr, mem_index, MO_UQ);
+        tcg_gen_concat_i64_i128(zero128, zero64, zero64);
+
+        /* This is 1 or 2 atomic 16-byte operations. */
+        tcg_gen_qemu_st_i128(zero128, clean_addr, mem_index, mop);
+        if (is_pair) {
+            tcg_gen_addi_i64(clean_addr, clean_addr, 16);
+            tcg_gen_qemu_st_i128(zero128, clean_addr, mem_index, mop);
         }
+        tcg_temp_free_i128(zero128);
     }
 
     if (index != 0) {
diff --git a/tests/tcg/aarch64/mte-7.c b/tests/tcg/aarch64/mte-7.c
index a981de62d4..04974f9ebb 100644
--- a/tests/tcg/aarch64/mte-7.c
+++ b/tests/tcg/aarch64/mte-7.c
@@ -19,8 +19,7 @@ int main(int ac, char **av)
     p = (void *)((unsigned long)p | (1ul << 56));
 
     /* Store tag in sequential granules. */
-    asm("stg %0, [%0]" : : "r"(p + 0x0ff0));
-    asm("stg %0, [%0]" : : "r"(p + 0x1000));
+    asm("stz2g %0, [%0]" : : "r"(p + 0x0ff0));
 
     /*
      * Perform an unaligned store with tag 1 crossing the pages.
-- 
2.34.1

