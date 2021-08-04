Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp3529998lff;
        Wed, 4 Aug 2021 07:39:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqsMwlEAb155626cNP942zRd2wodRjXder73kb/V6+I/pSrJ5tdR18rpCgWroMFCylCneT
X-Received: by 2002:a17:906:2bc6:: with SMTP id n6mr26316162ejg.256.1628087960974;
        Wed, 04 Aug 2021 07:39:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628087960; cv=none;
        d=google.com; s=arc-20160816;
        b=C5sJ/x36GnvGHGkqQlaH2jEHdlnY/Dn1l5VjuQSURWymdwODBzuJjTCm8eePGQNWab
         p/F8dLmWYiJoRbx+0hsTgUkB82WAybwxwXu7EpEL/VN6NZT/re6V59/OB0vhFTYz2a5W
         02gIDeFz325psH2YN/ByTQvP7wqKxDfaQYLxwfB4qjJVxpdj3RljVw9JJwbghnV5P3Em
         3jRLQTef7f88Ze89kKZIUBEPxk4f+ugDOYNIaiNOgxN9yiw9FgwWAQTyIKtVuzoeOxth
         hqpHG/DpCcy//jXkRwVMfQv1IvpMP8mpmOrC+O1+x/ucWm4criDiGvuSAU+vDY+sWmXu
         jOog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=H+14YBWFElCf83ilUITKMOxThnDWV6jDsAJEX3YGShA=;
        b=grJ0xxnFvfcex/257KsGUIp4XbaCq8mjyLbLqG6UFGgeRBsyHzlfYFO4KEe+8+Jkrh
         j/aMq6hnm109nNBdTMjlETqe+lciD+ubNrAt9NK05xrbBlgu7fIG51P/+nhjcyL6GUQP
         L8oZzo/pvgaKgNGynPjlwghsn7h+sG0jglBDayfI6qY+j6rBiR3jIKmpTIa7EWUmK87W
         T7sSR+gxBffIeUy2xIwistNJ2FX3vRO+n/TFRl308G+MhCwCpQDWR8btSi0rEIrFGmYw
         fdddxjZJIMop7FYuaAGxSbfQZZicYam3zoX57NYLzzPBIIRbvxR3updzo13d8GuxqXrZ
         BW4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Mzhhp8jL;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d13si2304882ejb.391.2021.08.04.07.39.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Aug 2021 07:39:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Mzhhp8jL;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628087959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H+14YBWFElCf83ilUITKMOxThnDWV6jDsAJEX3YGShA=;
	b=Mzhhp8jLERih4qngN1TQqzaELlLA6GU8iqw0zBa/rTeBn6biaEKsPgPlABZToY/FJ9xvq9
	YYageIkMKeOSkolCk4X7f70m3DKhoFwfpcFbbeoFsuNm5vfyDu4WZyaZ5oEkvThORH5d7w
	MpJKJ7W66nGFMGBTnEff0pECNW9hY5o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-LxnRJQF7Oa6wvweeoN8P9A-1; Wed, 04 Aug 2021 10:39:19 -0400
X-MC-Unique: LxnRJQF7Oa6wvweeoN8P9A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA7FA87D541;
	Wed,  4 Aug 2021 14:39:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35510E2C1;
	Wed,  4 Aug 2021 14:39:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id B58C5180098D; Wed,  4 Aug 2021 16:38:26 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	qemu-s390x@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Cornelia Huck <cohuck@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 7/7] tcg/module: Add tlb_reset_dirty to TCGModuleOps
Date: Wed,  4 Aug 2021 16:38:26 +0200
Message-Id: <20210804143826.3402872-8-kraxel@redhat.com>
In-Reply-To: <20210804143826.3402872-1-kraxel@redhat.com>
References: <20210804143826.3402872-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: 4CTbtQgHbo8J

Move stub from exec-all.h to tcg-module.c.

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
index 845b9e99e819..11932746b6f9 100644
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
