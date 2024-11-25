Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1313028njc;
        Mon, 25 Nov 2024 06:08:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXvYzHyIm/jSIgzrI7fO2LdIDx07c6BTav10NRtYzWLVUpkbqw3X4bjXgBkv07AaJ3AQEW9G1PYEt1Iog==@linaro.org
X-Google-Smtp-Source: AGHT+IG0OfEuEOCnQNs13rCOItO9hSYCWoW9hioIHMmSRyI1FbzEezwdukJKAWOB2AbRtOeAOIdO
X-Received: by 2002:a05:6000:2cd:b0:382:4b9a:f510 with SMTP id ffacd0b85a97d-38260b455damr11649757f8f.11.1732543728079;
        Mon, 25 Nov 2024 06:08:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732543728; cv=none;
        d=google.com; s=arc-20240605;
        b=luxu9LJSSjEprMbsfOCdVjyrDBXXHAnNuODmaqfjEt6f5KaSKWu4NLe3+up+avXh+X
         RsyjxZysce5qwZeSIx8D5O0Q843PfNL69ZJu9HTtvYE+1bCnqyfapJ7Ug2QeTXoJC9lW
         myohfjE1Q+Ow6sbtd5SQ1I0s+ERqm7lS0/kHo42tXjPe6++nLls3TjIq7xxmt5kK2CdD
         zBVnSlo/QeQkpIZHLFqezqA60zGUALycVDIx4ffLhYvKeWD9JAYCpAbQWOMtEPcFJjXO
         1UPx+ehY12nm57oBDoSWtBqAPpAmD+AHIhC/94MplF+nApSVF+5Cg7aQ6AWNsIog3UfT
         1bMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CidC1DzNGex4xdl38okZ6dg7MoluQ+zRZMKK1keD2+U=;
        fh=p+W0xonOzOtKwUO33tFD4jo0PAAo3fefTk1q4VzUolk=;
        b=EZyQZGo2ZLREli5LtuZug1wJfHKX0NsbLjXwI0fvHcb1qI8VzhkJy9PR1aTqPHwLst
         85sXYC4cztz3JkE4+daPI3Y/qeWWvmuSgnIf0r8EkxHKU+CeqHKXRxE8aSu+hpbtDmEU
         YThuqnUKtrVUCtKI/MS9m5xfOfCXLkHjAbeeKFy0tZhcQhyUn7r9Eqq9bzce3cUBea7P
         jFWpiGfUDYEu9u8YTZzr/+770VT8XDjaobP9lwOmhRSP7+CQH8WUjxDDgMTvvSzcAw6P
         ZKJc3eJRnjyxuzRjzQyeeCCWSSNuTzrbDMWHEKLGFzGxKmqVKkrYmR3T3L0VAN7Y6HZQ
         TBpw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LSk6hKme;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-385be98a17esi257529f8f.293.2024.11.25.06.08.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Nov 2024 06:08:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LSk6hKme;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tFZkL-0003L9-W0; Mon, 25 Nov 2024 09:07:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFZkE-0002uH-23
 for qemu-arm@nongnu.org; Mon, 25 Nov 2024 09:07:18 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFZkB-0006kg-8m
 for qemu-arm@nongnu.org; Mon, 25 Nov 2024 09:07:17 -0500
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-53de556ecdaso820181e87.1
 for <qemu-arm@nongnu.org>; Mon, 25 Nov 2024 06:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732543631; x=1733148431; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CidC1DzNGex4xdl38okZ6dg7MoluQ+zRZMKK1keD2+U=;
 b=LSk6hKmeFAbz8lC7fHUMSEV0llmA1Cp8ZY4J6nZmBlLMWvk3xCgCWJPEHyJqf8U9+3
 l5mU0SMCmTjZPfTTrP7jkkmLGQcxLgv4VJl60KNldTy1Nwfov4U3fkEtZ0P5y+VDPVMT
 WcS+z4Wmb//yCtynd0PqqFNPAMmSc0QS3xRJCClxeACqgIBoOEySOXnzaFaq6Uz1MyOT
 IC9Id3mw8rJyy67zgqQOcfVvxb+e/dQP83k8z+UJ3s2GG9BKkWW4nUIWIbQpEVN5Gcwx
 YPhKmHR8U3S0VBRPNDtvt69pfwHL8+UO68dzSz245AXpqJPVI63Th+IywmkMO+ld/6t+
 6JhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732543631; x=1733148431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CidC1DzNGex4xdl38okZ6dg7MoluQ+zRZMKK1keD2+U=;
 b=EoQhSHL1D0KLyXhNw9CRIdmsXBtwqACYLHmHy7BhhOuWhLWT94KhjnBmNo9WfWksyn
 2AO8FTor7kTsO+T73BMbiWSFro2ieLpnWiQLe6l1UAnMVJk367Wsl7lZFqHCyWHl/jxg
 OmpLNH0DNePkLFwXz/F4Me6Uf5LV8VXHIuXcRTvjdb8/OO5Runms7wUYorseG+zl+Vdv
 7R35cX/G8O1sYt5ZfAYhWZ/l4Pg2REKTgp3cBdwoWjsmxI1RHlhIQN1HRIVK/qpo2Muk
 H3pLB4IQ36KikrMVpZ43ymIewPK0lVbRrgitFNQYlqFT8zgKsE5dKWD2S1hlFupGrc5L
 ujsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV88bFpJAxo7bus/SgrHb6RS61ldYbHF/W+l3nCpCe735v1uUi0dKZuDd/PHPhC4B8VTtG/K6vM0A==@nongnu.org
