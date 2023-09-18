Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3011456ejb;
        Mon, 18 Sep 2023 09:04:24 -0700 (PDT)
X-Received: by 2002:a17:906:5354:b0:9a5:7887:ef09 with SMTP id j20-20020a170906535400b009a57887ef09mr9252829ejo.32.1695053064428;
        Mon, 18 Sep 2023 09:04:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695053064; cv=none;
        d=google.com; s=arc-20160816;
        b=qO7ursckrepMSbVac92zH5GmMf4h6JwoH1lKP9fBZcO+cbjhhaONmgq/dC33y3yBO4
         GfNukDSaI60PqDeqrqplgCcpbGt3+jvo2EhFiLWZ42N0opSBdQ5n4f9fYjuqQRNqsiyY
         bLel7Jc892BxSEWJGM6PJht0MPAxkTU/Jlg/SxQ3VNals3KDuupOXIsvdLlpM/pZKEb4
         dSOLB0xJm9y7dvEO+joyfWb+Gf4kI2MNjmHX8w8jfQKv9JMl7QKVKO7v3gfB+WXoUjM2
         d7FPgEKIsrwzjIJiHNtu/f2toRhyYJ6fLom+5NxH7l3YKEyvEL79OwNEq/KNOrsuM2+p
         1gEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=s5SThQE8VrEigaiBVVD1aPn+S9Eqq7fLgyN+q+7eopw=;
        fh=AIYNAcrfQPdTp+tiOBYg2bCy2NfWRbXD73JV9SLWbpM=;
        b=cZoLVCbSHPAmqhhLkMzX6CvXFmIYc89UaSQlAvliW7xXAYdc460jmjbu3MyC87hOwp
         GYJD0C2t7jKWNlP4fYZzUARoiyJjtm/74AgaQjw1dG74/6kZ/h+TjnAOVghgxphvUT/+
         +EAiYiO88bfgh2QK1V8R8RynM4FJl+oQAR+HfTb3/G1j2j/zGVyqeeBk60Oh4WIOGAyt
         CjiCsrJLzaffyTPISHhOCHVTEIbmNwAF9WGPiS1EL5uG5Wci7sfMBZnhQJNQ8OEAViop
         z7A8+0wynzQRfDqGKIg5NDsDv/Zne4c93t0fzNsFVrq+8ut6StEz9st6F/oFSci14jPw
         mnLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c6VrWiLk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id my13-20020a1709065a4d00b009a1ac488f0esor2781471ejc.2.2023.09.18.09.04.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Sep 2023 09:04:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c6VrWiLk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695053064; x=1695657864; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5SThQE8VrEigaiBVVD1aPn+S9Eqq7fLgyN+q+7eopw=;
        b=c6VrWiLk4RDhXkfz33Y8qJFSIjQM60jePl3F5YixlbxeE4Zv1mqhQ8zMFt3xJKm8sA
         fk14uLFuCm4m3AQxGJXysI0MTAN7Emr0Ifx0Qr1cKXF+/fnl9MnNZo6EJQVh0YlsI0Gv
         VNQllk0LGhP///eTLkHXJIZtuIdBbzyQAbVf/4ySmzTDWTq4e2y7onxuosB0eTt2JwYm
         YdLVWqpD6faIX6ENEjLSlqS/qp+ENffNqY337AJePkN6H3gd4KWm+6gVciGoS+/vj+9F
         wwUZyx8BwZc0CNeTAg+63SDijOYxbLJFDv0OF+T03qjzy0Y79JBGtMcBbg27nRWyQ4bs
         dxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695053064; x=1695657864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s5SThQE8VrEigaiBVVD1aPn+S9Eqq7fLgyN+q+7eopw=;
        b=K6BTAya0SOudMyPgKNahcWbPJvIWQX1my6eS99NnDAUXY0QNxhfK5VoWTqCuH05plY
         tLfXfM2w+YP5bJHhZk2LeI2kNAd0DdRX+nM2xfWQyjy5YZ76Ulenyj2GPoeqLIVM/EM+
         DOG7p4l39QNa/PFSBQNAJE4UlVwnsTxh0j03K9axFQKT2MICXe6wq1NB+EpeJJuZQ52d
         g3DqVSWGxe5tw8MtYv+bVZ8CNzL1n77qt4DHsBOZlqd/8siYLjbnpuuegVYjIFDSy5LY
         HjIal402RAp8sZCYQdcvt4YN4/htnkW3o4Fklspio1P7fk5DqF6YZ9CF4rRXOeaLoWdQ
         VMyw==
