Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2959915ejy;
        Tue, 4 Jul 2023 07:52:48 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGIKswyAk8fRbBAcrAZsTHakT64/j9sl5qI3BtfwXj75MDB5x9zlN78T1wDFmHk2mXzyGe8
X-Received: by 2002:a05:620a:3915:b0:767:5ec0:baad with SMTP id qr21-20020a05620a391500b007675ec0baadmr9813482qkn.67.1688482368361;
        Tue, 04 Jul 2023 07:52:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688482368; cv=none;
        d=google.com; s=arc-20160816;
        b=H/gNvQNRzJ1jMiaGQ+r1ziZZdesrapejS9Jkj3qs4Aoi58cv+3B2WcPtR/HTZ9V4PC
         HwcNyLkep3v5WbEBIl6hfHC9sYZ8ZzdapjdXZXgQmieIgmEbSRxmLgX7wlnjPFc7eb4Z
         QlZ0FjK3GzbLYfXMglPU/K4YwT8MxMfI41ksBnCg5ry+83Ty3fgI+xSUvuiFTDctoUZZ
         0WAylo902sxhUac4a6xMUIQhTFkC7lZEaWHqmsnOizERZ/A8BEfF1Gn6AuMsGEb8J03K
         yhl7KDhHj3/lnAhedZ0fMVlUifQtubhxwgoaZTRIFgLzplrDhLsChaU5jj4QkEPtaEvK
         3CPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=V69v+7bs2xlDWB5vTHTpi2FU6s9o0pa03HFic+S4ft4=;
        fh=Lngrjms14biHE1uwg3hJItOsHUc/fKOP3kWz84zgU0I=;
        b=poOZN2xUpGzg5tGaRtSzMr+Ktw38ZKlTjJ8S1oW34MemASnTuiyeqsWfFaFlAgBKzj
         DMZV38DxTqZ/Sontd5g5AzEs2OcIQYWUORiS+jpMb1eSH0UNOY0mD3n59cOr1hezu2OJ
         kp/vUItatUV6TvKTXgSP2X2QnEEEPbHCjLsuLcZ7lgDSzCoCdTO2iW5TWw/hfTq/qsjV
         kY0JBa7Cp+4D0YYwpXvtGZ51R2XFuWL8unR6Fv6xscT9Y0D6EdRZ72Qf25+zte69hdrN
         5n+bDjg6JAzC5rYaDnT7D3zIaZFvuvgjLpaOCp9E3Zie4jWIK3aa/dfdAp3n4biboT90
         a5KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yQ0nI1Hb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o21-20020a05620a0d5500b007653eb0dc8dsi9324249qkl.623.2023.07.04.07.52.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jul 2023 07:52:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yQ0nI1Hb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qGhNn-0007mV-MZ; Tue, 04 Jul 2023 10:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGhNk-0007Xb-Vb
 for qemu-devel@nongnu.org; Tue, 04 Jul 2023 10:51:57 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGhNj-0003Kd-6s
 for qemu-devel@nongnu.org; Tue, 04 Jul 2023 10:51:56 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fb7b2e3dacso8904266e87.0
 for <qemu-devel@nongnu.org>; Tue, 04 Jul 2023 07:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688482313; x=1691074313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V69v+7bs2xlDWB5vTHTpi2FU6s9o0pa03HFic+S4ft4=;
 b=yQ0nI1HbSIFQNiHKNslqLWiZuuo8dFLPr61DolNdmn5o5vlksstR8DbVnv2mK3ibm6
 oh51ZD96zt9LqdQkp5HOPLHaKonDys9J/BOS0fKZC+3UvIdWg5Lwrp3C7ZM9guXG3Ht6
 yDOaJQH+LsTwtr62ACNHLa1ANuzEJFP9fqrV52nAdZT9IT7BotEOJhCrqt11Q1ezQaS5
 C7tjkdm5UEw7PY0P/HtYNqA0nU25oz+pRZW1PB+4YwaBjPhje+hfVcVu+7k+Wt7naW8P
 Nc8S94+ijNazqEfFf1E6ra853tp+IwdsykexQLJW5ykPgYKlvYWvg+c1+/foBkOWO0ZE
 5kgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688482313; x=1691074313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V69v+7bs2xlDWB5vTHTpi2FU6s9o0pa03HFic+S4ft4=;
 b=JlO/C3O4wdATlhkFilC84z5YnFtt1u1ohn736+/T72fE+yHkm4EKgk5zbzNXBCDE5y
 IluNxBMmiGP7f2ETQg4cVzS3huYn+15h72eLyx3SBcguPAkCjg7k+K6YZaKQhN95vq2Y
 kEsAQgbCEOU9BsPpDwrVS8aKl/uokFm1xNNr8wotMSQEbS9MKKjoxTvJsOkNm3R8YMdL
 MGhB24zhB+2cslGppsI/8ITE7sfpGc4xRk1NHUSMx8MDKJOPeMsam2z6WljhvdpdPCoe
 Dfx0pi8essHr9KMAEDadqzI8ffbIbm/m1EKIRiotmQJgXt6B5WUia2aU/im2kp2F5LtZ
 Cbvg==
