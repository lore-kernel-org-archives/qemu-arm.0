Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2581236lfo;
        Sun, 31 Jan 2021 03:13:40 -0800 (PST)
X-Received: by 2002:a1c:e255:: with SMTP id z82mr10981252wmg.60.1612091620645;
        Sun, 31 Jan 2021 03:13:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612091620; cv=none;
        d=google.com; s=arc-20160816;
        b=nndOof0r4XFMzs/k2Km7DOKwXO8SiHQtIwwkL2ZMu7a/4v3cY/7NYFYfwMd6kZxwOJ
         UUu0iugd/NYW+5je0r3yRE9kov0QJWBhSInFZGPH8w+hWnCfdX0vmYao7ObWuFpppr4N
         ASk9gpGF7pHf8Nga2Trpnbt16r4L/89YNb3ihWVWi0F5AxicGwSvxL+hQs9k52m/NXDI
         8QLzFBfnlzRjnOBngCW+r7P23/U4MrqTj2DI5gqGt23j7LokB/rwwr/ySjhInqLV+uO/
         sR5Ee2xyaqAVTZ5jM3dLM51s9e7dm00y6cgl6bPZxqGGxPG+m1LNXKsQa6ibbqMcpnDh
         jc4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=fYQAVaNNfllVHQX0jOIMlQzoC4zDZBjKHd4G1bFe6gE=;
        b=JY/cVhQ2p7K11oiXECr2O8xtK177PXklKjb0vWhUxVCsv+/SfAWK9Ip5TSFUUZ3MMM
         fXKQlhRWHw/j3pmIJzehTS9t31p5TiiIooiiRMlr3NeB2mXgVR0fHqpwSez7xXkecfP/
         dnGW17djthQOOBHhZQ+V2zRJCbfbuakRc+7wMCLXzet5h3pVgF3gEGFJBnLq0uwZxpm7
         Yjq+g9vGCPrz6TgFVYti8Ux/mQqYZCGHpaeRJWadDaPiES4kI1fP9Ry7T7mqwyb8Gr/9
         DYjNhiiS8oxGh0/o+44vVQNvDssViA0Ljqx8rX5foGc/eZ7QEomPMV27nc8csmVUPMb1
         yMOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=VtsFlqIB;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l6sor6886131wmh.15.2021.01.31.03.13.40
        (Google Transport Security);
        Sun, 31 Jan 2021 03:13:40 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=VtsFlqIB;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fYQAVaNNfllVHQX0jOIMlQzoC4zDZBjKHd4G1bFe6gE=;
        b=VtsFlqIBtqo1kXig1EeJWLBVRMox9I8WX2P/8PRWsWkbAckwzpSZIZoFEczXG6Wgnb
         6SlPCptAu7PFm3akwbHlaYFbePl01zvC4eLGG4ahfyOye7dl6CjxQG9/jWwiXEXCwy4L
         dtWnpYz97KrNvOFHlKNsDfYtBehZOBkcb+HScuBj9Wf6aezOwyKRQ9pbeA+hkuCnRBfR
         5qPKsGkUfJxuuRsgpjNRxZ6hMnOoJnqHu+Arh2e5cJnS5kl8bRmds/aqfboawpLoczrl
         F7GoyE9FJyOqHTjCdvVg5KKNA6+XWYVt/aivp0giwV6JgDm1J+v0aKkfHzXE7d2EKpoa
         go5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=fYQAVaNNfllVHQX0jOIMlQzoC4zDZBjKHd4G1bFe6gE=;
        b=jdVWDC/3axM4BQuNntU24qh/tBrs79pQnFR0bPfnWhtG4CJOQLwJ3WovfvZHeSylPC
         QPaNHCvRoylubu0efuhBudXgm8hjiMe5QWgp6E3gMMFcCqhLdnf3disBsqiXEZwxXgyF
         PkMMbxRjpby6FSXaz1XznQCD9v5WapPFjE1eHhkAFq0vUGYuhVjc8F3Xf25rFE4BrLnB
         KFclxn5hlcbtxM4X97y8IoMLlf9PQKvZ++WlrWRCTc8u+ChZNUBnf6tkXkybEehtYQB1
         HRXmJXKe4C2gFgOlmIPOgLpJP/cLMwopvc94WMRfzam8fl+VRcd1WpW5AsiUZw6Ey8bj
         STYA==
