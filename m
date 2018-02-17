Received: by 10.28.71.27 with SMTP id u27csp2084048wma;
        Sat, 17 Feb 2018 10:43:25 -0800 (PST)
X-Google-Smtp-Source: AH8x2273lNMiVS/Za2HmEDqlOBQ+j6UHYU5y3Wq2CTbXzdgXZ/Na08EqnSvcA9HiRa417w+ilukJ
X-Received: by 10.37.218.147 with SMTP id n141mr7138669ybf.104.1518893005061;
        Sat, 17 Feb 2018 10:43:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518893005; cv=none;
        d=google.com; s=arc-20160816;
        b=I0OPbcViz6OdBPSWRSDLoFwyRVloaIBMCwSxb1F3E71ri+UPyWbvHSfPIhzzYj8cxZ
         /MjZ2QQ3Z+zBRdnGNglj2WDZRHEf5A+hy2H0jEYmD99PCwCGkJUAbkebsNfbwOYbry8m
         0WlLWNhvPKLUDaRySPsOuUCVabMihv9U7Nu+ISaRmpKrh54OPw0yQHcR+IVqYUNnK2yX
         Ic/kIj6UutXStTTVt5bzl/Lgt9mQjAp9c5cRL4n57ZRIx6zUaEzccFjy367Gcyc+bXxa
         gZLoIsZAnSVDhfUJN9fNFVNEtRMzrr0lgwXeLinEA8yGnz78bheGCwLuKAvL/4ikTxeg
         msEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=nSNLVT4lf1W1WDzUmj9fhH5V3ch8xkv1gwPhXGeJ6r0=;
        b=jovZoLoGpfjy0b23/2V6s7F1KOyo2sZwh60B0WUT2xFS7gEvVxgIEeTu2U7BKXs160
         FGv9C9hrBMmq99TD/3YWyFGInVldy48/iFR7WC9q0lPXeJtm8rGvAYlTAejKdRk/GOmu
         JEwTBrE7KBjpTaqoJoUXDT+n2p93nXmJ7jnUrmaArn7kOa8vjDXV+tlF/ZPGAHGbkkKZ
         JxdLcSnIgrUrkc6CLoBYBdD6g6ts3CLRQ7MzRPwYEfe0PieUseR6vZyzoR25zdxmaMO5
         uFKDFIzj7bGVdlav54gTutKu7o7melA/THrGZ5LpsP3SGRINH5zuiMqI/bjnIQEtd9ae
         /Udg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XMEvR+3c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p184si3149053ywh.791.2018.02.17.10.43.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:43:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XMEvR+3c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48205 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7SG-0008Fp-FP
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:43:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40063)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79b-0000gz-Gq
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79a-0001l2-CD
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:07 -0500
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:34853)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en79a-0001kd-6e
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:06 -0500
Received: by mail-pg0-x244.google.com with SMTP id l131so4361605pga.2
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nSNLVT4lf1W1WDzUmj9fhH5V3ch8xkv1gwPhXGeJ6r0=;
	b=XMEvR+3c4GAUicBd+RM9a/qV1xj0SccDnRWRLh972nZAg6gYVuzi+wWl3Tu3cC8TwB
	fg63rVue9xMigQqDJBiS76/0vabjcdEQMdtlJ71BjC/JN9ru/dhUUC4Phz8pujpesuUF
	aseGu2/VROm3JvmJ5H5lAf3gKFBTmE8H2PZWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nSNLVT4lf1W1WDzUmj9fhH5V3ch8xkv1gwPhXGeJ6r0=;
	b=GUEMhTiw6whaNI/oKVkA2q66b47QUGiEnfmtx2WFkhY3GS+liH9Q9LEsvIDEaPLYRw
	SJT2F1G9i6ZOV6ITkp4biNtN312QzTdzEUTl4t84E54fi1qOWDXwGy8LK9YwN/pqsadv
	XxDd33eRtjIGcqKlJAU309NasLzbAcVSh05Mi7zeZjoIBt/DiyK+0c619sh/Vk5QoIZL
	BNovn9a6euh6ZqwyQr6CzHW4mmqPWFxIIl0uhNJuErY3cqr2I4bmgRZNiWjxjdRJExy/
	iTOtESP5dju38WuyJW/L1owE/NDn1Kl8U0CFXooQZOnfHpF+svZHkvn3AtLlqIW6SHl7
	f8Gg==
X-Gm-Message-State: APf1xPAHCFB+9DYh+T4NU+OWQH6v6rD55nCzvqUdoKoUcUoT7xkrTYYC
	9NhNH6zz0iAywolC7O0cvMUxLA==
X-Received: by 10.98.200.80 with SMTP id z77mr787317pff.85.1518891845282;
	Sat, 17 Feb 2018 10:24:05 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:40 -0800
