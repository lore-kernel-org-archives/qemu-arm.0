Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp183710ejb;
        Thu, 8 Feb 2024 07:34:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8z7xV2umuvFPW7+wMY7+DoATvVINWiMthe1TLjWmNXHcofyxcU5961Jhn0tegCKT1KucD
X-Received: by 2002:a0c:cc10:0:b0:68c:b9e1:409a with SMTP id r16-20020a0ccc10000000b0068cb9e1409amr5833149qvk.18.1707406460760;
        Thu, 08 Feb 2024 07:34:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707406460; cv=none;
        d=google.com; s=arc-20160816;
        b=d0+JX5IA2/sfsp8q0uTRRADQv4NjcLpoJGVqzIzy+nXoRk84sd0l4ht8jOfIK6LcHv
         32P4a6Xl7ooAzUO5vDteJ3xhY8MZY+YWSF/zHQ75yxsbkCs6nO8UdkqXIUXo+N00wa+h
         BbIm5d/MW3IUEdbzONkZDewHGQKKCb3vaEaaFgWAchRDRUNCFFAwjCUz5fDJRC80Redy
         sqL6nwO1qJbThHAWYJBaEVLS4C3Xdbum0TxXPCds0BwZq7kL/UuTM25XTNFCH4b/H6o2
         CUYBbeMZ35gUZ5Gf6Yu0HWXWaHSoombF6Wyg0kWSkU1DdENC4rOb9g4RI9yCi+5nweeN
         OmVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=0rPlltwQ8J1j/tv8D8hVqi9IU8hTllCxiImaZrOMGqA=;
        fh=lbv90YjMnB9kH6jw1eYFYdp53nA2AF3NdnvdqGdT+2w=;
        b=Ne/d0kytnZVNTK7AIHIykQ7r2vsVkZtotBrZfyjwAxrbAp97JWynBg8AKcvlAZKCjy
         jkvoPF8aHM+z9COgYLL1uwTEv6daki6ODP3jKcGwomubcGJbbjiwujoRNnFI2YACUjmg
         tkRGSuDMYaaMmtaOxZyEq0Rffs+D1RQ85VwBOHXWjZdkFxobOIPsXGMJxLff+oYWe618
         ip6Keom85NeCAdRfa7aU6k7SamTlUz3sdri3k65UOjIFlH18hpTRlrTwPUlgqmKsDQXB
         V+QctWyOCZIXjjTrt4NtPeeU3V6Fv68TEWa+UyyWzpPCUfPdGc2w5lziGP9nV8iDBQJd
         uoMA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=baQ3JJD2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCW+guj/adt6TBdOvfRc4EawCzk1+5uKg65qYaKsU9N9TP9cQ9r1skix6uKcG54ybMYuy//k2V7jku0btHvkB+Z2U4JoKNem
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5-20020a0562141c0500b0068cc6581525si231015qvc.355.2024.02.08.07.34.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Feb 2024 07:34:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=baQ3JJD2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rY6PS-00029d-Ba; Thu, 08 Feb 2024 10:33:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rY6PQ-000295-T6
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 10:33:52 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rY6PO-0003Cd-H0
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 10:33:52 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33b2960ff60so633503f8f.1
 for <qemu-arm@nongnu.org>; Thu, 08 Feb 2024 07:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707406428; x=1708011228; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0rPlltwQ8J1j/tv8D8hVqi9IU8hTllCxiImaZrOMGqA=;
 b=baQ3JJD2JnqW99d6mwVOp2hvjEdLZ6OuMm1UsIeD1i7nvWDsWWjtYl0NrMvnKOT3JB
 Esd0TiMilPGtTb3oWqjdtSsFlZMLCbSSzLMPa4KMSI8tf2fvUxto7AWr2Pxm1tRyLCM+
 gn1D4lcZpJXjlQ1AaL+oZQyvTXaL6ozqnhy5cx+DS9ZwebEONqC7+dmJU8Dkax23MsDY
 DAaNjU+NlnabgqwimrjdCSKP4/1Doovg3pEz7ylRGOP5G/8ZT9XgsdhlkWBWd54OOhyW
 fnqx7evsCn/wILCPfTasqdAIDnEMOTUpcbZbJDEqErcUTsAySy1MEia4jjkfSInfNqNF
 adFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707406428; x=1708011228;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0rPlltwQ8J1j/tv8D8hVqi9IU8hTllCxiImaZrOMGqA=;
 b=HALI2uEIEv1hIgcFSMC8/9USYJO0qn4aF1/aX2/OuZHhEnvDAhPpCcxKjI3UWP5vl1
 yR35gqAo18Fk4IBzbw8a101ixiP+d2z2vj+g1VoUHHhi6jTXxTu+iPu3ZpUS9MuaqUnW
 xqNawD1EG2lYxy1ONA/+9WXQMpDFFEGZ+0ku8ypinWARqGBaDoile0WzjhD6nCkmXEik
 dHPdcFQf02k3crdKaNE9zn3iS7ebBAsUavE6GqE6fTi+ZPaghaHkONx46jXGVsQvzLaN
 VfEFR0W31bDT9aBa8ep1ImMym83pkS1ZYd/hC1P/ZEsSGqrzcXN4igSm5SZGp9PqID1V
 SEVA==
