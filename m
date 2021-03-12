Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1506614lfg;
        Fri, 12 Mar 2021 11:03:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUxNIGwnE9fyg4zEJi+pQUkEQGOqwVpsUX4xFS17ouOcvmb8wxym1RWQ3w/9ybN2msFXbk
X-Received: by 2002:a5d:93cc:: with SMTP id j12mr498812ioo.15.1615575780268;
        Fri, 12 Mar 2021 11:03:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615575780; cv=none;
        d=google.com; s=arc-20160816;
        b=rO3oJRQPn/guNyiOqEKRpeZUXcm9+gp2Iurp/S9lMuk4RloxSoQuSZT/IFKxZHabiO
         RLU/O/Oj3w4HYflZoJh+D5LwlCGmDDYw+Vq9JW3sgzJZv+W1VF8ZHWrgq7ppcFhCeTpQ
         EwhaU6pTlv/Rjn5q0EWKidMbOx2QsIyV+WpY6Agd5pXd5bOnQIBfqwiDPLxG/v48Edyj
         Gm3QMI4FqNs3A8CTgb2oX9vhngjPnmdYDkbaOJs2uxZ4Ks5xvCH53NoAL7ui2gElsZ8C
         ddx7FUKAaqz0ATup70FhEYHW0KyfGxQNaT1KxN+9wmZBNI1Kok/tNZHiPw1fLTobVpZv
         JXqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=laYl2bj4VYIIjPf+lFqCAsk0iqOK5GAGgW7ZwBfFasU=;
        b=RztcezuWOB49N3xSlnSLCLq+nr6B5WVxVc1C1O/dP3zGSxpbOJS1N2gW8Q0RWBOKZN
         Ohytvy6uHfPvbBidAhx70WsGrdNmNk+vifAlDeSCfEaMNLmgAT7hb+9UsAoh9yOZVcDP
         B+FpmIxAc1/szhJzQUj3Iv6PYazzfD3Qh03dSwYlg3cPTKyR44OSMR1UW7r5sySCqp7N
         gq9rgfQ5vsh2ccMzJovpYjM8OkUeKN18HlDs68vzUUiwYTD9HKlwj/0U/nKRhM5gpK1r
         VkCHniqQu9NJw8ZZNYSehvBrtQ48injCatxW9s465cUx+L/OjTscj7W0jMWzWepRJH+L
         INPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RdxUL7pm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8si6483688jan.13.2021.03.12.11.03.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Mar 2021 11:03:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RdxUL7pm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:47262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKn3r-0006DU-Ga
	for alex.bennee@linaro.org; Fri, 12 Mar 2021 14:02:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKmXH-00062c-Lq; Fri, 12 Mar 2021 13:29:19 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKmXF-00057R-PV; Fri, 12 Mar 2021 13:29:19 -0500
Received: by mail-wr1-x431.google.com with SMTP id b18so5332227wrn.6;
 Fri, 12 Mar 2021 10:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=laYl2bj4VYIIjPf+lFqCAsk0iqOK5GAGgW7ZwBfFasU=;
 b=RdxUL7pmUjhJexoJR9+F9AovB2IWM6CcUkYI22Kr2XL/srJvIzRw0CHpEsE2KTbcFQ
 BltrpA+YX7Qo13eDpgnyXzSJ9LRzgzg8b80mrNj6lYw0qLJ3cjxvdhEt6ojNsv7TPXEk
 V5fvM0CEHDmGdETP3wL+oNxw4F2Ou9l8VdcmBbBn1Du+MaKxZs/rgP4HFu1HZBAWjYhS
 X/F6sJqc6Z+a3F7TlNv6ucVNArvRBziFF8gYmMyj/UCSY3FniOUFp0WpzQVI0sCtgOBE
 wlCqiTgerL67ElSpoE2pN16+RNfVHGKP1WhBT2T+z6TmDrJ4oZsrx26REibvhvTmpmFY
 rgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=laYl2bj4VYIIjPf+lFqCAsk0iqOK5GAGgW7ZwBfFasU=;
 b=tpfxhp6S/0CrHof01Mm6EgAIn/0SSh/lfUenc7LCSEx/anIErRXGXJurPnUACrtbK2
 tMvB827B9aO7Pof2S7UvxHE8y8i+h5m8ggjKcaRAJIRPx3lIlBuUquaujOE1JUKax3Fv
 mX+pqTRRlzPi6ofGSy+nyBPP8I7bwfjkiRNYiTh3k2xk0O59g7SzYjE2xEQCCxbrfP5D
 448NTcXa2+32dszenC5tpTDVgmeeX4UfNGYTHLy6YFA02QirSEIuHPPYiMd2ReSDeWpy
 IO/aiVsyQv+CdJMC8b2DiIZC2fTK1UAsfOQzqU3owCVslomYXX96RO/isB3+1KuJTpYF
 FqeA==
X-Gm-Message-State: AOAM530TSs+qf92q/J00E9CFgZN6578rXL89xk1gARQvST8qi3ZGmYdt
 Ev8wQfld8XuIxXPcGJm+jbyoKG1vhLc=
X-Received: by 2002:a5d:47ab:: with SMTP id 11mr15448396wrb.153.1615573755317; 
 Fri, 12 Mar 2021 10:29:15 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id f22sm3014694wmc.33.2021.03.12.10.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 10:29:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] hw/pci-host/prep: Do not directly map bus-master region
 onto main bus
Date: Fri, 12 Mar 2021 19:28:50 +0100
Message-Id: <20210312182851.1922972-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210312182851.1922972-1-f4bug@amsat.org>
References: <20210312182851.1922972-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
 Greg Kurz <groug@kaod.org>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tCxly6MUzJ0Y

The raven bus-master memory region is exposed as an AddressSpace.
AddressSpaces root MemoryRegion must not be mapped into other
MemoryRegion, therefore map the region using its alias.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/prep.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
index 00a28c2d18c..6eaf9242bd8 100644
--- a/hw/pci-host/prep.c
+++ b/hw/pci-host/prep.c
@@ -295,8 +295,6 @@ static void raven_pcihost_initfn(Object *obj)
     memory_region_add_subregion(address_space_mem, 0x80000000,
                                 &s->pci_io_non_contiguous);
     memory_region_add_subregion(address_space_mem, 0xc0000000, &s->pci_memory);
-    pci_root_bus_new_inplace(&s->pci_bus, sizeof(s->pci_bus), DEVICE(obj), NULL,
-                             &s->pci_memory, &s->pci_io, 0, TYPE_PCI_BUS);
 
     /* Bus master address space */
     memory_region_init(&s->bm, obj, "bm-raven", 4 * GiB);
@@ -308,6 +306,10 @@ static void raven_pcihost_initfn(Object *obj)
     memory_region_add_subregion(&s->bm, 0         , &s->bm_pci_memory_alias);
     memory_region_add_subregion(&s->bm, 0x80000000, &s->bm_ram_alias);
     address_space_init(&s->bm_as, &s->bm, "raven-bm");
+
+    pci_root_bus_new_inplace(&s->pci_bus, sizeof(s->pci_bus), DEVICE(obj), NULL,
+                             &s->bm_pci_memory_alias, &s->pci_io, 0,
+                             TYPE_PCI_BUS);
     pci_setup_iommu(&s->pci_bus, raven_pcihost_set_iommu, s);
 
     h->bus = &s->pci_bus;
-- 
2.26.2

