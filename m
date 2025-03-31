Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp2183005njd;
        Mon, 31 Mar 2025 08:21:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWa8GHG4ubdqACY/l5Dw4FYyAFKo7fNKjRJ3LApIoRy3O5n0pW73o61QMVWWjLNyD5SzladW/hUo9p81g==@linaro.org
X-Google-Smtp-Source: AGHT+IEO7GGz5U2PynYNddQNXfI3bI5x+NgGetyImWwWqe93fKxtEechU8gqfO8KbZpNQSOW/v8j
X-Received: by 2002:a05:620a:1a0f:b0:7c0:a3bd:a78a with SMTP id af79cd13be357-7c6908af28bmr1296644485a.41.1743434508825;
        Mon, 31 Mar 2025 08:21:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743434508; cv=none;
        d=google.com; s=arc-20240605;
        b=UKow/XXkiq1+4KfH1lY+NkVkRx6Rvr0QmSAYef0jKCyCTu3hmfl+jg2KDrGKzXgCEm
         LXWpzOS5zqysXJNCCp/E3OI9fjKJK9Zq2XYZ47ZWiUWA8IgOhJKwihgmfDgwgoSnCFyy
         AgJ7Jr8HsLc3GMB7JsKm0vwcoP/azCdzX/2lrWXGkmaq6OCjWh3hPAVg4RvUgMgXlicZ
         eNMXmQJQINec/b2ZW6aASQbeRed0SuFWhthQLPg3cBMv4qLx09op+vleLxNaiJUhPYyy
         djQtf+odQdCnoUmKR2zUlqlUUo5KVdJ5i8WG0+VUJOwsssM52F8c88TTs8Dz6NM/7wbg
         gpWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hXIcLIfDAyhYrdj9+q8KiZNiZrZdeQAwoIn2YrKTzw8=;
        fh=Iv/yClvKd9M+j7jA+4ZxWcVo1fzIMIZgZgRZ6W2JbVk=;
        b=kg0zcThJjQEULjOYe8+moGxj5BYZYAwVyFkb2VCWC4k0/ZfJn+UERgyNBy5/b4DE3c
         xpMXU9HcOEmLFWGCb5WeY8pAyTwRE5Lo3eHF0TPaO88Oj2cwD26BuCxV/bXddXYFbl8D
         KOGu2+KFg/f2QN/BVC72+MKgrA1CWFMPhune7KtQm0EsV32eA/SspJ305OVPzdu1TJ+v
         /SoFwiYd4INxTNzUAa+YhF7DA4HRA1OSMv8LFJkS1PjH2djOt+ZUDLP4uO++PacQ54P0
         2GqCbY4x6fqNBnRmHeQtWom3I2qZeqic09kpsOjhJeROUIpiBMOsXm9RbMBzVDVRqaHv
         Tjww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=owglU0D0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5f77b4b1fsi677757385a.463.2025.03.31.08.21.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Mar 2025 08:21:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=owglU0D0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzGwd-0007Fz-SX; Mon, 31 Mar 2025 11:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzGwa-0007Eh-HT
 for qemu-arm@nongnu.org; Mon, 31 Mar 2025 11:20:56 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzGwY-0007Q4-Pe
 for qemu-arm@nongnu.org; Mon, 31 Mar 2025 11:20:56 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38a25d4b9d4so2428564f8f.0
 for <qemu-arm@nongnu.org>; Mon, 31 Mar 2025 08:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743434453; x=1744039253; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hXIcLIfDAyhYrdj9+q8KiZNiZrZdeQAwoIn2YrKTzw8=;
 b=owglU0D0ZMQTY/u+6nb3QGBWqa8a0yj6C0yQse3ZUMg0IzgGp9Y/dOexvXsKyQYvrh
 eEthXCgQSd+E8WfZAtE7ak+eBSnOUtqCxyhP7277EJezEX17hw8va1aQEqy7nFZ/rPjn
 0nlozGH/W3hSfc6mwmo/ACumUI929CJ/ge7Mc/BwDhAAfLsoeZrySesk9ypHYPejyuo1
 d3pMOyGm0kc31ckDL/Wb2OYR0o2w1KqwxlctMHknccmpa6Bvmwl1NutGE5m9+iclHWoT
 lHDqId2c6wqvuLinb9/uKuJ8xEJLUd2J9zvy2VbdSENkmOxxZMrG37F2tmow06oFEaMb
 zQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743434453; x=1744039253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hXIcLIfDAyhYrdj9+q8KiZNiZrZdeQAwoIn2YrKTzw8=;
 b=TQgHF7eeyXyDYjV26wfyCwttgNFPnebcw/FXIBnyse+sMVNHRk9H5+yU4V0jipQc1r
 udIO8hVg7ZMDD3E32Td7lIFzpOyx/9eKTeq1y2CeGaySWgGHIF8Ztba6Oqf2KUlb3jSM
 FwlX7AT3HqXcIpXKTddigNOK1SRN4kX77uCfE4W2EX7Nc9TX6Ep6CJPNDB3maWCFJahb
 L3KhTHPB2ey3HWpjqRxzz1hAvDKtU8PLm/iwEFPynICYI541Ci+cewpWgOZLe4yj2H7D
 CXluxTvaxY/7IwCx3KjOg64b4EDCGZhEO8Wnn713okJ99AnWnae653wulUg9DttwGdIi
 ZaoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2zDGrJhePEFXf2f8zCaEXq3KFxUGJ+msbyeV0yBkN5Z645WfkcaUyZ7d1kQRNpntPRMAHSuKdsQ==@nongnu.org
