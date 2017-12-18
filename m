Received: by 10.223.159.74 with SMTP id f10csp2972363wrg;
        Mon, 18 Dec 2017 10:23:16 -0800 (PST)
X-Google-Smtp-Source: ACJfBoteexe5HmxvF/scIkuaeQlVuV+JZmqV7d9feXzGu+iQ/UbbDuMeyRxb6TlIVSr2voxbnDp3
X-Received: by 10.37.180.17 with SMTP id n17mr541361ybj.367.1513621396510;
        Mon, 18 Dec 2017 10:23:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513621396; cv=none;
        d=google.com; s=arc-20160816;
        b=MomIlAW6MnOjDfxtQkqOJQP3AkCUZC8GZq38bP885FA79K/cb49MH9Yb2We+Cn1n8G
         qDJFPIkiyXEl1IJdkArL+DjuezHujysP7o7QbJivKzquLIH/MwJIglQt+jkyYDNMgS/a
         IhVp8tmV5nzJ7ZQByQP5Y72OWLq8UZ9KpGzbp9IinjRTQ2IboqIarHWZyxGL+HkPleno
         of+0s3I3RsXNSxY0rhM6kFnYOTrlcjvbDX75RTR9zM/ZRaqstA+AYXDa+T+E6zLHzeLU
         30G1vTXJ5ZEgEmdgTCUq3gvrS0803L+0ge92XrNXbQyExnARadd7DyUsRCS97CHx8snY
         Dz7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=k8F0HjW9dFA0ovtDS/CZjiEOnmVa5Jw57Xx7i6w7EhA=;
        b=O0Oo+wtjHLqtcjiv/uSHxvRuVH8dlnmSKSKOyEuxAtYNkfS4c4mFmhj/MqbBrYk3os
         4ac3invmrFJc2E/MhrwtKARXo+1f5YA5APBOPvM8X3OHtCyumikbpjUPqZbcQTwL+m5/
         4iZgKGMjkXfEbN1QTwoHS6MxTxczLdDG2Duoe3hBu9NY41urOYmbNgvhBjK4uB47//6N
         KrWZwLgQLMTHrtbL8+nlqvSfUYOws1ecDaV96K51S0Q2FtmmTxpTaMnf52xsngIiIUmi
         MNv0SnN0qqNFGZaNKN+n1R9EAVBT1L1OGNaONO1faLZ7B4sUmrHiCGERbpAilpCRJGuc
         yZUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rua+aG9o;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o190si442189yba.186.2017.12.18.10.23.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 10:23:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rua+aG9o;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36583 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eR04J-0002Ia-Pf
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 13:23:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUP-00089l-V6
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 12:46:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUO-0001ww-TN
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 12:46:09 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:41801)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQzUO-0001vm-L9
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 12:46:08 -0500
Received: by mail-pf0-x244.google.com with SMTP id j28so9963315pfk.8
	for <qemu-devel@nongnu.org>; Mon, 18 Dec 2017 09:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=k8F0HjW9dFA0ovtDS/CZjiEOnmVa5Jw57Xx7i6w7EhA=;
	b=Rua+aG9oZv539Nr+S7cb4QQctCvYIN6UazkxzjzNI1elClLXMdtg5TuzQVZaTphbdY
	WgLGQdb/8yPG3kkVW6VO4wKYL7gLIMV7yeusMiPMJatsmu5uDukYnttvQ5/ym/c9Drsx
	d1HhapimgdhwwPN6gmHp05weNJCEC/Mw0SHUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=k8F0HjW9dFA0ovtDS/CZjiEOnmVa5Jw57Xx7i6w7EhA=;
	b=Bgdmu+OxM7wpXWHtuyViEpNKZXxl8NGwBrbAzJZO2XanpvtyJlcnYLLyYuIJ4aifu4
	oy0WHoCoejoGcRODe5goJaNDtAkJOGwI909vdmQIj8FFge65EswEoIDd4LmLfuZ96Wfm
	KEgLzoB7MC5zfYNepmGmStu1Lk7nSJ9flfx0NGU6FLlwwKI8PoUDMevh8ampIP0JfZTN
	MjjUpRM2DGahXCrWHoK8C5rY4CJOzjNYcHXmEqJDXgqM6iFTkfABMqhG+p9VXKt9f0Jt
	Ut8Wttbgpj6nhmGO5zo033eQH6B2hqR7by9qRrEMDhibCg29ywQhTlqbLoF8V45XcwUA
	howg==
