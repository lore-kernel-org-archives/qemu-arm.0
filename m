Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2100948ejb;
        Mon, 20 Feb 2023 01:17:29 -0800 (PST)
X-Google-Smtp-Source: AK7set9uboEb9eeAoBTr6nu/1LLFma5f15sn/G/FfxwhbWGLtK51TPdICu53s7fxCILihhXWRGJv
X-Received: by 2002:a05:6214:1c09:b0:537:6416:fc2b with SMTP id u9-20020a0562141c0900b005376416fc2bmr2836882qvc.52.1676884649121;
        Mon, 20 Feb 2023 01:17:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676884649; cv=none;
        d=google.com; s=arc-20160816;
        b=PKBJidnI1B6106aFWri+oKBt3cxrbhDSALckf2CVx0kAQjEgBcBDeuABmhY7v9E1D/
         cMngPpnblJWpipHPEVFK31XILFAhb9c6RBb366dAL125h7Mtw/QEtk9n0+lJwnVjnDnT
         LBkLLZkNPpvRvAfKmg7A9inS8o3jmUMQvvKMcaYnVqcR5esO+1/vMQrFQWisfEy+bLXI
         HPB1I3CyjENMtkMmw47t0/y1IMZkaevtyQjWz7tC+WAfI0W/ZSIDvt5Ke/qQWu6R/OlF
         66kAzyItucuxFmfQcT7MCyv+kzpU1A7kplQPkySLSH1gsb4bM4FgVwlo+wSN1yBQwPHY
         3d9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GmYjWCEsiUBPMCRPive1LnJSR/mOAyhsLDC4dgmpYdk=;
        b=WpWuhSrYvMzZtpN6ytE5I/fGfW9/p1GF+u60NLppc25wceIJOYGjjglx5pYCcAKSO3
         tugKo5havf5qL1+NBFqWE6UzKvuLtGJ6WFlXuW2edv642JS/DdRkdItjp6plqtR5uhKO
         ZD0GCvzlSgupqziIUuLW8t9WLzSuPWJl2AmkET+gcZZPw3SZEh/EPu2RtTNuPToMyZ0Z
         DJ8L5NBmiAn1oXdAICSqf/cIwkNgRL8KuEXiwAbFBI5gIs8/2PR1ZzJotT5Od1F9OChm
         5sBfW98otVQokOmW6ueWbhxirgF+QhUO/+7wkxdc37ZLvRhgX8Q0bJz6+UPYgSP31FzF
         M9Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uxV3NkPg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a19-20020a0ce393000000b0056e98badddesi1122359qvl.178.2023.02.20.01.17.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 01:17:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uxV3NkPg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2HN-00086y-Dk; Mon, 20 Feb 2023 04:16:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Ga-0006rJ-PV
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:15:25 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2GY-0003uk-DJ
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:15:24 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 bg37-20020a05600c3ca500b003e21e018039so1198492wmb.3
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GmYjWCEsiUBPMCRPive1LnJSR/mOAyhsLDC4dgmpYdk=;
 b=uxV3NkPgzWR3OQk197UP9a8Jm0cd0Qu8tV4e65IeXsa0ZLY69qO9Zz0lH/dhZeSicL
 AgDsrlYPtGm5MpiER0jzg3AVBuglYvG5002GjTP3CMyQedT7VkMGXLdrfe989oFYliTY
 P1xv82A87ca8aFxYH+e0lbvZ+u8cXFs+aBEebxfXQuTk2zgKvEC6hQ+qmWn4NyzZH3vO
 KfRYAtkZKunZ6mp3bp836zr0s33j8s7Vm4WDVJXi2dWRMOEwbRMSi+lw86FU82NqXqq6
 BYixRaSrvMu8YlIwit9cd3zy9xQyJyFE0du1r8Gk4YO4rhHeqh9YOO5EvzYSsmclCnjz
 1ouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GmYjWCEsiUBPMCRPive1LnJSR/mOAyhsLDC4dgmpYdk=;
 b=LKAR8cDHltRQQzvJjv9lBScaicO5c2B5Ip0wjmwdO52SK3OrSfbE+mKkSnYbK3orjq
 QVbYL9j2HNtbh6wc8gyWDR/xE695YKJVOdgG7P0qXG/EiOg9jTpvd8tJdI3xxBtHwiTq
 p0F7GnFYPUyDmBAicNuUZ0la7dZUO5s4qrO97VtgNm4AwMsQusNoOi1xKvR8iAUUCXix
 3T6cG/Xa6/8nrEOqDapx8AG85dyPut0EsbYxCBSIMoc7pia1aLWQEjMkntzpZPqJ9wgW
 acOqXfLwZBcPSp55dy9treuj5m4Q1Dhnw1tyNUtgmayPcsV4MAfFjwt2+hfUaUUWoZ/T
 JXzg==
