Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1262326lfg;
        Fri, 26 Feb 2021 05:14:12 -0800 (PST)
X-Received: by 2002:a5d:6602:: with SMTP id n2mr3259145wru.262.1614345252525;
        Fri, 26 Feb 2021 05:14:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614345252; cv=none;
        d=google.com; s=arc-20160816;
        b=G2Jrv+XKncM7Oxp5yqxHXFdmXY2QTDZSig1QSwvq8F7V1qoxtmhixZ9kk8eayFOih4
         nEdJ/3v0srRSLf124is5yz6iEGd5nK2iSD3L4UQrz7O1yCp+8T5Eb+AhXQlkEuFGAykI
         31+ZT12BylrUFYGPmVGihHKTpkATprqaIzooRjUE5phxvnRx+V+Hti4P/MfYXmmryrU7
         bd2g7BnEIjY/mcuXwHnLluO0mQIpq2Sa5z5+M+0sGHtHIC7SbeH60ZHH25jVh0ETuM7+
         1+WvKRJe5UZF7L0OeOfuv56nlUOZdV6RD2TKNreMUby2sTWDW6QUoMzfJrVXAGAAP4ot
         Enzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=lcg6YHwY0vi6q4edqMH5mvI18L4U1/uEX7m4g24yUqA=;
        b=HIgN09J1UiFKeulVjnBXjdh5l7kmoYAlYUC9PspooGbYRLR4BWEjm8dakXziTJ9vz8
         fF3qR6T7q8sscqNoppee/7le7YbrKlokrU10cm9vLte20zKtpalKmRIqwA4PCvg7AObw
         Rs5FrvaDqm26gAZUPOe7ETvftM6zzgpgeVxzgpBNSCdsdqhxW0/g3D9FAtWBrcdH63m4
         4pvqzVJc/cb9djj96DVCBaD15qLpyHjsBW+xTw7bdXA14qEU/h/9adqz60t0o7qNuu+/
         tM4EM0w7HarpATpm7iXM4MCtWl6axfdqPhyOVPIJ0ZTOqdJei4qgtJYDNKvtEe6VDKQU
         oeWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=L6XZeUD+;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d18sor4316628wrw.38.2021.02.26.05.14.12
        (Google Transport Security);
        Fri, 26 Feb 2021 05:14:12 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=L6XZeUD+;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lcg6YHwY0vi6q4edqMH5mvI18L4U1/uEX7m4g24yUqA=;
        b=L6XZeUD+9gq0CbemQtXHmUvxXAj4CBcSyZpy42YXDROpxxHipr7eWhFjzKMCHY6onZ
         7TM2iW737x1/of+MZCNZtLHjNT+PqLJQLW9lilFp14PmwwrVg4RJOJkq8ciIKO6MiP1x
         6zyVsPFP8XyUCPRvmIvuZlaHy3df/ri5vIBYXhzfJjAer6SqBM6Xj79GIBgbvMbu8YMO
         1LoCnX2ak1im6BQw+4nYoNZchFiaDA/dWNOQGZUcPIGVMDJoRe2F0YmDSb/jsPbpeHrD
         02Xj3BffIJlLmC/+JbP/phVBFZnC7IYU77jeAZU1IQDgtbps4i3XLFD0IP9yIDVNsGzk
         H3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=lcg6YHwY0vi6q4edqMH5mvI18L4U1/uEX7m4g24yUqA=;
        b=Yv7uhSoSL3s+n7LNkGoD/b/nWA3jOrJWOBcfnB7cOGfd5BGJqEOk94dQWmzMKLNrek
         A0cfr/Dt9xiXQ7Rap4mpku1Teppjyq2GZBy9CQLDy94cDSg8QfrLpa/up3yR3ZccXvB+
         s24iwy1uGDjE26qS65WqdixBpUgFbd/W82Zqsx535hbrffDoeaBNNtu70uZj3zVa0NQu
         FpYZW9WBlwDWzFLURjJfZW+zQdCcFW5PpScSzT4NxX0XthDjM+vTbgwVsYKaFNsf+xB3
         NRYySx//1y0Db1bGK+0O+nsAWCQMwrZCnWBtoXxN9HPnc9Gu5ByQmKJmiMgLHh3svIz2
         Uv4w==
X-Gm-Message-State: AOAM533eDj98g5KJ60MblGzUvBNXVm1Ty+Pbq/0ndmY/U/+D63zlc/Bl
	6SNB7fgAhAw+7rJ3p/ssiNU=
