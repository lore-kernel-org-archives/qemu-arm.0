Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp414558ejs;
        Wed, 16 Aug 2023 07:55:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:96c6:b0:133:bf9a:dd16 with SMTP id hq6-20020a056a2096c600b00133bf9add16mr1927614pzc.35.1692197737534;
        Wed, 16 Aug 2023 07:55:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692197737; cv=none;
        d=google.com; s=arc-20160816;
        b=qXjXzNfa4lTBtHHr7co2RaJXZBmLiIEZPiekpOggCrLnERKaoWAjOPVK9+epkVAwu2
         0/Te2OenYLxcJv/RzNGFO0JwVXTRQFV72USgs0d6Tf3SA44L1ZGk4NTK72YbzbO7vGEm
         nstet0xezHcTBxoaoeU7KWlUSvvoKFO3IwlNy6SET4Crl2LfJOraeN2z/iyc8BhmXbnZ
         IvslepCHBtuecgWph057azLcckzClyMmyEjIsejEitp5pQ5TE4liRxHiezHcki6XDqY+
         ZkEEsOF2xxOaW8qQC/7dt55sjdaE+9zNLSg46ATqsYQfpUnkSol+8KG0p2dda+TifQqu
         Nx8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0qn3f+dV41vakExUKDLgOPwYM5dZMF/vR3FB6T+MC1c=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=B70z+nikGd/Y9QcSbbNI8twMLKHegID9yskB6PtEbhhqIHN7uHiCp2kX4c8Ej5QpzU
         x1H53l4aJkCp4j+893GOaWU/Iqa2irScCAWfmIGRIeoejYBHSmmu7jo2zHpJNlSAgC8B
         camZT/HOaKlsOKgeOrNC6M8+tlD+ZZ3oTjvRF6NnKZrzhAafR2xwPkm6PyNKP3B+b5VB
         CqRG9AQ/wEjlubzdze+TuTnQ501u1LAEuDXnDp/GKul6AaF7WvPnfbyO/EDZ9KXPY8Sb
         sU+P/RmSZI1VBBsBKa43mLfiYhnI2dFkOC1HN7noAudWSpTrKj4ezYEIMFy+44uei/Li
         qfAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=2L6AVfTz;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k27-20020aa79d1b000000b00687c4dd9ef9sor8651461pfp.2.2023.08.16.07.55.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 07:55:37 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=2L6AVfTz;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692197737; x=1692802537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qn3f+dV41vakExUKDLgOPwYM5dZMF/vR3FB6T+MC1c=;
        b=2L6AVfTz8CvAuULFJ42gQy1cf81eTocVTR9UQPe1fZA45I6oVAj44sl+BwBrM78/VK
         HUFfz3K443rrxYfy5KN2ngwKcKC60/Ui3zZs/BoXrxAm1ocq4NC8GNYkfB6hdnzL0BHI
         /JKw/tUOcQSKCGXzNY5SHv2+yb1j5/evBRsoonu7IYBSSQfgCQQRrPly2NlcwYhWru4Q
         7hbwGsWwzSuKfjdmsPQPoDZC5iUPONhwx357Qu+/XtVOcIzPKuuE1JigqsYBC1mYMU3r
         yCaOe62NjZTsz6SmSOS8kJCn0auKsjtQ4xYc837Bix9YbhG7UrntGc9K+RBD5XFKXdBm
         IkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692197737; x=1692802537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qn3f+dV41vakExUKDLgOPwYM5dZMF/vR3FB6T+MC1c=;
        b=LAFnyILCt5ikq2mmQqetwHlfclAhb28XSgjZnhbK+j0rVDvTlsfSNhDfS7BS634IH4
         tqFrXLUGcufH+s/xnT2zxlfphRqhvmkBE6jt9qzL/gl8ulIOY6qTkzo4sGZ+p3qF9zjy
         KOWhSr9vbLa8Y8KfZdVUmZ0s69AGtkfNWUZZOS6xbnISr+cnYY2P7uS58anxO4qSy998
         B9y3MGIQ/IDXkqQ+dgOMWEJRQZmWR6qdP4kcA1K7mFWobZihQ1aQbAo4ZMFAXCw7Apdx
         HkPIQ6S5bWjo3dL3T4FBgrTYrmFz/iE1mTcvZPtZ/1hBlQgGznj0lLPnvZuZ3es+Qvgq
         BJqw==
X-Gm-Message-State: AOJu0YwEq8mN4iFhKGFTQQyJqzO7PUsxHyD6itm5vYBPnJopArzXbvOf
	vkpbPxlst0O41a/4L1b8rSWR7Q==
X-Google-Smtp-Source: AGHT+IHaIIuGZ2gUrulonpwa65Nz3Io06fPnbVxiGrNLkLfEmh35nLZt8QKhsSDdZF7/OhNxd0e1YQ==
X-Received: by 2002:a05:6a20:9189:b0:134:2b31:e2a9 with SMTP id v9-20020a056a20918900b001342b31e2a9mr2356825pzd.0.1692197737066;
        Wed, 16 Aug 2023 07:55:37 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id fk26-20020a056a003a9a00b0068892c40253sm1156568pfb.216.2023.08.16.07.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 07:55:36 -0700 (PDT)
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
Subject: [PATCH v4 21/25] cpu: Call plugin hooks only when ready
Date: Wed, 16 Aug 2023 23:51:42 +0900
Message-ID: <20230816145155.21049-22-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816145155.21049-1-akihiko.odaki@daynix.com>
References: <20230816145155.21049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: +SfL38hQ2dFz

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
