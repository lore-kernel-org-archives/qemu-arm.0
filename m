Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp645601ejn;
        Thu, 20 Oct 2022 15:41:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4pBQe+GfR5b+MvJcL7wjM0WnyxwcqWlpcREi6d3fA4Idp7DthfxRWYtOxdj8croqFamXN+
X-Received: by 2002:ac8:5e52:0:b0:398:d206:bbb3 with SMTP id i18-20020ac85e52000000b00398d206bbb3mr13592269qtx.656.1666305696321;
        Thu, 20 Oct 2022 15:41:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666305696; cv=none;
        d=google.com; s=arc-20160816;
        b=TxfQRVkW2bTTpLXEAu4+iAVP+rktoYAbFhX2X/BIcm/SurKZHBZeNqQnMKiandfaJK
         WXeUp8jmvnPqalzhb2Vl9U0pooUkQNqiANAsQVA0BxLWu3oKWUjKpTfpRO54S2WJe9v2
         sSnQe/6A4sKNmyQwOz1kl5eAHWRP4aeoyuXHnnPyy0rVBxGsBA8gv6YI0RsNUWQ6TKP8
         kEgMTBwxj6cj1FJ08WbhuZVLNwy97UJouoPT1HFtqyvtUs6f6vUHAfsnxrdZ+OR0ZMkB
         4CdhCWaAg1lv/FTJwSB+rSusM4fAf7fsLztpiLLnnK2q9BYuHdCLUv5fI1QIG2rLAoq1
         MAPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/TRvaNvsxkIyI+6L2sKpSFAFlaxf212k23hAjvLhwT4=;
        b=co2tXAenL+3QtFnGqs6Nf4U4KceOqkIsj/WgLT5i5ZvkJQ9lPZQcJeoY/rXALGXlD5
         lT92nBHPyU4o2wuW2BJrw/F5sVkU5MmBTosv6ZbPqRVvHZcVA0cWWZPjZPIpVd+lU8Qr
         5laB2XsF0/RXssC9VKmPEZF0fAabuGbZ8+hS/ksOlQyZLAX8/t+Lq1g9r6qK4XG/4dID
         JMjUqS18IOA4Ia35Q8SU+obK8mlgGgOxHHv7q/V9HcZzrQDMerGN08+qKWZNkOaKazBM
         EuHy7oY1PXkqUEZtrd6edN5xjAA2gWQVtnIIRQFFKhsYykVg+XMNBSzGTydgZAHeOjYp
         BlaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l5y5Xj6Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gv10-20020a056214262a00b004b3d5499bfcsi12147285qvb.119.2022.10.20.15.41.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Oct 2022 15:41:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l5y5Xj6Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oleEJ-00085X-NI
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 18:41:35 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oleAF-0008WK-FX
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 18:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oleAC-0008RR-Nl
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 18:37:20 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oleA5-00012R-Nh
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 18:37:18 -0400
Received: by mail-pj1-x102d.google.com with SMTP id ez6so768659pjb.1
 for <qemu-arm@nongnu.org>; Thu, 20 Oct 2022 15:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/TRvaNvsxkIyI+6L2sKpSFAFlaxf212k23hAjvLhwT4=;
 b=l5y5Xj6QjYjejFuDIfDO3pzPlVOAyDhiJlLDTsdsqRR3/V5duR4ODLpXgmPq+mKBL1
 01hMO1cBdLZEnBhYOLQh4IfPZnQFz1rwRO9EVJA9fJ9GxWe0ljp5areZkXnQtbDUWUsR
 lsrJmJLzXzO0zp+GGQv5YoqGig22Wk5UqER2HsCNz2zfPlUKJlGNUJf5MiKAtuVuWEc4
 nTGyc/nDMP6dY1YHgl5Hjv2M0BA4E1htJ9AiZJhWRn8bhrgUTcG9erJs08M+7tK0Payd
 BkrmVAM6nH3C/6tsl2jxiG3m8jdfii1YEZ4OY3ORYoFLEGfrq1HMgo0FdyFp2UUc9wud
 F6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/TRvaNvsxkIyI+6L2sKpSFAFlaxf212k23hAjvLhwT4=;
 b=aGxDtxGzYP9XEMVv7Ehp5EDRD5qALMNi7jkouqWc25lFY7yR/olbPbRB3arYb9j8pz
 bfcfNoTvfZCdlvQDmS33tIbEK25Bnaa3vg3K9OrSa2voq/2lH5fFazK9A9lusLlVSfXk
 Zxtmo3MGs2kMCYx35xcipsgKJ9p7Hy3zu6o/o/IG3+ysOtAGkmHhCwCKjGjMk5CP1Msp
 S71qsqsw41moWxceZEoPlgRid0e00TeC0h2z7QMwKSGmFVqjk3yzQl5fZ9zwMzvHfoAm
 xSpvQDnsO9pO2AVOvv4sh1uJZCvyAzqMGJ9NJBj7fUYrQiw6Uc8Ul8jyCBB6zfIbyvKG
 UmDA==
X-Gm-Message-State: ACrzQf26UOEpJxNqgpBKvg+JJr8DKcrO/lT6sPKRBw8uadcU2EEIjwEv
 msCIdR9skcavf9WRzAXuLsEEOA==
X-Received: by 2002:a17:90a:d390:b0:20d:3b10:3811 with SMTP id
 q16-20020a17090ad39000b0020d3b103811mr54938873pju.211.1666305432956; 
 Thu, 20 Oct 2022 15:37:12 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 r10-20020aa7988a000000b0054cd16c9f6bsm13753841pfl.200.2022.10.20.15.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 15:37:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Marc Zyngier <maz@kernel.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 14/14] target/arm: Use the max page size in a 2-stage ptw
Date: Fri, 21 Oct 2022 08:35:48 +1000
Message-Id: <20221020223548.2310496-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020223548.2310496-1-richard.henderson@linaro.org>
References: <20221020223548.2310496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dUaQ3LpIQnor

We had only been reporting the stage2 page size.  This causes
problems if stage1 is using a larger page size (16k, 2M, etc),
but stage2 is using a smaller page size, because cputlb does
not set large_page_{addr,mask} properly.

Fix by using the max of the two page sizes.

Reported-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 1c1f0bfa1a..26aeea8507 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2589,7 +2589,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
                                    ARMMMUFaultInfo *fi)
 {
     hwaddr ipa;
-    int s1_prot;
+    int s1_prot, s1_lgpgsz;
     bool is_secure = ptw->in_secure;
     bool ret, ipa_secure, s2walk_secure;
     ARMCacheAttrs cacheattrs1;
@@ -2625,6 +2625,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
      * Save the stage1 results so that we may merge prot and cacheattrs later.
      */
     s1_prot = result->f.prot;
+    s1_lgpgsz = result->f.lg_page_size;
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
@@ -2639,6 +2640,14 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
         return ret;
     }
 
+    /*
+     * Use the maximum of the S1 & S2 page size, so that invalidation
+     * of pages > TARGET_PAGE_SIZE works correctly.
+     */
+    if (result->f.lg_page_size < s1_lgpgsz) {
+        result->f.lg_page_size = s1_lgpgsz;
+    }
+
     /* Combine the S1 and S2 cache attributes. */
     hcr = arm_hcr_el2_eff_secstate(env, is_secure);
     if (hcr & HCR_DC) {
-- 
2.34.1

