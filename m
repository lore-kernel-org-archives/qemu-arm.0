Received: by 10.28.71.27 with SMTP id u27csp2076924wma;
        Sat, 17 Feb 2018 10:33:12 -0800 (PST)
X-Google-Smtp-Source: AH8x225I9YcqloFxolaHBoiT/wzQusHPJcUmOwJCQIcWFoAvuXnHV/189AIucEHTWoUR9+YtUkdo
X-Received: by 10.13.206.4 with SMTP id q4mr7582466ywd.150.1518892392646;
        Sat, 17 Feb 2018 10:33:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518892392; cv=none;
        d=google.com; s=arc-20160816;
        b=y9xvW4auVJ48lV/VGyk+9AplvW2i0tVKrliyTUkzuu3k4Ord5QKZnhXwIXROOEbsSG
         NgCiWCQ1LKKV46lD5rVOvUpC08tv5WU/yAeKbhIv2VaFZ9Gfbqi0eB/N4h1vAU9RMH+u
         lNbCtnLwPbRGG2DtwXYiOLGo2Bfmxec9Z7LMfXa0ZoP4UcTkKZpnZaiI+tuc08Q2L+VC
         6D1pug0IKH6q2Rrk9OZI5bU4VRb4Vr1j2zngzYaByBXqFa0+mIFoFWdwcC45I4X7Q3xE
         6iviS6fAfzln4kk+ZUuIlsh3DBVaFqEfTmysUDT5fQRuYdgaqbu3HnO7rtps+HoGYn52
         FmKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=118KeuWXZVwxjQFkY5AB5YsFbc+jn6EHA5V7kRQzsGs=;
        b=xlp1XdgBvGODU+CAXa/Wf9yUKFg5mqjnrNSOmhmLtMBn+aZp2vmC8FdczvahadQIVl
         V3FenvMI0Z/ce+zJijS4BHvtS29cmvgxLKaRqJo6yFgpw/77DSLpiZ4HwC/KwKV/uLt5
         mzLDsA+3CQR0vmZ672wKWQe7aCZhbj2rnsPRUxfHGDBBBIq+KY83vq11qdROijbQbqsd
         kiAaFlGgjHl6DTvqfjKey5o3s8xW5hkelew1LI3ozHATmiVh0LC+hU05Kl15Y0nS9Wo2
         rcoPD6/TPMv5Kx/36JqIJ8FkK1WcOrpbpxdxKM8vsYtK/nraao8yAi1NYe/0iJfuU+TB
         KhRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jvQ2Abmb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j81si2344143ywb.454.2018.02.17.10.33.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:33:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jvQ2Abmb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48116 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7IO-0008QI-0X
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:33:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79W-0000cJ-Qa
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79V-0001iK-Ks
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:02 -0500
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:37120)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en79V-0001hk-DX
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:01 -0500
Received: by mail-pg0-x244.google.com with SMTP id o1so4353545pgn.4
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=118KeuWXZVwxjQFkY5AB5YsFbc+jn6EHA5V7kRQzsGs=;
	b=jvQ2AbmbvBM8Tp3q9d5eHKlWbe6OTUZiM+YZINPTsvgpwL/Oj5AXb5A+8zW+vcsfpH
	LLn3sNe/gFUe5URO6SvMbVxiGsk9khfZ87Q2aIuMLBStV0QFxzxECj1L089KVoblGv4O
	eeMrou7G9WEWNQmM1mWiOiHKwhlEAEo8Sv1W4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=118KeuWXZVwxjQFkY5AB5YsFbc+jn6EHA5V7kRQzsGs=;
	b=g024LkjZPGzMW5+PAm8RmPKboDGBtBHFYKLYPXJF3m5GV6+a7fWOvmNCf0s3AHuafk
	/8z/3ZEjpe7mjIxLNvwjwmRLmjHBTD7T+oHvTnxw9u9ArpQbthkPMtqGMWeO9GbO4rLG
	xazA2xiyxjqOLnVY2E2ASI87gXnXlojiEVUA22EU7gPerd7jkeRtD4UZI3lz2sQNok/s
	MdMIDCL9nDfCVgVZJsf1DQBdYssVTIEQRlAB1UBI/roGjuuK7sceC/XDy+KH4srVI5xa
	AfiGgt9coHOit4qRISmflrRvz2zyXp05iEGkv3AERCLI0IduyX1dWF8Z+7pFRDZ5Rl/r
	ZZMQ==
