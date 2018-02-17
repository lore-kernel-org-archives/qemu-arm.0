Received: by 10.28.71.27 with SMTP id u27csp2079606wma;
        Sat, 17 Feb 2018 10:36:58 -0800 (PST)
X-Google-Smtp-Source: AH8x227xywdKehCsMvGTbDf06nLFF7N5VyKUMJen3xqPEUr6sKxwkyfPhIkS3lKNxtisUD+6RBZq
X-Received: by 10.37.160.130 with SMTP id y2mr6433559ybh.240.1518892617951;
        Sat, 17 Feb 2018 10:36:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518892617; cv=none;
        d=google.com; s=arc-20160816;
        b=je+TDfRlEtxj+Q/9+JXOzfvOcNgxZgrl0UTOwwFHhwOG3MjpnZqd0jpkcqQzQKf6dY
         W7j6XrQKgl/vQOQCfLn8KyFuiORVCXTZOixsWqLcn0+xKZg9vc/TUDjPk3Y53gV7cUCR
         IkOQ8e7xQSRPg1cekLzAqLAC2ZcVSmmDAFro2fivVmz4pexAv1sxoi4xLd/TYRQRuym4
         +PbTmI5A0AMXxgxlUmGMnpU663NhoFTGf4UWoBsF63XQf92xVnMyMd7z8wd8cVb4ORkR
         xU3jqGyj3SjjV8vJn6/Gc37aAC1cbOqsX327nabKt7y3tJXByZkNtWSv+n67IPDdFkNj
         1zEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=G5CwiAWO6kX58omnBN3XeNxT6S6emdMtL5CoxFcf+0c=;
        b=K3XSZ0gsp3H9hzVKlpddrsdLwryFFJu7fUSmO46shHID013r7LnKozcqBxZ/NN3xwN
         eBCCLDjD1MbSxttCcL0oWO6vuAUdNC++bm7aPF+W9Hjr7cmJ7lnA52yICbO2LbHuEKt2
         IyEE5xi6P3h9p+VTFtY+PO/7UXW1c7N1h9mEzeTHTjwqP3E+Ex5QOCJJwGyIikFMxbRz
         i+xrXIYeOHENt9wrBFkeexUfdIrILO5yrPYyDsQQ5d8W8FSTvBgTnURIcGdN0mENX9lQ
         Aha+DV/9LOLNiRhb/sSbGz2ENWtfNcqI0nwYvIiHGXeFtJpf6O5YehW5bI0vFxo1Jd52
         Z9IQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S7PQxOEV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c6si351458ywm.233.2018.02.17.10.36.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:36:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S7PQxOEV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48155 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7M1-0002iA-Bu
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:36:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79S-0000ae-J7
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:23:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79R-0001g3-BH
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:23:58 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:41240)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en79R-0001fc-5R
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:23:57 -0500
Received: by mail-pf0-x244.google.com with SMTP id 68so590897pfj.8
	for <qemu-devel@nongnu.org>; Sat, 17 Feb 2018 10:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=G5CwiAWO6kX58omnBN3XeNxT6S6emdMtL5CoxFcf+0c=;
	b=S7PQxOEVqNVgXFHdoZSxAFe23u3NriC/cohTEYvROBZ+/NrXFMncQ0OQ9gut8Sd2D9
	DB2+EClwq63UW+H9OxY12FHpTc3fH+XK5bAHZI9byh5/SMu/7KTFpHVxnZA1oywO8hr0
	u9IET6oge02IS6bHa76aajzbLufU1GpUhpvYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=G5CwiAWO6kX58omnBN3XeNxT6S6emdMtL5CoxFcf+0c=;
	b=frVkF+Zkld73C4qbonxPgnXIgMPp7UwQU5b2pcdHx3AkOIKM7E1KzExDVbbNPAzcz/
	sgmr5iPzA4ymihJ4o1d1vF/Khhbc9yz74YLCntV0CA6gVH6EsgiOnxDDfEqUouuq35HW
	uGeU1vtex8oQHSZqQMnyaz+Yjouc+wiaQTh7gwpz3A44qX8V+uAWi5NNmelzzZsUgTEx
	ivDkHNnDI9M6BEPOI0dh9OV33DpNy26EJjOQ2Ucl3DW8RMzmldTPCMZvwr8jNK2xCekZ
	Lmh6jz9p1XFLzFR7WaVq96fSdXZw8085DPJPEBUrJIKtvs8hR44ZF94bRi/o4TJSrlKr
	Rxpw==
