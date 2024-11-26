Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1937372njc;
        Tue, 26 Nov 2024 03:27:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXNm5WeZcGsbxhVMGvnoEkHmWWjE5AUo9Qg/LxfHieiD8M2TSoArFVOujhCzKb0D3vajcZSexypA73fxg==@linaro.org
X-Google-Smtp-Source: AGHT+IE/Nc2KGu/KPTnytpYWwcQkSx23a/1IC5HNTrBI5DFo2QJUEuGFk2dWqp+mF/yXvxt5N56s
X-Received: by 2002:a05:622a:180f:b0:466:94f7:4b4f with SMTP id d75a77b69052e-46694f74d7cmr81025951cf.19.1732620436110;
        Tue, 26 Nov 2024 03:27:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732620436; cv=none;
        d=google.com; s=arc-20240605;
        b=LrBpn6saCpyqRdRgqVhtWcGRDQ4Vo5SYspr9F175UngD87Har3Tea0A1oPr8XTcu2O
         +UeFL1lizaCJ+H4nJ2CuhFy+WXiPPiOK6t5mxScrrcVSaamq0It4A/m27GC5xtQh8AU7
         GHmorWEM4MDc6Dlq4DUJPQWiKz2Nx1QKFzyh36CJDhCSXYjOZznzg8bzI6akyf+a/+uH
         LE2t0H1Uqf8WDs1SXhQYBBCPLtVNSIgn3sS1zlZoov+dTNGwKP9YDqCOruH/rQEW/WTf
         Ge7pXrUZkaZ1Y5Vk6eTA+VLuzQ609N4BDjUlQpV5M5oZKFx+vSd2JB2ZOfxnIa5/CBM/
         BWuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=I1K533phtUA49BKbxwAi+Y+nPI04Ofc/dicjSAgZ7ZU=;
        fh=BjtExrvZ8QMBVIshsmxOJCnVnyJLsQ78yFMCS5Gvgyk=;
        b=WFrQ9YaSfZRV11JjLtcJvgnG9xM2JWJi+Xd9Sc4txfTD7IVs1D90KTi1rU4dTxr+Qz
         BgzfABoSRC6nMfDwk+SNw3aCrO4u17mVs3B+GQFxX2/aS7ABrFKUxv9hd/0JczWsRIRz
         k1JsHel2+WcflGfN/VcHBD9RgHlesyHoTsRvnwGeLrPLBjyNmb7ymzU+F6TBjs6dosH8
         +bRIYdQS8s7whLi//AbO3RpWfK7/iVWHeO+JhCSnr1FRwLbzREvR5WFlUOvYe1ITFvIf
         vcWsMJYX3HMIxTouPNvfrNyNyp8dOS68KXTjDeW2eUJvj4RHx87vddVm6v2UjLZ6X5Sj
         6bvA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dvdaaZ5T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4668f56f440si52717131cf.298.2024.11.26.03.27.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Nov 2024 03:27:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dvdaaZ5T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tFtgg-0007wO-Pc; Tue, 26 Nov 2024 06:24:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFtfq-0004vS-77
 for qemu-arm@nongnu.org; Tue, 26 Nov 2024 06:24:07 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFtfn-00033G-9d
 for qemu-arm@nongnu.org; Tue, 26 Nov 2024 06:24:05 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-432d866f70fso50752345e9.2
 for <qemu-arm@nongnu.org>; Tue, 26 Nov 2024 03:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732620242; x=1733225042; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I1K533phtUA49BKbxwAi+Y+nPI04Ofc/dicjSAgZ7ZU=;
 b=dvdaaZ5TohMDmblaYitF2ib78JY/Cpoqr22fu1Ye4gZegV/9NYV1ZqWIFxkr/tbotn
 3wNbIpJkRhZGua68n4ab+VfUNAgPb+azSzC0B+YO8CwRxoGbyUxWTrCIIhQbdi1pa1kD
 OxYQAmEz0BQT9Ve0a8o8iUpWl8Ldwglzst6XbV87AtDh5JTPi2YmucxQSjUJLtyS6uvZ
 Jt5xKFKMJ9zA0SuMys4Qp0ZYTw8XWqGfSfSiFjcjUYtSHLSxn0rQwPj5AFbpCHJ90Yl5
 m5my4UPiDsFGsPCaC6eFOnchyrTee363fZ3gsaeaZjUEdnFCjtqi/fut6Yc/hw8nc/OY
 Vp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732620242; x=1733225042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I1K533phtUA49BKbxwAi+Y+nPI04Ofc/dicjSAgZ7ZU=;
 b=oRrnD+cOvETWOq3Nr+mjipFv+Snw9pFkKhcdNLeTTFu17NcT6PoJCazXzvmdQKc0Ja
 b0946zv3hNKiGu/E/StSFCkwGuPH1vP3jcMfR5rASQb8QNlxYOEYeQvfwj4T/r+QKPAE
 zVpYs1WO1cip9nHlqJYB2zyDtSxM+uvTqp/EjCV+6C5L/2F3z0HP/g/aCJXS4KrwhRKd
 Ee/K5bHtcF/OAjLUYXqk1E75BWH9rQ/1gd4hXy8+SumX3aVXhUz6nIsvAkWIsW0nTKK2
 DPy6KBOUhecHqqx3orswn6o8JDat5wetzy9Ek+tj4zsFHZqtJLlG2MjxRpYTPKBdPjGj
 nn1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNnMPwah32mF01K88hEdEEl26Ce9Z1SwM+rfLXV+ip59d5zVhEFChSEQby3+2n0y6umUN/kllrxQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzy20H7WMuVw/18vsn2fb/I315ak4XydOW4xMbtLUG11O/88lVg
 FcM03UVslfw6lfceo2IwznaCMwTYWrAZnZQyPBKrpiT/W7celDj4ZVNHvyaGPys=
