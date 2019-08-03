Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2201117wrv;
        Sat, 3 Aug 2019 11:48:33 -0700 (PDT)
X-Received: by 2002:a17:902:20c8:: with SMTP id v8mr137808503plg.284.1564858113022;
        Sat, 03 Aug 2019 11:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858113; cv=none;
        d=google.com; s=arc-20160816;
        b=kY2p687Ym/fT9zBpykL/UtyNwfNie6N+LcwXKXj3dRf3Hb/tUJuUnEH8jI0yO5GWe2
         L1NB3NY1MfxLnPX3sTAEnhiOWv1Fjx27zMmzTi0RLQWLt841VJc2sJGj3g3uuaTQ8sWC
         vMiyKLsyTh3AvsoyCIVG6K0ddBzYJRUJ4wFpLJEV5IrdZwdhpn+hk8VlWKk3PZ1Dz1Ng
         37nrokpCi73Ww3cdUJRz8/uP5wvueDX8ejxBpuqFigpoft4iXE99J1UKmrOai3icBH1Z
         pJTakx4KUnEeKWINqh4vqmr2mehyT8A2HJLVKQ+aEs9CMs7dTtLiQeDOoccxjXfGG0+U
         SoSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=XOwe1x9jkMeobEp2gGQ1QVWfLomppnXBcfQfzlWOS/E=;
        b=m4mNOmcmH7wcj/qbvnbwecXcHGCda9a8QR1l5/n1o+WWEPJPMREkMGxROooSJ6YG09
         5VIdZBq/13mB9PefDB5AltTHtP58KHzlvGwWSJeVE5CwAL1lhyzmhjfsF1ZIR7vSnFVY
         XNsDbGgW98F3R7bOaLuI3HITzSltdL/xPsuRgobqJY8VEqvCkI7FEDvj0BiAvUc2wiiQ
         L99dfHcZOlyCvPMFSbwJG6QylGyq3kVtb5dV22CuScWCEijKOmsHDeDgm0EWU9XboMl+
         oZUCTGJBLJZ7vzH61wChAZWrR7iXn9khJKDZ93iloGasMar2FXAuzfrV0ENWAbDQYVML
         Vd6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dMqUYYmR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s7sor94864478plq.42.2019.08.03.11.48.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dMqUYYmR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XOwe1x9jkMeobEp2gGQ1QVWfLomppnXBcfQfzlWOS/E=;
        b=dMqUYYmRfdayPFfbUWwMEx9J2DbZBKw2F4NAJoNPOwLBmqrOuFzJaZYBpEpuXKphx1
         k73GH4LZNLW8ZcfyO87kGFQQTTfXTFLE/f6gvk1z2RiesiH1K0PjhQnXIzaW3SHb/cID
         /w/DfIbV/75N84T2THH4vOYiInYakfJu9A7ElnolFK36pD1HyeS43c3PgOew1zddvEWX
         HzAcn4s9+sTMspPIHAkYjlByi0Y0pfsgypM/POeJxGLNs40YlCnb1AVJsc+MKMs4UAxx
         Aveu6pq6lBGaSaBO+2y82E3xXr7kW26UT0Un0Qe3PPlUksqIRPxlEERvvNnIzzlHH8ww
         ERrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=XOwe1x9jkMeobEp2gGQ1QVWfLomppnXBcfQfzlWOS/E=;
        b=UMp0SF+m7UZKXb/999qA3yihNTWaYn9qd4gnx3xKyrp15LqxSr3bdRMiGR7xKjpst/
         SJsY4Q2IIpHxm9A2jrfljJcQZzrwttz1JFui8icuClCIiOv1hlP5BrgF1Dph21tZFAsI
         jDT6jB7at+/7v3xGHy+G8gII/Pn4L3eR3URdFwInrmxKp1vOdqlISA0S8RfXZhknaHiC
         W6VNek6Cv5WFsxMQ676tIG3mIKolglrdk4LzapVz8kQh5i+4FddnABmgqJAmqoxwiVqE
         TeqirEAD0glQKHf8YORYFENrY4Pl0KpYoQLh8BMtDSEWv9FHEP7pBJy5Hkg2CezZ9wvP
         0a9g==
X-Gm-Message-State: APjAAAXGuqStFxK3LvpJtQ+QgszvvBWDN/vRiOgg8hI/7xsWxg4Pd1kj
	Frc5FIccAVmqjEOpiRYJMyDwwFup
X-Google-Smtp-Source: APXvYqyb1AF8sTnicyX+NAezc54dTu4e+BfaRxO4fEL/ZNln+ZX+TAvvOyDRIIAMgqa+cbIuuztDxA==
X-Received: by 2002:a17:902:b48f:: with SMTP id y15mr139996271plr.268.1564858112630;
        Sat, 03 Aug 2019 11:48:32 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 25/34] target/arm: Update aa64_zva_access for EL2
Date: Sat,  3 Aug 2019 11:47:51 -0700
Message-Id: <20190803184800.8221-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
X-TUID: b0s0wjgo6ma5

The comment that we don't support EL2 is somewhat out of date.
Update to include checks against HCR_EL2.TDZ.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9e9d2ce99b..37c881baab 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4113,11 +4113,27 @@ static void tlbi_aa64_ipas2e1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static CPAccessResult aa64_zva_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                       bool isread)
 {
-    /* We don't implement EL2, so the only control on DC ZVA is the
-     * bit in the SCTLR which can prohibit access for EL0.
-     */
-    if (arm_current_el(env) == 0 && !(env->cp15.sctlr_el[1] & SCTLR_DZE)) {
-        return CP_ACCESS_TRAP;
+    int cur_el = arm_current_el(env);
+
+    if (cur_el < 2) {
+        uint64_t hcr = arm_hcr_el2_eff(env);
+
+        if (cur_el == 0) {
+            if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
+                if (!(env->cp15.sctlr_el[2] & SCTLR_DZE)) {
+                    return CP_ACCESS_TRAP_EL2;
+                }
+            } else {
+                if (!(env->cp15.sctlr_el[1] & SCTLR_DZE)) {
+                    return CP_ACCESS_TRAP;
+                }
+                if (hcr & HCR_TDZ) {
+                    return CP_ACCESS_TRAP_EL2;
+                }
+            }
+        } else if (hcr & HCR_TDZ) {
+            return CP_ACCESS_TRAP_EL2;
+        }
     }
     return CP_ACCESS_OK;
 }
-- 
2.17.1
