Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5774343wrq;
        Tue, 26 Jun 2018 21:41:19 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc9+e4s/DRNm2/gGD1avk6Cz2pYMqcxBokfR+seL8MWIzEcqp7jutd6vjinNpX4IxUeXHvl
X-Received: by 2002:a37:1456:: with SMTP id e83-v6mr3970612qkh.69.1530074479679;
        Tue, 26 Jun 2018 21:41:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530074479; cv=none;
        d=google.com; s=arc-20160816;
        b=ApoLL7i4dd05XwqpQmbRcG3TEK1SWD9yk8aoJFImciWCCGRtA3vlY3LLvXV6WlytFC
         r5XSb8mh48vifzlXzcaQSTe26f4lWBmw8g/Yo/cjxhuMDFDK/PyiQ4DwWEZwc8ltjdDq
         lcFxWDTVgAf4ls56YPSW4eM4ryuYEdOkZUrPTxIqGYB+Cx/6QK+IcWaVyF+k1vArGWRC
         Bga7X08j28cCXPC7YYQiu926SVbI4MmBk23twQI1v01AAO66zlQwQ9++lAzyjW0X84XM
         RXmKUI0DI3/Uywi3L1YCtIF1SWcIjnfxPmamtpiS6Bxi6K15asn8K4YVfrGM6TYO89Oi
         zGGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=dhB8ii/GaM/P1LrIoAgJ5HoWXCaUKMDijHadhOvMSUc=;
        b=ZPn2ZUZIVU1XMQHKldh73LimYKzaPm0GZVWK8uGsv8kQp9xb+ggYNteZ06wrMagFy0
         4DmqRQopEigCECen1oNM+IEAZWD+ZdPI/5I3xXs0zFUwr6G3mN6uNJ0c4RqyccZ41Qo6
         GUQK4crsDI0a2uexB6Enb5sOvtIc75F8W9R4ZzZxbnisQdZf8aO57L/MwR4W/qHF+5MU
         n3eKopq6xqfJjkIJzA/YXrm1kNygnT8qeUZFphi3gQF5RxGnB7SlVciIzEs4C3Sb6GCc
         Ldy2mz6U9+WhXP1wnrIL/rOVzlh17TTHGnbHxc9MjK/RSyJsznsDA2Ad6gdPhJlfWvIn
         XLsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OTrEyJvG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r8-v6si3117072qte.194.2018.06.26.21.41.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:41:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OTrEyJvG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56524 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2Gd-00020R-5F
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:41:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60554)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29U-0004JS-Pq
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29R-0000a2-H7
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:56 -0400
Received: from mail-pg0-x22e.google.com ([2607:f8b0:400e:c05::22e]:45284)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29R-0000Ye-5M
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:53 -0400
Received: by mail-pg0-x22e.google.com with SMTP id z1-v6so356721pgv.12
	for <qemu-arm@nongnu.org>; Tue, 26 Jun 2018 21:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dhB8ii/GaM/P1LrIoAgJ5HoWXCaUKMDijHadhOvMSUc=;
	b=OTrEyJvGApnT5jQ64CAc0Q3i0rfOuVYF4Ou1BBEtyCAS43+bORzUUSmUjkvxDlR/Yw
	BZf2iQSD8anGq3u6fMWfv7LGJahtn4hoFFBC6L+7j97PZzrUQmMHNMLOAXNn0g9225Ut
	Q9bCXT4SxiYsHCbH+JSwxHP6dRNyoskLlMm9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dhB8ii/GaM/P1LrIoAgJ5HoWXCaUKMDijHadhOvMSUc=;
	b=O7+ia1PljsVlM2KH7ngEum1QU7quXySJZSbbJMp4La8gHh+RLvqdBSMe4T6WOqvdc3
	ESvPgtwCHE7ZmaUcmZJa92ZdPHJxj+b5x3C56yiszxMI57WrACYGivEhuu5oI0qyzOFD
	y0qo8UE70i9KaGm9U8JXgRHyGdSTG/BAFi6RfStvbx3yD7tc9mLisPJubLrIm7aaqXyx
	BjxW5eU7bvPhaTmW/9Y+76XBJZ7fNGUeIPdyc0B7BSw+ZHqtnmJlQ1km7LftWu8pPQf7
	vQZzyH8qBmQG2QK5T9d6fRSZbZa2BnZ4f08fwKolytrmjedWK6iSd5/HOTCsha9GRt6t
	LWfg==
