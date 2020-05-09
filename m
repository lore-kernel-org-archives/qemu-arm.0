Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1026444lfb;
        Sat, 9 May 2020 06:09:30 -0700 (PDT)
X-Received: by 2002:a5d:6082:: with SMTP id w2mr8283552wrt.163.1589029770239;
        Sat, 09 May 2020 06:09:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589029770; cv=none;
        d=google.com; s=arc-20160816;
        b=SnRc3gNh+Nc6j91kPVucKoQYHM2ie9jJP2e0DSNceULpQzeFGkurn+8a5lHvjYeDma
         KWDbjFKh9NKKdYqkPPbJ0KfZVWgffnj4awkKvSpl31EQlhvgpEffrMN0qfzcun1ThjEr
         ze4itk15IPhSPgZ00m4Ye8Pq9PJxRng1/57YH8kImfzU3nnWAqP3idJDf5H4wCAj0D/Y
         ZkXUQOC4eCjeH5HTWyh8mF3uDdH3Qv2qvLnzt4K7jG3lnOqCWS5Kh1H6/QQbECIZoC4p
         vPrCpHzXgSlSQq/olYHiC06GshkGZVR9eketuaY33FdFwymeKVOQRPgzcGKqjNTLOvRi
         i/hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=LLYk56bTzpbED/TEaMz+Gn8C12EvT1HOdsren3t79iU=;
        b=S1KEOt0rtLIJefQ1pAuxfMv6MR/LM9xf9ogHnvdBw+c1V4A9g5/dNsWFUKgFjGYFB6
         vScaESOS8FkO0H6wzIzSara/4W+iXYUalTBiD109tnO1mpzdZ6P/Bg0wKesuxktEz48B
         /WulSKDC33SfWqsrtb3mw8Re0DUXc8rNr1/GzwmHAKHm+a07z81DiwqMkifS584+1IYy
         5Cf64fk7hQ3SQzV9aUbSsK/ChPRJ7DWzDzIGbSNPi8SwAVoeeuIb7lxL2WlTXgZwLl8I
         5paF0Xz0SHKAYJXyGsGmOuPt3qPygsawXcBqE4BwRQdXgDOGpewBxf3xRTz7vSDlIm8e
         BdUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=AP4j+tgC;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x4sor8111553wmc.17.2020.05.09.06.09.30
        (Google Transport Security);
        Sat, 09 May 2020 06:09:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=AP4j+tgC;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LLYk56bTzpbED/TEaMz+Gn8C12EvT1HOdsren3t79iU=;
        b=AP4j+tgCGiMzt4H8rWkM9LRHLvvfy6vChYsu223j14fpzOK2Pqi5/cgs7QkpACs5vh
         N1zCvIR0D66ZYllrAZ2tWAaeGkrPsXt9xm6zo9skgzr2SVMt97UEzXHLUWu6N9Qtkg4/
         euGDM4L2z8UAh+EJOMnGTRHFqqtsYRBZJhTTi+fip9mAE8szTB3dWn8Juth85+yQ+oDS
         nRW22lLT7lShq9EBYOPsyCZ4ollrQzzeo/9LMlFJ48I9X1gdie42VTArpEW7ZghsvF/V
         t7rd6CZDBwaKDER1Wx5YA6IC70y1YDpyUZt5/m71ZO0n6akG0hmukMSpoLbWaz03XO/+
         B/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=LLYk56bTzpbED/TEaMz+Gn8C12EvT1HOdsren3t79iU=;
        b=R2fBqGKaBKPOKQ+Ois3rBsYsSxycHm1sUTLlg6TW8YGCV0SelHIqgp98eaA4L0pcdn
         mhAAFh5jZJRE0QS2DJ2zaOO3HNRGwlAV8ob52XsPxbiVGjTxKwZrtApPo6UeC2XkS3Sq
         /+azcK21cPycR1e7vAiMIsyHnEWhJUkhZA8gLU2wdjtIjHVF32AoerXHRURzMMUoVn7s
         yxXOPYxr03FiKlcWr0c9UpgjOMSfddHDRQvIKKX7pXGlDqs50BN/E1gEssgwayTLTPhj
         rNhOvU3jxzJX0pOQwIyHYgyzJv8yJC8QuwD4qmut392JcHL1nv/vxaGkewkekqDimBMw
         +++Q==
X-Gm-Message-State: AGi0PuZhkoCPKMaUKD43EqSd052KNW5EsdyOs+Zh7cpaDkpwbX8zZoqh
	DLfp+iNn3Hqa9RHC3hxZVKM=
