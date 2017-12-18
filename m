Received: by 10.223.159.74 with SMTP id f10csp2963572wrg;
        Mon, 18 Dec 2017 10:14:10 -0800 (PST)
X-Google-Smtp-Source: ACJfBouuT9V0bUdJe2jHdfpqL55tD1QA2ii1ueKPcf6vsWxwKy//9PJlqH4j38oLlFSSAsE3EAMe
X-Received: by 10.37.175.205 with SMTP id d13mr549048ybj.228.1513620850091;
        Mon, 18 Dec 2017 10:14:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513620850; cv=none;
        d=google.com; s=arc-20160816;
        b=Arly3scR33qOupH5LLOij8W0MUB+azYjzITh6OHOu8IpsQow6nkB33iJ7KTfUoVKfM
         kf2hzVkgj5+oSkOsDa2Ez2X5bPCCIwsoXShaicEhJEQTC5eOb2p8k9hFM2Aeilnnaw9w
         wordWF3fZc8hTpXqzYs7MXIznjZ4lkUfcP7bxOJBNBX/D3gPencm93++IKDZBP4UeLDz
         XfvsoqBuJmz67af8OtQrdoYR/GwvK5y1vENH/4q7n2nOpR1O9Ud5/Nd/lnUsQJG0AIde
         P32d5yVgN1LY1KFdFNdjfE2nFs+P87xoOwYkdjUvXzxLhJhKVqOcvOoti2HWVf8KVQAG
         +xSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=AY0VrenhwgfxRVh8W8VPt2M/vsScMF29p9zDK0Mm/X4=;
        b=ARD4zDDWrmJ8mtFRUBMx+JFPLuZrkN52DyR1euu9rf4eQX2PAKqPAtCjDDmc5jo2Lq
         /hjqsA+upBNAG463Rj1mdXTiCWFGHPOWyUWyywhYa6FBbPoCfzWGcek6or0INjn+HG4q
         VMw30t9I+oPPJJUYLbalDHUnyFNxP2CliCyI2gJtrWP+2bOUx3rE159rXjV9Z26+wjrT
         xG4lYqADRHz/M82RD/EHLN6Sw1bB9bMa/sHwjsXiSAlFPmzwuaDtfk4SOZizCcVDZ8fX
         wekgAvOXZVPxCEkZ1drrTv6bebGGSx7mNns3ZD3bJrZErvddb/jdf1hDyvKyojVxGP4J
         pGYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Stx9aPgn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y16si923879ybg.689.2017.12.18.10.14.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 10:14:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Stx9aPgn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60251 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eQzvV-00012D-ET
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 13:14:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUd-0008Nm-99
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUa-0002BV-MF
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:23 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:42618)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQzUa-0002B5-GH
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:20 -0500
Received: by mail-pg0-x241.google.com with SMTP id q67so207564pga.9
	for <qemu-arm@nongnu.org>; Mon, 18 Dec 2017 09:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AY0VrenhwgfxRVh8W8VPt2M/vsScMF29p9zDK0Mm/X4=;
	b=Stx9aPgnYJTueC+9k3sO3WSTQ/X9TarUuGKcrOBi7M/I3tl/CO0AuBbIB6Zkqdz7XH
	7NDwoGB8KBMekVxrPVeSysWfv2Lxgz1otjiTCB/shlpKeJ5CcaGJY+EiN2pvzr7yWyL4
	/m2T5AzthujkxCHSnlwlpiaAmcUAlJteZelDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AY0VrenhwgfxRVh8W8VPt2M/vsScMF29p9zDK0Mm/X4=;
	b=j8tUUeSI0blJGb0idjinRTQnfPrKXEjAyWMYEIYRntrXOIYfq+FtyNQaHYMynqR/Nf
	AUS5XkSG1TvY1w9wg28Fj9dHu3oa9yKDEqEuig9AhkNRX8NtJlbg89i3oPwYfN+bR6Kx
	NNqzAkKOTi9Ap3Xa5haD4HHFyHgFadxfXV5QY4wFNSESjqxXFiaw3Jmrt1r6BnN2vcun
	bWcEQnERysjdbEEkpZid6ApffafAAwuZ4fRAox3jN4ZH9QwjgVMA6BSf3tdOMmOHqiz2
	non2SMVDePnNhiE86VvXQo5UI7/L30LqzCnP2JJ99SY513+dkoIVTfVTZq0klQQRhKR7
	Xd3Q==
