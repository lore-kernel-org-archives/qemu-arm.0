Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp211641wme;
        Wed, 16 May 2018 15:45:29 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoAe3qO9wYxsEkD+iEmM1Wk3E4B1DbtGfanycRG3KGctNkAaMk4KD0ZnSi48nPiIAlRXykE
X-Received: by 2002:ac8:2439:: with SMTP id c54-v6mr3123214qtc.21.1526510729860;
        Wed, 16 May 2018 15:45:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526510729; cv=none;
        d=google.com; s=arc-20160816;
        b=GfBifdbb8VIIM+PxRXNJtxSOPRO02yNXwrT9qCDaMmuaILlgP2Y8VXPiv8Ej3/hvtU
         mpSdtLEcPoOIOo0YG1V06xputj4tksZxBqC2YhH4to+LC20jclAVeoq4EeSCN4JIh6is
         Dvj6f+jpicWGdS5eRVzSj3YYpFthsd3E51TTcbhFBhZJPTUmiazejV8A4jGU7N94RHa6
         +nOhTQrYrzbjRYQRSdK1fLoeDCkEb5aBjU6+uh3Y03nB7oTGbkDYHVftGAcjjTJ2gOAk
         Eu3lmimz8SslfWCGBG+j1/l2rBhtd5vbGow3ziYYSdY+dxVk1ejlpBN8W4o4Tp5Tc10n
         wu5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=SkJdca9df8jMesnr9raKZw5iQRhGtTAn4Z6Ps+A956I=;
        b=LQiE23vUnCUIdNIDTpuLBaZIcFoy7m9CcZbQc9MHCUSGDUNMV8aFl70jPc2oqcnemJ
         yM5ykB+Q291CeCxBPV3esCzL+qmmXqMZXe00CM4L769YMOF+ggN/er7nOoCP5D25u5b+
         zSrEMGcyd+jkHRNh6rSmgt2yslrt55b7D5q/E9Xx8KJ/Z0N3vQNpiOGMtIMZBFsnVbni
         m+PUppWbFVD8mG45WrGfiEmgtug1rcUH0tPryxiEDFOMkm3ozziUOtw9gjmQAXG8+DZp
         9A/0LI9brZDRWwIP1kJu87yprBpPdCexeScuQFDqpx1Y88JqEWsFy7pK/I45W5MKxznb
         dR/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZHCfuWvW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g90-v6si3533314qtd.230.2018.05.16.15.45.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 15:45:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZHCfuWvW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44864 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJ5An-0002dp-AH
	for alex.bennee@linaro.org; Wed, 16 May 2018 18:45:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41386)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4wT-0007ss-OD
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4wS-0007fb-Hd
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:41 -0400
Received: from mail-pl0-x231.google.com ([2607:f8b0:400e:c01::231]:37961)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fJ4wS-0007dq-Ax
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:40 -0400
Received: by mail-pl0-x231.google.com with SMTP id c11-v6so1249226plr.5
	for <qemu-arm@nongnu.org>; Wed, 16 May 2018 15:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SkJdca9df8jMesnr9raKZw5iQRhGtTAn4Z6Ps+A956I=;
	b=ZHCfuWvWCHDMHTUfQub04lLmhDM4XD7NiFDQdInkUDH+ciOIrY9OXYWtY3xCx+X0SN
	nASiHqtZXFj+IAMul0xQtORF6wyfY5IaMIzMuUt6zCdpMy6Yv1O9a+rtRk9fChxKseIb
	ngld9ANJZIEisauYWsIlTI0+0ve2a0iKYgXb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SkJdca9df8jMesnr9raKZw5iQRhGtTAn4Z6Ps+A956I=;
	b=DnP5LFigfEabVwi2BqDHBDLOLvYQYHxzFdRx8TfkYeHXU8RwJL9q93aVVqJVk/wYUH
	gqJgak7lRnB7Rx9mW1usdyUOHXVGnw1Yr1rT7M8kXFSG5w1jufr7e6/NPKgQ/lSsykz9
	wOyal5eNk8DG44ymuxPE9Q7TkRMto6eGW1Qqjy+4MmRm6DX9/+73b6+uD5bdzwaBAbf0
	qeB/k2EjTFq59Eebn23bvBws7gZri7QjtISciVzsEPQOnnxDdue11NxD68JWK+H/J7l9
	pvCTSCVqCQlnnwwz+S59IXRXz2xT7kgHnd5UiasU10W5perDhLWoJWfK2H5OtFF9ywc0
	BtoA==
