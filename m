Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1425153ejb;
        Tue, 14 Feb 2023 08:32:06 -0800 (PST)
X-Google-Smtp-Source: AK7set9bHnJHI5yDvuFBs20D+Rl/uEu9twKNQureCQ526v1BhDm5csGIpkJRGwuITr2DIn1yi44V
X-Received: by 2002:ac8:580f:0:b0:3ba:19e5:3e47 with SMTP id g15-20020ac8580f000000b003ba19e53e47mr5183968qtg.65.1676392326618;
        Tue, 14 Feb 2023 08:32:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676392326; cv=none;
        d=google.com; s=arc-20160816;
        b=SZpdzXTuMIGAymuYR3zBv2JvcJYOduPCY0+w/rg9Q4gZmEZrEuRK3Pdd+hw7ZvwzyQ
         nYFBktQbr6p6OnYpsqgK/xE9g0OLnXHqfsoPDHzvNMtSXA9fBvdboiLjFWN684MC7SZr
         0PU7BVlWjVpA2DhAKE9JsqoSc1WkTpVWz/Lv41a63rOmkMdTyIX5JRBwTH8KDB7OXLD5
         1IdMfODcGuaLEAsX9L816aTXyxKspOu3iJGyRomPKob3xZVOg/fh0NKJsZr22fm0bhra
         8g4K+NQt0yLBKedfUwrRRJtf2jgCwEKNXBeyzaRAYVJr3KrL5hhg7B6vh4Wg8jLjaK+1
         2SPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=O4L2aD/rteJmwpjNgOeST3MFgjCAfq0kho6AOw6LVxY=;
        b=qJr7ETT/8TEWXActhQ4DVubnVLmuVMUW3jET/kbDJ7aY8zD77H9hRiKy+BYXkPILkR
         2Bc3h61A46EN/kY/fr6x0IT/yxIhUTL3EZdQJiRHg7yWPHVAUhr0GDH3xk1tLqG7izwh
         sWODAt23GF4BW0XLlEF/z0HV6Q5bcyTr81sWDk1Vm5CQiZNKOtsKmdjZ2hibr4XN+PPi
         13JGpPhDcUYlS9uKhXof4v9ePUsv0zT7idKKl62CvzSu37AZxVV/HOPwDWJVPbgEyfY8
         tORRGmLFbWFp/x0Peb+QPjDtdexgcKogFt6rNquWyBYTZOIoJ/pbxXfagaJAasMKvTSI
         GboQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FNOu001b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l25-20020ac84599000000b003b9b60dd798si3106650qtn.761.2023.02.14.08.32.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Feb 2023 08:32:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FNOu001b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyD3-0006f0-E4; Tue, 14 Feb 2023 11:31:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCz-0006Xz-S2
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:31:09 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCy-0002At-4n
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:31:09 -0500
Received: by mail-pf1-x42f.google.com with SMTP id r3so5117261pfh.4
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O4L2aD/rteJmwpjNgOeST3MFgjCAfq0kho6AOw6LVxY=;
 b=FNOu001baRn9xqSHxQFP4GwVirZu96YX/ixq4QQuhAVb/JhOJDPCkEwRsmgNneYlYn
 0Yz9z8+etztjbDdKfEUfVraiWaSdki9nTnSDNUocFQjJltWPS9h/QO14unh2JGD4791H
 Mibh7RWSjcBI3nsdBDJyaYh6ZiBl05PXoIhh3xvNoteYtR1A9Ecmo+ws1mP4MpwwZmca
 5XAEb6tEpXkAF57FlBiFTAdx23xsUKameIrRgLhS/SYJVvd6pUikQ1fKmIsc0t4mww5B
 ANE+vRDrVM21SRy3hG3/p2vJTtAtsIJRLMTv7cWIFzO43Q5SPOFR9HQtF1deTs629CO7
 iWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O4L2aD/rteJmwpjNgOeST3MFgjCAfq0kho6AOw6LVxY=;
 b=qXFKIIMjy5Coquw+f0R+Np2UduRrLPWu/vtEbDJTorfeW5imq1VjEAMOnC6LXZqQQI
 7A8SoB53Glo1MouIObMxJw3D5j30Iw+gzTh4ClbCFSRA0ERMpUACoQpBa2+sV4/8wq2U
 Cgpq+VXU+rrrrgs7egwoKl17HJJs4kK1XNwtX6/J3E7857wxrVCZ7dbo+N12HhdYrUiz
 SfjFAEIlbfyStqTWAJHYYpixU94+wsqe8DoHRmS3zW+cwhSZEI1AhvJLQoX4b+JLaNSw
 npZi2dumpFsJCaQG537F98tqA0dvmk558t6p9wu6KaKXqx8UPYaKbIlhgOvQYv2JNZdx
 5Mdg==
