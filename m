Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4538189lfg;
        Tue, 2 Mar 2021 06:58:37 -0800 (PST)
X-Received: by 2002:a17:906:3b48:: with SMTP id h8mr21731337ejf.477.1614697117428;
        Tue, 02 Mar 2021 06:58:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614697117; cv=none;
        d=google.com; s=arc-20160816;
        b=wmOmzcAVEeTGQr2TF0/wCpQPJr04k+deOgAdeInk+P0khJgSOETMwBoL9Rgl4B1/bP
         9qc5ArI7MMx5DQfdO/hw5VrrL1PXwyEWrblKA7a0tVNiEkN+dJfjGG8tpHNdcIkScgAl
         JKUhZpYFeqzZAplhM4ySH5kdFJYwTjfZqd4Qqc4/2xH0uL6nG+7YSqMY8tEZEGuZAnVy
         wEvzRZKkj7EwHNNGeSu32HpnFfKAJsQTbrZDCeXU/NY4KhuGJCES6WC9RstTK2S43o3i
         bYfbyWxMvTxgJgJTQRfGX6jrhTq7vl4cVTLpRMmLeyPrBogn3QW20DHEoK0K48rS4fNL
         vP4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=UQM81mur+9UHjxbQN0Zv4wGjBmPMsrfz+L5iL9ZySpM=;
        b=D540t9Xp2Qv5FWHEpog1RZJS1VsP4lrmy/ihsJzOMNDSq3A4u/qC1JBg7ND2k2FHOM
         4iIs1uOgQn61OxUA5SW6RIk8GO4Kksg0KjKEQXItobgG4wEGBB1YyeHZxO5tqBpasrGS
         gdID5FX0mleXB4dpsjo/JCg00L3mbe0y/Sl4cXYTJ4pAQXeQCA0yeTK6vuGpHzkZrRGm
         UWkMvdPfVebwdKcpJG5vqbBK7JEySzg1fzv8rKYzgy75wHWb8NjKvI73WiS22c+GA5DG
         r3bJfZukhgBG0CpQLkrQqrQ9+9hMPFGtMgpiwdS7GJSaFuE/bI29AgluG+rI7Ki1UZak
         ALrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=gM6oF45e;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id en8sor11754502ejc.18.2021.03.02.06.58.37
        (Google Transport Security);
        Tue, 02 Mar 2021 06:58:37 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=gM6oF45e;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UQM81mur+9UHjxbQN0Zv4wGjBmPMsrfz+L5iL9ZySpM=;
        b=gM6oF45eEgeNG6jf0U+7Wauc0D9nSOP59689GTofoHvqh0QBEfMdYjySyWCyMq8sBU
         1zJre/CpXuUL+fPnMODz6mqVZn5QHHK1MyoIlbVAww9HKamSEofQJBGg8EeDWHN7cQCs
         UBf2QUI8YHyI9tT5FphFRuObueYwj9AsFSgFWZJbuAy7Pu04GmsynGjwpcvZe1XZOKmf
         O1JDjh5CmhzyB4UXxT4KCzjBJWN9IOjhu/bFRf1zNxCZ9jP91n9si/WCe/SCuAPNBjSi
         UnK8voYy//wO+UiEVqVvLxNe9nyGj2CMPTh6rE2UuFVWQs5/GiaiT0UVhJpZkFeZseiJ
         KM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=UQM81mur+9UHjxbQN0Zv4wGjBmPMsrfz+L5iL9ZySpM=;
        b=efA6gdLm7IVnFLgQ7oHBPNhmoMzBE9U4QCCwh/Xu+W1Lzz3lUaPA1CjewxjLMftNuq
         pW+aBq0xKn04HXsEl5y/2ZIjpsVsmz6pcgNOflNDSy8plPRSlMhxNAx8LVDCdoLNroXM
         HbdeTjWeI3SATKrAuPlAHPkTLawB3hgyBb0wSNlIAnjp/5zbWsedfGsHNA8/fYo7mnvg
         sgcZrjZ5GCtOky5vtvFvuSjl7TlMHSv5p1fBPOcgqdoIRVqo9ftbacfU6RaNaUxh6L6o
         4da5uevda2EBXG7mIdJQt0LWwY+yfDz1pN929woU1OI4d+8PWhpVBPBJMNFArqBTvn57
         eI8g==
