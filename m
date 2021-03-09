Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2956351lfg;
        Tue, 9 Mar 2021 08:22:35 -0800 (PST)
X-Received: by 2002:a05:6808:4c1:: with SMTP id a1mr3456555oie.37.1615306955790;
        Tue, 09 Mar 2021 08:22:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306955; cv=none;
        d=google.com; s=arc-20160816;
        b=DQ7SUV0E1CXK3g8fulGTMUoG+ZbR4x+QCsFYqYWoapmJzTK96dGk4e91e0II8KpJhC
         FLaMzI3oQQqCgQrM2vBdTWLivJVI77t/ztNfwKy3e9swa9r/pv8iD+E9W7XRcLOaI9yK
         cIMkH286lBpNNls0fQnqtaYYcCHlx9mFmOL+3kjVlqu7bi9AQ/C0h1p1NUjU4twpcjbX
         CG/w3lGQW+8Ym1fmA6hZwRAgy+m7F+n+snwNar4XIBuUw++mbHCC3ZLybLwD6tHT4vxn
         bbzwB38oAzA2+lQgxDdLioDHIfLA6oh9uY45WdkByZdzx4/cx2iwxhuDSNtva5MPll2O
         2FYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WetfNKkPM8tDPE/v/V+6AUBIG8HNbSZnOY/2KKUmIqc=;
        b=lH3P0esIdPi2MMbeXY53D1ZdFXIPk4mxWqL93CJVF0I8hAKAsZ47Fm6B3IlTLvuPHx
         cW+DSAA0tvmka2W9VCmau4r90XoDe2xa7bZRp0JEoP8oLX7Pn3/DO+fnTv0Ggz68ldaB
         xeC81F/HtveYEFVoafLbZcY1AZKERJmqmNFWp6duoSeZWdwa0xE3MH01Ch0qGwd8bVZm
         KNkqizYp4WfDHB5JF944VjxWBeYW5jN0Up+MDU1GrKvtpAkvyKBntans3p4vfQBHOtJ/
         SUL3Q20qAV4YoeUM5t3F3V3fEt5RY4CNh1AosTr3OcsQt1W27aqCcOOKMxhgaoTXmAnF
         jt9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r+bvgRzP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q132sor875015oia.165.2021.03.09.08.22.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:22:35 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r+bvgRzP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WetfNKkPM8tDPE/v/V+6AUBIG8HNbSZnOY/2KKUmIqc=;
        b=r+bvgRzPSnmJDuzanddzlCEXYYGsvou9+tHRdSSOxsa6kqaZGpsOk8i6L8iulFZrks
         n9MOjvwqVaJ85pHiHSDNVVbeV6znA7viSPRdGI4sduRFgjlMVuRs2ZxNUP9WFtel2uuP
         k1LHR+rmVIAJK4z+0BWDd4pYWqvAvmRBH8OMjctI9mvlULNbh5+BKCjFAgKiQ6A4BD4E
         Nx1lZZC7sUQ92gH/fsFe9mCCJqViknla8JZ1RVuOT5TIbyr7oQFKRZQCvsz4TO2LnFVC
         Yzq0Pue4qoP1/PgiTNKMp+oFVuo9yWEgMZShmwnNuxo6pGNnEgy3isRM8fm3VDAcoQjH
         sCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WetfNKkPM8tDPE/v/V+6AUBIG8HNbSZnOY/2KKUmIqc=;
        b=OmYHQ4RTOcs9tQDgGl0WiEF1o57waoFUmrScpzU6RAJO9cmAh/4Y0M8lOS03VEcVbl
         Cq0yFnvlgCE9qZOP3uWMdr1hGRUn7qYv8HFh3dXwW7tp+1Ds/KKecSY1rVBR7x/JxuJu
         3ec505kJ6lIULOczrfyslDbhh0cMEPbgvqAL/OI63AHfaZxUHTlD+jb0rPQ2BL+mzN6g
         bYTKS0SJ+7dp4IsrEEHYgpepP718GRzZac3grd97LJBmscZF3zo82apSUlQpO+mUPWgv
         vQB+rt2wwpVj5RwCi7grak/vyavIAi/Q35T7qHT575QcanzQknLFbH24tcVPBZNctQhc
         qCbg==
