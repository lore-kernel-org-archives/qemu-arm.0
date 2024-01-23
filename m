Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp136093ejc;
        Mon, 22 Jan 2024 22:39:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkTpgFdIGnLZywSCsM2X27ubEji3DXVtaVuATTaedrWl/jQfG9LKHw5YE4s1G7T2oHH8D1
X-Received: by 2002:a05:620a:a8c:b0:783:9a16:2f62 with SMTP id v12-20020a05620a0a8c00b007839a162f62mr3674816qkg.5.1705991994533;
        Mon, 22 Jan 2024 22:39:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705991994; cv=none;
        d=google.com; s=arc-20160816;
        b=glR1ZXYwsR8b9GNgMARK91zJmbAg1W77ZS9VnBRhb+gu4XLvl1Rqk7ZZEnzD0oTH/5
         4RBVn3f+BFQqf/khLITCXfdvY62k57gg/y8EoxekM1kEvJwEPCWSBC+0Y2jk4xN+o1yg
         IKKlBiMpbg9by5viw9RawS/aFbzjn4DLKGTcTp2DaEj3c969zzlWVZbDClmTCuGvQl6T
         lBkYkrNCURG8fT8gJH0hqXluMyo1+Pl0kIi7yf06L3qMqj673Uj6F9PQkyzDYxWu2xAA
         0DFRq4xFo/15gDL4cUYVc0ijdw4cLOK6tBo077c/rJ3RoSrGu6aZPfqBnOx05yB4rVDS
         /I8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=39OP9EE9lF2EcfOzamU8x35qcADjGnzDFDx/nFOBMLk=;
        fh=HVoLZTw5hlqqes9L9DSbvdhxOE62q72aEHLq82QYnRw=;
        b=mXZ/4FHijfAh0iDC5NWAU+dn7QOKspiYClLkSs1Q3j9LdXlygN8wnroCOK1hKkwYFT
         WqiSc5EG9BmeOgH79WMznB8DqiF54jaTOOFbcx6pdp8d5d7euhuzYVF2smEskcvi+xnD
         m6q2QU2Z3nJdsbIM8queTKiIuHUCP3Vgfv8VFycdj/X7uqPCEBsCOrSMeLf4QN+F6J+H
         lvSIZRRLIlSCPMPeqtCfWp/IGJoqPzvbHodZtdlqMgPWWmGKSmqF4t8uWguW0VFZncBQ
         ODPJkXjJJeR0SAdLhWSp0o21U9+U+qI7nv4Hiq6dnKxeqSGLpT7evQNo7Z4xiqpShDRH
         ezcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EIOczz3L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17-20020a05620a0b5100b007813bec9005si7204568qkg.538.2024.01.22.22.39.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jan 2024 22:39:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EIOczz3L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSARg-0004At-VS; Tue, 23 Jan 2024 01:39:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSARc-00048m-R0
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 01:39:36 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSARb-0008A9-6D
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 01:39:36 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40eb95bd2c6so3904295e9.0
 for <qemu-arm@nongnu.org>; Mon, 22 Jan 2024 22:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705991972; x=1706596772; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=39OP9EE9lF2EcfOzamU8x35qcADjGnzDFDx/nFOBMLk=;
 b=EIOczz3LhfvJ4hYnFW7VCm3+2+m/ZkvDJJdq5uhzDH5cKjTVdiZSSt28TvVtrCjGWA
 gPKpsDmvmhyFXCvJas3L2uWvpmqUnlbzRApRm24MrgZ6wGn+wcBs1xTw6Q8N2/E/nuVc
 25/nb7zynPqDlR0GEl8/NOTA9U4MED/NNRuSofSFdF/iqa0XAri/ZqMjMTeh+8USrtRj
 CHQQ3NLQYIa947NNRqbXt4vIls0PmiBhB5aFsO/ps3sDhsvOVQ5Cxa7LTbd6ppkRFRxX
 2qlBRfpifx8gXBrybJd7oNjGvkoqZD3T2GcxJfR8VKV/ZW0AHmINV+3E8liU6EWg6Smz
 KthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705991972; x=1706596772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=39OP9EE9lF2EcfOzamU8x35qcADjGnzDFDx/nFOBMLk=;
 b=MUREJGFHlo2tyzEenxOpUJ/ViOvPLElVzD9/dtDV/zCrG9c4Ycr4nssM4nJIaGxGWe
 VofAAaR3v0VPeQtZxC7SxNwNbd3mZIOsBmOIZCsnY/YoLomHR6rBK/+OmhHIP12dZv9f
 QHUz60pqT5l8uEMGJN7mHlno0Ytsghyfq/qe9LHOXvzCvbaKmxfpVxoH6APzYjcg1M7u
 oACQNHg1wMCIrWvmNaG74gET3tj6JUCNJhSM0ODCD5h5impak/F4gt2NyakJUMM4DMBX
 OjWOuA89PTuQxi2r+MSfKJ9j6SxqIZeRU233GcvHOdQX5tzZgIkPjH964Igmx/8BKbgs
 svlA==
X-Gm-Message-State: AOJu0YwbZQf313JbbQYlBXAebxx+VIZvXjMFDlOgA9LgGP6lWzZTOCf3
 EdYYLfFe0jd3EVyqBJZexnZRGMlF64qTVMc37WdNk3uqKEtTn+UFD2OT/qFSxw8=
X-Received: by 2002:a05:600c:c19:b0:40d:889a:4eab with SMTP id
 fm25-20020a05600c0c1900b0040d889a4eabmr228878wmb.87.1705991972759; 
 Mon, 22 Jan 2024 22:39:32 -0800 (PST)
Received: from m1x-phil.lan ([176.187.194.78])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a17090654d500b00a2ad1182e36sm14134270ejp.9.2024.01.22.22.39.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 22 Jan 2024 22:39:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Gavin Shan <gshan@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 8/8] hw/arm/zynq: Check for CPU types in
 machine_run_board_init()
Date: Tue, 23 Jan 2024 07:38:42 +0100
Message-ID: <20240123063842.35255-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240123063842.35255-1-philmd@linaro.org>
References: <20240123063842.35255-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: KvRhUpcrhs/F

Restrict MachineClass::valid_cpu_types[] to the single
valid CPU type.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/xilinx_zynq.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 66d0de139f..6ec65d4780 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -355,6 +355,10 @@ static void zynq_init(MachineState *machine)
 
 static void zynq_machine_class_init(ObjectClass *oc, void *data)
 {
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-a9"),
+        NULL
+    };
     MachineClass *mc = MACHINE_CLASS(oc);
     mc->desc = "Xilinx Zynq Platform Baseboard for Cortex-A9";
     mc->init = zynq_init;
@@ -362,6 +366,7 @@ static void zynq_machine_class_init(ObjectClass *oc, void *data)
     mc->no_sdcard = 1;
     mc->ignore_memory_transaction_failures = true;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a9");
+    mc->valid_cpu_types = valid_cpu_types;
     mc->default_ram_id = "zynq.ext_ram";
 }
 
-- 
2.41.0

