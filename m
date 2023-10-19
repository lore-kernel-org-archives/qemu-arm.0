Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp802242ejb;
        Thu, 19 Oct 2023 14:24:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/jc1fQBPZ98KxkkMRiWlLlJ1sQxmlBP4zAfFcCrmtH83r5KhM9tJTUYszwJSy3j6MDPCH
X-Received: by 2002:a25:da4b:0:b0:d9a:61d1:3a85 with SMTP id n72-20020a25da4b000000b00d9a61d13a85mr47488ybf.0.1697750648807;
        Thu, 19 Oct 2023 14:24:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750648; cv=none;
        d=google.com; s=arc-20160816;
        b=l1oILmSwoL0hebl+mLPuA5Vr7an9GpmUZcXYJ1M3pPldrej5cr61VdSufu1Zb+gwA3
         nZ4/zyz1aEgawZeVpNEN5jaG2zyG/noq6+Imzb5UhUYhGW/WEinK/wvw+iA5lhM0uZtK
         SU1tkDoe8TfH/42xFLlMDAx073bljvyD2G5qdqs7kQPP/uWldaexsjqNRC/BPz7NQrxn
         sb+RzURMdc4EKsNOz7QhNvl1GgRJwUnFatuV8WOOav+tBmP6CZw7TzFkwwNIimfhJ/6O
         kp4dh6baTvei9dgvbZjLEZTqfIxQrjIMuADLOcx9A9SUgd8L/C8lk6wSOKblEeF6/iDM
         Rq+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LI6P3mAOEt0J+sULk7AcXOottYXxMcEMeJJN40YsQ7M=;
        fh=JJVrIxA960fi2M8f1oD8ZiXLObaAuT+S4YeQ3hi6v/I=;
        b=itoUsM9BXXVHGphsz94enFa/Boif1W9UjNG7nNklkJIUGXScV1Lrhci65odAo75oiF
         trLc/6Ydbnjtw1BY0uwX9cSG+G2wTscFfVxtAXPHXT6C0n4fbOZV/fsgbIquNyWzJVDa
         SvfIvLWzdwbO9Qorqd9uq7T8rVcmO9XMS6zEE2IXda1NBU2NnhsbXRT3stsGqpjDs81B
         jgD9a4w5e832/TeDQo1csvw9AAIAqS5HvEYglzkbPkdyyFM5DjupKF6/qonrs3662xeo
         YhDue9pBlvcwPNIMMaBBtec8PKaTHXkI/6lmPUfTLs2F6MJQupdrwEwB2eYnLrHGMIHF
         +b2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kQqYdsN1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15-20020a05621405cf00b00656545d4e2dsi357671qvz.530.2023.10.19.14.24.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:24:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kQqYdsN1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtaRG-0007mu-Sk; Thu, 19 Oct 2023 17:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaRE-0007Yb-4h
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 17:20:16 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaR8-0005QO-PR
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 17:20:14 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-32d9552d765so107340f8f.2
 for <qemu-devel@nongnu.org>; Thu, 19 Oct 2023 14:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750409; x=1698355209; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LI6P3mAOEt0J+sULk7AcXOottYXxMcEMeJJN40YsQ7M=;
 b=kQqYdsN1+P7v/CetlfsBLjCcEuit0FbcZ2z27r0ove0HbXjpyg5RxIFN3ibJO/ubw9
 x3VwInzt33O1VyMezJIJrlCF8qjTyuZWjxZtQcMrMIknKQgr/9NTbwPh4TVijOoV3GQG
 XAXmVgb7GRl1feXNwkSMWdMSgxsbpnp187BEjRXF/zZ6ilzQOxipHhKWZVeeb5jqSQGK
 Xm7iBwI7MzzHHnwi0N6eT55FolNNFlEZK1JrHbZklS+rSmaPgp+RE+s8Db/0bxZeq+nT
 NjAfRPYpQfZLBKrsCn8PJOpYomqn8TpLTuVmSrPXKVxDw1hoPw+mgmXK4rGrtr2M3qq9
 57NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750409; x=1698355209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LI6P3mAOEt0J+sULk7AcXOottYXxMcEMeJJN40YsQ7M=;
 b=w2bWmq3/WlHGooWjM6W7xOrhOcCO3yrT7bkQmYua8SzUxfMKPkITe5RKqgDasC/MRL
 22i273/RxyZCzQU+sTp58yxHrhGDceEW05QJz3HEtDbmC1OY/lDA3WkkpRk0KWEdTS38
 DRTwPohDx5cCEA4+Ewjn/5lPhwXx3aineDr4e390KnfpK69KMTtmZN8DZq44JTE/ihNL
 jg2aF4QPqpad+RxdTUrHVX+e91vClJpTtI7di2P8J2xQXWH2ybN9q/K6VzDJzwFQknlA
 7fXx/BsxqYJxATZvDSUWt3bCca4JHBu9hvpDTUYXViLCCHGW8NzFHeW+MUtTcaieUL15
 omLQ==
X-Gm-Message-State: AOJu0YxvtNlD0ZMJb9OkrDxyeluhBIW5irye+8cn/cJ4zkrwIZ9LY9Ng
 QXvgMN3ToT1Sxycy0Jhc+GE6DE7X+SLdAvsstBUM5Q==
X-Received: by 2002:a5d:5592:0:b0:32d:b06c:80b2 with SMTP id
 i18-20020a5d5592000000b0032db06c80b2mr15671wrv.0.1697750409162; 
 Thu, 19 Oct 2023 14:20:09 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a5d6386000000b00327b5ca093dsm208164wru.117.2023.10.19.14.20.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:20:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PULL 17/46] hw/pci-host/sh_pcic: Replace magic value by proper
 definition
Date: Thu, 19 Oct 2023 23:17:42 +0200
Message-ID: <20231019211814.30576-18-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: p2QUfe1F6O43

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Message-Id: <20231012041237.22281-4-philmd@linaro.org>
---
 hw/pci-host/sh_pci.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/sh_pci.c b/hw/pci-host/sh_pci.c
index 580e273d96..4edebced5e 100644
--- a/hw/pci-host/sh_pci.c
+++ b/hw/pci-host/sh_pci.c
@@ -40,7 +40,7 @@ struct SHPCIState {
     PCIHostState parent_obj;
 
     PCIDevice *dev;
-    qemu_irq irq[4];
+    qemu_irq irq[PCI_NUM_PINS];
     MemoryRegion memconfig_p4;
     MemoryRegion memconfig_a7;
     MemoryRegion isa;
@@ -131,7 +131,8 @@ static void sh_pcic_host_realize(DeviceState *dev, Error **errp)
                                      s->irq,
                                      get_system_memory(),
                                      get_system_io(),
-                                     PCI_DEVFN(0, 0), 4, TYPE_PCI_BUS);
+                                     PCI_DEVFN(0, 0), PCI_NUM_PINS,
+                                     TYPE_PCI_BUS);
     memory_region_init_io(&s->memconfig_p4, OBJECT(s), &sh_pci_reg_ops, s,
                           "sh_pci", 0x224);
     memory_region_init_alias(&s->memconfig_a7, OBJECT(s), "sh_pci.2",
-- 
2.41.0

