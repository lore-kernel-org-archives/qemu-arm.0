Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1693626lfp;
        Sun, 19 Sep 2021 19:46:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOlfX+TeURmtvu2LO7Vnel27JyHZVZ/1wKvWEJ54/D6o+/fyRKBnr0rBdBsaKJQL79+eg1
X-Received: by 2002:a05:620a:179e:: with SMTP id ay30mr22185199qkb.333.1632106019395;
        Sun, 19 Sep 2021 19:46:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632106019; cv=none;
        d=google.com; s=arc-20160816;
        b=F2jxGFyfUZCoxiep3lyUe54J0mwBNCAqFZvb3ye7gOqEzQHLnODf8GeGs8fYFhcpeN
         nsDZRoNfjCQHVL2fpRQ40dO94SVI+m6P+RtFyohznQu90SC9OHuprdcNUt+k4hgLV9sn
         ZMbdJY25jjhRo4KDgV2vyCycmL/fpvyfW+xhFdw/TeSkY1oSNkJ1gcbf5670ylsGy/B5
         s6721ynWifpEZoBMC2x+fKW2YCJH7OdcfJfadnOGGfhvcJMamH98Zf381rNrNR4XcDfq
         BqtyOdLdX/AUbg8s9tX9vXUSPqAxD8c7219J1GW1a13Gob9ab0YvbHkRCF+vCRxsl94y
         VlDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CtQUY+VgkQT1rox5MwFOniOvDKV16giSUD56+x0u+Dc=;
        b=ucradxGat48tSCZtTeAT9HefbRFp1KXx6mBDSGzzBOTY9AIHJ+0MI9NgRz8rZ5Vt0u
         WITBeTw7JAEKyNe4Hss5hSJ+lgKAKAAL/0C6swSlUZuKWD3COiJjyYqlla28itww0VJ3
         1ZYtAAHs/GVOdMjdaYZU5J/OH3nYYiJ+lt3uuRESs/bgWOq5nAZURNEWhEcPFogeE6dV
         MMnvucrBVy5A2+3cYVOdsN6yK0la3aB6+GNdxx+grIh9B1OoPnwlcJQDIXxT/e2F4cvV
         lr4t368YV/2xg6KCTRhBw78eh9WON0WmHS3sqKrIMdLsawHxq4EhrgnQvdwbcf6nuGya
         MDDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jq+L2dnp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b9si3710934qtk.371.2021.09.19.19.46.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Sep 2021 19:46:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jq+L2dnp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mS9Kc-0006oy-R7
	for alex.bennee@linaro.org; Sun, 19 Sep 2021 22:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS9Iu-0005D7-RB
 for qemu-arm@nongnu.org; Sun, 19 Sep 2021 22:45:12 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:39872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS9Iq-0008CZ-NS
 for qemu-arm@nongnu.org; Sun, 19 Sep 2021 22:45:11 -0400
Received: by mail-pg1-x534.google.com with SMTP id g184so15855331pgc.6
 for <qemu-arm@nongnu.org>; Sun, 19 Sep 2021 19:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CtQUY+VgkQT1rox5MwFOniOvDKV16giSUD56+x0u+Dc=;
 b=jq+L2dnpHgrIK8wcRbWEzdX1zmYvJLjQfMVbUGR4wS88LLKplbSxzc4XWI6Aik9tJ1
 PH/bvimKg1PX70MeUorumde1SLeQgR7AmRRIjDxFihVrgnsHDg/8dAZBzByqroPcPJa1
 UH0cawgvVP3AUID2VAIcK0pAr7YYvzqyWu2cr9RDvTbmnE2Jench5Hur/ggt/6nnwExk
 9qWnipQvfkI+Kd3/7cTvJUg96W/2a5PO0XW6oDio2+RWdWB/4EBLIHApSV6Z9kTWC5cO
 a1kRrEdzysZS11olOY8N4Hra8SKhE+Aqaz8RtOwKdrIzbubzRRC61W+16bf+racCXJHB
 sGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CtQUY+VgkQT1rox5MwFOniOvDKV16giSUD56+x0u+Dc=;
 b=cvsqEy23+0KszA6pwX1qkbGQTT/2L1RYl8YIcRiOxAi0FfHDfTM6yy1YNLk1zJlRns
 85EtIg8yMby7gsdwSz+6k49xEF5Q4VjDX4/yHhG6GnrcYbMcD4CmUeepMVT7mng4Q+LB
 zarpIWmDkt7/Axoc9yhTRiXg6L4zgb0cADV4tv+wpOnTqao5L5XuRs5DortxVxHuympI
 gQqd4mIMC/jIr0qLqybwPcqKiLS78DGkSzhfw6C+wd6FB8p76NyDwhKuNN8yYezyRg3S
 hpn3pxtnYr+WVtCnFkKZntbr7dJ/0PSzxaZXg18Au4lpzXBxJPhimgh0Q56J4s0IVB7u
 Mkpg==
