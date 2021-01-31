Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2581080lfo;
        Sun, 31 Jan 2021 03:13:20 -0800 (PST)
X-Received: by 2002:a7b:c0d8:: with SMTP id s24mr11018177wmh.4.1612091600549;
        Sun, 31 Jan 2021 03:13:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612091600; cv=none;
        d=google.com; s=arc-20160816;
        b=suTH1TBVsJu37qTVkLNB8U0Zz3vz/7T64Iw80kOHpCQ121UTzBbtAs6v86MF2LRnE4
         FDn58fIV1LaM3CS0acVaigPqqpKXLYodceMeJrmGS8v/HBsU9MrjkgJ8w3iyvG5hPG15
         n9yWwoMJ9XwnZ2Yj6yH+MbgTXzQGi5rFbs3YGNmP5hqI/eePntkZwPbv5oBwY8kmIoyH
         wQ2C2w++4oCg5Yne3PdBhM/4WM+v6+HooO4yy1qIC1m0u0G29J4NoaizAGI0D8tRlOaI
         fuiQe9MCqNJuVcEiyBiPU+/9cdl0nyoeeCruNWjEO8OegSlQyyfoIQqdfPdApXE0Zin5
         XNVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:dkim-signature;
        bh=nu0fflOvwC9lnnocMvnUlxjUoWk9Y1oHXbnM2of1VNw=;
        b=aUU4T/niFtAqQSZO6Xmgnb68HjyrMesFQbwBGuWKUQBHZpQ0P0HVxj8zYwZBznE7EO
         fOqC/xbDU0GwjZK+LxbSxUxGEokPrkWSyq+jkrBsnCtaNz39M6YG98X5InfCBzi0ZeMJ
         bMU2C7M8UJvw3apqqyRbziVY0tNeI2tVyqZgh+UfF70aZNziFv9GySRljhVIxO3WwEti
         YZpNkzZyua77aKwmkXqBGhX5UwPnkkEW/WXVQEOT2d5PQn0rXnhlCBT8AuTcUzVlHXq7
         i/t2rgJwaQuxBNlhVwvbd4CYkaaLZFusEMPJK2gtmGLD7nAAjsMroHZojaLMGfzjRejx
         TFpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="GMkP/wCf";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x4sor6757590wmc.23.2021.01.31.03.13.20
        (Google Transport Security);
        Sun, 31 Jan 2021 03:13:20 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="GMkP/wCf";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nu0fflOvwC9lnnocMvnUlxjUoWk9Y1oHXbnM2of1VNw=;
        b=GMkP/wCfwoRMy/FW9sbsBrWn/UnFhGbUstPstPeXtbDB8+Zm7Jy9xM3uckHQcYl6LN
         js7d+AieoC3plFBxVD7OMMSvrxFWsVOoasWl8xCaArJyZL5YrNhiwJ++BamyXysJA/S5
         2ts9RpOACFdLkspO7dxfR/tqpldF+PZw9fBRgmq5/QusxuCXuFIfEMqKyMgX5HGt0m7i
         5pKRAAFlhokVoJgiqWsPqx49QkmY1coTIzDZivTaXj0KBdHNJ0fT+oKuBu7F5LRXjCCa
         FF9DcOyvgs6ojjt4RwNz3eyXPdA+1JGBXKTyWF1RCYB+hLR9JrVWiijHC+jflrAHGa8d
         Ji3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=nu0fflOvwC9lnnocMvnUlxjUoWk9Y1oHXbnM2of1VNw=;
        b=KaIm+8hJ6MdnAN6TjzaqX+3Ge4WNLmbEA/n/zBoBcqa5Q8NJ+w/0Rk8CvwJKrztexb
         qGlHmYe6gxVO8f/LemrdmU1hygi50yZehSdqPxQIfNq6VpXfHSvA9Ks+dJFkTerPQ8KX
         XYWeqGKmcs8fz+ogNtgQHux9ZCmWFvcwgXZW7+20ph19wJeL2hkaoVJt3NUSy68x75/t
         vPSwhjFnd5n52+ZnNSeWS1ppWA8fIM6CA0O/7oW8gpDj6Acf3lmq9RBlqhrM+cjSbf3+
         DbHkfMphKQLtE16pVlvFh2KKYHr/TpRGcKLiaQ2FeO9R6uDggcZE7CQdlPKiBGJinzNC
         Vfrg==
X-Gm-Message-State: AOAM531a1xOJzZHBkLuTXedTFIZfHXlWhW0Edg0POgSW4n3L2dzF1xx2
	2zc2Z5fBQamQvA016MGGx6Y=
X-Google-Smtp-Source: ABdhPJzIBt7iHlMIteL1B3eYUDHuKMn0E+lTKfVqdSXwgXiLDotBHQmkksvK0moPF44T2gKqd43rPQ==
X-Received: by 2002:a1c:f417:: with SMTP id z23mr10316640wma.29.1612091600288;
        Sun, 31 Jan 2021 03:13:20 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net. [83.57.171.7])
        by smtp.gmail.com with ESMTPSA id l5sm22224061wrv.44.2021.01.31.03.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 03:13:19 -0800 (PST)
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
Subject: [PATCH 00/10] target: Provide target-specific Kconfig
Date: Sun, 31 Jan 2021 12:13:06 +0100
Message-Id: <20210131111316.232778-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: NReiJUCXZJtv

