Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2707376ejb;
        Mon, 20 Feb 2023 15:28:42 -0800 (PST)
X-Google-Smtp-Source: AK7set8Cir9Qf1g5qHZ1zKe2+tGLOJhIIq6rQVSyj6dO10+8hjgBXfk+1eDjK4fYXFDL+PEqndqH
X-Received: by 2002:ad4:4ee4:0:b0:56e:9986:4fa9 with SMTP id dv4-20020ad44ee4000000b0056e99864fa9mr6520267qvb.7.1676935722712;
        Mon, 20 Feb 2023 15:28:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676935722; cv=none;
        d=google.com; s=arc-20160816;
        b=Z5aN5MbLicT/uwgYbazUgj56RqQ+8rSR4kc+uMhcyIUUOnGKOeOdzTY1OSsJbscWTp
         Ev/WHAsEIs0UGsRwrUMMjZy02H5QbES4qUAb8Xo1nHxNR24LiMj1E2Yy75J3R6y706q2
         LbhABFOcj02LXOH3GuDsNwF+waNi4D9qsdNSOaPqyukV63bwbcJQR6aG1AonzIRjPZdy
         L076kQzWea8Lq9JqTXANRi57y60xjhCyAKH4WNt4CCzP38O1LsIa6R6m180/ZgYmdfJk
         arLu+lr8Lu6M1uS6PW8aJ8EEl9GI0AwivsuCBX/ZDJDs8n1PcK6FlMs7VBElhEXx+XxO
         /lzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Z+JHhydbaosxqUvfvn4Z1EbkvskX2ro+PNfi5dyuur8=;
        b=bi/3WY/u/gaGXag47r92uZF3hcVLqGMlmrz784GYyhZG8XMa7qPHnhKhICg0h6OzfM
         Jp66zysyL3Jhx/7wfI8LN/lYANcpz72xfdWD1VyQul2ZLATV1nW6TfPY2u1SqVNoN1BP
         AwsTP15VNU5VNujc7ixh4h1B1HyYLHllcP9k7BV/dJRBnLzDCTavFeIrtvLyqQ7MEAPe
         wgt6EDZAlHBaT2Pt5c6QxvJX757od6icDupz7uyhaYw3X1V4D8OS/O5Nyuw5/JWZ1dwE
         5+R2nQxFpvxMasprQN4PFz9uyRsPPoQIsoVXeEaZa/Ta1cJTYYRskrqEf3SgackTVPrE
         IVoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iShDDGQE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7-20020a05620a254700b0071d9bff7703si11317758qko.329.2023.02.20.15.28.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 15:28:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iShDDGQE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUFYo-0004dF-W3; Mon, 20 Feb 2023 18:27:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYg-0004LJ-Fl
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:26:58 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYe-0000Ql-N4
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:26:58 -0500
Received: by mail-pl1-x62e.google.com with SMTP id l15so4272588pls.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 15:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z+JHhydbaosxqUvfvn4Z1EbkvskX2ro+PNfi5dyuur8=;
 b=iShDDGQEfJEYmQi1R7YjYxYit1A3Rd0HP10oApwqXWIITj9GEJk0CNj6Wyux5FP4Jk
 6puaMKIZYhkpTNqtPCkvX0YixG0EimoV88DdhWyyxCX4BiaImsfES1NOo+6jbYcq+v7f
 eH+gFn/bk2n5JJ9ZejikUToKmX79XN3esNHuUi9Ay1WYlaRQYCEMnb1aj9oMom6Wca/c
 CxMdeJYRl9wzc+jmMdg4DZrIEQlqxTYPoVGU4Tx9kGyNyQ4p631O7buLgfL26PQ18DX+
 yWMnq1GFk4n8a0UHIW5ZSKV972jY6qwQLk0zX2eaUs+yO3qgVM3u9wFosfM3eZnnkwS9
 xD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z+JHhydbaosxqUvfvn4Z1EbkvskX2ro+PNfi5dyuur8=;
 b=0BzzZtRiYDj1S5QpyjMpI0BTKnsmNfoEMD3/m9/r1tRJCWJ97F3V9U13bb55s0ZFJQ
 F/Zr8phtwPnyqMtrCQW53nB950Ax37ytlbxhuwX051S4uGGraXamyHO+pzPD5SJijd8I
 Ks1dc1SEJ1LSJV8OTzaTlDxv5haWm0EG4P7u/Z2vN1XQ1IP8Bbvn4/+CjZgJNkRCJW1G
 Ki6VvmTk0mdHVdF7WqC40pXskSROInBsGaLLZCa/vqXZthWap4OLfZaxTeqQ2kdu/cHy
 FOLM+FmAhjxtmL4XmZzSCBq/AUFkX0pDN263Md/Te0kfgNwBXM9D+xvNUCiY5FceXzGl
 BVXw==
X-Gm-Message-State: AO0yUKV2GF7fRXcIQ5+fHButIooAwsZ7ulYpsFm74uBzHvMY2FM1Rnd3
 b/hL4+b1gZhhmeRYp+dtYvrPmUNsN6CDxHkc8Mw=
X-Received: by 2002:a17:903:110c:b0:199:3683:5410 with SMTP id
 n12-20020a170903110c00b0019936835410mr6148568plh.50.1676935615402; 
 Mon, 20 Feb 2023 15:26:55 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902690a00b001992e74d058sm2665348plk.7.2023.02.20.15.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 15:26:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 16/21] target/arm: Use get_phys_addr_with_struct for stage2
Date: Mon, 20 Feb 2023 13:26:21 -1000
Message-Id: <20230220232626.429947-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220232626.429947-1-richard.henderson@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: k0Mt8Pcmp/vr

This fixes a bug in which we failed to initialize
the result attributes properly after the memset.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index d4027ce763..a797750f9b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -37,12 +37,6 @@ typedef struct S1Translate {
     void *out_host;
 } S1Translate;
 
-static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
-                               uint64_t address,
-                               MMUAccessType access_type,
-                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
-    __attribute__((nonnull));
-
 static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
                                       target_ulong address,
                                       MMUAccessType access_type,
@@ -2862,12 +2856,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
-    if (arm_feature(env, ARM_FEATURE_PMSA)) {
-        ret = get_phys_addr_pmsav8(env, ipa, access_type,
-                                   ptw->in_mmu_idx, is_secure, result, fi);
-    } else {
-        ret = get_phys_addr_lpae(env, ptw, ipa, access_type, result, fi);
-    }
+    ret = get_phys_addr_with_struct(env, ptw, ipa, access_type, result, fi);
     fi->s2addr = ipa;
 
     /* Combine the S1 and S2 perms.  */
-- 
2.34.1

