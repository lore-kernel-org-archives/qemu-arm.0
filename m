Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2581126lfo;
        Sun, 31 Jan 2021 03:13:27 -0800 (PST)
X-Received: by 2002:a05:600c:4f07:: with SMTP id l7mr5450649wmq.111.1612091607431;
        Sun, 31 Jan 2021 03:13:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612091607; cv=none;
        d=google.com; s=arc-20160816;
        b=LaDHrpUc84GlisoMQt/MF4Y+CF5At2di0ekpYKaLPEF9wY9D5gsf6752xhx7nroo7n
         C7/hKLnQbksN0UgiOucxRyov+Ugh5FyslX5t3BwJjnq+HZN6A5NdGmWsjYpoh5rlnyso
         OaWhHltvBDwL2NiQTVSrMxK8Z7D6Olm3wOZiaMN4u+0yebve4dznqjCkBKMEplAxjcUH
         Ff4/T/SoBqOb0rEtvQZMhd/7jVC0HU4U6kgKG1jB8Ut2oYZKr5E5uRM1YLHQIG4YBRsU
         rfNOAKKCtWu6gO77vF8jEzpxolsASAuEQ/qcr5V2C9voESwHW6AkYwaaV/o/iQAA/ybg
         Fx+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=tDvXzkWLMFL+IUxoP4BeNAznJqzRaOp5XiuRopnwJGs=;
        b=QO+I+0MYoBrEi3yyhHkbS4xYa+nfQFo/WUPjFM1WJxbKgsckqfCdiUZhM0S1CDOpL6
         8ETeDP9sWcpv58P8zBr6sWkczpDT+1yC7st6G0NPXqFzGES1Wn35X5dQ52cvoiYeZHVn
         kWL7N3eQTo2t1RglNxMGIcB76juuSYq3T2AHGhCRghrpHKK/A06OcZtQVwRMVBDPDU7c
         94z4lBs5yXvBHt8NrJ8ifFnthIl/729FWRa8M568d12MW3BhBoOsHg0t4oKksdaJcpkY
         CCOyJH3AdDWH8FLiXacnvm6iyPDOaUFAUERziowBF6DV6rpnlcPKW22CFMalyiZ/rScZ
         epAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=RG9J4C21;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c9sor7078109wru.59.2021.01.31.03.13.27
        (Google Transport Security);
        Sun, 31 Jan 2021 03:13:27 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=RG9J4C21;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tDvXzkWLMFL+IUxoP4BeNAznJqzRaOp5XiuRopnwJGs=;
        b=RG9J4C21ulcBnb4iIf0uVpWt6zxp4h5tZBQGk6ttudggjuvc5rKyljqLRooHATvj+F
         Tin+5GAYqkQxUYw9EZCmA4jpVDlvUJUL/qhk5UYEZrWcjlo7mExMjnFxfypPa+jL1rxY
         V3hmqc37+kMAm9pDOnx8oW7o6JazRHiuC8MSGL7vJDLhDfFEXjGlakRvkHNDbtX0Lwic
         r02tOTqcndqQBDyGF/tuIgu8b9Ejny0K5jCi7XlpAjl1T/gH7ttxKgkemt2WD3TtpDNb
         6UwPOn5Shf4y+xk2RHm7fhuw2wfCl8RTDeZmjdoC4F/82I5hesRlJUJxDvogNztJ01Wx
         Jt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=tDvXzkWLMFL+IUxoP4BeNAznJqzRaOp5XiuRopnwJGs=;
        b=sTlNMr1vTIV7+cQUmBRL4/ca0EKVks91JBjW851NOt7zJm7fKga7GaYyLGo2a3RUMl
         jAN8sLe99/6mQMTcRilWOeiqouNe6dpkXXaMkM8+D5qD+uvI9Fz5ed+TtiPKww6diQa6
         QVUCMOxVBFi5fw4VaIZfmFbxCpmvn3bZhD+2y/D6h7vFlt9iYNPXaJbYT8yXhSRenkYD
         9msKCkP8nE0OeVKdTKZUbUrOlwSRs0hJrfSeL7+X/1MMgYBjq0asJs80vot2WRqptYvo
         b1GXQRNjd0xUDEaupTn66ZRlDthzRoroHyAI3TsxAeWreN+a2g+873UFT+tyX9BrlCL5
         j6Cg==
X-Gm-Message-State: AOAM530mwxEsR9gVNiy9r+rgieFUpmTYlbPch7nOfLPGrV+dk8NTJbVY
	e7ADHvn2eV+vp69y7bqD+D0=