X-Gm-Message-State: APf1xPBB/PsUfBDYd/M5O8Ryj8k9VsPqn6lP2g4+kOhFCh0oQq0crFxK
	jhvtg0Y9cA7p48fKfj2zXrVNKQ==
X-Received: by 10.98.107.130 with SMTP id g124mr9665515pfc.225.1518891840502; 
	Sat, 17 Feb 2018 10:24:00 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.23.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:23:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:37 -0800
Message-Id: <20180217182323.25885-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-arm] [PATCH v2 21/67] target/arm: Implement SVE
 floating-point exponential accelerator
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
X-TUID: iHhGHbpVXbvI

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  4 +++
 target/arm/sve_helper.c    | 81 ++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 22 +++++++++++++
 target/arm/sve.decode      |  7 ++++
 4 files changed, 114 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 5280d375f9..e2925ff8ec 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -385,6 +385,10 @@ DEF_HELPER_FLAGS_4(sve_adr_p64, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_adr_s32, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_adr_u32, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_3(sve_fexpa_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_fexpa_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_fexpa_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index a290a58c02..4d42653eef 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1101,3 +1101,84 @@ void HELPER(sve_adr_u32)(void *vd, void *vn, void *vm, uint32_t desc)
         d[i] = n[i] + ((uint64_t)(uint32_t)m[i] << sh);
     }
 }
+
+void HELPER(sve_fexpa_h)(void *vd, void *vn, uint32_t desc)
+{
+    static const uint16_t coeff[] = {
+        0x0000, 0x0016, 0x002d, 0x0045, 0x005d, 0x0075, 0x008e, 0x00a8,
+        0x00c2, 0x00dc, 0x00f8, 0x0114, 0x0130, 0x014d, 0x016b, 0x0189,
+        0x01a8, 0x01c8, 0x01e8, 0x0209, 0x022b, 0x024e, 0x0271, 0x0295,
+        0x02ba, 0x02e0, 0x0306, 0x032e, 0x0356, 0x037f, 0x03a9, 0x03d4,
+    };
+    intptr_t i, opr_sz = simd_oprsz(desc) / 2;
+    uint16_t *d = vd, *n = vn;
+
+    for (i = 0; i < opr_sz; i++) {
+        uint16_t nn = n[i];
+        intptr_t idx = extract32(nn, 0, 5);
+        uint16_t exp = extract32(nn, 5, 5);
+        d[i] = coeff[idx] | (exp << 10);
+    }
+}
+
+void HELPER(sve_fexpa_s)(void *vd, void *vn, uint32_t desc)
+{
+    static const uint32_t coeff[] = {
+        0x000000, 0x0164d2, 0x02cd87, 0x043a29,
+        0x05aac3, 0x071f62, 0x08980f, 0x0a14d5,
+        0x0b95c2, 0x0d1adf, 0x0ea43a, 0x1031dc,
+        0x11c3d3, 0x135a2b, 0x14f4f0, 0x16942d,
+        0x1837f0, 0x19e046, 0x1b8d3a, 0x1d3eda,
+        0x1ef532, 0x20b051, 0x227043, 0x243516,
+        0x25fed7, 0x27cd94, 0x29a15b, 0x2b7a3a,
+        0x2d583f, 0x2f3b79, 0x3123f6, 0x3311c4,
+        0x3504f3, 0x36fd92, 0x38fbaf, 0x3aff5b,
+        0x3d08a4, 0x3f179a, 0x412c4d, 0x4346cd,
+        0x45672a, 0x478d75, 0x49b9be, 0x4bec15,
+        0x4e248c, 0x506334, 0x52a81e, 0x54f35b,
+        0x5744fd, 0x599d16, 0x5bfbb8, 0x5e60f5,
+        0x60ccdf, 0x633f89, 0x65b907, 0x68396a,
+        0x6ac0c7, 0x6d4f30, 0x6fe4ba, 0x728177,
+        0x75257d, 0x77d0df, 0x7a83b3, 0x7d3e0c,
+    };
+    intptr_t i, opr_sz = simd_oprsz(desc) / 4;
+    uint32_t *d = vd, *n = vn;
+
+    for (i = 0; i < opr_sz; i++) {
+        uint32_t nn = n[i];
+        intptr_t idx = extract32(nn, 0, 6);
+        uint32_t exp = extract32(nn, 6, 8);
+        d[i] = coeff[idx] | (exp << 23);
+    }
+}
+
+void HELPER(sve_fexpa_d)(void *vd, void *vn, uint32_t desc)
+{
+    static const uint64_t coeff[] = {
+        0x0000000000000, 0x02C9A3E778061, 0x059B0D3158574, 0x0874518759BC8,
+        0x0B5586CF9890F, 0x0E3EC32D3D1A2, 0x11301D0125B51, 0x1429AAEA92DE0,
+        0x172B83C7D517B, 0x1A35BEB6FCB75, 0x1D4873168B9AA, 0x2063B88628CD6,
+        0x2387A6E756238, 0x26B4565E27CDD, 0x29E9DF51FDEE1, 0x2D285A6E4030B,
+        0x306FE0A31B715, 0x33C08B26416FF, 0x371A7373AA9CB, 0x3A7DB34E59FF7,
+        0x3DEA64C123422, 0x4160A21F72E2A, 0x44E086061892D, 0x486A2B5C13CD0,
+        0x4BFDAD5362A27, 0x4F9B2769D2CA7, 0x5342B569D4F82, 0x56F4736B527DA,
+        0x5AB07DD485429, 0x5E76F15AD2148, 0x6247EB03A5585, 0x6623882552225,
+        0x6A09E667F3BCD, 0x6DFB23C651A2F, 0x71F75E8EC5F74, 0x75FEB564267C9,
+        0x7A11473EB0187, 0x7E2F336CF4E62, 0x82589994CCE13, 0x868D99B4492ED,
+        0x8ACE5422AA0DB, 0x8F1AE99157736, 0x93737B0CDC5E5, 0x97D829FDE4E50,
+        0x9C49182A3F090, 0xA0C667B5DE565, 0xA5503B23E255D, 0xA9E6B5579FDBF,
+        0xAE89F995AD3AD, 0xB33A2B84F15FB, 0xB7F76F2FB5E47, 0xBCC1E904BC1D2,
+        0xC199BDD85529C, 0xC67F12E57D14B, 0xCB720DCEF9069, 0xD072D4A07897C,
+        0xD5818DCFBA487, 0xDA9E603DB3285, 0xDFC97337B9B5F, 0xE502EE78B3FF6,
+        0xEA4AFA2A490DA, 0xEFA1BEE615A27, 0xF50765B6E4540, 0xFA7C1819E90D8,
+    };
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn;
+
+    for (i = 0; i < opr_sz; i++) {
+        uint64_t nn = n[i];
+        intptr_t idx = extract32(nn, 0, 6);
+        uint64_t exp = extract32(nn, 6, 11);
+        d[i] = coeff[idx] | (exp << 52);
+    }
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 34cc8c2773..2f23f1b192 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -880,6 +880,28 @@ static void trans_ADR_u32(DisasContext *s, arg_rrri *a, uint32_t insn)
     do_adr(s, a, gen_helper_sve_adr_u32);
 }
 
