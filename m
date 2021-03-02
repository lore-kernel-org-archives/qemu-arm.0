Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4538342lfg;
        Tue, 2 Mar 2021 06:58:51 -0800 (PST)
X-Received: by 2002:a17:906:d554:: with SMTP id cr20mr4766617ejc.61.1614697131616;
        Tue, 02 Mar 2021 06:58:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614697131; cv=none;
        d=google.com; s=arc-20160816;
        b=s2wxr2HB6jYE9pzFRXMbyMaE9QSXZk1PrFFr1PiX0UxGi9dav8sr381Htnro5vcFlo
         7WbtUQV8XNibQrBJe4Jd6Bm/Ek954nw0inQlIf15Uy15RWG7butgf94H/zCyxaMRViL0
         gSTqTpYsMfMR3sFUPO+wfs4PWqjPCl0PFdQeB0ZFb0c4/u8iiAE93/4emy4QK9bKEtqu
         xK8FAWS9c3semBqHDcsvA0tjwfy4pJqcOYkQ2PH3rxcCJS4qRFurn3mVWRroZ5iSBhmi
         aT/0+RnEsKx7iF11v+0F9k7tKiVg9O5DTWiIMoJxXKr7rINheKQiyGD7pY4sJAllbbso
         TFsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=VJm0iGgu/pocJ2Vudv8ibS2Ot9Xd+ih0+p5aBEZz7PY=;
        b=r9UvIyugq9i2yUZvDXUOqG1NpGggeqJBJaLciE2DHNuJVa2E3Eya9EtHQb6BOADrJt
         YB8f8eKIRld8xcYHKTaCGFlsCVQqWFp7idx0S9/VGZtCGyfxvuN6tqZP94J34RFmxvuO
         4nvlp3u8TAbJkwgjeKscuXycmYuR/OrZxg3dcy4tm3NZLnXCvLaDzCE+NAvGCxPF0Aee
         B56OPsCs07NOJrtDM/oroSgi/VKV2jSgzrV6ex0JFhuukl4wIlLNteDv3LengFnS1JIt
         Tj5ju8MPhKJyJgatTI6Ql/UcwINU7KHaQRx/yv1XluVD954TE1RsULPcO+H9G/Zpg0WQ
         zf0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=PzxnRz+T;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v13sor4738303ejw.91.2021.03.02.06.58.51
        (Google Transport Security);
        Tue, 02 Mar 2021 06:58:51 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=PzxnRz+T;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VJm0iGgu/pocJ2Vudv8ibS2Ot9Xd+ih0+p5aBEZz7PY=;
        b=PzxnRz+TT21E51h00VO4w6EwBK4uBXlC1idOB18LgNi+3yV1fU5phsOnJrU5RYNakr
         45TD1MtBXFcmbFMan7ALS+EzqYisulDtIvV2Z8tjR51nqKVFiXoaguBA8refjEweF98i
         WKaQLMj/+2mirtCXfH+rpe6GOPmUbHM9R4/VxGr+Y51sMjwRsaKsUbgwZ6XFhw0eIk5p
         mUb8iSvgDsvh69RpipuDaGhyRNcxBgEtmA/PuC4BpU8tR1hjx9UQgzIbw9JDPRIgeF4W
         Lx1HUYOABTY1r4WldGrla5fKkrrz3Ycbg5W1MgBHxn3l7ufNxC/K+j0rAu8z3aUj5+uQ
         wCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=VJm0iGgu/pocJ2Vudv8ibS2Ot9Xd+ih0+p5aBEZz7PY=;
        b=uEVQBXYZ1JsQZXrnir2bIHBCKsAgjeUPRwxQcfIXvnyvNRSvY3Xl7VlzzNg7bOjHa+
         oMMT6CkTifsGDG0ibLhUEHuTg4ZIbZlb/k7TrQueepPuMtGolr35iW5jEYRy72S2yIes
         SLWkzfvjr8qmV83IkDcf0S0iMuNyUvm4CRJ4BLlHjJfmKc59o/5HC7H94MFaWIGuRLOY
         BmFFwI0gCgMncKQst6tLiK/DPEcgWIrt4q6cCpohifEVLgLAAFLoMi8B6kmN2DuX2rmL
         D2wV99oX6P0coU/vdJ2ecUOUTrq2iZMDbw/6IiLboOYEYQ9DDIm+LCEwiARDTZYl7nPb
         d2pA==
X-Gm-Message-State: AOAM5335MyyzrmscQIQMR+SnLwl10sAcH+dp0MmU6n4nqUWtArNiCLLp
	SfpywVmKkGOImOUkFUHKTRU=
X-Google-Smtp-Source: ABdhPJwVwRfRNiu2er/OHpx+xArXr0gZ7SPEHZUCgD/YEmWg0lWrzGwKDNXy+KYAT/7EtK3rnC5gww==
X-Received: by 2002:a05:6402:348c:: with SMTP id v12mr20696747edc.314.1614697131429;
        Tue, 02 Mar 2021 06:58:51 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id v8sm9399397edq.76.2021.03.02.06.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 06:58:50 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Max Filippov <jcmvbkbc@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	Stafford Horne <shorne@gmail.com>,
	qemu-ppc@nongnu.org,
	Anthony Green <green@moxielogic.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Walle <michael@walle.cc>,
	Marek Vasut <marex@denx.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Chris Wulff <crwulff@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-s390x@nongnu.org,
	Sarah Harris <S.E.Harris@kent.ac.uk>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-riscv@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Taylor Simpson <tsimpson@quicinc.com>
Subject: [PATCH v3 04/27] cpu: Directly use cpu_write_elf*() fallback handlers in place
Date: Tue,  2 Mar 2021 15:57:55 +0100
Message-Id: <20210302145818.1161461-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302145818.1161461-1-f4bug@amsat.org>
References: <20210302145818.1161461-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: u1FtmSmv3TDx

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
