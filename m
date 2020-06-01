Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp3158722lfc;
        Mon, 1 Jun 2020 07:33:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9/sEm3jO7HzyfeOxdxPbNV3BBRJIrWgJ53aTkSErj21LtaxiZWSPG+QzlmsncFzryX7/X
X-Received: by 2002:a25:69d1:: with SMTP id e200mr13610500ybc.127.1591021988740;
        Mon, 01 Jun 2020 07:33:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591021988; cv=none;
        d=google.com; s=arc-20160816;
        b=NTclFM/iJZv29LaeUcyNI7uecsoUU38aF7nESIFwsyRgWOKakObh1I0DhdEudIwwZR
         rpRekseXCGuNM+yhi2QYxeT2LNY4A8FvrA0XKPv8EFYZk4DioRhKTPj46mqRGpTc/XxR
         08Otsu/MMzUKaqRPA3tdvpV7R60At76rqxPmHPyuD17Ib25td3Gi5zWhl9gdTuWLtwP7
         bTmRYuFp2N2cO55kxohyFiYLN+YZ9dVVA7NY07p3EEo6LZSm33RWLo38gpGkh7rDWEZ6
         o7TNpleVXVGvn7hxAImdLYxrQF3s9Sj2wyUYXmDszXntFcrZcIq5ZXpO8mdykZFgF+Dq
         zGbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XKZlJlfX9Xx9NUQxmLIoeX0hJAW9cFlHOUMdlpNFhrg=;
        b=diJaoifqC68YV0dwAsW6OZLJSLterIXhXacWdiGnO3nsKbtiA7R9Xg9lpPbFoFrv7A
         lsm9H07olw2rOMVfLMthCsVeT7D+pCD1JcJcq4cKTKiGsNRn4+RcOVbGLJrf7D9/m9OT
         iD73vKV3e/4dUaDXia/l/QA9fBlJ0xh/2b3XH8ZKVyOfXsYqCJnwJvIn89T3v4GEuLvy
         H6CZKXNjSsh5PxGzqheputIvuAUCWhqQai3USUMkHQCUQx8CnjUrTMinoujDaQ814De/
         knQPPmuPYOphGXsCdeHfCFTL5l5y6jTVo4s0YpOcMhcUvKk0RjEHzx3VNynPDZiBBcQ3
         njvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uSgMGz3l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d186si9196757ybb.470.2020.06.01.07.33.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 07:33:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uSgMGz3l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:52468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jflUy-0007dC-3x
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 10:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jflRi-0002a2-1W; Mon, 01 Jun 2020 10:29:46 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:37239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jflRg-0002cj-CG; Mon, 01 Jun 2020 10:29:45 -0400
Received: by mail-wm1-x342.google.com with SMTP id f5so11595340wmh.2;
 Mon, 01 Jun 2020 07:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XKZlJlfX9Xx9NUQxmLIoeX0hJAW9cFlHOUMdlpNFhrg=;
 b=uSgMGz3lX/zCVeS5N2hb8kMocWnJrBQD0iyV3MRylloSoTofEcoBsiR9QFxYNgbzRV
 qh0sLJ+RiNFsR4CIT2VAg2+CO6sT0D0sdl/G2m5Iu6v6cM/TOGhGbYSr5Xo9r6pD1DWI
 jp1YxowX9bE34rtK9aLe4e++e+a7K+9LrUMvhpkWmyyTfu/5M+ku9VfHOVsT2oZAMGk3
 HGgIDmQRereUYlDCOeFKcsvo8+Dw2V7uUTFwNprKVWgTj5Q3a/RSyWhg2iXQiIdBfQbq
 Z2Of3QPTdmADNKrA5GfKeIcMFruSd5R0KWbHfTnHTzjpjE0TMDAyXSj/8s5aY1AanxyN
 xwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XKZlJlfX9Xx9NUQxmLIoeX0hJAW9cFlHOUMdlpNFhrg=;
 b=nAvCJBYXbqhuG+a8QxDY7/A2Fj5bVMu41f2mQVxT6yF855Ra/ZCfnCnMo75QG3b7NX
 uQC3dvlLYnsv7S8OAaBxJpKpYb6KS1M8LpI9IsMQ66ujBtL8UOv8gGZrmbBcSa4Pw+KG
 mcKF/9vD7F4IXYHZ32Xdi20phqGQBRhnBRxKzgrB6m6se6/hy9GrEe/zFYOvYevPd+En
 Pi7c05FYroI1w2F4DRDUt1Y851Mq5+TXzXXbUTkQgjRDBjsGEw897EYDKQyvHdzp9R4H
 UZl379Cy3qpje2U1G2VoCtvu0zcevtSk2VROG/G81G7QzzbsqXG4sKBHzo1AId3hikpc
 2OhQ==
X-Gm-Message-State: AOAM530MW4r0Z99WWyFjB5SB5OLbQA4USjgC3OyFwuHpS71HCceKggiE
 m8YkdwHBU5dzZwfShlE6q9z9KrlT
X-Received: by 2002:a1c:f006:: with SMTP id a6mr21730886wmb.106.1591021781801; 
 Mon, 01 Jun 2020 07:29:41 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id u12sm6824954wrq.90.2020.06.01.07.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 07:29:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/8] hw/hppa/dino: Use the IEC binary prefix definitions
Date: Mon,  1 Jun 2020 16:29:28 +0200
Message-Id: <20200601142930.29408-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601142930.29408-1-f4bug@amsat.org>
References: <20200601142930.29408-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <rth@twiddle.net>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jB7xzrzKwJzH

IEC binary prefixes ease code review: the unit is explicit.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/hppa/dino.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index 2b1b38c58a..7290f23962 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -542,7 +542,7 @@ PCIBus *dino_init(MemoryRegion *addr_space,
                                 &s->parent_obj.data_mem);
 
     /* Dino PCI bus memory.  */
-    memory_region_init(&s->pci_mem, OBJECT(s), "pci-memory", 1ull << 32);
+    memory_region_init(&s->pci_mem, OBJECT(s), "pci-memory", 4 * GiB);
 
     b = pci_register_root_bus(dev, "pci", dino_set_irq, dino_pci_map_irq, s,
                               &s->pci_mem, get_system_io(),
@@ -561,7 +561,7 @@ PCIBus *dino_init(MemoryRegion *addr_space,
     }
 
     /* Set up PCI view of memory: Bus master address space.  */
-    memory_region_init(&s->bm, OBJECT(s), "bm-dino", 1ull << 32);
+    memory_region_init(&s->bm, OBJECT(s), "bm-dino", 4 * GiB);
     memory_region_init_alias(&s->bm_ram_alias, OBJECT(s),
                              "bm-system", addr_space, 0,
                              0xf0000000 + DINO_MEM_CHUNK_SIZE);
-- 
2.21.3

