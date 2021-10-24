Received: by 2002:ac2:5bdb:0:0:0:0:0 with SMTP id u27csp315434lfn;
        Sun, 24 Oct 2021 09:17:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOT6S3v2EIVpe/jhdRlOSZea27H/srb/E5uQ3SeutKF+e8cimzsiBerlKItvvFjQxFhiWL
X-Received: by 2002:a9d:5610:: with SMTP id e16mr10454207oti.324.1635092221939;
        Sun, 24 Oct 2021 09:17:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635092221; cv=none;
        d=google.com; s=arc-20160816;
        b=qBukeTZqR6n6U5P/4cUpO5k9rA5kTT14aDSrBL9FqWXjVU/rv5kMyWkG6ycPMhAMgi
         kXCQsSU8myatfv75dhuHjMPG90mCMcDktdV7UEmc9a3BxpteA0776wi/5jfVtuwt/sr1
         5lpEq93zXwqj0DIXWxiPVwPZdRd5FfytyFaMhrtC6zRn3bVSaLR9EH0h+vLOevQwENYD
         ERgB3zz3uy8IIK2Z+jt8TP309KWGYr24I4PPOPa1HKG+oE8iMmfWH+J8v/IdJ68F2/wJ
         Lfy808OvwOnbArYcuQPAKVhyp5dIOCVl8dpxFpINFIQ5cEzv0CcedWqqhU/Bq4RGvqc7
         gZzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=O1BoBsNweUhtwI2foBYUrbLKkFOSUy9/c6YZdEqMFi0=;
        b=YmphG0ASF3JD4eG+0zjHG6WCJ7Xcb+k3ahSECG8aFIZbVUOmdWNBNsetefoIfz7raV
         90I7YxJUcD54oKRIRCNW7FrLw8mlTuoF8yfEVDLcOXx46Nw3piDlIIA1vmpqDQXibolL
         iIyRq2Cp4mbYnXhoESI67+v84PxNb7JzYp8PIzwuShaaLGsJs+4pseaicTm1Zv62S7Q4
         jyuDHK62ivprgq1tQSSPIRE7KGpRT09vxhYKYj+4CoyUtBIjAG0nw1N3UmPc/t6Zj/CE
         PodFB3bsyk2QC9z1o6d/TIQ0m9lrn8nHZDIhipviorz5Kx6sBjc1zZzhY5xe4PkVTqiX
         ey6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=HLQx7+s9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x28si21288934ote.92.2021.10.24.09.17.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 Oct 2021 09:17:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=HLQx7+s9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1megBB-00061o-1u
	for alex.bennee@linaro.org; Sun, 24 Oct 2021 12:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1megAo-0005z0-Mi; Sun, 24 Oct 2021 12:16:38 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:34794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1megAl-00089X-Fz; Sun, 24 Oct 2021 12:16:37 -0400
Received: by mail-wr1-x42d.google.com with SMTP id d10so3990705wrb.1;
 Sun, 24 Oct 2021 09:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O1BoBsNweUhtwI2foBYUrbLKkFOSUy9/c6YZdEqMFi0=;
 b=HLQx7+s9mS3U6Bvl98KXWFqJTLGr74GgiZKciOnQAmb+7/uxFgWCeOWZJOQWj20UTD
 rrelJvkwbTj+AOn3i3N/4PXLTSaxya3mvTUw5RyLCItuA10wIb6CK8L+tHqBmnCB1wnE
 zi1yZK8hKDKr95gquXeScTAUH4Q8BWTARbZOo490iLLuGEE+q+RYmHcLkF8tLg8KVu1p
 GBGDyKclBqHNVXD3fS9MyCho5J1y7oK5Zyqgrf2GXtXKeiH85HNP8JvAQFCGXq0zvXAy
 U+SgY66j0ED8DDQCvcpwucXi1XNKDTUvxc/LbVYVp3SkaIU4PJL4pzPKqL1aAE8bEX3w
 gKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=O1BoBsNweUhtwI2foBYUrbLKkFOSUy9/c6YZdEqMFi0=;
 b=Np87esHRc04W2QNpi5gQ8enFmsmEldlfSjh9vVT2I8ery8kC+cifssd3Q5s4WQ6Cvp
 Yb5pQrFfwiUwPpwsUCp3o+2VXCdpmMtax2VKr/3cbN0mF68Yg1FfbrhCEGR3VnNXC8h7
 tJ4WmFDwfFXjybKaP3d6iJq8rhg3IfMkMNsETMQ4Vd8u1FVWAso6yvsS4ObaALPj49UL
 uovOzrEcr3/Bcbk2EdhnsLz51i30AJ/FnlgFXpAZY+FafHwyjb/uY1hrSraUWyX3G1ts
 s5rHbCS9yl4IneBX1gXEFslSPiIq5ier5cbcIICqdOEToLCrGSYqkGW2U/3PeLIw78FI
 JPzg==
