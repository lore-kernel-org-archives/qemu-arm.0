Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp210261wme;
        Wed, 16 May 2018 15:43:35 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZo2NGZduN3WWIZI+6nv2gZWqksDIPQMhBZXr5cMKNQ3yXcjKhKuOV/B7f0vsBqo1RFCdwpJ
X-Received: by 2002:aed:3622:: with SMTP id e31-v6mr2986217qtb.82.1526510614913;
        Wed, 16 May 2018 15:43:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526510614; cv=none;
        d=google.com; s=arc-20160816;
        b=myv6OnM6xYV0AxeO8yVSfwvqWzzvevWvhdyAMD5jX+rdGnw58XUZOVShOqbT83lJYB
         NCiihOQWjIfopygMgGeEHWXVjpIAeioLqCwI3s3RD4ttx8DLkhSGrml9XFc5Go27q+w5
         cb/S/Thb9v+MI0wphycLc19Qa7xhSDLn/0gGc5qA6D739m+ZwXvueLdGNEBiNRNJL3Td
         lxiSgrUJLHC/SMrffoCz8NVD2OpHP5R9/Pnp9oShaanEPBvCmFlg6oeu51iS4yV59TR0
         GPKYg8gmuMDZebK6H4ENkYSCU9sMSPBAl+Cbq4fTbU9KuBzeCNHgSb7krItvZvPCa3At
         i8Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=N/YOlr76XoGcfWJEp8TVu7OeRp/aErPflcP4crzDavo=;
        b=yB+95oNaSTYFu/Cu+PiLzNUkckyjYDpi89oI0OprmbVL0fF8SI89YQP+WcPPEOMtEL
         srfXtKY5qNg9S2+ADkS9krUk8dzaVCfgA1KRPys50kCR4zN6TMgt/ky6flAc49gxL5a/
         TjKw2LFHfl1Vk7st4hk+q4s0W28zC16E2dD0hXZnS0yWGSjzKLeutneM59NcdRokE619
         zmlbk/EKEatZPHAri95Ts7mKoiueHehvj0raUmxrRuf5hlIBbBXOVTOdcclwZjicRSPM
         AqHjvRheBMeTBYWzISTNu3dzgeMf/P/oQZ4z3ZeuzFibLQLIxP8VQCIirhsvG+KyjCHI
         TF/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hU11cnEu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g128-v6si2605618qkd.16.2018.05.16.15.43.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 15:43:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hU11cnEu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44841 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJ58w-0000U4-CY
	for alex.bennee@linaro.org; Wed, 16 May 2018 18:43:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41296)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4wP-0007o5-3V
	for qemu-devel@nongnu.org; Wed, 16 May 2018 18:30:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4wN-0007Zf-UI
	for qemu-devel@nongnu.org; Wed, 16 May 2018 18:30:36 -0400
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:40160)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fJ4wN-0007Xx-Bv
	for qemu-devel@nongnu.org; Wed, 16 May 2018 18:30:35 -0400
Received: by mail-pl0-x244.google.com with SMTP id t12-v6so1244693plo.7
	for <qemu-devel@nongnu.org>; Wed, 16 May 2018 15:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=N/YOlr76XoGcfWJEp8TVu7OeRp/aErPflcP4crzDavo=;
	b=hU11cnEu0Kz9w9M6k+j63DFKC6lF55qgwLcs9K4DmDOoSaJZ1ocJjJoQzRKQj5OMMV
	e207EtJaDgO96QfWhDJrgDDrcZjumbsWoUzsT9bqbzkuAeADRJxU6cwBu8PvBLUM/rjB
	C3mHsL9v7ShhxozvDSySaZgmY3KVdJBxTCUO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=N/YOlr76XoGcfWJEp8TVu7OeRp/aErPflcP4crzDavo=;
	b=DjoGk3B8a5B6QxD74KZ3R/REAxyNgBq2cOsm4jgNTgbS4S3PhEphM7pK85SqGmCnUx
	JBq/o9uohwqWJYQZWv7RMqGIT8PBwIcgdZHTYmxTQDofWupZEZuL5SK4MqvOld3Yf93j
	JVUsNhEs1Uwjb1IHdLJ0zklzFUGDOEiFk5rgNz8Wbs48C884mEl0W2DcCSzqQboHcyOv
	/9winmkeiBy1cE+AZLiQWJMFccrUpgX0e248bqXTPYZ8/LhKdE/wn9WiQRiRafub0wGI
	TQerW0aLcqBxHs1he1H7zymhYZYrIZ5xejTjqssT0J71Fmoozv+iMuZGLsZEIO4NAF5q
	Cbtw==
