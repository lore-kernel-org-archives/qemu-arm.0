Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4974633lfb;
        Tue, 31 Aug 2021 05:17:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwV2XMtkPBw6hhp953nzVL2FUZjgWjjd66TkIv2nbF468YxEFK8L4CusM3qkiPR8BzL4HQn
X-Received: by 2002:a17:906:840d:: with SMTP id n13mr13356998ejx.53.1630412268131;
        Tue, 31 Aug 2021 05:17:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630412268; cv=none;
        d=google.com; s=arc-20160816;
        b=yCmnhL79PTqlE8dK68UJydm7L1XaqAjADz65yI4aIhd2W2sTmyTJUw/98DWB/BVWcm
         eneQQPCkTLRD4jEQWEWIEeVZGV8vTb0BXs+4lZWSuguP5O6cyej/ZH1QoXH2JEM9Z/ls
         nqXOmqwBaltm56jKmk4jPwv5ZguCbDPoeMd8ApPvcw32sMDiVs1U4L27gBlkz6xlIh5z
         lm8zo0k7VwJPPd+04a/KrmJuahG+VBGrFoWfsyJrB66IlanzV5ztgrMosGGQgRF1KQFg
         eEJqxO6g3edv7XDHk3QTXrbuVsAq2eXUz8EWZPHoKZz+YuDnDDD0bhn/DUqgzk9tG+1L
         fcXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WQiK4bWtRrqmM36pafXOjhA9xBq0N4cfLs1R/Rm2l08=;
        b=zEfwhNGZGG3d9xB+cO0ZmQzPesfa7gXoR6EbatGUpYWfz+Np8fXABRbeqQ5+klH1Hp
         FUlGvM5Al5xibLYAMhH48z2HY+9Eng4p8GQ0sc21vdZShl9DsxdMluDH255QJMIH8FQk
         LO5TM9WnCeBTNiAOBurOpvX6VhDsk1w9lQtruSie2uH0wj28mdaCAfi+tDIVt86Pg9K4
         Sm0eg4J9j60QMSHtfZjnLUfEh0JEpxjtxGMsIdPVp85HdEkZ1WokTUa3POWze+2kXrYd
         PxAxYxADNr5TPdWZOW1k2Adi/fQROMBQmwpHie8Ts6fp3Qb5snv79JPge61LEbFsbQ8l
         rXWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ims33BzM;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d3si16242884ejt.22.2021.08.31.05.17.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Aug 2021 05:17:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ims33BzM;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630412267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WQiK4bWtRrqmM36pafXOjhA9xBq0N4cfLs1R/Rm2l08=;
	b=Ims33BzMeUvmEXd/ERQuJnRFH3sr40v+o1u0t2mNKzbNfoQRcIxBND062xr4NyAj09j9GM
	l6ieTyNcZSyoszGrI52hoXqvbVXHaSk1dabvk/NJcligpzagcWzxd5VOwHfy5eMfi4/2Wm
	x+1g0jeDDPFHtKoqQ52AHlmc/KIOjBk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-cOXVx2-rPHmP1KuEi-nyVw-1; Tue, 31 Aug 2021 08:17:45 -0400
X-MC-Unique: cOXVx2-rPHmP1KuEi-nyVw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D535718C89DD;
	Tue, 31 Aug 2021 12:17:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36784282DC;
	Tue, 31 Aug 2021 12:17:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id E378318009CB; Tue, 31 Aug 2021 14:15:45 +0200 (CEST)
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
Subject: [PATCH 13/29] tcg_funcs: Add tlb_plugin_lookup to TCGModuleOps
Date: Tue, 31 Aug 2021 14:15:29 +0200
Message-Id: <20210831121545.2874233-14-kraxel@redhat.com>
In-Reply-To: <20210831121545.2874233-1-kraxel@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: PLSP3ME2oV9I

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/tcg/tcg-module.h | 2 ++
 accel/tcg/cputlb.c       | 3 +++
 accel/tcg/tcg-module.c   | 7 +++++++
 plugins/api.c            | 4 ++--
 4 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/tcg/tcg-module.h b/include/tcg/tcg-module.h
index a14dcdb002db..159cbd3e7ce6 100644
--- a/include/tcg/tcg-module.h
+++ b/include/tcg/tcg-module.h
@@ -8,6 +8,8 @@ struct TCGModuleOps {
     void (*tlb_flush_page)(CPUState *cpu, target_ulong addr);
 #if defined(CONFIG_SOFTMMU)
     void (*tlb_reset_dirty)(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
+    bool (*tlb_plugin_lookup)(CPUState *cpu, target_ulong addr, int mmu_idx,
+                              bool is_store, struct qemu_plugin_hwaddr *data);
 #endif
 };
 extern struct TCGModuleOps tcg;
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index fa9c9064848c..6a7872dff488 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2773,6 +2773,9 @@ static void tcg_module_ops_tlb(void)
     tcg.tlb_flush = tlb_flush;
     tcg.tlb_flush_page = tlb_flush_page;
     tcg.tlb_reset_dirty = tlb_reset_dirty;
+#ifdef CONFIG_PLUGIN
+    tcg.tlb_plugin_lookup = tlb_plugin_lookup;
+#endif
 }
 
 type_init(tcg_module_ops_tlb);
diff --git a/accel/tcg/tcg-module.c b/accel/tcg/tcg-module.c
index febf4e49981c..db3d3e9e9318 100644
--- a/accel/tcg/tcg-module.c
+++ b/accel/tcg/tcg-module.c
@@ -13,6 +13,12 @@ static void tlb_flush_page_stub(CPUState *cpu, target_ulong addr)
 static void tlb_reset_dirty_stub(CPUState *cpu, ram_addr_t start1, ram_addr_t length)
 {
 }
+
+static bool tlb_plugin_lookup_stub(CPUState *cpu, target_ulong addr, int mmu_idx,
+                                   bool is_store, struct qemu_plugin_hwaddr *data)
+{
+    return false;
+}
 #endif
 
 struct TCGModuleOps tcg = {
@@ -20,5 +26,6 @@ struct TCGModuleOps tcg = {
     .tlb_flush_page = tlb_flush_page_stub,
 #if defined(CONFIG_SOFTMMU)
     .tlb_reset_dirty = tlb_reset_dirty_stub,
+    .tlb_plugin_lookup = tlb_plugin_lookup_stub,
 #endif
 };
diff --git a/plugins/api.c b/plugins/api.c
index 2d521e6ba825..12b4cb914320 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -280,8 +280,8 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
     unsigned int mmu_idx = info >> TRACE_MEM_MMU_SHIFT;
     hwaddr_info.is_store = info & TRACE_MEM_ST;
 
-    if (!tlb_plugin_lookup(cpu, vaddr, mmu_idx,
-                           info & TRACE_MEM_ST, &hwaddr_info)) {
+    if (!tcg.tlb_plugin_lookup(cpu, vaddr, mmu_idx,
+                               info & TRACE_MEM_ST, &hwaddr_info)) {
         error_report("invalid use of qemu_plugin_get_hwaddr");
         return NULL;
     }
-- 
2.31.1
