Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1312483njc;
        Mon, 25 Nov 2024 06:08:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVNhwqMLDI1AiqWFjzIEgUnF4BqXtPiJQsz+RJtuWSJwV92w3Nnl7njxBk3Ykoe40NQa9cKuDwS/DYBXg==@linaro.org
X-Google-Smtp-Source: AGHT+IFYRz5OODYSe/QYgKRqabaHDZA4iBuHl+wuH2jbSsw9gOG3sFarjEW6bEkqDFMCAAH8dpqQ
X-Received: by 2002:a5d:5f86:0:b0:382:33b3:5f7d with SMTP id ffacd0b85a97d-38260b81d3cmr9516125f8f.27.1732543684892;
        Mon, 25 Nov 2024 06:08:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732543684; cv=none;
        d=google.com; s=arc-20240605;
        b=Z/H5WsVnPGPD+aKL5iSQHeCNLiiwb1btbdoKNwZHq/0qAZ562KqIRknMzKmivzpogB
         uvkhRuEgNib6/hkUhSxm2OEEt++AO+CTxCiFaDbhKXjGBWZE6HeoBrE5JDZlhTMTfztW
         ESjxJtFJC9oOOi9gAqZi3menN34C9RsLM5r9xx9FMmRziekHWuYcF8q20MbMBNSodVIh
         LwPSGAgFW67edK43CUTMOqggCWSLWwwqgYeeVh9ZhauTsKP2A5GEYu1KVYeHwMRy84gi
         Cc9fGQHDT80ftWZty7OmILtkEwt+Kubi48FFibb4Tg9xiD79Gw4Z07FotH+N5OY+6mgS
         Sy6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hhPIY1VBzTRWV9NVUC530URyYQIaOfJGukKvr94mbQc=;
        fh=XpXngXxayFzrri8geg2SHmgxD2bMQuX1DTLPSgnRqOY=;
        b=f4HlYQsbrLNCB0Cp1NzwfDwvBtwoGyjhy6Ce1hegFZRwy0/gDQIFxkRRoPoKtUw0vI
         ZjdJn1PsJ67yZTN4MgdQhsq6kFQNzHpf+EYlnwRAOsWhYYxddyf8forJ2m9OpkjlphAr
         VYwDM9wZe+FRM9uMfUXjj/zTBE26OxSbaGzpktMBvZnUeWBXqWCNCiSjzOZX68CUq+8y
         5g91VFgQ0nx1e7l/9oY6nkqV/gPk6DgmOt1PkkLwsOQKSKrlUPus9Lz7+CaBLiUoMFeJ
         VpNFcxs7/amEnqfwglraU2cBctHh1R5X8Hg8dPerYca2dd/mmAAZfua9v20JEaSxKDVR
         aN9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KTVO1eLk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-385be9a167fsi11917f8f.902.2024.11.25.06.08.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Nov 2024 06:08:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KTVO1eLk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tFZkQ-0003ZQ-IZ; Mon, 25 Nov 2024 09:07:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFZkO-0003V1-LM
 for qemu-arm@nongnu.org; Mon, 25 Nov 2024 09:07:28 -0500
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFZkM-0006p5-UV
 for qemu-arm@nongnu.org; Mon, 25 Nov 2024 09:07:28 -0500
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ffbfee94d7so11541821fa.3
 for <qemu-arm@nongnu.org>; Mon, 25 Nov 2024 06:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732543645; x=1733148445; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hhPIY1VBzTRWV9NVUC530URyYQIaOfJGukKvr94mbQc=;
 b=KTVO1eLkQUjYC709Nr3k+IqVD5ayywzIL0QgrkyJ/tl8nMd0z651yzXC4rTW0miucx
 NPhWW6WfINbBe9C3YyK3IPVPOdhjsldLeFl8F9w/fwu/e8xsrmfKw9maWPXH8qqkNSLc
 +xLWUe2Hq4XwwofJpLZoB+yB2wjgYmjxpjdYBZxtkWNmZ/48l62+fiLWmnQr42NU3fJx
 rGFWSJ0fbOEpDNmvCA6r6oiCy/XsNgxWh5+2YswGCy9JN/aQG+N9GoEOzxTWd3Pk3qlH
 wsxAbrra4/2Gox90Q/+p4HHgXiOW81DWeNcRI+p/xN3nA+bFYm0lqWMsA8nsQ5tcziBh
 I7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732543645; x=1733148445;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hhPIY1VBzTRWV9NVUC530URyYQIaOfJGukKvr94mbQc=;
 b=LSfFqXP3ViY/CglWIfC/0ZJWZNHW2vzZveByzliJxqLT/9+az/6cUiY4ITBjRGMj+p
 m/UVWAGM43ilweJsnD9hkzWy+/1rwItbI4g4npoJ6CvfMZnfhSSmGxys/Pl7X5jkZDFc
 E42BQxdPioOnmR77EX+WoHa2IeIl5i6kg+7F0I1IOwE8jL6DqUa36Hb5Ovi+v5sXvxP5
 Lw4uBWKbe3TPiy9wBvmSud6BbFcSMPzhXYd7o1G9k3CHWqI9+1yJmIx3bl3aFmjeWryu
 7xZbCLTZL227cZbN+cV7cdCvPkB3MPVV6pvPIn+2Zoi7FzhC/QwQzRfc41xIM/UswBor
 YiBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUl8XHpx52EaODLDsOhHe/cnI4ocGzwHixmEXP9peRuGstQALtZVEXr2UzmaB/JMUmNFO58aOABFg==@nongnu.org