X-Gm-Message-State: ALKqPwcjQ7GudNcwzGbfX4u5xyWVL4aTyP1hOIbk+g/wIfqSNbvuiMnH
	sT2ID7bucCko0ZF3+I8GDPFLBPYQwxw=
X-Received: by 2002:a17:902:7409:: with SMTP id
	g9-v6mr2679043pll.255.1526509834097; 
	Wed, 16 May 2018 15:30:34 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	j1-v6sm6640418pfc.159.2018.05.16.15.30.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 May 2018 15:30:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 16 May 2018 15:29:57 -0700
Message-Id: <20180516223007.10256-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180516223007.10256-1-richard.henderson@linaro.org>
References: <20180516223007.10256-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: [Qemu-devel] [PATCH v3-a 17/27] target/arm: Implement SVE Stack
 Allocation Group
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
X-TUID: 84DIr1grCpLp

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 27 +++++++++++++++++++++++++++
 target/arm/sve.decode      | 12 ++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e3a8e9506e..f95efa3c72 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -781,6 +781,33 @@ static bool trans_INDEX_rr(DisasContext *s, arg_INDEX_rr *a, uint32_t insn)
     return true;
 }
 
+/*
+ *** SVE Stack Allocation Group
+ */
+
+static bool trans_ADDVL(DisasContext *s, arg_ADDVL *a, uint32_t insn)
+{
+    TCGv_i64 rd = cpu_reg_sp(s, a->rd);
+    TCGv_i64 rn = cpu_reg_sp(s, a->rn);
+    tcg_gen_addi_i64(rd, rn, a->imm * vec_full_reg_size(s));
+    return true;
+}
+
+static bool trans_ADDPL(DisasContext *s, arg_ADDPL *a, uint32_t insn)
+{
+    TCGv_i64 rd = cpu_reg_sp(s, a->rd);
+    TCGv_i64 rn = cpu_reg_sp(s, a->rn);
+    tcg_gen_addi_i64(rd, rn, a->imm * pred_full_reg_size(s));
+    return true;
+}
+
+static bool trans_RDVL(DisasContext *s, arg_RDVL *a, uint32_t insn)
+{
+    TCGv_i64 reg = cpu_reg(s, a->rd);
+    tcg_gen_movi_i64(reg, a->imm * vec_full_reg_size(s));
+    return true;
+}
+
 /*
  *** SVE Predicate Logical Operations Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 4f9f64f5ab..9d5c061165 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -84,6 +84,9 @@
 # One register operand, with governing predicate, vector element size
 @rd_pg_rn       ........ esz:2 ... ... ... pg:3 rn:5 rd:5       &rpr_esz
 
+# Two register operands with a 6-bit signed immediate.
+@rd_rn_i6       ........ ... rn:5 ..... imm:s6 rd:5             &rri
+
 # Two register operand, one immediate operand, with predicate,
 # element size encoded as TSZHL.  User must fill in imm.
 @rdn_pg_tszimm  ........ .. ... ... ... pg:3 ..... rd:5 \
@@ -238,6 +241,15 @@ INDEX_ri        00000100 esz:2 1 imm:s5 010001 rn:5 rd:5
 # SVE index generation (register start, register increment)
 INDEX_rr        00000100 .. 1 ..... 010011 ..... .....          @rd_rn_rm
 
+### SVE Stack Allocation Group
+
+# SVE stack frame adjustment
+ADDVL           00000100 001 ..... 01010 ...... .....           @rd_rn_i6
+ADDPL           00000100 011 ..... 01010 ...... .....           @rd_rn_i6
+
+# SVE stack frame size
+RDVL            00000100 101 11111 01010 imm:s6 rd:5
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.17.0

