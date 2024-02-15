Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp739802ejb;
        Thu, 15 Feb 2024 10:04:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWm4K00Vr2YbaAPtuhcL7y4OM2ss0yx13exOTQwnX8TvXBOL8v6yjr+/sz43wNv/PGfCoboLwawxdOw3TvxLvMjJMxWzT6K
X-Google-Smtp-Source: AGHT+IGcptlTXAF0CfN2s1zvlXF7YvMDogxEH4yLup/jr3LEtnnF0I6UC1GhVFMd9eZXz8SxAtLW
X-Received: by 2002:a1f:6602:0:b0:4c0:7d26:58da with SMTP id a2-20020a1f6602000000b004c07d2658damr2400374vkc.2.1708020283369;
        Thu, 15 Feb 2024 10:04:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708020283; cv=none;
        d=google.com; s=arc-20160816;
        b=JvJuyJgl3eHY8nS0IYEKjxYXC+chjq/0KkKP9D6UzqizeIUMYq6/S9EMZm2xowwWK5
         Z/nwkwCMakqDfUgxBCBGbZ4JF4ddsqZgUGxrbuABzJ/mlZTHzvsMIM9Uw/ipRqLFMRau
         GO945ZQZ+lO19rLGHqORZtDD50Z/8P68sCXu7VuYwjilvYfw1CGIacF2K//E+8/huNXK
         xK5QGdMbr5LqWLDt579W5Ojik+9R6qZeNFJtydIl97JnD2Qqii0TtdQxOhJZHcPoLI0T
         VS/plGjyOhETX4stJZhrd639ml8hPqZmEnq5D/m7VROrMoRl9EP52r9feabHptkaVPG6
         JoYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KrDWAyGRgS7V1HXGadIwipz2b43fHU+C3C1ocsMbGSU=;
        fh=YP1OlSQK5sAU6c7jpOseqoOmi3Ukq/ghTEDPwTgFHjs=;
        b=KKBD4MaWWOHE0NsXO/PGWyV/T5nrYsuk9iVKRYDhSZhEfXaKPRgvWJOaXGd7dd7/xl
         fLAkFqERr2cX6WHtehJm4bN2if5iIuXaDv3dtjQcbwjL9yqfezM3PirAvRUcaUF6rNXF
         YCM1ofFN2haNrwfhF+5BMwQZ5qSxiLUMZ6GCfxP031RFMXn+3drUlPP7V5CyhL3O7AJx
         JhwfLlmr9lh8ojy1Hgzyw3SK+aicFpM1BLliGMuDb2WhgJVygIog7zCFUaUe0IqySWOQ
         P4SQnOb93OnPUFFprB8YfA2u5QiVCZyHcMVJbu3hJfl8imH0AxxKLS1nsvE6sM76/wB7
         8mZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eSLdhUi4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g26-20020ac5c85a000000b004c021303babsi390622vkm.302.2024.02.15.10.04.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 10:04:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eSLdhUi4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rag1j-0006zy-QO; Thu, 15 Feb 2024 13:00:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag1g-0006cE-FB
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:00:00 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag1e-0001t8-E6
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:00:00 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-411d3c75026so9348275e9.0
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 09:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708019992; x=1708624792; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KrDWAyGRgS7V1HXGadIwipz2b43fHU+C3C1ocsMbGSU=;
 b=eSLdhUi4QXO3Q4APHbiB67wLcgis0wcTKvILLJ6Aw1XL43jad83bipoBhnWZaakNxK
 InhpHO0sXjpyZIAMIPcNbX3dQxzitCiveCWYq/96L1aHH3N/rwkUbvwEavL13a8P+Y5q
 bxBDw4Tvw05plZ0t+vfnPbx7lm1XfWS+qFxYBLy4ARdO1Q8yRLtE3ZaVJwTSX8156sk9
 AHXJjXWkashzsb5nsjSVvCqdxjsqA0ePxiD5hXORPJZjGoDoMlT2G371BoRzI3jbAbaX
 GpkPeNRvAM5LGvIC9x+FPCbskY+pxFmuzEwHzkt4rZiiyGK411jXS5lmei5Bp4tal3Hp
 +RDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708019992; x=1708624792;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KrDWAyGRgS7V1HXGadIwipz2b43fHU+C3C1ocsMbGSU=;
 b=ug6cXIN849q+dSzIbxZNyUfUERG2R6DqnUB4+TOf+X6SLbO00kPLzY8indRDdRzO22
 bPbYz+5AP7KaNaONKYi8pG0IQ+A+23VzbID6eTbO44qCKqWPRJqEzrzuE36MeOOsYEZY
 iqcCh2BYfCoSNZqKGPVE4Fupa5p5AFLmOr5ZOtrOwNhxQenBhg2bcOgjuw/pa5XZNtHe
 4TpPjgs2xGQuAFNHbBWmWRAqQZx/xs7vzGXxnLbGEQwFsO7ve5DuN0sSldPOEC0wd5Fa
 8PTHeUoZdCvICGsqmk6S5Z+heFuTJlgUtTOr6sR30WhE6aZhVnUi7tFqXRiXxKsAkOLN
 Yiqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9I/vrNckY7mkLpA4pmd9wA+wLzuetQXEqZMTNNndlz7m5fq4BS0HaDIUun6oBPDjCdeqIon5d5km8ON/kZOBcJksA