Hi,=0D
=0D
This series add a Kconfig file to each target, allowing=0D
to select target-specific features there, instead of from=0D
the hardware Kconfig.=0D
=0D
This simplifies managing multi-arch features such semihosting.=0D
=0D
Series organization:=0D
=0D
1/ Some targets use the architecture symbol to select boards and=0D
peripherals (SH4 and LM32), we need to clean that first.=0D
=0D
2/ Introduce empty target Kconfig, update meson.=0D
=0D
3/ Move architectural features out of hardware:=0D
   - x86 SEV=0D
   - ARM v7m=0D
   - generic semihosting=0D
=0D
[following only important to patchew, unrelated to this series]=0D
Based-on: <20210131105918.228787-1-f4bug@amsat.org>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (10):=0D
  hw/sh4/Kconfig: Rename CONFIG_SH4 -> CONFIG_SH4_PERIPHERALS=0D
  hw/lm32/Kconfig: Introduce CONFIG_LM32_EVR for lm32-evr/uclinux boards=0D
  hw/sh4/Kconfig: Rename CONFIG_LM32 -> CONFIG_LM32_PERIPHERALS=0D
  hw/lm32/Kconfig: Have MILKYMIST select LM32_PERIPHERALS=0D
  meson: Introduce target-specific Kconfig=0D
  target/i386: Move SEV feature to target Kconfig=0D
  target/arm: Move V7M feature to target Kconfig=0D
  default-configs: Remove unnecessary SEMIHOSTING selection=0D
  target: Move ARM_COMPATIBLE_SEMIHOSTING feature to target Kconfig=0D
  target: Move SEMIHOSTING feature to target Kconfig=0D
=0D
 default-configs/devices/arm-softmmu.mak       |  2 --=0D
 default-configs/devices/lm32-softmmu.mak      |  4 +---=0D
 default-configs/devices/m68k-softmmu.mak      |  2 --=0D
 .../devices/mips-softmmu-common.mak           |  3 ---=0D
 default-configs/devices/nios2-softmmu.mak     |  2 --=0D
 default-configs/devices/riscv32-softmmu.mak   |  2 --=0D
 default-configs/devices/riscv64-softmmu.mak   |  2 --=0D
 default-configs/devices/unicore32-softmmu.mak |  1 -=0D
 default-configs/devices/xtensa-softmmu.mak    |  2 --=0D
 meson.build                                   |  3 ++-=0D
 Kconfig                                       |  1 +=0D
 hw/arm/Kconfig                                |  4 ----=0D
 hw/block/meson.build                          |  2 +-=0D
 hw/char/meson.build                           |  6 ++---=0D
 hw/i386/Kconfig                               |  4 ----=0D
 hw/intc/meson.build                           |  4 ++--=0D
 hw/lm32/Kconfig                               | 10 +++++---=0D
 hw/lm32/meson.build                           |  2 +-=0D
 hw/sh4/Kconfig                                |  6 ++---=0D
 hw/timer/meson.build                          |  4 ++--=0D
 target/Kconfig                                | 23 +++++++++++++++++++=0D
 target/alpha/Kconfig                          |  2 ++=0D
 target/arm/Kconfig                            | 11 +++++++++=0D
 target/avr/Kconfig                            |  2 ++=0D
 target/cris/Kconfig                           |  2 ++=0D
 target/hppa/Kconfig                           |  2 ++=0D
 target/i386/Kconfig                           |  9 ++++++++=0D
 target/lm32/Kconfig                           |  3 +++=0D
 target/m68k/Kconfig                           |  3 +++=0D
 target/microblaze/Kconfig                     |  2 ++=0D
 target/mips/Kconfig                           |  7 ++++++=0D
 target/moxie/Kconfig                          |  2 ++=0D
 target/nios2/Kconfig                          |  3 +++=0D
 target/openrisc/Kconfig                       |  2 ++=0D
 target/ppc/Kconfig                            |  5 ++++=0D
 target/riscv/Kconfig                          |  7 ++++++=0D
 target/rx/Kconfig                             |  2 ++=0D
 target/s390x/Kconfig                          |  2 ++=0D
 target/sh4/Kconfig                            |  2 ++=0D
 target/sparc/Kconfig                          |  5 ++++=0D
 target/tilegx/Kconfig                         |  2 ++=0D
 target/tricore/Kconfig                        |  2 ++=0D
 target/unicore32/Kconfig                      |  3 +++=0D
 target/xtensa/Kconfig                         |  3 +++=0D
 44 files changed, 129 insertions(+), 43 deletions(-)=0D
 create mode 100644 target/Kconfig=0D
 create mode 100644 target/alpha/Kconfig=0D
 create mode 100644 target/arm/Kconfig=0D
 create mode 100644 target/avr/Kconfig=0D
 create mode 100644 target/cris/Kconfig=0D
 create mode 100644 target/hppa/Kconfig=0D
 create mode 100644 target/i386/Kconfig=0D
 create mode 100644 target/lm32/Kconfig=0D
 create mode 100644 target/m68k/Kconfig=0D
 create mode 100644 target/microblaze/Kconfig=0D
 create mode 100644 target/mips/Kconfig=0D
 create mode 100644 target/moxie/Kconfig=0D
 create mode 100644 target/nios2/Kconfig=0D
 create mode 100644 target/openrisc/Kconfig=0D
 create mode 100644 target/ppc/Kconfig=0D
 create mode 100644 target/riscv/Kconfig=0D
 create mode 100644 target/rx/Kconfig=0D
 create mode 100644 target/s390x/Kconfig=0D
 create mode 100644 target/sh4/Kconfig=0D
 create mode 100644 target/sparc/Kconfig=0D
 create mode 100644 target/tilegx/Kconfig=0D
 create mode 100644 target/tricore/Kconfig=0D
 create mode 100644 target/unicore32/Kconfig=0D
 create mode 100644 target/xtensa/Kconfig=0D
=0D
-- =0D
2.26.2=0D
=0D
