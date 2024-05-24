Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1993853ejb;
        Fri, 24 May 2024 16:25:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUL34f6yox3H02vsKNqe2dYkrYZagbl2oa7NJoov3CrI1HISbdLETe3kahQ+Q8ji2W5wUOHz//twLWFkUYASHhA0KVkJAKq
X-Google-Smtp-Source: AGHT+IGsp1WAElZ8Fb/ZKUQexFI+mWalKcsFbsUPas3vvaZ79fjG5TCh1XaV5blvMAavWsc4XG/A
X-Received: by 2002:a05:622a:11c9:b0:43e:1a17:10f9 with SMTP id d75a77b69052e-43fb0f12584mr34387841cf.52.1716593127971;
        Fri, 24 May 2024 16:25:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716593127; cv=none;
        d=google.com; s=arc-20160816;
        b=SBeoUQWsGGTgIXLwMazcOMZOkPzVhRIv2jR7trL+5G52xsQdCRF/ASs3uHYhz0IEMY
         hhB4aTs/+ImSSol5KhHTJNQIBTq2IYHDDoPf3zHIfon2v2i7mgdPvnNSV8JCFIuGtEZd
         zfJi3KD4DeuGNbS++P6PCMkoLtEwJhkasoDYFqbgWkYHZvhv9iFqDrpY/wQtuqhzVmHE
         CEOxAHXd7kOuUWSyvFbBqYxl0I3T47rLyZAxg4Pa3dIpkBOGYMjk2OPVD1SCgtdgmR/A
         9d+zNy37B2J8jRB0y1r8LVXSHJxWPPRqek2uz3dcTXsROOhf+iNBN9vciHvUDX8aGgMB
         SwsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KJ19wgsVZPJfoFhDASr+UuLwteG8CXuQPId+c/bWmuc=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=Pv/tfNJSXzWTe2Ph2Lx/MRXm92mnHaBWpYmo8OxGD9gI2tjjSVWXeo1l+7RUcGA7Ce
         vb+e3FrzA9uFRm+Zlk75+nwr18ZK/B1hzj2fkiD76w33mULvY67BplZec8CFfN6GpCL9
         Hg5OjKL14+AtbCgUYWiSimt71Wu8/7E/sKijR02ZEdvMsXbR1WG/PN0CXGJ3UusYHgl5
         yPc9axPUepWypf1GFlZRbsgKrHfPS0SU02g1o1IK3QaeKVmlATk5QV818yBVPRMHHbbv
         fOgcEnrGnETJ5+mD0pb7qnJgv67siIXidUq5KWoAnjti+gSeMUzLkp0msH1+DVvkgAgP
         Gi2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cakvcSx+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18c9f98si32824721cf.608.2024.05.24.16.25.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 16:25:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cakvcSx+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sAeEc-0006or-6A; Fri, 24 May 2024 19:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeEa-0006mz-UO
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:22:01 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeES-0005tC-JM
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:22:00 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1f3406f225bso17675555ad.3
 for <qemu-arm@nongnu.org>; Fri, 24 May 2024 16:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716592911; x=1717197711; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KJ19wgsVZPJfoFhDASr+UuLwteG8CXuQPId+c/bWmuc=;
 b=cakvcSx+yEJUG/A1/JcBI1gGsVUzR1bEA0+8nERjaevA5QUOaVK71aYpIDFmByt+xO
 pcrN4bY7CXFk1VAA6m6FK/ALvaIccipwfssMR9TTNK16S3mnHmj1m3zWLnRc3LKSgCsz
 f0V8EnYD/nJ+mJl2M89dkReSLENNlHqtztI4PjXo9bXZm+9YKM+xbougViJuF0nc65LR
 xnfwNv5VbprAF/7iJaWfDg2qLtWp9Pi7txZZjkyyMfNimb4KG8mxsCSdAGqygmo0dvRy
 AZA7JcVANK3nVMT72DfxVVWQC9Y8yvY7kICS3agCKPe3q+ekCzbGQw3xdQxWSKkASjhm
 5BbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716592911; x=1717197711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KJ19wgsVZPJfoFhDASr+UuLwteG8CXuQPId+c/bWmuc=;
 b=I5PFqLxJbQPUKUFa8X8evl1u2KKSO8kbNkjazLCuZrKr/n9YND7IwI674yocp2nynu
 5uLQPUcig6DrHwSffF80lnp5mS7MKGFmPPa2zbG5r1KoPlmo6D8drzRbhpj7kmptkxD2
 FtXm1jJOAvQoP3XUeFeJKyl6a8Io3DrhqHJHm7v+CFiUAoWa3MoFXTbs793aTWO12v4+
 BnnJ01QALDwyGISJnFBSIkOkcM22GYu4rBDeVFR88+xW3xR/H2DNJW0d5zJ95Eqozn21
 Wz9/e895L/7nzdhD4wXb0CnmlrPXmlaNs1ugR204IIte0st4MReCdtL3l0Ba0bZ5cSyN
 00Rw==