X-Gm-Message-State: AO0yUKUrLqWD6BCrfvReqOVz5XxmzBA/4bWOGsyM91qWV5DGDujWnjhM
 EazD+g+70nEc5to/BbZRzLi1CphB1Lj6uJTQWAI=
X-Received: by 2002:a62:5b86:0:b0:5a8:5246:73eb with SMTP id
 p128-20020a625b86000000b005a8524673ebmr2621766pfb.33.1676392266680; 
 Tue, 14 Feb 2023 08:31:06 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 d17-20020aa78691000000b0058d99337381sm10337011pfo.172.2023.02.14.08.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 08:31:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 10/14] target/arm: Create pauth_ptr_mask
Date: Tue, 14 Feb 2023 06:30:44 -1000
Message-Id: <20230214163048.903964-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214163048.903964-1-richard.henderson@linaro.org>
References: <20230214163048.903964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
X-TUID: zUgOy7nG+Uxc

Keep the logic for pauth within pauth_helper.c, and expose
a helper function for use with the gdbstub pac extension.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h    | 10 ++++++++++
 target/arm/pauth_helper.c | 26 ++++++++++++++++++++++----
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index c98482561e..bb3983645d 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1364,6 +1364,16 @@ int exception_target_el(CPUARMState *env);
 bool arm_singlestep_active(CPUARMState *env);
 bool arm_generate_debug_exceptions(CPUARMState *env);
 
+/**
+ * pauth_ptr_mask:
+ * @env: cpu context
+ * @ptr: selects between TTBR0 and TTBR1
+ * @data: selects between TBI and TBID
+ *
+ * Return a mask of the bits of @ptr that contain the authentication code.
+ */
+uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data);
+
 /* Add the cpreg definitions for debug related system registers */
 void define_debug_regs(ARMCPU *cpu);
 
diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
index d0483bf051..20f347332d 100644
--- a/target/arm/pauth_helper.c
+++ b/target/arm/pauth_helper.c
@@ -339,14 +339,32 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
     return pac | ext | ptr;
 }
 
-static uint64_t pauth_original_ptr(uint64_t ptr, ARMVAParameters param)
+static uint64_t pauth_ptr_mask_internal(ARMVAParameters param)
 {
-    /* Note that bit 55 is used whether or not the regime has 2 ranges. */
-    uint64_t extfield = sextract64(ptr, 55, 1);
     int bot_pac_bit = 64 - param.tsz;
     int top_pac_bit = 64 - 8 * param.tbi;
 
-    return deposit64(ptr, bot_pac_bit, top_pac_bit - bot_pac_bit, extfield);
+    return MAKE_64BIT_MASK(bot_pac_bit, top_pac_bit - bot_pac_bit);
+}
+
+static uint64_t pauth_original_ptr(uint64_t ptr, ARMVAParameters param)
+{
+    uint64_t mask = pauth_ptr_mask_internal(param);
+
+    /* Note that bit 55 is used whether or not the regime has 2 ranges. */
+    if (extract64(ptr, 55, 1)) {
+        return ptr | mask;
+    } else {
+        return ptr & ~mask;
+    }
+}
+
+uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data)
+{
+    ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
+    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data);
+
+    return pauth_ptr_mask_internal(param);
 }
 
 static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
-- 
2.34.1

