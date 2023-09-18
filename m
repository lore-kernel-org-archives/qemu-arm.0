Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3010552ejb;
        Mon, 18 Sep 2023 09:03:21 -0700 (PDT)
X-Received: by 2002:a2e:9215:0:b0:2c0:20e3:9905 with SMTP id k21-20020a2e9215000000b002c020e39905mr557567ljg.21.1695053001155;
        Mon, 18 Sep 2023 09:03:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695053001; cv=none;
        d=google.com; s=arc-20160816;
        b=eooYwIRCD8dyEDIeouawDkA2N6lKqWC9Lr1lEEICxLVxQy5USiIB3DBLnEPx9eokGp
         Jt/L4/eqnGELcjajtt9h6I7a20GP+b4fz7EtHN9uJZhwq9Su3BjvCvSzsfb6sMT8N6z3
         0o3mivGS8VczejF9hcDReLZsLLCbEtIF8f/NYymu984sgnWQbvex+JPYNvocQ6Q1Y9I5
         0+hfnpuUoPx9+pmYSeRnYi5RR/z+W1o05E5JpTVNN11BAMP8Y4LqIJZk6BXyBcu6V8sG
         wzC+hUijqYcw3n2SEz9LflJ9pEBHOv1gtdZY+zO6pW9vvT949DtofZKz2ruu1ks8YnRf
         6J3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=IHtTfQAIBirG1HCAZXzmunPPBo4zEHxiDOOzxMZ7AZo=;
        fh=AIYNAcrfQPdTp+tiOBYg2bCy2NfWRbXD73JV9SLWbpM=;
        b=bgHl9X/rtWPfW8wjzaKSIjDKrLbcMiEbl2YO1aD6Gm/MqSM9unrebyS6wEdw6BIlpT
         6vWuE9ltfixlxQRxFuXVDASt6X+yp3HMLerPS2aXyMytQp461AVVv1yDA9eyZzDDYg6t
         /7Lwp6C0EATHKYvoNuSKbyEj32LNbRzhvcvVpm75ejTt55kc05AGhGYgN4nujhnpDpht
         lpnR1IvOao3NhYCq3/T1sboTK44ttuqM6i7k38VbXouubAYuN+XyFYQO++WLZzJ2NqQa
         fb1z8/Y0Jyv11bbLBFPPbmKmwPeowPZ+0ITzXm+9ZdSAUfw8nCpCaVnvL4vYrGEbWDXT
         O6zA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GdSeKJWN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s18-20020a2e2c12000000b002c01f752630sor277001ljs.4.2023.09.18.09.03.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Sep 2023 09:03:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GdSeKJWN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695053000; x=1695657800; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHtTfQAIBirG1HCAZXzmunPPBo4zEHxiDOOzxMZ7AZo=;
        b=GdSeKJWN8ISGmIuZS7eTHsGfRBIvaRyrz4ZCe1ekuDQzZXYp0wb1tvX08xdbIFks+W
         nXZLFDjEXOiY/HVzKw3ajRstFkRYJUQDs1bAHC9MuyVvG3308cuS912/FHH5+DFOVrD2
         fp326CSQG5eqPRmqApyTUxJIsj8liW8ezfxwx+mms1orEVuzXFXfPb4LvHow0lkijvkq
         3cr16m8B9AdsHki94hRLra4vgFEeIFzJnWE+rY2ZBfvwXDKN4GsrbRheNquP8n1WGwtf
         DoeEmTM/7afp2/v38nCXfiLEaxB25cXNryMOURy81V7my/LQArZBiW1PhzZdpdWRleJa
         3Pog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695053000; x=1695657800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IHtTfQAIBirG1HCAZXzmunPPBo4zEHxiDOOzxMZ7AZo=;
        b=U/XKnRvKXnWTXwq8OYX+vA0PVwaBCH4F7g3Oy3fOoAU7UF/NxQyGHpIXGSqH+Gl0z6
         ZQIjquhL2F4FiHNtlesPXM7qengCCdQHqoFjzikT0SNi9IdGgcePCkFJ4z5Hj/0hbeVF
         ybd0Fc5g7yiTF4KGHD2xMKYyHxQLCUSDvnUFjbQ4m27U3HFscf8Q9WiNoIGuTf4wXX7q
         ZeNCvN/zA18CRwKJDGMDJ5ye8dJD/xhhA4QNEDr374BPi/GdJ7coi8ZyqYp5oCsnwHmf
         37Q62SWFAZXLi6MUC71es1OmGT4W7r0/qKIVuvI+bo81tgk/DKh7pvWOYBRO8g/XtX9O
         WoAA==
