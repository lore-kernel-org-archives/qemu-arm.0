Received: by 2002:a17:504:5a03:b0:1be9:327d:8ee3 with SMTP id iw3csp181849njb;
        Thu, 30 Jan 2025 10:23:20 -0800 (PST)
X-Received: by 2002:a05:600c:a45:b0:436:1baa:de1c with SMTP id 5b1f17b1804b1-438dc3ca7aamr85279425e9.13.1738261399348;
        Thu, 30 Jan 2025 10:23:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738261399; cv=none;
        d=google.com; s=arc-20240605;
        b=NQVaYZis7ROaYj6R4ZuXru7paGZqC3llMeC02yUqWBSe3P2+aORlkzGyKpqU20u5EC
         4y3q+ajQF+l41zxylXB++QuhzelGyQcJ56JAB4CeDt4Ejz4k8xqZerZoJnkU3k1cbwgx
         UKNWLUenscZgPuwcAWQ5MTzLREpl0WjN0XLglgwpzC6XhDNAbp+8W8WuHxdOSpl7SKHZ
         PmhD3rZ8zq+ky8q7VOn5UG+2Qz3q+mcqztnl90UplWQ0bdTlGIH1IXJdFOti7RDlIGqJ
         1dkCMTJ8+BQIYcwm69JsyJj5nY+0Y1udXZpq5Y9btr/L6/Sj5N4hYu4lLsnY55wiCRex
         W8Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fMa5YuSy0NDTUYP5ui6N/RSQpdjoNfs7F2yE5YfgTb4=;
        fh=RiJSNyFv98ecbYckNQx9NKP2dJchb+KjtIrNazRBKjc=;
        b=i3PhRypLRjVYhzRpbWHEobOFzTsh9uZUqdgUl4ZlsDKjB8qV6AuwB0CcTFIHaqDX09
         oMIuMnqh+hHd2M8YfgxouiWIARKChX2xn1C8/M2y+oyPuTNwySWt4ceVeETcP/OQIYlF
         z+TShWgexMfXALXKLM3vUmu133on91KkgCkExfiPNjmw3/QO7QG/nOQLvezVHxy2XoTc
         KwykauvtPT+QQRECa8UKF9pW/ByisZ1wXMaKBL6n/UN4Ycm5JMGBbQwr0GUPAO6P0Mem
         yvrfSCmYSTskAhDLX2C7+W2LvWQloz7XfvqPtCdEzCM+RGs0cYZx9WmXxaUBe7eo2Pi4
         hUQQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Pq8Sl4/z";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c5c1d484dsor958187f8f.6.2025.01.30.10.23.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Jan 2025 10:23:19 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Pq8Sl4/z";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738261399; x=1738866199; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMa5YuSy0NDTUYP5ui6N/RSQpdjoNfs7F2yE5YfgTb4=;
        b=Pq8Sl4/zQoInqll34zPm+Rd0CmhmLIcNp1YPUfAA5g/EVaM6/79ACtJcg97qGvPJxz
         qXbgwV6QcO1b4xbqbSv5vJlgwybA5dyjR0ME7TQajEojPj5egOpniPao2Ok6QZC8VXmu
         p+NVJhe2FleKsdkYNAb0D18t1Z+Hb6iQ1Bd0O1OaiD/Bua3sFDWGv7jXOnKUsae095GF
         0JxEWTu1etBZ4VskiH2KKsIPDe8EYPamSJmE4kujWJNpnFTjsv00I7WbqWdJqCavikdQ
         Ybe8etM6pYmSFUzI9qtc+jF5CwFh/+r9u/m0pjQleGRja7besz1hysWXx0fOz78DNpyk
         PHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738261399; x=1738866199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMa5YuSy0NDTUYP5ui6N/RSQpdjoNfs7F2yE5YfgTb4=;
        b=KG+W/J7WR4O8mx+qjV7059IvEBt5QQ/+UWPpWN26KQUhFvqee3QeBqf1k1jbOYLaIk
         34CMrKolwc8dSo5St781kz9Fvt/CxPMsIaTThnYn8uZpSpx1R7ElTQwFqQIATFaljF0S
         n5vMtpuQwhZjlCwxDhMiwDdLJBBfmzmZbwhOKHxQZM1fphrsc1yH20TBeop6xjX3WFTY
         hHE4/KS4W/pz0xo+MNTthCj8FCHuhqe51t+6AylZjgomeaAu95bus46UOmiXkmShi9fj
         kxPjDM3uP6gASbK4PoDVd4zvqay+oaPjJJpH2Du1rt6Zm+QelD8XXndMVfjGOdrCv3rT
         HEIQ==
X-Gm-Message-State: AOJu0YzsGqleaCp2v1Is3JdCg4NUZ1871HSrfxbJeQJa5+udjtWWa+E1
	dlh6IQvr2Qma8l/j5+j99YpIwkhoztMBqWqqL9ogobbDJjCiW52vkq+bnAoNnUEtFA==
X-Gm-Gg: ASbGncv0NfdAcQwM6iPtXz1D2EUP+s1bIz/CpdzQnrgL+htD3kWaOBuR5igwsCpFTQ8
	kLULdFFMGS2p61bsBhEXZXRfxREDiaggYVX9rLqw95syuzG4strp5VmSjx9lDrSNBEr+z3SSBhF
	AtK99AkhWpjUUXYuMtTJzdy6g30lFguzikQZihiTrUP982ewdLbdk20dRVZ67S7nkZ2j34WSKHn
	bop5L0IPip2sDvn4Q+xIjqu92yKbr9TgffBIahf9IVTyqVa15OPCGrEFSdcmd4aAiISTZn52AC8
	Zsgdy2/5O156Lhz5pdOQCA==
