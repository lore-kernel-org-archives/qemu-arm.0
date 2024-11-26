Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1936067njc;
        Tue, 26 Nov 2024 03:24:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV35POQVxB6+c1C00Roji7d/SjbVHSYu6d0ne+nMnBD/QDhzsl4ykSeD7QRogeO8bRGWgzDC7Tnf0fleQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFK3IqgYI8Ds4jS1jesTTW7f0nvM9lggBqw/KaWZzNXTuzvUoEgLlHvWp93ZxLj97UHSvmg
X-Received: by 2002:a05:620a:8385:b0:7b6:6756:eef7 with SMTP id af79cd13be357-7b66756f437mr1200216385a.6.1732620261135;
        Tue, 26 Nov 2024 03:24:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732620261; cv=none;
        d=google.com; s=arc-20240605;
        b=MzXhRcaI76PGfikI6FDXusg3TBzBexI1THcKKBakh65Lz5z1wi7LRh2I9IOAxZdxrv
         p+KitKUFrx2xtdyc75ASV1OkLKFyqWNn7olKW7h0nNTrEM26BuiM8M8mfzQMgNMiEkgl
         difWwVhoom7o/3PPLZ0PqnciQfGS07s0Ej+T0gqMC/S9nhKbCAC67ytFN4VeuNHZ3kaj
         Fny9HQ0KT/sBwu1PpL+CFtKKArNWXhJOJEmRWk4dVmvKNLPBTRLYaalrA3s8ipwBCedS
         fDOjgwkKylpwWo2g5iS+CkpKXwjemnxu7WsQkIFrCWO/nvQZv1CePy4nmZn66D/4R6J3
         2nzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=531OAHe2E6s/gjTEfxFCkh/CSUMa49twfx2TRTu9rug=;
        fh=hDJFXW2XqtpDjpfPMPF6/XPb4WSjarJrrq63CGCd9Ns=;
        b=hmD+qy0ZyRUTwlFCLgzhiW8R1Zm9xG1MqDgW4txdqBTxTAsDTTm1ZACKliamGP/X+T
         TWZaIUSAkTFcZ3HLx+N3AX7NENp9wVaUk4XN0WBtdSDX2dm0V0rOiJANBXB3FNvYnAuT
         UwAlTJTVuVJ7CfbeZoLwO5Q+Aeu/YHSCq2DWEx8ELLv4UyCEQZMKVq1qyi1bbGku4Tlb
         UqbCZolJ+wdPGRfvS7/y9tmkdriXJ1M7SbJz4as0niHZgE/YEr9tVH47PGTaUKugoWT7
         BIZ/d5vuK+mGWdJp8x0YYxGQQCui9zjJ3IIvmGzJqreg/yPZeGwH59Wdmn9teLNosTu4
         WhhA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fu1eq2LP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b657588387si963810785a.387.2024.11.26.03.24.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Nov 2024 03:24:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fu1eq2LP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tFtfn-0004kk-Ay; Tue, 26 Nov 2024 06:24:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFtes-0003wk-4X
 for qemu-arm@nongnu.org; Tue, 26 Nov 2024 06:23:07 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFtel-0002kT-M1
 for qemu-arm@nongnu.org; Tue, 26 Nov 2024 06:23:02 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-434a099ba95so15778455e9.0
 for <qemu-arm@nongnu.org>; Tue, 26 Nov 2024 03:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732620173; x=1733224973; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=531OAHe2E6s/gjTEfxFCkh/CSUMa49twfx2TRTu9rug=;
 b=fu1eq2LPLYZFT1JFRqcrq/dgHJLG4aatbxi8h011QprBw2hhsCeLOZuP4mY49Yj2vo
 G5dN0v9kl10AbhDFyveVoQaWbtJ6HDuP6d5FhR5lZAVvEQS9IdjWN8wty6q9vfBAn0HY
 5WV/y6/Ez293S4CuXmjrGcKPRxn2wFmoPkkqtZmVCo7wuNup6EbaWK1FsaQ9wzf2J+WJ
 hm7/zlIcB3IMCWpNuF5DTTahZ0R2NVdnZU/e0t0IZGDFuXYiTImu3W9y7Cj3sySbVOIo
 XQ5qP5+mvy+djvuLimbVju0cY9CSiwzbqoQq85ljoICpo5tlzAa6M4WafrrytTuqfe6i
 c4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732620173; x=1733224973;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=531OAHe2E6s/gjTEfxFCkh/CSUMa49twfx2TRTu9rug=;
 b=wysC2npgRNZMNbBY20RevXxfGqmo2YH9+rlKF3Xu/22RqrqQPVE/o6JjE0o8Kr8CM3
 WTf5f5urIeWkpZ34ySqwALaZIeAg4xDjhQAdYpOKPtO1bBTBJh1Oh5Wv++cQAfvTZulF
 e+ByeO5mAAIaJENviyvQGAN6i5GHIq8+lTzSLuNRniYldMn35sNYu7yaEmN8VBgz/jv2
 rF/XVnHKWesh1SSBGtB8XPCBmEyNchlVsU6O8dFW3HBsFw4NPIqRAih5EFQfv3lIln3e
 p+TgteAVoLGqK0OBodnpV4P6wKj3WdMhe8IBrMcXjN586iZ8VJS8IZIQXJu80/xqzL/c
 vubA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiAs12CgMS9o953p3iU2FhD66CAc+GDsCJsTqnh8CsZ/suLAhCEwksLRYV4rk+s4CcEpUR2JEk1w==@nongnu.org
