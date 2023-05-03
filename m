Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2657611ejm;
        Wed, 3 May 2023 00:19:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6LxaSDzZn3hjJmTIn1WJhXgJaS30fJg4Yc/BhMJ77iEU8PibYFWJZaW3xAX9sQzD14twFp
X-Received: by 2002:ad4:5c6d:0:b0:606:5103:9c98 with SMTP id i13-20020ad45c6d000000b0060651039c98mr9362117qvh.34.1683098398494;
        Wed, 03 May 2023 00:19:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683098398; cv=none;
        d=google.com; s=arc-20160816;
        b=ISLR6bwmeiC7SN615DcScjo0emDgY/WuaxnNnaMJX1OY8hgHn7MfBhhTVS4PyYCFnY
         VvaOFPZeKTfXTKEL/erZsrbfPV2+FQ84JkNlPZNp45TFBRGqcWryWTMPNNyEeYF0haY4
         VRD1jW5kOpa9LZPRhRxXpq3PpJ05kWdtlrfblPXmlm7dY7sIV1iSrp+CLYOZVadxNUZY
         KFMTJl+/ietZA9kN5pceXtEo5YjfkJGfAyFYqB7/rz0M2EbsdnXkHIrhL4spibeN8QQL
         Qk8A7NSfGgtqA+PMhb2ChiG82bjt0wgY2ANOmgL8X3bzxNCED9gsmesV8TJAGuVfpuH6
         nunA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8dOhNAZCA6lBCroa7XUF6EpxbAxZlxMP8g62cl8mX24=;
        b=Os7ZhAyVMWq7JgP2Uob2cyoJPjAnOpfkMrH9LddpBOzweWJoM51hujainUk+vV51zd
         ZAej3xBWZ3BYeOxCTaZDbj0h7tjz2ixAoYu2NbDUwb4WgLar7LHr7dAuWL7kqReYeuha
         P16VYLgwKcglUtWI0knRQpFO8vHiRuI6VcC8HoKJx6dm+O6tQ/g+ZHuAS2igNuZGyhQa
         Z1C+XjNkGQpQd6mZJ5qJN/fuRo1oIZlJJO3/zl9UEHvmONTp6ziU74mwu1etaJR5UN/w
         DKve6NfBuVthdewwu4xZvPHnwFWPSwWC+WLSwR1uADgwEeZX67wlOzHsUlDYIOnZHsaq
         5F3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j8mxuMsR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j20-20020ac85f94000000b003ef38288cd6si18925192qta.101.2023.05.03.00.19.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:19:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j8mxuMsR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pu6bf-0004CK-1M; Wed, 03 May 2023 03:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ap-0008La-2J
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:08:04 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aE-0005pl-P8
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:08:02 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f18dacd392so29593665e9.0
 for <qemu-arm@nongnu.org>; Wed, 03 May 2023 00:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097644; x=1685689644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8dOhNAZCA6lBCroa7XUF6EpxbAxZlxMP8g62cl8mX24=;
 b=j8mxuMsRornH4TXgd8vucrTFCuB7pnWF+a7hrNni1WjqJjx/VMpfYZp1vH1fQErl4U
 FRlMhJGuAlMrADkfp5oLNybcCQw9wjk7BIIw2voFD1iXGnFwTXS74Qm4kViJuDu8J0ye
 O+YOru42nVdTDkBVG6p1zteeEhZkY3TGdbOm0PgnbYbqNp2Gx39zT/dDtCYwRzbiPe03
 v9f34LA7LIxQaAphOXXIrQKKknd5XSPY1pe3HzrzZyG85RTj+hvd/lReCBfYLcDQzv3H
 fmuy43aMZNKgSbCnytXpIW/VFG1c6THaDftgVGp+gc+BKJsg+Kfpmo3woxxXcZgbvv+v
 yeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097644; x=1685689644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8dOhNAZCA6lBCroa7XUF6EpxbAxZlxMP8g62cl8mX24=;
 b=jXqWOxmb3XJLeWb/B6XBGisFvKZxdACYzBqE/P6Gx6SdOKUvoycx1Ki8fLtCMEZ3cO
 3HLZ1vsq1qBWu6XNzf3h2YgB4QOhGcI9C7tggGeAK+/4CiLK8x8hLA3WBwJK6rDU5Gol
 hUMAf4Ui/IfOP5SmRS5RsgzsgVKgR/Mt/aMK0djUp2FfMBJNly5Q//pVaZGhN5ZBouBs
 tGwebPYvC1jVLQR1duGCMeiPWv5+b7WtaoRlwlpXZSbkgEEZDEIFoIiSa2SwFiS8iMhA
 OwFbl7sO1G4WbkZ1+9ZxBjbzl9QCMja3lUMwrnc9/G5DjPTPvhAVk0H9Wre4Y1torIsh
 SY3w==
X-Gm-Message-State: AC+VfDx6Asy05NESpgzWBINDapi1Cu0umycgPELnuP+U4oM4feRXl4rM
 /T6zt3e3RSoXZ9d6zGk1eeQXyw==
X-Received: by 2002:a05:600c:2318:b0:3f1:72ec:400d with SMTP id
 24-20020a05600c231800b003f172ec400dmr13219593wmo.33.1683097644056; 
 Wed, 03 May 2023 00:07:24 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 35/57] accel/tcg: Remove helper_unaligned_{ld,st}
Date: Wed,  3 May 2023 08:06:34 +0100
Message-Id: <20230503070656.1746170-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: XIabBFZtdxU1

These functions are now unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-ldst.h |  6 ------
 accel/tcg/user-exec.c  | 10 ----------
 2 files changed, 16 deletions(-)

diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h
index 64f48e6990..7dd57013e9 100644
--- a/include/tcg/tcg-ldst.h
+++ b/include/tcg/tcg-ldst.h
@@ -60,10 +60,4 @@ void helper_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
 void helper_st16_mmu(CPUArchState *env, target_ulong addr, Int128 val,
                      MemOpIdx oi, uintptr_t retaddr);
 
-#ifdef CONFIG_USER_ONLY
-
-G_NORETURN void helper_unaligned_ld(CPUArchState *env, target_ulong addr);
-G_NORETURN void helper_unaligned_st(CPUArchState *env, target_ulong addr);
-
-#endif /* CONFIG_USER_ONLY */
 #endif /* TCG_LDST_H */
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 8f86254eb4..7b824dcde8 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -889,16 +889,6 @@ void page_reset_target_data(target_ulong start, target_ulong last) { }
 
 /* The softmmu versions of these helpers are in cputlb.c.  */
 
-void helper_unaligned_ld(CPUArchState *env, target_ulong addr)
-{
-    cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_LOAD, GETPC());
-}
-
-void helper_unaligned_st(CPUArchState *env, target_ulong addr)
-{
-    cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_STORE, GETPC());
-}
-
 static void *cpu_mmu_lookup(CPUArchState *env, abi_ptr addr,
                             MemOp mop, uintptr_t ra, MMUAccessType type)
 {
-- 
2.34.1