X-Gm-Message-State: AOJu0YyKXKtVKXCVe0FyHf377pjKMwJQzkP8P3c4gejoVWOTwf002nA/
 auiJkAs6/s8+K7UT8TELAkAli7V+2NCAkcyBzZX//Fsltvrpy0VILegDXSfDyHk=
X-Received: by 2002:a17:902:e88a:b0:1f3:244:c619 with SMTP id
 d9443c01a7336-1f4486fd2admr46428565ad.7.1716592911273; 
 Fri, 24 May 2024 16:21:51 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c759ceesm19178305ad.10.2024.05.24.16.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 16:21:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 32/67] target/arm: Use gvec for neon padd
Date: Fri, 24 May 2024 16:20:46 -0700
Message-Id: <20240524232121.284515-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524232121.284515-1-richard.henderson@linaro.org>
References: <20240524232121.284515-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 1FeECPOm75bQ

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h             | 2 --
 target/arm/tcg/neon_helper.c    | 5 -----
 target/arm/tcg/translate-neon.c | 3 +--
 3 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index d3579a101f..51ed49aa50 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -354,8 +354,6 @@ DEF_HELPER_3(neon_qrshl_s64, i64, env, i64, i64)
 
 DEF_HELPER_2(neon_add_u8, i32, i32, i32)
 DEF_HELPER_2(neon_add_u16, i32, i32, i32)
-DEF_HELPER_2(neon_padd_u8, i32, i32, i32)
-DEF_HELPER_2(neon_padd_u16, i32, i32, i32)
 DEF_HELPER_2(neon_sub_u8, i32, i32, i32)
 DEF_HELPER_2(neon_sub_u16, i32, i32, i32)
 DEF_HELPER_2(neon_mul_u8, i32, i32, i32)
diff --git a/target/arm/tcg/neon_helper.c b/target/arm/tcg/neon_helper.c
index bc6c4a54e9..a0b51c8809 100644
--- a/target/arm/tcg/neon_helper.c
+++ b/target/arm/tcg/neon_helper.c
@@ -745,11 +745,6 @@ uint32_t HELPER(neon_add_u16)(uint32_t a, uint32_t b)
     return (a + b) ^ mask;
 }
 
-#define NEON_FN(dest, src1, src2) dest = src1 + src2
-NEON_POP(padd_u8, neon_u8, 4)
-NEON_POP(padd_u16, neon_u16, 2)
-#undef NEON_FN
-
 #define NEON_FN(dest, src1, src2) dest = src1 - src2
 NEON_VOP(sub_u8, neon_u8, 4)
 NEON_VOP(sub_u16, neon_u16, 2)
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index 2326a05a0a..6c5a7a98e1 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -830,6 +830,7 @@ DO_3SAME_NO_SZ_3(VABD_S, gen_gvec_sabd)
 DO_3SAME_NO_SZ_3(VABA_S, gen_gvec_saba)
 DO_3SAME_NO_SZ_3(VABD_U, gen_gvec_uabd)
 DO_3SAME_NO_SZ_3(VABA_U, gen_gvec_uaba)
+DO_3SAME_NO_SZ_3(VPADD, gen_gvec_addp)
 
 #define DO_3SAME_CMP(INSN, COND)                                        \
     static void gen_##INSN##_3s(unsigned vece, uint32_t rd_ofs,         \
@@ -1070,13 +1071,11 @@ static bool do_3same_pair(DisasContext *s, arg_3same *a, NeonGenTwoOpFn *fn)
 #define gen_helper_neon_pmax_u32  tcg_gen_umax_i32
 #define gen_helper_neon_pmin_s32  tcg_gen_smin_i32
 #define gen_helper_neon_pmin_u32  tcg_gen_umin_i32
-#define gen_helper_neon_padd_u32  tcg_gen_add_i32
 
 DO_3SAME_PAIR(VPMAX_S, pmax_s)
 DO_3SAME_PAIR(VPMIN_S, pmin_s)
 DO_3SAME_PAIR(VPMAX_U, pmax_u)
 DO_3SAME_PAIR(VPMIN_U, pmin_u)
-DO_3SAME_PAIR(VPADD, padd_u)
 
 #define DO_3SAME_VQDMULH(INSN, FUNC)                                    \
     WRAP_ENV_FN(gen_##INSN##_tramp16, gen_helper_neon_##FUNC##_s16);    \
-- 
2.34.1

