Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2581575lfo;
        Sun, 31 Jan 2021 03:14:19 -0800 (PST)
X-Received: by 2002:a5d:5484:: with SMTP id h4mr13521895wrv.94.1612091659235;
        Sun, 31 Jan 2021 03:14:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612091659; cv=none;
        d=google.com; s=arc-20160816;
        b=sWZni/NsC9IF4DG0eMl+5847OQdoid0YTW7yMjAEe6+90Shz/oLVxAnX56JWo5Sior
         tGB5ZMO3DBXnMdnBcFfH4ZoTaJdUbCgyFtK3DhwHyC4w+wR185m/XCevTIJySu8C/G3E
         qLryEgsU+FLV7P2uaf4S5qHcYbUEtIzebGLr4i3xWSCuAPxm5WHWoPm6CLgBPrg4NtzG
         lFAqKo466gWNCQs2VrwnOawdjzXge3qHsiboFPWbN/QhJW2xnlnb6EtS+2UbLTXuZteA
         DcWGLMavAgu43IFq2Q/G/dHppyyo5fcdd4CLq0tL0/QrdGY8zzf39Bz724GbZdhZyPf/
         UDJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=E+U3nLCLAwB5cFSUB8M9sBsCoJgPFLGLn3AiQdETqYc=;
        b=ZxZ7XIk2geoizFg9M7gTKqzM7ESYbGv0akhSuPIFXAyKbNFJ7H6qG5aEOpFINtOsRG
         dfqkV7Oc16/XkMdbXo1QLqjPKr4a/MFFrwbPoul/25x3G8O51fVmOKX7Xcb3XRxbnq+o
         FsgaKVuWLSv4aswkGyCthpq/e1upU/+pDxS3EVa2cBnoBfUIrcpCm9VcIz8LVy3C4pvW
         yGQFujh3NcvYP/Gzx61N5steFnfTiM9r+DIY/5jmOGwK4WRra8s2Scje52bs4234TJSp
         2aJo1YLUJnbYhXrSYsj5/FewSo1non8MAhk4QXQPOx0aXzuKAbwe6okJN9vIL19v1v8y
         vpBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=F7xvz2a4;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k18sor7227863wrl.53.2021.01.31.03.14.19
        (Google Transport Security);
        Sun, 31 Jan 2021 03:14:19 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=F7xvz2a4;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E+U3nLCLAwB5cFSUB8M9sBsCoJgPFLGLn3AiQdETqYc=;
        b=F7xvz2a4Av9sQ1J9xlj0W/SmUCWPaAf/0CAl9b76xFlgd3Ytn6xlEVysgmoLA//gwV
         Fz6eLoh2H2dcE3xuCpdg1Sr/HLsW6AwUAL2lf9WxOf4LqraNJIuuSS4XH5L/nwBaSaMy
         9YuQhbCAK/xKKMe6SUWazsFHadNxZSika87+p8A5uNbHdcvWxNIqlkja8JCP+LeZzAld
         Cm7PLKH7OfOOSGzDus7KJeYeCUz/xY4HV+VXd6tNnqqVWTJ0GfPLCuy8/yuxt9iA82Yi
         dCSD2p24tt4KAyc+WvQz9fFx4qOQ4dy8o6Vdj9NHFJ4/PCpZM+qYfH4MLJi0OBFAlw5Y
         7HHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=E+U3nLCLAwB5cFSUB8M9sBsCoJgPFLGLn3AiQdETqYc=;
        b=LtJbEHnFUnxXj9beD1xW1ThwvBfE9z01e0J5sLK42QoXwv9drz/UYr+JXDF7I2f8HV
         8OGiD6wAHLh1iIdi+Hgd4eScqONEzJz1KO6lJdyBMuqeU43yDpTbnipiKZtBIQsokQiY
         a/WmjDw3a891sBWb8Crclwc4TnuGkEBeTsgbWDf9RSzsd0fc9et4D4aOMCjliDhWPulD
         QsSHT9HAfPUImclNsopWSGWnpegwSWlVaH68RfXDOVIRZOTKaRMF6B+o/Nb2WTnYWJFl
         uojLVs7XRFrxt6GhvxNS72p/3cPmodarpfhfHZ0OumK1dPBohbQq+u3mb2TiBku2mTtc
         6HVA==
