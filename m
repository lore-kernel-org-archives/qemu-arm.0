Received: by 10.223.159.74 with SMTP id f10csp2975489wrg;
        Mon, 18 Dec 2017 10:26:42 -0800 (PST)
X-Google-Smtp-Source: ACJfBovhelDYZUS8i0+8NkRFMj7i5xgQJJVIY9qiV+19fxZkqI5UIL6Ivxn7HJeJ9oBQn6wmDrvV
X-Received: by 10.37.234.69 with SMTP id o5mr564211ybe.263.1513621602331;
        Mon, 18 Dec 2017 10:26:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513621602; cv=none;
        d=google.com; s=arc-20160816;
        b=Pl2h3G3ImoipZoEDp7WCeW3CAr30oYWWHWXH74CPzOBOTJ5+xABjXBfFLePFoA+gy6
         6+izJDke+pTfOtnGP0HzWgUwyNydTg9jRxTWpCJng7HuYlBalt3teoOSHfV03Dn4bscK
         Axv7b/O/U737652gKsNN0zuc0ojLeGRxFic/e8uCYeqWdmD6X2Gj8KPw2gMOX7guc0EW
         08kHUUsrT0719/ZhGmjPtmSkRholTa+C6TgJL6xOWFX/YFBtX7bSBnzO4WKT+SQF/ES5
         JG85c0WLZLJIpXLMfHcOyAEhrpsQDuGzYEL9Rn16DJOlxBjv9kw/p3VX3egBHJOzoFVt
         Hemg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=6YYbCElCJ2gbI5x/aO1NF4xxoziErKY0Fw/koAe5yac=;
        b=XJTtYxyqzr3N6F38xffbnI+pv2SwKj76j8Ug8fqXd6c6/WijBt678leUa+wmTib6R/
         v9l0nmqXteqXcwaVyo/NZqJTMUHVDZRXO478o3UsXMSN12jRtncYUcE6YWV8GInxA93L
         JjOSE06D3xTYQz1xl3qCTRZXhd5pgmSIS+gfuoKhV8RFkpdqihciL679QZD3bPyn1lpa
         WgO4NxVfZu1KQWDemxHanDCZ9r4By9UYLkk0a1iNKnnxKOPDjsPBX/umHP1hdCyPoGOH
         CTGYJsGHG2xlemXj+5nsGELnqhKiT0moHeQ/XYTAE94j1Geyk+qSTzff0npAO3e8+Lq2
         +OEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HBLgCoNF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j205si2547056ybc.42.2017.12.18.10.26.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 10:26:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HBLgCoNF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44474 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eR07d-0008NJ-Mv
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 13:26:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUe-0008PP-Is
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUd-0002EV-KM
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:24 -0500
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:37996)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQzUd-0002Dc-Dl
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:23 -0500
Received: by mail-pf0-x242.google.com with SMTP id u25so9969156pfg.5
	for <qemu-arm@nongnu.org>; Mon, 18 Dec 2017 09:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6YYbCElCJ2gbI5x/aO1NF4xxoziErKY0Fw/koAe5yac=;
	b=HBLgCoNFfj09n9q/9Aw+C/mreeqD7sKIaQio3VTv/nwS97jtpHMYp9UjRn71eR2CCP
	t3ygxhKyaSKVJVThGb5r72E6ZbD8+4W7dacCU06urADM0LTL2+ahwdHyVI+7QvkObfa1
	g4KAwP6EFRYu6GKWS5XcA/wZ+7WJqXojkWESk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6YYbCElCJ2gbI5x/aO1NF4xxoziErKY0Fw/koAe5yac=;
	b=J4Tm9PIhnuHYJJS3rHmHrA7SqxrBUKypGxlXqgiOPisN8QqDEOWA0BbyKuHxhUeGQn
	MeqIGeh492dhYmQUmZgo+C77uz59GEa6nNPNpywfL9TmnGQfa3/Mt6GZXCrKWMUVCTLx
	nT3ddgAkpfZYcn57H4TLDUcpAA/Yh6Npuy7p6DALg9cyV1cXbI4RHcs8UWantl9/cEtE
	1pRNXqb4xGfRad4wRdgesNZNLXmH1N1p7y6+Fl4C9eFSaWKNdhl/9/TGSLAdf+vdTO56
	yZ24tIOY5PWUSVIzZcKLewenOCdyEkC1OmErKGQJ380WNr8qzAQsTpkLQ8hQN4g3YMUW
	uhKQ==
