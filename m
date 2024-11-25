Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1312185njc;
        Mon, 25 Nov 2024 06:07:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUrgENAPfC94SNltLMgoUHlHgnoR8KWcNTOVVIgAM6uZ35PfE8aWGl3FPB2hhaGw0AJCi3CwQRMHQ82FA==@linaro.org
X-Google-Smtp-Source: AGHT+IFTNKXyfZmHHGI6veSJBtvkiJi0FS/T2vjQQ5hdc9qZ/rHMwmo9fny+34V2lhuGEPZihiUv
X-Received: by 2002:a05:6512:32c1:b0:53d:dba8:a85f with SMTP id 2adb3069b0e04-53ddba8a990mr3662066e87.38.1732543677346;
        Mon, 25 Nov 2024 06:07:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732543677; cv=none;
        d=google.com; s=arc-20240605;
        b=J0dHMJeRpV1R/e1cHed6LxzRDPZEoj2Dk1/F+0BP7Ik1A1kRdEhrMqV13zankQsLsu
         Ec7GTST2D6qzJGYWeG+Dc2sR1JVRY8wW+67xC7yZ9rRgGmL7emLMRr+qQWXAS1PhnTeE
         tSn3ErqHihVrT5N3Z0yCmK5om+HgEtRulWrCX0omCrg0AT6nJ7oEM6+a9yKzzooCtpAk
         TTvs4BTJaq9QOQXssKpwlmH4T0kE0AmbXVZmll/4SbVDmoloWedms7rMWswZ1tFYat/c
         W5Uaya8Brsfo/LR+rrjlC783MPUbHqHTKYIoiX27mi4drp9N8NQLa/bhSfqyBSdQMdYV
         Tpzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KEkIR2vBaISG4rMjnIPuSSQYyM7zelGC+1W4S9oVQCo=;
        fh=UOebteuqpiRUmK5CuNbEj9jXJkOJ+U9UkeACEfnUX7k=;
        b=IzYMX9dNudRyyT6RFLqg0izjEilj2Ea0gyAM/9Jz2sFLJVndqUNGAaXGL9jepIdYxB
         b5cR0k37Oe1el3EFOQipY2VmiNmVuvkKSaldzXXVUO/xMa8Q3wes9igXUR3Dxp56LRr0
         cu0wRMZWeVLFC6A84BYniDGRksGC/PuxsM6Wx+N5siRVJiAkVoyiDuocp338H2wEjvUM
         deIqBD+NTgs/G6U/hzkObxadJO5DPZHvm+tSK8kvDOdmMmtdI00xBWvw5N4O6cT9sq9Q
         fJEa8LBIM7oWXzsl7poAcDKxuFJoyh+v1xPbYcfRA+b2VnyIm9QB4L6vNdfos+5R4X/a
         BRSg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rrKyp7u7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-385be992885si255553f8f.750.2024.11.25.06.07.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Nov 2024 06:07:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rrKyp7u7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tFZkJ-000376-9P; Mon, 25 Nov 2024 09:07:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFZk5-0002jA-75
 for qemu-arm@nongnu.org; Mon, 25 Nov 2024 09:07:10 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFZk2-0006if-Ab
 for qemu-arm@nongnu.org; Mon, 25 Nov 2024 09:07:08 -0500
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-539eb97f26aso4945671e87.2
 for <qemu-arm@nongnu.org>; Mon, 25 Nov 2024 06:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732543624; x=1733148424; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KEkIR2vBaISG4rMjnIPuSSQYyM7zelGC+1W4S9oVQCo=;
 b=rrKyp7u7YICai8X3vlghwFPBOkED+jmkXZAbNNLDG3uavXYgfoko0ILw0r2RCu28c3
 L/bXqoB4HphOJB00tQqolx/jNuosXUrnCLf9Qcdi++0SEaXx3w34WXGGvaZEAb6Jd0/I
 VdblJew4XS5P95wg4NOq8SxrvRQIhuqnavxlPln5y8BGICW4SRX9DhACqAMxugvd4KMQ
 pirRxCiU8HvXhIcw5Hwjqsaj38YlWPado7HVRw7LGLK2WmOd3eloXUcRi2fw0nbuIUHt
 EuDkbZXZznenVF6kNzu89dB2ObKBiZMvFIwwLqbegjdZWpxp8Tt7ayRqPRoOCiZcFVgJ
 Hj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732543624; x=1733148424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KEkIR2vBaISG4rMjnIPuSSQYyM7zelGC+1W4S9oVQCo=;
 b=eVxStl7y/P0J87++l23JBpaDmV+Fg20zbyLSQ0P9oFTeG4jubweo3YLiaG3o0ECESl
 wB+ue7qdX2oZRVxMLmnjlbSf1cXbkMkH+XNbK9xvU3IYgB1uG+y4wc/dlIfJxwzoiUUE
 QDeTlAhJlkn9DgOpjKVfgPwgTU3dNX56f8o7J99WxIzfaKY/1s6c/mSoWbN7M2joqCH1
 0+fY5rCiPbt5y53P7/ZPyT1h3Lp/eTY1wscL2PWDbNMfz1yLhkhra7Ko7/2H93RiPNdE
 lS4KykqMJ8QUN2K+AJOkSf8OXAzSZ4JiTCJtFfpUjKaniSQyhMAKR6zUGRq5GzDaG8Y9
 rwzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRAIGRbH+q+8ajlWbgdiSvQmcudOLIov1S3N0xya5eq+tDimf/zZjq4pO2CRoAiRYes9qKJJiLkw==@nongnu.org
