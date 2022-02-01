Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp660836lfk;
        Tue, 1 Feb 2022 11:32:16 -0800 (PST)
X-Received: by 2002:a05:600c:a4c:: with SMTP id c12mr3093083wmq.48.1643743935954;
        Tue, 01 Feb 2022 11:32:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643743935; cv=none;
        d=google.com; s=arc-20160816;
        b=nGu/LCRVCtVULupf4fNrdMPNofPqbNCXMNjq8UcDnN9kEclrRK5/8ckcYUqE4Cn7q0
         YG9wK5VzUWkT2SMc6Vwp0Jg1wM1s/WFvKBWjeHU8s1Ty0iAkaBrYcXtj1iXt5qx5HBjc
         HiQp7e5p5NjdKeXnLlr1LFvy6kX1s9ovS/ysB3ZbzVK9ksUb1SsMpv+jWFtuY5xxqpPF
         f64Sr49SXP6b6UUym+QIF7h6oFXWP56Q0yfctkjYPyP6vrqpfLkQHxYPawWqEVdWQgGL
         qhFSpD3d7hf9XEpGsOhZLyXS6cle3wA/ndgy8GZpYWssMQKHMNFSSD8kDukQmuXi8/gr
         rtnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=49llGIcUTgJBFjwDsRuayXX0Chj7UB+qkc+tnZISWh0=;
        b=vgPryqPzSAtuIWiEZKRBMPkdQfE3saHaRSPzDSgwYMjwHiwzqh3o+g/PfH34+UK7/I
         WNYNd9FEnMLqcfDY9E92oeX91GCsbZ38DzD54YGXRqM/p4uTS2RMp+dsMgRKzfIVKprG
         ewASaN+aeNO8stb4MUEZ5Tqbi9J77A8eJ+chYKzcg9QFUZtsSAmJY5JGlNlRxeheRVvF
         2c8m/inFpbjaQ8C8SH1vSFtQbOugGBuhmSm960hKj+mIuCDX+zC9/I/S8ng9Z0Snk6gF
         g0KtXpREXASrJuGkiy/EKH9KHjeyTzXlmistAt1e6J3C0QjRgrTqxN4C/9aTXY2wf88z
         CVmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=txoqg5oD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g3sor1825107wmk.14.2022.02.01.11.32.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Feb 2022 11:32:15 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=txoqg5oD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=49llGIcUTgJBFjwDsRuayXX0Chj7UB+qkc+tnZISWh0=;
        b=txoqg5oDrlGlq/mxk692by0zNf7x04hs/CImsmQBZUYpyaRqAOgEdQ54JCJ5NnxLzM
         EeRDn78NG3OJRSrUlqMV3oiPoS5uFbDU4lnLQeBQwD0DJi88OToqnrKgi8X6yE3GNZoS
         wuyRXbe8MkXxzCtQ33idu433HfKQcFK+PcGmlfNDceZblTf1xcsWFk6GpBofOq19E1Vi
         JpBOgXPRa9mjfRPHzIPMyCgrGFGbkFVdJzvz6hznYxDyW44tEY+wtnlULq6RMLjvv4KF
         AXB3iKfBHQ/mtEDIaHfwJUUYn9+JTnjFdAqLtScH6OD/sBzvF9fkXypFeyvyoHPTtZyq
         Hp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=49llGIcUTgJBFjwDsRuayXX0Chj7UB+qkc+tnZISWh0=;
        b=sVUgff30vPuRPvRDYHbYq6imjYR9FUlVb0Qr/V/8XGK1dt5zOrZoEANTfZlADqLxWA
         QvmOrS6f1zRMHjWrazc881u2eNXWPqlAQf0uIj/1E3tWK2hbu3Lsuk702y4jBL2v/+Os
         wGlmeRYMfrhf7ErAe1nmwehfR/bfBJ2e648KyE5FFRZCseW4Pjr5GoO85nIyB6VH8j95
         h8B4L5Q9q9UQGy998849GH8z0FR7GHNTL2yC0qGQbFfwGpeuYBY4EMjyUEo3JjzKwy5i
         R/i6p5FGMDLmphXeDigwwhB8L+G8KkXkeKCH/f2uHEi0HHvPeXv1IXWeEUTTpEljZ2PZ
         fcNA==
X-Gm-Message-State: AOAM531MYtqciT4BwWAAf0d9AqKdCGxNc3OMkCEzxo+7aMcrDQWrGkWK
	RXx9R8bZ+xyL4brb6h2KWVdO+XjW
X-Google-Smtp-Source: ABdhPJzQ+XJO+XFICoSXHlMPnDTCGK3uU858CXKzljjZp9mdM9gW4hTKXKIX5dDblnDJEtQK1WXKsg==
X-Received: by 2002:a05:600c:3b25:: with SMTP id m37mr3082886wms.40.1643743935666;
        Tue, 01 Feb 2022 11:32:15 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id z5sm3491265wmp.10.2022.02.01.11.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 11:32:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 07/13] hw/intc/arm_gicv3_its: Avoid nested ifs in get_ite()
Date: Tue,  1 Feb 2022 19:32:01 +0000
Message-Id: <20220201193207.2771604-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201193207.2771604-1-peter.maydell@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Rr3SA82sylu5

The get_ite() code has some awkward nested if statements; clean
them up by returning early if the memory accesses fail.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 48eaf20a6c9..6975a349f62 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -197,20 +197,22 @@ static bool get_ite(GICv3ITSState *s, uint32_t eventid, const DTEntry *dte,
     hwaddr iteaddr = dte->ittaddr + eventid * ITS_ITT_ENTRY_SIZE;
 
     ite.itel = address_space_ldq_le(as, iteaddr, MEMTXATTRS_UNSPECIFIED, res);
+    if (*res != MEMTX_OK) {
+        return false;
+    }
 
-    if (*res == MEMTX_OK) {
-        ite.iteh = address_space_ldl_le(as, iteaddr + 8,
-                                        MEMTXATTRS_UNSPECIFIED, res);
+    ite.iteh = address_space_ldl_le(as, iteaddr + 8,
+                                    MEMTXATTRS_UNSPECIFIED, res);
+    if (*res != MEMTX_OK) {
+        return false;
+    }
 
-        if (*res == MEMTX_OK) {
-            if (FIELD_EX64(ite.itel, ITE_L, VALID)) {
-                int inttype = FIELD_EX64(ite.itel, ITE_L, INTTYPE);
-                if (inttype == ITE_INTTYPE_PHYSICAL) {
-                    *pIntid = FIELD_EX64(ite.itel, ITE_L, INTID);
-                    *icid = FIELD_EX64(ite.itel, ITE_L, ICID);
-                    status = true;
-                }
-            }
+    if (FIELD_EX64(ite.itel, ITE_L, VALID)) {
+        int inttype = FIELD_EX64(ite.itel, ITE_L, INTTYPE);
+        if (inttype == ITE_INTTYPE_PHYSICAL) {
+            *pIntid = FIELD_EX64(ite.itel, ITE_L, INTID);
+            *icid = FIELD_EX64(ite.itel, ITE_L, ICID);
+            status = true;
         }
     }
     return status;
-- 
2.25.1