X-Gm-Message-State: AOJu0Yx1ifMczQ05/P92/UgsGjF34HMQNjxOQr9mshloIj+XE/YxLd0N
 0+l01cmgCPz3QPqPipFyWtNTZ3dRp+0XGUAcYVsNDKnqg3CRwiJADGIdtsbAmU7on/wGUTiNGMF
 x
X-Received: by 2002:a5d:58d6:0:b0:33b:5a40:d4c4 with SMTP id
 o22-20020a5d58d6000000b0033b5a40d4c4mr1719077wrf.17.1707406427851; 
 Thu, 08 Feb 2024 07:33:47 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUezog/jxPrkF0mCYLLQY8YqLV961TtNvZtdRdHbcpv5AFzesWBgWxssMbmuS0V1PIeNvVaQ4stACxRFZo16/BYPvoY2rI=
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a5d6e48000000b0033929310ae4sm3824570wrz.73.2024.02.08.07.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 07:33:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH] target/arm: Don't get MDCR_EL2 in pmu_counter_enabled()
 before checking ARM_FEATURE_PMU
Date: Thu,  8 Feb 2024 15:33:46 +0000
Message-Id: <20240208153346.970021-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FL+a6SU12+Y+

It doesn't make sense to read the value of MDCR_EL2 on a non-A-profile
CPU, and in fact if you try to do it we will assert:

#6  0x00007ffff4b95e96 in __GI___assert_fail
    (assertion=0x5555565a8c70 "!arm_feature(env, ARM_FEATURE_M)", file=0x5555565a6e5c "../../target/arm/helper.c", line=12600, function=0x5555565a9560 <__PRETTY_FUNCTION__.0> "arm_security_space_below_el3") at ./assert/assert.c:101
#7  0x0000555555ebf412 in arm_security_space_below_el3 (env=0x555557bc8190) at ../../target/arm/helper.c:12600
#8  0x0000555555ea6f89 in arm_is_el2_enabled (env=0x555557bc8190) at ../../target/arm/cpu.h:2595
#9  0x0000555555ea942f in arm_mdcr_el2_eff (env=0x555557bc8190) at ../../target/arm/internals.h:1512

We might call pmu_counter_enabled() on an M-profile CPU (for example
from the migration pre/post hooks in machine.c); this should always
return false because these CPUs don't set ARM_FEATURE_PMU.

Avoid the assertion by not calling arm_mdcr_el2_eff() before we
have done the early return for "PMU not present".

This fixes an assertion failure if you try to do a loadvm or
savevm for an M-profile board.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2155
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8c1ff16f0d9..7c531ee9cff 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1187,13 +1187,21 @@ static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
     bool enabled, prohibited = false, filtered;
     bool secure = arm_is_secure(env);
     int el = arm_current_el(env);
-    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
-    uint8_t hpmn = mdcr_el2 & MDCR_HPMN;
+    uint64_t mdcr_el2;
+    uint8_t hpmn;
 
+    /*
+     * We might be called for M-profile cores where MDCR_EL2 doesn't
+     * exist and arm_mdcr_el2_eff() will assert, so this early-exit check
+     * must be before we read that value.
+     */
     if (!arm_feature(env, ARM_FEATURE_PMU)) {
         return false;
     }
 
+    mdcr_el2 = arm_mdcr_el2_eff(env);
+    hpmn = mdcr_el2 & MDCR_HPMN;
+
     if (!arm_feature(env, ARM_FEATURE_EL2) ||
             (counter < hpmn || counter == 31)) {
         e = env->cp15.c9_pmcr & PMCRE;
-- 
2.34.1

