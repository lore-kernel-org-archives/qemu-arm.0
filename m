Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1990794lfg;
        Tue, 25 Feb 2020 10:10:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqwClWMWLPxPWvkqjf9W/m1x5l+Linscyjk6DAQXOoHmdHIW3+cPkQFxtT1e4pCJPbRB8BbH
X-Received: by 2002:a37:8087:: with SMTP id b129mr7986434qkd.465.1582654200067;
        Tue, 25 Feb 2020 10:10:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582654200; cv=none;
        d=google.com; s=arc-20160816;
        b=rFZYx/5tMeYcudlge9GzY0lhhSk2+zwiIcnBofz0PQ8JqzqOVG/UQju3BCRLu4Zz+t
         F2w5e5VHmgm1DRVfDerjzkz7C0yLoVkQdYbEdhnJ+8Wznn2F9SCDJ9uZC96QgLcRD4dS
         +qDpoVdmsAE3/iyRLRFKLrxeel29QFfllNgi8DemwYjDsm+JlYNliooFkcJSWDUL/WH0
         3M2dF5hXIZ4uo+gJFW3lqTDpGWY2cE9+ZiQfn3gh6Qt+efB3RhwXRPOIsZZkiXO4RZqz
         2ReFmokVINFI9/pGB2/hnX1Cw+DlcZHuYDzwwJ+o7fLszykHr8nGyCLdGIkxjnI9mKSC
         1BGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=DwAs9/rYNqhhr3pFyNf/EdZW6lZM71lcIqrzETrYP1w=;
        b=LMKLeC9oe8qg2GhC0jgu+sS5ihAQkQT9UAyzA2mM5sRDbPsYUdwOJjg/+v+k0cL0Zi
         OF+4q6mHmu7QTcBWEvhh4s3lj/GZ9lLisNWTmRtqAFjwKqIPf62pLAEtgUYT1k66vK3L
         T8LzD3MIxa18+5UxfWcrihaM/lwSoFZKKTCuRPI53oD8tHALzpQXETBYjwc/CnX8Thns
         KGJtCVkswkhYMwYfAT/q/X5h1tmpp/WVk/giXIrF1ElvVEiz8VdSRIIDJS+rWcjmu55b
         /c8Xl3dO+nKHpzte8Fur5gQxrG0j+N4W+Dw3yUeU1Mf8jJU5vB4sKgxv8XwmqNG6jJmj
         IarA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sv0jYyvu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x123si135536qkb.9.2020.02.25.10.09.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 10:10:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sv0jYyvu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6eed-0003tE-HM
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 13:09:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34857)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6edL-0002C9-21
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 13:08:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6edI-0004F9-Nf
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 13:08:38 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:42031)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6edI-0004DH-DJ
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 13:08:36 -0500
Received: by mail-pf1-x444.google.com with SMTP id 4so7593847pfz.9
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 10:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DwAs9/rYNqhhr3pFyNf/EdZW6lZM71lcIqrzETrYP1w=;
 b=sv0jYyvuypkYelj8nyHQnFZhbmkV0C3Y51Hp+84NBywENmG9FOJqZpyxMBvmY6JObX
 3xMPn1LO2kVhRZDU/8woSGQwOAN7vLjYedwybPuEjYMCZwOmFlAS3Z6Gror50uZdqIZC
 BQg3VrcA0y8/vkepUeeRPPL8XHVTzV7XqEYLiWbxW9hS89xigBv/hzSVPkbrfrd8nDC0
 VEFB9NaI9fU9d0KsemigWMyV6lacmFg8Io86QvuuBYLwY30uOwRfXHljp/H4Fci69kSy
 MiqvWypLm8jDCnzu5ItM7ry3ZX6Kg/FbvCU6kzgKtU0hgle2ELdTI3oL5113Gdc0SGt+
 3Grw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DwAs9/rYNqhhr3pFyNf/EdZW6lZM71lcIqrzETrYP1w=;
 b=GlGYvIt8agfc63OPAl+sEHNVLtUZ8U2JfZlzFDvsYzYoNdoDbiQpLKE2jin/I1alIv
 l6UWKtYFW7A0fq1oDw0Gs8+mgXYgBxu6bInvvUxKcIshEHwmUP8hnxZIJM8JP1sx102u
 U8SbP/hCfqjwpCEOB6eWjw7JGX0FK37LWYVKrgux0sxjWGD5fNtYnxPwEvx/TmAIXcvv
 wkvEkMLILhZlblF3lfo/Q9go4M/0LupA94oS/z/+dxylWKRlJ/ot9AIUWlzmd95SyXzN
 xSeIQaGd4US25mFwFNapelO6w6vaeLqn/x3BcjKc865dLPYM7HdBHFNCqlcFtDh/Ej9A
 Krgg==
X-Gm-Message-State: APjAAAW78s1vvQU0XUmIAiTDhGJ5Ej4+7hn8ysrspiwHpblLt+DzuoqE
 5RNFTvmkDm2Qeg9OPmnT7vZWmY9JP8o=
X-Received: by 2002:a62:446:: with SMTP id 67mr55553627pfe.109.1582654114693; 
 Tue, 25 Feb 2020 10:08:34 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id d69sm19069704pfd.72.2020.02.25.10.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 10:08:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/7] target/arm: Improve masking of HCR RES0 bits
Date: Tue, 25 Feb 2020 10:08:25 -0800
Message-Id: <20200225180831.26078-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200225180831.26078-1-richard.henderson@linaro.org>
References: <20200225180831.26078-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EWNP3+LVopjw

Don't merely start with v8.0, handle v7VE as well.
Notice writes from aarch32 mode, and the bits that
ought not be settable from there.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 79db169e04..d65160fdb3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5089,8 +5089,13 @@ static const ARMCPRegInfo el3_no_el2_v8_cp_reginfo[] = {
 static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
     ARMCPU *cpu = env_archcpu(env);
-    /* Begin with bits defined in base ARMv8.0.  */
-    uint64_t valid_mask = MAKE_64BIT_MASK(0, 34);
+    uint64_t valid_mask;
+
+    if (arm_feature(env, ARM_FEATURE_V8)) {
+        valid_mask = MAKE_64BIT_MASK(0, 34);  /* ARMv8.0 */
+    } else {
+        valid_mask = MAKE_64BIT_MASK(0, 28);  /* ARMv7VE */
+    }
 
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         valid_mask &= ~HCR_HCD;
@@ -5114,6 +5119,14 @@ static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         valid_mask |= HCR_API | HCR_APK;
     }
 
+    if (ri->state == ARM_CP_STATE_AA32) {
+        /*
+         * Writes from aarch32 mode have more RES0 bits.
+         * This includes TDZ, RW, E2H, and more.
+         */
+        valid_mask &= ~0xff80ff8c90000000ull;
+    }
+
     /* Clear RES0 bits.  */
     value &= valid_mask;
 
-- 
2.20.1

