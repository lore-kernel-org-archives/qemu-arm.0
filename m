Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp502585ejb;
        Thu, 19 Oct 2023 06:10:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECv1KRu/ySWy/fFfeN0FyqJPKKS+TEaBlQwDCFgZgvxZe7VTr+VX8bnEvFWnmIYFZqWTo2
X-Received: by 2002:a2e:b786:0:b0:2c5:130c:d41e with SMTP id n6-20020a2eb786000000b002c5130cd41emr1504673ljo.29.1697721033957;
        Thu, 19 Oct 2023 06:10:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697721033; cv=none;
        d=google.com; s=arc-20160816;
        b=E/0OSOrRnfcba9Pz6tEnO1iUDUmWQReg6SHXH+ZsAMwEINUnq8VMYaW73FGhEGeRvL
         G5Rv0+vIuPbsqsal5VWTAXa9MWU8VrZUXPBQcXqpJcrlJ05tuimw7xnWG4JiTUCg1YZD
         PXyyX9ZOTfjrrvtR7k/Ddhciurm5whIti+iss4MhTJnErV1GPWoCsDh2WX/9L/c0fiaX
         wppYPo/JwWTR41DL+56y8DTt938q6j/0Zx6Rw7qGcNypauwT4qmAa/VVQnSYAOVDixfA
         uhSU0t8H+YWuvStfXNZ5+BwFIvOKXihDXVp8xSO+9jcNM+XI8eDSgPCWkuzfxBQkWxrG
         Frng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LSmy0AQ2ctzt4sBy/4+sAM4ntN11b2Cq/iHR2Msv118=;
        fh=rYBZhAJdgCvxZRRcO2tKw9iXjHkAG8ZfVdmqU/2KeAE=;
        b=XHfK02Pa7CVAsl48qevqquVsQvCg03+wdC0DfSXPVQwI6k33agXfrxwnANtw58pKLT
         /aVlftWEe7TxImdlz16EdsAv/uGsnykF+NYy5sPuAS6yeiu1hc7hQMSI7wKrNrxhefIG
         AbFNIOzQU17mvRWWxmGiGh8gJOIZK2R24MZ/OyyC8pkytQ1nNTBum4mdgulk7pye8StK
         SYwLrAX6/R/rZAA2HtKjIG4FXrDFF4oK8jLwWR9XuxfjmUgkJIMe6zL90Kuxyeyd4dU5
         exlOXKnZaAzINsGs6KZ+kHpc1nM8ZYvzfulCJDR5wKECDYFFHB6qIL6MbvEioY8GpcwE
         4MCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qkr/v8nX";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z4-20020a05600c0a0400b00406529a448asi2472284wmp.62.2023.10.19.06.10.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 06:10:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qkr/v8nX";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtSn0-0005Gu-Hz; Thu, 19 Oct 2023 09:10:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtSms-000558-MA
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 09:10:06 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtSmq-0007n0-P8
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 09:10:06 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50797cf5b69so8474347e87.2
 for <qemu-devel@nongnu.org>; Thu, 19 Oct 2023 06:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697721003; x=1698325803; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LSmy0AQ2ctzt4sBy/4+sAM4ntN11b2Cq/iHR2Msv118=;
 b=qkr/v8nXIhz3SoD89Vr1W3sHlI/AXRfkyxtWvpdpwmBXUJYqE0igSD538JhtCDCkmH
 VKuwEPjOCELSOW0Zzbv+ZaF0SsCBB9DK0UehHrz6zPQPSs90XrOr13vZSLckpqfBkF28
 5PSEviougYHkfPxPnxaP901dqXAKaScxh7yT7eVSW7+BDFfvh7wvuH2hMivvPggmLh7D
 +8YV5R/tRkbT+gL/Q8zVXq4JGOBWrsq8cI2VnrdDOsshG4znZrhaZBPNUUrjETme+nlG
 HMWSLCrnUn5bnWH8K+8UMcFcCOergOPpT56/MTEKjrNlI0iBBAuhaGwtPbOWroUr4OBI
 Y+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697721003; x=1698325803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LSmy0AQ2ctzt4sBy/4+sAM4ntN11b2Cq/iHR2Msv118=;
 b=MhRjBUWcIvauVI8cYNSpetH4bxwOQ8C0ZKEsu6xrvnqzA50cKCR0ANpnupGeqPfLXu
 ig9+XueZ8OwYUA7aWwThE7i42mq+qSSWnKQ1gkRnmXUTXu1p11gjFGchSQP+JKA2VtkC
 zQBgJpdtezVGO05LhAcbYir+mdngrwMuj0U1oajZ6ajP3QPZAjJWGR90hwi6xAhFpwfK
 o9J60ZRFeXEFTiQxB4ke0mQcd38fFFGvTw0SeYyYxvMbSrwTX07PrmWQnXV/ldvtpCwe
 32FZa15+EjCZ7SMutPYU0v109xXEtARA66vTW7FJ8Mc92zUC9yGFsP/DxbrX13zx2xYo
 oaeA==
X-Gm-Message-State: AOJu0YzASH5YBUbcos01WpIcFFrLHcYRA8/+PFxpAF5Kn0SEZowzYfk8
 Hm6by3pWaNGENqn3xoTTuzIYnNDgTgEzGo8CngMxTw==
X-Received: by 2002:a05:6512:701:b0:503:655:12e7 with SMTP id
 b1-20020a056512070100b00503065512e7mr1356840lfs.62.1697721002787; 
 Thu, 19 Oct 2023 06:10:02 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 bt14-20020a056000080e00b0032da4f70756sm4518629wrb.5.2023.10.19.06.10.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 06:10:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 6/9] hw/intc/pxa2xx: Convert to Resettable interface
Date: Thu, 19 Oct 2023 15:09:21 +0200
Message-ID: <20231019130925.18744-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019130925.18744-1-philmd@linaro.org>
References: <20231019130925.18744-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SxVZu9PfS/Zj

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

