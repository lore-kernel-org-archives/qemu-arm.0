Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9862ECCA476
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Oct 2025 13:44:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v7DOr-0002CP-DR; Fri, 10 Oct 2025 09:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DOk-00028n-J6
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 09:43:08 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DOU-0007ld-6q
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 09:43:01 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3f2ae6fadb4so2426632f8f.1
 for <qemu-arm@nongnu.org>; Fri, 10 Oct 2025 06:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760103753; x=1760708553; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wozWQ4+uKhU2Woke0EiPtGgDjWqN+p+Av15OT51Ys1o=;
 b=CZyK/SYWWIqxN+JiCD0ks+wEAzbLuIBS4tJZTut0Q1ReuEWtDLuwaSTQUTFK/JK1xs
 6VyuLPFwgOqHw8F8JPWTLrOiOQtJMO3AfZLGA4R6tqLd0vTcp0xkA3JYUG8+uP+iqqG5
 hWZgWBQl4QPoqJ7zhA1bERTfkq55OOZiHESccj5nPiknrGbQALDnH8dIX7O8FVJJkUaO
 2a9HvvVGUulf+gPOPOAXqA/mh6Cqmd84S0Rn3dtSUIvRzbk+IhBEsdI+YmDdYp9CUYAX
 mXhvsWAwKKARE3Ja2BhgUh3gMy20ae9kjqM/rWXJKGVwaTQA+3VW9G/R7vETRC9qTG16
 Gb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760103753; x=1760708553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wozWQ4+uKhU2Woke0EiPtGgDjWqN+p+Av15OT51Ys1o=;
 b=W8a6504yoYVFali/Ak11zfhdzqKnOh/hmXGPR/6YfplkNFiji8D555xgaxRTq5Petv
 s9ozD0k3DxhUZR5OybbG2g8wdExUKPBHnwF6r6NpdhNLkKUQmnWGjaeZgd4YjwcGt+Rq
 MYftk+r2JIWTG3/D56qLQTSRtrpPhxH6135+7M+xMY+y+MXT/MBYaI1g36GxKXVTC40m
 8H2MrSnYvG1tNwpbf9PQfqlUQezH1dtMYkjapUfPnTsv6J6DWsw6sPFcUZrHylp/yPWm
 uShLp0zKDkuTOWHFa/iL/sCp2Mt+FfJ13vx9FoeeM8U7iNCwkdO19SIYOS7LaktfCBfT
 mCGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLaYQaF7kmiILZFglxEe5wwzbSWAjIirQ+q6FD/Wo/ALNbX3o/A3s6SXMneHGYWVKtEmvVKahW7g==@nongnu.org
X-Gm-Message-State: AOJu0Yx7L9ud/SHprhDDBJ+ctTeylod0szuson2ZbvFSPCOojPO4LzJu
 cx6wbuYunJ9mIRFkikLUUpODM8s7uI55zUgl/Ez2wjSFT/GtIZypjehX3REGR+TyBf0=
X-Gm-Gg: ASbGncvGVJaTadJBVFJLPUfyw/+wEb3V8h3EwNd7UFiBOzaFzmfyQ95h3MM5wXl9Bk4
 PyZALO7XddZUeEVcVHuTEtGyqJTMvS/v9yXiEutBBhfe06cFgH1YJzoaOBvl1GJobWwkHhi5mIF
 I6O8NF6MxbeYITEOAR21hKg2g0SVzJT0soHNqZLNYqbxu+bHI1fJWTfdpDrCVXDzxy/z8Li2FyO
 gd6Gq2xxkVX3u1XQfn8lWAWjGM8XThNAIhBn4kpuikPoiIbuKW3y+lgDpKRfhKXn0d+KwFnsubh
 cc5k8/c524NmE5x13VH1F+AC4cxlUR00PzckQSZQytwjKS8pNJfT3L73rRApox1N3NrFDh3vEkm
 Rgno0vpaUPyZjal165bSXmu7bW9fqD/6kLUr5XvVlzpvKTLkQ5YeuN5wlXQYk7Vc/webcEAX2Wb
 +WjDuMOR7UVmWyuKCuipiiE4D89wzD8g==
X-Google-Smtp-Source: AGHT+IErZZEwB4uw1hXoXCFarD7Y+fhbeaRNLRAD8qc0l2ueYPzIctHC9WNhaN8/3Y7GMnt0v+LIkA==
X-Received: by 2002:a05:6000:2505:b0:405:3028:1be2 with SMTP id
 ffacd0b85a97d-42666ac4748mr7297622f8f.11.1760103753514; 
 Fri, 10 Oct 2025 06:42:33 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce50d70esm4457288f8f.0.2025.10.10.06.42.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Oct 2025 06:42:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 01/16] linux-user/arm: Checkpatch style cleanups