X-Gm-Message-State: AOJu0Yw1xtlHJb3MMbfjrtrGLxOI5kuCtYHkI+YF/CWbV8KlDxzuSsXL
	VNjPdTD0APRwGjN5hxKD4+Cp1y/P
X-Google-Smtp-Source: AGHT+IEWZ8OvbK8IRiy/Jhtc4eSQt1wBjNiYifGIN1NUEuxb4lugjSxo6X0cKrO69EMr+Le0e2o0NA==
X-Received: by 2002:a2e:a178:0:b0:2ba:6519:c50f with SMTP id u24-20020a2ea178000000b002ba6519c50fmr8070679ljl.52.1695053000497;
        Mon, 18 Sep 2023 09:03:20 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id e7-20020a1709067e0700b0099bd0b5a2bcsm6658963ejr.101.2023.09.18.09.03.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 Sep 2023 09:03:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Anton Johansson <anjo@rev.ng>,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	Marek Vasut <marex@denx.de>,
	David Gibson <david@gibson.dropbear.id.au>,
	Brian Cain <bcain@quicinc.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Claudio Fontana <cfontana@suse.de>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	qemu-ppc@nongnu.org,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Alessandro Di Federico <ale@rev.ng>,
	Song Gao <gaosong@loongson.cn>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Chris Wulff <crwulff@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Fabiano Rosas <farosas@suse.de>,
	qemu-s390x@nongnu.org,
	Yanan Wang <wangyanan55@huawei.com>,
	Luc Michel <luc@lmichel.fr>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Bin Meng <bin.meng@windriver.com>,
	Stafford Horne <shorne@gmail.com>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Bernhard Beschow <shentey@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-riscv@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Greg Kurz <groug@kaod.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Markus Armbruster <armbru@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [RFC PATCH 04/22] exec/cpu: Never call cpu_reset() before cpu_realize()
Date: Mon, 18 Sep 2023 18:02:37 +0200
Message-ID: <20230918160257.30127-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918160257.30127-1-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Ecj9ZbMiuWUC

QDev instance is expected to be in an unknown state until full
object realization. Thus we shouldn't call DeviceReset() on an
unrealized instance. Move the cpu_reset() call from *before*
the parent realize() handler (effectively cpu_common_realizefn)
to *after* it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
RFC:
I haven't audited all the call sites, but plan to do it,
amending the result to this patch description. This used
to be a problem on some targets, but as of today's master
this series pass make check-{qtest,avocado}.
---
 target/arm/cpu.c       | 2 +-
 target/avr/cpu.c       | 2 +-
 target/cris/cpu.c      | 2 +-
 target/hexagon/cpu.c   | 3 +--
 target/i386/cpu.c      | 2 +-
 target/loongarch/cpu.c | 2 +-
 target/m68k/cpu.c      | 2 +-
 target/mips/cpu.c      | 2 +-
 target/nios2/cpu.c     | 2 +-
 target/openrisc/cpu.c  | 2 +-
 target/riscv/cpu.c     | 2 +-
 target/rx/cpu.c        | 2 +-
 target/s390x/cpu.c     | 2 +-
 target/sh4/cpu.c       | 2 +-
 target/tricore/cpu.c   | 2 +-
 15 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b9e09a702d..6aca036b85 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2278,9 +2278,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
     qemu_init_vcpu(cs);
-    cpu_reset(cs);
 
     acc->parent_realize(dev, errp);
+    cpu_reset(cs);
 }
 
 static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 8f741f258c..84d353f30e 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -120,9 +120,9 @@ static void avr_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
     qemu_init_vcpu(cs);
-    cpu_reset(cs);
 
     mcc->parent_realize(dev, errp);
+    cpu_reset(cs);
 }
 
 static void avr_cpu_set_int(void *opaque, int irq, int level)
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index a6a93c2359..079872a5cc 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -152,10 +152,10 @@ static void cris_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    cpu_reset(cs);
     qemu_init_vcpu(cs);
 
     ccc->parent_realize(dev, errp);
+    cpu_reset(cs);
 }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index f155936289..7edc32701f 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -346,9 +346,8 @@ static void hexagon_cpu_realize(DeviceState *dev, Error **errp)
                              "hexagon-hvx.xml", 0);
 
     qemu_init_vcpu(cs);
-    cpu_reset(cs);
-
     mcc->parent_realize(dev, errp);