X-Gm-Message-State: APf1xPAVxSzGxXFULCNkSKEGTI1LsUwXBOmuPISkVISAbSu6JbRLoD4s
	as/yNs6tYYYk1W2ptngecaUYor01mXU=
X-Received: by 10.98.58.129 with SMTP id v1mr1979921pfj.203.1518891835946;
	Sat, 17 Feb 2018 10:23:55 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.23.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:23:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:34 -0800
Message-Id: <20180217182323.25885-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-devel] [PATCH v2 18/67] target/arm: Implement SVE Stack
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yNbEC/uwCpfz

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 24 ++++++++++++++++++++++++
 target/arm/sve.decode      | 12 ++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 773f0bfded..4a38020c8a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -742,6 +742,30 @@ static void trans_INDEX_rr(DisasContext *s, arg_INDEX_rr *a, uint32_t insn)
     do_index(s, a->esz, a->rd, start, incr);
 }
 
+/*
+ *** SVE Stack Allocation Group
+ */
+
+static void trans_ADDVL(DisasContext *s, arg_ADDVL *a, uint32_t insn)
+{
+    TCGv_i64 rd = cpu_reg_sp(s, a->rd);
+    TCGv_i64 rn = cpu_reg_sp(s, a->rn);
+    tcg_gen_addi_i64(rd, rn, a->imm * vec_full_reg_size(s));
+}
+
+static void trans_ADDPL(DisasContext *s, arg_ADDPL *a, uint32_t insn)
+{
+    TCGv_i64 rd = cpu_reg_sp(s, a->rd);
+    TCGv_i64 rn = cpu_reg_sp(s, a->rn);
+    tcg_gen_addi_i64(rd, rn, a->imm * pred_full_reg_size(s));
+}
+
+static void trans_RDVL(DisasContext *s, arg_RDVL *a, uint32_t insn)
+{
+    TCGv_i64 reg = cpu_reg(s, a->rd);
+    tcg_gen_movi_i64(reg, a->imm * vec_full_reg_size(s));
+}
+
 /*
  *** SVE Predicate Logical Operations Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index d7b078e92f..0b47869dcd 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -86,6 +86,9 @@
 # One register operand, with governing predicate, vector element size
 @rd_pg_rn	........ esz:2 ... ... ... pg:3 rn:5 rd:5	&rpr_esz
 
+# Two register operands with a 6-bit signed immediate.
+@rd_rn_i6	........ ... rn:5 ..... imm:s6 rd:5		&rri
+
 # Two register operand, one immediate operand, with predicate,
 # element size encoded as TSZHL.  User must fill in imm.
 @rdn_pg_tszimm	........ .. ... ... ... pg:3 ..... rd:5 \
@@ -240,6 +243,15 @@ INDEX_ri	00000100 esz:2 1 imm:s5 010001 rn:5 rd:5
 # SVE index generation (register start, register increment)
 INDEX_rr	00000100 .. 1 ..... 010011 ..... .....		@rd_rn_rm
 
+### SVE Stack Allocation Group
+
+# SVE stack frame adjustment
+ADDVL		00000100 001 ..... 01010 ...... .....		@rd_rn_i6
+ADDPL		00000100 011 ..... 01010 ...... .....		@rd_rn_i6
+
+# SVE stack frame size
+RDVL		00000100 101 11111 01010 imm:s6 rd:5
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.14.3

