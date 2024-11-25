Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1311458njc;
        Mon, 25 Nov 2024 06:07:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVC83hWZDDsKY3SEuMSH2UZXh62uHjLvp7uaxgMbBGxdrRQmBg1Zc4Jw1omwSwoye083lng2U4aP5lCSA==@linaro.org
X-Google-Smtp-Source: AGHT+IGI+FJJwg32D2hoUmHMLtruNGkS51AkogTVI9GJEhwlW5rc03/IH5RWEGU17BRbqp6Rl+xd
X-Received: by 2002:a2e:be1f:0:b0:2fb:4b0d:9092 with SMTP id 38308e7fff4ca-2ffa70efb4fmr57631641fa.1.1732543631696;
        Mon, 25 Nov 2024 06:07:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732543631; cv=none;
        d=google.com; s=arc-20240605;
        b=VvI1Y4q06fteRGQhXY9B8CJr0YCODMvfTM10Ywmf339hPSPIU3hOJayuE2fjjdAM/2
         JOVidIUTSJ/CO+X42W3p2SRkwMWuKOuHymmdpGjLCIgjFt7fuZoq05xh9UULvQ+JZKT8
         u5a9kSBEthmujIFCTc6geXh/rWiwsE4O+PrKuTMfs+o7necAFN8jckxCPw5QBDwWkhDY
         LWM9B4L+g22JueS9y3UtVrlSGEAOpFDw9wGxdjwYKYPzvSATKdIYjgcHDRKAyBo4ZYzc
         I7YXE2ddQsrMpDIQnqZTZzJovOWU1XZDxWZlaf8xVf0JCW3O+LiY9sIntn0tfxJVzJnn
         PsJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cc3WE7woH120Qpt/FsE+B5ZgZ3+8Guj7ZUtw6nH9Jhk=;
        fh=a7nSgWSpcTpTrOT65xDrMTN0PwPsi6nYbvdQuXoxhtc=;
        b=IJletWky8YklxBVlw7Oj7bIfY5XRQvAac9h0mB8QHkThN0XQt2UVG3YfZt4ms0wYtS
         B2yIQxpqAQfs1fbPdBb914soJiZq2DCVbRt/TklhBJAlAgIBCQSo2JQe7CvnBEDqV8NR
         qkJifb+YraKxdMvqQTNTAAXkd3DuTvyUbcXrFrm836dxN64CEqrlKCgOcbcABtuAMW0H
         DoJNvxlLPmC4qO6P9I+c/yq9ZJGCInIEA4iom04ZTDy+ahjVZjCfLxVUiDzPz3uaPF+e
         9DEpaQL2eOnHjjm668OSjygqSbdnbT793k49Myla1oPVvnaQKjWqPuxcVtPNafssChzv
         RVCg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A3hutD5V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-4349e935998si17167825e9.2.2024.11.25.06.07.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Nov 2024 06:07:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A3hutD5V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tFZjW-0002Br-MD; Mon, 25 Nov 2024 09:06:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFZjU-00027c-SB
 for qemu-arm@nongnu.org; Mon, 25 Nov 2024 09:06:32 -0500
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFZjS-0006ZC-4R
 for qemu-arm@nongnu.org; Mon, 25 Nov 2024 09:06:32 -0500
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-53ddb99e9dcso1970476e87.3
 for <qemu-arm@nongnu.org>; Mon, 25 Nov 2024 06:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732543586; x=1733148386; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cc3WE7woH120Qpt/FsE+B5ZgZ3+8Guj7ZUtw6nH9Jhk=;
 b=A3hutD5V+CngEP3bawOcxYK/dWVwJqblTv+wuMLIPzoNkw+AzaInidV/x+IYN2EP4Q
 e/3dVTGYYXjRp4XpURmdUVNXJDy58JVTZASvQenttXlcPEl+kokCfJ5TyehHAg9IzA47
 asnJFNxu+sM0OVNEEeXZPlrvC11pD5zoHYUk8GUmBIawyBeuh6wfYyznLEBpSJcr9HW7
 a6KOPZ4QHjcTyWoKjlWIrTD1/TWf/8K4bvTpY71oBIxPbG1g78Y29zLIAbic4tQ5DK3Q
 bq3H/noLXoFPpixVDt4aNDGgOg2jy+p7RhIASZiIbz/vA8lwBAdrkf2mBFL/It908url
 W38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732543586; x=1733148386;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cc3WE7woH120Qpt/FsE+B5ZgZ3+8Guj7ZUtw6nH9Jhk=;
 b=uzfn0chIqU3SyVZj1wqeHIJ05oVygPRJovpoWLUm42JBMEQh9VNmc0bx/SfI4C/mjI
 h0LBQOo1/PvuYXfZ4U8t3C4PFlmRX7mKcAfQEsmWUlONST5+WoMh+aOU+/YJz3A0sWts
 TiZEPltAaP5m7qy4UgRXm4e/pwVeIbZAAo8xD30hfi7GHwr1LV6YW/ugK06cZ9BhGRMA
 65i/1O40HBHVrppbUgnPORE8ZvxzzFbc1Qp3VF906VC23CGH5aCKYOg8JevAwYOYqIja
 Utf5A8x4msw1SigOq7OZK3671wTzdt64yEDbK4ylxUwhC1mw0AzzCB+SDyfjw/+zx5t/
 uuCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXRZUS2nqTQaWbmpo6cki4LiTKVs3/fg5wMY2A7aXcCdSw6GI+Mcw5mJ4YR7ZK12gQRj66djwN3A==@nongnu.org
