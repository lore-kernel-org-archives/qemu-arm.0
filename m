Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp756430lfr;
        Fri, 16 Apr 2021 14:59:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVkd7lfdfa6brlYr0/7kUvvP1wVl+ugz560eYjYlmgomU9Ew5JzgY1oB19E+HoXGE5IBNj
X-Received: by 2002:a02:c72e:: with SMTP id h14mr5918435jao.88.1618610390181;
        Fri, 16 Apr 2021 14:59:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618610390; cv=none;
        d=google.com; s=arc-20160816;
        b=FBPxU/3dwdhPzMMT7XS3ezmRcXJcQx7FIIoAGXAQzKbPiNIjwkrNywqmcDl8Iw9dE+
         VTANdgCSlI/y75J+vKYcqa9V4z6dP6VZYLwOYAaOd6WJDMa76LkxH+yRjZgEi/gdNXVi
         lEz0RAwLhQTpEFhD4a6ixA4zuQNBQja/DKfReqMW4dEIzjvGaYjU4GTqEMifQ6KK7dwM
         GM62bYRZivDQwzVaoXcrXWcf85WWMdm6zHlwv161CNZt15ZrD5n3HYwWu92mA8DaYwpP
         w2Hk7Q+9Bv/+kSXta2nohF0yw/ofLmOfyjqOUliloK6L3/splp6dqrOMZKBzqV+1ETCA
         tpSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Nzy1xDOFf+uPUAwqPevG83MmScnqopiQ3mxZt4fgtoc=;
        b=Iz+5GZvDdkT0MP71mKuJLf4SePcvsA04W/8CnHf9VhzcHaSlXK0PfdVtCZiHNVYYc0
         ZByWWunYE8gK8HXl0aF/A9KZKAb9iO7IEZTd8rUUPTuZLkeSuNpxwvxedp5ozEPhq7zV
         Tg9l1+Bq+61wbmiHQ/qoYv3Nk7CBuIA6MRvERt2sAasWJf6pZBn52VtNK6zSzHVPtepy
         QHYQEjOw/Z8HkdFXrnooblGl/hlYGlOPjwnFKFdiHbIJrP1o3UofGcQ/O1UxJx1B/nUg
         nyoTTR8zKiKJmFMhF29kEgDhztZpTQw0r3rOIrZ+QKpyfn6ktGuK+X4fnWya8QgYjHG9
         E+cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Uop53OCD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t19si3686266jam.106.2021.04.16.14.59.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:59:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Uop53OCD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXWVB-0000g7-DI
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdn-0006Tc-JU
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:39 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:34721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdV-0001mC-Ik
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:39 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 em21-20020a17090b0155b029014e204a81e6so6951510pjb.1
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nzy1xDOFf+uPUAwqPevG83MmScnqopiQ3mxZt4fgtoc=;
 b=Uop53OCD+0b1isatRsOdXELnfVCwQ6EqPY3INyfFGOlml6oe04blH2JtsR3etJJrUt
 x/+DyynsvjYQXrU02/7k2ecMtG28XbMO1O+4+0ExCxFYN/6HHHxzE+od3XzN0FX5q1lk
 V3+0cZ4sktQd+qtKhI7WBAH+lhQPmc80aLT0NZECq14II7ia3V8OAhyL4CQfvAOVznvX
 dpC3ewimsKn9blQVw8KOtDcLmE/Ud3StjpbVZaNZxEVyaDnReMZAJzOubgAqqBKRSi/W
 pVKaZrdOZCkdLyyJIhNMI2puUVNRtW9IKGRkLfQoAtO62tvy/iQnkdmkFkHGaQjmLf4P
 Wbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nzy1xDOFf+uPUAwqPevG83MmScnqopiQ3mxZt4fgtoc=;
 b=OLm7mW1o4dHNEj+/hhvg1lIKxWcjDbCKKyLII1IkthmqqGphwuclry+XtpBPlKSHhT
 ZmR6aGSTSA/ik28AtJYXjRPCfXyXaY+sjYiHb6PDHKK958tlwD6W2afS0O0uGuCs1dhl
 PVAAv0cIa6Z/nVWWJYAjvi0GONrRGBExwDze8G28mgYUdohAy7/291O0ijC6VS74VaNq
 BgOD0W3NeudSuCKqPAT8dYvIeHXyJGRYAx4XgVkoW9NPtngNXf/YWSn4ed9gF+EKAJhx
 Y1mLLks2Qi7SNLQZS5vFAHSdyY1Or2fKR5KROdHzGK+3rM89AzkJjfb+YGoOLKqBIJQC
 4Zgg==
X-Gm-Message-State: AOAM533WCi0GPdQPa8Tku5qAsq5xOc5wKumQr9/AzyoLPdCxDtOoWokH
 cP07yJwIp9ibv0MtzcHCpVNE0gsIThRVig==
X-Received: by 2002:a17:902:7788:b029:e9:11:5334 with SMTP id
 o8-20020a1709027788b02900e900115334mr11377757pll.70.1618607059628; 
 Fri, 16 Apr 2021 14:04:19 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 69/81] target/arm: Share table of sve load functions
Date: Fri, 16 Apr 2021 14:02:28 -0700
Message-Id: <20210416210240.1591291-70-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ou1YmIFFxlM6

The table used by do_ldrq is a subset of the table used by do_ld_zpa;
we can share them by passing dtype instead of msz to do_ldrq.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 254 ++++++++++++++++++-------------------
 1 file changed, 126 insertions(+), 128 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index fe8f87d55e..04efa037f2 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5153,128 +5153,130 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
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
@@ -5512,14 +5514,8 @@ static bool trans_LDNF1_zpri(DisasContext *s, arg_rpri_load *a)
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
@@ -5551,7 +5547,9 @@ static void do_ldrq(DisasContext *s, int zt, int pg, TCGv_i64 addr, int msz)
     t_pg = tcg_temp_new_ptr();
     tcg_gen_addi_ptr(t_pg, cpu_env, poff);
 
-    fns[s->be_data == MO_BE][msz](cpu_env, t_pg, addr, t_desc);
+    gen_helper_gvec_mem *fn
+        = ldr_fns[s->mte_active[0]][s->be_data == MO_BE][dtype][0];
+    fn(cpu_env, t_pg, addr, t_desc);
 
     tcg_temp_free_ptr(t_pg);
     tcg_temp_free_i32(t_desc);
@@ -5573,7 +5571,7 @@ static bool trans_LD1RQ_zprr(DisasContext *s, arg_rprr_load *a)
         TCGv_i64 addr = new_tmp_a64(s);
         tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), msz);
         tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rn));
-        do_ldrq(s, a->rd, a->pg, addr, msz);
+        do_ldrq(s, a->rd, a->pg, addr, a->dtype);
     }
     return true;
 }
@@ -5583,7 +5581,7 @@ static bool trans_LD1RQ_zpri(DisasContext *s, arg_rpri_load *a)
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