X-Gm-Message-State: AOJu0YwB2G09bW5ACFPkMJAyxdaXENsF8oM1YquwpWYeNmpY0hOq20Fg
 PbTU+2u2HwsyPgrB+VFBfbxuzZbSvUB3ukt4M/qqkbnE8IVt0uvvJkMA2gHS9UQ=
X-Received: by 2002:a05:600c:91a:b0:40e:f46d:ad35 with SMTP id
 m26-20020a05600c091a00b0040ef46dad35mr2161791wmp.36.1708019992628; 
 Thu, 15 Feb 2024 09:59:52 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a7bc7cb000000b00411b7c91470sm5630301wmk.12.2024.02.15.09.59.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 09:59:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 18/56] hw/isa: specify instance_size in isa_superio_type_info
Date: Thu, 15 Feb 2024 18:57:12 +0100
Message-ID: <20240215175752.82828-19-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NNwO4eR3oVIb

From: Paolo Bonzini <pbonzini@redhat.com>

Right now all subclasses of TYPE_ISA_SUPERIO have to specify an instance_size,
because the ISASuperIODevice struct adds fields to ISADevice but the type does
not include the increased instance size.  Failure to do so results in an access
past the bounds of struct ISADevice as soon as isa_superio_realize is called.
Fix this by specifying the instance_size already in the superclass.

Fixes: 4c3119a6e3 ("hw/isa/superio: Factor out the parallel code from pc87312.c")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20240213155005.109954-6-pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/isa-superio.c       | 2 +-
 hw/isa/smc37c669-superio.c | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/isa/isa-superio.c b/hw/isa/isa-superio.c
index 7dbfc374da..d85f22db1a 100644
--- a/hw/isa/isa-superio.c
+++ b/hw/isa/isa-superio.c
@@ -185,6 +185,7 @@ static const TypeInfo isa_superio_type_info = {
     .abstract = true,
     .class_size = sizeof(ISASuperIOClass),
     .class_init = isa_superio_class_init,
+    .instance_size = sizeof(ISASuperIODevice),
 };
 
 /* SMS FDC37M817 Super I/O */
@@ -201,7 +202,6 @@ static void fdc37m81x_class_init(ObjectClass *klass, void *data)
 static const TypeInfo fdc37m81x_type_info = {
     .name          = TYPE_FDC37M81X_SUPERIO,
     .parent        = TYPE_ISA_SUPERIO,
-    .instance_size = sizeof(ISASuperIODevice),
     .class_init    = fdc37m81x_class_init,
 };
 
diff --git a/hw/isa/smc37c669-superio.c b/hw/isa/smc37c669-superio.c
index 18287741cb..9e59dc1603 100644
--- a/hw/isa/smc37c669-superio.c
+++ b/hw/isa/smc37c669-superio.c
@@ -103,7 +103,6 @@ static void smc37c669_class_init(ObjectClass *klass, void *data)
 static const TypeInfo smc37c669_type_info = {
     .name          = TYPE_SMC37C669_SUPERIO,
     .parent        = TYPE_ISA_SUPERIO,
-    .instance_size = sizeof(ISASuperIODevice),
     .class_size    = sizeof(ISASuperIOClass),
     .class_init    = smc37c669_class_init,
 };
-- 
2.41.0