X-Gm-Message-State: AOJu0Yxtnk/ZPzEc1DlqSNTbDHqcZql3lALrRN9YxeGw8fsCpKPgISp/
 SIVQIftOVCz0lICS4xP3ZCSbz9r2s4WORVM84Ad5NyLLYaYceptSw3/vDPMULb0=
X-Gm-Gg: ASbGncs4IVDuCwKlinFmZ5sYMR3cGEhhB7nygIO5yJLHsR/7GkHQZPhS1NnhXjGKWlH
 ZEt81d1WuV2CJc1V00FMUDtRpAs60jG4GgNPs+lP7Izw033jE4yAnj3INOYkJCMN/RlPbZsGvma
 XQbGXhCLwTVjRLxepdC2bcMu0QmfjYt76D2wXp5eiIs2j86bB8PfvzKZxZVreSCJDDImhavG4YX
 Qj9v9fphssU7PXxxzcdI3Ehnz1mB0SzKRsuonSZtssgrzEB7pJjmBfJMs38l0ERTeIsf+fT
X-Received: by 2002:a05:6512:10ce:b0:53d:df50:5a1b with SMTP id
 2adb3069b0e04-53ddf505b00mr2688365e87.7.1732543585672; 
 Mon, 25 Nov 2024 06:06:25 -0800 (PST)
Received: from localhost.localdomain ([176.176.170.239])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433cde8fcdfsm128353385e9.32.2024.11.25.06.06.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Nov 2024 06:06:25 -0800 (PST)
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
Subject: [PATCH-for-10.0 2/8] hw/ppc/spapr_pci: Set PCI_BUS_IO_ADDR0_ALLOWED
 flag in host bridge
Date: Mon, 25 Nov 2024 15:05:29 +0100
Message-ID: <20241125140535.4526-3-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241125140535.4526-1-philmd@linaro.org>
References: <20241125140535.4526-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12d.google.com
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
X-TUID: zfB2uySrpJcI

See commit e402463073 ("pci: allow 0 address for PCI IO/MEM
regions"), all sPAPR machines set this flag.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/spapr.c     | 1 -
 hw/ppc/spapr_pci.c | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 5c02037c56..8af56bd68a 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4600,7 +4600,6 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     mc->default_display = "std";
     mc->kvm_type = spapr_kvm_type;
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SPAPR_PCI_HOST_BRIDGE);
-    mc->pci_allow_0_address = true;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = spapr_get_hotplug_handler;
     hc->pre_plug = spapr_machine_device_pre_plug;
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 7e24084673..16f3a18d2e 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1888,6 +1888,7 @@ static void spapr_phb_realize(DeviceState *dev, Error **errp)
                                 PCI_DEVFN(0, 0), PCI_NUM_PINS,
                                 TYPE_PCI_BUS);
 
+    bus->flags |= PCI_BUS_IO_ADDR0_ALLOWED;
     /*
      * Despite resembling a vanilla PCI bus in most ways, the PAPR
      * para-virtualized PCI bus *does* permit PCI-E extended config
-- 
2.45.2

