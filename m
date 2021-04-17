Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1149258lfr;
        Sat, 17 Apr 2021 03:35:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcYpVlDRG3uggErdRpaK1Sc7g7RJOvS1bZhX3apYd6JrQ/uQcGfe6u57f+p5Aa/aH8dNEA
X-Received: by 2002:a05:6638:528:: with SMTP id j8mr8200710jar.108.1618655720548;
        Sat, 17 Apr 2021 03:35:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618655720; cv=none;
        d=google.com; s=arc-20160816;
        b=w6caqYj/MVcR3VvzQTqx7LaIquUmfPvl/TGVR7eyWKeySWac+Rniu327jM5MQK4Uad
         /Sgj2NBKcsFQOVLhI2/KpCI9QuieMhM6MU0iSJXwUsDX6/QCM4sNvfJzTNdXENW0+gt1
         Piqo6mV9BkycE7pNxGuq0fNTCOQsqd2jjCz/en2EMMC0LlOBVMkBoqa1pS2BYR15wmQA
         UhHQNXh81PRbVYiRYJBVbTn4shp8UhG/ZYO84MsfFUALhakkLfG6UIMOR1oFUQ3DRS6e
         Z+BhJJ+cjFajsX/whELeaZjrw+/kkZhJd+TMy1yecfTzO/yC9HuSntWnvKGwq8M1PQD6
         ahEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PdnzmuhsTLw4wdID7+EL8uOV5BaW8a1hwDqQzxQSeJ0=;
        b=rLBoDRdzFKwGonSlq1RMrRLkW30QDbhaPjpJ1bYTcI+oqSAaf/RYdsmZuiSVKq4XTd
         dK1KX98+AxNBpRh1nyibpImA+Hd4CRGzogNiG+jffKJvjtg3PUWfLnmURvY3/ouTxMr+
         a458cfFkK0ojB7PnvNkt/CHUn/WbABWSZD3UeTFvEpiH230PsRVUTd+YiZ0Icz1fLvyA
         Kz+v4VoeX9jtz5fSZfS3tPKR7eX60gxS30cTQyhS1/waAF2/xHGQ2B8wjH6v5Gz2yPVA
         RLPl46kDWHXNuwQSluDOb6bjK360p5X1fQ/aikvWvJbXiXSg8/XsICmQ95muYK+nCLp2
         jk8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hSqDwzKh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z14si10177174ilu.118.2021.04.17.03.35.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Apr 2021 03:35:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hSqDwzKh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:58910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXiIJ-0006dq-Qr
	for alex.bennee@linaro.org; Sat, 17 Apr 2021 06:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXiE8-0001dY-Oj; Sat, 17 Apr 2021 06:31:00 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXiE6-0000tZ-SJ; Sat, 17 Apr 2021 06:31:00 -0400
Received: by mail-wr1-x434.google.com with SMTP id s7so28926148wru.6;
 Sat, 17 Apr 2021 03:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PdnzmuhsTLw4wdID7+EL8uOV5BaW8a1hwDqQzxQSeJ0=;
 b=hSqDwzKh64y708YkvLg3y0px7fNMVmIgZ87o384zCIyj/bvt0rxsvOTBeGJO+FnW7d
 4XRsU76R6wKADEyo/hpfAjNWGRmpddcoTliMsJGJ9VPRZnb95dsw/UgxnvRN+oZ5Sa6n
 Mv4Q0uNd2QdRQ7G31kef6enuBOU4pDX9m9OuDB3mwx+MtigifWDu7Z3w1J17F+9EpK0R
 yU9mB6I9EE4Hi2gxXa3yQWXuknScHBSnBtaDBbjW7znGl3y9oryOp9BTazPX9vAmnPl2
 MWddrw2FqZ1+6mNAIcACwrVX17mdaTRfoemOT2vQMWbu2g5PkRYEZQMycTS11shloP0V
 f+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PdnzmuhsTLw4wdID7+EL8uOV5BaW8a1hwDqQzxQSeJ0=;
 b=k3SE0oCSwqTDlwApd+2sxIos1gDNiZRn07zEzrkzih4YmAcqpDmGsgQC9bq4E3tWgl
 LVu2jg3dLLpfakxaHftADiliPWMn4rVtTIvh/lbeRNquer402blo6PgSVgasgJ5vtopk
 60nDghT9dAng9uufLx4g3CfqzGm/X+GRMRHwwcrgBe6s2S+fxHHpK/+8Cztj3quDO+v9
 zne4WBRPNbzQx4NUFzvoU1QJj9bzxXDhk+rqPAOtb64uaI2ymgS7eydgWkFhx9SlVDFD
 j7rGh4gI7NnOHsEu59SvYqEnwNCfsyTuSpWZcA04wPV7sld0oPib+EVEbo3EbR54zWCM
 3q3g==
