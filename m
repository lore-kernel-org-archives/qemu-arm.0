Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4975289lfb;
        Tue, 31 Aug 2021 05:18:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrAcoU1MF329m4NR50EVwbayRm1+99HOHHi791QE4uEHWpNz6zx8C6rWbfMM1U20SvJnjT
X-Received: by 2002:a7b:c014:: with SMTP id c20mr3879942wmb.81.1630412317799;
        Tue, 31 Aug 2021 05:18:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630412317; cv=none;
        d=google.com; s=arc-20160816;
        b=08CE8XA3dlVHZSPiTv+N1ZvTuu8BEWx8WDO1GK2ZLgfYSlLHmCbO67qyypjv0CGek5
         ItExYPbm5LdB7j0jpjJMxbdMSiW9nedajJUpXuS4Ynv58E4T2dhG7i2+nmo8sUgaDB0R
         WJAfk91AV+8op9YIbf+FYVcGc6JtAYgf4370CHVOZAvpdyRuAulQXh7PM+SOQqKihe++
         8bwJyARM4biY6X8qiXdvXeXdUYGhzbP9LmQccE39GB3Hx+YZhcN0ekFC+t/tMxUueV5K
         Bs5XanIOLa1t5Nim43yvBgngNpJCWyvBUFzGskKotTeLVylpOwWoZtuCBiezrauewZH7
         Q2aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=p11PRkJOJjAxargU1dz9TBF2UP/nwlBlyI4WqujO8tw=;
        b=RcBumB1PqHA2un+htan1+rrFMaSkPA53AJmbRR+x40sT9T7qcOcembTkrkhReOvdGh
         5V5WMFadXOwt3VNKCKL0Ega+r3u8hr48ZbSnwsY5tIGhJpPTfo/+DBijYKGvN8j00O6f
         UUjx9wdwVo7+hFdMBa+B1tA3GNt2lKeJFYhSQqwZJ/3Nv/2hIQ2nJoFAMNZyBeAzTs+l
         1wMws32oK5Wm7FOb/YBg+a7WwQlYnRiRUpbYQvG34AIyqvcStxz/K0YkHdU5Ja1jYFaK
         FUGGcOnODRUxAf2ef8d/C7+LP6Kig0jjlOodyUa9ojZ2RWUoJQD9z+8i9loTVC+sIsba
         9qzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Fh0oGeUP;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id k4si17433316edk.274.2021.08.31.05.18.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Aug 2021 05:18:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Fh0oGeUP;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630412316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p11PRkJOJjAxargU1dz9TBF2UP/nwlBlyI4WqujO8tw=;
	b=Fh0oGeUPSQ8KggBU+PoAbrZ2SlpnVpuhTseFeL+8EjtlP5z51Rmnm8vzN/tEwra4xw2OmO
	hiq2GB9KaCZDNQidPxPfjyTCRVdnHK/jXTWWUKwwf/eZU/m7w/d4behPdR9uRkE2R8TVq7
	rPnE9ULQ+snj9dC5t1d1Hm6nmCdFbys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-R-rFrnRJOSG5W3eEQBxamA-1; Tue, 31 Aug 2021 08:18:35 -0400
X-MC-Unique: R-rFrnRJOSG5W3eEQBxamA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68E18802C8F;
	Tue, 31 Aug 2021 12:18:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 687FA5D6D5;
	Tue, 31 Aug 2021 12:18:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id B837D18009E5; Tue, 31 Aug 2021 14:15:46 +0200 (CEST)
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
Subject: [PATCH 21/29] tcg_funcs: Add curr_cflags to TCGModuleOps
Date: Tue, 31 Aug 2021 14:15:37 +0200
Message-Id: <20210831121545.2874233-22-kraxel@redhat.com>
In-Reply-To: <20210831121545.2874233-1-kraxel@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: alz/HCj7pd3S

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/exec/exec-all.h   | 2 +-
 include/tcg/tcg-module.h  | 1 +
 accel/tcg/cpu-exec.c      | 3 ++-
 accel/tcg/tcg-module.c    | 6 ++++++
 accel/tcg/translate-all.c | 6 +++---
 softmmu/physmem.c         | 4 ++--
 6 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 546db9416f43..d3cd6bf4988a 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -563,7 +563,7 @@ static inline uint32_t tb_cflags(const TranslationBlock *tb)
 }
 
 /* current cflags for hashing/comparison */
-uint32_t curr_cflags(CPUState *cpu);
+// FIXME: docs
 
 /* TranslationBlock invalidate API */
 #if defined(CONFIG_USER_ONLY)