X-Gm-Message-State: AOJu0Yw2gWFa7EAf/Lq4Z/LPYBEedlRvi6Lu8YqGTI1HDQwb7xL4Cs76
 jXaFkmaRrZ/7XwnIVgYn28pkWeTO4f6GNtd6Nir6nWWJhqwwvHJd1kR4bvekVLE=
X-Gm-Gg: ASbGncuI7cwqhrOctyqIPysqlXAzJIphTnTYyF3jAM3VrNg1li0nOELFtMm7Kmngjr+
 wP+ZEI1aDhTHeohYB8Tg9nH+fzsbmnVsC1RKOBiys44CopunEUcuiwWRTRLkaqMunxAkMjrlZDu
 EixaTQ0SEDmW36l2p72YiGZ8TKZXHP7x9hM/hKIOma1vGyFhqDjsWkL1OODOSh+lCfVUox2S7d/
 MRNyPf4Q4hAmBizpVAt08V5yVcAL45E8MsRIO//enYDy0qpxz5kAdcyhxo9Ni7sJeoZy2SX
X-Received: by 2002:a05:6512:3b0a:b0:53d:de48:7409 with SMTP id
 2adb3069b0e04-53dde48744cmr2788380e87.0.1732543624453; 
 Mon, 25 Nov 2024 06:07:04 -0800 (PST)
Received: from localhost.localdomain ([176.176.170.239])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4348e272094sm84910365e9.7.2024.11.25.06.07.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Nov 2024 06:07:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Thomas Huth <thuth@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org
Subject: [PATCH-for-10.0 5/8] hw/arm/sbsa-ref: Set PCI_BUS_IO_ADDR0_ALLOWED
 flag on GPEX host bridge
Date: Mon, 25 Nov 2024 15:05:32 +0100
Message-ID: <20241125140535.4526-6-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241125140535.4526-1-philmd@linaro.org>
References: <20241125140535.4526-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x132.google.com
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
X-TUID: uphq/TI9TMDT

All SBSA-Ref machines set this flag in MachineClass.
Directly set it to the GPEX bridge.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/sbsa-ref.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index e3195d5449..988a0a236e 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -647,6 +647,8 @@ static void create_pcie(SBSAMachineState *sms)
     int i;
 
     dev = qdev_new(TYPE_GPEX_HOST);
+    object_property_set_bool(OBJECT(dev), "allow-io-addr0-accesses",
+                             true, &error_fatal);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     /* Map ECAM space */
@@ -896,7 +898,6 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("neoverse-n2");
     mc->valid_cpu_types = valid_cpu_types;
     mc->max_cpus = 512;
-    mc->pci_allow_0_address = true;
     mc->minimum_page_bits = 12;
     mc->block_default_type = IF_IDE;
     mc->no_cdrom = 1;
-- 
2.45.2

