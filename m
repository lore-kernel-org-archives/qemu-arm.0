Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087695lfc;
        Thu, 12 Mar 2020 12:42:51 -0700 (PDT)
X-Received: by 2002:a17:902:6a88:: with SMTP id n8mr9293217plk.265.1584042171289;
        Thu, 12 Mar 2020 12:42:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042171; cv=none;
        d=google.com; s=arc-20160816;
        b=0xCu7Zszk7SnqOUPKiLpBJ58+O8FAPFcYTXSDGkC3DX0rfu81b3vnieKScP2kdtYyF
         ofijaQ6uiVlWtFUzE7bMEyU+a2JoFMMocEHnzbfShReyTuaQYALIW+lDsMahbcbLyGG1
         8rA8zEPyMTIiJ7ixaqvmbOWHW3khGSnvEdlY56s+Rk1uGWfqN1qqTFXIq+8Zoxri+IW1
         51I5qJSAGk4MB6YBdF55rLp1nm4FArBNNy8mYHcpye7cv1zbdGJSyy3zobFakDRI+jl+
         OwKiWh03f2hdbwmp66SBbvUEmGAVrKlnTkylikPaQ+tffbCUMbQRSHT8SvZrDU2cBCZr
         OEJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Kqb/ekSCjd3NGP5caJeLUqYBI+D5wVD+00pKBar9ftg=;
        b=UK/9kOlEMTBE9zlIYKzJh64tlDV9qxRPLpFzZDiUibbhVcARhiFIVJUQeVysyKb9qu
         7TBOqloy1DkJMjW5NM+zt6BtCpmAYsZJ4Zt2oKK89ZWOwjG8aR3sEUg5cuoNvHG17wxb
         YMmy68oPzG8taTc7CRQxdXtVY3H/xvIb4HQU9jo+r5EIre+82uKLfoI32IFnWj2zOTU2
         +yKFo2d3j/+vgpwDnUNpsRE8BHFZk1U6oL/ExSKY6XeD+5Shy7oloCbq4iNL1Adin3xR
         /8WjV6t3+4cNvhqY6JY/9zMAHvPTM6A4nUJlnBsiWa+c6p40Yb1l2bEL6Oi7QIT3AHxH
         lJhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zyEfpJzC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id gx22sor6817552pjb.9.2020.03.12.12.42.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:42:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zyEfpJzC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kqb/ekSCjd3NGP5caJeLUqYBI+D5wVD+00pKBar9ftg=;
        b=zyEfpJzC8n0DGsJTLkFv4XBCHbl7Zo7VXBxw7FUjt7ig0XTgV0zZJtXk/twPg74NT5
         5cEvY/xbiDelwu4lgRDkdNvKtFBaO1ugk8iATZP0zKWiaFl7pCE337961lxalS6EfH0Q
         Z+q0Y8pfDuxPPwWXnOfVUsZujR8MTSUxnLoKpXiTXWKelldFLDB7aHHBTd6yKwHuqvth
         dB0qmlW1cOJ+jO2FI4zfFEOx+cLiZx/P5YQ/4KqM8WyD0i+yA61iHlUE1oNLtXsPCUlL
         M27efZ9wMZmM9ysa71WhsKYa4SOe0nDnXCKbrPfLLiCzl2Kk4JIwhv0xgg5HCebs+oyZ
         Zhkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kqb/ekSCjd3NGP5caJeLUqYBI+D5wVD+00pKBar9ftg=;
        b=h5FeckJ8SANsx+iCVFsno0TgHBYRobm+PYWS5czEEzmsKJJFmmdQVBnuxLnWCNt7My
         r4lgq4RLsuIDN12B5+CLZp6csLVu/KFLDDFYBFFCrw18yPTmdacmeNAQhEQMry7GQ/cn
         R5GGZqyZ04he9CX2eGmXsaroqWspTNhqJxOKVxYe87NWRI0k/MU1ruG2/r0/0IqXT3lc
         yQOdXwMDYOCG6cRVkZazh3DqKxGCB7JBkuoYl4fCtOgsyTtLZL9cY4tphCkiKCD3AIIX
         nhY16Ydq0NGt37v8+xEC9+N8dLLm/Z/eHKk5bOWy//PZprXvgUqlvQDdPGkRrvPBkz/Z
         gJuw==
X-Gm-Message-State: ANhLgQ1MsklIzHM0+nwQRrz5EgbD6DQTUa/9vEODmU6SM1jibThpo4DK
	+ovwvUozG/cAIYVPMITUiLKa6k2VhJKFAg==
X-Google-Smtp-Source: ADFU+vtrnEhf0fLWU8QylZUW37j6GCE4vArUjqWs9aYbiiagDuVpeKYPlSQzx9kFmEanihj93RcDgw==
X-Received: by 2002:a17:902:7794:: with SMTP id o20mr9505928pll.312.1584042170835;
        Thu, 12 Mar 2020 12:42:50 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:42:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 22/42] target/arm: Move regime_tcr to internals.h
Date: Thu, 12 Mar 2020 12:41:59 -0700
Message-Id: <20200312194219.24406-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 0GWEchyIVTCd

We will shortly need this in mte_helper.c as well.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 9 +++++++++
 target/arm/helper.c    | 9 ---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index f091891312..56fb07f2b6 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -948,6 +948,15 @@ static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
 }
 
+/* Return the TCR controlling this translation regime */
+static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    if (mmu_idx == ARMMMUIdx_Stage2) {
+        return &env->cp15.vtcr_el2;
+    }
+    return &env->cp15.tcr_el[regime_el(env, mmu_idx)];
+}
+
 /* Return the FSR value for a debug exception (watchpoint, hardware
  * breakpoint or BKPT insn) targeting the specified exception level.
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2a50d4e9a2..e4b4366af7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9835,15 +9835,6 @@ static inline uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx,
 
 #endif /* !CONFIG_USER_ONLY */
 
-/* Return the TCR controlling this translation regime */
-static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    if (mmu_idx == ARMMMUIdx_Stage2) {
-        return &env->cp15.vtcr_el2;
-    }
-    return &env->cp15.tcr_el[regime_el(env, mmu_idx)];
-}
-
 /* Convert a possible stage1+2 MMU index into the appropriate
  * stage 1 MMU index
  */
-- 
2.20.1