X-Gm-Message-State: AOJu0YwiM8t4dwskAmtGPuVaJh8cXkz8o8F75cPOmtaSV+PEAIoW1dhT
 vtBnkSIqUCs0ruQVD+jRGKnBI945DA8jGY83hIrs8y/ek93vZ8PkIqSVaogajzs=
X-Gm-Gg: ASbGncuZRE/zbHO/n1md1jvcLNm/ft7oI3YyCgBDLm2Rd7NuuKH1f/CUMDra8MmOLiN
 QXSrjtDUHXlM9ElcZpbuitWPuesnbw2DaCTHnFXjUuOFUqkbH19ZLGhGaZOK9kRZljLm16yeONU
 wDDWmZIHUjdUq/1KhldQ6eq3s5hbADJklHqctDHxvgSz09/Ei+TD09D0d46WR9UMrt5p//BWdb3
 7IZ2j7xOD3kmMFbO8dqt28bWaPtn+HDn7Fh+z0YzWEGgbwtaoh0jlz/xTffpiTvfLi6dJbn
X-Received: by 2002:a05:6512:b12:b0:53d:cfdb:c65c with SMTP id
 2adb3069b0e04-53dd39b62d8mr5978210e87.52.1732543631212; 
 Mon, 25 Nov 2024 06:07:11 -0800 (PST)
Received: from localhost.localdomain ([176.176.170.239])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4349ca82957sm63707025e9.33.2024.11.25.06.07.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Nov 2024 06:07:10 -0800 (PST)
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
Subject: [PATCH-for-10.0 6/8] hw/riscv/virt: Remove pointless GPEX_HOST() cast
Date: Mon, 25 Nov 2024 15:05:33 +0100
Message-ID: <20241125140535.4526-7-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241125140535.4526-1-philmd@linaro.org>
References: <20241125140535.4526-1-philmd@linaro.org>
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
X-TUID: gcy1t9lHJ0Yo

No need to QOM-cast twice, since the intermediate value
is not used.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/riscv/virt.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 45a8c4f819..2feb851f15 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1140,23 +1140,21 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
     dev = qdev_new(TYPE_GPEX_HOST);
 
     /* Set GPEX object properties for the virt machine */
-    object_property_set_uint(OBJECT(GPEX_HOST(dev)), PCI_HOST_ECAM_BASE,
+    object_property_set_uint(OBJECT(dev), PCI_HOST_ECAM_BASE,
                             ecam_base, NULL);
-    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_ECAM_SIZE,
+    object_property_set_int(OBJECT(dev), PCI_HOST_ECAM_SIZE,
                             ecam_size, NULL);
-    object_property_set_uint(OBJECT(GPEX_HOST(dev)),
-                             PCI_HOST_BELOW_4G_MMIO_BASE,
+    object_property_set_uint(OBJECT(dev), PCI_HOST_BELOW_4G_MMIO_BASE,
                              mmio_base, NULL);
-    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_BELOW_4G_MMIO_SIZE,
+    object_property_set_int(OBJECT(dev), PCI_HOST_BELOW_4G_MMIO_SIZE,
                             mmio_size, NULL);
-    object_property_set_uint(OBJECT(GPEX_HOST(dev)),
-                             PCI_HOST_ABOVE_4G_MMIO_BASE,
+    object_property_set_uint(OBJECT(dev), PCI_HOST_ABOVE_4G_MMIO_BASE,
                              high_mmio_base, NULL);
-    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_ABOVE_4G_MMIO_SIZE,
+    object_property_set_int(OBJECT(dev), PCI_HOST_ABOVE_4G_MMIO_SIZE,
                             high_mmio_size, NULL);
-    object_property_set_uint(OBJECT(GPEX_HOST(dev)), PCI_HOST_PIO_BASE,
+    object_property_set_uint(OBJECT(dev), PCI_HOST_PIO_BASE,
                             pio_base, NULL);
-    object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_PIO_SIZE,
+    object_property_set_int(OBJECT(dev), PCI_HOST_PIO_SIZE,
                             pio_size, NULL);
 
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
@@ -1189,7 +1187,7 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
         gpex_set_irq_num(GPEX_HOST(dev), i, PCIE_IRQ + i);
     }
 
-    GPEX_HOST(dev)->gpex_cfg.bus = PCI_HOST_BRIDGE(GPEX_HOST(dev))->bus;
+    GPEX_HOST(dev)->gpex_cfg.bus = PCI_HOST_BRIDGE(dev)->bus;
     return dev;
 }
 
-- 
2.45.2