diff --git a/include/tcg/tcg-module.h b/include/tcg/tcg-module.h
index 01205ad8fd34..e9c0615b51d9 100644
--- a/include/tcg/tcg-module.h
+++ b/include/tcg/tcg-module.h
@@ -17,6 +17,7 @@ struct TCGModuleOps {
     void (*tb_invalidate_phys_range)(tb_page_addr_t start, tb_page_addr_t end);
     void (*tb_check_watchpoint)(CPUState *cpu, uintptr_t retaddr);
     bool (*cpu_restore_state)(CPUState *cpu, uintptr_t searched_pc, bool will_exit);
+    uint32_t (*curr_cflags)(CPUState *cpu);
 };
 extern struct TCGModuleOps tcg;
 
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index d41d1d2bd24f..54d10a06914c 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -145,7 +145,7 @@ static void init_delay_params(SyncClocks *sc, const CPUState *cpu)
 }
 #endif /* CONFIG USER ONLY */
 
-uint32_t curr_cflags(CPUState *cpu)
+static uint32_t curr_cflags(CPUState *cpu)
 {
     uint32_t cflags = cpu->tcg_cflags;
 
@@ -1036,6 +1036,7 @@ static void tcg_module_ops_exec(void)
 {
     tcg.tcg_exec_realizefn = tcg_exec_realizefn;
     tcg.tcg_exec_unrealizefn = tcg_exec_unrealizefn;
+    tcg.curr_cflags = curr_cflags;
 }
 
 type_init(tcg_module_ops_exec);
diff --git a/accel/tcg/tcg-module.c b/accel/tcg/tcg-module.c
index 61ad3a648767..f307975caff2 100644
--- a/accel/tcg/tcg-module.c
+++ b/accel/tcg/tcg-module.c
@@ -38,6 +38,11 @@ static bool cpu_restore_state_stub(CPUState *cpu, uintptr_t searched_pc, bool wi
     return false;
 }
 
+static uint32_t curr_cflags_stub(CPUState *cpu)
+{
+    return 0;
+}
+
 struct TCGModuleOps tcg = {
     .tlb_flush = update_cpu_stub,
     .tlb_flush_page = tlb_flush_page_stub,
@@ -51,4 +56,5 @@ struct TCGModuleOps tcg = {
     .tb_invalidate_phys_range = tb_invalidate_phys_range_stub,
     .tb_check_watchpoint = tb_check_watchpoint_stub,
     .cpu_restore_state = cpu_restore_state_stub,
+    .curr_cflags = curr_cflags_stub,
 };
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 836ac0565e01..5ec7139a75bf 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1761,7 +1761,7 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
     if (current_tb_modified) {
         page_collection_unlock(pages);
         /* Force execution of one insn next time.  */
-        cpu->cflags_next_tb = 1 | curr_cflags(cpu);
+        cpu->cflags_next_tb = 1 | tcg.curr_cflags(cpu);
         mmap_unlock();
         cpu_loop_exit_noexc(cpu);
     }
@@ -1900,7 +1900,7 @@ static bool tb_invalidate_phys_page(tb_page_addr_t addr, uintptr_t pc)
 #ifdef TARGET_HAS_PRECISE_SMC
     if (current_tb_modified) {
         /* Force execution of one insn next time.  */
-        cpu->cflags_next_tb = 1 | curr_cflags(cpu);
+        cpu->cflags_next_tb = 1 | tcg.curr_cflags(cpu);
         return true;
     }
 #endif
@@ -1976,7 +1976,7 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
      * operations only (which execute after completion) so we don't
      * double instrument the instruction.
      */
-    cpu->cflags_next_tb = curr_cflags(cpu) | CF_MEMI_ONLY | CF_LAST_IO | n;
+    cpu->cflags_next_tb = tcg.curr_cflags(cpu) | CF_MEMI_ONLY | CF_LAST_IO | n;
 
     qemu_log_mask_and_addr(CPU_LOG_EXEC, tb->pc,
                            "cpu_io_recompile: rewound execution of TB to "
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 76b6e16d9466..4b57d2f1d8aa 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -911,7 +911,7 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                  */
                 if (!cpu->can_do_io) {
                     /* Force execution of one insn next time.  */
-                    cpu->cflags_next_tb = 1 | CF_LAST_IO | curr_cflags(cpu);
+                    cpu->cflags_next_tb = 1 | CF_LAST_IO | tcg.curr_cflags(cpu);
                     cpu_loop_exit_restore(cpu, ra);
                 }
                 /*
@@ -944,7 +944,7 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                     cpu_loop_exit_restore(cpu, ra);
                 } else {
                     /* Force execution of one insn next time.  */
-                    cpu->cflags_next_tb = 1 | curr_cflags(cpu);
+                    cpu->cflags_next_tb = 1 | tcg.curr_cflags(cpu);
                     mmap_unlock();
                     if (ra) {
                         tcg.cpu_restore_state(cpu, ra, true);
-- 
2.31.1
