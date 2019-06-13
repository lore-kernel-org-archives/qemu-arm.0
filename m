Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp8360wrg;
        Thu, 13 Jun 2019 10:25:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyOw7yXQqDHd3LxfNEx7jbqbD//ntBKUnoS03OJxtYJIbzurshbV2FG6FID4P02ghf7gj8G
X-Received: by 2002:a67:ee8d:: with SMTP id n13mr21152818vsp.49.1560446755510;
        Thu, 13 Jun 2019 10:25:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560446755; cv=none;
        d=google.com; s=arc-20160816;
        b=coc87l0pylLAqiXm0AsIg0bbjkCudp5JE0PDD6q0ygvppVg9MRSpa484O5QneAxcWZ
         mtoras7YAlNgYUt6K7KSlNoqFFrfwg3t8wgeVxYRK+ZpcL+QeuuZCpsSJlkrUC4JI+dv
         sMkeEl+CYkkspeCgV149UHqW17wVje9ShITOF/Qu8/FHJ9g7lDBtGyE34i0gtZ2XdcDr
         uq2pSHCkM9fhx8ibjTwVl7XDmfQxTMS29KsIVYCHROeXQt7s3O6zDKxwqBk+Lit4V0tK
         91HA4rYsTj0PF/ZKgMlnTduDzOu3aN7MshGMwPx7B8RLGlFAn1Kndx+j89XnlWLLA0cb
         qpOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=XGJE4iIoyDN2tN+sycnvDF5WRUBy3je+PRFryiYL8bY=;
        b=ItlKyprTq0snpeEJ9lv6tqoVyyhD4q9xK04NlIKiWg+4u1syQ3zqkliIk2vmeKtBtM
         XZyupXTyoHed3D2HtX9bUi0QFbrzWvKsGJHIoIWH6w+egJlcSmW2EZOLZbhns8tVjia4
         29o1hiTfXcCDJbuPyOnht4Li0OQxOAPvmtJj4c3cuV8E7PUWVjYL2RsD+SewiIcHz8oD
         F7KuGf+NjcY41GL8vIjoVXoJkFLvJ+yzA+pG8AVmMZYYAlKyVC8kV3qhWi4Sjee3o3Jo
         BiyjDM0YdOgWygVxhj4PHj2qyRKPhWx0nAIoFGCPRwQvk+m0QkGZVA8kFpZeHwp3H/0D
         SA7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JyIH9wNg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a4si145653vsr.371.2019.06.13.10.25.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 10:25:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JyIH9wNg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42348 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbTU2-00040p-V0
	for alex.bennee@linaro.org; Thu, 13 Jun 2019 13:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53858)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hbSlL-0004Ae-13
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hbSlF-0003L6-Tx
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:42 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:51097)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hbSlF-0002ng-JG
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:37 -0400
Received: by mail-wm1-x342.google.com with SMTP id c66so10909526wmf.0
 for <qemu-arm@nongnu.org>; Thu, 13 Jun 2019 09:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XGJE4iIoyDN2tN+sycnvDF5WRUBy3je+PRFryiYL8bY=;
 b=JyIH9wNgMCaCsjeNgXKXY6qO5YVaQsxfCRq0Ywi0BSCT4kPClEVph/yDc0l4vbePjD
 KBLFUSxRcJW3oFamFyvvs9LXbLghG4W2IvuEL4fesDZl/AW2mzUSZiooBcZH4O+eObdu
 94HBQMEV3zPqzP2q3Az4MgXfnPi8VdX0L7oQ9kpQgMD59HbSgqFKCNkpLnguCy0xdFwo
 LqUGE+YMDNyy+2QCH89IhecqB+EyHiCUWzJ+ABMOVyXO3ORupTzqUYUdPZBRGMg0IPPr
 wYtqh0K2iDNob6wTQ7vU15nf5IlXpgFaTMLYZsahJHRqOozsAqRVrcBxXm2FYJ+ZftHU
 ftBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XGJE4iIoyDN2tN+sycnvDF5WRUBy3je+PRFryiYL8bY=;
 b=ExQ+0OIwILAnIqGwoiw9KTXfla6VXhw0nrkm3cSFTyJ/Tvc/dMds8ctO8HyuNpaC66
 0UsA21E24UcsbSF8eIJvPbytVvZbhzzUAy0MDK8p2zeVASG4Wqbk9RzAGaVX4TJeLOkt
 X6KEA2cS9bO5FmOHewV/tuasCAOmW4KA0OveS8jxzBt4Ph5B2eOU6oRAbenzJ88/7CIG
 nYt1Hy7FDhTYYvMPEzU0FQ76G9tmigefVvy74Cn8ExQ0OD71PzwVocz+ifoL6EEXNUcf
 70XtbRsuHA3AA5vrhHC+VSJP19IovMsNSkWMbfIZ2KOHehCPqu35HjS0JmmDyxXDVVsV
 berw==