X-Gm-Message-State: AOAM5312dOP/X2AE/qPDLOpN0CZyBCV+0NivQ3OkTo7XfYIdrR75esLa
 Ebz5UxnHFMVeWx3TpuNVomS1wGjEfQs=
X-Received: by 2002:a5d:6941:: with SMTP id r1mr4573781wrw.373.1635092192305; 
 Sun, 24 Oct 2021 09:16:32 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 f1sm9622312wrc.74.2021.10.24.09.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 09:16:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] target/arm: Use tcg_constant_i64() in do_sat_addsub_64()
Date: Sun, 24 Oct 2021 18:16:17 +0200
Message-Id: <20211024161619.325903-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211024161619.325903-1-f4bug@amsat.org>
References: <20211024161619.325903-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1CHRl7cPSUXG

The immediate value used for comparison is constant and
read-only. Move it to the constant pool. This frees a
TCG temporary for unsigned saturation opcodes.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/translate-sve.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index bc91a641711..76b5fe9f313 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1943,20 +1943,20 @@ static void do_sat_addsub_32(TCGv_i64 reg, TCGv_i64 val, bool u, bool d)
 static void do_sat_addsub_64(TCGv_i64 reg, TCGv_i64 val, bool u, bool d)
 {
     TCGv_i64 t0 = tcg_temp_new_i64();
-    TCGv_i64 t1 = tcg_temp_new_i64();
     TCGv_i64 t2;
 
     if (u) {
         if (d) {
             tcg_gen_sub_i64(t0, reg, val);
-            tcg_gen_movi_i64(t1, 0);
-            tcg_gen_movcond_i64(TCG_COND_LTU, reg, reg, val, t1, t0);
+            t2 = tcg_constant_i64(0);
+            tcg_gen_movcond_i64(TCG_COND_LTU, reg, reg, val, t2, t0);
         } else {
             tcg_gen_add_i64(t0, reg, val);
-            tcg_gen_movi_i64(t1, -1);
-            tcg_gen_movcond_i64(TCG_COND_LTU, reg, t0, reg, t1, t0);
+            t2 = tcg_constant_i64(-1);
+            tcg_gen_movcond_i64(TCG_COND_LTU, reg, t0, reg, t2, t0);
         }
     } else {
+        TCGv_i64 t1 = tcg_temp_new_i64();
         if (d) {
             /* Detect signed overflow for subtraction.  */
             tcg_gen_xor_i64(t0, reg, val);
@@ -1966,7 +1966,7 @@ static void do_sat_addsub_64(TCGv_i64 reg, TCGv_i64 val, bool u, bool d)
 
             /* Bound the result.  */
             tcg_gen_movi_i64(reg, INT64_MIN);
-            t2 = tcg_const_i64(0);
+            t2 = tcg_constant_i64(0);
             tcg_gen_movcond_i64(TCG_COND_LT, reg, t0, t2, reg, t1);
         } else {
             /* Detect signed overflow for addition.  */
@@ -1977,13 +1977,12 @@ static void do_sat_addsub_64(TCGv_i64 reg, TCGv_i64 val, bool u, bool d)
 
             /* Bound the result.  */
             tcg_gen_movi_i64(t1, INT64_MAX);
-            t2 = tcg_const_i64(0);
+            t2 = tcg_constant_i64(0);
             tcg_gen_movcond_i64(TCG_COND_LT, reg, t0, t2, t1, reg);
         }
-        tcg_temp_free_i64(t2);
+        tcg_temp_free_i64(t1);
     }
     tcg_temp_free_i64(t0);
-    tcg_temp_free_i64(t1);
 }
 
 /* Similarly with a vector and a scalar operand.  */
-- 
2.31.1