X-Gm-Message-State: AOAM531aVfQOjJlo5DGTPxOGr0s7DPxQ0L82blUfaeKESyvW0vaGra6o
 W+a9pkX+NSxYV9BGRFYqIGUb/A==
X-Received: by 2002:a65:6487:: with SMTP id e7mr21295360pgv.27.1632105907014; 
 Sun, 19 Sep 2021 19:45:07 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id fh3sm16164767pjb.8.2021.09.19.19.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 19:45:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/6] linux-user/aarch64: Handle EC_PCALIGNMENT
Date: Sun, 19 Sep 2021 19:44:59 -0700
Message-Id: <20210920024504.625965-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920024504.625965-1-richard.henderson@linaro.org>
References: <20210920024504.625965-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9yWYmnNWeBer

This will shortly be raised for execution with a misaligned pc.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 44 +++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 11e34cb100..6e03afb2bd 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -78,7 +78,7 @@
 void cpu_loop(CPUARMState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr, ec, fsc, si_code;
+    int trapnr, ec, fsc, si_sig, si_code;
     abi_long ret;
 
     for (;;) {
@@ -112,28 +112,38 @@ void cpu_loop(CPUARMState *env)
             break;
         case EXCP_PREFETCH_ABORT:
         case EXCP_DATA_ABORT:
-            /* We should only arrive here with EC in {DATAABORT, INSNABORT}. */
             ec = syn_get_ec(env->exception.syndrome);
-            assert(ec == EC_DATAABORT || ec == EC_INSNABORT);
-
-            /* Both EC have the same format for FSC, or close enough. */
-            fsc = extract32(env->exception.syndrome, 0, 6);
-            switch (fsc) {
-            case 0x04 ... 0x07: /* Translation fault, level {0-3} */
-                si_code = TARGET_SEGV_MAPERR;
+            switch (ec) {
+            case EC_DATAABORT:
+            case EC_INSNABORT:
+                /* Both EC have the same format for FSC, or close enough. */
+                fsc = extract32(env->exception.syndrome, 0, 6);
+                switch (fsc) {
+                case 0x04 ... 0x07: /* Translation fault, level {0-3} */
+                    si_sig = TARGET_SIGSEGV;
+                    si_code = TARGET_SEGV_MAPERR;
+                    break;
+                case 0x09 ... 0x0b: /* Access flag fault, level {1-3} */
+                case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
+                    si_sig = TARGET_SIGSEGV;
+                    si_code = TARGET_SEGV_ACCERR;
+                    break;
+                case 0x11: /* Synchronous Tag Check Fault */
+                    si_sig = TARGET_SIGSEGV;
+                    si_code = TARGET_SEGV_MTESERR;
+                    break;
+                default:
+                    g_assert_not_reached();
+                }
                 break;
-            case 0x09 ... 0x0b: /* Access flag fault, level {1-3} */
-            case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
-                si_code = TARGET_SEGV_ACCERR;
-                break;
-            case 0x11: /* Synchronous Tag Check Fault */
-                si_code = TARGET_SEGV_MTESERR;
+            case EC_PCALIGNMENT:
+                si_sig = TARGET_SIGBUS;
+                si_code = TARGET_BUS_ADRALN;
                 break;
             default:
                 g_assert_not_reached();
             }
-
-            force_sig_fault(TARGET_SIGSEGV, si_code, env->exception.vaddress);
+            force_sig_fault(si_sig, si_code, env->exception.vaddress);
             break;
         case EXCP_DEBUG:
         case EXCP_BKPT:
-- 
2.25.1