X-Gm-Message-State: ABy/qLYVRM70FVd3oNsAqtpcCJHH9t2+aSdUBbwQkh3V/WveKgRNr8jV
 EyvHaC4PTmIjafaMSN9vYsZza9YU4tEl9Lph7EA=
X-Received: by 2002:a05:6512:3994:b0:4f9:58bd:9e5a with SMTP id
 j20-20020a056512399400b004f958bd9e5amr10214333lfu.27.1688482313271; 
 Tue, 04 Jul 2023 07:51:53 -0700 (PDT)
Received: from localhost.localdomain ([176.176.157.122])
 by smtp.gmail.com with ESMTPSA id
 t1-20020adfe101000000b0030fb828511csm28523957wrz.100.2023.07.04.07.51.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 04 Jul 2023 07:51:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sergey Kambalin <serg.oker@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 19/19] hw/timer/arm_timer: Map ARM_TIMER MMIO regions into
 SP804Timer
Date: Tue,  4 Jul 2023 16:50:12 +0200
Message-Id: <20230704145012.49870-20-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230704145012.49870-1-philmd@linaro.org>
References: <20230704145012.49870-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: O7CXmujSrieX

Instead of manually forwarding MMIO accesses to each ARM_TIMER,
let have the generic memory code dispatch that for us.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/arm_timer.c | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 7b455aff4d..f8d65732dc 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -262,15 +262,6 @@ static const uint8_t sp804_ids[] = {
 static uint64_t sp804_read(void *opaque, hwaddr offset,
                            unsigned size)
 {
-    SP804Timer *s = opaque;
-
-    if (offset < 0x20) {
-        return arm_timer_read(&s->timer[0], offset, size);
-    }
-    if (offset < 0x40) {
-        return arm_timer_read(&s->timer[1], offset - 0x20, size);
-    }
-
     /* TimerPeriphID */
     if (offset >= 0xfe0 && offset <= 0xffc) {
         return sp804_ids[(offset - 0xfe0) >> 2];
@@ -294,18 +285,6 @@ static uint64_t sp804_read(void *opaque, hwaddr offset,
 static void sp804_write(void *opaque, hwaddr offset,
                         uint64_t value, unsigned size)
 {
-    SP804Timer *s = opaque;
-
-    if (offset < 0x20) {
-        arm_timer_write(&s->timer[0], offset, value, size);
-        return;
-    }
-
-    if (offset < 0x40) {
-        arm_timer_write(&s->timer[1], offset - 0x20, value, size);
-        return;
-    }
-
     /* Technically we could be writing to the Test Registers, but not likely */
     qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %x\n",
                   __func__, (int)offset);
@@ -374,6 +353,8 @@ static void sp804_realize(DeviceState *dev, Error **errp)
             return;
         }
         sysbus_connect_irq(tmr, 0, qdev_get_gpio_in(DEVICE(&s->irq_orgate), i));
+        memory_region_add_subregion_overlap(&s->iomem, 0x20 * i,
+                                            sysbus_mmio_get_region(tmr, 0), 1);
     }
 }
 
-- 
2.38.1

