Received: by 2002:a05:7022:698c:b0:8b:e46e:3391 with SMTP id cj12csp1661777dlb;
        Thu, 3 Oct 2024 11:57:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUojC6mYcTpezAcRAP0o+Efqfta+Pk0CS5oPMcT4Y0zqaAWNikVmHoxBjhHIFIUVseVyeyygUc7fpSpsg==@linaro.org
X-Google-Smtp-Source: AGHT+IGmJBxbXvZlcFqvtArvF0ORyjNfmvDal289JS7YAVBd8qa8/p0kpaw5eavgUOqCNQCUtGQg
X-Received: by 2002:a05:620a:3184:b0:7a9:c346:382c with SMTP id af79cd13be357-7ae6f44128dmr39912285a.20.1727981874689;
        Thu, 03 Oct 2024 11:57:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727981874; cv=none;
        d=google.com; s=arc-20240605;
        b=OxWtri854THfYO47HRJ3mdTNPodn41Bug9mukFpXTX/PKyGBqBKtSf3vCMbZBy6Vzc
         XlnW77poBRr74zLQZ/TEwFZfN7tg4iZWo+UCeiAZuJ008rQmvXzIz8QfgY/UbRmIVyS2
         XTZkbpWVjjXbGID3z4WaGl30wJ0NEkN8guGRnpzAcoKTwbborkout/QUqxWfnkzGO24D
         4PGPf3m8aeuh/ZuNpJOOxCfCv6IYKfuRviH0TsWPKtjyjUkt+988ubgJpxcGPTfJkpUy
         JI4U7UDQnSA5S00/WoPnyzOAuRMG+lcI6N9971CCqMDIWnC5485RQGw61dRHulrR4ZLM
         8ikg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7NqZgDSIdmym8k9v4wrElx9POiJdcsjS85l4BMSFw2Y=;
        fh=sx4/q6vtOnz3J8J29oZwU4J7yaC/N6ymUdUuUKXij38=;
        b=elKo7mhQ+EMKcijmIrhs2J0C4iHw39gttcImSaPW9BZPmqmbvtdPfP9tAfNfJLw638
         fMktk3zhOG/X9HDRdsDPnMnKNhcfLjYkiWglcpEjueME6JDvnSF9L4j6RFhFgKxKxXwY
         tfml4xTlSlfPPBHWmsFok4cTQyAiOIlT5KhyvhgQV4yfk3dbDhJIqDYO83MHF6yd66hv
         +WwuhU3YU2ZxTMQTAeweZCo8+a1aSX01F56j9htq8UThK1oQg1vLU2L4QOFv8jlMbkUd
         OWVa0au9pv4yuaPtAN+9xi/mIeVGy9h1LLu2/hOkVYnOu7glZ+H+gRTlFSjJNBVDahlV
         FMwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=NSgjaM1e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae6b747643si170404485a.68.2024.10.03.11.57.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2024 11:57:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=NSgjaM1e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swR0r-0000nA-SD; Thu, 03 Oct 2024 14:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1swR0n-0000mN-8U; Thu, 03 Oct 2024 14:57:17 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1swR0l-0003Jz-2U; Thu, 03 Oct 2024 14:57:16 -0400
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2fac63abf63so15452061fa.1; 
 Thu, 03 Oct 2024 11:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727981832; x=1728586632; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7NqZgDSIdmym8k9v4wrElx9POiJdcsjS85l4BMSFw2Y=;
 b=NSgjaM1edaz9MFceqbDunFyA+WRG+jmdv2EvgYiw16oexOHKrK5/0N5jyjomGEG3eq
 DOFEda1ucm0BUBzA7mByyq3Idha9hINZlqs0lsOCWbBcSPsWNskuQSfdEc+b2OVu/dbJ
 CJQzwPj6RRi89g5NbEHCp13v9Rzhy0C4gYRuOwb6WBQOhwOQKq0JSCyeEh/sI18adegu
 nHJbodaNmCGLA7EXhxLRokFhgGZPCsakmxNV8jrtaM9ni/RuBm1ZxfszS3ELwQE1TZGu
 pXtisFxkAbvrq9pk6jZ8cB65p66dzxYfMPibKmc8RmpRGBzJeZTPvkLbaK3CSjWtCu3F
 dhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727981832; x=1728586632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7NqZgDSIdmym8k9v4wrElx9POiJdcsjS85l4BMSFw2Y=;
 b=DDdDC2eI0UwdLjdAnVHxRJHLub6fEx0u56MdT9F2SyFgrcMUTcP830WdoQhy6FaBOR
 hxzFESimcmo4IoQB9Tl//WpQW1WVDKIO3BNrvVSv3jRUGWW1hndBTzpE889RbO1Mb+lS
 FVqC9GR2AbtriZ+9GJUlcpRf7SlW7TPZPAfJwdQLKdbfFwP6oI1iv608+/dDJKvMnwXd
 Ee3/+T6td/NeKxlSIweFHjzbCOMdxFe//GNfJfi6DMIR+z6hkcHPZpP+e+WwGl/Y5Z8P
 ZL2LpYye6OgjU2xjSgJcyMUphDFWD/t7bSd8lwceBA0we+/gIJbsj2LyV6DCFDsFDoXi
 qwSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrv70LIPwtZrbVh+tnUf4U0OsjqKzojwprtiOCkEi33MyaRxDsE6syjspy7gY2+xt52/3j8jnzxg==@nongnu.org
