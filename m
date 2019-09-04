Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1124996wrp;
        Wed, 4 Sep 2019 12:45:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzVxJawYUvW9MDwy0oIoC68EKEGO0z2bWXEycb4DHvi90sywTjqi4XVmBCorHRuW3700hDG
X-Received: by 2002:a50:8961:: with SMTP id f30mr24218555edf.144.1567626309000;
        Wed, 04 Sep 2019 12:45:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567626308; cv=none;
        d=google.com; s=arc-20160816;
        b=d0SGgry8Pq+wAckr1qOuH+oUf32PHyfJcEzk+InBmTF+3VNXAQupm87XFu9WjLfRkI
         /iPG5WvszjmROj96JQjANhKOBsW0D8/n4ka4snsxVCv1qrX/4yESR9j2wqW0MpkiJ8o4
         8ecHLo9ID8Jd1/KnysAVtC+2VT1Oqiw1LtBW0rW2ZOdbp4pavu17e2Jb1iTbCn2c9dYf
         L7/B0ReA4L5ELmrmw7pZBNdg8rm23ethL1LnDFbxUWqX1NirFgc9E3wtyf9VxNlJKpLu
         d/EJ/xZLpzzXu0pUK/0JekWEbRIHafsHUq0u9S0F5PXzYAHXNI+QhVpzn0z+J5DKDc/T
         1v2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=d8Wdw3hGEJ+w80H7Z6N3YxcS5gbQ3Bt1g5kmZafUCnU=;
        b=afVawTpe8RZnokFz8rcq+0HEUcdCn0S7qWVHz2VRspBBnM92BlZ48nzqu/A3cc7v4Z
         dbt5qvo9tkoCD7ZNk1ZmrUuW8h2ExoRh0Lj3aBT71MpuZ1/viSNyB+in8GqQleETF+HA
         Y89FTIyF9yapOAksR9rQfMDTyGoMIQBxSXObH4hsxg2vxHMMUXJEpkYKxfC9Rwu7zZf2
         mVm/EtIoIaDq8wO4NcVmmlgatzQ+Hu8YQh/sd7Z2W63S0TRYF6UjIjwYMYy2kMxeiUa0
         RGRjr68Do1IhQVUqdLptJAnIPh/MHG8BML568miuJt+qPS7MyU0IscD8NGuti45nc+Mh
         hvVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XqaFgemV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18si14201615ede.348.2019.09.04.12.45.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 12:45:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XqaFgemV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bDH-0000pX-CO
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 15:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39926)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5azt-0004I1-Tv
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:31:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5azs-0002Dg-EF
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:31:17 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:34997)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5azs-0002D8-5C
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:31:16 -0400
Received: by mail-pl1-x643.google.com with SMTP id gn20so10396plb.2
 for <qemu-devel@nongnu.org>; Wed, 04 Sep 2019 12:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=d8Wdw3hGEJ+w80H7Z6N3YxcS5gbQ3Bt1g5kmZafUCnU=;
 b=XqaFgemVzu4+yDiome30Gqndsi6Hd7TEIU+HmdXOt9oYd10J3YEtc3gPX/3qKvBS2m
 JryOVOrvFEv3gpcv+I3QiMD2gh6pBPnS/Y6GaKxqEa5Mkp8MkNggOF6nh24wk5XCo+1m
 gCFelZkqGfT4V52m5Ud9+NX7QCu9jLFxe/StTcBVYvRldGVELXFvEIYj8CDV6wHg/oBa
 LCmaJ7wL8sqOqjLA+5stnPxlJn6t/aK+GsVL6tgStRuf9JpiodOaOVRCnktA6xEI/yju
 t8Pg5sqc3xyn6D8FBiKoZfK5c2HX5N6qaEoRaYMgsLu3cXDUtJEC5zXxJSeQYP10pRof
 uQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=d8Wdw3hGEJ+w80H7Z6N3YxcS5gbQ3Bt1g5kmZafUCnU=;
 b=Yj/XpbSTO0Jo4e1icUJmcLDlmHtZMhef/MRhITZxtcesPqDdFTXl1uQeN4tNoec9pC
 kR7rEkHryI6cHPFji5J+7XI6LZldbPZDJ0LlLYTauT67M4Nc4IeMX16peb+JF/JDDXxz
 eWPJ3meyiQ6zl4UyxROqw/ftzdOk6aTgbyvet0ZdOyjBce77hSfmFON7H1JGKAjJifsc
 BoHABvMUqL88C+hxZgLF5y1XKqzeWQ/LMAnfBFvhQ/L8j81D0OMfOL3C6nz38qbuaGnW
 yOsNH5szb0ROmZ8CVkFZjVMH7AllYBb4gXuONqMPkVOmoaO4ijHh2p+b4nIrHhHO83ql
 wuSQ==
X-Gm-Message-State: APjAAAXCOKjXKypA7YV5gxW+lpRhKuAlDCGRV+c3mDBy3Zuvv56x1ON7
 x6JzNaM4h+ZegXevqZ7hRdwe2rhckkI=
X-Received: by 2002:a17:902:36a:: with SMTP id 97mr4443725pld.75.1567625474851; 
 Wed, 04 Sep 2019 12:31:14 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:31:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:01 -0700
Message-Id: <20190904193059.26202-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-devel] [PATCH v4 11/69] target/arm: Simplify op_smlawx for
 SMLAW*
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pv4M2bphnBk7

By shifting the 16-bit input left by 16, we can align the desired
portion of the 48-bit product and use tcg_gen_muls2_i32.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 37aa873e25..71cc96b70e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8242,7 +8242,6 @@ DO_SMLAX(SMLALTT, 2, 1, 1)
 static bool op_smlawx(DisasContext *s, arg_rrrr *a, bool add, bool mt)
 {
     TCGv_i32 t0, t1;
-    TCGv_i64 t64;
 
     if (!ENABLE_ARCH_5TE) {
         return false;
@@ -8250,16 +8249,17 @@ static bool op_smlawx(DisasContext *s, arg_rrrr *a, bool add, bool mt)
 
     t0 = load_reg(s, a->rn);
     t1 = load_reg(s, a->rm);
+    /*
+     * Since the nominal result is product<47:16>, shift the 16-bit
+     * input up by 16 bits, so that the result is at product<63:32>.
+     */
     if (mt) {
-        tcg_gen_sari_i32(t1, t1, 16);
+        tcg_gen_andi_i32(t1, t1, 0xffff0000);
     } else {
-        gen_sxth(t1);
+        tcg_gen_shli_i32(t1, t1, 16);
     }
-    t64 = gen_muls_i64_i32(t0, t1);
-    tcg_gen_shri_i64(t64, t64, 16);
-    t1 = tcg_temp_new_i32();
-    tcg_gen_extrl_i64_i32(t1, t64);
-    tcg_temp_free_i64(t64);
+    tcg_gen_muls2_i32(t0, t1, t0, t1);
+    tcg_temp_free_i32(t0);
     if (add) {
         t0 = load_reg(s, a->ra);
         gen_helper_add_setq(t1, cpu_env, t1, t0);
-- 
2.17.1

