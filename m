Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp930476njk;
        Fri, 24 Jan 2025 08:35:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUK33mBgeAaAN2Y2fIxdNng1MLm6+SuNbQLNIzAV933hA0A/pgbYS4pfYMBoL4CRYFOjH6pRJ89X/MpqA==@linaro.org
X-Google-Smtp-Source: AGHT+IGQPjTNY4EEy7CJ8vUJPT1EivSmaEW00eBZd/C696NMZgeWzn2d6SyCdr9il7kIucGn5Q7o
X-Received: by 2002:ac8:5712:0:b0:467:51d7:e13 with SMTP id d75a77b69052e-46e67032084mr55534221cf.9.1737736515661;
        Fri, 24 Jan 2025 08:35:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736515; cv=none;
        d=google.com; s=arc-20240605;
        b=adRqa2RiUgc0Q2B6wL9WctKj+gcqSyxzmjMmz741FjJYg/V2jSVC12nFCGTe1L4+9L
         9paOOLYRvBRe/dqLKW03y1IWUpCHbND6DNC8iXFJSAyThShHbkkArTKqc0+Lx5Moq37b
         /ireDnTlqISajodrUPOEYfULtmjGc7f+fnO4L1UK/gGCsrp4UKdWv7ZHAioxjzeWMbXV
         DW4Ds0Wg3pxri3iNnw4NhEUTUXZ79whe6Xd8XcamQkwrIKvVuyWT3MZJYk7gKQ56mi65
         Dstc1IIU6fyiJsq4bGVVqKULUcA5lBsnBVTZ//exzQgt1mAaxVxjlpB6bh9Am7C+aO0z
         HOJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0LRgE5sYkagidW3WnsnXPvw6PPdsduRp7Jmx+Kr/CH8=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=Y4rvnJBl6ZuA+NesRnxw+oWZbxG0QrFFxyVzIVM0Z424s3XGD2kmBL2o5aDi7ME+EZ
         YWZP6/Ivz4pAiEPuq+fMD1p5CaYZFxEQIwKQpa7K8V5Pb6qI9qTrdg0aUW9NScG5Vnzs
         +0t80OQyfRgi4s9Gf1GX+GAVFyP0nobFpoVmmOU7JTF5nJ5a4qSbJpbpfDkwPn3i8TBi
         mwbHdQE64gcl7IX1n2FTlXNtaRX9lIsRRwIBnQ2NYOZCBa74zB9HIVPwcxGjAH6U/D6v
         lmzoqfqbCSR5Q46JDjvPX1pVvgv77VN11y5r3DHcG8WQzSRsjui8WWTQOSntCYbCSjG4
         p6+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pzNUrEb8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-864a9d086a9si693792241.126.2025.01.24.08.35.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:35:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pzNUrEb8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMc9-0004uY-WE; Fri, 24 Jan 2025 11:33:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZ2-0005jF-3z
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:51 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZ0-0005jM-Ee
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:47 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-385eed29d17so1273940f8f.0
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736184; x=1738340984; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0LRgE5sYkagidW3WnsnXPvw6PPdsduRp7Jmx+Kr/CH8=;
 b=pzNUrEb8G4iopC1dIF1xZMzR0h6Wr6mzU/bj3S1pELLDfgVztjNUw/PfovIk0RQD7b
 fYXCdZ1V5ss5NTRlE7ozlTykoxSn+ooYQlsPG0shYAm7SosjBJ0kBEfkhSwVWcLvX/n+
 bYyb862npRaEjmqHKZQ1A8hKdxh856dznb8ItQCe4iHOjz1eAUcHP8AeA8A2w3d65XZz
 IjVLMmmkT7/+822B+prShWPzFYFLZdDmU/C9DtqDKaldiYgkIXFzg4UuyMFzaRttx4Gt
 wQ3GYKAm7+RkI2eromdjIZtVdju0vzs2g6gDdarLZe5o/O8Y9bmJyVA04u1JtWl010GM
 7xpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736184; x=1738340984;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0LRgE5sYkagidW3WnsnXPvw6PPdsduRp7Jmx+Kr/CH8=;
 b=BeJEUoQcIjcv/zjatjqaNyf1LNRGU0Pt/V70ELEc6BFl2lvWpaQFIJJzAZcFF6GLmc
 iLgNj3A5E2Z5vJuA+ASEheBMcTDAWKGXm5ppjqJWlohzn5szub1zI6kXw2Vn7U0BcVh9
 FJBj9ojtQmH0jAxtchhaoE3WI4GvJAHxxv1tB5nslBEv6M9gFQOhqXtjNONZ/PGOIRsH
 MPz1dKd1fDPJf6KFhP0OOajjpcenoGSwAurd4jwTJzecNYv1GdVP3qMHzZr347cnr3gW
 KUTWoyvBJKaVnJuneGoBxcHnr8OracM9mm3AGq06VFHvoO1N7qdUM8BKLYCz+IjMUi/G
 guXA==
X-Gm-Message-State: AOJu0Ywmb+zY0ymYkyV+oFoBEBJasObxYOFt2ZoQt1DTMv9mM5q64u1F
 31BLxkVkEHeYUHRJurDuJVXNZlAsm16ZAlMi8yfTti8MMojiwZ2Jab/9VDP5WpcSy4Pv69uvoUK
 Z
