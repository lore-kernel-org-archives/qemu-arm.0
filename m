Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp1284457eja;
        Fri, 3 Nov 2023 11:56:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvLC0OAPLm+i0FC9l1/mAScnKaSeLhCCzHhvS3v8b6wfSrdGjMd2XfdAH0HcajTZr/kCsM
X-Received: by 2002:a05:620a:6585:b0:778:958f:4c22 with SMTP id qd5-20020a05620a658500b00778958f4c22mr19528578qkn.45.1699037777262;
        Fri, 03 Nov 2023 11:56:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1699037777; cv=none;
        d=google.com; s=arc-20160816;
        b=WmR+rLWxxZNMmiisScuKKe6R4mHfnvXu8tvPAC45x/MM+pRFNu6eQOro5xDDMwTe6j
         ITFaoCGwX1z2v+fBjTavhNGFLnUyH5FWkOT9GTTs7oSeyTxlISRu6PAp/Oifbll7fBVX
         f0PcFvKQDABSlRzxluUBYn0PUgmO6+nG4kd5LLGvBrxNeiFSY/wpQunHQPdaiZ0eePfx
         TK+GCcswDA5WHfrfD0fpSu0bfmU2cN8uALR6a67hRD96e/oOwc+6h1G03NhXXjSj4B5X
         wvFDtzfGokHEjpt56A097Y4opJQKxx+8bLfVEcXdClf+eu9X5qrX/3dg5rTU4P4U3ISs
         lBbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=R/Qz4BRA1gjPk+dEXh6h6hhbMDtVGzlPlkIywNyzTUM=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=Tx6SIm9NbYlazvlxfuBMAkPYCtbJs66sClQEuwTXfAwi7JVeVTiY6U7eVkldhQ6C7Q
         hBygLwRWOX1OkIm5fnqYpwdw83V4GkUaZ1SOGRsNteavi87WWgSochC8d32AZXPE+ImV
         Q6Rpw9IUYyt89efoRxsfme7AcIGCy4z3RcbMnreOz7U6eGFwugwlb1/RoNUaFp32vGli
         /OJ8cWvbA3X2jRXcpO8NXtqHaXMvKtpYLzlZUOvwOfKOyTqhGQ/7fa39CCZ/vLFUE99q
         gScxZ9kurSLHU/4UsgryqY0xsvn5Iltx9PDpgh64JA0CDbWdhTdtjVhrqhFlMM77ICiS
         8JIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b0QBjV9f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eb5-20020a05620a480500b0076dbe1d6084si2011698qkb.675.2023.11.03.11.56.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Nov 2023 11:56:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b0QBjV9f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyzL1-0000rk-2Y; Fri, 03 Nov 2023 14:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qyzKz-0000rE-G8
 for qemu-arm@nongnu.org; Fri, 03 Nov 2023 14:56:09 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qyzKw-0005Df-W3
 for qemu-arm@nongnu.org; Fri, 03 Nov 2023 14:56:09 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5094727fa67so3130368e87.3
 for <qemu-arm@nongnu.org>; Fri, 03 Nov 2023 11:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699037764; x=1699642564; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=R/Qz4BRA1gjPk+dEXh6h6hhbMDtVGzlPlkIywNyzTUM=;
 b=b0QBjV9fl629eql9D8Q4r86RAds2U2r1OZWtw9mADcIyqIR/5dz4gTfPo4H9cYTzm6
 cxPE9F6Tvdb5V0G0PupF24IaLjvtvON3R5Q+SYGT3vQ60oqmItr11TJEcE7IPpsW+baI
 t8HlvPRTnijhL3MI7tHBBBGLV6L3QLvN9iBFLnTb4jJSheVQvF3nsf1CZw7AR2FmCGIi
 EJv/7QLjx0gJgdgkyrbl3LOOK04l0lu7NEKYnmpg2PE3wuw96zxrcN8jhdXKNyJluZFV
 +WykOa68h5+sTJdyhgkoQO9qmytvij3OEI+ZyEhtgD+t11c0bOjR6nYEgYHkgwI4d3tx
 5X0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699037764; x=1699642564;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R/Qz4BRA1gjPk+dEXh6h6hhbMDtVGzlPlkIywNyzTUM=;
 b=nx4QSTC0DpmLatTIaUX/RUa6GjheRO3mSqHgMtUZpx3FSd3VhbZFd5BupYIIRZ433d
 ft75VjXkIAW2JbIFwPVnG8GXW+POmyXFhmU1PvXCa5VDgP84oh232kfjBFewZaDAki1k
 LE3NERyLlksED/9/EN75Flb/9JS6nc+/6rBqsva/7A9OcQDrQlifNJ4wpM6QP30Xpyvn
 AeEZQy+qKnxesnfwpg69LGAvjCR3n16q8ZvAVUoQGqRNfrY6aImfnQLGEYy+pFvcBT/P
 0NEQx+PjujS3zFyh/g5M+Se+cR4UPzb+6T5cJUkzNW60/dZ60+QOOa4bcQq8ncpsj9rw
 6SQA==
