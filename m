Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1936262njc;
        Tue, 26 Nov 2024 03:24:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW048rjEiQJZ8VQtndjWcYkaOpXI8QfZ9l5iuO/ksv+XiKHUxoJaoDN+1MqYUBADhfIAENKPBtYcPT/Xg==@linaro.org
X-Google-Smtp-Source: AGHT+IHMUpaOPisew2C/B9osjre4xLyK3lZRqKrabMzyPX3ks8p9Y3n3XJVbynfZh057omYFyvb3
X-Received: by 2002:a05:6214:2b0f:b0:6d4:16c9:2498 with SMTP id 6a1803df08f44-6d451362391mr194906056d6.45.1732620288289;
        Tue, 26 Nov 2024 03:24:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732620288; cv=none;
        d=google.com; s=arc-20240605;
        b=U5D0NcT5NLDyBqBOzQlIr2YTLfh4gH6/dG5a4JwYp8goX4hmk9I+PnZOgpZ/1cLFfz
         woegNu0yDMzBVbfZ67rizf0Lkj8N7Va8JU+2u9UwBbEMp+8dyT14L0Ka05R4XUhefV8d
         Gu2MTXuASSeeDfPTwA6Kqmj1btyHsPm4oRPeqk/yozz0/t7bmyFQvB+wll+qzwfmfJ65
         9cPgiEj03wRzJopNAN7Inx6IKka1au7WefqRmT+yRJgQTf42eUBNalOvhcebpAboyOPN
         G0TLDCMUftXtemkIA1SKf5ILrzkUuAZu131hKzehTGrWO4T2IdJ2bT5jELurnGhLTuT7
         24AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CLOtH90q6HrNlk2tttqrB7+LmSS1Ew20sdzHgtSgHVA=;
        fh=XrWAA6XnK61MpleW2n/xBepBdRTtxgGUYKMcryeffYc=;
        b=Tp7TMCKT6uVyyMfC5nhVxydFjDKXK5Gbht3W0A6bYChH+XEimvowtZqslYBWgVHi9c
         w0Rnq0HmHgALc7eKikRTRZCz1ofFAZt7pGbdf6U+EJ8sP4DQ6tn5tmRaEs3hfw3AqcaX
         PR+BaooH/150XSUH+xJ2nolmL5HW5q4NuhrX5/xjQAqoSjeF5qM88RmWRDbR2KcBNcYj
         97FQKCxjW58f48JMtW1/AKNrOOpmYX4AjSxLKJUvFJkJKDg+P2eHd0pjhDpfo86Y59LO
         NbaxebfnnGqGDf6MAbjkaTVpq9e/uPxTV39VPPgqdu/U8JJPW+jgL9fIXmWQ68EXWGK8
         Tvrw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M9RaepEJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d6068747a3si108996546d6.268.2024.11.26.03.24.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Nov 2024 03:24:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M9RaepEJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tFtgD-0005Ke-2D; Tue, 26 Nov 2024 06:24:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFtet-0003x6-Pt
 for qemu-arm@nongnu.org; Tue, 26 Nov 2024 06:23:10 -0500
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFteo-0002m9-GY
 for qemu-arm@nongnu.org; Tue, 26 Nov 2024 06:23:06 -0500
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ffa12ad18cso62578291fa.2
 for <qemu-arm@nongnu.org>; Tue, 26 Nov 2024 03:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732620179; x=1733224979; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CLOtH90q6HrNlk2tttqrB7+LmSS1Ew20sdzHgtSgHVA=;
 b=M9RaepEJcW14Cci3sSEcQuJTTSAuP074Jx9guCrLdZtSqXILgilhsZIEt5EsuWXTED
 jJ7NAEkY2GxO9p5uJJUOPHKy6CJfwaODRW0i3/jwe5qc3xMt0i7TdsbsUgMFAA9n5PTS
 RHVP6yL9vetgwN9U2vYmh0HId+BcFXO5xyyzNGE8CRDLj6jyvlvrDOxl/ACsK9RgRPQj
 Bh6ZO7NwCzxUnve8RbWcf7228hhihsEL0g1Rq5Ufoy9mgUppf2nqpisGDYyWxJOV9r0q
 Q4IWdP20sHXqULqSjJHibCVB8hHJa82YumXG78VomJy3MUpHE1i2Z5UP5KI5MB/BzVjN
 /jHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732620179; x=1733224979;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CLOtH90q6HrNlk2tttqrB7+LmSS1Ew20sdzHgtSgHVA=;
 b=k4KVktHYgK1xm9F8a2XKaN0k0KITopIRerHId5iWZLrrrfWbnjmqKVlGXnlhmCUc0y
 2Ivn3qTZGFhf1G38p5IPOVAXxh376GRKQ1oJiXrgNl1iqWZBxNPtwmaOA/XpSD5RKzbZ
 Vc46bckG7sVWMkhIIZy67wO74Gzu3d4wcd2060cF6hvb42SIvcT8Xsme0A38v8sKQF5g
 r/sFlbnVTav3i5SwTrwCjLL7jJ7d4oacvr30xkI3xAs+kvSn43Bv+y8hjjbO3WT5B3xe
 YvlQhN5WzJs9aFQDHhNk7d6zz4Z2LgtBXD8EqIUaDh9UPl5osxFWKBJKkTHcRPZs5+CC
 Dttw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbjr/3DgdxA/1h+e9lGGHl9pdBsLxumXHJ/wEmNfTsNoiC2Vo3Re6YoY+jQr1NT6ju6AAhO3goCg==@nongnu.org