X-Gm-Gg: ASbGncv9xCWqIdQ+9qHlaRgY0POXGZAszVrfdMniVYZiTY7o/3z0tKhwUNTrYqZ7oTX
 DK7HhbhFbMehinBVKu31oseQZAap7UZIHffc6LsSiosPJ30Svkpw0BYFXxr+MUaO6frUTWschoB
 q1OIpCJzc86wrIHBaydpp1ASG0rVBJ9IJp7fgtqRbU0aRR3EdEvf5XKlUJyeYuxIob0Pf4br4Ji
 wgFgDL6o8xx3xsACABgUIYBmCIgFPYK2Re1pGIStSvuCo+Tz3gYysLhzICCPdsjg0tgMQdzgXaS
 7fEU0Zenivg=
X-Received: by 2002:a05:6000:1a87:b0:385:fc32:1ec6 with SMTP id
 ffacd0b85a97d-38bf57bb947mr24409151f8f.50.1737736184650; 
 Fri, 24 Jan 2025 08:29:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 53/76] target/arm: Implement FPCR.AH handling for scalar FABS
 and FABD
Date: Fri, 24 Jan 2025 16:28:13 +0000
Message-Id: <20250124162836.2332150-54-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: q1GJvmhesZhm

FPCR.AH == 1 mandates that taking the absolute value of a NaN should
not change its sign bit.  This means we can no longer use
gen_vfp_abs*() everywhere but must instead generate slightly more
complex code when FPCR.AH is set.

Implement these semantics for scalar FABS and FABD.  This change also
affects all other instructions whose psuedocode calls FPAbs(); we
will extend the change to those instructions in following commits.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a64.c | 69 +++++++++++++++++++++++++++++++++-
 1 file changed, 67 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 085b29ee536..542e774790b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -880,6 +880,43 @@ static void gen_vfp_ah_negd(TCGv_i64 d, TCGv_i64 s)
                         s, chs_s);
 }
 
+/*
+ * These functions implement
+ *  d = floatN_is_any_nan(s) ? s : floatN_abs(s)
+ * which for float32 is
+ *  d = (s & ~(1 << 31)) > 0x7f800000UL) ? s : (s & ~(1 << 31))
+ * and similarly for the other float sizes.
+ */
+static void gen_vfp_ah_absh(TCGv_i32 d, TCGv_i32 s)
+{
+    TCGv_i32 abs_s = tcg_temp_new_i32();
+
+    gen_vfp_absh(abs_s, s);
+    tcg_gen_movcond_i32(TCG_COND_GTU, d,
+                        abs_s, tcg_constant_i32(0x7c00),
+                        s, abs_s);
+}
+
+static void gen_vfp_ah_abss(TCGv_i32 d, TCGv_i32 s)
+{
+    TCGv_i32 abs_s = tcg_temp_new_i32();
+
+    gen_vfp_abss(abs_s, s);
+    tcg_gen_movcond_i32(TCG_COND_GTU, d,
+                        abs_s, tcg_constant_i32(0x7f800000UL),
+                        s, abs_s);
+}
+
+static void gen_vfp_ah_absd(TCGv_i64 d, TCGv_i64 s)
+{
+    TCGv_i64 abs_s = tcg_temp_new_i64();
+
+    gen_vfp_absd(abs_s, s);
+    tcg_gen_movcond_i64(TCG_COND_GTU, d,
+                        abs_s, tcg_constant_i64(0x7ff0000000000000ULL),
+                        s, abs_s);
+}
+
 static void gen_vfp_maybe_ah_negh(DisasContext *dc, TCGv_i32 d, TCGv_i32 s)
 {
     if (dc->fpcr_ah) {
@@ -5403,12 +5440,35 @@ static void gen_fabd_d(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_ptr s)
     gen_vfp_absd(d, d);
 }
 
+static void gen_fabd_ah_h(TCGv_i32 d, TCGv_i32 n, TCGv_i32 m, TCGv_ptr s)
+{
+    gen_helper_vfp_subh(d, n, m, s);
+    gen_vfp_ah_absh(d, d);
+}
+
+static void gen_fabd_ah_s(TCGv_i32 d, TCGv_i32 n, TCGv_i32 m, TCGv_ptr s)
+{
+    gen_helper_vfp_subs(d, n, m, s);
+    gen_vfp_ah_abss(d, d);
+}
+
+static void gen_fabd_ah_d(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_ptr s)
+{
+    gen_helper_vfp_subd(d, n, m, s);
+    gen_vfp_ah_absd(d, d);
+}
+
 static const FPScalar f_scalar_fabd = {
     gen_fabd_h,
     gen_fabd_s,
     gen_fabd_d,
 };
-TRANS(FABD_s, do_fp3_scalar, a, &f_scalar_fabd, a->rn)
+static const FPScalar f_scalar_ah_fabd = {
+    gen_fabd_ah_h,
+    gen_fabd_ah_s,
+    gen_fabd_ah_d,
+};
+TRANS(FABD_s, do_fp3_scalar_2fn, a, &f_scalar_fabd, &f_scalar_ah_fabd, a->rn)
 
 static const FPScalar f_scalar_frecps = {
     gen_helper_recpsf_f16,
@@ -8654,7 +8714,12 @@ static const FPScalar1Int f_scalar_fabs = {
     gen_vfp_abss,
     gen_vfp_absd,
 };
-TRANS(FABS_s, do_fp1_scalar_int, a, &f_scalar_fabs, true)
+static const FPScalar1Int f_scalar_ah_fabs = {
+    gen_vfp_ah_absh,
+    gen_vfp_ah_abss,
+    gen_vfp_ah_absd,
+};
+TRANS(FABS_s, do_fp1_scalar_int_2fn, a, &f_scalar_fabs, &f_scalar_ah_fabs)
 
 static const FPScalar1Int f_scalar_fneg = {
     gen_vfp_negh,
-- 
2.34.1