X-Google-Smtp-Source: APiQypJ7r2t/Yta7gA62He4a86vm+KY7sXlClAQIeF/nfivQhskw9hfQngWMoh1D2O9TF+ukw3WKyQ==
X-Received: by 2002:a7b:cc0e:: with SMTP id f14mr21365946wmh.39.1589029769835;
        Sat, 09 May 2020 06:09:29 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id m65sm1411410wmm.17.2020.05.09.06.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 06:09:29 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-s390x@nongnu.org,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Marek Vasut <marex@denx.de>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-riscv@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 05/11] target/ppc: Restrict PPCVirtualHypervisorClass to system-mode
Date: Sat,  9 May 2020 15:09:04 +0200
Message-Id: <20200509130910.26335-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200509130910.26335-1-f4bug@amsat.org>
References: <20200509130910.26335-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: UHAJkeUTkZVK

The code related to PPC Virtual Hypervisor is pointless in user-mode.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/ppc/cpu.h                |  4 ++--
 target/ppc/kvm_ppc.h            | 22 +++++++++++-----------
 target/ppc/translate_init.inc.c |  4 ++++
 3 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 6b6dd7e483..73920a9cac 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1176,6 +1176,7 @@ PowerPCCPUClass *ppc_cpu_class_by_pvr(uint32_t pvr);
 PowerPCCPUClass *ppc_cpu_class_by_pvr_mask(uint32_t pvr);
 PowerPCCPUClass *ppc_cpu_get_family_class(PowerPCCPUClass *pcc);
 
+#ifndef CONFIG_USER_ONLY
 struct PPCVirtualHypervisorClass {
     InterfaceClass parent;
     void (*hypercall)(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu);
@@ -1189,10 +1190,8 @@ struct PPCVirtualHypervisorClass {
     void (*hpte_set_r)(PPCVirtualHypervisor *vhyp, hwaddr ptex, uint64_t pte1);
     void (*get_pate)(PPCVirtualHypervisor *vhyp, ppc_v3_pate_t *entry);
     target_ulong (*encode_hpt_for_kvm_pr)(PPCVirtualHypervisor *vhyp);
-#ifndef CONFIG_USER_ONLY
     void (*cpu_exec_enter)(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu);
     void (*cpu_exec_exit)(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu);
-#endif
 };
 
 #define TYPE_PPC_VIRTUAL_HYPERVISOR "ppc-virtual-hypervisor"
@@ -1204,6 +1203,7 @@ struct PPCVirtualHypervisorClass {
 #define PPC_VIRTUAL_HYPERVISOR_GET_CLASS(obj) \
     OBJECT_GET_CLASS(PPCVirtualHypervisorClass, (obj), \
                      TYPE_PPC_VIRTUAL_HYPERVISOR)
+#endif /* CONFIG_USER_ONLY */
 
 void ppc_cpu_do_interrupt(CPUState *cpu);
 bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
index fcaf745516..701c0c262b 100644
--- a/target/ppc/kvm_ppc.h
+++ b/target/ppc/kvm_ppc.h
@@ -280,6 +280,17 @@ static inline bool kvmppc_has_cap_spapr_vfio(void)
     return false;
 }
 
+static inline void kvmppc_read_hptes(ppc_hash_pte64_t *hptes,
+                                     hwaddr ptex, int n)
+{
+    abort();
+}
+
+static inline void kvmppc_write_hpte(hwaddr ptex, uint64_t pte0, uint64_t pte1)
+{
+    abort();
+}
+
 #endif /* !CONFIG_USER_ONLY */
 
 static inline bool kvmppc_has_cap_epr(void)
@@ -310,17 +321,6 @@ static inline int kvmppc_load_htab_chunk(QEMUFile *f, int fd, uint32_t index,
     abort();
 }
 
-static inline void kvmppc_read_hptes(ppc_hash_pte64_t *hptes,
-                                     hwaddr ptex, int n)
-{
-    abort();
-}
-
-static inline void kvmppc_write_hpte(hwaddr ptex, uint64_t pte0, uint64_t pte1)
-{
-    abort();
-}
-
 static inline bool kvmppc_has_cap_fixup_hcalls(void)
 {
     abort();
diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_init.inc.c
index 2b6e832c4c..4ea0cc501b 100644
--- a/target/ppc/translate_init.inc.c
+++ b/target/ppc/translate_init.inc.c
@@ -10946,16 +10946,20 @@ static const TypeInfo ppc_cpu_type_info = {
     .class_init = ppc_cpu_class_init,
 };
 
+#ifndef CONFIG_USER_ONLY
 static const TypeInfo ppc_vhyp_type_info = {
     .name = TYPE_PPC_VIRTUAL_HYPERVISOR,
     .parent = TYPE_INTERFACE,
     .class_size = sizeof(PPCVirtualHypervisorClass),
 };
+#endif
 
 static void ppc_cpu_register_types(void)
 {
     type_register_static(&ppc_cpu_type_info);
+#ifndef CONFIG_USER_ONLY
     type_register_static(&ppc_vhyp_type_info);
+#endif
 }
 
 type_init(ppc_cpu_register_types)
-- 
2.21.3
