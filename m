Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1484996ejb;
        Mon, 7 Aug 2023 07:17:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFN41ydezbXjCDZrWD/DwfHLpTGTUQd9uBXDOpQ1vt+6oUE1CCMc5z4BUSFWx+coE5u32Az
X-Received: by 2002:a05:620a:19a7:b0:76c:c3e4:2088 with SMTP id bm39-20020a05620a19a700b0076cc3e42088mr10247534qkb.63.1691417860823;
        Mon, 07 Aug 2023 07:17:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691417860; cv=none;
        d=google.com; s=arc-20160816;
        b=WRyncA2Ba7h56MIvNKLi4jXpL9jwQbeKN/Z/gCj3CZ5wN9zlJomA9Yfh64/ZAgew6J
         LwudAikYEmH+aUqy6Vka8w8HIMXEJQ9Fgf6LiGcbNG5KCcyiEFRj2rQ0S9o4/jfJL887
         HLs2tjGs0OPGK817QJpLIKuiSv5mc4+qRZO8QH2XiCxXBlf2+6kHcP2bwWREXogCxDVx
         DIwNZ4pT0S+t9cevi4aKEhZCPJKGP0EzqCoT7uIjTtC3rZUaRbBPfP2wJ0C48o7glgfs
         UroH5SmK85F3Sw3Jtvzd7aM1ywZNZAPi1t6x3JuZjq7VPD4b7/wqdVmD5VvzC/vWw6MK
         +z9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=S38jOsOxbXZJPQo1Nn8IdqFJrWb3K/zbZSPVOOqu/8w=;
        fh=jvpdohKmRoZMO537s6xMKXXtj7EZws1LOMQI/oP4vXs=;
        b=ZyPLKrKtAMycCsbu9XZzgeKQakn97o2LMyILTJOZ8ziMoZKIN2KmdIb71LUhVHj8TK
         Kh4D3cTfMx5ejaLH91Qbg7eftrv/102EtcoBbqRl5f1GGnpoY/XgdGgJIyGtz4CPl8bR
         WEEm7Bh/gnmyNzw4nbNkPURGTqLMw54CQBO6VykTEN9zXiQl+GPJ+7SsQ9rgBPCvsh+N
         bDJ3V+jo4Jr35Z4s9m+7PbhA4J3wutElb/iVbXJzd7w1Meuqq9RHxSQ3v9aiHtkd/xh/
         HKQeBwiL9uIRhxDnzqZVbmJUmRIDDxlHcTIMDiGZTx2NpxVr6GXp6H78N2WVfJHn/XTl
         xt/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qrFYfcE1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ox11-20020a05620a828b00b0076cbcc231e9si4719261qkn.627.2023.08.07.07.17.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 07:17:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qrFYfcE1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qT12V-0002BI-MI; Mon, 07 Aug 2023 10:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT11A-0000Bb-Mm
 for qemu-devel@nongnu.org; Mon, 07 Aug 2023 10:15:34 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT114-0005UV-Ej
 for qemu-devel@nongnu.org; Mon, 07 Aug 2023 10:15:31 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3175d5ca8dbso3501542f8f.2
 for <qemu-devel@nongnu.org>; Mon, 07 Aug 2023 07:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691417722; x=1692022522;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=S38jOsOxbXZJPQo1Nn8IdqFJrWb3K/zbZSPVOOqu/8w=;
 b=qrFYfcE1+fvxA1Nd3TpHbscVnYPF1KANB64ZJ9it3VlB7e9TEH/n4A7+LI18XLHvOm
 FatuujXvNXsWsRkGqmqQiMkwcqXAea3JVCn/SamEgmzkRO/4xE3crNR2C9VmoXBvwcBF
 JKQfcg6/3N9WxeW80zuVnTHGM5ZL5vL24+cy+fFe7Zsmwmz5IXtDDo9qpBj2qoglcPoF
 w0SJqq8pOfca+fd8FSsLczXLeDiQSLk9y8sKNG6fQQ8jxjTLhp9aCarG/m1IdnEOvZn6
 31WbZNSsHSxg1WJJuGYFVl3UuyjbsmpF51Ga+7D8Tj00E4xdzAA9T8MsV+HQqJuOQktt
 xl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691417722; x=1692022522;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S38jOsOxbXZJPQo1Nn8IdqFJrWb3K/zbZSPVOOqu/8w=;
 b=gf56sCZEbs+uY1OurLTfyd9xJaWe9ULT02a1yQI76oH6sZ8LnXIUU6wiNsRwvnVX85
 DfFH9YQdmbrjROg89KwJfNLEOpE+bndo/X5AcOc6pdZ4ZWfXxG3Pwx0VFnifU/TquUyV
 CK6NRNFN/DL5M0kJMMDDiiYLJs95F+x+Pv1njth7FKNJ2Kl+DDd4Ijrk1GJNXS2xwgYm
 9oAwkckNOy6HZe7E9v18l1Eur8Or7vXb1srwKjGvaq3L7CkiDu+rM67jbqptSwoTPyn2
 WjDjmDaJL8gtcjAL3HGIrPG7Y9mCD59Ad9d4d+Nbmf+M6g9ucHf0BJfD/X2x4xWmBobE
 Gnuw==
