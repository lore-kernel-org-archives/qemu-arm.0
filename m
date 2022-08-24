Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp2221661ejc;
        Wed, 24 Aug 2022 09:02:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6GSvpezROtqqUT40rGJ8LO6gzmYb3v8MMcUAgbhB5HnFwR0j2j7W6tqRX6YciH1zTVmNrH
X-Received: by 2002:ac8:7c54:0:b0:343:75b6:9a4 with SMTP id o20-20020ac87c54000000b0034375b609a4mr25014048qtv.650.1661356924979;
        Wed, 24 Aug 2022 09:02:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661356924; cv=none;
        d=google.com; s=arc-20160816;
        b=TGh1zXQNX7iGnpap18CheMKRi9SL05bW3bq2LswOmI2i2u3O8AIBMlSesij+/D3uvZ
         doiDPNgjgg0jVVJXsq5eY7JasWuq1uiUvh/WzAdf1J8aF7dN86pcOqRQfZWNaGqTqHRs
         2P/gYpQEIbeR0VSQTBWeFkPCPW2mgXHDyNqdqGlVq5QydA7K0pJ6KtiXeqc4HolUdcRF
         NawSXwxx3UR4VPfqrVjfdoE8CoG/0B/qNEApIZ83a3jVSHvPa+PRod5cnyJ1LgskOuOw
         wW5tHDJ9Wr47/V0RDgWpad2agup8Hjt+cZTZFXFpV8eiNOwvDunvzO8Eua/DVAvfJv+E
         QPoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=t5fD4FpVwJ6lGJRoKb62Zn7TZwvFcPtyT/lOy3RUWs4=;
        b=ji8+34NNLAaEB/dfIBToW3+ct6R9wpS2pvSh/5mbzF62zPj/VL/Hugu1RQUai/QmMs
         PXAB8p0BFpGmG80sPTXijr77jO69F7sv2OMtrshZxIavoMoxkcqnD1F5bu00a4Dfnsru
         VUIDtmTnHwMWM3XMeyzG6onFCjN/BuZt5wLRjqsc/sTLfUQWKAPoqYRHJalq+UIZs718
         3t9jEJ+VT0cjgaAVAhpfdT/haEnJusciy9rg1D6oN09RKySEZKPgtB8LlhH0uz99L+YO
         wSZA77ok561lYZbX3NQ7jkusfqhW75QDJR4SOHbWgP5K6A+mY8yVZ0seEDfU6Yr0yZ2w
         XNfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="J/aHVmrx";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y24-20020ac87058000000b003445ed91836si9142725qtm.349.2022.08.24.09.02.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Aug 2022 09:02:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="J/aHVmrx";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQspQ-0001Rv-5B
	for alex.bennee@linaro.org; Wed, 24 Aug 2022 12:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf8-00029N-9q
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 11:51:27 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf4-0002F2-BY
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 11:51:24 -0400
Received: by mail-wr1-x435.google.com with SMTP id a4so21324359wrq.1
 for <qemu-arm@nongnu.org>; Wed, 24 Aug 2022 08:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=t5fD4FpVwJ6lGJRoKb62Zn7TZwvFcPtyT/lOy3RUWs4=;
 b=J/aHVmrxk8eAm69nBlOxz/V3aaQXBU8p9yI/cyXpdcHaeRWuaCbu+lYMj5ezY54qsY
 nDk67kRe5XTKMeIoT8gG6T6yclI/rCoWCGorrWixmCFWOYS1YHzkzGE01woFQv7xgGAA
 adlFxsKC/7u/2fqGLvw7hqH2ibh6PajKKixRtkGrJz56FvGlmHcYhf+UgzsSbzv3muBi
 npKLoJUXqgHiaKBcouxE2euCMYxafmR79CXX8cVN4ezKbaAOh3be7MywRhzKB7PG7o1H
 hXpfHy0xpMzcVhBl0XLTgfsvle898wPn7a/AoYJQ0yiFeo2jYqKssJHipN3ZeIqH19eK
 iU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=t5fD4FpVwJ6lGJRoKb62Zn7TZwvFcPtyT/lOy3RUWs4=;
 b=Ph98MijMw53EFT5bgnMHBtOzYYmskoYeFRDjnLqQnzYexb1otX6EdYGKWg/pyESdwR
 eXkFhM9yt5z2VLFfQH4KWKzU0apDzqg8rIkU7aevrZtU7xeWchIUi9Q4KRSqNSryB2c1
 TwXtz+AYBJDOYkIdAkNyRWRDnKGl+4QMXFtcl6tHv2pxw8WjdnAVfr+vqb6CHa7TwKrz
 2VuDF7aDV6qTuOceaOR/5YI6V+I8OaS9ZCdTOjO2daxoFfWpYGdeWbb2oju35xGgaU0R
 4Ge5VS13uGd6IZlD1b6l5sr/PLbEPF4oJ7E/6KiobpU/uEarnjj4tcQdRYBowFMkh8Nm
 kVvA==
X-Gm-Message-State: ACgBeo2444K2ckzxAZlLg6CpCSHpMelGXx/t3vGNLEpyDtrmuJ5dpUOr
 3FGHS7cHT/aoVLQQFDaPatVl2A==
X-Received: by 2002:a5d:4882:0:b0:225:3148:9f85 with SMTP id
 g2-20020a5d4882000000b0022531489f85mr15612999wrq.224.1661356280850; 
 Wed, 24 Aug 2022 08:51:20 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a5d61cb000000b00223b8168b15sm17236411wrv.66.2022.08.24.08.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 08:51:20 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 04/10] hw/arm/virt: Use "msi-map" devicetree property for PCI
Date: Wed, 24 Aug 2022 16:51:08 +0100
Message-Id: <20220824155113.286730-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220824155113.286730-1-jean-philippe@linaro.org>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x435.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ldd6CWLITN9l

The "msi-parent" property can be used on the PCI node when MSIs do not
contain sideband data (a device ID) [1]. In QEMU, MSI transactions
contain the requester ID, so the PCI node should use the "msi-map"
property instead of "msi-parent". In our case the property describes an
identity map between requester ID and sideband data.

This fixes a warning when passing the DTB generated by QEMU to dtc,
following a recent change to the GICv3 node:

  Warning (msi_parent_property): /pcie@10000000:msi-parent: property size (4) too small for cell size 1

[1] linux/Documentation/devicetree/bindings/pci/pci-msi.txt

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b6aa311d8c..ca5d213895 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1489,8 +1489,8 @@ static void create_pcie(VirtMachineState *vms)
     qemu_fdt_setprop(ms->fdt, nodename, "dma-coherent", NULL, 0);
 
     if (vms->msi_phandle) {
-        qemu_fdt_setprop_cells(ms->fdt, nodename, "msi-parent",
-                               vms->msi_phandle);
+        qemu_fdt_setprop_cells(ms->fdt, nodename, "msi-map",
+                               0, vms->msi_phandle, 0, 0x10000);
     }
 
     qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
-- 
2.37.1

