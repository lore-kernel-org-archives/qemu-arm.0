Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2581187lfo;
        Sun, 31 Jan 2021 03:13:34 -0800 (PST)
X-Received: by 2002:a5d:4e8a:: with SMTP id e10mr13493084wru.0.1612091614307;
        Sun, 31 Jan 2021 03:13:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612091614; cv=none;
        d=google.com; s=arc-20160816;
        b=WVLunHaTh8cpuMENBll7F+2KPt+J2esFeS/jTVguXekMmsMQvMrvMZu3hY4LfkmEJx
         CTK31KeeF7ctF7+MiVoNidHRaOK7bPN/+v1n4pnbRmDyx7W6ioqye0z25jLFjEqO3R5R
         seD5svkoiw9fEtCUxYBu93HcJgwT3wd2ZiKn4Q679CTIEW7GSIxk1PlxuQe2rptXO+kB
         lYy5iGflpyUlBH518t5tT0KLokEqIB6NmlAI+5yU2Ta9JOtAE7EImETE1bq5vKM0k80k
         OLj25yUDg3L/2YL+qANEApkdknaiGIOnwdbQ3Z8jOcFJ9wdif9MV0besi0RE1cpMp80t
         u74A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=5db0rN0b61TISoVih9RU0w7I/BYMbyVo0fCfumLvBJU=;
        b=fetRIT9RGVhdWIN+1BNuhloDh87fm8xN/1Agan9rWCKrQiwP9cLUwT9cvs4lmZJ7Bi
         9d5OvPX53hgoH3O1NoJVWYauIhw2aZmE8vePcIMzbvMmCzqJ0yfIiupxV2j93CcL5Ty2
         5Emydq9Oc4dKvUrV7nhtTyZZba6uF+A3ZDDao4H2iy6NCJuyr6N5xF7eQbvL2sipSiTC
         olJQy9GXIcnig9nNVTT3QWDeQePnjUSZKv7AaAWhFLHmG0PoI2mZ3XDSZMnGUdtEuR+h
         OpbVH01G2SGyQmA9WjNehD8DJnYParpsV6N4EMji+Rk1yr37gJjeU7OtCCk4yBV8B1TR
         9E1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Aww7BaJV;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n12sor5619531wrt.23.2021.01.31.03.13.34
        (Google Transport Security);
        Sun, 31 Jan 2021 03:13:34 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Aww7BaJV;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5db0rN0b61TISoVih9RU0w7I/BYMbyVo0fCfumLvBJU=;
        b=Aww7BaJVjb3/wyQ8XZfjMO3ZwTQmiv8Fb0Bvp3LixGTGjtGCxZa8bbnvvzcOA1n9bv
         O/nqUBYrOzk4y9L79PIff8LUUhy3qEA3laziY0kpTAqPTFT1C4h+5WhtihDidiL+CnGz
         2IXrZ7q1dAll+C430eQgDJmqDeHmAiu4YExvjtLYbcBM2dXLPS07mDKX0/lTKCNa2koN
         bTFKf7PsO8nNuotwcZyJRxUtl+g4GvQXsiMvpfXw2kfKw4+j9nl8xvSxzNUPvTnW6Pkj
         d7+bqu2BwHuKMywtKMYRhPo93RTuFW569BMmNm/eGUNrkGCMmPFeIvyGnpaQ/2XhTVIG
         0ltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=5db0rN0b61TISoVih9RU0w7I/BYMbyVo0fCfumLvBJU=;
        b=L+Oan9uoeG0FgHK8kwMztPYazn9PFBgkXW+qpsAucZ5pjmL/6pKYUfxBY0RJ50oKCk
         ssq4VC2AaFXEFhE7ZEWnLBm+PKTs9jlv17boK3lceNXX9Bilk++kHMnhclgqRCueYtt/
         8SGYZHUoKfayXjXC3yIlldhgQ6COfy6cG5G1IuNbkcFD1wJ1l+MsMeqzLTef721xtoxE
         Xb3updevT2VeJ6XtUbIFr4IFrq3v80BHU+PFmtIT0cP731k1zRTnwMjVYQAZosW7zlwl
         XrfEsfYxtti9nnpzmVBmS2LbhMba4+Dt+u6H9qF8CKiGAsjjlgprbTakILumGLHi03i5
         p/dA==
X-Gm-Message-State: AOAM530AYHY1Q/KA5LCTupUiQpir4ng/kEnmZi/sOfzoIJfY5xQa7PmS
	EvU1+s5Kk4XORMWiSS1muNI=
X-Google-Smtp-Source: ABdhPJxW502J2p3wHoVx/d3AqodhoKgPwvsaUlx4hMLKseNtd9yxDGw+BCbNjHqPUg3olzHpsoB/sQ==
X-Received: by 2002:a5d:6a85:: with SMTP id s5mr12728710wru.283.1612091614116;
        Sun, 31 Jan 2021 03:13:34 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net. [83.57.171.7])
        by smtp.gmail.com with ESMTPSA id s19sm25233016wrf.72.2021.01.31.03.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 03:13:33 -0800 (PST)
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
Subject: [PATCH 02/10] hw/lm32/Kconfig: Introduce CONFIG_LM32_EVR for lm32-evr/uclinux boards
Date: Sun, 31 Jan 2021 12:13:08 +0100
Message-Id: <20210131111316.232778-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131111316.232778-1-f4bug@amsat.org>
References: <20210131111316.232778-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: teeG5bp5R/jz

We want to be able to use the 'LM32' config for architecture
specific features. Introduce CONFIG_LM32_EVR to select the
lm32-evr / lm32-uclinux boards.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/devices/lm32-softmmu.mak | 2 +-
 hw/lm32/Kconfig                          | 6 +++++-
 hw/lm32/meson.build                      | 2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/default-configs/devices/lm32-softmmu.mak b/default-configs/devices/lm32-softmmu.mak
index 115b3e34c98..1bce3f6e8b6 100644
--- a/default-configs/devices/lm32-softmmu.mak
+++ b/default-configs/devices/lm32-softmmu.mak
@@ -8,5 +8,5 @@ CONFIG_SEMIHOSTING=y
 
 # Boards:
 #
-CONFIG_LM32=y
+CONFIG_LM32_EVR=y
 CONFIG_MILKYMIST=y
diff --git a/hw/lm32/Kconfig b/hw/lm32/Kconfig
index ed2e3060b04..20c36edc402 100644
--- a/hw/lm32/Kconfig
+++ b/hw/lm32/Kconfig
@@ -1,7 +1,6 @@
 config LM32
     bool
     select PTIMER
-    select PFLASH_CFI02
 
 config MILKYMIST
     bool
@@ -12,3 +11,8 @@ config MILKYMIST
     select FRAMEBUFFER
     select SD
     select USB_OHCI
+
+config LM32_EVR
+    bool
+    select LM32
+    select PFLASH_CFI02
diff --git a/hw/lm32/meson.build b/hw/lm32/meson.build
index 8caf0a727ff..42d6f8db3d9 100644
--- a/hw/lm32/meson.build
+++ b/hw/lm32/meson.build
@@ -1,6 +1,6 @@
 lm32_ss = ss.source_set()
 # LM32 boards
-lm32_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_boards.c'))
+lm32_ss.add(when: 'CONFIG_LM32_EVR', if_true: files('lm32_boards.c'))
 lm32_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist.c'))
 
 hw_arch += {'lm32': lm32_ss}
-- 
2.26.2
