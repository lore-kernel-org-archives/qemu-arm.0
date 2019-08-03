Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2281559wrv;
        Sat, 3 Aug 2019 14:08:08 -0700 (PDT)
X-Received: by 2002:a17:902:9688:: with SMTP id n8mr134448031plp.227.1564866488700;
        Sat, 03 Aug 2019 14:08:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564866488; cv=none;
        d=google.com; s=arc-20160816;
        b=Mhp1uti1PFxVThiniKy+5Jd9vnoLTYOurzzZm3nzHfzVLEJTxqnMf7wZQThwiEX9tG
         rIVZfYQrSTke2aQEsjI2dM6WX9THm5lAozj3cC9XUIrW7Y9ci2eKvCl1QcAaPjYwRj9R
         X8MSeZO00MyTbRPw/c+rQqeMKTzzHWdNnYx/cNbkPP0K00zWK4ZkQF6VQmgetJi+MyM6
         ag0n3/1x4CoOtB9ihPtnlpAw6FbmzTZf36OM5N2Y/xfqKKGP473AHeZblDnJ5rrPfvGC
         AgwsZBwwwlyYBnfoKfvqXAnCVBjutuiOHUQizrrimnGLdpw8NapvGOqyBSouV1L//Eb4
         Ix3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=+x0WGSWw36fXqg8sJBr/e/px4PQ5p89CEe43iMHBL7I=;
        b=e94SAuYnDG5D/HCei0mCNr0NoRBlegUnvMHohasudgk4xpfAUdsoyg1uq/kRgYoo9G
         371twIBmytIOWXunQrY4IwI7KOdfg1X/pB/PAghaz87KYRFnl117RJcPC+IdGzqH6SXL
         JSdX+nibemjTsh9TJ5eBot8QkXjcok87mayCsfj4ftSwi4Sk7itqtm4d9/tXK+YUZBRg
         P+UFDRUQQcvpoRMiv2K6E748pXPVHzTqhyhCC+NbHZNa990fy/iUXDNbKwBl5pBTETv8
         RSOu+KDT8ekQph9mVdnQTmcQ/60c1W2LkLrJtxp4E52YgiTULug4vZE6NdruLUu+ZMfE
         rh+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cwcnxi5L;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s10sor14997790pjc.5.2019.08.03.14.08.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 14:08:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cwcnxi5L;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+x0WGSWw36fXqg8sJBr/e/px4PQ5p89CEe43iMHBL7I=;
        b=Cwcnxi5Ll9OoC5PykIu9TfQLHldwMsAvoEc5GYdHrv0oEpkGdUvSWDZOHssZzXVhSA
         ZwhC9Gh7AdPJde9++OK0GnIhE3yzaWgrAI7Z/Re9IIvsMm8PwOIpoO9qBU8sSy4S0nMS
         4jPbOD05A/lQ116UAkRA1qAe042pCBEOa9ey7y8RWftADpaZ+XcVZqCVXeKbsIEcfUib
         lsZv8Itprsc/qgMfYyBtYJmWuS9G9zMCLYm+f5GdXhfnNlRFsYX50Ok+lxHfjdZaL2Yg
         GvvXTJ+6V3nBSG29NGko2nj08Yn7bI6B7mGob9evEDVkRrrHMkUCEsNRR7JaB9ESvqNL
         CSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+x0WGSWw36fXqg8sJBr/e/px4PQ5p89CEe43iMHBL7I=;
        b=W29SRtamKgMIhiYEythAhjkmyk6JVmyGFvcREVwQty+KvI2ajg8Pu7eQF/t4F/4Otz
         aJAiDR3+r2gg4BOeytIUj1CBoXlXDB6p1E5EGnikFkTiTnNPIteQq8cwHaS7LapSwYYL
         lU994d7D0BxgJLOiT1txXn206e5u0vzc4OYfSjAP2J6W5PYpDTHFy1srJ5GYHyVs4rRp
         WAmjZBgtGGP0+d3IrhyAwD4NRCqbXHz3n6zwwqEJM1//0ROxGaxkPnggb+tngmT/ryE7
         R/aR3PBPdLkgvaxk9kB4Kt1eTOoUtmDKGgXDyD1gEAG+1a0sXq8qp8jO/Snw4dnRnwLV
         O1PQ==
X-Gm-Message-State: APjAAAXVAvTUYk8MQMRXQ/ahtuotWQRrKgwYSZHMCRbx7EUgl35y1Hix
	ze4gCOst05Xw/7403LnxLtuo5fU5
X-Google-Smtp-Source: APXvYqxWqqWPuBOLdRQc/hJXfPoBdGtaq4fiuoS0mDfuRQj9NKrBc2K0oy/9Xr5Ai6Lkek3SZ7VJxw==
X-Received: by 2002:a17:90a:5884:: with SMTP id j4mr11266253pji.142.1564866488176;
        Sat, 03 Aug 2019 14:08:08 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id x25sm110129644pfa.90.2019.08.03.14.08.07
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 14:08:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org,
	Dave.Martin@arm.com
Subject: [PATCH v7 1/6] linux-user/aarch64: Reset btype for signals
Date: Sat,  3 Aug 2019 14:07:58 -0700
Message-Id: <20190803210803.5701-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803210803.5701-1-richard.henderson@linaro.org>
References: <20190803210803.5701-1-richard.henderson@linaro.org>
X-TUID: GxgzCzT8vPzv

The kernel sets btype for the signal handler as if for a call.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index cd521ee42d..2c596a7088 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -506,10 +506,16 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
             + offsetof(struct target_rt_frame_record, tramp);
     }
     env->xregs[0] = usig;
-    env->xregs[31] = frame_addr;
     env->xregs[29] = frame_addr + fr_ofs;
-    env->pc = ka->_sa_handler;
     env->xregs[30] = return_addr;
+    env->xregs[31] = frame_addr;
+    env->pc = ka->_sa_handler;
+
+    /* Invoke the signal handler as if by indirect call.  */
+    if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
+        env->btype = 2;
+    }
+
     if (info) {
         tswap_siginfo(&frame->info, info);
         env->xregs[1] = frame_addr + offsetof(struct target_rt_sigframe, info);
-- 
2.17.1