Message-Id: <20180217182323.25885-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-arm] [PATCH v2 24/67] target/arm: Implement SVE Bitwise
 Immediate Group
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
X-TUID: Q6zxpK59OEbc

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      | 17 ++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 702f20e97b..21b1e4df85 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -34,6 +34,8 @@
 #include "translate-a64.h"
 
 typedef void GVecGen2Fn(unsigned, uint32_t, uint32_t, uint32_t, uint32_t);
+typedef void GVecGen2iFn(unsigned, uint32_t, uint32_t,
+                         int64_t, uint32_t, uint32_t);
 typedef void GVecGen3Fn(unsigned, uint32_t, uint32_t,
                         uint32_t, uint32_t, uint32_t);
 
@@ -1648,6 +1650,54 @@ static void trans_SINCDEC_v(DisasContext *s, arg_incdec2_cnt *a,
     }
 }
 
+/*
+ *** SVE Bitwise Immediate Group
+ */
+
+static void do_zz_dbm(DisasContext *s, arg_rr_dbm *a, GVecGen2iFn *gvec_fn)
+{
+    unsigned vsz;
+    uint64_t imm;
+
+    if (!logic_imm_decode_wmask(&imm, extract32(a->dbm, 12, 1),
+                                extract32(a->dbm, 0, 6),
+                                extract32(a->dbm, 6, 6))) {
+        unallocated_encoding(s);
+        return;
+    }
+
+    vsz = vec_full_reg_size(s);
+    gvec_fn(MO_64, vec_full_reg_offset(s, a->rd),
+            vec_full_reg_offset(s, a->rn), imm, vsz, vsz);
+}
+
+static void trans_AND_zzi(DisasContext *s, arg_rr_dbm *a, uint32_t insn)
+{
+    do_zz_dbm(s, a, tcg_gen_gvec_andi);
+}
+
+static void trans_ORR_zzi(DisasContext *s, arg_rr_dbm *a, uint32_t insn)
+{
+    do_zz_dbm(s, a, tcg_gen_gvec_ori);
+}
+
+static void trans_EOR_zzi(DisasContext *s, arg_rr_dbm *a, uint32_t insn)
+{
+    do_zz_dbm(s, a, tcg_gen_gvec_xori);
+}
+
+static void trans_DUPM(DisasContext *s, arg_DUPM *a, uint32_t insn)
+{
+    uint64_t imm;
+    if (!logic_imm_decode_wmask(&imm, extract32(a->dbm, 12, 1),
+                                extract32(a->dbm, 0, 6),
+                                extract32(a->dbm, 6, 6))) {
+        unallocated_encoding(s);
+        return;
+    }
+    do_dupi_z(s, a->rd, imm);
+}
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 5690b5fcb9..0990d135f4 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -50,6 +50,7 @@
 
 &rr_esz		rd rn esz
 &rri		rd rn imm
+&rr_dbm		rd rn dbm
 &rrri		rd rn rm imm
 &rri_esz	rd rn imm esz
 &rrr_esz	rd rn rm esz
@@ -112,6 +113,10 @@
 @rd_rn_tszimm	........ .. ... ... ...... rn:5 rd:5 \
 		&rri_esz esz=%tszimm16_esz
 
+# Two register operand, one encoded bitmask.
+@rdn_dbm	........ .. .... dbm:13 rd:5 \
+		&rr_dbm rn=%reg_movprfx
+
 # Basic Load/Store with 9-bit immediate offset
 @pd_rn_i9	........ ........ ...... rn:5 . rd:4	\
 		&rri imm=%imm9_16_10
@@ -331,6 +336,18 @@ INCDEC_v	00000100 .. 1 1 .... 1100 0 d:1 ..... .....    @incdec2_cnt u=1
 # Note these require esz != 0.
 SINCDEC_v	00000100 .. 1 0 .... 1100 d:1 u:1 ..... .....	@incdec2_cnt
 
+### SVE Bitwise Immediate Group
+
+# SVE bitwise logical with immediate (unpredicated)
+ORR_zzi		00000101 00 0000 ............. .....		@rdn_dbm
+EOR_zzi		00000101 01 0000 ............. .....		@rdn_dbm
+AND_zzi		00000101 10 0000 ............. .....		@rdn_dbm
+
+# SVE broadcast bitmask immediate
+DUPM		00000101 11 0000 dbm:13 rd:5
+
+### SVE Predicate Logical Operations Group
+
 # SVE predicate logical operations
 AND_pppp	00100101 0. 00 .... 01 .... 0 .... 0 ....	@pd_pg_pn_pm_s
 BIC_pppp	00100101 0. 00 .... 01 .... 0 .... 1 ....	@pd_pg_pn_pm_s
-- 
2.14.3

