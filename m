Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp894054ejk;
        Tue, 30 Jan 2024 07:26:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxow7xh3NLiYEc0w3g7eGOJz8WE2aGYo9lgtcIq/bsu7Yjjyr6CQMq1vCoIKj1taGrd+Rn
X-Received: by 2002:a05:620a:997:b0:784:799:2afc with SMTP id x23-20020a05620a099700b0078407992afcmr2458303qkx.67.1706628374842;
        Tue, 30 Jan 2024 07:26:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706628374; cv=none;
        d=google.com; s=arc-20160816;
        b=uAd+vPm3bBsthoizSy/ERqlCsouIdaNfXXArup2CsfH85UXgRchJ4Ru4itgKpq8n6X
         38bT9dREvDgHTDr95WsQ67+KeFB2HQgqGwBGLCGt74yQTMZOfdQhrPyEGaz0GQnBlyC9
         b6TxX9GxzXJxUbIUUPTXQdMbPnACSMI8KBAWyyI8KMHkYcSsBphW3U9vsIJbrRJDrZU7
         HFb6yrMWwEL24NzYKHcV+68AqctBRguXMif5bkYUmY9p052B8bvMk+dZPUeP/BGjKtQo
         g++lAxSFAlM6j6Tub087S/6MtW1lcRt+fVUb6IySP+e4vjiXNvSLM/rAoQhGNVplW68q
         9rtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=5fUS+DS9RUe0KM5QBvaxTm+3CyQrNHjvnhg9wQ9/00Q=;
        fh=Fnpfhh064LC7d/vI+YwhDAvwEob6ca1fhC0SjLXwVx8=;
        b=vlzhPxqyKcSMF0p+JSHt0rmjU0SwNKAwDtYmSSMOV0VmxqbZaZUmEl/u4OZcnkMmJu
         6OlgvAho1stvBd/1lEAMkmOF4rPdQUbi5BZXHSuSZYGrBzOcEFtEQa7YKR/IYa05tBGA
         Yi4aIgqzahMAZLGi9nGQF9J1nvrKb9OI4qFUo3kGPbqY3mjTwF4bnZuJu9WQZomZHRQu
         jdT2sE5Qv4gyeh3CSXl1iW9Wi5Ie2XZRMYZXAX4bSnImNsyr4TWKqXLY31mxGfRBevHP
         pbWXEAJmdQOEuBjxnxj2CA5d3W1BKJsEXSeAvhIqpYxsZhkUVP+UmNm4KO8R4oyZ5xmb
         i5Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nXKSi5cW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l3-20020a37f503000000b007838dfe0156si10065351qkk.255.2024.01.30.07.26.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 07:26:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nXKSi5cW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUpzv-0001rt-2l; Tue, 30 Jan 2024 10:26:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rUpzq-0001rF-Mt
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 10:25:58 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rUpzl-00062b-I7
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 10:25:58 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33adec41b55so3790212f8f.0
 for <qemu-arm@nongnu.org>; Tue, 30 Jan 2024 07:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706628352; x=1707233152; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5fUS+DS9RUe0KM5QBvaxTm+3CyQrNHjvnhg9wQ9/00Q=;
 b=nXKSi5cW7++1knHgDFssO1V/RNnJ04Xrtbh2ZEITeGReCrznCdPqSZXuc9EC7YD5m8
 ByghZKxux4iRFPMqhOTHEck4OxETgUWRVL38MA/gGWi4wnOv7KwlTSJCau1C5pTsOxU5
 bPvDPgGq7C5iSTDVQoBtMc9t9imVBTMZqSq+1/RvVthFnBSVaqbbyf2tN1wFj+favndg
 cQieZehD4IDZGfI35xG3rSzdGmIqRb0BDO5FTv9ldccsjv4HcZ9pvT1G875SgTjf6ijB
 5qTfkYc2GvoCYuiMbe13B2ksT4Ji7cn5paxpO6JY0QK7kFWwl+a9FqGkpiTQ95bCw3Iy
 XMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706628352; x=1707233152;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5fUS+DS9RUe0KM5QBvaxTm+3CyQrNHjvnhg9wQ9/00Q=;
 b=HefJ1SC3Wfd9ZX2DqvXq5a9szEKJ86cHjaJJcASry8RP0K31DIguYygDwNyGDP0ab6
 w5aZqRrvMyJ6W3A08+9oh+h0adPontuEbaE2TQzVh2YOQZSOr0ZrByekt/SvhE7iESwu
 8zUb1fU8yXVdJLMDPntsx3sfaxatrj8iML12p+B+CE/htZma1JVChM2U/BRPQEDTaQEH
 AN3y1mwkBNbFQxvNJxjJ3B/+0rGdV+V7zykKpKX/10jewixLef/85+h8cLZ+xz6/z4/H
 lNGMP6DtCKZZP2FFBJZ7GCOhDYGTFzSlbxPbp65C09mLVF2poCYzPMKFtt8q4fGz9/gR
 Wepw==
X-Gm-Message-State: AOJu0Yzz0J+NBIfcHYM0h/IdiF4NFtj6PFXpk/WMB5ghPM/Eg+6ag5nY
 FP0pvmzp5iR7y4KvVkgvzA0s7rID2Nvvj+eFsyFKnC+qhsULrV5YeXZwXTq4rL4=
X-Received: by 2002:a05:6000:78d:b0:33a:f681:699e with SMTP id
 bu13-20020a056000078d00b0033af681699emr2348018wrb.21.1706628351679; 
 Tue, 30 Jan 2024 07:25:51 -0800 (PST)
Received: from m1x-phil.lan ([176.187.218.134])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a05600c444300b0040ebfbff33csm17508462wmn.36.2024.01.30.07.25.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 30 Jan 2024 07:25:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/arm/xilinx_zynq: Wire FIQ between CPU <> GIC
Date: Tue, 30 Jan 2024 16:25:48 +0100
Message-ID: <20240130152548.17855-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: KX3MQCUHKLPa

Similarly to commits dadbb58f59..5ae79fe825 for other ARM boards,
connect FIQ output of the GIC CPU interfaces to the CPU.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/xilinx_zynq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 66d0de139f..ffad058107 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -246,6 +246,8 @@ static void zynq_init(MachineState *machine)
     sysbus_mmio_map(busdev, 0, MPCORE_PERIPHBASE);
     sysbus_connect_irq(busdev, 0,
                        qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_IRQ));
+    sysbus_connect_irq(busdev, 1,
+                       qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_FIQ));
 
     for (n = 0; n < 64; n++) {
         pic[n] = qdev_get_gpio_in(dev, n);
-- 
2.41.0

