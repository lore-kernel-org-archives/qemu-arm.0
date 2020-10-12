Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1041719lfa;
        Mon, 12 Oct 2020 06:20:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYHMMtZicbc/1Pwtq30nCepTIN18/K8N0ll+KvJt6Cf61NGhsS89MQpqzDb2Nvd1MDMV8A
X-Received: by 2002:a25:b00d:: with SMTP id q13mr6165872ybf.157.1602508849015;
        Mon, 12 Oct 2020 06:20:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602508849; cv=none;
        d=google.com; s=arc-20160816;
        b=D6CE70l1j8JjO26i0AJS4HzpI1/cbYlk4EhgJjXF+yYt9Bk+gRUhKascMyS94fQXm7
         SbEDHKbBfMYxiqbWFXdeQ8HxfJs7HUmtyawmCYFYthrvHgsDGSCmnBft0nVpM4wVYikn
         O8fj9lepYG8DM9z4Y5qQmC2bFWHdyZ2xH3y8h5m65NWrjtg7aWBhWTw5G2R48uS9Qc2g
         +FTOK8k79g58wNL9giYT4kbsqtoGPy2tKBsBn5waRE7qxcSOzLRI6Dv8jWmXkl0F4LLp
         GyMcbxAE4O4Vw3uluZT564PJE1OoYE1OW6eSav1l8SaJO1l1mWzF2T3UJEGYdhdtSJ/S
         +mUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5dF+jf9n1DnItLemKMZxZtmjBoHnSoohLjejZPCpzDM=;
        b=1FoKNRo9DbaYTUQ14QcZkDNCv/UdR6vHuHYmEUVX0e5W8gL5ujtsiHUT64aly7YFbc
         3YEFW7Ek6wbDiT/YFxrz27+rCdvaDDEBZZC1W+yJeoMBpy9kW1Dgla5IhDTt/xja4kfB
         H0wc+lqXtS1UN/oU/naB5JTzbhV0Ogd6H/KKjXRh1cEzqIJ14pGqWs8nrf1fizSqcY+B
         elaER+He72Ahg5lTQhPC8bQlOUIHw2FS/dl7Y5ZNGEWnv2KDMjf6wZP92z8fapL0Yc9P
         ggu45AOZy9o/hGnbBCvfzM5W8haKms2jim/uBlxkE8XG1NLvHQNCyQEfvCFU5n6k9mX/
         Frxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Qc0XApVd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8si13974197ybb.88.2020.10.12.06.20.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 06:20:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Qc0XApVd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:48954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRxku-00056Z-7p
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 09:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRxkj-00052n-EJ; Mon, 12 Oct 2020 09:20:37 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:42121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRxkh-0005Mk-TM; Mon, 12 Oct 2020 09:20:37 -0400
Received: by mail-wr1-x443.google.com with SMTP id e18so19153803wrw.9;
 Mon, 12 Oct 2020 06:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5dF+jf9n1DnItLemKMZxZtmjBoHnSoohLjejZPCpzDM=;
 b=Qc0XApVdKVP/lVruFXWfJNtjQXfReFRvr1+4yT68YiQ4PXMXy2VS+Tms8DIHpnd7WY
 3IxqXaVf8NHprI9vBRJwHLg/Ir7knP79xD4PqkjT375/jOfMORusBYzhrZZ5RosRb+QD
 U1SphhdEAsKVfyQdrEqQwYq4OgE0gntIEj6LK1eh4k7kNb5hfU7CyJ6pK2RZ1Iyw+ZIw
 nBGoGO1Ccz+zkGeAo4+vjit+Ec6fFMWX+VWPe5vtNK/oSSBjXyxB2CXWnIIBww7AUabB
 MEfKFTTjlMGn3LsS/v5F1YP0iobEE2UXTGxcQwYK8w7IDDqVUMyWngLVYsE84ipnaVNG
 K2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5dF+jf9n1DnItLemKMZxZtmjBoHnSoohLjejZPCpzDM=;
 b=NJics+O9X/4QF6KwH8cxZIYsWbRPldNDEnk5inU1O7SZJWk/URC/uRms70vBcgGThn
 U2GB1HZOnQghsGmM4jt2DC51ysG3Y4/I7axDb3u1iYVU1xZT1iAOz+L/QGlSdfIWQOAq
 1TkPtJ25xtCCEP5viPRLPy/KWvz7GuNe7vduhiYxy834RH9nAA5egEzmVj+7z+dshh2O
 svzK/fQ2fpuIF9ZpSCuT5q/MFeTpSdqM0LTwGWOhPa9LQszPy+sOM4Yvywv1Ix8srw0Z
 6pVHNdiQUuI90FsimNPSh2um5m6bmQIh3s0UqgPWcATZ7mc+EbjW1CVTQZTjYgc0CDTA
 lg0Q==