X-Gm-Message-State: AOAM531u8lvDTT3m2hO3A2iX0AbnGM0kJAawy0QP6xncwvz/npiDBRMG
 gYDAF9F7AKsUdBjp3PgFf+whkARsc5Q=
X-Received: by 2002:adf:dc8d:: with SMTP id r13mr3654992wrj.339.1618655456749; 
 Sat, 17 Apr 2021 03:30:56 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id n14sm12291808wmk.5.2021.04.17.03.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 03:30:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/11] hw/pci-host/raven: Add PCI_IO_BASE_ADDR definition
Date: Sat, 17 Apr 2021 12:30:22 +0200
Message-Id: <20210417103028.601124-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210417103028.601124-1-f4bug@amsat.org>
References: <20210417103028.601124-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /7HInz+Gyir+

Rather than using the magic 0x80000000 number for the PCI I/O BAR
physical address on the main system bus, use a definition.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/raven.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
index 0a9162fba97..730f31a8931 100644
--- a/hw/pci-host/raven.c
+++ b/hw/pci-host/raven.c
@@ -82,6 +82,8 @@ struct PRePPCIState {
 
 #define BIOS_SIZE (1 * MiB)
 
+#define PCI_IO_BASE_ADDR    0x80000000  /* Physical address on main bus */
+
 static inline uint32_t raven_pci_io_config(hwaddr addr)
 {
     int i;
@@ -159,7 +161,7 @@ static uint64_t raven_io_read(void *opaque, hwaddr addr,
     uint8_t buf[4];
 
     addr = raven_io_address(s, addr);
-    address_space_read(&s->pci_io_as, addr + 0x80000000,
+    address_space_read(&s->pci_io_as, addr + PCI_IO_BASE_ADDR,
                        MEMTXATTRS_UNSPECIFIED, buf, size);
 
     if (size == 1) {
@@ -191,7 +193,7 @@ static void raven_io_write(void *opaque, hwaddr addr,
         g_assert_not_reached();
     }
 
-    address_space_write(&s->pci_io_as, addr + 0x80000000,
+    address_space_write(&s->pci_io_as, addr + PCI_IO_BASE_ADDR,
                         MEMTXATTRS_UNSPECIFIED, buf, size);
 }
 
@@ -294,8 +296,9 @@ static void raven_pcihost_initfn(Object *obj)
     address_space_init(&s->pci_io_as, &s->pci_io, "raven-io");
 
     /* CPU address space */
-    memory_region_add_subregion(address_space_mem, 0x80000000, &s->pci_io);
-    memory_region_add_subregion_overlap(address_space_mem, 0x80000000,
+    memory_region_add_subregion(address_space_mem, PCI_IO_BASE_ADDR,
+                                &s->pci_io);
+    memory_region_add_subregion_overlap(address_space_mem, PCI_IO_BASE_ADDR,
                                         &s->pci_io_non_contiguous, 1);
     memory_region_add_subregion(address_space_mem, 0xc0000000, &s->pci_memory);
     pci_root_bus_new_inplace(&s->pci_bus, sizeof(s->pci_bus), DEVICE(obj), NULL,
-- 
2.26.3

