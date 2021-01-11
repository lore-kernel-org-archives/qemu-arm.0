Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2917817lfq;
        Mon, 11 Jan 2021 11:02:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQPSJV9+SjUBQ7FayfqsP0g8sgzb236duvMZWQjok4eLYPk8OahKvBa6oF4jMrHE4+hIm3
X-Received: by 2002:a25:d0cf:: with SMTP id h198mr1790604ybg.384.1610391745756;
        Mon, 11 Jan 2021 11:02:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610391745; cv=none;
        d=google.com; s=arc-20160816;
        b=VPBW1dTvcsQ3GVOc46WlCi+C9MHIBPDtWR6uJe2Vdo+Q70szQnUELmEdMeCiE4yg2n
         4klSjJQEzux/A+HOKtakgcyXoZMklQMAvZiq+ZdQkp5PF/Y1qLp96sLlXAEHfkSn81mk
         5lDUvgFPRMm1AABxRl+TxGeOyK+X1W9CPVF5Iz/SxSVpkjBjwFm2xW+v8TUuCZOFX9HZ
         8s4xru9yWUGHuDyZqE1Z8hypno+9vSRSf4W5Nr9Y5uGf4OhBhcGWbfl/R8eIzZQqdqQb
         g2wVJOGYrk42H5rnvxUhPtolyPscMKxo9OiD+gXKkuicwRhKVWLcB2T5IkAy8L8RGDa7
         2Akg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+W6xF9BlSZ0veTM9KZDcL7jHpIjRPVY9kjtTlwGlZ0M=;
        b=GDFF7xsGHQ61VV7RjQufyjM+k6N/vnm9I1rrc5d7HpZ7w0Vg0ObV3BB79oC5H7SOZc
         o3J6lS/ke6PcfDXtt1YJV5JRM/oVVQiio9dzJGcnnkFH4LFybxjMY5ZOI0MgSH+K32z/
         Mjh5eFw/RkNLVPS/la9ekArz5xeE+WE/UXwLwS8Z93fX5FGwNHhHHtWOdEfMylwtvAT6
         dpudX4iRUnD+1bxkgmArSc/ss7RIneb/1+Q07yyW5/p0FcAt9FZ9a8WHmXklFrJ66Cnj
         kkYeDKr5i1B8NNXi7fL4AA0fg1lg3PjUWAWTqCtX41C6vdm8iOA6cPhPb8Fw6Rp0DlS0
         q3+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JxfD0fC1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8si577768ybr.265.2021.01.11.11.02.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 11:02:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JxfD0fC1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz2SP-0006Fw-37
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 14:02:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2RP-0005gN-8I
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 14:01:23 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:38361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2RN-0006Mv-7f
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 14:01:22 -0500
Received: by mail-pj1-x1035.google.com with SMTP id j13so102637pjz.3
 for <qemu-arm@nongnu.org>; Mon, 11 Jan 2021 11:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+W6xF9BlSZ0veTM9KZDcL7jHpIjRPVY9kjtTlwGlZ0M=;
 b=JxfD0fC1AGe/Scuvi00ucHUFMSFQBMfGuuHGNG9umnt4bKy0EzUM/LSpN9+mFPGvp/
 8jafBDdWC6ijhrPTwJBxFFyJQwM/c9VCotR5fBiW8Bl9VrAwWLtCIOZ75SmxBOIRtmkJ
 ANXx7OO0A89AouZkmEmD3KnNlJiPzNygtVgKWOfaUqc6Rt/czqdFwpSl7xeUb7cwbtyb
 merjP1I6RdHXK5sPIpgqb418XhJb7Cwu6nQDhHiiG708MXGEcKuKuW/m1S06FCKAF9pG
 SNPPgf3O/iRPDDWdlp5WcBBVOuMH0gilQSKqOkirbG7JO9EeDKUebmOiE6uu8mj1K0xx
 OtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+W6xF9BlSZ0veTM9KZDcL7jHpIjRPVY9kjtTlwGlZ0M=;
 b=VMD1pgnv8XYlD6K5UnXbBCgJT6IcN7i4HJxaVyNp2EkJbs+3RMDC+63CttdW+3NB4W
 eojpvtmTQ1hjfzvyVPQMD2ogIazjgjZka5PbLj3e1Ad9YlOd+yxmG3C7bNM4eeM7lqaS
 dvArh8zPm7FJSE1vCT0J9khvWjwu4vMIC217lKV6J8WVEfeFJZ2dms8NXt+DNSDxtWJj
 4JmbTbgt19YM2Jfv3qYove3K8vl8mqA6mqfAW+Q6wq3ix7UOqhxH/JLMFqbFQIbbFg5+
 VDpEe0XjXuZMMqcd7anJsv0JV7dgYt803dHl1f+OR1dq7mHsMU/RWdVHkiU9CvIbgqw5
 t7JA==
