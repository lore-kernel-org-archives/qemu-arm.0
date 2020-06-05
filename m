Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2076247lfc;
        Thu, 4 Jun 2020 21:25:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHhhddsRzpINMcYFnGoLkK/xZiZ9dMxrDocVQtmKCy+owchJPIaLRMIAxdy6/eEYnhZm5J
X-Received: by 2002:a25:c484:: with SMTP id u126mr8851423ybf.211.1591331115706;
        Thu, 04 Jun 2020 21:25:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591331115; cv=none;
        d=google.com; s=arc-20160816;
        b=oEblTrkTGq43rPtU/kroVyWURHff7pPkxsITY2xWoxmHmypZzGIfmo8bE0vzdX0OaS
         OWPxizt00VkK+pI56hnrBrXfiG4aKVG+UgL6sbMIFKHXQxdECJvBvuFmILYEuqPcQmkJ
         y5ooqYZ/Qz8ymss0R2FSqcXBU1LehIPYZRiiLIZ09+tsTrkmBYptLWD++4WhQ7fGn7GF
         s3ZdNZ95WCFvETV91U3Zz0J7cjTuLvUhUHgmlHGiYdVlYGWVkBF8pyL0/JZbuziWe1Hn
         /3OQParn3f2pYir4L0VZoLdEHZPVstLiEpkIZNK+ZIyuzu9PD43NdHOpVjImcUSO9abd
         ulNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CDahIOixg8N2JHR7Ek8lGA826Cs5BmS4mXRyzAL5jqQ=;
        b=txttZLPinSxvbZFTFrtkgSQXrB+oc4RUH8f84KKyvrQQGEwENnNtIEiUldcA6PvQxC
         hL6BPz7VZtDbU0mmvFmJR3v880lyjp5DrwfECD3bo7i6QgBqMowKUk2wYlZYX95VOdVj
         yY4AvQqAEpMZW2RERYyVvdMrdHytxUkLnHGaBkAYsQ026P7Rfmm0GGWxjaTuOpO8PnEc
         mRRNmQQ07W4poBU2xLo1Zfo/Nq1vtvXfzJDLa6d9cJ8K9oCvfmvRbPxwlChRjXn1tVQ4
         elc+QZj/CuqUcD5TANyxOJEitdmsWvpQTDoq5TpXzWrMR/lmdMerI5QRiyz22W8Kx7Ic
         /FNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qzvmb+yr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p15si4301018ybk.86.2020.06.04.21.25.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 21:25:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qzvmb+yr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jh3ut-0002Fq-3Y
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 00:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jh3no-0004m6-KP
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 00:17:56 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:32894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jh3nn-0000mW-MM
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 00:17:56 -0400
Received: by mail-pf1-x444.google.com with SMTP id b201so4333001pfb.0
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2020 21:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CDahIOixg8N2JHR7Ek8lGA826Cs5BmS4mXRyzAL5jqQ=;
 b=Qzvmb+yr6V0rS9fXM7NM1NdR+u0oIf5AZbDsKcxKqGQtlvVdnkS9tfGiwMCoyvdY99
 taQ9wK2VfVc1+0Rk8wy0eTrK/oS6pizdvQbgLvTwL0WVP80PL8OlRNKC0aKpUnhaQIEy
 l1cTfvDQNbYGDLvEJfZcF1QdS7F0TwfffRpcBgHyAsY0PNLL5BP+pTJ2riG+3ygitnFq
 0NdYGj5hMpO+ktUHAu4R+on5nL5fxaqlHHSQuI0CNMEHG3kRuPYldQwhpI6HOPFh8jYM
 4fDyq3sD9eLNW/zmHR4pjAbw1ut+j5vVYgDaynY3J12HBNOAM7U2jZGvUq+eQuHgGNkJ
 IdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CDahIOixg8N2JHR7Ek8lGA826Cs5BmS4mXRyzAL5jqQ=;
 b=GybJjdBNE1e90SLRiHK/4HbJPxmj6dwxNFZMCGe85PSXSFsAbHWRsnu/cWT/VyRxyC
 WraanQzUF6amGcF7bMSBYm3CuIpXku6x+cxVW954ZOPxZEAXJEhIrzr+ioBbFlPQA00/
 hU9GRrDtLPxD7mQOIGBaXFGuW6DO8hwuA3yzFGk1KGXqnKazjVI7nVM97cQcufJl+Ddo
 jPRC4mS6F/ia8Uwcz6m4MYEYarFIJ3rrSF7sstpC/v6GDe/V/URhJ3OLwFO/d7eE89Zo
 eN1TCl+SArH0T7cXKFX5htEeImLOF9m6TAdUrDIw0gFxorHWkBBt9OLDZiM85gyNVJme
 f7tQ==
X-Gm-Message-State: AOAM532a12nSfALkzF1VnupVHUpcktTlkOnMvhZSjwVhc/KcA8Rql8bX
 dCpcpyOgulRRfSeF0JUE9yH2Tw==
X-Received: by 2002:aa7:84cc:: with SMTP id x12mr7437645pfn.235.1591330674397; 
 Thu, 04 Jun 2020 21:17:54 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id h15sm5440902pgl.12.2020.06.04.21.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 21:17:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/17] target/arm: Add allocation tag storage for user mode
Date: Thu,  4 Jun 2020 21:17:31 -0700
Message-Id: <20200605041733.415188-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200605041733.415188-1-richard.henderson@linaro.org>
References: <20200605041733.415188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4Yuz64OgSBAT

Use the now-saved PAGE_ANON and PAGE_TARGET_2 bits,
and the per-page saved data.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 835b6d1ded..0911cebd36 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -76,8 +76,33 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
                                    int tag_size, uintptr_t ra)
 {
 #ifdef CONFIG_USER_ONLY
-    /* Tag storage not implemented.  */
-    return NULL;
+    uint64_t clean_ptr = useronly_clean_ptr(ptr);
+    int flags = page_get_flags(clean_ptr);
+    uint8_t *tags;
+    uintptr_t index;
+
+    if (!(flags & (ptr_access == MMU_DATA_STORE ? PAGE_WRITE : PAGE_READ))) {
+        /* SIGSEGV */
+        arm_cpu_tlb_fill(env_cpu(env), ptr, ptr_size, ptr_access,
+                         ptr_mmu_idx, false, ra);
+        g_assert_not_reached();
+    }
+
+    /* Require both MAP_ANON and PROT_MTE for the page. */
+    if (!(flags & PAGE_ANON) || !(flags & PAGE_TARGET_2)) {
+        return NULL;
+    }
+
+    tags = page_get_target_data(clean_ptr);
+    if (tags == NULL) {
+        size_t alloc_size = TARGET_PAGE_SIZE >> (LOG2_TAG_GRANULE + 1);
+        tags = page_alloc_target_data(clean_ptr, alloc_size);
+        assert(tags != NULL);
+    }
+
+    index = extract32(ptr, LOG2_TAG_GRANULE + 1,
+                      TARGET_PAGE_BITS - LOG2_TAG_GRANULE - 1);
+    return tags + index;
 #else
     uintptr_t index;
     CPUIOTLBEntry *iotlbentry;
-- 
2.25.1