X-Gm-Message-State: AOAM531S4Z7CeLL/TmbzOE3Ugq7huSrSxZn9vlBrQ7lbKf6UOHjGAQoR
	T7l21jf7Vf7As20uBivU4fo=
X-Google-Smtp-Source: ABdhPJw2mC3+e40Odm6BazWaDWOlbZXJ2wr7csUb1ftgk2oZ5GMJgWXHllJx6Z2ycIOMCRUUTz1czw==
X-Received: by 2002:a17:906:d554:: with SMTP id cr20mr4765760ejc.61.1614697117233;
        Tue, 02 Mar 2021 06:58:37 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id q16sm9320176ejd.15.2021.03.02.06.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 06:58:36 -0800 (PST)
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
Subject: [PATCH v3 02/27] cpu: Un-inline cpu_get_phys_page_debug and cpu_asidx_from_attrs
Date: Tue,  2 Mar 2021 15:57:53 +0100
Message-Id: <20210302145818.1161461-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302145818.1161461-1-f4bug@amsat.org>
References: <20210302145818.1161461-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: F34oB/sFp24R

To be able to later extract the cpu_get_phys_page_debug() and
cpu_asidx_from_attrs() handlers from CPUClass, un-inline them
from "hw/core/cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 33 ++++-----------------------------
 hw/core/cpu.c         | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 29 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c005d3dc2d8..2d43f78819f 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -578,18 +578,8 @@ void cpu_dump_statistics(CPUState *cpu, int flags);
  *
  * Returns: Corresponding physical page address or -1 if no page found.
  */
-static inline hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
-                                                   MemTxAttrs *attrs)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (cc->get_phys_page_attrs_debug) {
-        return cc->get_phys_page_attrs_debug(cpu, addr, attrs);
-    }
-    /* Fallback for CPUs which don't implement the _attrs_ hook */
-    *attrs = MEMTXATTRS_UNSPECIFIED;
-    return cc->get_phys_page_debug(cpu, addr);
-}
+hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
+                                     MemTxAttrs *attrs);
 
 /**
  * cpu_get_phys_page_debug:
@@ -601,12 +591,7 @@ static inline hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
  *
  * Returns: Corresponding physical page address or -1 if no page found.
  */
-static inline hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
-{
-    MemTxAttrs attrs = {};
-
-    return cpu_get_phys_page_attrs_debug(cpu, addr, &attrs);
-}
+hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 
 /** cpu_asidx_from_attrs:
  * @cpu: CPU
@@ -615,17 +600,7 @@ static inline hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
  * Returns the address space index specifying the CPU AddressSpace
  * to use for a memory access with the given transaction attributes.
  */
-static inline int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-    int ret = 0;
-
-    if (cc->asidx_from_attrs) {
-        ret = cc->asidx_from_attrs(cpu, attrs);
-        assert(ret < cpu->num_ases && ret >= 0);
-    }
-    return ret;
-}
+int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs);
 
 #endif /* CONFIG_USER_ONLY */
 
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 00330ba07de..4dce35f832f 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -94,6 +94,38 @@ static void cpu_common_get_memory_mapping(CPUState *cpu,
     error_setg(errp, "Obtaining memory mappings is unsupported on this CPU.");
 }
 
+hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
+                                                   MemTxAttrs *attrs)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->get_phys_page_attrs_debug) {
+        return cc->get_phys_page_attrs_debug(cpu, addr, attrs);
+    }
+    /* Fallback for CPUs which don't implement the _attrs_ hook */
+    *attrs = MEMTXATTRS_UNSPECIFIED;
+    return cc->get_phys_page_debug(cpu, addr);
+}
+
+hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
+{
+    MemTxAttrs attrs = {};
+
+    return cpu_get_phys_page_attrs_debug(cpu, addr, &attrs);
+}
+
+int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+    int ret = 0;
+
+    if (cc->asidx_from_attrs) {
+        ret = cc->asidx_from_attrs(cpu, attrs);
+        assert(ret < cpu->num_ases && ret >= 0);
+    }
+    return ret;
+}
+
 /* Resetting the IRQ comes from across the code base so we take the
  * BQL here if we need to.  cpu_interrupt assumes it is held.*/
 void cpu_reset_interrupt(CPUState *cpu, int mask)
-- 
2.26.2