X-Gm-Message-State: APjAAAXo/XJd+9J8YX/KRDF+KnR3gUcohwzJJFXes2546jOPKtNiGgqI
 qsUa5Yxh0HUCV9oqwTuX+JyGNlzlyK/yEA==
X-Received: by 2002:a1c:7d4e:: with SMTP id y75mr4518552wmc.169.1560443968944; 
 Thu, 13 Jun 2019 09:39:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f197sm358747wme.39.2019.06.13.09.39.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 09:39:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 17:39:14 +0100
Message-Id: <20190613163917.28589-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613163917.28589-1-peter.maydell@linaro.org>
References: <20190613163917.28589-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-arm] [PATCH 09/12] target/arm: Stop using cpu_F0s in Neon
 VCVT fixed-point ops
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eSwejnegzAot

Stop using cpu_F0s in the Neon VCVT fixed-point operations.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 62 +++++++++++++++++++-----------------------
 1 file changed, 28 insertions(+), 34 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 0fb94b777bf..d8b46130d42 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -80,6 +80,8 @@ static const char * const regnames[] =
 /* Function prototypes for gen_ functions calling Neon helpers.  */
 typedef void NeonGenThreeOpEnvFn(TCGv_i32, TCGv_env, TCGv_i32,
                                  TCGv_i32, TCGv_i32);
+/* Function prototypes for gen_ functions for fix point conversions */
+typedef void VFPGenFixPointFn(TCGv_i32, TCGv_i32, TCGv_i32, TCGv_ptr);
 
 /* initialize TCG globals.  */
 void arm_translate_init(void)
@@ -1374,27 +1376,6 @@ static TCGv_ptr get_fpstatus_ptr(int neon)
     return statusptr;
 }
 
-#define VFP_GEN_FIX(name, round) \
-static inline void gen_vfp_##name(int dp, int shift, int neon) \
-{ \
-    TCGv_i32 tmp_shift = tcg_const_i32(shift); \
-    TCGv_ptr statusptr = get_fpstatus_ptr(neon); \
-    if (dp) { \
-        gen_helper_vfp_##name##d##round(cpu_F0d, cpu_F0d, tmp_shift, \
-                                        statusptr); \
-    } else { \
-        gen_helper_vfp_##name##s##round(cpu_F0s, cpu_F0s, tmp_shift, \
-                                        statusptr); \
-    } \
-    tcg_temp_free_i32(tmp_shift); \
-    tcg_temp_free_ptr(statusptr); \
-}
-VFP_GEN_FIX(tosl, _round_to_zero)
-VFP_GEN_FIX(toul, _round_to_zero)
-VFP_GEN_FIX(slto, )
-VFP_GEN_FIX(ulto, )
-#undef VFP_GEN_FIX
-
 static inline long vfp_reg_offset(bool dp, unsigned reg)
 {
     if (dp) {
@@ -5721,28 +5702,41 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                 }
             } else if (op >= 14) {
                 /* VCVT fixed-point.  */
+                TCGv_ptr fpst;
+                TCGv_i32 shiftv;
+                VFPGenFixPointFn *fn;
+
                 if (!(insn & (1 << 21)) || (q && ((rd | rm) & 1))) {
                     return 1;
                 }
+
+                if (!(op & 1)) {
+                    if (u) {
+                        fn = gen_helper_vfp_ultos;
+                    } else {
+                        fn = gen_helper_vfp_sltos;
+                    }
+                } else {
+                    if (u) {
+                        fn = gen_helper_vfp_touls_round_to_zero;
+                    } else {
+                        fn = gen_helper_vfp_tosls_round_to_zero;
+                    }
+                }
+
                 /* We have already masked out the must-be-1 top bit of imm6,
                  * hence this 32-shift where the ARM ARM has 64-imm6.
                  */
                 shift = 32 - shift;
+                fpst = get_fpstatus_ptr(1);
+                shiftv = tcg_const_i32(shift);
                 for (pass = 0; pass < (q ? 4 : 2); pass++) {
-                    tcg_gen_ld_f32(cpu_F0s, cpu_env, neon_reg_offset(rm, pass));
-                    if (!(op & 1)) {
-                        if (u)
-                            gen_vfp_ulto(0, shift, 1);
-                        else
-                            gen_vfp_slto(0, shift, 1);
-                    } else {
-                        if (u)
-                            gen_vfp_toul(0, shift, 1);
-                        else
-                            gen_vfp_tosl(0, shift, 1);
-                    }
-                    tcg_gen_st_f32(cpu_F0s, cpu_env, neon_reg_offset(rd, pass));
+                    TCGv_i32 tmpf = neon_load_reg(rm, pass);
+                    fn(tmpf, tmpf, shiftv, fpst);
+                    neon_store_reg(rd, pass, tmpf);
                 }
+                tcg_temp_free_ptr(fpst);
+                tcg_temp_free_i32(shiftv);
             } else {
                 return 1;
             }
-- 
2.20.1

