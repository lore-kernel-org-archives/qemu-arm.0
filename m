Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2501834lfc;
        Fri, 13 Mar 2020 11:37:57 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtLWCimJNnWHp/urVgBE9aptHdiWEhgVjBjJaNsaC/XeLaPaFChfoYJsy8hAyZaqL29CJ8c
X-Received: by 2002:a25:bbc3:: with SMTP id c3mr902423ybk.223.1584124677234;
        Fri, 13 Mar 2020 11:37:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584124677; cv=none;
        d=google.com; s=arc-20160816;
        b=kv9JQVAHZ6ScTnUnUT4pWfUD50D0ze8b7AX++8G/bvBPwpi/VS/KIUaQZAomCkZglT
         i/30JJvaLL/4YbqUqMLk6cVicP7waW5YUDQbEwKDRWK+Uah6RyETWX6wws2Vw2qPXXVM
         egAmu67jPVgkmslYFhD7DQHR1DiPBIDFsm48f7U4AyS2qNbzckOkGVVsOIc5UAM1wKJw
         UCFV4kh9Nj2F+c/jYM0GxUZiQTP9yKgG/lEaX0JhCPuuq6Qwc+qLWr44gYpIkI5s3bIU
         +Tso2DOWUvp22tDTf+Y4gIljAMmtAlvp9qaelNuGbXUe1DCtNiHZB4s/WyaurHaf5PXo
         2OUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=g6kDoneuZrMhDVCRmujvDk3IfPp3E6PHImkHQw061IY=;
        b=Y7Kd6RrVdf8Qrr/4cq3XEyi5jbrQ3kCzhp0HwMrSWJBCSjH8q2STmKzjC6EpCYsGlg
         vTx+LiplzYzVldyqX9uiMSRxmVY4es8qnsVSvTOQnztaKAGgdge2UjjaV3a9UOayAwnE
         HkPghDi/GKH7+BzgNYQHq/hWQ7vfzotxt7EIVWxjMF0/vHm2Frst2KeCJO4TlBZfqt3Z
         PHpfhiCWAgQtlb14zavqX6sIUepNg3kmGbe0fJWpC1vclIQWLY5G5DVNJ4d+evhWsacS
         fgsiMadt8m0q6Qkpti7VCVCpHMijeJ3+dhKaBBSELDLoEb/ycRlixKqomt8Y31QFycKK
         Lalg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dPwrWVvS;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id 199si6671974ybf.74.2020.03.13.11.37.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Mar 2020 11:37:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dPwrWVvS;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584124676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g6kDoneuZrMhDVCRmujvDk3IfPp3E6PHImkHQw061IY=;
	b=dPwrWVvSSdN10YUaDY/8ZoJU4Hu+sZ8CTixmQjPWMHSmD4ts9y/6rUCHIeTPCXXxpd56B2
	iqtqaVRoJ061L0VW/e2S9575fY2DvKTo4EGag7COZfMS2nIgOPcL3borrlMDTYk0dA5Ymt
	jyWbFEYSldbdunfG6Y9DM4w2ATzX85U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-ip2YrGZKO6edEunu9Oa57g-1; Fri, 13 Mar 2020 14:37:52 -0400
X-MC-Unique: ip2YrGZKO6edEunu9Oa57g-1
Received: by mail-wm1-f71.google.com with SMTP id t2so3300326wmj.2
        for <alex.bennee@linaro.org>; Fri, 13 Mar 2020 11:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iYsZ3FxrwnOLNhhBs5OQJLjNJeFk+YWQzk3XZ1uOqWs=;
        b=Pm965DKmyc9kd6lmREsHkF0+06NpNFcogQR0jf9bdsXcrhR7X03X/P3z1J2xc3NPY+
         uUEnoPx3XkHAKWENV3gd+YHt7MTJvCtouGkc2SBCH3+zeOkTe0MmtimDyy7fhmcUJCiM
         cxGCuGD4IbCX5cCyuGzoNjQCNJ2e2hmXcTmaN7dKcPB5BZP1CVDC2P1yAt2TEWN0tMwx
         kJSV9BHsCQQWNP9XQonaXk4Y/BfG43n2X/cooqa4AE7tUEvNTa9Sb4fJ2ayTiCWcR6lY
         8u7rz7zqdDHCMGXnJEnaPHf2X7DM/NVilEydOQngZqhU3allsDoLYMrrk+3/RdTSWitR
         3Ogg==
X-Gm-Message-State: ANhLgQ2zRZqJftNMH+ftNrps8Kk9do8FK4CunaTwwOkGPxq73MfpY0w7
	ka75TXP7Gk9FZteunGZPvyfmGwAjk0yaDeN15nyAL8tavndtUt3EEINnPs/UQE/4Uw00SFa6y+/
	RXadQg4u9biPyClx8
