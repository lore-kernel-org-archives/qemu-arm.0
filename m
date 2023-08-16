Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp365653ejs;
        Wed, 16 Aug 2023 06:43:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:88f:b0:682:7d8a:f891 with SMTP id q15-20020a056a00088f00b006827d8af891mr2695210pfj.20.1692193406492;
        Wed, 16 Aug 2023 06:43:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692193406; cv=none;
        d=google.com; s=arc-20160816;
        b=0imtJD3D5ccrDUNT4/KQ4NxfdnyKEOb08ZZDCLCMNciyl1X3TdDeVl8OA9CGHJiKQz
         Y45AkY8A1+qlbT2dEIfOBspWzYc5Tyhs8ehPMw6ZMDDrrM+mL2Q4TmKHWHU9xKfgpGUx
         aYYD56X5MUVL1xpWYv/OAUU5SefbPbO3Z9usWcn6pdVZrnVjg8RNKijyLhEUSd7I4JZN
         4wIhzpJ/U7/BhZtBj3s1c9of4y4jRiSoSeZs2UQNh/PsAIwr6jlWZ8ZRBMKH853onVJm
         FEKLs4VvXxyKUhqkwqKWyYo91pkOFoz/QUhgOOuI/NnjZM3JWUki1fiyROWPKhYIivNn
         jsHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0qn3f+dV41vakExUKDLgOPwYM5dZMF/vR3FB6T+MC1c=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=LbgRH+R2Sg/KZ9PxR7HTQrigNSMi2+eOxZom01U8Q+tzM1yA2lJ9HMDn07V7HXwnXw
         OQeXBEpkOJce0BcAMvOUUV4iz3R70+oulvGNefKGI00hkcUcBE3oRrua343sk9pfhDxS
         8siX+vXeiT/xULPG+mM7y22gqCuUp5Z0g5ixOB8CyTlbYtjfHwsxqwtH3riQrGYISzxB
         qwxK6eiPYznC9raOP2PtEbqj0QJQ+5O9f4THg47lHsrGlDQ9yb357oKyFaoMqTJ72Qbu
         a5p7JlanEoSQmO6olOotQZQP332KUXq1TXnxB0PHM1KSPRHYIQ7ag2vn/LPjq7BTJYe2
         1YOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=s6ES09GX;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d123-20020a633681000000b00565eb0b675esor1612799pga.10.2023.08.16.06.43.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 06:43:26 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=s6ES09GX;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692193406; x=1692798206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qn3f+dV41vakExUKDLgOPwYM5dZMF/vR3FB6T+MC1c=;
        b=s6ES09GXwAd0fqEkEwKu0lX63fhQI9WnvlcsRwm0KOPq4BMPK6+3GGxt2sOrfc4bSN
         mh8Cjgz0SrBGhwDqgfkI1u2h8D8Cb7dV9icQwv+Wn+ALCp/vahe1MQtYDoj1yjZHz2eB
         JjXvhnIpMbDGDBLMdMedb+Ydbo4nYqCHD6/QnHJHkiP/LEe1/gjMx8Nn09EOvTAJnHLw
         h482DyCdO4NgtXe1F/oW7WXnZkREyrsCe9ag2suMUeI8+Dl4oWCCJYKZN8yTPwfSre0w
         6T5217hBqZRuvb/V8SgnX6x25yaL1Y+yiXUbdcRmH4MvB0bQkGSsXcy8opHyDsVLDA8P
         IsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692193406; x=1692798206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qn3f+dV41vakExUKDLgOPwYM5dZMF/vR3FB6T+MC1c=;
        b=Wy64qxd82+/uoNzJJ9oAOK5a/zUUXdpBrRplTG5euNN1H+9dzIdODxxfs3n2WYiaAL
         3QuFHIM4F0cKf6kDT938+QbVaRiCDh5qESv7bmp3deI4SZBpkp4JyUGWyOlABbKYFcgv
         nHRW93eodM3/CzitCZkq7Vc/NoBJOlBgw0/s4ZPWkd4zSfhhdkbt5v/UjCx8mnYZoGmh
         269kj7w9xRDIXJdYqA2JRdKtEzWP9bGe4LUTpUNG55tNsTjpmmHaPic6eWWzX0pn1F80
         ARS0+Fg/58B4itqZSlS5KbaLLthTKI+UW4mvkvhZ/i672LjPwbPL2Cj4BdkeXZpXKSaP
         xNjQ==