X-Google-Smtp-Source: AGHT+IFxjIh48WU/dSlOaoPrzaGSoSizC3MFT5Mm3SI1EOiyMrYEpqnqyWB8Fb2376SJHBAQgkzR3Q==
X-Received: by 2002:a05:6000:1548:b0:38c:3f12:64be with SMTP id ffacd0b85a97d-38c51f8a3camr10044992f8f.35.1738261398740;
        Thu, 30 Jan 2025 10:23:18 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c101599sm2634426f8f.23.2025.01.30.10.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 10:23:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 07/14] target/arm: Honour SDCR.TDCC and SCR.TERR in AArch32 EL3 non-Monitor modes
Date: Thu, 30 Jan 2025 18:23:02 +0000
Message-Id: <20250130182309.717346-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130182309.717346-1-peter.maydell@linaro.org>
References: <20250130182309.717346-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: isiBuWUfQ/SC

There are not many traps in AArch32 which should trap to Monitor
mode, but these trap bits should trap not just lower ELs to Monitor
mode but also the non-Monitor modes running at EL3 (i.e.  Secure
System, Secure Undef, etc).

We get this wrong because the relevant access functions implement the
AArch64-style logic of
   if (el < 3 && trap_bit_set) {
       return CP_ACCESS_TRAP_EL3;
   }
which won't trap the non-Monitor modes at EL3.

Correct this error by using arm_is_el3_or_mon() instead, which
returns true when the CPU is at AArch64 EL3 or AArch32 Monitor mode.
(Since the new callsites are compiled also for the linux-user mode,
we need to provide a dummy implementation for CONFIG_USER_ONLY.)

This affects only:
 * trapping of ERRIDR via SCR.TERR
 * trapping of the debug channel registers via SDCR.TDCC
 * trapping of GICv3 registers via SCR.IRQ and SCR.FIQ
   (which we already used arm_is_el3_or_mon() for)

This patch changes the handling of SCR.TERR and SDCR.TDCC. This
patch only changes guest-visible behaviour for "-cpu max" on
the qemu-system-arm binary, because SCR.TERR
and SDCR.TDCC (and indeed the entire SDCR register) only arrived
in Armv8, and the only guest CPU we support which has any v8
features and also starts in AArch32 EL3 is the 32-bit 'max'.

Other uses of CP_ACCESS_TRAP_EL3 don't need changing:

 * uses in code paths that can't happen when EL3 is AArch32:
   access_trap_aa32s_el1, cpacr_access, cptr_access, nsacr_access
 * uses which are in accessfns for AArch64-only registers:
   gt_stimer_access, gt_cntpoff_access, access_hxen, access_tpidr2,
   access_smpri, access_smprimap, access_lor_ns, access_pauth,
   access_mte, access_tfsr_el2, access_scxtnum, access_fgt
 * trap bits which exist only in the AArch64 version of the
   trap register, not the AArch32 one:
   access_tpm, pmreg_access, access_dbgvcr32, access_tdra,
   access_tda, access_tdosa (TPM, TDA and TDOSA exist only in
   MDCR_EL3, not in SDCR, and we enforce this in sdcr_write())

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h          | 5 +++++
 target/arm/debug_helper.c | 3 ++-
 target/arm/helper.c       | 2 +-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4cb672c120b..ae1e8b1c779 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2570,6 +2570,11 @@ static inline bool arm_is_secure_below_el3(CPUARMState *env)
     return false;
 }
 
+static inline bool arm_is_el3_or_mon(CPUARMState *env)
+{
+    return false;
+}
+
 static inline ARMSecuritySpace arm_security_space(CPUARMState *env)
 {
     return ARMSS_NonSecure;
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 2212ef4a3b9..c3c1eb5f628 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -880,7 +880,8 @@ static CPAccessResult access_tdcc(CPUARMState *env, const ARMCPRegInfo *ri,
     if (el < 2 && (mdcr_el2_tda || mdcr_el2_tdcc)) {
         return CP_ACCESS_TRAP_EL2;
     }
-    if (el < 3 && ((env->cp15.mdcr_el3 & MDCR_TDA) || mdcr_el3_tdcc)) {
+    if (!arm_is_el3_or_mon(env) &&
+        ((env->cp15.mdcr_el3 & MDCR_TDA) || mdcr_el3_tdcc)) {
         return CP_ACCESS_TRAP_EL3;
     }
     return CP_ACCESS_OK;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c5cd27b249f..058a5af3aaf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6103,7 +6103,7 @@ static CPAccessResult access_terr(CPUARMState *env, const ARMCPRegInfo *ri,
     if (el < 2 && (arm_hcr_el2_eff(env) & HCR_TERR)) {
         return CP_ACCESS_TRAP_EL2;
     }
-    if (el < 3 && (env->cp15.scr_el3 & SCR_TERR)) {
+    if (!arm_is_el3_or_mon(env) && (env->cp15.scr_el3 & SCR_TERR)) {
         return CP_ACCESS_TRAP_EL3;
     }
     return CP_ACCESS_OK;
-- 
2.34.1
