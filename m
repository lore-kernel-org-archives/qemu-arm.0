Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp608825ejc;
        Tue, 23 Jan 2024 14:25:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGRQF5YQW+/9FZV1QWoqG2wmFQwxsvql51k/jWzSA4xigjQSTCKNtDPopF8lF1fbflK65m
X-Received: by 2002:a37:ad18:0:b0:783:3443:7f55 with SMTP id f24-20020a37ad18000000b0078334437f55mr6295554qkm.122.1706048734857;
        Tue, 23 Jan 2024 14:25:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706048734; cv=none;
        d=google.com; s=arc-20160816;
        b=tqlk8DTikRx1z5qK6V/YV+XMrypXaBdbQHdYSs9hSnocDUiiOdBRCiCDx97U53kR6X
         t/dgB95DJl+PCpdVv0rIkNeC5P4Ub7UiOotj9mUTSxWyoCLo71tQ2EkO4a2cORRKN+xv
         1wm/NcIJ1bRdZMtwheUBJWavNkYwhfrqnC9raQVe13eSLAYqXha0skVexgxiQa7HJd93
         /1h/WoeyGz93sGz3QzYQVTvQsE10S7vPBsiPNT7cw6lqrTPstGAhO91gwOcMbCahhcBu
         Jy9OeWb8rF74BkGd6yousdMfGZWzvAH5hJRDGOORbTeupyidX2BrItbMtgcwue59wbCQ
         CrMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hHwCEbu45pXTY5w3owTg7wqVENSPbbC1Vt4bbpMAXmk=;
        fh=vCRQ4SxBRaw/scGiJ+6DsMj2AC960SBJLYr7612eZsc=;
        b=JNkPNhq4FxkTpz9lCuXXHvK2EeVeQUJy3Ez2Ooe+Xa7hXbjvD0Ur/BqaHqesG2tP/Y
         RbGaXXCdddqJnvo3WA+xb7VIcqFDVZXRF97Deh963+1yNrtg3VSNKHM5unqyLLW0DC7/
         mkXymU4qm7/n/EbN1/9hwE4At+89K1iyo5OWuS0DA3F1nEn7k+68gDchp4ue59blOJlo
         jXe78ST5hNGqOgpd3p2CKiOFpWrXTSpdl5A6QIPN5Tpa9Rhfs9Qne6H07xkFUzux4zek
         NBb/JW8AWtERcVfbi3/q/sksK5qeH38TITmsUnzXdcdvsKAGJuOaJ1fojGT0n0FYQY4Z
         Fi5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HOJUGhsO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n11-20020a05620a222b00b00783792339f5si8479354qkh.50.2024.01.23.14.25.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jan 2024 14:25:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HOJUGhsO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSPCy-0005DS-Rh; Tue, 23 Jan 2024 17:25:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSPCw-0005BR-JV
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 17:25:26 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSPCu-0000kD-Vb
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 17:25:26 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40e80046264so61191725e9.0
 for <qemu-arm@nongnu.org>; Tue, 23 Jan 2024 14:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706048723; x=1706653523; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hHwCEbu45pXTY5w3owTg7wqVENSPbbC1Vt4bbpMAXmk=;
 b=HOJUGhsOxe/2GABOH1pVWch/rp3Vcb/yfxMUHNiUg8gvDd3t8TZqeuhpC6A4f8XI5W
 ggBULe+/6eFXTayWATeBcoMQLEDZbaNUsuxJkltoyKcrwvb9P2YUe52gF/qXsUZEQr5K
 76b6UJzNJwZxJ+4egMMbNCZNYXi4tCp3FlRGoG7W0TlWIIEy6fAopz9Md1RXHL23ZF7H
 YTGb6YNRnWacOtU9G1sw8mNnAGy2VL0DO9jm59/Y42HvuGfmuvLgIGNbtn+Nz2AKwRBU
 /LRxFnxMw4f1zeIf3DV/LICKjLOm330QpzxQtZFfoAYrPc2cyVR2bBlt4N/JuovFWCNk
 lvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706048723; x=1706653523;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hHwCEbu45pXTY5w3owTg7wqVENSPbbC1Vt4bbpMAXmk=;
 b=i6UgApwtaL0TZ2Ix49PRTSr9UP4j0yScX+tnIgpNJBZCNejXfiaQru5i0oMmu/kNwV
 hpJ5UJvnHbabhbOB6KBE69ikS496nrMN1AV6Ww2TdeOEkPbB2ZGtcttLaZCfGDzkAgwt
 pIvCmx29nTdroK9V8zwpT7GCKerIC7DNMWl0JXpnnCLP/fYnp1CztLblOmTxI7JY7i9L
 Ei/6RbkhI5iR+JaP8u77BH1GEsohx8wijCYpGUM37bKpB4CHPD2g0YvDrpWkAeYoYk7P
 IQFK2kDUSKAFpN86QWUTWGHENSYA3hUPTIy0rjLWWdeqnuCAN1yTTB7HTvZL5ocea9/p
 KWaQ==