X-Gm-Gg: ASbGnctnIC8cDIbmDj1r1B6Az0nfoY9GWcdeAUUnl3m0lO6McLLI654b9qjzSySuGmF
 25+jF7qJPoKbQ49vVKBkDKZVy4VYXsc7Zd7Cn/krtrKa7J9x0o81RuzTcYuwd2kl/l8Tq/nmyxX
 ZzxAaRtMGC+dJdwjtDE+2yqz/5gKOoBKSIH+1ajUgksX6ItwmxZrGcXb9X8k8+4LSyAbxdju6ws
 lSKgphYkJ2wFOwVf5l7VU7D7+5JxyPFFOnFw+TpfV0AUmholMqkUzhYcpMd1zZH94Ygik8C
X-Received: by 2002:a05:600c:3d9b:b0:434:a4a6:5212 with SMTP id
 5b1f17b1804b1-434a4a65461mr31141935e9.0.1732620241847; 
 Tue, 26 Nov 2024 03:24:01 -0800 (PST)
Received: from localhost.localdomain ([176.176.143.205])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825faff9cdsm13070159f8f.28.2024.11.26.03.24.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 Nov 2024 03:24:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 v2 13/13] hw/pci/pci: Remove legacy
 MachineClass::pci_allow_0_address flag
Date: Tue, 26 Nov 2024 12:22:12 +0100
Message-ID: <20241126112212.64524-14-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241126112212.64524-1-philmd@linaro.org>
References: <20241126112212.64524-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: miPtswj7hteM

There are no more users of MachineClass::pci_allow_0_address,
remove the field along with the machine_refuses_bar_at_addr_0()
method.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/boards.h |  1 -
 hw/pci/pci.c        | 10 +---------
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 36fbb9b59df..66fb2eddd34 100644
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
index 889821f64c0..20362da7b89 100644
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
@@ -520,13 +519,6 @@ bool pci_bus_bypass_iommu(PCIBus *bus)
     return host_bridge->bypass_iommu;
 }
 
-static bool machine_refuses_bar_at_addr_0(void)
-{
-    MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
-
-    return !mc->pci_allow_0_address;
-}
-
 static void pci_root_bus_internal_init(PCIBus *bus, DeviceState *parent,
                                        MemoryRegion *mem, MemoryRegion *io,
                                        uint8_t devfn_min,
@@ -538,7 +530,7 @@ static void pci_root_bus_internal_init(PCIBus *bus, DeviceState *parent,
     bus->address_space_mem = mem;
     bus->address_space_io = io;
     bus->flags |= PCI_BUS_IS_ROOT;
-    if (bar_at_addr_0_refused && machine_refuses_bar_at_addr_0()) {
+    if (bar_at_addr_0_refused) {
         bus->flags |= PCI_BUS_BAR_AT_ADDR0_REFUSED;
     }
 
-- 
2.45.2