X-Gm-Message-State: AOAM531cxdx1MaHEWnSutqHsHhiUVWdmJbDLWWJ3SGqe/rNEP79tQApA
	r1x6Yhu7QKNaUIUinWQJQtI=
X-Google-Smtp-Source: ABdhPJygYyM+WH/1+ddpYuuvNeuUZ11kFCnNJRQVgkKeFFsZxyw0wUwCZKD+WJAIXr4jn58+npJiTQ==
X-Received: by 2002:a05:600c:4fc2:: with SMTP id o2mr10585388wmq.90.1612091620427;
        Sun, 31 Jan 2021 03:13:40 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net. [83.57.171.7])
        by smtp.gmail.com with ESMTPSA id x81sm18641566wmg.40.2021.01.31.03.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 03:13:39 -0800 (PST)
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
Subject: [PATCH 03/10] hw/sh4/Kconfig: Rename CONFIG_LM32 -> CONFIG_LM32_PERIPHERALS
Date: Sun, 31 Jan 2021 12:13:09 +0100
Message-Id: <20210131111316.232778-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131111316.232778-1-f4bug@amsat.org>
References: <20210131111316.232778-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: QQH6XaBxVzLY

We want to be able to use the 'LM32' config for architecture
specific features. As CONFIG_LM32 is only used to select
peripherals, rename it CONFIG_LM32_PERIPHERALS.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/char/meson.build  | 4 ++--
 hw/intc/meson.build  | 2 +-
 hw/lm32/Kconfig      | 4 ++--
 hw/timer/meson.build | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/char/meson.build b/hw/char/meson.build
index 3b8cb6a2f5b..b05dcc41c59 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -8,8 +8,8 @@
 softmmu_ss.add(when: 'CONFIG_IPACK', if_true: files('ipoctal232.c'))
 softmmu_ss.add(when: 'CONFIG_ISA_BUS', if_true: files('parallel-isa.c'))
 softmmu_ss.add(when: 'CONFIG_ISA_DEBUG', if_true: files('debugcon.c'))
-softmmu_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_juart.c'))
-softmmu_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_uart.c'))
+softmmu_ss.add(when: 'CONFIG_LM32_PERIPHERALS', if_true: files('lm32_juart.c'))
+softmmu_ss.add(when: 'CONFIG_LM32_PERIPHERALS', if_true: files('lm32_uart.c'))
 softmmu_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-uart.c'))
 softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_uart.c'))
 softmmu_ss.add(when: 'CONFIG_PARALLEL', if_true: files('parallel.c'))
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index b05bab2f4b6..bfaab908ac7 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -14,7 +14,7 @@
 softmmu_ss.add(when: 'CONFIG_I8259', if_true: files('i8259_common.c', 'i8259.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_avic.c', 'imx_gpcv2.c'))
 softmmu_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic_common.c'))
-softmmu_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_pic.c'))
+softmmu_ss.add(when: 'CONFIG_LM32_PERIPHERALS', if_true: files('lm32_pic.c'))
 softmmu_ss.add(when: 'CONFIG_OPENPIC', if_true: files('openpic.c'))
 softmmu_ss.add(when: 'CONFIG_PL190', if_true: files('pl190.c'))
 softmmu_ss.add(when: 'CONFIG_PUV3', if_true: files('puv3_intc.c'))
diff --git a/hw/lm32/Kconfig b/hw/lm32/Kconfig
index 20c36edc402..5867f4db0cf 100644
--- a/hw/lm32/Kconfig
+++ b/hw/lm32/Kconfig
@@ -1,4 +1,4 @@
-config LM32
+config LM32_PERIPHERALS
     bool
     select PTIMER
 
@@ -14,5 +14,5 @@ config MILKYMIST
 
 config LM32_EVR
     bool
-    select LM32
+    select LM32_PERIPHERALS
     select PFLASH_CFI02
diff --git a/hw/timer/meson.build b/hw/timer/meson.build
index d3f53dce400..36ca0d34942 100644
--- a/hw/timer/meson.build
+++ b/hw/timer/meson.build
@@ -19,7 +19,7 @@
 softmmu_ss.add(when: 'CONFIG_I8254', if_true: files('i8254_common.c', 'i8254.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_epit.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_gpt.c'))
-softmmu_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_timer.c'))
+softmmu_ss.add(when: 'CONFIG_LM32_PERIPHERALS', if_true: files('lm32_timer.c'))
 softmmu_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-sysctl.c'))
 softmmu_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_gictimer.c'))
 softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('mss-timer.c'))
-- 
2.26.2