X-Gm-Message-State: AOAM531xy2GCgXJ7ejc+sM3wai3Mfx8DRHb+KNXSu+H0DsvLSRK62rrG
 JXv+Dos1lrmSOq0fhqjMIzARQA==
X-Received: by 2002:a17:90a:674c:: with SMTP id
 c12mr302602pjm.98.1610391679789; 
 Mon, 11 Jan 2021 11:01:19 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/30] target/arm: Rename TBFLAG_A32, SCTLR_B
Date: Mon, 11 Jan 2021 09:00:45 -1000
Message-Id: <20210111190113.303726-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-TUID: NFBHJW0z5n15

We're about to rearrange the macro expansion surrounding tbflags,
and this field name will be expanded using the bit definition of
the same name, resulting in a token pasting error.

So SCTLR_B -> SCTLR__B in the 3 uses, and document it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       | 2 +-
 target/arm/helper.c    | 2 +-
 target/arm/translate.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7e6c881a7e..aa0bc6e281 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3293,7 +3293,7 @@ FIELD(TBFLAG_A32, VECSTRIDE, 12, 2)     /* Not cached. */
  */
 FIELD(TBFLAG_A32, XSCALE_CPAR, 12, 2)
 FIELD(TBFLAG_A32, VFPEN, 14, 1)         /* Partially cached, minus FPEXC. */
-FIELD(TBFLAG_A32, SCTLR_B, 15, 1)
+FIELD(TBFLAG_A32, SCTLR__B, 15, 1)      /* Cannot overlap with SCTLR_B */
 FIELD(TBFLAG_A32, HSTR_ACTIVE, 16, 1)
 /*
  * Indicates whether cp register reads and writes by guest code should access
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d077dd9ef5..0d70b37adc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12762,7 +12762,7 @@ static uint32_t rebuild_hflags_common_32(CPUARMState *env, int fp_el,
     bool sctlr_b = arm_sctlr_b(env);
 
     if (sctlr_b) {
-        flags = FIELD_DP32(flags, TBFLAG_A32, SCTLR_B, 1);
+        flags = FIELD_DP32(flags, TBFLAG_A32, SCTLR__B, 1);
     }
     if (arm_cpu_data_is_big_endian_a32(env, sctlr_b)) {
         flags = FIELD_DP32(flags, TBFLAG_ANY, BE_DATA, 1);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index f5acd32e76..460476384c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8842,7 +8842,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
             FIELD_EX32(tb_flags, TBFLAG_ANY, BE_DATA) ? MO_BE : MO_LE;
         dc->debug_target_el =
             FIELD_EX32(tb_flags, TBFLAG_ANY, DEBUG_TARGET_EL);
-        dc->sctlr_b = FIELD_EX32(tb_flags, TBFLAG_A32, SCTLR_B);
+        dc->sctlr_b = FIELD_EX32(tb_flags, TBFLAG_A32, SCTLR__B);
         dc->hstr_active = FIELD_EX32(tb_flags, TBFLAG_A32, HSTR_ACTIVE);
         dc->ns = FIELD_EX32(tb_flags, TBFLAG_A32, NS);
         dc->vfp_enabled = FIELD_EX32(tb_flags, TBFLAG_A32, VFPEN);
-- 
2.25.1