X-Gm-Message-State: AOAM532DHDHVBBEWYpWGZ+rwszjrwgw46lwYKf73J+HrVkYGsmz+zvlu
	EjEoFRUUbYomMA1KEVpjzuM=
X-Google-Smtp-Source: ABdhPJy30l58DKSg0ZGp97k54Lb3Vy3dgfEEA0Qiy7Cu/d9Ok8KuwBLumNkzx3d49+pKEvKyVuELcw==
X-Received: by 2002:adf:f606:: with SMTP id t6mr13317727wrp.360.1612091658986;
        Sun, 31 Jan 2021 03:14:18 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net. [83.57.171.7])
        by smtp.gmail.com with ESMTPSA id i15sm11407947wmq.26.2021.01.31.03.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 03:14:18 -0800 (PST)
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
Subject: [PATCH 09/10] target: Move ARM_COMPATIBLE_SEMIHOSTING feature to target Kconfig
Date: Sun, 31 Jan 2021 12:13:15 +0100
Message-Id: <20210131111316.232778-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131111316.232778-1-f4bug@amsat.org>
References: <20210131111316.232778-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: LBFIC7cVEqSs

ARM_COMPATIBLE_SEMIHOSTING is an architecture feature, move its
declaration to each target/ARCH/.

Note, we do not modify the linux-user targets, as user-mode builds
don't use Kconfig.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/devices/arm-softmmu.mak     | 1 -
 default-configs/devices/riscv32-softmmu.mak | 1 -
 default-configs/devices/riscv64-softmmu.mak | 1 -
 target/arm/Kconfig                          | 1 +
 target/riscv/Kconfig                        | 2 ++
 5 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 341d439de6f..0824e9be795 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -41,5 +41,4 @@ CONFIG_MICROBIT=y
 CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
-CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 CONFIG_ALLWINNER_H3=y
diff --git a/default-configs/devices/riscv32-softmmu.mak b/default-configs/devices/riscv32-softmmu.mak
index 5c9ad2590ef..94a236c9c25 100644
--- a/default-configs/devices/riscv32-softmmu.mak
+++ b/default-configs/devices/riscv32-softmmu.mak
@@ -3,7 +3,6 @@
 # Uncomment the following lines to disable these optional devices:
 #
 #CONFIG_PCI_DEVICES=n
-CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 
 # Boards:
 #
diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-configs/devices/riscv64-softmmu.mak
index d5b2e25b6df..76b61956489 100644
--- a/default-configs/devices/riscv64-softmmu.mak
+++ b/default-configs/devices/riscv64-softmmu.mak
@@ -3,7 +3,6 @@
 # Uncomment the following lines to disable these optional devices:
 #
 #CONFIG_PCI_DEVICES=n
-CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 
 # Boards:
 #
diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index 1f05de47ca6..ae89d05c7e5 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -1,5 +1,6 @@
 config ARM
     bool
+    select ARM_COMPATIBLE_SEMIHOSTING
 
 config AARCH64
     bool
diff --git a/target/riscv/Kconfig b/target/riscv/Kconfig
index b9e5932f13f..c3b9d8a1cf1 100644
--- a/target/riscv/Kconfig
+++ b/target/riscv/Kconfig
@@ -1,5 +1,7 @@
 config RISCV32
     bool
+    select ARM_COMPATIBLE_SEMIHOSTING
 
 config RISCV64
     bool
+    select ARM_COMPATIBLE_SEMIHOSTING
-- 
2.26.2