+    cpu_reset(cs);
 }
 
 static void hexagon_cpu_init(Object *obj)
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index a23d4795e0..7faaa6915f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7455,9 +7455,9 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
         }
     }
 #endif /* !CONFIG_USER_ONLY */
-    cpu_reset(cs);
 
     xcc->parent_realize(dev, &local_err);
+    cpu_reset(cs);
 
 out:
     if (local_err != NULL) {
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 65f9320e34..8029e70e76 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -565,10 +565,10 @@ static void loongarch_cpu_realizefn(DeviceState *dev, Error **errp)
 
     loongarch_cpu_register_gdb_regs_for_features(cs);
 
-    cpu_reset(cs);
     qemu_init_vcpu(cs);
 
     lacc->parent_realize(dev, errp);
+    cpu_reset(cs);
 }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 70d58471dc..2bc0a62f0e 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -321,10 +321,10 @@ static void m68k_cpu_realizefn(DeviceState *dev, Error **errp)
 
     m68k_cpu_init_gdb(cpu);
 
-    cpu_reset(cs);
     qemu_init_vcpu(cs);
 
     mcc->parent_realize(dev, errp);
+    cpu_reset(cs);
 }
 
 static void m68k_cpu_initfn(Object *obj)
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 63da1948fd..8d6f633f72 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -492,10 +492,10 @@ static void mips_cpu_realizefn(DeviceState *dev, Error **errp)
     fpu_init(env, env->cpu_model);
     mvp_init(env);
 
-    cpu_reset(cs);
     qemu_init_vcpu(cs);
 
     mcc->parent_realize(dev, errp);
+    cpu_reset(cs);
 }
 
 static void mips_cpu_initfn(Object *obj)
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index bc5cbf81c2..876a6dcad2 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -217,12 +217,12 @@ static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
 
     realize_cr_status(cs);
     qemu_init_vcpu(cs);
-    cpu_reset(cs);
 
     /* We have reserved storage for cpuid; might as well use it. */
     cpu->env.ctrl[CR_CPUID] = cs->cpu_index;
 
     ncc->parent_realize(dev, errp);
+    cpu_reset(cs);
 }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 61d748cfdc..cd25f1e9d5 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -142,9 +142,9 @@ static void openrisc_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
     qemu_init_vcpu(cs);
-    cpu_reset(cs);
 
     occ->parent_realize(dev, errp);
+    cpu_reset(cs);
 }
 
 static void openrisc_cpu_initfn(Object *obj)
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f227c7664e..7566757346 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1532,9 +1532,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 #endif
 
     qemu_init_vcpu(cs);
-    cpu_reset(cs);
 
     mcc->parent_realize(dev, errp);
+    cpu_reset(cs);
 }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 157e57da0f..c9c8443cbd 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -138,9 +138,9 @@ static void rx_cpu_realize(DeviceState *dev, Error **errp)
     }
 
     qemu_init_vcpu(cs);
-    cpu_reset(cs);
 
     rcc->parent_realize(dev, errp);
+    cpu_reset(cs);
 }
 
 static void rx_cpu_set_irq(void *opaque, int no, int request)
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index df167493c3..0f0b11fd73 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -254,6 +254,7 @@ static void s390_cpu_realizefn(DeviceState *dev, Error **errp)
     s390_cpu_gdb_init(cs);
     qemu_init_vcpu(cs);
 
+    scc->parent_realize(dev, &err);
     /*
      * KVM requires the initial CPU reset ioctl to be executed on the target
      * CPU thread. CPU hotplug under single-threaded TCG will not work with
@@ -266,7 +267,6 @@ static void s390_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu_reset(cs);
     }
 
-    scc->parent_realize(dev, &err);
 out:
     error_propagate(errp, err);
 }
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 61769ffdfa..656d71f74a 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -228,10 +228,10 @@ static void superh_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    cpu_reset(cs);
     qemu_init_vcpu(cs);
 
     scc->parent_realize(dev, errp);
+    cpu_reset(cs);
 }
 
 static void superh_cpu_initfn(Object *obj)
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 133a9ac70e..a3610aecca 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -118,10 +118,10 @@ static void tricore_cpu_realizefn(DeviceState *dev, Error **errp)
     if (tricore_has_feature(env, TRICORE_FEATURE_131)) {
         set_feature(env, TRICORE_FEATURE_13);
     }
-    cpu_reset(cs);
     qemu_init_vcpu(cs);
 
     tcc->parent_realize(dev, errp);
+    cpu_reset(cs);
 }
 
 
-- 
2.41.0
