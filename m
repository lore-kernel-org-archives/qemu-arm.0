Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp249982lfe;
        Mon, 16 Mar 2020 09:07:03 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuTs9Dj28SZS1C09n9CKddvDIIVLoKlzFSsn58oh9/kUoK50kldU14Tq0tRD1nOotYpGwQA
X-Received: by 2002:a5d:4c47:: with SMTP id n7mr102808wrt.254.1584374823701;
        Mon, 16 Mar 2020 09:07:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584374823; cv=none;
        d=google.com; s=arc-20160816;
        b=pOSmy0VetIjUANGIUsmFKO26Q1UE7MpfPDdFDxUYpDbFzqxC7YMvqZW0jcROv/TQ3h
         rRU+lKEqJC7880mzRJxalcRmBNfRz6j58V7S5Pof5JZfTvmyMW3YzyZ5nYJOr+FUHg7t
         78CSjvhmCL9ALcrMBX7bHF2roSKMZ//jdh92+/2ujtW3WiK8Qa7eAKROksdscLomLOzP
         Fs3yr963NXaAQC0eRq/8s0s6z90IQyL21Wni1Kiz+qBncotGK9uuS9ArtOfNcxQitC3i
         3LzdrFNwX/L0D5Wps3ZOfrHtBVnsV9Eoi/q1ZlErAdkQNC4SIkpu+eHFadRJ350OBRNh
         7Rng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=j2NQUGK1oGWALaGzXfEtj8AM5490glkq1or09z6B8W8=;
        b=vToFt62e44m0/FMm8fQQlhG+qXiWklx06HBWVEME1sPygMCtKEOLFiXy2fREFuCzLT
         To0sbUv5g/itB2Kn7DHMb2YfPDdscJ89I6YOFcP7MVALQj2k/OSoKZm7fsllEvznLAQA
         0i/QvdiJuOHT3J6jH4SGcMbGwEcw1nCWqOenoSRs04rtLTliPASOKJdEF3zz2+fLuYEe
         4Nr6LxsYz+6XwHVf7GMKDAEJwdFgXOUR+DZbEC4XnHiuFNu11HKdYZnxzWoPz5Ttksrc
         r8+IdMFK2DsgMRItP+XNrRCuYWW/gDeJi5sJqWMTnnw3jwKaewQ/2dRasXXqWReOS0FK
         VXuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zf0DNZHi;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [216.205.24.74])
        by mx.google.com with ESMTPS id w26si4791484wmk.34.2020.03.16.09.07.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2020 09:07:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) client-ip=216.205.24.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zf0DNZHi;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584374822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j2NQUGK1oGWALaGzXfEtj8AM5490glkq1or09z6B8W8=;
	b=Zf0DNZHiVI4eFg98LAkhJz0J9cbICvHiZpIgeiQ5fXtSrrichYZ+Lcyzg1fRnNtlk7QRdS
	8Dt9TK/Sn0RkecrD1tTwHNf/rLpZybQ4Q8RSOQCJncrGDnDjIJ2FkI6Zmn9EybnAcIky65
	uAPpaqoDm5uZvQGAv3vPJDY0AVn517I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-QZglDBaRNum_vTto6RcC5A-1; Mon, 16 Mar 2020 12:07:00 -0400
X-MC-Unique: QZglDBaRNum_vTto6RcC5A-1
Received: by mail-wm1-f70.google.com with SMTP id i24so4031143wml.1
        for <alex.bennee@linaro.org>; Mon, 16 Mar 2020 09:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x1weIqYNF3Fo5tV0WZvC7V944GYiMwvqowZHCwqs/e8=;
        b=l1u8uAZy9NpDJ8xRjvu8NB2VBB1OOcQfwb0/lpbZJg+2kTi93ld5jXIY6fpGrxP6BO
         IlOErU9BDYiUxhcWge7Is1SHrn/hQMVGRSfALa8Sno+42+DVAR/5beMupIw0QA+U92Jl
         8T8FGytCr9e0U6lK6dQB3w7MR08NXbg+T026txEjrxTABdlc6Ibn4YLLhI3PCC3Tzqiq
         HO4bAbXZnN/BB1376mOmSGugbdYvFzvkUELRQCm4eyPnvugqYYNfVeTihXzrX9PbckC4
         NW18XxD1y5F84aCv+lTwpAHk7WET8wjTl7ArAnbSSyl16cimexFHiN94IVsR+/7kCVNa
         kH1A==
X-Gm-Message-State: ANhLgQ19JN9SxDKhz/UPVZCTmfEcvxyMDeKXRi8+RHGabFPm+HER9gha
	MkYySOr0rUz65EJrGXHt+xwcs8aK1yd0qDCz2CjTUmFtQi5YXlcv3DfriNvNU+7f7R0JO/RmR8C
	MrshNusU4b22WGm0b
X-Received: by 2002:a1c:6385:: with SMTP id x127mr28120928wmb.141.1584374819496;
        Mon, 16 Mar 2020 09:06:59 -0700 (PDT)
X-Received: by 2002:a1c:6385:: with SMTP id x127mr28120897wmb.141.1584374819229;
        Mon, 16 Mar 2020 09:06:59 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id y5sm166058wmi.34.2020.03.16.09.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 09:06:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 04/19] target/arm: Restric the Address Translate operations to TCG accel