X-Gm-Message-State: AOJu0YyZeGXneIq7ICQ/uQykX9pLHaMY9F0M5TJCkYU2D7ctG0XFNdC3
 A2SYNX0ds51kRN3h/tZbXYGBg762dOKv+SSBWr1E+Nqj/LF2KQeEqRKPZVjjjKg=
X-Gm-Gg: ASbGncv2mbPeIpRJQ74Xcj2cHlIiWbgacx5P+tnmrtjwRAWWUoeLwjRaY8XlxbqO7/P
 2/Y/FS1CMq7Pu3MJ0/8gJe0PDhvAGRU+jUQyzUtDeFSbsPArpj9X8nnrX4Gz8YnblMGP4VqewTj
 VwAFSFnmT91wA7TtuEHSesK/6jggzMlO1jWtjpYCGoaYUVgpoxJRURsPNNXB9cLHhqGgYJvakLw
 kqur+ix30YiofGC4GECvshiS5TtpelfZgSYwJg7srq5eJYnjbIV0rVnUuibhLBA8HevPc3S
X-Received: by 2002:a05:6512:2388:b0:53d:e8f5:f9d4 with SMTP id
 2adb3069b0e04-53de8f5fa18mr1392986e87.36.1732620179597; 
 Tue, 26 Nov 2024 03:22:59 -0800 (PST)
Received: from localhost.localdomain ([176.176.143.205])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4349e117bf5sm81335245e9.18.2024.11.26.03.22.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 Nov 2024 03:22:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 v2 06/13] hw/pci: Propagate bar_at_addr_0_refused to
 pci_root_bus_init()
Date: Tue, 26 Nov 2024 12:22:05 +0100
Message-ID: <20241126112212.64524-7-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241126112212.64524-1-philmd@linaro.org>
References: <20241126112212.64524-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x230.google.com
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
X-TUID: TamJYp/bq0QH

Have pci_root_bus_init() callers set the
'bar_at_addr_0_refused' argument. No logical change.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/pci/pci.h    | 3 ++-
 hw/pci-host/raven.c     | 2 +-
 hw/pci-host/versatile.c | 2 +-
 hw/pci/pci.c            | 5 +++--
 4 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 135695c5511..b499846083f 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -284,7 +284,8 @@ bool pci_bus_is_express(const PCIBus *bus);
 void pci_root_bus_init(PCIBus *bus, size_t bus_size, DeviceState *parent,
                        const char *name,
                        MemoryRegion *mem, MemoryRegion *io,
-                       uint8_t devfn_min, const char *typename);
+                       uint8_t devfn_min, const char *typename,
+                       bool bar_at_addr_0_refused);
 PCIBus *pci_root_bus_new(DeviceState *parent, const char *name,
                          MemoryRegion *mem, MemoryRegion *io,
                          uint8_t devfn_min, const char *typename);
diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
index a7dfddd69ea..d5087af5ec6 100644
--- a/hw/pci-host/raven.c
+++ b/hw/pci-host/raven.c
@@ -313,7 +313,7 @@ static void raven_pcihost_initfn(Object *obj)
                                         &s->pci_io_non_contiguous, 1);
     memory_region_add_subregion(address_space_mem, 0xc0000000, &s->pci_memory);
     pci_root_bus_init(&s->pci_bus, sizeof(s->pci_bus), DEVICE(obj), NULL,
-                      &s->pci_memory, &s->pci_io, 0, TYPE_PCI_BUS);
+                      &s->pci_memory, &s->pci_io, 0, TYPE_PCI_BUS, true);
 
     /* Bus master address space */
     memory_region_init(&s->bm, obj, "bm-raven", 4 * GiB);
diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
index d257acee172..f82262f8d1e 100644
--- a/hw/pci-host/versatile.c
+++ b/hw/pci-host/versatile.c
@@ -407,7 +407,7 @@ static void pci_vpb_realize(DeviceState *dev, Error **errp)
 
     pci_root_bus_init(&s->pci_bus, sizeof(s->pci_bus), dev, "pci",
                       &s->pci_mem_space, &s->pci_io_space,
-                      PCI_DEVFN(11, 0), TYPE_PCI_BUS);
+                      PCI_DEVFN(11, 0), TYPE_PCI_BUS, true);
     h->bus = &s->pci_bus;
 
     object_initialize(&s->pci_dev, sizeof(s->pci_dev), TYPE_VERSATILE_PCI_HOST);
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 8eacb8f82fc..f7158fb9573 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -561,11 +561,12 @@ bool pci_bus_is_express(const PCIBus *bus)
 void pci_root_bus_init(PCIBus *bus, size_t bus_size, DeviceState *parent,
                        const char *name,
                        MemoryRegion *mem, MemoryRegion *io,
-                       uint8_t devfn_min, const char *typename)
+                       uint8_t devfn_min, const char *typename,
+                       bool bar_at_addr_0_refused)
 {
     qbus_init(bus, bus_size, typename, parent, name);
     pci_root_bus_internal_init(bus, parent, mem, io, devfn_min,
-                               true);
+                               bar_at_addr_0_refused);
 }
 
 PCIBus *pci_root_bus_new(DeviceState *parent, const char *name,
-- 
2.45.2