X-Gm-Message-State: AO0yUKVlRTJC19Mm0gjwhNsopd1+gwr5l9PoF6QGUz68upVUIgwaMPPX
 ckVicOohhs5IB8t1T8fQRBWXnfyrRqtMmUpN
X-Received: by 2002:a05:600c:2b46:b0:3e0:1ab:cf2a with SMTP id
 e6-20020a05600c2b4600b003e001abcf2amr226474wmf.39.1676884521495; 
 Mon, 20 Feb 2023 01:15:21 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a1c7215000000b003df7b40f99fsm8152060wmc.11.2023.02.20.01.15.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:15:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 16/24] hw/ide: Rename idebus_active_if() ->
 ide_bus_active_if()
Date: Mon, 20 Feb 2023 10:13:50 +0100
Message-Id: <20230220091358.17038-17-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
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
X-TUID: y2jKUj0Rbvvt

idebus_active_if() operates on a IDEBus; rename it as
ide_bus_active_if() to emphasize its first argument
is a IDEBus.

Mechanical change using:

  $ sed -i -e 's/idebus_active_if/ide_bus_active_if/g' \
        $(git grep -l idebus_active_if)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230215112712.23110-16-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/ide/core.c             | 18 +++++++++---------
 hw/ide/macio.c            |  8 ++++----
 hw/ide/microdrive.c       |  4 ++--
 hw/ide/pci.c              |  2 +-
 include/hw/ide/internal.h |  2 +-
 5 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index fd2215c506..2d034731cf 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -1265,7 +1265,7 @@ const char *ATA_IOPORT_WR_lookup[ATA_IOPORT_WR_NUM_REGISTERS] = {
 void ide_ioport_write(void *opaque, uint32_t addr, uint32_t val)
 {
     IDEBus *bus = opaque;
-    IDEState *s = idebus_active_if(bus);
+    IDEState *s = ide_bus_active_if(bus);
     int reg_num = addr & 7;
 
     trace_ide_ioport_write(addr, ATA_IOPORT_WR_lookup[reg_num], val, bus, s);
@@ -2128,7 +2128,7 @@ void ide_bus_exec_cmd(IDEBus *bus, uint32_t val)
     IDEState *s;
     bool complete;
 
-    s = idebus_active_if(bus);
+    s = ide_bus_active_if(bus);
     trace_ide_bus_exec_cmd(bus, s, val);
 
     /* ignore commands to non existent slave */
@@ -2195,7 +2195,7 @@ const char *ATA_IOPORT_RR_lookup[ATA_IOPORT_RR_NUM_REGISTERS] = {
 uint32_t ide_ioport_read(void *opaque, uint32_t addr)
 {
     IDEBus *bus = opaque;
-    IDEState *s = idebus_active_if(bus);
+    IDEState *s = ide_bus_active_if(bus);
     uint32_t reg_num;
     int ret, hob;
 
@@ -2281,7 +2281,7 @@ uint32_t ide_ioport_read(void *opaque, uint32_t addr)
 uint32_t ide_status_read(void *opaque, uint32_t addr)
 {
     IDEBus *bus = opaque;
-    IDEState *s = idebus_active_if(bus);
+    IDEState *s = ide_bus_active_if(bus);
     int ret;
 
     if ((!bus->ifs[0].blk && !bus->ifs[1].blk) ||
@@ -2370,7 +2370,7 @@ static bool ide_is_pio_out(IDEState *s)
 void ide_data_writew(void *opaque, uint32_t addr, uint32_t val)
 {
     IDEBus *bus = opaque;
-    IDEState *s = idebus_active_if(bus);
+    IDEState *s = ide_bus_active_if(bus);
     uint8_t *p;
 
     trace_ide_data_writew(addr, val, bus, s);
@@ -2406,7 +2406,7 @@ void ide_data_writew(void *opaque, uint32_t addr, uint32_t val)
 uint32_t ide_data_readw(void *opaque, uint32_t addr)
 {
     IDEBus *bus = opaque;
-    IDEState *s = idebus_active_if(bus);
+    IDEState *s = ide_bus_active_if(bus);
     uint8_t *p;
     int ret;
 
@@ -2444,7 +2444,7 @@ uint32_t ide_data_readw(void *opaque, uint32_t addr)
 void ide_data_writel(void *opaque, uint32_t addr, uint32_t val)
 {
     IDEBus *bus = opaque;
-    IDEState *s = idebus_active_if(bus);
+    IDEState *s = ide_bus_active_if(bus);
     uint8_t *p;
 
     trace_ide_data_writel(addr, val, bus, s);
@@ -2472,7 +2472,7 @@ void ide_data_writel(void *opaque, uint32_t addr, uint32_t val)
 uint32_t ide_data_readl(void *opaque, uint32_t addr)
 {
     IDEBus *bus = opaque;
-    IDEState *s = idebus_active_if(bus);
+    IDEState *s = ide_bus_active_if(bus);
     uint8_t *p;
     int ret;
 
@@ -2711,7 +2711,7 @@ static void ide_restart_bh(void *opaque)
         return;
     }
 
-    s = idebus_active_if(bus);
+    s = ide_bus_active_if(bus);
     is_read = (bus->error_status & IDE_RETRY_READ) != 0;
 
     /* The error status must be cleared before resubmitting the request: The
diff --git a/hw/ide/macio.c b/hw/ide/macio.c
index 6be29e44bc..dca1cc9efc 100644
--- a/hw/ide/macio.c
+++ b/hw/ide/macio.c
@@ -60,7 +60,7 @@ static void pmac_ide_atapi_transfer_cb(void *opaque, int ret)
 {
     DBDMA_io *io = opaque;
     MACIOIDEState *m = io->opaque;
-    IDEState *s = idebus_active_if(&m->bus);
+    IDEState *s = ide_bus_active_if(&m->bus);
     int64_t offset;
 
     MACIO_DPRINTF("pmac_ide_atapi_transfer_cb\n");
@@ -136,7 +136,7 @@ static void pmac_ide_transfer_cb(void *opaque, int ret)
 {
     DBDMA_io *io = opaque;
     MACIOIDEState *m = io->opaque;
-    IDEState *s = idebus_active_if(&m->bus);
+    IDEState *s = ide_bus_active_if(&m->bus);
     int64_t offset;
 
     MACIO_DPRINTF("pmac_ide_transfer_cb\n");
@@ -220,7 +220,7 @@ done:
 static void pmac_ide_transfer(DBDMA_io *io)
 {
     MACIOIDEState *m = io->opaque;
-    IDEState *s = idebus_active_if(&m->bus);
+    IDEState *s = ide_bus_active_if(&m->bus);
 
     MACIO_DPRINTF("\n");
 
@@ -251,7 +251,7 @@ static void pmac_ide_transfer(DBDMA_io *io)
 static void pmac_ide_flush(DBDMA_io *io)
 {
     MACIOIDEState *m = io->opaque;
-    IDEState *s = idebus_active_if(&m->bus);
+    IDEState *s = ide_bus_active_if(&m->bus);
 
     if (s->bus->dma->aiocb) {
         blk_drain(s->blk);
diff --git a/hw/ide/microdrive.c b/hw/ide/microdrive.c
index 84452ae4ef..f1017f7333 100644
--- a/hw/ide/microdrive.c
+++ b/hw/ide/microdrive.c
@@ -250,14 +250,14 @@ static uint16_t md_common_read(PCMCIACardState *card, uint32_t at)
     case 0xd:	/* Error */
         return ide_ioport_read(&s->bus, 0x1);
     case 0xe:	/* Alternate Status */
-        ifs = idebus_active_if(&s->bus);
+        ifs = ide_bus_active_if(&s->bus);
         if (ifs->blk) {
             return ifs->status;
         } else {
             return 0;
         }
     case 0xf:	/* Device Address */
-        ifs = idebus_active_if(&s->bus);
+        ifs = ide_bus_active_if(&s->bus);
         return 0xc2 | ((~ifs->select << 2) & 0x3c);
     default:
         return ide_ioport_read(&s->bus, at);
diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index 4223f5e64d..2ddcb49b27 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -296,7 +296,7 @@ void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val)
     /* Ignore writes to SSBM if it keeps the old value */
     if ((val & BM_CMD_START) != (bm->cmd & BM_CMD_START)) {
         if (!(val & BM_CMD_START)) {
-            ide_cancel_dma_sync(idebus_active_if(bm->bus));
+            ide_cancel_dma_sync(ide_bus_active_if(bm->bus));
             bm->status &= ~BM_STATUS_DMAING;
         } else {
             bm->cur_addr = bm->addr;
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index c687282a78..c2b794150f 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -566,7 +566,7 @@ static inline uint8_t ide_dma_cmd_to_retry(uint8_t dma_cmd)
     return 0;
 }
 
-static inline IDEState *idebus_active_if(IDEBus *bus)
+static inline IDEState *ide_bus_active_if(IDEBus *bus)
 {
     return bus->ifs + bus->unit;
 }
-- 
2.38.1