X-Gm-Message-State: AKGB3mLu/SheQryuWCLoL67Xc0xZSmQEgHGiRlWD9WgiiimvmTWwolKM
	j/AM3cXOHH1XRkLdrl+Ld4q7WA==
X-Received: by 10.99.45.67 with SMTP id t64mr439169pgt.146.1513619179575;
	Mon, 18 Dec 2017 09:46:19 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63]) by smtp.gmail.com with ESMTPSA id
	t84sm26209657pfe.160.2017.12.18.09.46.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:46:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:45:45 -0800
Message-Id: <20171218174552.18871-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171218174552.18871-1-richard.henderson@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH 16/23] target/arm: Implement SVE Integer
 Arithmetic - Unpredicated Group
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
X-TUID: lmmbBwcWu5tt

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 30 ++++++++++++++++++++++++++++++
 target/arm/sve.def         | 13 +++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 83793ab169..7edec8ba96 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -127,6 +127,36 @@ static void do_zzz_genfn(DisasContext *s, arg_rrr_esz *a, GVecGen3Fn *fn)
     do_genfn3(s, fn, a->esz, a->rd, a->rn, a->rm);
 }
 
+void trans_ADD_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    do_zzz_genfn(s, a, tcg_gen_gvec_add);
+}
+
+void trans_SUB_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    do_zzz_genfn(s, a, tcg_gen_gvec_sub);
+}
+
+void trans_SQADD_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    do_zzz_genfn(s, a, tcg_gen_gvec_ssadd);
+}
+
+void trans_SQSUB_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    do_zzz_genfn(s, a, tcg_gen_gvec_sssub);
+}
+
+void trans_UQADD_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    do_zzz_genfn(s, a, tcg_gen_gvec_usadd);
+}
+
+void trans_UQSUB_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    do_zzz_genfn(s, a, tcg_gen_gvec_ussub);
+}
+
 void trans_AND_zzz(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
 {
     do_zzz_genfn(s, a, tcg_gen_gvec_and);
diff --git a/target/arm/sve.def b/target/arm/sve.def
index 3ae871394c..a33fec4f33 100644
--- a/target/arm/sve.def
+++ b/target/arm/sve.def
@@ -53,6 +53,9 @@
 # Named instruction formats.  These are generally used to
 # reduce the amount of duplication between instruction patterns.
 
+# Three operand
+@rd_rn_rm_esz		........ esz:2 . rm:5  ... ...  rn:5 rd:5	&rrr_esz
+
 # Three operand with unused vector element size
 @rd_rn_rm		........ ... rm:5  ... ...  rn:5 rd:5		&rrr_esz esz=0
 
@@ -183,6 +186,16 @@ MLS			00000100 .. 0 ..... 011 ... ..... .....		@rda_pg_rn_rm_esz
 MLA			00000100 .. 0 ..... 110 ... ..... .....		@rdn_pg_ra_rm_esz # MAD
 MLS			00000100 .. 0 ..... 111 ... ..... .....		@rdn_pg_ra_rm_esz # MSB
 
+### SVE Integer Arithmetic - Unpredicated Group
+
+# SVE integer add/subtract vectors (unpredicated)
+ADD_zzz			00000100 .. 1 ..... 000 000 ..... .....		@rd_rn_rm_esz
+SUB_zzz			00000100 .. 1 ..... 000 001 ..... .....		@rd_rn_rm_esz
+SQADD_zzz		00000100 .. 1 ..... 000 100 ..... .....		@rd_rn_rm_esz
+UQADD_zzz		00000100 .. 1 ..... 000 101 ..... .....		@rd_rn_rm_esz
+SQSUB_zzz		00000100 .. 1 ..... 000 110 ..... .....		@rd_rn_rm_esz
+UQSUB_zzz		00000100 .. 1 ..... 000 111 ..... .....		@rd_rn_rm_esz
+
 ### SVE Logical - Unpredicated Group
 
 # SVE bitwise logical operations (unpredicated)
-- 
2.14.3

