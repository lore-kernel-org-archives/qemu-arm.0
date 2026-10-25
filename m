Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA83F606A31A
	for <qemu-arm@archiver.kernel.org>; Sun, 25 Oct 2026 20:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D2T8Anmg
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xL58G-0006Ln-8t; Sun, 25 Oct 2026 16:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyan2254650260@gmail.com>)
 id 1xL3sW-0004Jr-Dr
 for qemu-arm@nongnu.org; Sun, 25 Oct 2026 15:27:36 -0400
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyan2254650260@gmail.com>)
 id 1xL3sU-0007kH-VA
 for qemu-arm@nongnu.org; Sun, 25 Oct 2026 15:27:36 -0400
Received: by mail-dy1-x1332.google.com with SMTP id
 5a478bee46e88-35943f55c06so3207067eec.0
 for <qemu-arm@nongnu.org>; Sun, 25 Oct 2026 12:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792956452; x=1793561252; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IMFmqSpgHb1yeNp8ZkdpzzZBo11PJ/kZtax7b77En5A=;
 b=D2T8AnmgwjpYfaSjZ8GqpbBshKb75qf8/LWIJJw8dblFyDWjl9nDVv2cPbqfIxgIvZ
 N3Ppjj9ztwzpF+rFxT04e9sbij+o+1NpC6Im7kqC5b0CgeZT7Lav8d0VhQx0P8MGy0Ln
 lWo8pSVSBIsHpM5IABTZUrs0Y2ZzloZCai0eiqHZ1iv4I2mXIi3dpQRDyYhjitj9Rvlb
 Y4R7KNdnYwODfesY4k0B0tsuUec1p+XePZ3i+8QrgIJQiv/YQtTFYSVowbrTkHvDOFWn
 Z45Wc/fDzeUTJNB75ljmcnp3pV4wHeNfkxPC75KxqxuOErrJ+0U6BuAHBvjoLcjjEnjG
 QLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792956452; x=1793561252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=IMFmqSpgHb1yeNp8ZkdpzzZBo11PJ/kZtax7b77En5A=;
 b=bgBMWyNg1tXVB181RuM+exO1Yvb2fGEgkUxEJE5sE2YxoEuF8/V4YEG07Nr1y3yKKz
 b5+89F/6rDYw1vbymbH8SWHdVjdlN6y4FHmwoE9zG+DeWYTqnP3YsXC/VdxnfpIdLlyO
 Sxs/JmtcsF9pkfZ+iGVoe+yE1H/4pNG7tRSX4Nx69XQjVVjSRtFzEG1UczLAN38glE6Y
 n4aBJpYawkN6XZy6DlKz4BokpnvWmVsv9SlCtUkVbEkeKpM+VRev9Nufruk9xTqkU6JQ
 5k4kkZK1Yr4vdOBDU2e4FSdYngjhSVunsRWPqIUCaEczIJIN64JFxRdITMp9kCpbjN+S
 Gshg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzj+Act45LqwiQSzxOSsO0LiIOqWOtl3GSqW8etc0Ch1OFBP0FCCAVoX7mwyrs1ZSx4PkoNE6c0xA==@nongnu.org
X-Gm-Message-State: AFq9FYKuhM2Y5ElrYWU3YLXzxVurRluw3SZSZCqMl2EjaNAWPwfcZhM5
 mZ0HoMjUsHstm/wMYJ31mU2sNwfGrjf3UCeaFsHAhTvHx/0znIEPe3EW
