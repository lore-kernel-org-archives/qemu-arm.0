Received: by 10.28.71.27 with SMTP id u27csp2090756wma;
        Sat, 17 Feb 2018 10:53:59 -0800 (PST)
X-Google-Smtp-Source: AH8x224fB8I4myyBiBrLSJKmPTTda/+Hqde/6gFBIQeCg4GYZNCTS1qUFfhL+Qmw1ZD+ymqzT/it
X-Received: by 10.129.119.197 with SMTP id s188mr7529390ywc.158.1518893639564;
        Sat, 17 Feb 2018 10:53:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518893639; cv=none;
        d=google.com; s=arc-20160816;
        b=iFW4+T1fVAAuSZilHpW50MKTxLlDmW9c35FHX2ZoMrRnkRW1StQzp6MHQI24zb7qYR
         g3lmNDfozpXnTMXFlNhDtKs+Js8tjcu5L59+WZfsnYtffm14oyO6vmrQDEeN9RqVdZOC
         v3jhUUJGHxna8pzENrUYpGNvrRuVUnvpdz/6sDeRZfzgZ9jeFur4pEv6byfa5aZdVkLn
         AAvOihoqtpdP3WHzSwUYOWaafudF8H5q/KAqM4947s/5xXxQq0+HRLV4lQ1ehYHPSq3v
         4Go1b3d500pXa9R0IvhZxswkN0+hGFwfEUI4+jwInGrMLRFNu8H936+fdBZ+/p23k0sL
         CrJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Sbjzr4oP/2U5rXhk+eeI3UjsbSb3BRWAaUy7LI44TGI=;
        b=ZZpoA8axHetDDLIbib8MLvSbhAQEaBhN/wI9E0yDxn3uQoANtWa1enj5rqxYvz1EDI
         +4xoH9wnm9HUhyjYZVHqE7gbnB49O/HYNyDn/ynv031t9zgzqjdz/0ti/TU05f9UWluS
         FY7N9vIUN51VOca4rqrikvOut3UI+ky3Qpj1aUDMvdKyVGJoj2JW4hLfTAou3xTsmmvA
         7Xn25hC+Lepo/HOjmtkRVgEaXh96u7rTYHgsIrIsiMYM6nQBlqv0sDCDoKMuF10RwDuD
         Dagin7cLz83Lm2m7XeO3UDUGk2JC6bG+5iQJetFG9wZAMmH3Bc1PQKZ1emCUf6g7PIU4
         vs4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PivhMbZN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c189si1054647ybh.5.2018.02.17.10.53.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:53:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PivhMbZN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48303 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7cV-0008BR-0b
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:53:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7A2-0001DW-7n
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7A0-0001zc-M8
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:34 -0500
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:45874)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en7A0-0001zM-G9
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:32 -0500
Received: by mail-pf0-x242.google.com with SMTP id w83so592594pfi.12
	for <qemu-devel@nongnu.org>; Sat, 17 Feb 2018 10:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Sbjzr4oP/2U5rXhk+eeI3UjsbSb3BRWAaUy7LI44TGI=;
	b=PivhMbZN4oKeFBK3typmjkvZQ71C+JQ3JiYxLXTBJzKP5klTatnO525dkf/tXWU/rA
	AiaaBByN9gbGc1dNyf6ZVkr6JS1cvRayazZ4Fh2KtO3puhQq24ieo2fDO/TImRhp50tD
	63ReSVo1pLmf8exbQH6MiQQhLu+IIeyWrSfdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Sbjzr4oP/2U5rXhk+eeI3UjsbSb3BRWAaUy7LI44TGI=;
	b=LG9UIc8UNbBQxna3+FCWQT3kOanlET4Z14G4N590jnPNT9NbYR4mbn51mZFDNvHcZq
	GP8biS2jYtdd9iudcAMq+EVjbph/Dqn0YnvdcJF+gb6C1VY7cUETP7EK9XerqSOpXS5a
	noLHA0hjyMhMLhsrAjqJkQLqLLrO5BA0HZ0jawQdKVApZ/BsEFOKZ4nF9mkcwOF5IQpI
	SAV51h4uAmIgXTSXig4lewCjoFZhMCGkEaIVoLDCF+L0ErwYCibgv8wYz08IGP/2c+np
	XaPRtYOK/MjHtriJ4CYOYrPYwzZid3A8rRXHbrkZkQyCNtndn34ifp5CuKk0t3mM2fjK
	Dwww==
X-Gm-Message-State: APf1xPCpYPGh1Kc0PcWr+4gkHu8iTRodRQCAW6UmvAnSHQ8QwO6WmNEq
	E//hiZVa/qffHdSck0num72ACA0x2YQ=
X-Received: by 10.98.92.68 with SMTP id q65mr9797853pfb.4.1518891871266;
	Sat, 17 Feb 2018 10:24:31 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:57 -0800
Message-Id: <20180217182323.25885-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-devel] [PATCH v2 41/67] target/arm: Implement FDUP/DUP
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dl8m9ycDpQlI

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 35 +++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      |  8 ++++++++
 2 files changed, 43 insertions(+)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 4b92a55c21..7571d02237 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2939,6 +2939,41 @@ static void trans_WHILE(DisasContext *s, arg_WHILE *a, uint32_t insn)
     tcg_temp_free_i32(t3);
 }
 
+/*
+ *** SVE Integer Wide Immediate - Unpredicated Group
+ */
+
+static void trans_FDUP(DisasContext *s, arg_FDUP *a, uint32_t insn)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    int dofs = vec_full_reg_offset(s, a->rd);
+    uint64_t imm;
+
+    if (a->esz == 0) {
+        unallocated_encoding(s);
+        return;
+    }
+
+    /* Decode the VFP immediate.  */
+    imm = vfp_expand_imm(a->esz, a->imm);
+    imm = dup_const(a->esz, imm);
+
+    tcg_gen_gvec_dup64i(dofs, vsz, vsz, imm);
+}
+
+static void trans_DUP_i(DisasContext *s, arg_DUP_i *a, uint32_t insn)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    int dofs = vec_full_reg_offset(s, a->rd);
+
+    if (a->esz == 0 && extract32(insn, 13, 1)) {
+        unallocated_encoding(s);
+        return;
+    }
+
+    tcg_gen_gvec_dup64i(dofs, vsz, vsz, dup_const(a->esz, a->imm));
+}
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index b5bc7e9546..ea1bfe7579 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -622,6 +622,14 @@ CTERM		00100101 1 sf:1 1 rm:5 001000 rn:5 ne:1 0000
 # SVE integer compare scalar count and limit
 WHILE		00100101 esz:2 1 rm:5 000 sf:1 u:1 1 rn:5 eq:1 rd:4
 
+### SVE Integer Wide Immediate - Unpredicated Group
+
+# SVE broadcast floating-point immediate (unpredicated)
+FDUP		00100101 esz:2 111 00 1110 imm:8 rd:5
+
+# SVE broadcast integer immediate (unpredicated)
+DUP_i		00100101 esz:2 111 00 011 . ........ rd:5	imm=%sh8_i8s
+
 ### SVE Memory - 32-bit Gather and Unsized Contiguous Group
 
 # SVE load predicate register
-- 
2.14.3