X-Google-Smtp-Source: ABdhPJwznvVVdPq4EYOauNSJGoo7Z+nlh8KGHlt6gDiDD/E4ojM4kgoWmoAglfTmwXFeXP0sQq8yGQ==
X-Received: by 2002:a5d:4d0b:: with SMTP id z11mr13340402wrt.388.1612091607218;
        Sun, 31 Jan 2021 03:13:27 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net. [83.57.171.7])
        by smtp.gmail.com with ESMTPSA id b13sm21667614wrt.31.2021.01.31.03.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 03:13:26 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-block@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	qemu-s390x@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Anthony Green <green@moxielogic.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Michael Walle <michael@walle.cc>,
	Greg Kurz <groug@kaod.org>,
	qemu-ppc@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Stafford Horne <shorne@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Marek Vasut <marex@denx.de>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 01/10] hw/sh4/Kconfig: Rename CONFIG_SH4 -> CONFIG_SH4_PERIPHERALS
Date: Sun, 31 Jan 2021 12:13:07 +0100
Message-Id: <20210131111316.232778-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131111316.232778-1-f4bug@amsat.org>
References: <20210131111316.232778-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: b5moDf4VTypY

We want to be able to use the 'SH4' config for architecture
specific features. As CONFIG_SH4 is only used to select
peripherals, rename it CONFIG_SH4_PERIPHERALS.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/block/meson.build | 2 +-
 hw/char/meson.build  | 2 +-
 hw/intc/meson.build  | 2 +-
 hw/sh4/Kconfig       | 6 +++---
 hw/timer/meson.build | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/block/meson.build b/hw/block/meson.build
index 602ca6c8541..7f24b42c283 100644
--- a/hw/block/meson.build
+++ b/hw/block/meson.build
@@ -12,7 +12,7 @@
 softmmu_ss.add(when: 'CONFIG_SSI_M25P80', if_true: files('m25p80.c'))
 softmmu_ss.add(when: 'CONFIG_SWIM', if_true: files('swim.c'))
 softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen-block.c'))
-softmmu_ss.add(when: 'CONFIG_SH4', if_true: files('tc58128.c'))
+softmmu_ss.add(when: 'CONFIG_SH4_PERIPHERALS', if_true: files('tc58128.c'))
 softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('nvme.c', 'nvme-ns.c'))
 
 specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'))
diff --git a/hw/char/meson.build b/hw/char/meson.build
index 196ac91fa29..3b8cb6a2f5b 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -31,7 +31,7 @@
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_aux.c'))
 softmmu_ss.add(when: 'CONFIG_RENESAS_SCI', if_true: files('renesas_sci.c'))
 softmmu_ss.add(when: 'CONFIG_SIFIVE_UART', if_true: files('sifive_uart.c'))
-softmmu_ss.add(when: 'CONFIG_SH4', if_true: files('sh_serial.c'))
+softmmu_ss.add(when: 'CONFIG_SH4_PERIPHERALS', if_true: files('sh_serial.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_USART', if_true: files('stm32f2xx_usart.c'))
 softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_MMUART', if_true: files('mchp_pfsoc_mmuart.c'))
 
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 53cba115690..b05bab2f4b6 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -47,7 +47,7 @@
 specific_ss.add(when: 'CONFIG_RX_ICU', if_true: files('rx_icu.c'))
 specific_ss.add(when: 'CONFIG_S390_FLIC', if_true: files('s390_flic.c'))
 specific_ss.add(when: 'CONFIG_S390_FLIC_KVM', if_true: files('s390_flic_kvm.c'))
-specific_ss.add(when: 'CONFIG_SH4', if_true: files('sh_intc.c'))
+specific_ss.add(when: 'CONFIG_SH4_PERIPHERALS', if_true: files('sh_intc.c'))
 specific_ss.add(when: 'CONFIG_SIFIVE_CLINT', if_true: files('sifive_clint.c'))
 specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: files('sifive_plic.c'))
 specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
diff --git a/hw/sh4/Kconfig b/hw/sh4/Kconfig
index 4cbce3a0ed5..fbac8c09152 100644
--- a/hw/sh4/Kconfig
+++ b/hw/sh4/Kconfig
@@ -9,16 +9,16 @@ config R2D
     select USB_OHCI_PCI
     select PCI
     select SM501
-    select SH4
+    select SH4_PERIPHERALS
 
 config SHIX
     bool
     select SH7750
-    select SH4
+    select SH4_PERIPHERALS
 
 config SH7750
     bool
 
-config SH4
+config SH4_PERIPHERALS
     bool
     select PTIMER
diff --git a/hw/timer/meson.build b/hw/timer/meson.build
index be343f68fed..d3f53dce400 100644
--- a/hw/timer/meson.build
+++ b/hw/timer/meson.build
@@ -30,7 +30,7 @@
 softmmu_ss.add(when: 'CONFIG_PUV3', if_true: files('puv3_ost.c'))
 softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_timer.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_systmr.c'))
-softmmu_ss.add(when: 'CONFIG_SH4', if_true: files('sh_timer.c'))
+softmmu_ss.add(when: 'CONFIG_SH4_PERIPHERALS', if_true: files('sh_timer.c'))
 softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_timer.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_TIMER', if_true: files('stm32f2xx_timer.c'))
 softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_timer.c'))
-- 
2.26.2