X-Gm-Gg: AYBFou11KEtRRUxSwuBLvKEq19rdvmzVcCARHtB7jjyKSeBrjgvk7IkZWpKqq/4Qu3K
 6zh/xR0hzCTH03w5opXf9AJxV/aLt/hrGZWdea6mbkUa8lQkPghhMDVpNligh/mpjdSzwkHhYa9
 OSQ8DkxywY0Lke2QhVnSDmtSj+ATyz5W1gUaoU1R2sustqJryjlLKEmdkMFHtpSllT3C/TGMtaD
 CrxS2+258ArDtYoNPE/VTdWL/4jFksUfaCussW3+awMiGMWi5ZgkCgl3vd+sb6iaOMIAClCZuPH
 q1IOlyxsoQ+gJQF+MrIPLWCgnWcmeuIz+UtQvKQq8XzRSfOHIZ6YhrJNxesCCWVu0ZnDO6IIPwC
 Er9C7bhy7p1x7UBM68Zqbj7IfEUu65yE3dQ26yjY7WMJ5oFU2Ni0FsVSfvzZqXrEnl43BJt0IdN
 cULifZdX0nnoXr5H4E3kD9r8AtPeLVZqqjGHx2p9msNLLKL+n4nvHSqA05G2aFiJU/BYoFgOCYS
 3cZkPow8q3fvXFJ5OTrc2eK07gg2pFgcRZwm2H6HRLhM8s8JZplP3GMuBfM4cVROOz2PCkVendD
X-Received: by 2002:a05:7300:f582:b0:360:aeee:9b8a with SMTP id
 5a478bee46e88-369e8483665mr6899132eec.8.1792956451852; 
 Sun, 25 Oct 2026 12:27:31 -0700 (PDT)
Received: from AERO17.taila7786d.ts.net ([152.175.65.31])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369e8daa3a8sm23226027eec.16.2026.10.25.12.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2026 12:27:31 -0700 (PDT)
From: Pufan Jin <cyan2254650260@gmail.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH 2/3] hw/microblaze/petalogix_s3adsp1800: Connect xlnx-axi-gpio
Date: Mon, 26 Oct 2026 03:27:15 +0800
Message-ID: <20261025192716.239589-3-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192716.239589-1-cyan2254650260@gmail.com>
References: <20261025192716.239589-1-cyan2254650260@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1332;
 envelope-from=cyan2254650260@gmail.com; helo=mail-dy1-x1332.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 25 Oct 2026 16:47:53 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Connect the Xilinx AXI GPIO device to the petalogix-s3adsp1800 machine,
replacing the unimplemented device stub at 0x81400000 and wiring IRQ 2
to the interrupt controller as specified in the reference DTS.

Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
---
 hw/microblaze/Kconfig                    | 1 +
 hw/microblaze/petalogix_s3adsp1800_mmu.c | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/microblaze/Kconfig b/hw/microblaze/Kconfig
index 72d8072f76..7f67ed3469 100644
--- a/hw/microblaze/Kconfig
+++ b/hw/microblaze/Kconfig
@@ -6,6 +6,7 @@ config PETALOGIX_S3ADSP1800
     select XILINX
     select XILINX_AXI
     select XILINX_ETHLITE
+    select XLNX_AXI_GPIO
     select UNIMP
 
 config PETALOGIX_ML605
diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index c5f6431900..9066fd795a 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -36,6 +36,7 @@
 #include "hw/misc/unimp.h"
 #include "system/address-spaces.h"
 #include "hw/char/xilinx_uartlite.h"
+#include "hw/gpio/xlnx-axi-gpio.h"
 
 #include "boot.h"
 
@@ -54,6 +55,7 @@
 
 #define TIMER_IRQ           0
 #define ETHLITE_IRQ         1
+#define GPIO_IRQ            2
 #define UARTLITE_IRQ        3
 
 #define TYPE_PETALOGIX_S3ADSP1800_MACHINE \
@@ -144,7 +146,11 @@ petalogix_s3adsp1800_init(MachineState *machine)
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, ETHLITE_BASEADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq[ETHLITE_IRQ]);
 
-    create_unimplemented_device("xps_gpio", GPIO_BASEADDR, 0x10000);
+    dev = qdev_new(TYPE_XLNX_AXI_GPIO);
+    qdev_prop_set_enum(dev, "endianness", endianness);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, GPIO_BASEADDR);
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq[GPIO_IRQ]);
 
     microblaze_load_kernel(cpu, endianness == ENDIAN_MODE_LITTLE, ddr_base,
                            ram_size, machine->initrd_filename,
-- 
2.56.0