X-Gm-Message-State: AOJu0Yx/WOvBfhXr9015y77ptrD69+/PCFfRAgnPS8B7jBkMVrZkbHK9
 hsrm/wabBts1yS4XYTfxT52HDWgmen/iHNfW4FHMdBB2xbbHIrl9G55416jnsT0=
X-Gm-Gg: ASbGncsyVIGNFOc544pHJqwnbKA/KQaGIonF/zMG46nisXIofq+YIJHHgeHsmtyt9hv
 XbVKCnhwBB6dxYqky2SBY/YPO7uRNuZBHePAnLreJzGzbknh5Z2tMRsYtRoSqLR53u/TFb7jwUi
 n9lODt79RaNmzhcIvbPplxbWTVGW+x03ctqfqFpK5kf6PuotB3gnLYszKFtuodg90JDDLe22Dfo
 lQwXaWcl+2UMGbGvAmLB17mxkuoSo6CFX8TUoxC5ttQtONsjq8tDMSwtFXqVfJwvRtHXkRp
X-Received: by 2002:a05:600c:154d:b0:434:a815:2b57 with SMTP id
 5b1f17b1804b1-434a8152d9dmr7809555e9.20.1732620173600; 
 Tue, 26 Nov 2024 03:22:53 -0800 (PST)
Received: from localhost.localdomain ([176.176.143.205])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434a4faf750sm25527775e9.10.2024.11.26.03.22.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 Nov 2024 03:22:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 v2 05/13] hw/pci: Propagate bar_at_addr_0_refused to
 pci_root_bus_internal_init()
Date: Tue, 26 Nov 2024 12:22:04 +0100
Message-ID: <20241126112212.64524-6-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241126112212.64524-1-philmd@linaro.org>
References: <20241126112212.64524-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: pEcrE4UTmir8

Have pci_root_bus_internal_init() callers set the
'bar_at_addr_0_refused' argument. No logical change.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci/pci.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 27b66583e54..8eacb8f82fc 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -529,7 +529,8 @@ static bool machine_refuses_bar_at_addr_0(void)
 
 static void pci_root_bus_internal_init(PCIBus *bus, DeviceState *parent,
                                        MemoryRegion *mem, MemoryRegion *io,
-                                       uint8_t devfn_min)
+                                       uint8_t devfn_min,
+                                       bool bar_at_addr_0_refused)
 {
     assert(PCI_FUNC(devfn_min) == 0);
     bus->devfn_min = devfn_min;
@@ -537,7 +538,7 @@ static void pci_root_bus_internal_init(PCIBus *bus, DeviceState *parent,
     bus->address_space_mem = mem;
     bus->address_space_io = io;
     bus->flags |= PCI_BUS_IS_ROOT;
-    if (machine_refuses_bar_at_addr_0()) {
+    if (bar_at_addr_0_refused && machine_refuses_bar_at_addr_0()) {
         bus->flags |= PCI_BUS_BAR_AT_ADDR0_REFUSED;
     }
 
@@ -563,7 +564,8 @@ void pci_root_bus_init(PCIBus *bus, size_t bus_size, DeviceState *parent,
                        uint8_t devfn_min, const char *typename)
 {
     qbus_init(bus, bus_size, typename, parent, name);
-    pci_root_bus_internal_init(bus, parent, mem, io, devfn_min);
+    pci_root_bus_internal_init(bus, parent, mem, io, devfn_min,
+                               true);
 }
 
 PCIBus *pci_root_bus_new(DeviceState *parent, const char *name,
@@ -573,7 +575,8 @@ PCIBus *pci_root_bus_new(DeviceState *parent, const char *name,
     PCIBus *bus;
 
     bus = PCI_BUS(qbus_new(typename, parent, name));
-    pci_root_bus_internal_init(bus, parent, mem, io, devfn_min);
+    pci_root_bus_internal_init(bus, parent, mem, io, devfn_min,
+                               true);
     return bus;
 }
 
-- 
2.45.2