X-Gm-Message-State: ALKqPwfxyXcdOAPU4M0rXuonPFErFYY8vLp8siwkwQ3r5TPLAaHEJV2X
	KThT8IMqDuFou6MuOcGmx+oiyA==
X-Received: by 2002:a17:902:41:: with SMTP id
	59-v6mr2696729pla.345.1526509839484; 
	Wed, 16 May 2018 15:30:39 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	j1-v6sm6640418pfc.159.2018.05.16.15.30.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 May 2018 15:30:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 16 May 2018 15:30:01 -0700
Message-Id: <20180516223007.10256-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180516223007.10256-1-richard.henderson@linaro.org>
References: <20180516223007.10256-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::231
Subject: [Qemu-arm] [PATCH v3-a 21/27] target/arm: Implement SVE
 floating-point trig select coefficient
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
X-TUID: PWBAdNJp1vha

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  4 ++++
 target/arm/sve_helper.c    | 43 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 21 +++++++++++++++++++
 target/arm/sve.decode      |  4 ++++
 4 files changed, 72 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index e2925ff8ec..4f1bd5a62f 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -389,6 +389,10 @@ DEF_HELPER_FLAGS_3(sve_fexpa_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_fexpa_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_fexpa_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve_ftssel_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_ftssel_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_ftssel_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 6ffb126821..85a0639e3a 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -23,6 +23,7 @@
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "tcg/tcg-gvec-desc.h"
+#include "fpu/softfloat.h"
 
 
 /* Note that vector data is stored in host-endian 64-bit chunks,
@@ -1192,3 +1193,45 @@ void HELPER(sve_fexpa_d)(void *vd, void *vn, uint32_t desc)
         d[i] = coeff[idx] | (exp << 52);
     }
 }
+
+void HELPER(sve_ftssel_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 2;
+    uint16_t *d = vd, *n = vn, *m = vm;
+    for (i = 0; i < opr_sz; i += 1) {
+        uint16_t nn = n[i];
+        uint16_t mm = m[i];
+        if (mm & 1) {
+            nn = float16_one;
+        }
+        d[i] = nn ^ (mm & 2) << 14;
+    }
+}
+
+void HELPER(sve_ftssel_s)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 4;
+    uint32_t *d = vd, *n = vn, *m = vm;
+    for (i = 0; i < opr_sz; i += 1) {
+        uint32_t nn = n[i];
+        uint32_t mm = m[i];
+        if (mm & 1) {
+            nn = float32_one;
+        }
+        d[i] = nn ^ (mm & 2) << 30;
+    }
+}
+
+void HELPER(sve_ftssel_d)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn, *m = vm;
+    for (i = 0; i < opr_sz; i += 1) {
+        uint64_t nn = n[i];
+        uint64_t mm = m[i];
+        if (mm & 1) {
+            nn = float64_one;
+        }
+        d[i] = nn ^ (mm & 2) << 62;
+    }
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 54d774b5e0..ea8d2c4112 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -953,6 +953,27 @@ static bool trans_FEXPA(DisasContext *s, arg_rr_esz *a, uint32_t insn)
     return true;
 }
 
+static bool trans_FTSSEL(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        NULL,
+        gen_helper_sve_ftssel_h,
+        gen_helper_sve_ftssel_s,
+        gen_helper_sve_ftssel_d,
+    };
+    if (a->esz == 0) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vsz, vsz, 0, fns[a->esz]);
+    }
+    return true;
+}
+
 /*
  *** SVE Predicate Logical Operations Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index cd53b95831..224dfdd1e9 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -295,6 +295,10 @@ ADR_p64         00000100 11 1 ..... 1010 .. ..... .....         @rd_rn_msz_rm
 # Note esz != 0
 FEXPA           00000100 .. 1 00000 101110 ..... .....          @rd_rn
 
+# SVE floating-point trig select coefficient
+# Note esz != 0
+FTSSEL          00000100 .. 1 ..... 101100 ..... .....          @rd_rn_rm
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.17.0