Date: Mon, 16 Mar 2020 17:06:19 +0100
Message-Id: <20200316160634.3386-5-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316160634.3386-1-philmd@redhat.com>
References: <20200316160634.3386-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 4fg2hEMe3PK/

Under KVM the ATS instruction will trap.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/helper.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 924deffd65..a5280c091b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3322,7 +3322,7 @@ static void par_write(CPUARMState *env, const ARMCPRe=
gInfo *ri, uint64_t value)
     }
 }
=20
-#ifndef CONFIG_USER_ONLY
+#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
 /* get_phys_addr() isn't present for user-mode-only targets */
=20
 static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -3631,7 +3631,7 @@ static void ats_write64(CPUARMState *env, const ARMCP=
RegInfo *ri,
=20
     env->cp15.par_el[1] =3D do_ats_write(env, value, access_type, mmu_idx)=
;
 }
-#endif
+#endif /* !CONFIG_USER_ONLY && CONFIG_TCG */
=20
 static const ARMCPRegInfo vapa_cp_reginfo[] =3D {
     { .name =3D "PAR", .cp =3D 15, .crn =3D 7, .crm =3D 4, .opc1 =3D 0, .o=
pc2 =3D 0,
@@ -3639,7 +3639,7 @@ static const ARMCPRegInfo vapa_cp_reginfo[] =3D {
       .bank_fieldoffsets =3D { offsetoflow32(CPUARMState, cp15.par_s),
                              offsetoflow32(CPUARMState, cp15.par_ns) },
       .writefn =3D par_write },
-#ifndef CONFIG_USER_ONLY
+#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
     /* This underdecoding is safe because the reginfo is NO_RAW. */
     { .name =3D "ATS", .cp =3D 15, .crn =3D 7, .crm =3D 8, .opc1 =3D 0, .o=
pc2 =3D CP_ANY,
       .access =3D PL1_W, .accessfn =3D ats_access,
@@ -4880,7 +4880,8 @@ static const ARMCPRegInfo v8_cp_reginfo[] =3D {
       .opc0 =3D 1, .opc1 =3D 4, .crn =3D 8, .crm =3D 7, .opc2 =3D 6,
       .access =3D PL2_W, .type =3D ARM_CP_NO_RAW,
       .writefn =3D tlbi_aa64_alle1is_write },
-#ifndef CONFIG_USER_ONLY
+
+#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
     /* 64 bit address translation operations */
     { .name =3D "AT_S1E1R", .state =3D ARM_CP_STATE_AA64,
       .opc0 =3D 1, .opc1 =3D 0, .crn =3D 7, .crm =3D 8, .opc2 =3D 0,
@@ -4929,7 +4930,8 @@ static const ARMCPRegInfo v8_cp_reginfo[] =3D {
       .access =3D PL1_RW, .resetvalue =3D 0,
       .fieldoffset =3D offsetof(CPUARMState, cp15.par_el[1]),
       .writefn =3D par_write },
-#endif
+#endif /* !CONFIG_USER_ONLY && CONFIG_TCG */
+
     /* TLB invalidate last level of translation table walk */
     { .name =3D "TLBIMVALIS", .cp =3D 15, .opc1 =3D 0, .crn =3D 8, .crm =
=3D 3, .opc2 =3D 5,
       .type =3D ARM_CP_NO_RAW, .access =3D PL1_W, .accessfn =3D access_ttl=
b,
@@ -5536,7 +5538,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] =3D {
       .opc0 =3D 1, .opc1 =3D 4, .crn =3D 8, .crm =3D 3, .opc2 =3D 5,
       .access =3D PL2_W, .type =3D ARM_CP_NO_RAW,
       .writefn =3D tlbi_aa64_vae2is_write },
-#ifndef CONFIG_USER_ONLY
+#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
     /* Unlike the other EL2-related AT operations, these must
      * UNDEF from EL3 if EL2 is not implemented, which is why we
      * define them here rather than with the rest of the AT ops.
@@ -6992,7 +6994,7 @@ static const ARMCPRegInfo vhe_reginfo[] =3D {
     REGINFO_SENTINEL
 };
=20
-#ifndef CONFIG_USER_ONLY
+#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
 static const ARMCPRegInfo ats1e1_reginfo[] =3D {
     { .name =3D "AT_S1E1R", .state =3D ARM_CP_STATE_AA64,
       .opc0 =3D 1, .opc1 =3D 0, .crn =3D 7, .crm =3D 9, .opc2 =3D 0,
@@ -7894,14 +7896,14 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_pan, cpu)) {
         define_one_arm_cp_reg(cpu, &pan_reginfo);
     }
-#ifndef CONFIG_USER_ONLY
+#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
     if (cpu_isar_feature(aa64_ats1e1, cpu)) {
         define_arm_cp_regs(cpu, ats1e1_reginfo);
     }
     if (cpu_isar_feature(aa32_ats1e1, cpu)) {
         define_arm_cp_regs(cpu, ats1cp_reginfo);
     }
-#endif
+#endif /* !CONFIG_USER_ONLY && CONFIG_TCG */
     if (cpu_isar_feature(aa64_uao, cpu)) {
         define_one_arm_cp_reg(cpu, &uao_reginfo);
     }
--=20
2.21.1