X-Gm-Message-State: AOJu0YyfASWzPUEcl/vdOnH+TjJdZsPKS6MVEzP9WQHvb9EZe701gHB6
	/cN3wDBppz/2obfAt7yQ41EFVg==
X-Google-Smtp-Source: AGHT+IEE6zg1iisf/BY2GI7OfzNzFpNOMNhKi2CMjEzPXIMNiLOzvHWmfvFey3Dqe/KWNFVdtTdkKg==
X-Received: by 2002:a05:6a20:3d07:b0:13b:7848:9515 with SMTP id y7-20020a056a203d0700b0013b78489515mr2597217pzi.13.1692193405971;
        Wed, 16 Aug 2023 06:43:25 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id k3-20020a637b43000000b0056601f864aesm928355pgn.2.2023.08.16.06.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 06:43:25 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Brian Cain <bcain@quicinc.com>,
	Song Gao <gaosong@loongson.cn>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Laurent Vivier <laurent@vivier.eu>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Stafford Horne <shorne@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	Anton Kochkov <anton.kochkov@proton.me>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 21/25] cpu: Call plugin hooks only when ready
Date: Wed, 16 Aug 2023 22:39:31 +0900
Message-ID: <20230816133938.18310-22-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816133938.18310-1-akihiko.odaki@daynix.com>
References: <20230816133938.18310-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: +hniW9GNakQi

The initialization and exit hooks will not affect the state of vCPU,
but they may depend on the state of vCPU. Therefore, it's better to
call plugin hooks after the vCPU state is fully initialized and before
it gets uninitialized.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 cpu.c                | 11 -----------
 hw/core/cpu-common.c | 10 ++++++++++
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/cpu.c b/cpu.c
index 1c948d1161..2552c85249 100644
--- a/cpu.c
+++ b/cpu.c
@@ -42,7 +42,6 @@
 #include "hw/core/accel-cpu.h"
 #include "trace/trace-root.h"
 #include "qemu/accel.h"
-#include "qemu/plugin.h"
 
 uintptr_t qemu_host_page_size;
 intptr_t qemu_host_page_mask;
@@ -148,11 +147,6 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
     /* Wait until cpu initialization complete before exposing cpu. */
     cpu_list_add(cpu);
 
-    /* Plugin initialization must wait until cpu_index assigned. */
-    if (tcg_enabled()) {
-        qemu_plugin_vcpu_init_hook(cpu);
-    }
-
 #ifdef CONFIG_USER_ONLY
     assert(qdev_get_vmsd(DEVICE(cpu)) == NULL ||
            qdev_get_vmsd(DEVICE(cpu))->unmigratable);
@@ -179,11 +173,6 @@ void cpu_exec_unrealizefn(CPUState *cpu)
     }
 #endif
 
-    /* Call the plugin hook before clearing cpu->cpu_index in cpu_list_remove */
-    if (tcg_enabled()) {
-        qemu_plugin_vcpu_exit_hook(cpu);
-    }
-
     cpu_list_remove(cpu);
     /*
      * Now that the vCPU has been removed from the RCU list, we can call
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 549f52f46f..e06a70007a 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -211,6 +211,11 @@ static void cpu_common_realizefn(DeviceState *dev, Error **errp)
         cpu_resume(cpu);
     }
 
+    /* Plugin initialization must wait until the cpu is fully realized. */
+    if (tcg_enabled()) {
+        qemu_plugin_vcpu_init_hook(cpu);
+    }
+
     /* NOTE: latest generic point where the cpu is fully realized */
 }
 
@@ -218,6 +223,11 @@ static void cpu_common_unrealizefn(DeviceState *dev)
 {
     CPUState *cpu = CPU(dev);
 
+    /* Call the plugin hook before clearing the cpu is fully unrealized */
+    if (tcg_enabled()) {
+        qemu_plugin_vcpu_exit_hook(cpu);
+    }
+
     /* NOTE: latest generic point before the cpu is fully unrealized */
     cpu_exec_unrealizefn(cpu);
 }
-- 
2.41.0
