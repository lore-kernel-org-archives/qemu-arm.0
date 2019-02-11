Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp106859wrp;
        Mon, 11 Feb 2019 15:59:14 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYanR6QEAj1HNG1jDGqzgj51KtYr/xpR4A0WeeUBF3fRAicFHxxa0pw2L3guzEK+CJzq+yi
X-Received: by 2002:a25:38f:: with SMTP id 137mr640600ybd.490.1549929554083;
        Mon, 11 Feb 2019 15:59:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549929554; cv=none;
        d=google.com; s=arc-20160816;
        b=Qw2t+jX/6AkyfvKpbiKIc8SoktILNskHM+xZPmLTpUneksMbDm3iEIZjL3OSeIRKq1
         zqEV4/pls5xakKlo5nCJcOFFY0X1KFByrNc1qSPhAj5zy7hXU0gU4J/P/ZX1D2HhjEfl
         dyT/PW1xIJ+Htd/Nh5MWK+1QACC3my4mEcxOixGu7Aj78/MDu/wMOMWWlHAZJe5iOC+9
         VEQE7Hnf4wdOys4aRUVm96duKFGY1W6WK5FCdIFHrGCisuIkF+bMeGIdgKP/m/zf9Aqr
         gR6vqVvzJIeSLctjfqK2o6OlzUOxqM230UzEkNI+8WzEQ77IxubT2s+geuppU+eyyJ91
         gVWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=MeANllhl1EJDV5sKJLIW0fjvttmmw3UOBcxKU9DzMxw=;
        b=Yh1izLrKKM9krBErMw/b6OjGD6cns/iueXLJ8+ADhHocyCG0drr6tKO+CiM0IfpDCF
         lrzQf61vul7U29J/TZm5JBX9uO3iRWOHGp7fejKx534SCoCVo4GQ0lPaLzMH0/3hbhjx
         9ezm8HSUNk1TOuldBZJlI7c89dPyyddtYrgY35JtY8r73CmgTAjSo9l0PzdjQ7UHoawz
         Zw1v5d76ZxODZPl1J7Gf7g/Hs1IVRnAlyj1gaM8+m6OE6JPWkx16zU3XY3Z2fqtVMSc2
         X0S2dGNzKBvpz0BuxrPv9J9XrdANo8CDmADmb+li4SE/DUX9CyfxvquKwtmkh23Rm4hN
         zLVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="TrSgiAL/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2si6429067ybv.398.2019.02.11.15.59.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 15:59:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="TrSgiAL/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58210 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtLTl-000125-EZ
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 18:59:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38063)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOE-0005Mj-H3
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOC-0004Xm-0t
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:30 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:47054)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtLOB-0004Ph-Pl
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:27 -0500
Received: by mail-pl1-x62c.google.com with SMTP id o6so314943pls.13
	for <qemu-devel@nongnu.org>; Mon, 11 Feb 2019 15:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MeANllhl1EJDV5sKJLIW0fjvttmmw3UOBcxKU9DzMxw=;
	b=TrSgiAL/MtIe9pzq+6kN0cRmyLVfcXswfXw6qGRgRQwtqtbTBMQCBAwEsmK9LOqJvD
	/aKUO9PrtqOOeZ2SDE8luouQaVSKfFjMvJzNhbONSWAooymwey1WlIrhdrQORQdhekvG
	tFhwV+hAOVmJ2GXWVEHfCIH/p7M8EOsKgyYONPw2kuM4Srwqm4KVlm7L62z9F1RmMA0G
	1W3ak63PQQEsE5bqWrbGDEXyOhTzY3A1gWZZMntmy5eRpY6cxs8EeBGrEayD91eRnrsK
	j2aBlB1B/3gpsVuUpEo4vtoXCcWtlYKrPh3eWxce8pGtBrwN4OGU8P96TBtPhbdzl/7G
	wkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MeANllhl1EJDV5sKJLIW0fjvttmmw3UOBcxKU9DzMxw=;
	b=J8U9Erse/AdNRXcL/NzG0j1IG3kDQe0zvoW+1PtOH1+1nZXnHCnGwZ36mjnnj6zOtR
	x5PbOr3clJvAKpxzKfPUJuTqADrAqMwQAo8Zh2IGD/jKTMCgJ+UDkpaSFZg1MmeTvtfG
	CRdPjnuC1U/UQlN6s0xsbEqs4yWI6SOpHCiY4D903BPN3alQ1R4CjRWO4G3r5heg2JdF
	w5nM9iTNuQSxkiJFqFa209PgkZWnXRAumSWULzC0zaGkUeChUTsQ4hKPbwIK9IPDCm3f
	qz5F5T4D7I1ERL/TEXFGvvVb+y9Q/xHFOdR9yE6MIsuTz4WlNAYAVJESg42RKBDJ7/Vj
	O4LQ==
X-Gm-Message-State: AHQUAuYt6f0SO5crEi645+B6ET8xI4+hQyhkV6Lf4DsRrd70n+BOrqDu
	+CFqWKFasVmZ4iP+01QyVtaI3/hpgZc=
X-Received: by 2002:a17:902:c5:: with SMTP id a63mr899856pla.267.1549929190749;
	Mon, 11 Feb 2019 15:53:10 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	c4sm11861031pgq.85.2019.02.11.15.53.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 15:53:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 15:52:37 -0800
Message-Id: <20190211235258.542-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211235258.542-1-richard.henderson@linaro.org>
References: <20190211235258.542-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::62c
Subject: [Qemu-devel] [PATCH v3 07/28] target/arm: Assert no manual change
 to CACHED_PSTATE_BITS
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2tMUTUH3K6U2

These bits are stored elsewhere; changing env->pstate has no effect.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index a24757d3d7..296d1ac72c 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -209,6 +209,8 @@ static inline void set_pstate_bits(uint32_t bits)
 {
     TCGv_i32 p = tcg_temp_new_i32();
 
+    tcg_debug_assert(!(bits & CACHED_PSTATE_BITS));
+
     tcg_gen_ld_i32(p, cpu_env, offsetof(CPUARMState, pstate));
     tcg_gen_ori_i32(p, p, bits);
     tcg_gen_st_i32(p, cpu_env, offsetof(CPUARMState, pstate));
@@ -220,6 +222,8 @@ static inline void clear_pstate_bits(uint32_t bits)
 {
     TCGv_i32 p = tcg_temp_new_i32();
 
+    tcg_debug_assert(!(bits & CACHED_PSTATE_BITS));
+
     tcg_gen_ld_i32(p, cpu_env, offsetof(CPUARMState, pstate));
     tcg_gen_andi_i32(p, p, ~bits);
     tcg_gen_st_i32(p, cpu_env, offsetof(CPUARMState, pstate));
-- 
2.17.2