X-Gm-Message-State: APt69E1hiPYH+xyBtUbVuHqdsQo2q4G2R16HmHGpj3EL59EZhp0Zv23O
	x45dE0pBa6liZVAOwb5/5ns5VA==
X-Received: by 2002:a63:6501:: with SMTP id
	z1-v6mr3747234pgb.452.1530074032199; 
	Tue, 26 Jun 2018 21:33:52 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.33.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:33:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:33:08 -0700
Message-Id: <20180627043328.11531-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22e
Subject: [Qemu-arm] [PATCH v6 15/35] target/arm: Implement SVE scatter store
 vector immediate
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
X-TUID: KiVwTAwTVG/l

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 85 ++++++++++++++++++++++++++------------
 target/arm/sve.decode      | 11 +++++
 2 files changed, 70 insertions(+), 26 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ea4407b746..9eb2530d3b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4391,32 +4391,34 @@ static bool trans_LD1_zpiz(DisasContext *s, arg_LD1_zpiz *a, uint32_t insn)
     return true;
 }
 
+/* Indexed by [xs][msz].  */
+static gen_helper_gvec_mem_scatter * const scatter_store_fn32[2][3] = {
+    { gen_helper_sve_stbs_zsu,
+      gen_helper_sve_sths_zsu,
+      gen_helper_sve_stss_zsu, },
+    { gen_helper_sve_stbs_zss,
+      gen_helper_sve_sths_zss,
+      gen_helper_sve_stss_zss, },
+};
+
+/* Note that we overload xs=2 to indicate 64-bit offset.  */
+static gen_helper_gvec_mem_scatter * const scatter_store_fn64[3][4] = {
+    { gen_helper_sve_stbd_zsu,
+      gen_helper_sve_sthd_zsu,
+      gen_helper_sve_stsd_zsu,
+      gen_helper_sve_stdd_zsu, },
+    { gen_helper_sve_stbd_zss,
+      gen_helper_sve_sthd_zss,
+      gen_helper_sve_stsd_zss,
+      gen_helper_sve_stdd_zss, },
+    { gen_helper_sve_stbd_zd,
+      gen_helper_sve_sthd_zd,
+      gen_helper_sve_stsd_zd,
+      gen_helper_sve_stdd_zd, },
+};
+
 static bool trans_ST1_zprz(DisasContext *s, arg_ST1_zprz *a, uint32_t insn)
 {
-    /* Indexed by [xs][msz].  */
-    static gen_helper_gvec_mem_scatter * const fn32[2][3] = {
-        { gen_helper_sve_stbs_zsu,
-          gen_helper_sve_sths_zsu,
-          gen_helper_sve_stss_zsu, },
-        { gen_helper_sve_stbs_zss,
-          gen_helper_sve_sths_zss,
-          gen_helper_sve_stss_zss, },
-    };
-    /* Note that we overload xs=2 to indicate 64-bit offset.  */
-    static gen_helper_gvec_mem_scatter * const fn64[3][4] = {
-        { gen_helper_sve_stbd_zsu,
-          gen_helper_sve_sthd_zsu,
-          gen_helper_sve_stsd_zsu,
-          gen_helper_sve_stdd_zsu, },
-        { gen_helper_sve_stbd_zss,
-          gen_helper_sve_sthd_zss,
-          gen_helper_sve_stsd_zss,
-          gen_helper_sve_stdd_zss, },
-        { gen_helper_sve_stbd_zd,
-          gen_helper_sve_sthd_zd,
-          gen_helper_sve_stsd_zd,
-          gen_helper_sve_stdd_zd, },
-    };
     gen_helper_gvec_mem_scatter *fn;
 
     if (a->esz < a->msz || (a->msz == 0 && a->scale)) {
@@ -4427,10 +4429,10 @@ static bool trans_ST1_zprz(DisasContext *s, arg_ST1_zprz *a, uint32_t insn)
     }
     switch (a->esz) {
     case MO_32:
-        fn = fn32[a->xs][a->msz];
+        fn = scatter_store_fn32[a->xs][a->msz];
         break;
     case MO_64:
-        fn = fn64[a->xs][a->msz];
+        fn = scatter_store_fn64[a->xs][a->msz];
         break;
     default:
         g_assert_not_reached();
@@ -4440,6 +4442,37 @@ static bool trans_ST1_zprz(DisasContext *s, arg_ST1_zprz *a, uint32_t insn)
     return true;
 }
 
+static bool trans_ST1_zpiz(DisasContext *s, arg_ST1_zpiz *a, uint32_t insn)
+{
+    gen_helper_gvec_mem_scatter *fn = NULL;
+    TCGv_i64 imm;
+
+    if (a->esz < a->msz) {
+        return false;
+    }
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    switch (a->esz) {
+    case MO_32:
+        fn = scatter_store_fn32[0][a->msz];
+        break;
+    case MO_64:
+        fn = scatter_store_fn64[2][a->msz];
+        break;
+    }
+    assert(fn != NULL);
+
+    /* Treat ST1_zpiz (zn[x] + imm) the same way as ST1_zprz (rn + zm[x])
+     * by loading the immediate into the scalar parameter.
+     */
+    imm = tcg_const_i64(a->imm << a->msz);
+    do_mem_zpz(s, a->rd, a->pg, a->rn, 0, imm, fn);
+    tcg_temp_free_i64(imm);
+    return true;
+}
+
 /*
  * Prefetches
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 45016c6042..75133ce659 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -83,6 +83,7 @@
 &rprr_gather_load       rd pg rn rm esz msz u ff xs scale
 &rpri_gather_load       rd pg rn imm esz msz u ff
 &rprr_scatter_store     rd pg rn rm esz msz xs scale
+&rpri_scatter_store     rd pg rn imm esz msz
 
 ###########################################################################
 # Named instruction formats.  These are generally used to
@@ -219,6 +220,8 @@
                     &rprr_store nreg=0
 @rprr_scatter_store ....... msz:2 ..     rm:5 ... pg:3 rn:5 rd:5 \
                     &rprr_scatter_store
+@rpri_scatter_store ....... msz:2 ..    imm:5 ... pg:3 rn:5 rd:5 \
+                    &rpri_scatter_store
 
 ###########################################################################
 # Instruction patterns.  Grouped according to the SVE encodingindex.xhtml.
@@ -932,6 +935,14 @@ ST1_zprz        1110010 .. 01 ..... 101 ... ..... ..... \
 ST1_zprz        1110010 .. 00 ..... 101 ... ..... ..... \
                 @rprr_scatter_store xs=2 esz=3 scale=0
 
+# SVE 64-bit scatter store (vector plus immediate)
+ST1_zpiz        1110010 .. 10 ..... 101 ... ..... ..... \
+                @rpri_scatter_store esz=3
+
+# SVE 32-bit scatter store (vector plus immediate)
+ST1_zpiz        1110010 .. 11 ..... 101 ... ..... ..... \
+                @rpri_scatter_store esz=2
+
 # SVE 64-bit scatter store (scalar plus unpacked 32-bit scaled offset)
 # Require msz > 0
 ST1_zprz        1110010 .. 01 ..... 100 ... ..... ..... \
-- 
2.17.1