X-Gm-Message-State: AOJu0YxeZFZqH5RSroAKV77oiviZKZbD6gQ1xcmz5HRUyYpwUtviHZaK
 flqETHV7GzSqKdmAPK7YiogTslaQzjut+TG4AdA=
X-Received: by 2002:adf:f204:0:b0:317:576c:285 with SMTP id
 p4-20020adff204000000b00317576c0285mr5638633wro.7.1691417722426; 
 Mon, 07 Aug 2023 07:15:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a05600c261400b003fe2ebf479fsm10835617wma.36.2023.08.07.07.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 07:15:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 11/15] target/arm/ptw: Drop S1Translate::out_secure
Date: Mon,  7 Aug 2023 15:15:10 +0100
Message-Id: <20230807141514.19075-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230807141514.19075-1-peter.maydell@linaro.org>
References: <20230807141514.19075-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: U/LEvuolTQfG

We only use S1Translate::out_secure in two places, where we are
setting up MemTxAttrs for a page table load. We can use
arm_space_is_secure(ptw->out_space) instead, which guarantees
that we're setting the MemTxAttrs secure and space fields
consistently, and allows us to drop the out_secure field in
S1Translate entirely.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 78bc679deef..312ccabe92e 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -63,7 +63,6 @@ typedef struct S1Translate {
      * Stage 2 is indicated by in_mmu_idx set to ARMMMUIdx_Stage2{,_S}.
      */
     bool in_s1_is_el0;
-    bool out_secure;
     bool out_rw;
     bool out_be;
     ARMSecuritySpace out_space;
@@ -553,7 +552,6 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         pte_attrs = s2.cacheattrs.attrs;
         ptw->out_host = NULL;
         ptw->out_rw = false;
-        ptw->out_secure = s2.f.attrs.secure;
         ptw->out_space = s2.f.attrs.space;
     } else {
 #ifdef CONFIG_TCG
@@ -572,7 +570,6 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         ptw->out_phys = full->phys_addr | (addr & ~TARGET_PAGE_MASK);
         ptw->out_rw = full->prot & PAGE_WRITE;
         pte_attrs = full->pte_attrs;
-        ptw->out_secure = full->attrs.secure;
         ptw->out_space = full->attrs.space;
 #else
         g_assert_not_reached();
@@ -630,8 +627,8 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, S1Translate *ptw,
     } else {
         /* Page tables are in MMIO. */
         MemTxAttrs attrs = {
-            .secure = ptw->out_secure,
             .space = ptw->out_space,
+            .secure = arm_space_is_secure(ptw->out_space),
         };
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
@@ -676,8 +673,8 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, S1Translate *ptw,
     } else {
         /* Page tables are in MMIO. */
         MemTxAttrs attrs = {
-            .secure = ptw->out_secure,
             .space = ptw->out_space,
+            .secure = arm_space_is_secure(ptw->out_space),
         };
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
-- 
2.34.1