X-Gm-Message-State: AOAM531hlOkSeaLxdAaEsvCNxIhk894LtOVcBjR81Bj8gWClnxGlmzgW
	eVKjjUc12BAgp0Yk6fTe7zqXHlg1
X-Google-Smtp-Source: ABdhPJzUl87lzGuXoGPWGOGOfkJjtM07dAdW4VA8fFd0NnqyzHd0t7wvSX7VUad9KzcMB7PbNSRu/w==
X-Received: by 2002:aca:ea83:: with SMTP id i125mr3553595oih.18.1615306955398;
        Tue, 09 Mar 2021 08:22:35 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:22:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 72/78] target/arm: Share table of sve load functions
Date: Tue,  9 Mar 2021 08:20:35 -0800
Message-Id: <20210309162041.23124-73-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 0zJbCuDZuSJG

The table used by do_ldrq is a subset of the table used by do_ld_zpa;
we can share them by passing dtype instead of msz to do_ldrq.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 254 ++++++++++++++++++-------------------
 1 file changed, 126 insertions(+), 128 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index d7c3ad047f..130abea7a5 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5204,128 +5204,130 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
     tcg_temp_free_i32(t_desc);
 }
 
+/* Indexed by [mte][be][dtype][nreg] */
+static gen_helper_gvec_mem * const ldr_fns[2][2][16][4] = {
+    { /* mte inactive, little-endian */
+      { { gen_helper_sve_ld1bb_r, gen_helper_sve_ld2bb_r,
+          gen_helper_sve_ld3bb_r, gen_helper_sve_ld4bb_r },
+        { gen_helper_sve_ld1bhu_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bsu_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bdu_r, NULL, NULL, NULL },
+
+        { gen_helper_sve_ld1sds_le_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1hh_le_r, gen_helper_sve_ld2hh_le_r,
+          gen_helper_sve_ld3hh_le_r, gen_helper_sve_ld4hh_le_r },
+        { gen_helper_sve_ld1hsu_le_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1hdu_le_r, NULL, NULL, NULL },
+
+        { gen_helper_sve_ld1hds_le_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1hss_le_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1ss_le_r, gen_helper_sve_ld2ss_le_r,
+          gen_helper_sve_ld3ss_le_r, gen_helper_sve_ld4ss_le_r },
+        { gen_helper_sve_ld1sdu_le_r, NULL, NULL, NULL },
+
+        { gen_helper_sve_ld1bds_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bss_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bhs_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1dd_le_r, gen_helper_sve_ld2dd_le_r,
+          gen_helper_sve_ld3dd_le_r, gen_helper_sve_ld4dd_le_r } },
+
+      /* mte inactive, big-endian */
+      { { gen_helper_sve_ld1bb_r, gen_helper_sve_ld2bb_r,
+          gen_helper_sve_ld3bb_r, gen_helper_sve_ld4bb_r },
+        { gen_helper_sve_ld1bhu_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bsu_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bdu_r, NULL, NULL, NULL },
+
+        { gen_helper_sve_ld1sds_be_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1hh_be_r, gen_helper_sve_ld2hh_be_r,
+          gen_helper_sve_ld3hh_be_r, gen_helper_sve_ld4hh_be_r },
+        { gen_helper_sve_ld1hsu_be_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1hdu_be_r, NULL, NULL, NULL },
+
+        { gen_helper_sve_ld1hds_be_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1hss_be_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1ss_be_r, gen_helper_sve_ld2ss_be_r,
+          gen_helper_sve_ld3ss_be_r, gen_helper_sve_ld4ss_be_r },
+        { gen_helper_sve_ld1sdu_be_r, NULL, NULL, NULL },
+
+        { gen_helper_sve_ld1bds_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bss_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bhs_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1dd_be_r, gen_helper_sve_ld2dd_be_r,
+          gen_helper_sve_ld3dd_be_r, gen_helper_sve_ld4dd_be_r } } },
+
+    { /* mte active, little-endian */
+      { { gen_helper_sve_ld1bb_r_mte,
+          gen_helper_sve_ld2bb_r_mte,
+          gen_helper_sve_ld3bb_r_mte,
+          gen_helper_sve_ld4bb_r_mte },
+        { gen_helper_sve_ld1bhu_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bsu_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bdu_r_mte, NULL, NULL, NULL },
+
+        { gen_helper_sve_ld1sds_le_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1hh_le_r_mte,
+          gen_helper_sve_ld2hh_le_r_mte,
+          gen_helper_sve_ld3hh_le_r_mte,
+          gen_helper_sve_ld4hh_le_r_mte },
+        { gen_helper_sve_ld1hsu_le_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1hdu_le_r_mte, NULL, NULL, NULL },
+
+        { gen_helper_sve_ld1hds_le_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1hss_le_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1ss_le_r_mte,
+          gen_helper_sve_ld2ss_le_r_mte,
+          gen_helper_sve_ld3ss_le_r_mte,
+          gen_helper_sve_ld4ss_le_r_mte },
+        { gen_helper_sve_ld1sdu_le_r_mte, NULL, NULL, NULL },
+
+        { gen_helper_sve_ld1bds_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bss_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bhs_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1dd_le_r_mte,
+          gen_helper_sve_ld2dd_le_r_mte,
+          gen_helper_sve_ld3dd_le_r_mte,
+          gen_helper_sve_ld4dd_le_r_mte } },
+
+      /* mte active, big-endian */
+      { { gen_helper_sve_ld1bb_r_mte,
+          gen_helper_sve_ld2bb_r_mte,
+          gen_helper_sve_ld3bb_r_mte,
+          gen_helper_sve_ld4bb_r_mte },
+        { gen_helper_sve_ld1bhu_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bsu_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bdu_r_mte, NULL, NULL, NULL },
+
+        { gen_helper_sve_ld1sds_be_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1hh_be_r_mte,
+          gen_helper_sve_ld2hh_be_r_mte,
+          gen_helper_sve_ld3hh_be_r_mte,
+          gen_helper_sve_ld4hh_be_r_mte },
+        { gen_helper_sve_ld1hsu_be_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1hdu_be_r_mte, NULL, NULL, NULL },
+
+        { gen_helper_sve_ld1hds_be_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1hss_be_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1ss_be_r_mte,
+          gen_helper_sve_ld2ss_be_r_mte,
+          gen_helper_sve_ld3ss_be_r_mte,
+          gen_helper_sve_ld4ss_be_r_mte },
+        { gen_helper_sve_ld1sdu_be_r_mte, NULL, NULL, NULL },
+
+        { gen_helper_sve_ld1bds_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bss_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bhs_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1dd_be_r_mte,
+          gen_helper_sve_ld2dd_be_r_mte,
+          gen_helper_sve_ld3dd_be_r_mte,
+          gen_helper_sve_ld4dd_be_r_mte } } },
+};
+
 static void do_ld_zpa(DisasContext *s, int zt, int pg,
                       TCGv_i64 addr, int dtype, int nreg)
 {
-    static gen_helper_gvec_mem * const fns[2][2][16][4] = {
-        { /* mte inactive, little-endian */
-          { { gen_helper_sve_ld1bb_r, gen_helper_sve_ld2bb_r,
-            gen_helper_sve_ld3bb_r, gen_helper_sve_ld4bb_r },
-            { gen_helper_sve_ld1bhu_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bsu_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bdu_r, NULL, NULL, NULL },
-
-            { gen_helper_sve_ld1sds_le_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1hh_le_r, gen_helper_sve_ld2hh_le_r,
-              gen_helper_sve_ld3hh_le_r, gen_helper_sve_ld4hh_le_r },
-            { gen_helper_sve_ld1hsu_le_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1hdu_le_r, NULL, NULL, NULL },
-
-            { gen_helper_sve_ld1hds_le_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1hss_le_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1ss_le_r, gen_helper_sve_ld2ss_le_r,
-              gen_helper_sve_ld3ss_le_r, gen_helper_sve_ld4ss_le_r },
-            { gen_helper_sve_ld1sdu_le_r, NULL, NULL, NULL },
-
-            { gen_helper_sve_ld1bds_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bss_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bhs_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1dd_le_r, gen_helper_sve_ld2dd_le_r,
-              gen_helper_sve_ld3dd_le_r, gen_helper_sve_ld4dd_le_r } },
-
-          /* mte inactive, big-endian */
-          { { gen_helper_sve_ld1bb_r, gen_helper_sve_ld2bb_r,
-              gen_helper_sve_ld3bb_r, gen_helper_sve_ld4bb_r },
-            { gen_helper_sve_ld1bhu_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bsu_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bdu_r, NULL, NULL, NULL },
-
-            { gen_helper_sve_ld1sds_be_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1hh_be_r, gen_helper_sve_ld2hh_be_r,
-              gen_helper_sve_ld3hh_be_r, gen_helper_sve_ld4hh_be_r },
-            { gen_helper_sve_ld1hsu_be_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1hdu_be_r, NULL, NULL, NULL },
-
-            { gen_helper_sve_ld1hds_be_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1hss_be_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1ss_be_r, gen_helper_sve_ld2ss_be_r,
-              gen_helper_sve_ld3ss_be_r, gen_helper_sve_ld4ss_be_r },
-            { gen_helper_sve_ld1sdu_be_r, NULL, NULL, NULL },
-
-            { gen_helper_sve_ld1bds_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bss_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bhs_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1dd_be_r, gen_helper_sve_ld2dd_be_r,
-              gen_helper_sve_ld3dd_be_r, gen_helper_sve_ld4dd_be_r } } },
-
-        { /* mte active, little-endian */
-          { { gen_helper_sve_ld1bb_r_mte,
-              gen_helper_sve_ld2bb_r_mte,
-              gen_helper_sve_ld3bb_r_mte,
-              gen_helper_sve_ld4bb_r_mte },
-            { gen_helper_sve_ld1bhu_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bsu_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bdu_r_mte, NULL, NULL, NULL },
-
-            { gen_helper_sve_ld1sds_le_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1hh_le_r_mte,
-              gen_helper_sve_ld2hh_le_r_mte,
-              gen_helper_sve_ld3hh_le_r_mte,
-              gen_helper_sve_ld4hh_le_r_mte },
-            { gen_helper_sve_ld1hsu_le_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1hdu_le_r_mte, NULL, NULL, NULL },
-
-            { gen_helper_sve_ld1hds_le_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1hss_le_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1ss_le_r_mte,
-              gen_helper_sve_ld2ss_le_r_mte,
-              gen_helper_sve_ld3ss_le_r_mte,
-              gen_helper_sve_ld4ss_le_r_mte },
-            { gen_helper_sve_ld1sdu_le_r_mte, NULL, NULL, NULL },
-
-            { gen_helper_sve_ld1bds_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bss_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bhs_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1dd_le_r_mte,
-              gen_helper_sve_ld2dd_le_r_mte,
-              gen_helper_sve_ld3dd_le_r_mte,
-              gen_helper_sve_ld4dd_le_r_mte } },
-
-          /* mte active, big-endian */
-          { { gen_helper_sve_ld1bb_r_mte,
-              gen_helper_sve_ld2bb_r_mte,
-              gen_helper_sve_ld3bb_r_mte,
-              gen_helper_sve_ld4bb_r_mte },
-            { gen_helper_sve_ld1bhu_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bsu_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bdu_r_mte, NULL, NULL, NULL },
-
-            { gen_helper_sve_ld1sds_be_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1hh_be_r_mte,
-              gen_helper_sve_ld2hh_be_r_mte,
-              gen_helper_sve_ld3hh_be_r_mte,
-              gen_helper_sve_ld4hh_be_r_mte },
-            { gen_helper_sve_ld1hsu_be_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1hdu_be_r_mte, NULL, NULL, NULL },
-
-            { gen_helper_sve_ld1hds_be_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1hss_be_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1ss_be_r_mte,
-              gen_helper_sve_ld2ss_be_r_mte,
-              gen_helper_sve_ld3ss_be_r_mte,
-              gen_helper_sve_ld4ss_be_r_mte },
-            { gen_helper_sve_ld1sdu_be_r_mte, NULL, NULL, NULL },
-
-            { gen_helper_sve_ld1bds_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bss_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bhs_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1dd_be_r_mte,
-              gen_helper_sve_ld2dd_be_r_mte,
-              gen_helper_sve_ld3dd_be_r_mte,
-              gen_helper_sve_ld4dd_be_r_mte } } },
-    };
     gen_helper_gvec_mem *fn
-        = fns[s->mte_active[0]][s->be_data == MO_BE][dtype][nreg];
+        = ldr_fns[s->mte_active[0]][s->be_data == MO_BE][dtype][nreg];
 
     /*
      * While there are holes in the table, they are not
@@ -5563,14 +5565,8 @@ static bool trans_LDNF1_zpri(DisasContext *s, arg_rpri_load *a)
     return true;
 }
 
-static void do_ldrq(DisasContext *s, int zt, int pg, TCGv_i64 addr, int msz)
+static void do_ldrq(DisasContext *s, int zt, int pg, TCGv_i64 addr, int dtype)
 {
-    static gen_helper_gvec_mem * const fns[2][4] = {
-        { gen_helper_sve_ld1bb_r,    gen_helper_sve_ld1hh_le_r,
-          gen_helper_sve_ld1ss_le_r, gen_helper_sve_ld1dd_le_r },
-        { gen_helper_sve_ld1bb_r,    gen_helper_sve_ld1hh_be_r,
-          gen_helper_sve_ld1ss_be_r, gen_helper_sve_ld1dd_be_r },
-    };
     unsigned vsz = vec_full_reg_size(s);
     TCGv_ptr t_pg;
     TCGv_i32 t_desc;
@@ -5602,7 +5598,9 @@ static void do_ldrq(DisasContext *s, int zt, int pg, TCGv_i64 addr, int msz)
     t_pg = tcg_temp_new_ptr();
     tcg_gen_addi_ptr(t_pg, cpu_env, poff);
 
-    fns[s->be_data == MO_BE][msz](cpu_env, t_pg, addr, t_desc);
+    gen_helper_gvec_mem *fn
+        = ldr_fns[s->mte_active[0]][s->be_data == MO_BE][dtype][0];
+    fn(cpu_env, t_pg, addr, t_desc);
 
     tcg_temp_free_ptr(t_pg);
     tcg_temp_free_i32(t_desc);
@@ -5624,7 +5622,7 @@ static bool trans_LD1RQ_zprr(DisasContext *s, arg_rprr_load *a)
         TCGv_i64 addr = new_tmp_a64(s);
         tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), msz);
         tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rn));
-        do_ldrq(s, a->rd, a->pg, addr, msz);
+        do_ldrq(s, a->rd, a->pg, addr, a->dtype);
     }
     return true;
 }
@@ -5634,7 +5632,7 @@ static bool trans_LD1RQ_zpri(DisasContext *s, arg_rpri_load *a)
     if (sve_access_check(s)) {
         TCGv_i64 addr = new_tmp_a64(s);
         tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn), a->imm * 16);
-        do_ldrq(s, a->rd, a->pg, addr, dtype_msz(a->dtype));
+        do_ldrq(s, a->rd, a->pg, addr, a->dtype);
     }
     return true;
 }
-- 
2.25.1