X-Received: by 2002:a5d:574e:: with SMTP id q14mr18374367wrw.330.1584124671735;
        Fri, 13 Mar 2020 11:37:51 -0700 (PDT)
X-Received: by 2002:a5d:574e:: with SMTP id q14mr18374340wrw.330.1584124671486;
        Fri, 13 Mar 2020 11:37:51 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net. [88.21.205.47])
        by smtp.gmail.com with ESMTPSA id g129sm19273217wmg.12.2020.03.13.11.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 11:37:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-ppc@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-riscv@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-arm@nongnu.org,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 11/14] target: Restrict write_elfXX_note() handlers to system-mode
Date: Fri, 13 Mar 2020 19:36:49 +0100
Message-Id: <20200313183652.10258-12-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200313183652.10258-1-philmd@redhat.com>
References: <20200313183652.10258-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: WnRNSay87FOT

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/cpu.h                | 10 +++++-----
 target/i386/cpu.h               | 18 +++++++++---------
 target/ppc/cpu.h                |  2 --
 target/s390x/internal.h         |  3 ++-
 target/ppc/translate_init.inc.c |  2 --
 5 files changed, 16 insertions(+), 19 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4ffd991b6f..8a22212521 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -958,6 +958,11 @@ void arm_cpu_post_init(Object *obj);
 uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz);
=20
 #ifndef CONFIG_USER_ONLY
+int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
+                             int cpuid, void *opaque);
+int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
+                             int cpuid, void *opaque);
+
 extern const VMStateDescription vmstate_arm_cpu;
 #endif
=20
@@ -982,11 +987,6 @@ int arm_gen_dynamic_xml(CPUState *cpu);
  */
 const char *arm_gdb_get_dynamic_xml(CPUState *cpu, const char *xmlname);
=20
-int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
-                             int cpuid, void *opaque);
-int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
-                             int cpuid, void *opaque);
-
 #ifdef TARGET_AARCH64
 int aarch64_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
 int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 576f309bbf..f25fe5fc7c 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1738,6 +1738,15 @@ struct X86CPU {
=20
=20
 #ifndef CONFIG_USER_ONLY
+int x86_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
+                             int cpuid, void *opaque);
+int x86_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
+                             int cpuid, void *opaque);
+int x86_cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
+                                 void *opaque);
+int x86_cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
+                                 void *opaque);
+
 extern VMStateDescription vmstate_x86_cpu;
 #endif
=20
@@ -1749,15 +1758,6 @@ void x86_cpu_do_interrupt(CPUState *cpu);
 bool x86_cpu_exec_interrupt(CPUState *cpu, int int_req);
 int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request);
=20
-int x86_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
-                             int cpuid, void *opaque);
-int x86_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
-                             int cpuid, void *opaque);
-int x86_cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
-                                 void *opaque);
-int x86_cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
-                                 void *opaque);
-
 void x86_cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
                                 Error **errp);
=20
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index b283042515..b9fb76d0b3 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1225,12 +1225,10 @@ int ppc_cpu_gdb_write_register_apple(CPUState *cpu,=
 uint8_t *buf, int reg);
 #ifndef CONFIG_USER_ONLY
 void ppc_gdb_gen_spr_xml(PowerPCCPU *cpu);
 const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name);
-#endif
 int ppc64_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                                int cpuid, void *opaque);
 int ppc32_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
                                int cpuid, void *opaque);
-#ifndef CONFIG_USER_ONLY
 void ppc_cpu_do_system_reset(CPUState *cs);
 extern const VMStateDescription vmstate_ppc_cpu;
 #endif
diff --git a/target/s390x/internal.h b/target/s390x/internal.h
index d37816104d..dcbd8d2065 100644
--- a/target/s390x/internal.h
+++ b/target/s390x/internal.h
@@ -226,9 +226,10 @@ static inline hwaddr decode_basedisp_s(CPUS390XState *=
env, uint32_t ipb,
 #define decode_basedisp_rs decode_basedisp_s
=20
 /* arch_dump.c */
+#if !defined(CONFIG_USER_ONLY)
 int s390_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                               int cpuid, void *opaque);
-
+#endif
=20
 /* cc_helper.c */
 const char *cc_name(enum cc_op cc_op);
diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_init.in=
c.c
index 53995f62ea..768ec18a28 100644
--- a/target/ppc/translate_init.inc.c
+++ b/target/ppc/translate_init.inc.c
@@ -10902,8 +10902,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, voi=
d *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug =3D ppc_cpu_get_phys_page_debug;
     cc->vmsd =3D &vmstate_ppc_cpu;
-#endif
-#if defined(CONFIG_SOFTMMU)
     cc->write_elf64_note =3D ppc64_cpu_write_elf64_note;
     cc->write_elf32_note =3D ppc32_cpu_write_elf32_note;
 #endif
--=20
2.21.1