X-Gm-Message-State: AKGB3mL/t/Yi/1r5vUmqjGkTznLDWyQycGLtbrMAFro1Yv9/k1g9D06b
	A1EIJ5OMSlSQyXWRKIdvTsrlWw3pV+8=
X-Received: by 10.99.132.195 with SMTP id k186mr447536pgd.130.1513619167266;
	Mon, 18 Dec 2017 09:46:07 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63]) by smtp.gmail.com with ESMTPSA id
	t84sm26209657pfe.160.2017.12.18.09.46.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:46:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:45:37 -0800
Message-Id: <20171218174552.18871-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171218174552.18871-1-richard.henderson@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-devel] [PATCH 08/23] target/arm: Handle SVE registers in
 write_fp_dreg
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LWr+oeJiGw4H

When storing to an AdvSIMD FP register, all of the high
bits of the SVE register are zeroed.  At the same time,
export the function for use in translate-sve.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h |  1 +
 target/arm/translate-a64.c | 32 ++++++++++++++++++--------------
 2 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 9014b5bf8b..07861fa9c6 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -35,6 +35,7 @@ TCGv_i64 cpu_reg(DisasContext *s, int reg);
 TCGv_i64 cpu_reg_sp(DisasContext *s, int reg);
 TCGv_i64 read_cpu_reg(DisasContext *s, int reg, int sf);
 TCGv_i64 read_cpu_reg_sp(DisasContext *s, int reg, int sf);
+void write_fp_dreg(DisasContext *s, int reg, TCGv_i64 v);
 
 /* We should have at some point before trying to access an FP register
  * done the necessary access check, so assert that
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 8be1660661..b951045820 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -533,13 +533,28 @@ static TCGv_i32 read_fp_sreg(DisasContext *s, int reg)
     return v;
 }
 
-static void write_fp_dreg(DisasContext *s, int reg, TCGv_i64 v)
+/* Clear the bits above an 64-bit vector.
+ * If SVE is not enabled, then there are only 128 bits in the vector.
+ */
+static void clear_vec_high(DisasContext *s, int rd)
 {
+    unsigned ofs = fp_reg_offset(s, rd, MO_64);
+    unsigned vsz = vec_full_reg_size(s);
     TCGv_i64 tcg_zero = tcg_const_i64(0);
 
-    tcg_gen_st_i64(v, cpu_env, fp_reg_offset(s, reg, MO_64));
-    tcg_gen_st_i64(tcg_zero, cpu_env, fp_reg_hi_offset(s, reg));
+    tcg_gen_st_i64(tcg_zero, cpu_env, ofs + 8);
     tcg_temp_free_i64(tcg_zero);
+    if (vsz > 16) {
+        tcg_gen_gvec_dup8i(ofs + 16, vsz - 16, vsz - 16, 0);
+    }
+}
+
+void write_fp_dreg(DisasContext *s, int reg, TCGv_i64 v)
+{
+    unsigned ofs = fp_reg_offset(s, reg, MO_64);
+
+    tcg_gen_st_i64(v, cpu_env, ofs);
+    clear_vec_high(s, reg);
 }
 
 static void write_fp_sreg(DisasContext *s, int reg, TCGv_i32 v)
@@ -1015,17 +1030,6 @@ static void write_vec_element_i32(DisasContext *s, TCGv_i32 tcg_src,
     }
 }
 
-/* Clear the high 64 bits of a 128 bit vector (in general non-quad
- * vector ops all need to do this).
- */
-static void clear_vec_high(DisasContext *s, int rd)
-{
-    TCGv_i64 tcg_zero = tcg_const_i64(0);
-
-    write_vec_element(s, tcg_zero, rd, 1, MO_64);
-    tcg_temp_free_i64(tcg_zero);
-}
-
 /* Store from vector register to memory */
 static void do_vec_st(DisasContext *s, int srcidx, int element,
                       TCGv_i64 tcg_addr, int size)
-- 
2.14.3

