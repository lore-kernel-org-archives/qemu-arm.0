Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp180078njc;
        Thu, 18 Jul 2024 18:08:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXSx9nygq7z9dBGVCLB4nRe0RE+19f/OO7JmPwjaHxB/T5uMTOsLnsfo5obgJkYRHTxyItyHWV8hadkkKnHc3efscnRvgUF
X-Google-Smtp-Source: AGHT+IHwmG8Fwul68nZikeFbaWSE8t/Ruabp6Z8bipXeqGTatUeVkP3Bae+Rvx5Fy6amWE8PMUuy
X-Received: by 2002:a05:6902:1507:b0:e03:61e0:918a with SMTP id 3f1490d57ef6-e05feb0fa2bmr5704237276.26.1721351326508;
        Thu, 18 Jul 2024 18:08:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721351326; cv=none;
        d=google.com; s=arc-20160816;
        b=J2GgvHoI0ugFWDzAzBQ+ex2o2S/9k/u8QoDw2iNB9zYNZD2CJzcOhsApCCj690gcfy
         gCJw4f+q6buGGkRHt5pEXZZY817vatwa1z5sNhSxfTGTjJbTKtjEOhXx0KU93x5pr2Tv
         BE4j6U9+3I/E+CpdTuZXx5iHB0xDgWl/nfNhFLf9M1lkvY7q4tn10nU3/jBQ4f2TDPGs
         KED4iV1zcwWvg3J+P9h/9BQsQrSAIB93tKm05ZTvE5iFkj5uf2emmJWjmUa2V4gKMHbJ
         6hRdd/W2dEXAKzZ52XeD5tKoi4T3fDm0KgLJMlgxqF1WgSWhpobTeHQkyEChP71Wtf0H
         z7kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4bUXzTdrPbw6J9v+TJRzwWPTfmVGuUdx4HTdstgXW1M=;
        fh=PMD1cJf9IbYeK/VmAJgusCYc7DxmYIcIgC7fGquy+wg=;
        b=CCYmu6SdQxe+smuj/Z30SfJ9CR0fnEwlDUqSj+SEH4PATeaEJ8TQKZ7R2861PsLNLq
         MmCRouzRtux3tgkZt5eTOmko7HuEA/UALtzaJRUBKe7AZBb67DMTneAgE4VBLxb2qZED
         2+CzyWHFHRT6rGFfYx2ou/tOBPlbVZX26kS7pfRvoEPwWUfHvt4XhwpHxEBVmuo94ech
         SRJhZlIOkjaJPA0IoEjsZfgF5R8xdggJmjjYhgKi1/y4DV3KPv82QNymGtcmLmIxHEKq
         HtufmqNV29I66UHHqU5GKlbYp7nkHs4T85KSGftyJZV7dcQ8tTtG8+gg8kZMBLg9mzpT
         zkKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eHfOuBfx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b7ac9bb915si4042196d6.358.2024.07.18.18.08.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jul 2024 18:08:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eHfOuBfx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sUc6p-0006RP-Hk; Thu, 18 Jul 2024 21:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sUc6D-0003xJ-P4
 for qemu-arm@nongnu.org; Thu, 18 Jul 2024 21:07:53 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sUc6A-0000rZ-3G
 for qemu-arm@nongnu.org; Thu, 18 Jul 2024 21:07:51 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-6c5bcb8e8edso1062260a12.2
 for <qemu-arm@nongnu.org>; Thu, 18 Jul 2024 18:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721351263; x=1721956063; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4bUXzTdrPbw6J9v+TJRzwWPTfmVGuUdx4HTdstgXW1M=;
 b=eHfOuBfxlYFntoICqJAcXq1CW+YQXOKEnUwa+sy6LYJu+Ucy9vt/DVX6YtzJbciV78
 y2gY/yZ7m5p3rBbPDFqM/ySoXiTu9NvwNtns3t9bbjQH6VFUr4HsQ9ZMrakchGaX7pQp
 aVLAo7g4f26YvrEt2wH6RFZuyJhKNZo7h0eOFx8gf48wFt+KGvZHHKVIa+1em8g+HZwT
 p73tF9JayhQP+CnZQFGBIONL3UaljJZ9DRaRUjrALkzZ02xBKbBpy1s0C6YLKTLSosHe
 /1CFllgV+7pUuWSrejhDJc6tNjOua0X3iFtmuOckiBhp9EwlbOKwVhQufnthzSej79I9
 hJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721351263; x=1721956063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4bUXzTdrPbw6J9v+TJRzwWPTfmVGuUdx4HTdstgXW1M=;
 b=JdYqpw24D4i1w/bFkCQWkgVnjxFFoG64FyTtXFG5XSZkBj7xzhvTkKrMUPTa0ZatGb
 i4DoaQKzEZpujIEsVgAsx+x2tmc44X/eUrhAHVfXqWbsToOxVcLJ+ZYl18eBObWus7yP
 seyDkbKAE4JyCvAldoLzqh1g47xcTrNgJYDeMmLtRn+oeVuWQoHydgTYBfxDTrDccRtz
 lsDKcvJO4SlgOudfYTGSZCfcARrPoaIgMnN535DIEh2JfQUogO4IpSS88kMPYeZqR160
 mC9MD8a9p6Yo6+pREtPIS4+09uLjsUa6MDLEr8x5qmuBfEBulMHjOSggG/KDuCWlwloE
 FMIg==
