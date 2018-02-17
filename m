Received: by 10.28.71.27 with SMTP id u27csp2090069wma;
        Sat, 17 Feb 2018 10:52:57 -0800 (PST)
X-Google-Smtp-Source: AH8x227lKi2owgAToA5s1JXc/uVDNnD8FcQQsrexG9LBMZgz5rutZaiLcBpge2bd/DX4sZ1nssBb
X-Received: by 10.37.134.136 with SMTP id z8mr1207258ybk.265.1518893577133;
        Sat, 17 Feb 2018 10:52:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518893577; cv=none;
        d=google.com; s=arc-20160816;
        b=LgY4vYuBqmz5vaf19ScsJAEUoNStyPsvy95ugpKqLCoyU+3014qltXXwfBF4Vs/1+r
         /Sx7X+FLvm2eUjeey3XdQIdriaBcWuDfPLfAlPKjIwgD/TYzvLyKMV9Y1ST4TbAE+AnT
         Um3U9wQTaXoC9w27BhsmxA+fFgP6mEjkhzOaSK7dSW9sWWGuwvlfuZ25HBtgMGXSYd5j
         1r9idsd5lU/WI9fIOUgTdeUun8c+1ajwfwzw82IySULRaYBO78XiQjdDsGA/6AmA3KX7
         +NLC1uOd8XZ611k20wCWhkleXUdufqPlneg9tiXe6TSoSg3o42rEU+aCZvlqad+i2K9y
         KDTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=vgUeQVcNdAqSYVjf7X4B2XDy4dpJwgizl072wHry8oE=;
        b=iZhXHiiC2G2D18gr+KzcnAAk4qnPBYHhmPHg3Hpeu2VmtCsxSk+TzPHWM+rLGeoUXI
         NeeEpRIt/gzCscdnXZaghfD2P2+Y8tsyS1awQdo8SSMnsQTKs8o7LkvFXcY+fKPP13lZ
         D+tY3UOXl+7TSJVtVrjUJ3a40OSbXX4wanGZIeUxYJW5pi1MqmVoaA7Z9mN5x6BTEqO1
         bcoNYxdemLNVGh46KRq5Rc1R6WlYTZIDZh6IivojlHTeOljCXQLCiqmvI2IrNOhdXERR
         dsylwNewETziDTNVCEAsUXPPYA5vmEHpk7gL4B1fztMIY4jStQvPIDLI534zMmqG1cNB
         K58g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DLQoYF4C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p5si218775ywm.703.2018.02.17.10.52.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:52:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DLQoYF4C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48296 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7bU-0007au-HG
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:52:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79w-000190-J4
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79u-0001wI-R4
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:28 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:44554)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en79u-0001vr-Cy
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:26 -0500
Received: by mail-pl0-x243.google.com with SMTP id w21so3426923plp.11
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vgUeQVcNdAqSYVjf7X4B2XDy4dpJwgizl072wHry8oE=;
	b=DLQoYF4Cqu8sg/sk846kXGwwprCPhEsGsixoGHFURg6+OnyUsHryI+nIAB9i8khzk4
	8GzLvzs9d+g7oDgLHkM/NBFl7utG5TCVDn4Fs0XOn24fyQt3XoLC1fyfN8Y9I2KRM5Lp
	ThLEY9VAj2/3YtZTw9mpQf2B9JbYz5rUesBWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vgUeQVcNdAqSYVjf7X4B2XDy4dpJwgizl072wHry8oE=;
	b=Q5Sjnz+ClhcY4tWDAzi4Z9ogiRtdzMb2SQ3WnDmqRKDXYHpWC7mHkDEyJQVTmTbcM7
	cspo8sJEVO71VcwN1qKAJ4Ugh5LJd0FYmjFjlI9yXC3rzejYr60rqOegT/IPIFzuTKt2
	xDKzuDQVwmEZSkFlobyV/tYZXQwFaztzYgwX+1rmCCgjgfilMnQbsA4QvMW6pmHl8Gzb
	4xAOPsGZy0CvAsnMLjwQbaisTWXfpcoEIa91YetB9AEh8IBDF7D3KphL3XFZ2pE/FapP
	4goLpe5SBcP8bslmmsrQdFQo5DaN6isMRO0dVDox/vYwy9tcFTENYuYFqZ9PG5w2pzgH
	uvkQ==
X-Gm-Message-State: APf1xPAu6oVs20svv7T+LuHy83Me1x1mD6KQR/KvEXWSVUVoahkZh+sh
	NBHavFU8jj5ewhXM7Q4doxrwIppFBnY=
X-Received: by 2002:a17:902:ab85:: with SMTP id
	f5-v6mr9594068plr.199.1518891865475; 
	Sat, 17 Feb 2018 10:24:25 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:53 -0800