X-Gm-Message-State: AOJu0YzY7ahEstiIUy1wME1aWBQMoMFjYPydDsZ5SFFTyJOO+nl+y/gp
 KjwlPf54YLsi1hVzxwz63+y0H94NVZud/i1xRRd53HQvyt/S6kvYd95Q4bYF
X-Received: by 2002:a2e:be20:0:b0:2f5:2ba:2c99 with SMTP id
 38308e7fff4ca-2faf3c1400cmr307781fa.9.1727981832153; 
 Thu, 03 Oct 2024 11:57:12 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2faecc13b2asm2706361fa.69.2024.10.03.11.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 11:57:11 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
 peter.maydell@linaro.org, edgar.iglesias@amd.com,
 xen-devel@lists.xenproject.org, qemu-arm@nongnu.org
Subject: [PULL v2 5/5] hw/arm: xenpvh: Enable PCI for ARM PVH
Date: Thu,  3 Oct 2024 20:56:54 +0200
Message-ID: <20241003185655.1480819-6-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241003185655.1480819-1-edgar.iglesias@gmail.com>
References: <20241003185655.1480819-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: 5FVwfeXtJ0ST

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Enable PCI support for the ARM Xen PVH machine.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/arm/xen-pvh.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
index 28af3910ea..33f0dd5982 100644
--- a/hw/arm/xen-pvh.c
+++ b/hw/arm/xen-pvh.c
@@ -39,6 +39,16 @@ static void xen_arm_instance_init(Object *obj)
                                          VIRTIO_MMIO_DEV_SIZE };
 }
 
+static void xen_pvh_set_pci_intx_irq(void *opaque, int intx_irq, int level)
+{
+    XenPVHMachineState *s = XEN_PVH_MACHINE(opaque);
+    int irq = s->cfg.pci_intx_irq_base + intx_irq;
+
+    if (xendevicemodel_set_irq_level(xen_dmod, xen_domid, irq, level)) {
+        error_report("xendevicemodel_set_pci_intx_level failed");
+    }
+}
+
 static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
 {
     XenPVHMachineClass *xpc = XEN_PVH_MACHINE_CLASS(oc);
@@ -69,7 +79,11 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
     /* Xen/ARM does not use buffered IOREQs.  */
     xpc->handle_bufioreq = HVM_IOREQSRV_BUFIOREQ_OFF;
 
+    /* PCI INTX delivery.  */
+    xpc->set_pci_intx_irq = xen_pvh_set_pci_intx_irq;
+
     /* List of supported features known to work on PVH ARM.  */
+    xpc->has_pci = true;
     xpc->has_tpm = true;
     xpc->has_virtio_mmio = true;
 
-- 
2.43.0