X-Gm-Message-State: AOJu0YyHtEaQ2V5cw0ugiyQFpydjNTzjOjNJDxo0CxluYI2GRKjhSPIb
 vfLkRpcLqqmam6225tQwkAP78YkeMH0d4EQf+RLG//ke5v0q6AfaBeVOJhM3LAFgQabHCUDO+I3
 K6eiCtA==
X-Received: by 2002:a05:6a20:7f93:b0:1c0:f2ee:7dc0 with SMTP id
 adf61e73a8af0-1c3fdddca31mr7468239637.55.1721351263037; 
 Thu, 18 Jul 2024 18:07:43 -0700 (PDT)
Received: from stoup.. ([203.56.128.103]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fd64d07ad9sm2067415ad.177.2024.07.18.18.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 18:07:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 08/12] target/ppc: Improve helper_dcbz for user-only
Date: Fri, 19 Jul 2024 11:07:03 +1000
Message-ID: <20240719010707.1319675-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240719010707.1319675-1-richard.henderson@linaro.org>
References: <20240719010707.1319675-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: 37
X-Spam_score: 3.7
X-Spam_bar: +++
X-Spam_report: (3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: SrhsbgqXgSFL

Mark the reserve_addr check unlikely.  Use tlb_vaddr_to_host
instead of probe_write, relying on the memset itself to test
for page writability.  Use set/clear_helper_retaddr so that
we can properly unwind on segfault.

With this, a trivial loop around guest memset will spend
nearly 50% of runtime within helper_dcbz and host memset.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/mem_helper.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
index 24bae3b80c..953dd08d5d 100644
--- a/target/ppc/mem_helper.c
+++ b/target/ppc/mem_helper.c
@@ -280,20 +280,27 @@ static void dcbz_common(CPUPPCState *env, target_ulong addr,
     addr &= mask;
 
     /* Check reservation */
-    if ((env->reserve_addr & mask) == addr)  {
+    if (unlikely((env->reserve_addr & mask) == addr))  {
         env->reserve_addr = (target_ulong)-1ULL;
     }
 
     /* Try fast path translate */
+#ifdef CONFIG_USER_ONLY
+    haddr = tlb_vaddr_to_host(env, addr, MMU_DATA_STORE, mmu_idx);
+#else
     haddr = probe_write(env, addr, dcbz_size, mmu_idx, retaddr);
-    if (haddr) {
-        memset(haddr, 0, dcbz_size);
-    } else {
+    if (unlikely(!haddr)) {
         /* Slow path */
         for (int i = 0; i < dcbz_size; i += 8) {
             cpu_stq_mmuidx_ra(env, addr + i, 0, mmu_idx, retaddr);
         }
+        return;
     }
+#endif
+
+    set_helper_retaddr(retaddr);
+    memset(haddr, 0, dcbz_size);
+    clear_helper_retaddr();
 }
 
 void helper_dcbz(CPUPPCState *env, target_ulong addr, int mmu_idx)
-- 
2.43.0