X-Gm-Message-State: AOJu0YzBwWUPH9HPE/yI69/KF/tiVuGRjYT2A0Ajwh+zp2kmj6aKZRzS
 lzWINpkWrx5xmWJl1TR2z/mvJTxsA4qKaxFTY3fM54IQTmNbF0rwOGh6u/xQAKc=
X-Gm-Gg: ASbGncszrZR1cKfrBH1629jyFqDxkK29V1GpQXpBU7Holq9G2w4uaoVOGTB9u6opnVN
 aKpKT/1y6t29jVktzgT1zXk5136SdErOQdywnoJHzcCyWYvXm2BFiX+oxZRkWip31OFrhHIqm53
 orIqZpjXx3netW3HC01ZrG2qyjr0gRai9namYcPJrmgpDvHZJxl3mgDtIOHtsNiaGvoCLA+wEGi
 h9u+ZbtEuArJL7Qni5JrU0TZTcyhLxEX1vTrn9jI2H9KIeXuNbZE5R8rVq7sxMy1xkYnXt+NuMJ
 tJt59+pWIZ919RxotKk/Q9nHYRO4EzSB61HcnA7EXkLMHKlqr4RU+BU53hGEuklfOgtpB7dT4by
 odOAbvvPqW1zh69JvPUc=
X-Received: by 2002:a5d:5848:0:b0:390:fe8b:f442 with SMTP id
 ffacd0b85a97d-39c12119cc3mr6632217f8f.54.1743434453205; 
 Mon, 31 Mar 2025 08:20:53 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b7a433bsm11689353f8f.97.2025.03.31.08.20.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 31 Mar 2025 08:20:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gustavo Romero <gustavo.romero@linaro.org>, Joey <jeundery@gmail.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 2/2] hw/pci-host/designware: Use deposit/extract API
Date: Mon, 31 Mar 2025 17:20:41 +0200
Message-ID: <20250331152041.74533-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250331152041.74533-1-philmd@linaro.org>
References: <20250331152041.74533-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
X-TUID: 2UeI1/RHyCyG

Prefer the safer (less bug-prone) deposit/extract API
to access lower/upper 32-bit of 64-bit registers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-host/designware.c | 47 ++++++++++++++--------------------------
 1 file changed, 16 insertions(+), 31 deletions(-)

diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index 5598d18f478..3f2282b2596 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -22,6 +22,7 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "qemu/log.h"
+#include "qemu/bitops.h"
 #include "hw/pci/msi.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pci_host.h"
@@ -162,11 +163,9 @@ designware_pcie_root_config_read(PCIDevice *d, uint32_t address, int len)
         break;
 
     case DESIGNWARE_PCIE_MSI_ADDR_LO:
-        val = root->msi.base;
-        break;
-
     case DESIGNWARE_PCIE_MSI_ADDR_HI:
-        val = root->msi.base >> 32;
+        val = extract64(root->msi.base,
+                        address == DESIGNWARE_PCIE_MSI_ADDR_LO ? 0 : 32, 32);
         break;
 
     case DESIGNWARE_PCIE_MSI_INTR0_ENABLE:
@@ -190,19 +189,15 @@ designware_pcie_root_config_read(PCIDevice *d, uint32_t address, int len)
         break;
 
     case DESIGNWARE_PCIE_ATU_LOWER_BASE:
-        val = viewport->base;
-        break;
-
     case DESIGNWARE_PCIE_ATU_UPPER_BASE:
-        val = viewport->base >> 32;
+        val = extract64(viewport->base,
+                        address == DESIGNWARE_PCIE_ATU_LOWER_BASE ? 0 : 32, 32);
         break;
 
     case DESIGNWARE_PCIE_ATU_LOWER_TARGET:
-        val = viewport->target;
-        break;
-
     case DESIGNWARE_PCIE_ATU_UPPER_TARGET:
-        val = viewport->target >> 32;
+        val = extract64(viewport->target,
+                        address == DESIGNWARE_PCIE_ATU_LOWER_TARGET ? 0 : 32, 32);
         break;
 
     case DESIGNWARE_PCIE_ATU_LIMIT:
@@ -321,14 +316,10 @@ static void designware_pcie_root_config_write(PCIDevice *d, uint32_t address,
         break;
 
     case DESIGNWARE_PCIE_MSI_ADDR_LO:
-        root->msi.base &= 0xFFFFFFFF00000000ULL;
-        root->msi.base |= val;
-        designware_pcie_root_update_msi_mapping(root);
-        break;
-
     case DESIGNWARE_PCIE_MSI_ADDR_HI:
-        root->msi.base &= 0x00000000FFFFFFFFULL;
-        root->msi.base |= (uint64_t)val << 32;
+        root->msi.base = deposit64(root->msi.base,
+                                   address == DESIGNWARE_PCIE_MSI_ADDR_LO
+                                   ? 0 : 32, 32, val);
         designware_pcie_root_update_msi_mapping(root);
         break;
 
@@ -355,23 +346,17 @@ static void designware_pcie_root_config_write(PCIDevice *d, uint32_t address,
         break;
 
     case DESIGNWARE_PCIE_ATU_LOWER_BASE:
-        viewport->base &= 0xFFFFFFFF00000000ULL;
-        viewport->base |= val;
-        break;
-
     case DESIGNWARE_PCIE_ATU_UPPER_BASE:
-        viewport->base &= 0x00000000FFFFFFFFULL;
-        viewport->base |= (uint64_t)val << 32;
+        viewport->base = deposit64(root->msi.base,
+                                   address == DESIGNWARE_PCIE_ATU_LOWER_BASE
+                                   ? 0 : 32, 32, val);
         break;
 
     case DESIGNWARE_PCIE_ATU_LOWER_TARGET:
-        viewport->target &= 0xFFFFFFFF00000000ULL;
-        viewport->target |= val;
-        break;
-
     case DESIGNWARE_PCIE_ATU_UPPER_TARGET:
-        viewport->target &= 0x00000000FFFFFFFFULL;
-        viewport->target |= (uint64_t)val << 32;
+        viewport->target = deposit64(root->msi.base,
+                                     address == DESIGNWARE_PCIE_ATU_LOWER_TARGET
+                                     ? 0 : 32, 32, val);
         break;
 
     case DESIGNWARE_PCIE_ATU_LIMIT:
-- 
2.47.1

