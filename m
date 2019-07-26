Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp206894wrv;
        Fri, 26 Jul 2019 10:50:48 -0700 (PDT)
X-Received: by 2002:a63:4f18:: with SMTP id d24mr16247891pgb.126.1564163448807;
        Fri, 26 Jul 2019 10:50:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163448; cv=none;
        d=google.com; s=arc-20160816;
        b=rdAwdjLwk8VVFc8Xs58PnabVjLNNK7LXruT6HxUZg/8FbCYbV9XVtc6g3WpGWkZMoa
         oE02f5d5E77bY/V7vYm4WjfwIEwhHOGLQQmEpcI8rLxeoTrFwIFBMUn8KU2/pNdvBH3e
         F5Y3JDFOFNw3QwLrGsGFargE6vWNe5F4GPO5fZib1/aA4HPVff6CcgI1GTD7i/yoXy/T
         y2eP0cQYw8U/L2aFD2ES1ut67vkl2JmHFxaK3tiAUBgTPxsf0Tr967dlqgZw98XUxH2n
         Gm0YSSmOoLWvMS8uIXrL8m9HdqjEthoHuHjndmPCb9qyaZUDQGxMP0Zxyhz4xhq1bxpx
         NJvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=nQkh2An2kFZsAIQLEJuPgVfqt44IAx9vqtUtFyE7/Qo=;
        b=UJkRe7giZ3ts1T6H60mg5OEKCkfwf3UPN1S/0hKieSErLu3dGS/2IIVBaN7hECjLXA
         +uHTZtLNTA5TyMF7Ed/JFHqw6fShwzOE7QGzxRmack1wiN8LrAAnKP8OVuKPX/LOSMbS
         /Qrd0cAqWs4sHt/g3M9yi4vcnnerMd0y+FwITGgfXXeFKtDWIux0GG1JpZaasmy/qVLb
         Eri1Ol7BhKDtvzLM7wJum74GNjnbtUnH0GSrnQ0wgCaE0UjRe1/vzDFqWqvlEPcKRxCP
         7IbA9HWL5/97lezP5qt6OPGVW/AbPew2lS0+HZtsVov/0K4JAr++cgXCGYpwFs1ru/nM
         QQqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nHLntBke;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o39sor64573576pjb.10.2019.07.26.10.50.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:50:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nHLntBke;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nQkh2An2kFZsAIQLEJuPgVfqt44IAx9vqtUtFyE7/Qo=;
        b=nHLntBkexNHKSWsXkmEB+IE2sg7znr577TTLhAa2uCifkD4yBhqMItocTfOLYc7eSg
         bNBDzDu0VhHCU3UnX0pVqWALgpBK/Cp1BTz9mEcn1RATqWNF2NlGAIT3KGGJ98y8HMlF
         ULMa8sV3oOzMrPKknF6yU9SLmx+aXECNG0s1leBp+3kpURqs+j+wBnwpOt1DbZ4Oz9go
         os4g/MTQXVloASFGIfbPuRtOgy2ufcTo5ZMA450lETtXaaH1JMhJd/H24AWfpLLIOxxf
         Lho9Hwd3SpN/FOQx6Zm6FJ6yZ/vOVJ/Qbz8JdTfYxZhyc4TDpzDlHza+9/JO7lZP6JVq
         BZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nQkh2An2kFZsAIQLEJuPgVfqt44IAx9vqtUtFyE7/Qo=;
        b=rtoefwoYNLhnmIsIYQkcXTvFCcYlXAIYGqJktWhe57xQX/6QvL0kz911u/0kXLj9v1
         E16pkyR6hMntVniH/mJD+bA+k3n6W1N4CBdR4tmiQeAnyL4kLWACRmefggRgD1zErcez
         ZV+INRSc0mz0/H/K5IP6gWG8s7dLpngySN8O6pPN81sSipx1jrLPlkNzJf3oZDsSXHjH
         lk0kbSiFbL7CWKVdITXs3cm78pAMT7/p0Bo3Dx58yLie+uqBYCm8ZMDDnSAwGtBBdCmk
         YFINMU63ffoBWObWByj+Iouu2Wx66cUwkEeOfXgMkELP8D/3vcjyD/+6/EjE3HlI7HcZ
         EJMg==
X-Gm-Message-State: APjAAAWfCotPXJOjeAQHhh4Axk5+mdA+SdkM+5MmwQ8tivK8fei32/cU
	VwbhcFGTZLfccabahKPTC2GR8H9wVsmmNA==
X-Google-Smtp-Source: APXvYqzb/RrE3v/cVejadmuj0wfOat1ZbaVTsjgfv5aO/STGnfdsTORa7sgGJCktsvw5B10t9hHb2Q==
X-Received: by 2002:a17:90a:b903:: with SMTP id p3mr97691321pjr.79.1564163448309;
        Fri, 26 Jul 2019 10:50:48 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.50.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:50:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 12/67] target/arm: Introduce gen_illegal_op
Date: Fri, 26 Jul 2019 10:49:37 -0700
Message-Id: <20190726175032.6769-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: Ef/RQJtY7bXB

Unify the code sequence for generating an illegal opcode exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c |  3 +--
 target/arm/translate.c         | 21 +++++++++++----------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 4066b2febf..1b08930649 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -108,8 +108,7 @@ static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
 
     if (!s->vfp_enabled && !ignore_vfp_enabled) {
         assert(!arm_dc_feature(s, ARM_FEATURE_M));
-        gen_exception_insn(s, EXCP_UDEF, syn_uncategorized(),
-                           default_exception_el(s));
+        gen_illegal_op(s);
         return false;
     }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4738b91957..0f21ee9ce7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1279,6 +1279,12 @@ static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
+static void gen_illegal_op(DisasContext *s)
+{
+    gen_exception_insn(s, EXCP_UDEF, syn_uncategorized(),
+                       default_exception_el(s));
+}
+
 /* Force a TB lookup after an instruction that changes the CPU state.  */
 static inline void gen_lookup_tb(DisasContext *s)
 {
@@ -1309,8 +1315,7 @@ static inline void gen_hlt(DisasContext *s, int imm)
         return;
     }
 
-    gen_exception_insn(s, EXCP_UDEF, syn_uncategorized(),
-                       default_exception_el(s));
+    gen_illegal_op(s);
 }
 
 static inline void gen_add_data_offset(DisasContext *s, unsigned int insn,
@@ -7631,8 +7636,7 @@ static void gen_srs(DisasContext *s,
     }
 
     if (undef) {
-        gen_exception_insn(s, EXCP_UDEF, syn_uncategorized(),
-                           default_exception_el(s));
+        gen_illegal_op(s);
         return;
     }
 
@@ -9299,8 +9303,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             break;
         default:
         illegal_op:
-            gen_exception_insn(s, EXCP_UDEF, syn_uncategorized(),
-                               default_exception_el(s));
+            gen_illegal_op(s);
             break;
         }
     }
@@ -10990,8 +10993,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
     }
     return;
 illegal_op:
-    gen_exception_insn(s, EXCP_UDEF, syn_uncategorized(),
-                       default_exception_el(s));
+    gen_illegal_op(s);
 }
 
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
@@ -11816,8 +11818,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
     return;
 illegal_op:
 undef:
-    gen_exception_insn(s, EXCP_UDEF, syn_uncategorized(),
-                       default_exception_el(s));
+    gen_illegal_op(s);
 }
 
 static bool insn_crosses_page(CPUARMState *env, DisasContext *s)
-- 
2.17.1
