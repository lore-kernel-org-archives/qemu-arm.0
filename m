Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp206721wrv;
        Fri, 26 Jul 2019 10:50:40 -0700 (PDT)
X-Received: by 2002:a65:55c7:: with SMTP id k7mr61523739pgs.305.1564163439814;
        Fri, 26 Jul 2019 10:50:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163439; cv=none;
        d=google.com; s=arc-20160816;
        b=zS1pQU0/Kg/E7HaWKEFcTpEDJRGKXExxHUTVukdqQIZgZJI8IdORQy0C34uYJ3B6Bp
         dG9n4G/omDeeoFk06/q1j/7u50d/qqtpmAi3KNsSZgNH2ZcHp/uSwWnuKLyybt74SpCW
         mOSl7Z0XVvU9NMI23wk+eis/HUp9yrUNz66l/lCCHAMlzCo+wRH8ovbzB/u5HZiXNTxZ
         D6LUfX/ZzYEvLOPgHMGgQeJYorUQzTcCgoKeCiE6tJARs5h+qFQ2HMLr2Kk10UNTnQ6b
         k0R9vDycSc5Lwfhwidw1UiTmI4N1WI876i+uHJN661TleEaoiAjN7P9ngW13FV5m7So/
         7sHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=hX3AW17o2PIgWW1hwgb4F4i9rjNSXrxFa91FWtRbpGo=;
        b=K+8vSAMAFptwRoMP1YoZja8LElAJZoIjevvpqyE3k8oT+qYefR1V2Re+JXpW6Z2/M6
         Yeo/f+YpAB8O7/MPujQHfNiXMhKtxPDPPOyZC9jafR8Z7X45W7PMvkyv0hjFsar/2uXR
         QquQaFrlE6nlSshYLzb6q5jTLNDlbxss8b+jUMwpJU8jzzJujaQpL1EdzAn7f98xWDG9
         qc9Dizekd7c4KxAo9HgzQn18QRaIAafA/wTopnNH+HQ0StJXRWZ6RBhs8p3tbZtVvFcS
         bNwOdEz5v0dQMpJ0kxkxc5JO2atJBNxvDHXwVSlxOXnR/OLzpBZb4i0kaEIxbqUen9py
         m+/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gLloNoZO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h90sor64763274plb.26.2019.07.26.10.50.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:50:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gLloNoZO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hX3AW17o2PIgWW1hwgb4F4i9rjNSXrxFa91FWtRbpGo=;
        b=gLloNoZOxtLByK/MTAwGv6CqokWdIJ7gMXXF9egTgTBWUsY6ZOo5ryePADqYcs71y4
         GEmlszug5YpaT4L+LTC6lFAofXr2J8Vnb1w+80oi8P0WfwcFBLeMN95dIr7IHKsSp5QU
         dXi5YcfuRUs3UvRJamcM+bSv72P9koioiekJg1/5gI+mzfdDCHLJA7KIMvDbC2IOAhI4
         ldJRiPTDMBoynB2mBsKBu+y79Ro2DUABd4M2m6s2K3TceLQh2f9FVJOiWcwfYUl2qIf6
         KDE4rvwKc78uHf8ygfhD+xBBpBDuTbFiYKSVZkKRiC0FmGRgHkHcSnmVBH/tl6nwonq8
         vWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hX3AW17o2PIgWW1hwgb4F4i9rjNSXrxFa91FWtRbpGo=;
        b=lMzDuTIYhoWcd/IcPrdvDSJcLVi4UWNAo1SPk2cNU1aWwOJyJ/wxXol4jjhBeD/6zD
         jO+lAa/EDyqW1A+dtjCtEe59O0+hbwpV0AIp3Hv+4F4zWgrelrzUb2fuQ2ipbfjdl5yn
         htKQw/u3vX2kejbHAzxJ6aDP4F9MAfUdscQL1ThMW2WKlCWUv3e83RanVjnYkn2XnTNE
         zxYUOCB/nd7acyK11E7ABgmz3zklDsCFNCNExINaTLbfyLXpLVY1xN68r19XcVuqU2h2
         VYC8et0t3f4mxFXF+Wq7J8lLW0ZCRepiCOF+jSJg19sqJFZNI10HqFl1thbEcFCXzueg
         L5ig==
X-Gm-Message-State: APjAAAV0W21dOGmgxeWoqrud2h7v+98N8zEmammF4y+qcQlqIOCnWD+l
	kBFhXXkXSAt9kh8wbt/DvOoIXkQO
X-Google-Smtp-Source: APXvYqz/OoR1VHD8vyYiMB/yal0X+HBsVEoIEs9z2KKuafOWq7xy8mxS8eP4/Fsp4gntkB9nr0RnFQ==
X-Received: by 2002:a17:902:2ac8:: with SMTP id j66mr93064289plb.273.1564163439414;
        Fri, 26 Jul 2019 10:50:39 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.50.38
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:50:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 04/67] target/arm: Remove offset argument to gen_exception_internal_insn
Date: Fri, 26 Jul 2019 10:49:29 -0700
Message-Id: <20190726175032.6769-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: epEGLUT2ACyn

The actual argument is 0 for all callers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 19b126d4f3..0848fb933a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1239,10 +1239,10 @@ static inline void gen_smc(DisasContext *s)
     s->base.is_jmp = DISAS_SMC;
 }
 
-static void gen_exception_internal_insn(DisasContext *s, int offset, int excp)
+static void gen_exception_internal_insn(DisasContext *s, int excp)
 {
     gen_set_condexec(s);
-    gen_set_pc_im(s, s->pc - offset);
+    gen_set_pc_im(s, s->pc);
     gen_exception_internal(excp);
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -1294,7 +1294,7 @@ static inline void gen_hlt(DisasContext *s, int imm)
         s->current_el != 0 &&
 #endif
         (imm == (s->thumb ? 0x3c : 0xf000))) {
-        gen_exception_internal_insn(s, 0, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, EXCP_SEMIHOST);
         return;
     }
 
@@ -11984,7 +11984,7 @@ static bool arm_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
         /* End the TB early; it's likely not going to be executed */
         dc->base.is_jmp = DISAS_TOO_MANY;
     } else {
-        gen_exception_internal_insn(dc, 0, EXCP_DEBUG);
+        gen_exception_internal_insn(dc, EXCP_DEBUG);
         /* The address covered by the breakpoint must be
            included in [tb->pc, tb->pc + tb->size) in order
            to for it to be properly cleared -- thus we
-- 
2.17.1
