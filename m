Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp325772ejb;
        Thu, 19 Oct 2023 00:18:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjEbzIX7WY0AAYXrD4Erj4ZsJ780pDJx8Za8O7qzdS2YU0TkARHlK3ybvSMPtdVnpbU42c
X-Received: by 2002:ac8:7f46:0:b0:419:51db:5c with SMTP id g6-20020ac87f46000000b0041951db005cmr1613046qtk.32.1697699933327;
        Thu, 19 Oct 2023 00:18:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697699933; cv=none;
        d=google.com; s=arc-20160816;
        b=jG0yAJxrBzePxYcqVnOmbOH+5qRZl9pYCuSFzj+a8wZDVnmI3ntvnzjkTVo/HRXUqj
         ekJAQWV9u7GlElRk9bYC8NL1Q6l/fCyj9cPCDcrdUi+WNnu2j2AZnSq3XC4qfgOXjQ0y
         3WQr30IAvx0fdKVbISbfsOIspHEpX+/IkBynXQChsRQl3x7jC6FvU/B0GAK0d4MsRSQm
         zNxunDM+80rrMEG+OuS8B3k7X0dBNu0wiDQGiD/vLGufZmXU5/f7whWnwumJ0wDPScii
         A0Uhwh0wpOvbe2W4Z02NkS351TTJGEu9P1dVClUhZOyQ7mY48otb/XPLakw7PxT1qMpS
         SeNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+HC0X9fTzvHDBaGKX3SssvMlymhei2jKRNiniE4txSs=;
        fh=6jYKO1R8PvzdW4tN+W/XYlQifBf+lht0eG+bQc5OUAg=;
        b=WRVS71bR8hbsSVjh6Xm0ePk3KvKXZNJpp/naDydOKMI44mVoTbmN7kQ/7idY2DZrcT
         QY0aurXrJ8dYPFsMKry31W1ggnqp8iYG1rTxRgo5W0cdf4To/DSZeaqzIwZmTxgex6TK
         2mdIjxsjwFpLC9QmqJuvWJYVbnLbl07cZw1x9cb+w9YqYq4S5WoCAi7fcg6d8cXAFt7j
         FA93H0H9b0WKp2pdmJi6kXqrFJkc4ef6Qrnm7wxC8f9KY9KzMjjZxeQzVo51RAQdEwBN
         sd0wpGfW+yl9FSBHtvILeHMyWE151lryU4kH41Qr8uoCt3UoeqkeaTRwvMf41Cb8NEbP
         x9jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LmmhiZIP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e7-20020ac85987000000b00417a09a99b2si1168782qte.724.2023.10.19.00.18.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 00:18:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LmmhiZIP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtNId-0006lU-NR; Thu, 19 Oct 2023 03:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtNHr-0005y8-Pw
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 03:17:46 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtNHp-0003KB-1e
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 03:17:43 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-32d834ec222so6642487f8f.0
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 00:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697699859; x=1698304659; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+HC0X9fTzvHDBaGKX3SssvMlymhei2jKRNiniE4txSs=;
 b=LmmhiZIP3SB4h9gPr9iOZ3/9T5jtEatvnLI7nUOux5gKefeXUfCo99zFl2mvHToNpe
 yc77PjqinmEvFBa6dJKVXGAwuVMfp1++KhGwJX1m/Repkz7ZElgVLPw1O4MKwYiuHzLH
 KGjhb+SsKhJE0lfl0orp5ZqBhQEWmSOSJn1RDItjg6S1eSuU1FNr1GCGEyvL9HIxLw5Z
 QU4o+oEg6+2mNEmtyUoNV1bDWqVdV6J7HGcNVvuTB/zOZbVP5a1exv05x13vgGHZ/fnH
 kcWERlnTxkVwY/WFcmLRiWl7jcuOdMqkeTLBbQt9fp2UAH+Nk2PPZFDRd/yuUU3eQqFr
 pBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697699859; x=1698304659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+HC0X9fTzvHDBaGKX3SssvMlymhei2jKRNiniE4txSs=;
 b=Zu76FMCeFn8cxVlpRx5SqgLkXhVrjdYx+RuBg6nOBJWHkxkiJFeW2dtgOfmxFT5lit
 fJ2iiyk/E1mkacVlUQlDsiYg9FpZ8FE5z9fRmtao22FEFu/RJPO2x/hyCLN4mhJGHmmC
 kYkgxIBjq4VuH2OmkHEWJM4Jr5f9VmRdPQZS+3DykP5zdmhQFi7CR3mJzN5NLwozNvv8
 SqEC0Yz4s1VDHXLSfLg4L61lAHIaMZfKhHESktazmRFl+0nNGdtcRXrg4juAN06s+lZB
 wFrzTQfcSQGGtS0GTXgtTAsos4Pjj1e3rsNFk6ukFVuU5UUFJqlYPb0INcosdBRkKAJy
 cSFw==
X-Gm-Message-State: AOJu0YwAfC5qVwXkwkqX0K4Q04GXb6UMbpY78nuw93EDioPck8Px/n/C
 CAV46sokH8DnrT4myAMnBLp6r/8Im7HgDyRWP8D3Tw==
X-Received: by 2002:adf:ed0e:0:b0:327:e073:d5fe with SMTP id
 a14-20020adfed0e000000b00327e073d5femr854081wro.38.1697699859542; 
 Thu, 19 Oct 2023 00:17:39 -0700 (PDT)
Received: from localhost.localdomain (92.red-88-28-12.dynamicip.rima-tde.net.
 [88.28.12.92]) by smtp.gmail.com with ESMTPSA id
 a15-20020a056000100f00b0032d9337e7d1sm3775457wrx.11.2023.10.19.00.17.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 00:17:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-s390x@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH v2 08/12] hw/isa: Realize ISA BUS sysbus device before
 accessing it
Date: Thu, 19 Oct 2023 09:16:06 +0200
Message-ID: <20231019071611.98885-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019071611.98885-1-philmd@linaro.org>
References: <20231019071611.98885-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: XnhwwZk2lt67

qbus_new() should not be called on unrealized device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/isa/isa-bus.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index a289eccfb1..f1e0f14007 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -52,18 +52,25 @@ static const TypeInfo isa_bus_info = {
 ISABus *isa_bus_new(DeviceState *dev, MemoryRegion* address_space,
                     MemoryRegion *address_space_io, Error **errp)
 {
+    DeviceState *bridge = NULL;
+
     if (isabus) {
         error_setg(errp, "Can't create a second ISA bus");
         return NULL;
     }
     if (!dev) {
-        dev = qdev_new("isabus-bridge");
-        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+        bridge = qdev_new("isabus-bridge");
+        dev = bridge;
     }
 
     isabus = ISA_BUS(qbus_new(TYPE_ISA_BUS, dev, NULL));
     isabus->address_space = address_space;
     isabus->address_space_io = address_space_io;
+
+    if (bridge) {
+        sysbus_realize_and_unref(SYS_BUS_DEVICE(bridge), &error_fatal);
+    }
+
     return isabus;
 }
 
-- 
2.41.0

