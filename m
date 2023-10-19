Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp325868ejb;
        Thu, 19 Oct 2023 00:19:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3hgCnq3YAswaBx6OWf0HXd+0O5w4A4UVO1v+PZp/ueBVN/QPVG2+ttvU4cpugHU5iCBvP
X-Received: by 2002:a05:620a:2686:b0:775:dabd:a234 with SMTP id c6-20020a05620a268600b00775dabda234mr1309337qkp.22.1697699947108;
        Thu, 19 Oct 2023 00:19:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697699947; cv=none;
        d=google.com; s=arc-20160816;
        b=ZfzunJxkKblIAho2qAWtTcR6kxK3iTFIPJzh8GPrxpY6mipUzfHODquaPDc9XWX2Ef
         0a0ukCD4MKalKPTaD5iBcaBWYDV2cPs4/pUJWSp3IdMhxool/5aU/gpy0vfeN4iTHkU8
         hWjqbp7aK4OBu1qAFtHv2QNt5cyPzLsAq6DxIwX5jrpedguVG+ULU/i5rFW+GQ+5zVKs
         1b+E02pZ6IFi1oC2XAm4aY689+FHYNDjKkt+G5vJ7UyjJ3vLyVEmigg//4+OmYGOGihb
         ywHmx3G9X0o6ofdMSM0S5cg4GK3HARpSqcsSpLkoQ0OpA/00yolAzuaw8asCU/zxXmBJ
         Xtgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fHmBGLBbzcVN7N0Yqtsp1sIeIJxOxMcSEmxWkKW9TOQ=;
        fh=6jYKO1R8PvzdW4tN+W/XYlQifBf+lht0eG+bQc5OUAg=;
        b=PVg3dwguGql6kIUCQtV7x0KL+23SwGktl4b6gVYkx+GjxMZ/TXoVsrNaJxN8gL41aB
         Z7h9rdUIU7UdwSTcRPFLZPnjKwQ/Q0oux8OjO9MF9ODKgblgY2yGTl7163dmfkn1XIpf
         qIkVJIiopk6FWZkCyI9qtdQ32eEPdMIriNkpAB8tjTTftlMGzxC8QOANybEBGoy/5An4
         LmoAor/SdUbnxdl3Jb8Q+0cp1NTrEjPphfR3/QmMgjWAsJ36WXB40jxLx54KUIyU9KJk
         CmQp6Lhsv5+9SM1qfqfsac16e47WKBPlkq5LRC9w+1fjH+SGDHitBklVZ+1xQGSiywHb
         3Qyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MD9Ap+wC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i4-20020a05620a0a0400b007759f9416easi1067831qka.635.2023.10.19.00.19.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 00:19:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MD9Ap+wC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtNII-0006ZN-8t; Thu, 19 Oct 2023 03:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtNHh-0005vH-Ro
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 03:17:37 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtNHg-0003J2-8i
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 03:17:33 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-32d9effe314so4726030f8f.3
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 00:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697699850; x=1698304650; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fHmBGLBbzcVN7N0Yqtsp1sIeIJxOxMcSEmxWkKW9TOQ=;
 b=MD9Ap+wCuXyISoKoAZvrgqqrD5fv6eebi5aVPiOYU/wGM2yvcJ+Z8+9Qqi6iEWtx5H
 WomqtbfuDOQJvogQoA6wCc/DXIjdNr/NKrpOJ6HSfidwWVIcqa0SLjWzO0xiK5iGAUFh
 /VAV0ioefxIMy8UZ5+clEKUbqEBp1kOlsrWgXlmOujRsxJiR9cZ3XnA4oTCKKAiM+tdJ
 +3qu7/+VdGVIFtKeHO/XSOGjDsQMF8l4PUM//LB+4sPLMr8Quu8OFxKpbRvvYh3Q9eQO
 V1zVeosjJfFu/hHep0st1QsRCt+er+WdqLrAbweigKAmTePrvDcmnqPEG4p1KD+1ObOg
 jdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697699850; x=1698304650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fHmBGLBbzcVN7N0Yqtsp1sIeIJxOxMcSEmxWkKW9TOQ=;
 b=V+uiNwaLUv6LjZm35BLLCxYhVBKP2gep5kynWr1fk+UaYm2fHYydcxLgqXiNIqFqEI
 FsppcdYIXuBPvh9QnCcrGwXvNB3CppItuGwpcJIEW8C5wpy+IDDh64MoZF2L+IsEyfAs
 sPicudrbRVSaLOsHHr0O7tn12jRaU/uOCG3jdGVnQsO7K1youu1YDeYNeu/yE9zBgvyk
 ScimTH7jy8dw6nYCm7S3fI58DDdsOVHJm4K+zhOAI7tNdfkpR83QLFgv8vmm7ubmb7MJ
 Pko/MCuabsNCTCcuExFyypsu9czSqW49yUsx2U0MV/yJJrdMZTx3ICBXdzPkiHEnapz8
 ibnA==
X-Gm-Message-State: AOJu0YyjSks8RcalHsrE68m6Vj2v3DhzNXJo1dPR+gZ90Dj7sNHAVJJg
 74FSUlKN1FAC2Yc8X1cC0NmYXg==
X-Received: by 2002:adf:fe8f:0:b0:32d:ba78:d60e with SMTP id
 l15-20020adffe8f000000b0032dba78d60emr849091wrr.65.1697699849994; 
 Thu, 19 Oct 2023 00:17:29 -0700 (PDT)
Received: from localhost.localdomain (92.red-88-28-12.dynamicip.rima-tde.net.
 [88.28.12.92]) by smtp.gmail.com with ESMTPSA id
 f5-20020a5d50c5000000b003140f47224csm3796543wrt.15.2023.10.19.00.17.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 00:17:29 -0700 (PDT)
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
Subject: [PATCH v2 07/12] hw/arm/virt: Realize ARM_GICV2M sysbus device before
 accessing it
Date: Thu, 19 Oct 2023 09:16:05 +0200
Message-ID: <20231019071611.98885-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019071611.98885-1-philmd@linaro.org>
References: <20231019071611.98885-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: dMY5ayBfHcH5

sysbus_mmio_map() should not be called on unrealized device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 02c7a7ff3c..5b08a98f07 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -690,10 +690,10 @@ static void create_v2m(VirtMachineState *vms)
     DeviceState *dev;
 
     dev = qdev_new("arm-gicv2m");
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_GIC_V2M].base);
     qdev_prop_set_uint32(dev, "base-spi", irq);
     qdev_prop_set_uint32(dev, "num-spi", NUM_GICV2M_SPIS);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_GIC_V2M].base);
 
     for (i = 0; i < NUM_GICV2M_SPIS; i++) {
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), i,
-- 
2.41.0