+/*
+ *** SVE Integer Misc - Unpredicated Group
+ */
+
+static void trans_FEXPA(DisasContext *s, arg_rr_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_2 * const fns[4] = {
+        NULL,
+        gen_helper_sve_fexpa_h,
+        gen_helper_sve_fexpa_s,
+        gen_helper_sve_fexpa_d,
+    };
+    unsigned vsz = vec_full_reg_size(s);
+    if (a->esz == 0) {
+        unallocated_encoding(s);
+        return;
+    }
+    tcg_gen_gvec_2_ool(vec_full_reg_offset(s, a->rd),
+                       vec_full_reg_offset(s, a->rn),
+                       vsz, vsz, 0, fns[a->esz]);
+}
+
 /*
  *** SVE Predicate Logical Operations Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 6ec1f94832..e791fe8031 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -68,6 +68,7 @@
 
 # Two operand
 @pd_pn		........ esz:2 .. .... ....... rn:4 . rd:4	&rr_esz
+@rd_rn		........ esz:2 ...... ...... rn:5 rd:5		&rr_esz
 
 # Three operand with unused vector element size
 @rd_rn_rm_e0	........ ... rm:5 ... ... rn:5 rd:5		&rrr_esz esz=0
@@ -290,6 +291,12 @@ ADR_u32		00000100 01 1 ..... 1010 .. ..... .....		@rd_rn_msz_rm
 ADR_p32		00000100 10 1 ..... 1010 .. ..... .....		@rd_rn_msz_rm
 ADR_p64		00000100 11 1 ..... 1010 .. ..... .....		@rd_rn_msz_rm
 
+### SVE Integer Misc - Unpredicated Group
+
+# SVE floating-point exponential accelerator
+# Note esz != 0
+FEXPA		00000100 .. 1 00000 101110 ..... .....		@rd_rn
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.14.3

