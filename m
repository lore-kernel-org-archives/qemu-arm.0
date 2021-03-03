Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5705910lfg;
        Wed, 3 Mar 2021 13:47:31 -0800 (PST)
X-Received: by 2002:a1c:4e0f:: with SMTP id g15mr855898wmh.144.1614808051772;
        Wed, 03 Mar 2021 13:47:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614808051; cv=none;
        d=google.com; s=arc-20160816;
        b=qhnkHpu0U+cXBIfes4qIJbY1O0U1xhe7Ha9UurKHh6UfT5FkgD+WLI/bt6YsiJf1d7
         t2IVPmZwKZN5WQyeF2CidJR4Ti97UHrjSkdZUbPnXQB+Ta2txLJPcpJhysVLF4pjZJLw
         kK9NWUJb9ZAdx1kHT/euuFLtYZv1lMcMwnIotZ4fYhU/sykvh0ymqRHqNSKivdoh07rS
         DfDcxIA6CNfp2lZPEEgHJ3Z7PljWpsUfOzvBnD682r3JrOInkMvy2MsXtFbX0zgNoYxK
         j8vI1DWywslxhhVf7DuFUNhMCrnu/JB2T/2EKwVjax4qck5zA51Eq5u60PfPQ3FAzjRp
         qukw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=VJm0iGgu/pocJ2Vudv8ibS2Ot9Xd+ih0+p5aBEZz7PY=;
        b=FOZwJabpH6zf+qGa6v/ru0zZiiG0rk7k2XFAeDpfVJGZOY7NnEEkuBhvJdFbkRSlqL
         IjFuIqesvbfvm8AfjyNlzxm7RVUhFd3Qv4gyXX+PVLG2A6JoxVGc6KFin4xNfnbPCQx1
         /tTPDcht85dHS/NJpGXxgKuVHPAsZpDQMIeA/6/A0psjw6CyUtYXl83Sd+PQsqS+Zriz
         +ZJcdQkjvblv3s3P9kXsUp628gZe0AGO1EsiotId3aukgoboxwPFluMPh+KWE0WbMTN6
         ijQyGc4zAC5kbVOa5wgaJZsh0FmeDW0qwP0CrIYP9RIHv/FsH08aEZcaPUygjKLRjP0k
         UBtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ifqZqtDq;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k17sor12876796wrn.30.2021.03.03.13.47.31
        (Google Transport Security);
        Wed, 03 Mar 2021 13:47:31 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ifqZqtDq;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VJm0iGgu/pocJ2Vudv8ibS2Ot9Xd+ih0+p5aBEZz7PY=;
        b=ifqZqtDqhOgY5uLlul8CZC2+PlZhTINOhh0kNI68/3gI2CUuK5DNuuPAdktT6AkgiI
         YQnfr0bGkGXpuUexxjKr1Ay1NlTBG9t9pvRbGRZQyAtjY3t2ypgILRMdq2GY+RmC0Kgb
         2LWSL97EFxySaGYlQidHhuNiM5ugkNLYhec3P0I1jFmnMcEEnNkXe9mcuEqNfS7oHjwH
         pkIguz6PFbMM1I2WL3AzWLpu/hDelAW/sq79X2xCVQiSksxu19G/ym9kxXImCvTvrUqX
         umYOBDzT71Z1sqPMk4jVOuaQSffSssMCmLbJGaTzhlS2PeJ01fU8nqNnbKMAWGFg6e6G
         lHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=VJm0iGgu/pocJ2Vudv8ibS2Ot9Xd+ih0+p5aBEZz7PY=;
        b=IyE42P6+X3DWdsPKtYTmwk6Gim5pKKEZjC6qpBSN8+V5npZ7bNF2BO0mNQOOHlw4bE
         sMRNEbaXY6ot5PM9DqkZLABfOQ3m7KFyMwn0qlI9ZCqx1bjj8S4pZh+4fa1Br6FVJZl2
         8H1RKlILrSVywADt4nvcEO9uUtEP23H/GoboXWq3wS2lvas1b1TaBjU9bYvrmu1ohmjP
         0KboZ/AsSnn8xWYImNEIbfWlYgDK8HiVrSQQHZ3TDdIuygivv3qLUQWEBCRR5uMCoSNo
         GPT0kNPntjX4HFYGpG+UkaF7fG54OAH2yK0g36oCP7ilyD5kDsz/wMtcJPKHM5ib7Cxm
         wU+Q==
X-Gm-Message-State: AOAM530lId3l2by1E5KaSw7wMYQGzfA2zM2HXX6ShqWhLTObgqUIs5Nm
	zMv4Aq0T2II7dTI1PC5Evig=