X-Gm-Message-State: AOJu0YxGOBv69LTYvOoHb7kIZC1K/mOQ6CAnp0Dsswyi5RZZp2voDP4a
 wmI6Z8J7uFMMaTgPW+R+5CkODoq6jcPYX7/vAyLMOckccaA3PoTyR/ywWwf737g=
X-Received: by 2002:a05:600c:5118:b0:40e:a7cf:10e0 with SMTP id
 o24-20020a05600c511800b0040ea7cf10e0mr585083wms.20.1706048723393; 
 Tue, 23 Jan 2024 14:25:23 -0800 (PST)
Received: from m1x-phil.lan ([176.187.194.78])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a170906090d00b00a2c11a438a8sm14779574ejd.25.2024.01.23.14.25.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 23 Jan 2024 14:25:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Rob Herring <robh@kernel.org>,
 Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Gavin Shan <gshan@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 2/6] hw/arm/exynos: Check for CPU types in
 machine_run_board_init()
Date: Tue, 23 Jan 2024 23:25:04 +0100
Message-ID: <20240123222508.13826-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240123222508.13826-1-philmd@linaro.org>
References: <20240123222508.13826-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: i8s0VmFKzFRs

Restrict MachineClass::valid_cpu_types[] to the single
valid CPU type.

Instead of ignoring invalid CPU type requested by the user:

  $ qemu-system-arm -M nuri -cpu cortex-a7 -S -monitor stdio
  QEMU 8.2.50 monitor - type 'help' for more information
  (qemu) info qom-tree
  /machine (nuri-machine)
    /soc (exynos4210)
      /cpu[0] (cortex-a9-arm-cpu)
      ...

We now display an error:

  $ qemu-system-arm -M nuri -cpu cortex-a7
  qemu-system-arm: Invalid CPU model: cortex-a7
  The only valid type is: cortex-a9

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/exynos4_boards.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
index b0e13eb4f0..01c7618a67 100644
--- a/hw/arm/exynos4_boards.c
+++ b/hw/arm/exynos4_boards.c
@@ -34,6 +34,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/boards.h"
 #include "hw/irq.h"
+#include "target/arm/cpu-qom.h"
 
 #define SMDK_LAN9118_BASE_ADDR      0x05000000
 
@@ -150,12 +151,18 @@ static void smdkc210_init(MachineState *machine)
     arm_load_kernel(s->soc.cpu[0], machine, &exynos4_board_binfo);
 }
 
+static const char * const valid_cpu_types[] = {
+    ARM_CPU_TYPE_NAME("cortex-a9"),
+    NULL
+};
+
 static void nuri_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "Samsung NURI board (Exynos4210)";
     mc->init = nuri_init;
+    mc->valid_cpu_types = valid_cpu_types;
     mc->max_cpus = EXYNOS4210_NCPUS;
     mc->min_cpus = EXYNOS4210_NCPUS;
     mc->default_cpus = EXYNOS4210_NCPUS;
@@ -174,6 +181,7 @@ static void smdkc210_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "Samsung SMDKC210 board (Exynos4210)";
     mc->init = smdkc210_init;
+    mc->valid_cpu_types = valid_cpu_types;
     mc->max_cpus = EXYNOS4210_NCPUS;
     mc->min_cpus = EXYNOS4210_NCPUS;
     mc->default_cpus = EXYNOS4210_NCPUS;
-- 
2.41.0