X-Gm-Message-State: AOAM533ucadIHpPW+k+UDDesxUMDlKU/XWVK3RyOEJdk4wgNBP8y+dL3
 jYE1DAh0Qw4ZAXGqo9QK7aWLgW6sm50=
X-Received: by 2002:a5d:6744:: with SMTP id l4mr30409135wrw.18.1602508833958; 
 Mon, 12 Oct 2020 06:20:33 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id t83sm13254247wmf.39.2020.10.12.06.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 06:20:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/5] hw/pci-host/versatile: Add the MEMORY_WINDOW_COUNT
 definition
Date: Mon, 12 Oct 2020 15:20:14 +0200
Message-Id: <20201012132017.3423954-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012132017.3423954-1-f4bug@amsat.org>
References: <20201012132017.3423954-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W4V/uY+CH3BS

Note from Peter Maydell:

 The versatile/realview PCI controller has:
   * three memory windows in the system address space
     - those are represented by the pci_mem_window[] array
     - mem_win_size[] holds the size of each window
       (which is fixed but varies between the different
       implementations of this controller on different boards)
     - the device IMAPn registers allow the guest to
       configure the mapping from "a CPU access to an
       address in window n" to "a PCI address on the PCI bus,
       and our imap[] array holds those register values

Use self-explicit MEMORY_WINDOW_COUNT definition instead of
a magic value.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/versatile.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
index b4951023f4e..61465bbbb65 100644
--- a/hw/pci-host/versatile.c
+++ b/hw/pci-host/versatile.c
@@ -72,6 +72,8 @@ enum {
     PCI_VPB_IRQMAP_FORCE_OK,
 };
 
+#define MEMORY_WINDOW_COUNT 3
+
 struct PCIVPBState {
     PCIHostState parent_obj;
 
@@ -86,17 +88,17 @@ struct PCIVPBState {
      * The offsets into pci_mem_space are controlled by the imap registers.
      */
     MemoryRegion pci_io_window;
-    MemoryRegion pci_mem_window[3];
+    MemoryRegion pci_mem_window[MEMORY_WINDOW_COUNT];
     PCIBus pci_bus;
     PCIDevice pci_dev;
 
     /* Constant for life of device: */
     int realview;
-    uint32_t mem_win_size[3];
+    uint32_t mem_win_size[MEMORY_WINDOW_COUNT];
     uint8_t irq_mapping_prop;
 
     /* Variable state: */
-    uint32_t imap[3];
+    uint32_t imap[MEMORY_WINDOW_COUNT];
     uint32_t smap[3];
     uint32_t selfid;
     uint32_t flags;
@@ -130,7 +132,7 @@ static void pci_vpb_update_all_windows(PCIVPBState *s)
     /* Update all alias windows based on the current register state */
     int i;
 
-    for (i = 0; i < 3; i++) {
+    for (i = 0; i < MEMORY_WINDOW_COUNT; i++) {
         pci_vpb_update_window(s, i);
     }
 }
@@ -148,7 +150,7 @@ static const VMStateDescription pci_vpb_vmstate = {
     .minimum_version_id = 1,
     .post_load = pci_vpb_post_load,
     .fields = (VMStateField[]) {
-        VMSTATE_UINT32_ARRAY(imap, PCIVPBState, 3),
+        VMSTATE_UINT32_ARRAY(imap, PCIVPBState, MEMORY_WINDOW_COUNT),
         VMSTATE_UINT32_ARRAY(smap, PCIVPBState, 3),
         VMSTATE_UINT32(selfid, PCIVPBState),
         VMSTATE_UINT32(flags, PCIVPBState),
@@ -370,10 +372,11 @@ static void pci_vpb_set_irq(void *opaque, int irq_num, int level)
 static void pci_vpb_reset(DeviceState *d)
 {
     PCIVPBState *s = PCI_VPB(d);
+    int i;
 
-    s->imap[0] = 0;
-    s->imap[1] = 0;
-    s->imap[2] = 0;
+    for (i = 0; i < MEMORY_WINDOW_COUNT; i++) {
+        s->imap[i] = 0;
+    }
     s->smap[0] = 0;
     s->smap[1] = 0;
     s->smap[2] = 0;
@@ -453,7 +456,7 @@ static void pci_vpb_realize(DeviceState *dev, Error **errp)
      * PCI memory space. The sizes vary from board to board; the base
      * offsets are guest controllable via the IMAP registers.
      */
-    for (i = 0; i < 3; i++) {
+    for (i = 0; i < MEMORY_WINDOW_COUNT; i++) {
         memory_region_init_alias(&s->pci_mem_window[i], OBJECT(s), "pci-vbp-window",
                                  &s->pci_mem_space, 0, s->mem_win_size[i]);
         sysbus_init_mmio(sbd, &s->pci_mem_window[i]);
-- 
2.26.2

