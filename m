Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp105248wrp;
        Mon, 11 Feb 2019 15:56:34 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYUOCHMdVGBZFuEZpmLsjjZN2xqyI071eOt//sG8Bq1/PtvTwMPyTTz440q5bH7aS9m4BO5
X-Received: by 2002:a81:84d4:: with SMTP id u203mr632234ywf.363.1549929394025;
        Mon, 11 Feb 2019 15:56:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549929394; cv=none;
        d=google.com; s=arc-20160816;
        b=n2kWoXPNuRD7QTfx0Bd4xznkxAI6dVQ0h7DIm1law5geXp740YZjwd7Za2ypdmdIo7
         FcUFcNLqfQ0EhHFCbBhrUIshG9P7Jer2MJIXKgtpEs6/cOnf8AdkkdbxIEuojlz+f9R1
         wvk9+y7h5tusHj9o6H9/t9iFIhxfiF2cZRHP3cALKq8uYYyl57QOys3sEwZnvRYZnBk7
         0YkFlUObmPbGYbf3FUW028GPgDc7+rP27F1y/UraT8Y0rLkkpkYwoaHK3Hxugr/7pzsF
         /i1/Hr/ULtRWy/zKkt29tD8YjFs4r7PmRCWJt2qXhIyJkl+y6siaIXqm0nMGLoPgwMQ9
         jBow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Kmm2As5QErToKnAZtTaLla6p1MaYpNIuxtZbUjkLWnk=;
        b=VxJXcPHla4CwUW2Wll2dN+CriHKU1s9hciLi+QamXY5bG67wPnbTJkojD9oNEZ5H2G
         6jTkgCYbc3Lt6ZgqQiU1jHVfAU25h0MAeilY8BTJHCT73xuqY+wIA91uFdTDwhlhiLxI
         2B60Vvxgs2DniMq0KSVjfKg9CLRBRKc6NwlFtWybnnmx8v59qfqfm2yo7mlEkT/8PuYa
         20ekrg4GFDDUTY3/UWlT1mGyNUxEqbqv0OBgxU2pkcPdahScFo4IxLoyWSw2zeXRlZyQ
         89Rgq9QjuT+J4eFBXbAkELFoTTjx+yo1iLSS9mUhmsLD8ZChNodFyE35sthqNEYlYGSU
         FhXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZidENpA9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s203si4152086ywb.13.2019.02.11.15.56.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 15:56:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZidENpA9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58186 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtLRB-0007r8-E3
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 18:56:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOE-0005Mh-H0
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOC-0004YS-Bf
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:30 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:38898)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtLOC-0004Rq-3q
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:28 -0500
Received: by mail-pg1-x541.google.com with SMTP id g189so320901pgc.5
	for <qemu-arm@nongnu.org>; Mon, 11 Feb 2019 15:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Kmm2As5QErToKnAZtTaLla6p1MaYpNIuxtZbUjkLWnk=;
	b=ZidENpA9kruZ1RJGavkWK31F/Eg5o76ygIgs2GCuthV9RcMZzRHvvudtoQH2lH3k8H
	/NQmssmo1tQiGNZN8wjRuwmgAjuSKE7ZiUCabC8sS570yynDdhEtYYea4wA+Zr9Q8Dqm
	BR6EDxMTgaOk/blh+pMzB+g0VOBj69U0mrSVGzGASDnaRktbi/Ng1GIIHGqqnQFJtvRL
	DSvqaB9QPHsjFuEerBpfAOOX74Opmge+55vortcJ6Tql1zOtN9ImnczvfbyYr3+S0wkX
	6P74WCXumzqxn3hpzFGIvSGHxeFdDqmrJHC3bV+HgBCPJa0gkyiiG3nwTSZiGpINtHUb
	Wygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Kmm2As5QErToKnAZtTaLla6p1MaYpNIuxtZbUjkLWnk=;
	b=Ag4R2oCkYy47vnUfaWTtnLIEpHgvFI1ZyfBGZYn8Vda2cHO7hHS4YWdwh4B7d1axGp
	6ClTlTSJazyKXpKFizBoQPzOO7l85HZIqTSyGuHfita6gBbBn2yUFHphhyzzqE/KyQxW
	p/SI0sWbI+OF9gqH+RihKJU1uYZW+JeTcI1KqxIm2/GvRAVANa3afA+X/F5dwKntLpeH
	Eb+9fci1I76q2vlDSOP6Ajb8zso/ZxX3svdgyA+dCmBjiWOTyz0JLQ4plAPuvf8Rai/X
	tCp0kQxDvQW6tCYGGqfRxRJbjilQr3a7yWe5jgcS7+OmLN0JiB+ZgHZmmRjnztaSHAwN
	EnJg==
X-Gm-Message-State: AHQUAuaMnGWCzJLHRJ9LQjE2UkL7w1zirIVkK1/1vzo24UPvn8cIeEOE
	noyu3GnGfMomeIN1IS1pmVyhFA==
X-Received: by 2002:a62:47d9:: with SMTP id p86mr881857pfi.95.1549929197217;
	Mon, 11 Feb 2019 15:53:17 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	c4sm11861031pgq.85.2019.02.11.15.53.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 15:53:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 15:52:42 -0800
Message-Id: <20190211235258.542-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211235258.542-1-richard.henderson@linaro.org>
References: <20190211235258.542-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
	That's all we know.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-arm] [PATCH v3 12/28] target/arm: Implement the GMI
 instruction
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1HVGSz/HywaC

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.h    | 1 +
 target/arm/mte_helper.c    | 6 ++++++
 target/arm/translate-a64.c | 6 ++++++
 3 files changed, 13 insertions(+)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 6ad23bf9ee..3b78e19279 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -108,3 +108,4 @@ DEF_HELPER_FLAGS_3(mte_check2, TCG_CALL_NO_WG, i64, env, i64, i32)
 DEF_HELPER_FLAGS_3(irg, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_4(addg, TCG_CALL_NO_RWG_SE, i64, env, i64, i32, i32)
 DEF_HELPER_FLAGS_4(subg, TCG_CALL_NO_RWG_SE, i64, env, i64, i32, i32)
+DEF_HELPER_FLAGS_2(gmi, TCG_CALL_NO_RWG_SE, i64, i64, i64)
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 7aca5b074f..e60c6f48eb 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -220,3 +220,9 @@ uint64_t HELPER(subg)(CPUARMState *env, uint64_t ptr,
 
     return address_with_allocation_tag(ptr - offset, rtag);
 }
+
+uint64_t HELPER(gmi)(uint64_t ptr, uint64_t mask)
+{
+    int tag = allocation_tag_from_addr(ptr);
+    return mask | (1ULL << tag);
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 8e322bd6a0..791bcc3b66 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5165,6 +5165,12 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
         gen_helper_irg(cpu_reg_sp(s, rd), cpu_env,
                        cpu_reg_sp(s, rn), cpu_reg(s, rm));
         break;
+    case 5: /* GMI */
+        if (sf == 0 || !dc_isar_feature(aa64_mte_insn_reg, s)) {
+            goto do_unallocated;
+        }
+        gen_helper_gmi(cpu_reg(s, rd), cpu_reg_sp(s, rn), cpu_reg(s, rm));
+        break;
     case 8: /* LSLV */
         handle_shift_reg(s, A64_SHIFT_TYPE_LSL, sf, rm, rn, rd);
         break;
-- 
2.17.2