Date: Fri, 10 Oct 2025 15:42:10 +0200
Message-ID: <20251010134226.72221-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010134226.72221-1-philmd@linaro.org>
References: <20251010134226.72221-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Update style in a pair of methods we are going to modify in
the following commit. No functional change.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 linux-user/arm/nwfpe/fpa11_cpdt.c | 66 ++++++++++++++++---------------
 1 file changed, 35 insertions(+), 31 deletions(-)

diff --git a/linux-user/arm/nwfpe/fpa11_cpdt.c b/linux-user/arm/nwfpe/fpa11_cpdt.c
index fee525937c5..6b0317883a7 100644
--- a/linux-user/arm/nwfpe/fpa11_cpdt.c
+++ b/linux-user/arm/nwfpe/fpa11_cpdt.c
@@ -40,18 +40,18 @@ void loadSingle(const unsigned int Fn, target_ulong addr)
 static inline
 void loadDouble(const unsigned int Fn, target_ulong addr)
 {
-   FPA11 *fpa11 = GET_FPA11();
-   unsigned int *p;
-   p = (unsigned int*)&fpa11->fpreg[Fn].fDouble;
-   fpa11->fType[Fn] = typeDouble;
+    FPA11 *fpa11 = GET_FPA11();
+    unsigned int *p;
+    p = (unsigned int *)&fpa11->fpreg[Fn].fDouble;
+    fpa11->fType[Fn] = typeDouble;
 #if HOST_BIG_ENDIAN
-   /* FIXME - handle failure of get_user() */
-   get_user_u32(p[0], addr); /* sign & exponent */
-   get_user_u32(p[1], addr + 4);
+    /* FIXME - handle failure of get_user() */
+    get_user_u32(p[0], addr);       /* sign & exponent */
+    get_user_u32(p[1], addr + 4);
 #else
-   /* FIXME - handle failure of get_user() */
-   get_user_u32(p[0], addr + 4);
-   get_user_u32(p[1], addr); /* sign & exponent */
+    /* FIXME - handle failure of get_user() */
+    get_user_u32(p[0], addr + 4);
+    get_user_u32(p[1], addr);       /* sign & exponent */
 #endif
 }
 
@@ -108,16 +108,18 @@ void storeSingle(const unsigned int Fn, target_ulong addr)
 {
    FPA11 *fpa11 = GET_FPA11();
    float32 val;
-   register unsigned int *p = (unsigned int*)&val;
+   register unsigned int *p = (unsigned int *)&val;
 
    switch (fpa11->fType[Fn])
    {
       case typeDouble:
-         val = float64_to_float32(fpa11->fpreg[Fn].fDouble, &fpa11->fp_status);
+         val = float64_to_float32(fpa11->fpreg[Fn].fDouble,
+                                  &fpa11->fp_status);
       break;
 
       case typeExtended:
-         val = floatx80_to_float32(fpa11->fpreg[Fn].fExtended, &fpa11->fp_status);
+         val = floatx80_to_float32(fpa11->fpreg[Fn].fExtended,
+                                   &fpa11->fp_status);
       break;
 
       default: val = fpa11->fpreg[Fn].fSingle;
@@ -130,29 +132,31 @@ void storeSingle(const unsigned int Fn, target_ulong addr)
 static inline
 void storeDouble(const unsigned int Fn, target_ulong addr)
 {
-   FPA11 *fpa11 = GET_FPA11();
-   float64 val;
-   register unsigned int *p = (unsigned int*)&val;
+    FPA11 *fpa11 = GET_FPA11();
+    float64 val;
+    register unsigned int *p = (unsigned int *)&val;
 
-   switch (fpa11->fType[Fn])
-   {
-      case typeSingle:
-         val = float32_to_float64(fpa11->fpreg[Fn].fSingle, &fpa11->fp_status);
-      break;
+    switch (fpa11->fType[Fn]) {
+    case typeSingle:
+        val = float32_to_float64(fpa11->fpreg[Fn].fSingle,
+                                 &fpa11->fp_status);
+        break;
 
-      case typeExtended:
-         val = floatx80_to_float64(fpa11->fpreg[Fn].fExtended, &fpa11->fp_status);
-      break;
+    case typeExtended:
+        val = floatx80_to_float64(fpa11->fpreg[Fn].fExtended,
+                                  &fpa11->fp_status);
+        break;
 
-      default: val = fpa11->fpreg[Fn].fDouble;
-   }
-   /* FIXME - handle put_user() failures */
+    default:
+        val = fpa11->fpreg[Fn].fDouble;
+    }
+    /* FIXME - handle put_user() failures */
 #if HOST_BIG_ENDIAN
-   put_user_u32(p[0], addr);	/* msw */
-   put_user_u32(p[1], addr + 4);	/* lsw */
+    put_user_u32(p[0], addr);           /* msw */
+    put_user_u32(p[1], addr + 4);       /* lsw */
 #else
-   put_user_u32(p[1], addr);	/* msw */
-   put_user_u32(p[0], addr + 4);	/* lsw */
+    put_user_u32(p[1], addr);           /* msw */
+    put_user_u32(p[0], addr + 4);       /* lsw */
 #endif
 }
 
-- 
2.51.0


