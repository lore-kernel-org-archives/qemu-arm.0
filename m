Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp274322ejv;
        Tue, 7 Nov 2023 04:27:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPFqOheCOg1/IDEcYj3hMdwpzShnhtXlIoKT8pfoNbEjaVUiQADMjXOTYY6CDRMJ2m2qCn
X-Received: by 2002:a81:7893:0:b0:5a7:a989:b85c with SMTP id t141-20020a817893000000b005a7a989b85cmr13473498ywc.16.1699360077909;
        Tue, 07 Nov 2023 04:27:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699360077; cv=none;
        d=google.com; s=arc-20160816;
        b=v147ziPHZWmwP2916yDcSIvPubFgWcNmuaGS3Fnoo81VrPxBt1sDgnF4iaWX7zs/Eh
         sYi5cLOr6iqcBY6Hjc/pKAdE3T20S4pQJv9PF2PnkvmQ2ui8QhyDRN5j1pZhFZ37FWmo
         XTweMLgBBK2pjtKL7GgI2DXJ53Q0VsI7En3JBhRukBwVnqHTF8wG4wsS7tdqjEitLu5c
         L8TelwhARIaUvnxaDLaUBKeAN4Xf+KsnJ3HK9f9KZCBDRrLr+WI7V9OlYQaPTEcVT3i/
         zblBKTHld5YTNBW++HSnHLagc4P1/DrMSSbixBXrQyiEiQK0WKR+O0T57DcDqkG8p7KY
         fwow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ha90/Hq7XHS9/aRysWmfk7kygcTDZa2YjrZy/ilrJOc=;
        fh=I50AEuyrhfZZbAacjfFSv97+FKVBkRS/oZGw9AaThus=;
        b=hs3ymbUSR2Fi2fqIaJjQ0EsX8bVcwyjumyuEmbxeRdnYAoRCUGIMlvnxTGeFEzdTDC
         nGbUxJssviMCA7pbJnHTdzrNeT2xh9xEI+OVXjxzVMGgFUTtLeqcTotLY87ckLEUsIBe
         m675soXzPgFQEjvt9AHctmk4ZZqq+y0zQkeY85HiM1PNVKu41Hb3AML2LwT5C/DhGUlZ
         P5YpO/xHmrHYVSs/cgkPnyazWf4TZR8hCADlg9O4R5X8Or6XZ8vI8/PuOIxxU5XA11eM
         vSU4Cb8wWTN/WiobnAA8Xy1ZEA/p3koAwcjGCP2MWkFIBORpm3NhG2nkmlTdn+sWoUsW
         PHZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uDhY9spH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i17-20020a0cedd1000000b0065b284d5678si6890689qvr.109.2023.11.07.04.27.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Nov 2023 04:27:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uDhY9spH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r0LAP-0007jR-0a; Tue, 07 Nov 2023 07:26:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L9k-0006Iv-6p
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 07:26:10 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L9h-0005E6-Np
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 07:26:07 -0500
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9c603e235d1so839373966b.3
 for <qemu-arm@nongnu.org>; Tue, 07 Nov 2023 04:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699359960; x=1699964760; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ha90/Hq7XHS9/aRysWmfk7kygcTDZa2YjrZy/ilrJOc=;
 b=uDhY9spH/6Ai8iwOvLh4uZ2XM8p1UnqFJtJ43ozut29LJJMrAO/EB4fQ0vKt64B4+b
 IgJ+n5gCJoYGp6tpyh+EqonU/udVQrxnG2cbuOidbLaGkIWm3S5Kp6dHuEUiBERQaPHX
 lJYjbaSo5C4G4rD1BOReL6QQWwzpdF0LfOPkQevRaje/cPndYGz7k/79i5xhCzrik4Ko
 mGq31brLTWsqpIQ6F7oLjz8muJUNqiGAfJnBKeeZdTmdxLIfssdomQAwwtkhYO/3Qy8D
 T+QKtRSPtvfjXjt0bR4aRx0YBuokBYN3sG5u8qnZe01K9L+QHBCOTeiFVUWhZk2paSsz
 IJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699359960; x=1699964760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ha90/Hq7XHS9/aRysWmfk7kygcTDZa2YjrZy/ilrJOc=;
 b=MugoI4KOyEWYjKsI+LsJzSOLRxiKAPPq5D2noLsrY/R4QEG7CMfOCDEOoFOFBdlcNF
 Cij5xjOK31gAqHSuw8UONHd5bb4oq6sBA/iZpO1IPH6qSFRiTs636fCtuOxdv8rwhISS
 sm1EsolyRcGWTHaT5HZ1saEhL3PxkQszw38FsVgTIwrK94WH0xzN8GrC1GMabvDBTWF5
 d7alrfRd9hJ/TvsWvA8a+FB5gqO55XI4Ka7oHbOcIZ/ArdHWmi2Gf8xP2sg7ZNET6hZJ
 JHW4Jj7NHHceB1BI/BLG988WCamReYK9653znUxN6NHBokMGGdSzgToxSDwYk/qoK8zy
 WJzQ==
X-Gm-Message-State: AOJu0YxTNBFOWrC+wFeJToWhHdJDf8bkTr1bQV+rAn2/DNI5Bd61bdVj
 K3QxmS7SgaSlIOazV0/ZuEComQ==
X-Received: by 2002:a17:907:9603:b0:9d3:f436:6807 with SMTP id
 gb3-20020a170907960300b009d3f4366807mr17965607ejc.42.1699359960111; 
 Tue, 07 Nov 2023 04:26:00 -0800 (PST)
