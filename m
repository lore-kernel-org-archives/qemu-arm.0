Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4974551lfb;
        Tue, 31 Aug 2021 05:17:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhrHJ6rByuNHCNGPJP1iWOduHKNKO7IlLWrzrfrghKpuOGJIp1wxxRhMf49TGt/Bm/EFpG
X-Received: by 2002:a05:6402:c90:: with SMTP id cm16mr29422872edb.170.1630412260887;
        Tue, 31 Aug 2021 05:17:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630412260; cv=none;
        d=google.com; s=arc-20160816;
        b=hnQ84k8OxLxNTtGWWCLm+OGmZBwr+A0M0tnn3dzzGb2qs7//PBKA5TCiXpRcBDiYba
         nwkSrW9ptz1sIiKuf8/+r5HauEvbkGT90nJvYfhDD/sKieilNQYEE+YYtSaVmWTYjdI1
         kNdGK28fOjWtdNKqv7La8Ig02ymZfMTuP+YWOhz3sLzCuFVfyO7oay1NJH9IAXcZIpyw
         mA0JOQ7PN38pAP+hLorOXDLNaCsyUixjaEjFRWBLQG0p7kpQDfbOMhvM0sXz6O21oIk4
         q+t03TpXfWBCSa7dCWij5U5JYLkEzmq3Uorj+k1I5cNRWdnFVFTHCjNzOweUFJEj/Y4j
         HsIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LErq3Y4Hjmoq8Xi3S1zeN4MywBbURDL36GQs5umBzmQ=;
        b=q9O+EkXNf2eDq4jbcZccoMj4JChXRZpH2m4PobMY7JLjxzuMylfPlBHHz6BtKo9uvg
         pfvzFuqNlKzx1gLE8iJrX8IenZxNdTcDW1SBTPi88MEXrjzRmKPX5oExIMDl2SspotVJ
         zxa7WpzPnILzoKf8q0PdT0quXA0cd+YoKjIOsUDC2UUG6VTei1YJjRQ2BGqZYYhMCMP+
         kHYokcWzBV06h8rNb2JHIYWbqar2FdCvsMwjTyqPosD9iFEtUixs9Eu5ZUK3mMhwkRzg
         X3kxSVXy2+OEsCC5+NbuUd26tmIL2z2TdGump37Zfdza7ZK7eN1q+I060LnXfOo6gka3
         MN7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QqQjQ0dO;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id hd17si2132895ejc.727.2021.08.31.05.17.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Aug 2021 05:17:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QqQjQ0dO;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630412259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LErq3Y4Hjmoq8Xi3S1zeN4MywBbURDL36GQs5umBzmQ=;
	b=QqQjQ0dOeuwdWEcEmPLIb5itvSGRGU+P0Mli+6czEafDQsHnRM1w5rRJrZ8YmKLCXoW6K4
	8Kw5RrI0QjIs217biwKemw/v5JVN9KXJdxhGdCBP955LPT8FYX9yHJoQBELusIBPNq0GZp
	yK9FzN4haX10Vj/1XllKUIS/Ui8mzSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-_EFdG9kxMsWr87DesJQqTQ-1; Tue, 31 Aug 2021 08:17:38 -0400
X-MC-Unique: _EFdG9kxMsWr87DesJQqTQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B564192502;
	Tue, 31 Aug 2021 12:17:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EEC8104B4C2;
	Tue, 31 Aug 2021 12:17:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id D296A1800998; Tue, 31 Aug 2021 14:15:45 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Xu <peterx@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>,
	qemu-ppc@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-riscv@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Stafford Horne <shorne@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bin Meng <bin.meng@windriver.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Greg Kurz <groug@kaod.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-s390x@nongnu.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 12/29] tcg_funcs: Add tlb_reset_dirty to TCGModuleOps
Date: Tue, 31 Aug 2021 14:15:28 +0200
Message-Id: <20210831121545.2874233-13-kraxel@redhat.com>
In-Reply-To: <20210831121545.2874233-1-kraxel@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: BFumV2Hxmz/o

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/exec/exec-all.h  | 1 -
 include/tcg/tcg-module.h | 3 +++
 accel/tcg/cputlb.c       | 3 ++-
 accel/tcg/tcg-module.c   | 9 +++++++++
 softmmu/physmem.c        | 2 +-
 5 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 43d89699e989..27fc489c57b5 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -691,7 +691,6 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr);
 tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
                                         void **hostp);
 
-void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
 void tlb_set_dirty(CPUState *cpu, target_ulong vaddr);
 
 MemoryRegionSection *
diff --git a/include/tcg/tcg-module.h b/include/tcg/tcg-module.h
index a903e3ee62c0..a14dcdb002db 100644
--- a/include/tcg/tcg-module.h
+++ b/include/tcg/tcg-module.h
@@ -6,6 +6,9 @@
 struct TCGModuleOps {
     void (*tlb_flush)(CPUState *cpu);
     void (*tlb_flush_page)(CPUState *cpu, target_ulong addr);
+#if defined(CONFIG_SOFTMMU)
+    void (*tlb_reset_dirty)(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
+#endif
 };
 extern struct TCGModuleOps tcg;
 
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 1fcdb71a10a0..fa9c9064848c 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1004,7 +1004,7 @@ static inline void copy_tlb_helper_locked(CPUTLBEntry *d, const CPUTLBEntry *s)
  * We must take tlb_c.lock to avoid racing with another vCPU update. The only
  * thing actually updated is the target TLB entry ->addr_write flags.
  */
-void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length)
+static void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length)
 {
     CPUArchState *env;
 
@@ -2772,6 +2772,7 @@ static void tcg_module_ops_tlb(void)
 {
     tcg.tlb_flush = tlb_flush;
     tcg.tlb_flush_page = tlb_flush_page;
+    tcg.tlb_reset_dirty = tlb_reset_dirty;
 }
 
 type_init(tcg_module_ops_tlb);
diff --git a/accel/tcg/tcg-module.c b/accel/tcg/tcg-module.c
index 4d62160628bd..febf4e49981c 100644
--- a/accel/tcg/tcg-module.c
+++ b/accel/tcg/tcg-module.c
@@ -9,7 +9,16 @@ static void tlb_flush_page_stub(CPUState *cpu, target_ulong addr)
 {
 }
 
+#if defined(CONFIG_SOFTMMU)
+static void tlb_reset_dirty_stub(CPUState *cpu, ram_addr_t start1, ram_addr_t length)
+{
+}
+#endif
+
 struct TCGModuleOps tcg = {
     .tlb_flush = update_cpu_stub,
     .tlb_flush_page = tlb_flush_page_stub,
+#if defined(CONFIG_SOFTMMU)
+    .tlb_reset_dirty = tlb_reset_dirty_stub,
+#endif
 };
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 8fa5376de1c9..8b27827c533d 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1015,7 +1015,7 @@ static void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length)
     assert(block == qemu_get_ram_block(end - 1));
     start1 = (uintptr_t)ramblock_ptr(block, start - block->offset);
     CPU_FOREACH(cpu) {
-        tlb_reset_dirty(cpu, start1, length);
+        tcg.tlb_reset_dirty(cpu, start1, length);
     }
 }
 
-- 
2.31.1
