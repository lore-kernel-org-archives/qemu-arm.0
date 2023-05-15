Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6568350ejq;
        Mon, 15 May 2023 07:54:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7h0yo5SaT25bjEfSl5aAqDnnBRwq1fypVO2m9eGSgH6xPb2iE6464K06nkVUUMAysRE8X7
X-Received: by 2002:a05:6214:d05:b0:61b:637a:64df with SMTP id 5-20020a0562140d0500b0061b637a64dfmr46897407qvh.3.1684162455280;
        Mon, 15 May 2023 07:54:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684162455; cv=none;
        d=google.com; s=arc-20160816;
        b=PX0E8+n9Gn+qNNlweQPiEvJZB8vj+xgQojnYRSXqzKeIFWAbDfbsZAWaVNJzeYRcX+
         u4oit3Yhj/U9YoB58QyFw3CroOeIO0J8w9khYZ96gwb9pHa/WYjhlM583EK1PrTCNrqI
         y4ZEVka0DdXTyplBU+pOM2Rp5pzbooi/Rf/ftjOPyWih+NE0OgoBpuK+6I5nSPASQYXb
         oveezRC2YIw8ibGxLdJcBovYeaH2bBJqR4uS/JXVp7i2h8MUyvkyjIpgjybcysNrwVhY
         lj/mHHK56JtRyNvd1PckDVFtB/w0F6hQsJzINkJ+NP5S2no+pSaFfU5DwkBo1ooFM9In
         gjXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3QMQeFWwqcUFumXr1WKfxiG/Sk++Gp7SwpIzlewGlEA=;
        b=hwqhAF0cE9wlhF5YgwGroeZ18d8/a0cgsJn7jeHT283cr16dxkNQH1DbOlo2Fn9KEj
         9cXLEO7PfRwyS2b45Q7HfLNKNsWlkEq+Fq80IyIG/YYTzGGQx53gTsK71HU7b2N+sq6G
         1cLd2yNdoGqFpfvijCNrf+t7K/9wyYC8CCagN8yu7fB4aVYSAaSP/C0etu/0R144JEyB
         ABir9i4vk0t+5r8N1i7dlsntN0SPzaYLTf7WNDNYhF0lG+v7EMrWajBTKoSNCp+b4Vke
         1Inj1jJwBWic1fTsi+KiLvJt2uyEhrbVZ20+H/7pRrZQ50I8c9Ni5xcLeI79LhMspltp
         Gupg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vY8W9qv6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4-20020a056214194400b0062127360110si10745076qvk.411.2023.05.15.07.54.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 07:54:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vY8W9qv6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyZIh-0000i2-34; Mon, 15 May 2023 10:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHc-00074o-AN
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:34:47 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHV-00051b-6U
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:34:37 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1aaed87d8bdso90647665ad.3
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 07:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161220; x=1686753220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3QMQeFWwqcUFumXr1WKfxiG/Sk++Gp7SwpIzlewGlEA=;
 b=vY8W9qv6VVO3vZNzHxzp15ikXYAwSDUNLoUQKMp7UVlkIdNbXiPFWv9XW+nMGPnDYp
 n3QvtJ2ewT+qZzUEYdo2YXhxdOUHE34pgyqtXfHOCyrR0p7VCixtzy7/N5tl7BUlehA9
 NXY9o7qNJPDD/3led1syGVQmromMrN9w5GafoWJocAquyw7fsQatd0+9Fq3TrhF2AUc7
 9f9qHr0gDL8yqt6cjKoEJEWF76Cw//YKTf0YFxCwtupjvWwU5jDvsrAmcIHt2DuWbP3f
 Rl5iEPebCq6sKdTNd/GgfTBPoLczYsPHPW+wpM39pAxuH9yQn6u5us37TvUZHz+3AT9s
 ZLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161220; x=1686753220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3QMQeFWwqcUFumXr1WKfxiG/Sk++Gp7SwpIzlewGlEA=;
 b=Y2hVZZ5j1qp9F4popLfDkxzo2vmHRvbRjZnaJRDsTReCevDm1N+jNPIkwY9NCt7jSd
 FzIixOilxqZC7StB5nc8YHGb+Kn45Hz3M6MSfTkEq+Mp/cGxZFX+i5RMBWcpAG/JkOzO
 N/m+vNk/agUMcypHWaokeedCfwCJrjrdadUr5hXvIfzzqKpSDAzirDEKjRT8cyX+B8su
 3e0YtAsy/iRix3kF3TQh6HpP8up9xA/1wu6+a7xNYgSpvK0kifZBwWTk/qBVegVBJAXf
 ubJgBLHjWzQhvW4aGHhq+owzDo4nHUwiO78rAs3leh1Ks2yt8GPbkLCQpxyvu0xINkiT
 q17g==
X-Gm-Message-State: AC+VfDzNVboA2FE324vh43gEELjNwUlRbGEcVrTLF5uKhHF54yDIp8IL
 K/efVZAmO2mbri0o1jOijr9nnw==
X-Received: by 2002:a17:903:1249:b0:1ab:220a:9068 with SMTP id
 u9-20020a170903124900b001ab220a9068mr45238720plh.42.1684161220627; 
 Mon, 15 May 2023 07:33:40 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 30/54] accel/tcg: Remove helper_unaligned_{ld,st}
Date: Mon, 15 May 2023 07:32:49 -0700
Message-Id: <20230515143313.734053-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: MZMqlcJS9DR0

These functions are now unused.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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