Message-Id: <20180217182323.25885-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-arm] [PATCH v2 37/67] target/arm: Implement SVE Integer
 Compare - Immediate Group
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fCcBDC/ApbAh

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 44 +++++++++++++++++++++++
 target/arm/sve_helper.c    | 88 ++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 63 +++++++++++++++++++++++++++++++++
 target/arm/sve.decode      | 23 ++++++++++++
 4 files changed, 218 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 6ffd1fbe8e..ae38c0a4be 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -605,6 +605,50 @@ DEF_HELPER_FLAGS_5(sve_cmplo_ppzw_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve_cmpls_ppzw_s, TCG_CALL_NO_RWG,
                    i32, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve_cmpeq_ppzi_b, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpne_ppzi_b, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpgt_ppzi_b, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpge_ppzi_b, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmplt_ppzi_b, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmple_ppzi_b, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmphs_ppzi_b, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmphi_ppzi_b, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmplo_ppzi_b, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpls_ppzi_b, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_cmpeq_ppzi_h, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpne_ppzi_h, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpgt_ppzi_h, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpge_ppzi_h, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmplt_ppzi_h, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmple_ppzi_h, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmphs_ppzi_h, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmphi_ppzi_h, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmplo_ppzi_h, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpls_ppzi_h, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_cmpeq_ppzi_s, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpne_ppzi_s, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpgt_ppzi_s, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpge_ppzi_s, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmplt_ppzi_s, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmple_ppzi_s, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmphs_ppzi_s, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmphi_ppzi_s, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmplo_ppzi_s, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpls_ppzi_s, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_cmpeq_ppzi_d, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpne_ppzi_d, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpgt_ppzi_d, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpge_ppzi_d, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmplt_ppzi_d, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmple_ppzi_d, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmphs_ppzi_d, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmphi_ppzi_d, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmplo_ppzi_d, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cmpls_ppzi_d, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index ae433861f8..b74db681f2 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2367,3 +2367,91 @@ DO_CMP_PPZW_S(sve_cmpls_ppzw_s, uint32_t, uint64_t, <=)
 #undef DO_CMP_PPZW_H
 #undef DO_CMP_PPZW_S
 #undef DO_CMP_PPZW
+
+/* Similar, but the second source is immediate.  */
+#define DO_CMP_PPZI(NAME, TYPE, OP, H, MASK)                         \
+uint32_t HELPER(NAME)(void *vd, void *vn, void *vg, uint32_t desc)   \
+{                                                                    \
+    intptr_t opr_sz = simd_oprsz(desc);                              \
+    uint32_t flags = PREDTEST_INIT;                                  \
+    TYPE mm = simd_data(desc);                                       \
+    intptr_t i = opr_sz;                                             \
+    do {                                                             \
+        uint64_t out = 0, pg;                                        \
+        do {                                                         \
+            i -= sizeof(TYPE), out <<= sizeof(TYPE);                 \
+            TYPE nn = *(TYPE *)(vn + H(i));                          \
+            out |= nn OP mm;                                         \
+        } while (i & 63);                                            \
+        pg = *(uint64_t *)(vg + (i >> 3)) & MASK;                    \
+        out &= pg;                                                   \
+        *(uint64_t *)(vd + (i >> 3)) = out;                          \
+        flags = iter_predtest_bwd(out, pg, flags);                   \
+    } while (i > 0);                                                 \
+    return flags;                                                    \
+}
+
+#define DO_CMP_PPZI_B(NAME, TYPE, OP) \
+    DO_CMP_PPZI(NAME, TYPE, OP, H1,   0xffffffffffffffffull)
+#define DO_CMP_PPZI_H(NAME, TYPE, OP) \
+    DO_CMP_PPZI(NAME, TYPE, OP, H1_2, 0x5555555555555555ull)
+#define DO_CMP_PPZI_S(NAME, TYPE, OP) \
+    DO_CMP_PPZI(NAME, TYPE, OP, H1_4, 0x1111111111111111ull)
+#define DO_CMP_PPZI_D(NAME, TYPE, OP) \
+    DO_CMP_PPZI(NAME, TYPE, OP,     , 0x0101010101010101ull)
+
+DO_CMP_PPZI_B(sve_cmpeq_ppzi_b, uint8_t,  ==)
+DO_CMP_PPZI_H(sve_cmpeq_ppzi_h, uint16_t, ==)
+DO_CMP_PPZI_S(sve_cmpeq_ppzi_s, uint32_t, ==)
+DO_CMP_PPZI_D(sve_cmpeq_ppzi_d, uint64_t, ==)
+
+DO_CMP_PPZI_B(sve_cmpne_ppzi_b, uint8_t,  !=)
+DO_CMP_PPZI_H(sve_cmpne_ppzi_h, uint16_t, !=)
+DO_CMP_PPZI_S(sve_cmpne_ppzi_s, uint32_t, !=)
+DO_CMP_PPZI_D(sve_cmpne_ppzi_d, uint64_t, !=)
+
+DO_CMP_PPZI_B(sve_cmpgt_ppzi_b, int8_t,  >)
+DO_CMP_PPZI_H(sve_cmpgt_ppzi_h, int16_t, >)
+DO_CMP_PPZI_S(sve_cmpgt_ppzi_s, int32_t, >)
+DO_CMP_PPZI_D(sve_cmpgt_ppzi_d, int64_t, >)
+
+DO_CMP_PPZI_B(sve_cmpge_ppzi_b, int8_t,  >=)
+DO_CMP_PPZI_H(sve_cmpge_ppzi_h, int16_t, >=)
+DO_CMP_PPZI_S(sve_cmpge_ppzi_s, int32_t, >=)
+DO_CMP_PPZI_D(sve_cmpge_ppzi_d, int64_t, >=)
+
+DO_CMP_PPZI_B(sve_cmphi_ppzi_b, uint8_t,  >)
+DO_CMP_PPZI_H(sve_cmphi_ppzi_h, uint16_t, >)
+DO_CMP_PPZI_S(sve_cmphi_ppzi_s, uint32_t, >)
+DO_CMP_PPZI_D(sve_cmphi_ppzi_d, uint64_t, >)
+
+DO_CMP_PPZI_B(sve_cmphs_ppzi_b, uint8_t,  >=)
+DO_CMP_PPZI_H(sve_cmphs_ppzi_h, uint16_t, >=)
+DO_CMP_PPZI_S(sve_cmphs_ppzi_s, uint32_t, >=)
+DO_CMP_PPZI_D(sve_cmphs_ppzi_d, uint64_t, >=)
+
+DO_CMP_PPZI_B(sve_cmplt_ppzi_b, int8_t,  <)
+DO_CMP_PPZI_H(sve_cmplt_ppzi_h, int16_t, <)
+DO_CMP_PPZI_S(sve_cmplt_ppzi_s, int32_t, <)
+DO_CMP_PPZI_D(sve_cmplt_ppzi_d, int64_t, <)
+
+DO_CMP_PPZI_B(sve_cmple_ppzi_b, int8_t,  <=)
+DO_CMP_PPZI_H(sve_cmple_ppzi_h, int16_t, <=)
+DO_CMP_PPZI_S(sve_cmple_ppzi_s, int32_t, <=)
+DO_CMP_PPZI_D(sve_cmple_ppzi_d, int64_t, <=)
+
+DO_CMP_PPZI_B(sve_cmplo_ppzi_b, uint8_t,  <)
+DO_CMP_PPZI_H(sve_cmplo_ppzi_h, uint16_t, <)
+DO_CMP_PPZI_S(sve_cmplo_ppzi_s, uint32_t, <)
+DO_CMP_PPZI_D(sve_cmplo_ppzi_d, uint64_t, <)
+
+DO_CMP_PPZI_B(sve_cmpls_ppzi_b, uint8_t,  <=)
+DO_CMP_PPZI_H(sve_cmpls_ppzi_h, uint16_t, <=)
+DO_CMP_PPZI_S(sve_cmpls_ppzi_s, uint32_t, <=)
+DO_CMP_PPZI_D(sve_cmpls_ppzi_d, uint64_t, <=)
+
+#undef DO_CMP_PPZI_B
+#undef DO_CMP_PPZI_H
+#undef DO_CMP_PPZI_S
+#undef DO_CMP_PPZI_D
+#undef DO_CMP_PPZI
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index cb54777108..a7eeb122e3 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -39,6 +39,8 @@ typedef void GVecGen2iFn(unsigned, uint32_t, uint32_t,
 typedef void GVecGen3Fn(unsigned, uint32_t, uint32_t,
                         uint32_t, uint32_t, uint32_t);
 
+typedef void gen_helper_gvec_flags_3(TCGv_i32, TCGv_ptr, TCGv_ptr,
+                                     TCGv_ptr, TCGv_i32);
 typedef void gen_helper_gvec_flags_4(TCGv_i32, TCGv_ptr, TCGv_ptr,
                                      TCGv_ptr, TCGv_ptr, TCGv_i32);
 
@@ -2572,6 +2574,67 @@ DO_PPZW(CMPLS, cmpls)
 
 #undef DO_PPZW
 
+/*
+ *** SVE Integer Compare - Immediate Groups
+ */
+
+static void do_ppzi_flags(DisasContext *s, arg_rpri_esz *a,
+                          gen_helper_gvec_flags_3 *gen_fn)
+{
+    TCGv_ptr pd, zn, pg;
+    unsigned vsz;
+    TCGv_i32 t;
+
+    if (gen_fn == NULL) {
+        unallocated_encoding(s);
+        return;
+    }
+
+    vsz = vec_full_reg_size(s);
+    t = tcg_const_i32(simd_desc(vsz, vsz, a->imm));
+    pd = tcg_temp_new_ptr();
+    zn = tcg_temp_new_ptr();
+    pg = tcg_temp_new_ptr();
+
+    tcg_gen_addi_ptr(pd, cpu_env, pred_full_reg_offset(s, a->rd));
+    tcg_gen_addi_ptr(zn, cpu_env, vec_full_reg_offset(s, a->rn));
+    tcg_gen_addi_ptr(pg, cpu_env, pred_full_reg_offset(s, a->pg));
+
+    gen_fn(t, pd, zn, pg, t);
+
+    tcg_temp_free_ptr(pd);
+    tcg_temp_free_ptr(zn);
+    tcg_temp_free_ptr(pg);
+
+    do_pred_flags(t);
+
+    tcg_temp_free_i32(t);
+}
+
+#define DO_PPZI(NAME, name) \
+static void trans_##NAME##_ppzi(DisasContext *s, arg_rpri_esz *a,         \
+                                uint32_t insn)                            \
+{                                                                         \
+    static gen_helper_gvec_flags_3 * const fns[4] = {                     \
+        gen_helper_sve_##name##_ppzi_b, gen_helper_sve_##name##_ppzi_h,   \
+        gen_helper_sve_##name##_ppzi_s, gen_helper_sve_##name##_ppzi_d,   \
+    };                                                                    \
+    do_ppzi_flags(s, a, fns[a->esz]);                                     \
+}
+
+DO_PPZI(CMPEQ, cmpeq)
+DO_PPZI(CMPNE, cmpne)
+DO_PPZI(CMPGT, cmpgt)
+DO_PPZI(CMPGE, cmpge)
+DO_PPZI(CMPHI, cmphi)
+DO_PPZI(CMPHS, cmphs)
+DO_PPZI(CMPLT, cmplt)
+DO_PPZI(CMPLE, cmple)
+DO_PPZI(CMPLO, cmplo)
+DO_PPZI(CMPLS, cmpls)
+
+#undef DO_PPZI
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index deedc9163b..0e317d7d48 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -132,6 +132,11 @@
 @rdn_dbm	........ .. .... dbm:13 rd:5 \
 		&rr_dbm rn=%reg_movprfx
 
+# Predicate output, vector and immediate input,
+# controlling predicate, element size.
+@pd_pg_rn_i7	........ esz:2 . imm:7 . pg:3 rn:5 . rd:4	&rpri_esz
+@pd_pg_rn_i5	........ esz:2 . imm:s5 ... pg:3 rn:5 . rd:4	&rpri_esz
+
 # Basic Load/Store with 9-bit immediate offset
 @pd_rn_i9	........ ........ ...... rn:5 . rd:4	\
 		&rri imm=%imm9_16_10
@@ -497,6 +502,24 @@ CMPHI_ppzw	00100100 .. 0 ..... 110 ... ..... 1 ....	@pd_pg_rn_rm
 CMPLO_ppzw	00100100 .. 0 ..... 111 ... ..... 0 ....	@pd_pg_rn_rm
 CMPLS_ppzw	00100100 .. 0 ..... 111 ... ..... 1 ....	@pd_pg_rn_rm
 
+### SVE Integer Compare - Unsigned Immediate Group
+
+# SVE integer compare with unsigned immediate
+CMPHS_ppzi	00100100 .. 1 ....... 0 ... ..... 0 ....      @pd_pg_rn_i7
+CMPHI_ppzi	00100100 .. 1 ....... 0 ... ..... 1 ....      @pd_pg_rn_i7
+CMPLO_ppzi	00100100 .. 1 ....... 1 ... ..... 0 ....      @pd_pg_rn_i7
+CMPLS_ppzi	00100100 .. 1 ....... 1 ... ..... 1 ....      @pd_pg_rn_i7
+
+### SVE Integer Compare - Signed Immediate Group
+
+# SVE integer compare with signed immediate
+CMPGE_ppzi	00100101 .. 0 ..... 000 ... ..... 0 ....      @pd_pg_rn_i5
+CMPGT_ppzi	00100101 .. 0 ..... 000 ... ..... 1 ....      @pd_pg_rn_i5
+CMPLT_ppzi	00100101 .. 0 ..... 001 ... ..... 0 ....      @pd_pg_rn_i5
+CMPLE_ppzi	00100101 .. 0 ..... 001 ... ..... 1 ....      @pd_pg_rn_i5
+CMPEQ_ppzi	00100101 .. 0 ..... 100 ... ..... 0 ....      @pd_pg_rn_i5
+CMPNE_ppzi	00100101 .. 0 ..... 100 ... ..... 1 ....      @pd_pg_rn_i5
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.14.3