X-Google-Smtp-Source: ABdhPJxw/BJLl+x3UpKw1D9kKs2dLZ4Z9AiT8ccG+kJ5jBw8weY+eYw3/J8cAuxzGoD2Hdtkz8LB0g==
X-Received: by 2002:adf:e444:: with SMTP id t4mr3302152wrm.97.1614345252281;
        Fri, 26 Feb 2021 05:14:12 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id f2sm10140322wrq.34.2021.02.26.05.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 05:14:11 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Chris Wulff <crwulff@gmail.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	qemu-riscv@nongnu.org,
	Max Filippov <jcmvbkbc@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Michael Walle <michael@walle.cc>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 2/2] semihosting: Move hw/semihosting/ -> semihosting/
Date: Fri, 26 Feb 2021 14:13:56 +0100
Message-Id: <20210226131356.3964782-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226131356.3964782-1-f4bug@amsat.org>
References: <20210226131356.3964782-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: dMLuLoU6Cal1

With the exception of hw/core/, the hw/ directory only contains
device models used in system emulation. Semihosting is also used
by user emulation. As a generic feature, move it out of hw/ directory.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 meson.build                                       | 1 +
 {hw/semihosting => semihosting}/common-semi.h     | 0
 {hw/semihosting => semihosting}/arm-compat-semi.c | 0
 {hw/semihosting => semihosting}/config.c          | 0
 {hw/semihosting => semihosting}/console.c         | 0
 Kconfig                                           | 1 +
 MAINTAINERS                                       | 2 +-
 hw/Kconfig                                        | 1 -
 hw/meson.build                                    | 1 -
 {hw/semihosting => semihosting}/Kconfig           | 0
 {hw/semihosting => semihosting}/meson.build       | 0
 11 files changed, 3 insertions(+), 3 deletions(-)
 rename {hw/semihosting => semihosting}/common-semi.h (100%)
 rename {hw/semihosting => semihosting}/arm-compat-semi.c (100%)
 rename {hw/semihosting => semihosting}/config.c (100%)
 rename {hw/semihosting => semihosting}/console.c (100%)
 rename {hw/semihosting => semihosting}/Kconfig (100%)
 rename {hw/semihosting => semihosting}/meson.build (100%)

diff --git a/meson.build b/meson.build
index 05a67c20d93..f2f9bb92520 100644
--- a/meson.build
+++ b/meson.build
@@ -1934,6 +1934,7 @@
 subdir('monitor')
 subdir('net')
 subdir('replay')
+subdir('semihosting')
 subdir('hw')
 subdir('accel')
 subdir('plugins')
diff --git a/hw/semihosting/common-semi.h b/semihosting/common-semi.h
similarity index 100%
rename from hw/semihosting/common-semi.h
rename to semihosting/common-semi.h
diff --git a/hw/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
similarity index 100%
rename from hw/semihosting/arm-compat-semi.c
rename to semihosting/arm-compat-semi.c
diff --git a/hw/semihosting/config.c b/semihosting/config.c
similarity index 100%
rename from hw/semihosting/config.c
rename to semihosting/config.c
diff --git a/hw/semihosting/console.c b/semihosting/console.c
similarity index 100%
rename from hw/semihosting/console.c
rename to semihosting/console.c
diff --git a/Kconfig b/Kconfig
index bf694c42afe..d52ebd839b3 100644
--- a/Kconfig
+++ b/Kconfig
@@ -2,3 +2,4 @@ source Kconfig.host
 source backends/Kconfig
 source accel/Kconfig
 source hw/Kconfig
+source semihosting/Kconfig
diff --git a/MAINTAINERS b/MAINTAINERS
index aacd4408125..9046b54cb2e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3224,7 +3224,7 @@ F: qapi/rdma.json
 Semihosting
 M: Alex Bennée <alex.bennee@linaro.org>
 S: Maintained
-F: hw/semihosting/
+F: semihosting/
 F: include/semihosting/
 
 Multi-process QEMU
diff --git a/hw/Kconfig b/hw/Kconfig
index 8ea26479c48..ff40bd3f7bb 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -31,7 +31,6 @@ source remote/Kconfig
 source rtc/Kconfig
 source scsi/Kconfig
 source sd/Kconfig
-source semihosting/Kconfig
 source smbios/Kconfig
 source ssi/Kconfig
 source timer/Kconfig
diff --git a/hw/meson.build b/hw/meson.build
index e615d72d4df..8ba79b1a528 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -30,7 +30,6 @@
 subdir('rtc')
 subdir('scsi')
 subdir('sd')
-subdir('semihosting')
 subdir('smbios')
 subdir('ssi')
 subdir('timer')
diff --git a/hw/semihosting/Kconfig b/semihosting/Kconfig
similarity index 100%
rename from hw/semihosting/Kconfig
rename to semihosting/Kconfig
diff --git a/hw/semihosting/meson.build b/semihosting/meson.build
similarity index 100%
rename from hw/semihosting/meson.build
rename to semihosting/meson.build
-- 
2.26.2