Received: from m1x-phil.lan ([176.187.216.69])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a1709064e4700b0099d798a6bb5sm981057ejw.67.2023.11.07.04.25.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Nov 2023 04:25:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <anisinha@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Laurent Vivier <laurent@vivier.eu>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PULL 51/75] hw/cpu: Clean up global variable shadowing
Date: Tue,  7 Nov 2023 13:24:37 +0100
Message-ID: <20231107122442.58674-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107122442.58674-1-philmd@linaro.org>
References: <20231107122442.58674-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YcaJeDxtn8tI

Fix:

  hw/core/machine.c:1302:22: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
      const CPUArchId *cpus = possible_cpus->cpus;
                       ^
  hw/core/numa.c:69:17: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
      uint16List *cpus = NULL;
                  ^
  hw/acpi/aml-build.c:2005:20: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
      CPUArchIdList *cpus = ms->possible_cpus;
                     ^
  hw/core/machine-smp.c:77:14: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
      unsigned cpus    = config->has_cpus ? config->cpus : 0;
               ^
  include/hw/core/cpu.h:589:17: note: previous declaration is here
  extern CPUTailQ cpus;
                  ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Ani Sinha <anisinha@redhat.com>
Message-Id: <20231010115048.11856-2-philmd@linaro.org>
---
 include/hw/core/cpu.h     | 8 ++++----
 bsd-user/main.c           | 2 +-
 cpu-common.c              | 6 +++---
 linux-user/main.c         | 2 +-
 target/s390x/cpu_models.c | 2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index eb943efb8f..77893d7b81 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -586,13 +586,13 @@ static inline CPUArchState *cpu_env(CPUState *cpu)
 }
 
 typedef QTAILQ_HEAD(CPUTailQ, CPUState) CPUTailQ;
-extern CPUTailQ cpus;
+extern CPUTailQ cpus_queue;
 
-#define first_cpu        QTAILQ_FIRST_RCU(&cpus)
+#define first_cpu        QTAILQ_FIRST_RCU(&cpus_queue)
 #define CPU_NEXT(cpu)    QTAILQ_NEXT_RCU(cpu, node)
-#define CPU_FOREACH(cpu) QTAILQ_FOREACH_RCU(cpu, &cpus, node)
+#define CPU_FOREACH(cpu) QTAILQ_FOREACH_RCU(cpu, &cpus_queue, node)
 #define CPU_FOREACH_SAFE(cpu, next_cpu) \
-    QTAILQ_FOREACH_SAFE_RCU(cpu, &cpus, node, next_cpu)
+    QTAILQ_FOREACH_SAFE_RCU(cpu, &cpus_queue, node, next_cpu)
 
 extern __thread CPUState *current_cpu;
 
diff --git a/bsd-user/main.c b/bsd-user/main.c
index c402fadf46..e6014f517e 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -118,7 +118,7 @@ void fork_end(int child)
          */
         CPU_FOREACH_SAFE(cpu, next_cpu) {
             if (cpu != thread_cpu) {
-                QTAILQ_REMOVE_RCU(&cpus, cpu, node);
+                QTAILQ_REMOVE_RCU(&cpus_queue, cpu, node);
             }
         }
         mmap_fork_end(child);
diff --git a/cpu-common.c b/cpu-common.c
index 45c745ecf6..c81fd72d16 100644
--- a/cpu-common.c
+++ b/cpu-common.c
@@ -73,7 +73,7 @@ static int cpu_get_free_index(void)
     return max_cpu_index;
 }
 
-CPUTailQ cpus = QTAILQ_HEAD_INITIALIZER(cpus);
+CPUTailQ cpus_queue = QTAILQ_HEAD_INITIALIZER(cpus_queue);
 static unsigned int cpu_list_generation_id;
 
 unsigned int cpu_list_generation_id_get(void)
@@ -90,7 +90,7 @@ void cpu_list_add(CPUState *cpu)
     } else {
         assert(!cpu_index_auto_assigned);
     }
-    QTAILQ_INSERT_TAIL_RCU(&cpus, cpu, node);
+    QTAILQ_INSERT_TAIL_RCU(&cpus_queue, cpu, node);
     cpu_list_generation_id++;
 }
 
@@ -102,7 +102,7 @@ void cpu_list_remove(CPUState *cpu)
         return;
     }
 
-    QTAILQ_REMOVE_RCU(&cpus, cpu, node);
+    QTAILQ_REMOVE_RCU(&cpus_queue, cpu, node);
     cpu->cpu_index = UNASSIGNED_CPU_INDEX;
     cpu_list_generation_id++;
 }
diff --git a/linux-user/main.c b/linux-user/main.c
index 0c23584a96..0cdaf30d34 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -156,7 +156,7 @@ void fork_end(int child)
            Discard information about the parent threads.  */
         CPU_FOREACH_SAFE(cpu, next_cpu) {
             if (cpu != thread_cpu) {
-                QTAILQ_REMOVE_RCU(&cpus, cpu, node);
+                QTAILQ_REMOVE_RCU(&cpus_queue, cpu, node);
             }
         }
         qemu_init_cpu_list();
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 4dead48650..5c455d00c0 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -757,7 +757,7 @@ void s390_set_qemu_cpu_model(uint16_t type, uint8_t gen, uint8_t ec_ga,
     const S390CPUDef *def = s390_find_cpu_def(type, gen, ec_ga, NULL);
 
     g_assert(def);
-    g_assert(QTAILQ_EMPTY_RCU(&cpus));
+    g_assert(QTAILQ_EMPTY_RCU(&cpus_queue));
 
     /* build the CPU model */
     s390_qemu_cpu_model.def = def;
-- 
2.41.0