X-Gm-Message-State: AKGB3mL4hmaV+3UAEVzk8ckzM/TjmQV+BFbj4fWPMNi572BX4FVqqJXI
	BvufQ2BPkrHm/46ZNthOsPYJ3HKvWAs=
X-Received: by 10.99.45.4 with SMTP id t4mr436031pgt.254.1513619182426;
	Mon, 18 Dec 2017 09:46:22 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63]) by smtp.gmail.com with ESMTPSA id
	t84sm26209657pfe.160.2017.12.18.09.46.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:46:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:45:47 -0800
Message-Id: <20171218174552.18871-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171218174552.18871-1-richard.henderson@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [PATCH 18/23] target/arm: Implement SVE Stack Allocation
 Group
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
X-TUID: jmLTu7TM0TD5

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 18 ++++++++++++++++++
 target/arm/sve.def         | 12 ++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7e1bf7d623..026af7a162 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -639,6 +639,24 @@ void trans_INDEX_rr(DisasContext *s, arg_INDEX_rr *a, uint32_t insn)
     do_index(s, a->esz, a->rd, start, incr);
 }
 
+void trans_ADDVL(DisasContext *s, arg_ADDVL *a, uint32_t insn)
+{
+    TCGv_i64 reg = cpu_reg_sp(s, a->rd);
+    tcg_gen_addi_i64(reg, reg, a->imm * vec_full_reg_size(s));
+}
+
+void trans_ADDPL(DisasContext *s, arg_ADDPL *a, uint32_t insn)
+{
+    TCGv_i64 reg = cpu_reg_sp(s, a->rd);
+    tcg_gen_addi_i64(reg, reg, a->imm * pred_full_reg_size(s));
+}
+
+void trans_RDVL(DisasContext *s, arg_RDVL *a, uint32_t insn)
+{
+    TCGv_i64 reg = cpu_reg(s, a->rd);
+    tcg_gen_movi_i64(reg, a->imm * vec_full_reg_size(s));
+}
+
 static uint64_t pred_esz_mask[4] = {
     0xffffffffffffffffull, 0x5555555555555555ull,
     0x1111111111111111ull, 0x0101010101010101ull
diff --git a/target/arm/sve.def b/target/arm/sve.def
index 0cac3a974f..7428ebc5cd 100644
--- a/target/arm/sve.def
+++ b/target/arm/sve.def
@@ -73,6 +73,9 @@
 # One register operand, with governing predicate, vector element size
 @rd_pg_rn_esz		........ esz:2 ... ... ... pg:3 rn:5 rd:5	&rpr_esz
 
+# Two register operands with a 6-bit signed immediate.
+@rd_rn_i6		........ ... rn:5 ..... imm:s6 rd:5		&rri
+
 # Two register operand, one immediate operand, with predicate, element size encoded as TSZHL.
 # User must fill in imm.
 @rdn_pg_tszimm		........ .. ... ... ... pg:3 ..... rd:5		&rpri_esz rn=%reg_movprfx esz=%tszimm_esz
@@ -218,6 +221,15 @@ INDEX_ri		00000100 esz:2 1 imm:s5 010001 rn:5 rd:5
 # SVE index generation (register start, register increment)
 INDEX_rr		00000100 .. 1 ..... 010011 ..... .....		@rd_rn_rm_esz
 
+### SVE Stack Allocation Group
+
+# SVE stack frame adjustment
+ADDVL			00000100 001 ..... 01010 ...... .....		@rd_rn_i6
+ADDPL			00000100 011 ..... 01010 ...... .....		@rd_rn_i6
+
+# SVE stack frame size
+RDVL			00000100 101 11111 01010 imm:s6 rd:5
+
 ### SVE Predicate Generation Group
 
 # SVE initialize predicate (PTRUE, PTRUES)
-- 
2.14.3