X-Gm-Message-State: AOJu0YxEOfsl0fzTgajDFFZPFyoc4eWVtTx9koqeCKfWkzeFPEhti6aF
 nCctHFAyllbjt2aw0SJphoPnGdzZnit+6mBOU0O1xet53IniWOfpkR8F/BgotVI=
X-Gm-Gg: ASbGnctRs1s1SohOp9NmnZ4DYk5klwVmJV5N+b8us70j1o37VhZOotpC50F3oM699BT
 w/UwvpFfB1B173GFQREr485r6SIdIkRwpa3n8nw13hkOoMSBGbFMCaZuhwUQ7qzbXVLCUgxCPnI
 SPhi0vH2qbET9nbgX52qXQsFJtreYZ87FDY5rdZu+DHXCKlEMG0duaKmciryCUMGBPoRMh+s/tB
 i1i1IyxrsJeNHZQ5rzB9M0bWd3vo/XFoJlKkrieEp5FpBgRFI5ZDk1w7P/ESlFNKweS7o6/
X-Received: by 2002:a2e:a546:0:b0:2fb:5a19:5b9b with SMTP id
 38308e7fff4ca-2ffa70f08a3mr71798411fa.8.1732543644987; 
 Mon, 25 Nov 2024 06:07:24 -0800 (PST)
Received: from localhost.localdomain ([176.176.170.239])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432f642f15esm210421055e9.0.2024.11.25.06.07.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Nov 2024 06:07:24 -0800 (PST)
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
Subject: [PATCH-for-10.0 8/8] hw/pci/pci: Remove legacy
 MachineClass::pci_allow_0_address flag
Date: Mon, 25 Nov 2024 15:05:35 +0100
Message-ID: <20241125140535.4526-9-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241125140535.4526-1-philmd@linaro.org>
References: <20241125140535.4526-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22b.google.com
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
X-TUID: tXdxQQaSjlTV

All users of this flag now set the PCI_BUS_IO_ADDR0_ALLOWED
PCIBusFlags. Since there are no more users, remove the field
in MachineClass.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/boards.h | 1 -
 hw/pci/pci.c        | 5 +----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 36fbb9b59d..66fb2eddd3 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -284,7 +284,6 @@ struct MachineClass {
         no_floppy:1,
         no_cdrom:1,
         no_sdcard:1,
-        pci_allow_0_address:1,
         legacy_fw_cfg_order:1;
     bool is_default;
     const char *default_machine_opts;
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index de3f93646f..d27166dd75 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -45,7 +45,6 @@
 #include "hw/pci/msi.h"
 #include "hw/pci/msix.h"
 #include "hw/hotplug.h"
-#include "hw/boards.h"
 #include "qapi/error.h"
 #include "qemu/cutils.h"
 #include "pci-internal.h"
@@ -1472,10 +1471,8 @@ pcibus_t pci_bar_address(PCIDevice *d,
 {
     pcibus_t new_addr, last_addr;
     uint16_t cmd = pci_get_word(d->config + PCI_COMMAND);
-    MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
-    bool allow_0_address = mc->pci_allow_0_address;
+    bool allow_0_address = pci_bus_allows_io_addr0_access(pci_get_bus(d));
 
-    allow_0_address |= pci_bus_allows_io_addr0_access(pci_get_bus(d));
     if (type & PCI_BASE_ADDRESS_SPACE_IO) {
         if (!(cmd & PCI_COMMAND_IO)) {
             return PCI_BAR_UNMAPPED;
-- 
2.45.2