X-Gm-Message-State: AOJu0YyICJQlmI9eh7WDiCjoRztAGvahJ82QJygBwClqf/e+MiBRG1dI
	Ve9ZCOzVBuuKlaGzBmkKvLKNM0aE
X-Google-Smtp-Source: AGHT+IFdhAv8NMQe3eDFfz6fXbmFXmpOAUlZ51p/ozjG+nSdvaZT7LZnHlxk4GI+z0N+RInhKW7YXQ==
X-Received: by 2002:a17:906:768f:b0:9ad:fb23:21cf with SMTP id o15-20020a170906768f00b009adfb2321cfmr4715553ejm.15.1695053064161;
        Mon, 18 Sep 2023 09:04:24 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id c26-20020a170906341a00b00993470682e5sm6646928ejb.32.2023.09.18.09.04.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 Sep 2023 09:04:23 -0700 (PDT)
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
Subject: [PATCH 16/22] target/arm: Extract verify_accel_features() from cpu_realize()
Date: Mon, 18 Sep 2023 18:02:49 +0200
Message-ID: <20230918160257.30127-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918160257.30127-1-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pDDl1+wy8qY9

When looking at the arm_cpu_realizefn() method, most of the
code run before the cpu_exec_realizefn() call checks whether
the requested CPU features are compatible with the requested
accelerator. Extract this code to a dedicated handler matching
our recently added CPUClass::verify_accel_features() handler.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.c | 41 ++++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 46d3f70d63..a551383fd3 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1675,19 +1675,10 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
     }
 }
 
-static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
+static bool arm_cpu_verify_accel_features(CPUState *cs, Error **errp)
 {
-    CPUState *cs = CPU(dev);
-    ARMCPU *cpu = ARM_CPU(dev);
-    ARMCPUClass *acc = ARM_CPU_GET_CLASS(dev);
+    ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-    int pagebits;
-    Error *local_err = NULL;
-
-    /* Use pc-relative instructions in system-mode */
-#ifndef CONFIG_USER_ONLY
-    cs->tcg_cflags |= CF_PCREL;
-#endif
 
     /* If we needed to query the host kernel for the CPU features
      * then it's possible that might have failed in the initfn, but
@@ -1699,10 +1690,13 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         } else {
             error_setg(errp, "Failed to retrieve host CPU features");
         }
-        return;
+        return false;
     }
 
 #ifndef CONFIG_USER_ONLY
+    /* Use pc-relative instructions in system-mode */
+    cs->tcg_cflags |= CF_PCREL;
+
     /* The NVIC and M-profile CPU are two halves of a single piece of
      * hardware; trying to use one without the other is a command line
      * error and will result in segfaults if not caught here.
@@ -1710,12 +1704,12 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     if (arm_feature(env, ARM_FEATURE_M)) {
         if (!env->nvic) {
             error_setg(errp, "This board cannot be used with Cortex-M CPUs");
-            return;
+            return false;
         }
     } else {
         if (env->nvic) {
             error_setg(errp, "This board can only be used with Cortex-M CPUs");
-            return;
+            return false;
         }
     }
 
@@ -1733,23 +1727,35 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
             error_setg(errp,
                        "Cannot enable %s when using an M-profile guest CPU",
                        current_accel_name());
-            return;
+            return false;
         }
         if (cpu->has_el3) {
             error_setg(errp,
                        "Cannot enable %s when guest CPU has EL3 enabled",
                        current_accel_name());
-            return;
+            return false;
         }
         if (cpu->tag_memory) {
             error_setg(errp,
                        "Cannot enable %s when guest CPUs has MTE enabled",
                        current_accel_name());
-            return;
+            return false;
         }
     }
 #endif
 
+    return true;
+}
+
+static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
+{
+    CPUState *cs = CPU(dev);
+    ARMCPU *cpu = ARM_CPU(dev);
+    ARMCPUClass *acc = ARM_CPU_GET_CLASS(dev);
+    CPUARMState *env = &cpu->env;
+    int pagebits;
+    Error *local_err = NULL;
+
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
@@ -2383,6 +2389,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
                                        &acc->parent_phases);
 
     cc->class_by_name = arm_cpu_class_by_name;
+    cc->verify_accel_features = arm_cpu_verify_accel_features;
     cc->has_work = arm_cpu_has_work;
     cc->dump_state = arm_cpu_dump_state;
     cc->set_pc = arm_cpu_set_pc;
-- 
2.41.0
