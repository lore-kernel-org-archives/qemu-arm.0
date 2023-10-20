Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1205381ejb;
        Fri, 20 Oct 2023 06:04:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG87J0gnPUH0yi4Et2rDwlXTOL/MBSmvTLcxqlp8hlbeafSa+1mgDzD+W8FxrjMFPwNTA/U
X-Received: by 2002:a05:6214:29cc:b0:66d:9589:6bb6 with SMTP id gh12-20020a05621429cc00b0066d95896bb6mr1681051qvb.63.1697807092856;
        Fri, 20 Oct 2023 06:04:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697807092; cv=none;
        d=google.com; s=arc-20160816;
        b=BPZ/zhE4zQJxpK1VGhbK8tSwgPmX9f5r2VVrBqRB3ZwiyKo7k7/gKmNfNIFgT6J3BO
         LCMyxfA6eXzTGkW0RTJ4+rEi1lX6HLreKbt7muK89hxLGtNTJfTuNqUP7wJDM4xIW8jR
         e6xFQs1Yaq/LmHLUgGOCYmSv/GJB4SZejF9Pt/OfokrWWQe5TMwIp510LGb6+UiGb4YB
         eNPXv0Jr19NTCpUq4rNpxfDIMG2/ZqcjPrKc7ZQdZlXcYCKhIEfBqf9OLIq7jlNDEPks
         GNMzGdgiEiVi/zahb6Fjo3JIaPOgabqzXSc6elc7k4a+dtukx5Dv+UYQvnu9CnxlHksL
         yVrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LSmy0AQ2ctzt4sBy/4+sAM4ntN11b2Cq/iHR2Msv118=;
        fh=QWGggua+3ufs1S3QlzhTWcDhlhc7bBCtXi/Y+/UuB8A=;
        b=FAseigIdhjobf4KJUEdW8GpGKxc6O0MEWxIai8ttsmngE6KXzwO7RyE2sP8RMOGhnS
         tI2A4DH66j58o58qAxjeOdvNdFffIwZUvBbgwFyapqMygLS+jtr3aXWoXIeNaNKbMjeD
         2LNcE+Ly7HZLRj/UAXdvXDGe78stJdY4e06RrkxW7imhJhPg9ZE6HWsGdyyYzY9EEMrl
         QNJTdiU/rg0ZEu11mcb83c2HoJkAOppaRQbZC4e6IDfWX2EfgVF/9bVkIdAOqRy0BUkb
         ojHrBx7hWMk8cVw3TQEaNndlUFQVc0kZx25+WyI/9mhY8khdROKCw+7L5yJ1wn6d2+sI
         zIFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZaOVU1Wd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id lb11-20020a056214318b00b006587967568dsi1389107qvb.196.2023.10.20.06.04.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 06:04:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZaOVU1Wd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtpAw-0001cT-RR; Fri, 20 Oct 2023 09:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtpAl-0000rf-1a
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 09:04:16 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtpAi-0005Lr-Bd
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 09:04:14 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9b95622c620so124118366b.0
 for <qemu-arm@nongnu.org>; Fri, 20 Oct 2023 06:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697807050; x=1698411850; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LSmy0AQ2ctzt4sBy/4+sAM4ntN11b2Cq/iHR2Msv118=;
 b=ZaOVU1WdVB2Eu95j73/qAX8nJn8MV4rWIVcHDVM2rMhC1sxAp/tokeGQd8GlpdqfKY
 X2nC+WJp5gZeg2NFCY/FzqwrB2rFWH265bO2IRC+ckfUpLlsb63WiAUk/wwRlS+hBtHD
 jc8/cO+9PMFrRnz0yoE9Ox+gywvv2n5dmfI4Iutv/TsV7LaB+R025mtm17bdt1gmd4mR
 TOYeWAAQ6kPnECS/RMAfEYXS80yyBAEd4F2m66nKYWkEcZh3/9TEc3N0ma5AG9InXkIG
 Nj4+ew/esqESDofflc5jWEPDk3XcpBz4fzrmFgcTVDz00lCq/4UQgsViI3f0aARD+blO
 1dxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697807050; x=1698411850;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LSmy0AQ2ctzt4sBy/4+sAM4ntN11b2Cq/iHR2Msv118=;
 b=f1tkqw1/GdcfTpqeu3u4r9LceLcvw7sSz03n8j38dEZ6Do12wdvkLgOsvcfa+svB0O
 CMyxDcjQVy8iXMPjdSw3uXm710bePZ9QYOTEINfln0cX1VvaWAiziDVSreBJv94Vb6NR
 LpjiemiRQRNQqIIA0dz1+AJsfoiBhSwZLkRZNyAcIk+TL2mh+kqT89p0k2oUAPLuIZo5
 yEDUEN+BgRY/fz+iDDgOQYgBBNyLrBbLoFTn/aNHHMqA4lfkUjsPXazXeiMPpOltnAwl
 iq8/I+ofacsEH6RINMX1xPKrmvRN+rC5EGkO0JLcb1LrO0ppVy9/ngTFZLGDz5Yo2u2D
 C9IQ==