X-Google-Smtp-Source: ABdhPJx7+hJT7rzIyQPksMqjdWusZ/CddoRC+72dPVEWnznIKRRTNju+ViqG8Y+Kl8UyxTVe8tMLrA==
X-Received: by 2002:adf:e411:: with SMTP id g17mr664079wrm.225.1614808051551;
        Wed, 03 Mar 2021 13:47:31 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id e1sm6300140wrw.85.2021.03.03.13.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 13:47:31 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-ppc@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Cornelia Huck <cohuck@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v4 04/28] cpu: Directly use cpu_write_elf*() fallback handlers in place
Date: Wed,  3 Mar 2021 22:46:44 +0100
Message-Id: <20210303214708.1727801-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: I2D6N3fOL7Q0

No code directly accesses CPUClass::write_elf*() handlers out
of hw/core/cpu.c (the rest are assignation in target/ code):

  $ git grep -F -- '->write_elf'
  hw/core/cpu.c:157:    return (*cc->write_elf32_qemunote)(f, cpu, opaque);
  hw/core/cpu.c:171:    return (*cc->write_elf32_note)(f, cpu, cpuid, opaque);
  hw/core/cpu.c:186:    return (*cc->write_elf64_qemunote)(f, cpu, opaque);
  hw/core/cpu.c:200:    return (*cc->write_elf64_note)(f, cpu, cpuid, opaque);
  hw/core/cpu.c:440:    k->write_elf32_qemunote = cpu_common_write_elf32_qemunote;
  hw/core/cpu.c:441:    k->write_elf32_note = cpu_common_write_elf32_note;
  hw/core/cpu.c:442:    k->write_elf64_qemunote = cpu_common_write_elf64_qemunote;
  hw/core/cpu.c:443:    k->write_elf64_note = cpu_common_write_elf64_note;
  target/arm/cpu.c:2304:    cc->write_elf64_note = arm_cpu_write_elf64_note;
  target/arm/cpu.c:2305:    cc->write_elf32_note = arm_cpu_write_elf32_note;
  target/i386/cpu.c:7425:    cc->write_elf64_note = x86_cpu_write_elf64_note;
  target/i386/cpu.c:7426:    cc->write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
  target/i386/cpu.c:7427:    cc->write_elf32_note = x86_cpu_write_elf32_note;
  target/i386/cpu.c:7428:    cc->write_elf32_qemunote = x86_cpu_write_elf32_qemunote;
  target/ppc/translate_init.c.inc:10891:    cc->write_elf64_note = ppc64_cpu_write_elf64_note;
  target/ppc/translate_init.c.inc:10892:    cc->write_elf32_note = ppc32_cpu_write_elf32_note;
  target/s390x/cpu.c:522:    cc->write_elf64_note = s390_cpu_write_elf64_note;

Check the handler presence in place and remove the common fallback code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/cpu.c | 43 ++++++++++++-------------------------------
 1 file changed, 12 insertions(+), 31 deletions(-)

diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index daaff56a79e..a9ee2c74ec5 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -154,60 +154,45 @@ int cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
+    if (!cc->write_elf32_qemunote) {
+        return 0;
+    }
     return (*cc->write_elf32_qemunote)(f, cpu, opaque);
 }
 
-static int cpu_common_write_elf32_qemunote(WriteCoreDumpFunction f,
-                                           CPUState *cpu, void *opaque)
-{
-    return 0;
-}
-
 int cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
                          int cpuid, void *opaque)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
+    if (!cc->write_elf32_note) {
+        return -1;
+    }
     return (*cc->write_elf32_note)(f, cpu, cpuid, opaque);
 }
 
-static int cpu_common_write_elf32_note(WriteCoreDumpFunction f,
-                                       CPUState *cpu, int cpuid,
-                                       void *opaque)
-{
-    return -1;
-}
-
 int cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
                              void *opaque)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
+    if (!cc->write_elf64_qemunote) {
+        return 0;
+    }
     return (*cc->write_elf64_qemunote)(f, cpu, opaque);
 }
 
-static int cpu_common_write_elf64_qemunote(WriteCoreDumpFunction f,
-                                           CPUState *cpu, void *opaque)
-{
-    return 0;
-}
-
 int cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
                          int cpuid, void *opaque)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
+    if (!cc->write_elf64_note) {
+        return -1;
+    }
     return (*cc->write_elf64_note)(f, cpu, cpuid, opaque);
 }
 
-static int cpu_common_write_elf64_note(WriteCoreDumpFunction f,
-                                       CPUState *cpu, int cpuid,
-                                       void *opaque)
-{
-    return -1;
-}
-
-
 static int cpu_common_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
 {
     return 0;
@@ -437,10 +422,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->has_work = cpu_common_has_work;
     k->get_paging_enabled = cpu_common_get_paging_enabled;
     k->get_memory_mapping = cpu_common_get_memory_mapping;
-    k->write_elf32_qemunote = cpu_common_write_elf32_qemunote;
-    k->write_elf32_note = cpu_common_write_elf32_note;
-    k->write_elf64_qemunote = cpu_common_write_elf64_qemunote;
-    k->write_elf64_note = cpu_common_write_elf64_note;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
-- 
2.26.2
