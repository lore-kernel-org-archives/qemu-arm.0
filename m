Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp474723ocs;
        Sat, 1 Oct 2022 10:04:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4reLCrPHQyzSgAeCInfYwlHe5BSsCLfi+YPgxmY8S0+I5b+r12T+MPwwA89fJrkYKSxm5m
X-Received: by 2002:ac8:7e95:0:b0:35c:cd2c:c74c with SMTP id w21-20020ac87e95000000b0035ccd2cc74cmr11025378qtj.524.1664643878065;
        Sat, 01 Oct 2022 10:04:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664643878; cv=none;
        d=google.com; s=arc-20160816;
        b=e12bBAif0Eqj0L2cocCtTwROHY4IV1S8GQAh2b7bOGff8vyDQQFVjd4J7RdamePgVU
         0lPxn3+QQbXioq3uKOpXwXIXP3E9F+UQsIHQTWCXq/AnsHlpGZWjCngjT/EuNnXCUEYm
         0Ulhk9M/DjrIeN5EoQAxrFrqTe+MVlkT0zYxBRdh8aIsP1kDVZvNbkg7BRu9+/0+pngF
         J13s3WLqFivjKLErq3ZBoWk6u3ah9HOs7/k5ONUOc9t99kV9cRD6jvDj4H5ut/lp7iMg
         i37G9tDtg+N3I5cnwkiy8k9aB55s4li0SAiH3nmNHexlJNSOiYq6IxBizaLkWkBBXSVi
         BH/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iKmDVfGqOt9FVdwkjo2E3YIFL8ZFEk46sXJgTciBX1Q=;
        b=wIzQnzE+iHUgjTRTK5DKCAnNXvvKaJz40yK5JzPhG7jFtFndG6i0wcb4IscN9GOinR
         WGRQq8berfExH8XWAu3MDsU6WQsZYtUe/5IgCVg1ESNXY5StOQZXM93gaboGjRkaWJPk
         idjfjg8zmywYOMba4tFmPMZX7t57lpH0dwShOIlgDJzGgp7PJIYchAlv9ZE6EukZtef2
         cK+zrlyL6EeidA1JyE16PvsiJBbcepF11s7IYH5UC2NwEFYunBbgssLVAdqSMKKY1xqB
         v8SJ9j4YA95KNAbJqGmCqGL08hIAa/pU/2BAq/58MwiFWYPBmCGx13vYx/ApIFXUqqqv
         adQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WeqX6DrD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020a056214202800b004afa77bdb29si2925051qvf.585.2022.10.01.10.04.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Oct 2022 10:04:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WeqX6DrD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oefun-0001GC-M9
	for alex.bennee@linaro.org; Sat, 01 Oct 2022 13:04:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefLW-0008F7-5O
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:28:10 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:33377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefLU-00074r-Nu
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:28:09 -0400
Received: by mail-qt1-x834.google.com with SMTP id ay9so4363586qtb.0
 for <qemu-arm@nongnu.org>; Sat, 01 Oct 2022 09:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=iKmDVfGqOt9FVdwkjo2E3YIFL8ZFEk46sXJgTciBX1Q=;
 b=WeqX6DrD6GjetwekiLJvwL2oQP0X/CVIfAeIX/AnA4utc/2GL/R0RCSwNliLrrcvhv
 hCByEvsiGkFAHaNu5IDG1nfB5l55FH9AMan7bhHkh6Mg88lTvao2C2fHq9ONAgQ7wKRr
 VleA79+9N+DWDXtLAV1GkpwKFPmGbiWKVbyLQpSh/y0eLG5DiRu36JRvDcbmvqXOFR3i
 NXYfiekrT/0zYEvpVvMTIuD+t457LHe/qtLzDakmBlJToC6DjHHnGG1vwAnRh2/R8ksH
 eRXY1uHO/kPIt+OAaOAgfMQNWg+EbT+QwfR5kdCT46DSU6mmiirSf9JvwYnyhO0bDwwS
 vFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=iKmDVfGqOt9FVdwkjo2E3YIFL8ZFEk46sXJgTciBX1Q=;
 b=ygKO1ye3YAYqXfdqFmvciiIjACsbTz5RZub3WHRcJ7dOFNWLuC+oaBfZWkoMEmOPxV
 jaXIC31k1kYxbu61tZfLDckKH/ZOWin28YKF2D4/R74xrcIxulfEDJRv7ktYIiHjbv7b
 nc/ak2+o1TbGd2jnsA2xtDe4sQpztxsUG7Yh6kA9jD+BUtNEqiNCmzECrZ9qi3O0kurI
 Cn6rG/UfEU+iv6hX4CAXlgKqY/CmL+MfKJQuDpAL7OiCOD9dPUdxoiE5mV1UKRyaPdji
 d7b05JZ9yTWm3NxL9Xjm/xZARg9zTAqwvR6ARvzrAED8Mdeyo8/z3We7CUYxbPpevZ0x
 aLnQ==
X-Gm-Message-State: ACrzQf2RHfkQhL+bbwsCI0TUqYZMdvFc0OllOFEjrxIoZRfle7pIsu21
 wgIXhwL7ULSxApxaUFsT4XvW7AkECgX2tQ==
X-Received: by 2002:ac8:5909:0:b0:35b:ce5c:ed73 with SMTP id
 9-20020ac85909000000b0035bce5ced73mr10918232qty.635.1664641687726; 
 Sat, 01 Oct 2022 09:28:07 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 i19-20020a05620a249300b006b5e296452csm6403305qkn.54.2022.10.01.09.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:28:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v3 42/42] target/arm: Use the max page size in a 2-stage ptw
Date: Sat,  1 Oct 2022 09:23:18 -0700
Message-Id: <20221001162318.153420-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: gEiIfZBG/oZ7

We had only been reporting the stage2 page size.  This causes
problems if stage1 is using a larger page size (16k, 2M, etc),
but stage2 is using a smaller page size, because cputlb does
not set large_page_{addr,mask} properly.

Fix by using the max of the two page sizes.

Reported-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 14ab56d1b5..985a5703c3 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2550,7 +2550,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
                                    ARMMMUFaultInfo *fi)
 {
     hwaddr ipa;
-    int s1_prot;
+    int s1_prot, s1_lgpgsz;
     bool ret, ipa_secure, s2walk_secure;
     ARMCacheAttrs cacheattrs1;
     ARMMMUIdx s2_mmu_idx, s2_ptw_idx;
@@ -2592,6 +2592,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
      * Save the stage1 results so that we may merge prot and cacheattrs later.
      */
     s1_prot = result->f.prot;
+    s1_lgpgsz = result->f.lg_page_size;
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
@@ -2607,6 +2608,14 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
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