X-Gm-Message-State: AOJu0Yy+7P9iWwT/O5g+MuYriTGqXdVaU+rdNlpEKLlbD2D3pnuGL+eQ
 gmNig1pqpSInZQjXfmlUI+QHUg==
X-Received: by 2002:a17:907:a03:b0:9be:5ab2:73c2 with SMTP id
 bb3-20020a1709070a0300b009be5ab273c2mr1295033ejc.58.1697807049770; 
 Fri, 20 Oct 2023 06:04:09 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 y19-20020a170906519300b009adc7733f98sm1484765ejk.97.2023.10.20.06.04.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Oct 2023 06:04:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 6/9] hw/intc/pxa2xx: Convert to Resettable interface
Date: Fri, 20 Oct 2023 15:03:27 +0200
Message-ID: <20231020130331.50048-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020130331.50048-1-philmd@linaro.org>
References: <20231020130331.50048-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: hIWERV7iQxuY

Factor reset code out of the DeviceRealize() handler.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/pxa2xx_pic.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/hw/arm/pxa2xx_pic.c b/hw/arm/pxa2xx_pic.c
index 47132ab982..2eb869a605 100644
--- a/hw/arm/pxa2xx_pic.c
+++ b/hw/arm/pxa2xx_pic.c
@@ -271,12 +271,9 @@ static int pxa2xx_pic_post_load(void *opaque, int version_id)
     return 0;
 }
 
-DeviceState *pxa2xx_pic_init(hwaddr base, ARMCPU *cpu)
+static void pxa2xx_pic_reset_hold(Object *obj)
 {
-    DeviceState *dev = qdev_new(TYPE_PXA2XX_PIC);
-    PXA2xxPICState *s = PXA2XX_PIC(dev);
-
-    s->cpu = cpu;
+    PXA2xxPICState *s = PXA2XX_PIC(obj);
 
     s->int_pending[0] = 0;
     s->int_pending[1] = 0;
@@ -284,6 +281,14 @@ DeviceState *pxa2xx_pic_init(hwaddr base, ARMCPU *cpu)
     s->int_enabled[1] = 0;
     s->is_fiq[0] = 0;
     s->is_fiq[1] = 0;
+}
+
+DeviceState *pxa2xx_pic_init(hwaddr base, ARMCPU *cpu)
+{
+    DeviceState *dev = qdev_new(TYPE_PXA2XX_PIC);
+    PXA2xxPICState *s = PXA2XX_PIC(dev);
+
+    s->cpu = cpu;
 
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
@@ -319,9 +324,11 @@ static const VMStateDescription vmstate_pxa2xx_pic_regs = {
 static void pxa2xx_pic_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     dc->desc = "PXA2xx PIC";
     dc->vmsd = &vmstate_pxa2xx_pic_regs;
+    rc->phases.hold = pxa2xx_pic_reset_hold;
 }
 
 static const TypeInfo pxa2xx_pic_info = {
-- 
2.41.0