X-Gm-Message-State: AOJu0Yz8hn4FQq9/Lan8vS6SQKAynwFCO3yiXLE2SWF3vCvUQUADPIlp
 CHqmDx51N3cuvIZ4PeMWmBb23pKTSU+pPIqQ2yg=
X-Received: by 2002:a05:6512:1081:b0:500:daf6:3898 with SMTP id
 j1-20020a056512108100b00500daf63898mr18623958lfg.26.1699037764476; 
 Fri, 03 Nov 2023 11:56:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q2-20020adff782000000b0032179c4a46dsm2483584wrp.100.2023.11.03.11.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 11:56:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/vexpress-a9: Remove useless mapping of RAM at address 0
Date: Fri,  3 Nov 2023 18:56:02 +0000
Message-Id: <20231103185602.875849-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: qHsID9f9mH6W

On the vexpress-a9 board we try to map both RAM and flash to address 0,
as seen in "info mtree":

address-space: memory
  0000000000000000-ffffffffffffffff (prio 0, i/o): system
    0000000000000000-0000000003ffffff (prio 0, romd): alias vexpress.flashalias @vexpress.flash0 0000000000000000-0000000003ffffff
    0000000000000000-0000000003ffffff (prio 0, ram): alias vexpress.lowmem @vexpress.highmem 0000000000000000-0000000003ffffff
    0000000010000000-0000000010000fff (prio 0, i/o): arm-sysctl
    0000000010004000-0000000010004fff (prio 0, i/o): pl041
(etc)

The flash "wins" and the RAM mapping is useless (but also harmless).

This happened as a result of commit 6ec1588e in 2014, which changed
"we always map the RAM to the low addresses for vexpress-a9" to "we
always map flash in the low addresses", but forgot to stop mapping
the RAM.

In real hardware, this low part of memory is remappable, both at
runtime by the guest writing to a control register, and configurably
as to what you get out of reset -- you can have the first flash
device, or the second, or the DDR2 RAM, or the external AXI bus
(which for QEMU means "nothing there").  In an ideal world we would
support that remapping both at runtime and via a machine property to
select the out-of-reset behaviour.

Pending anybody caring enough to implement the full remapping
behaviour:
 * remove the useless mapped-but-inaccessible lowram MR
 * document that QEMU doesn't support remapping of low memory

Fixes: 6ec1588e ("hw/arm/vexpress: Alias NOR flash at 0 for vexpress-a9")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1761
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/vexpress.rst |  3 +++
 hw/arm/vexpress.c            | 14 +++-----------
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/docs/system/arm/vexpress.rst b/docs/system/arm/vexpress.rst
index 3e3839e9231..38f29c73e71 100644
--- a/docs/system/arm/vexpress.rst
+++ b/docs/system/arm/vexpress.rst
@@ -58,6 +58,9 @@ Other differences between the hardware and the QEMU model:
   ``vexpress-a15``, and have IRQs from 40 upwards. If a dtb is
   provided on the command line then QEMU will edit it to include
   suitable entries describing these transports for the guest.
+- QEMU does not currently support either dynamic or static remapping
+  of the area of memory at address 0: it is always mapped to alias
+  the first flash bank
 
 Booting a Linux kernel
 ----------------------
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 8ff37f52ca1..c08ea34e924 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -177,7 +177,6 @@ struct VexpressMachineState {
     MemoryRegion vram;
     MemoryRegion sram;
     MemoryRegion flashalias;
-    MemoryRegion lowram;
     MemoryRegion a15sram;
     bool secure;
     bool virt;
@@ -276,7 +275,6 @@ static void a9_daughterboard_init(VexpressMachineState *vms,
 {
     MachineState *machine = MACHINE(vms);
     MemoryRegion *sysmem = get_system_memory();
-    ram_addr_t low_ram_size;
 
     if (ram_size > 0x40000000) {
         /* 1GB is the maximum the address space permits */
@@ -284,17 +282,11 @@ static void a9_daughterboard_init(VexpressMachineState *vms,
         exit(1);
     }
 
-    low_ram_size = ram_size;
-    if (low_ram_size > 0x4000000) {
-        low_ram_size = 0x4000000;
-    }
-    /* RAM is from 0x60000000 upwards. The bottom 64MB of the
+    /*
+     * RAM is from 0x60000000 upwards. The bottom 64MB of the
      * address space should in theory be remappable to various
-     * things including ROM or RAM; we always map the RAM there.
+     * things including ROM or RAM; we always map the flash there.
      */
-    memory_region_init_alias(&vms->lowram, NULL, "vexpress.lowmem",
-                             machine->ram, 0, low_ram_size);
-    memory_region_add_subregion(sysmem, 0x0, &vms->lowram);
     memory_region_add_subregion(sysmem, 0x60000000, machine->ram);
 
     /* 0x1e000000 A9MPCore (SCU) private memory region */
-- 
2.34.1

