Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4974599lfb;
        Tue, 31 Aug 2021 05:17:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2RxQIE2xRH7CLcgMi62Gzqcu/HV9KKgn2PvSVdfsGnVlru5sRLYJD6jCdi+kRFY9po05m
X-Received: by 2002:a17:906:c006:: with SMTP id e6mr30695675ejz.510.1630412263625;
        Tue, 31 Aug 2021 05:17:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630412263; cv=none;
        d=google.com; s=arc-20160816;
        b=kGamJew0P6jpO3q1yM628jj1SyOFXbHn+K9b5fuuH2giMvey+rvsgZVQu8UkuF12hn
         savMYDihXIrywu6TCjbtFATp1xMcGjSZW6AGwc6bLP/AnGboNJl49fI+pDgpE0/OxRB7
         MSyqxxq28AsyBdA8etGRtHpEZrAG1aOmlDPOlWWPoSXUcM96ywKkuH9EDrfrpjpZ91Mi
         OpwvBOzrVqacKfFZCHnPbSKnxcBX/vQdCvsiuRJGUYykv0Z6NbgsnThefa3tMxEJXVq6
         rpyoWE/Iw9RC7F9ke8nWZmscgVxmT/xWUXnHtz8WxyrTlR+s2em6B2CsRYqpN4s7fBJ9
         qz1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cCmd4O4HkpJQDqHqb3kEpsKWXrKqloX8kyxaEEA97UM=;
        b=vGHgg1dY6iictspuFBz/rxqFTadwjRsXPDkwcUCqr06J6T3C+CigIqz8ZcaKSyhLg3
         d0RrbISkNfZzxMRS6SfJwPirZOW6Q4S6xzbeGQx2YpzmIkKfF3yS/rgqhMeiZgrVHsAU
         I6BnOQZ7V/ES4ULFQrfEfcWvNAs51k/vMl5sQvEHYiKpYr3t6HIDlGdoNOVsuDmAzEse
         O+/BhePH6BLSjiHgg/3zMhxwJcJrdnubOEemQR01sEU5DbX25HBL1GTulHjv7UtbnMhR
         Bsm8Irp+r+gtU6kz82Q44UIk4JcaW7dMEce8Lmkp6tVQUusN/wal6SVUO0PhmeAiYLt9
         a8wA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LJlmvVsG;
       spf=pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id qa10si12501644ejc.678.2021.08.31.05.17.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Aug 2021 05:17:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LJlmvVsG;
       spf=pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630412262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cCmd4O4HkpJQDqHqb3kEpsKWXrKqloX8kyxaEEA97UM=;
	b=LJlmvVsGaPJy8rRVlpzFPRD0z+tTkwleM+41CH1lc5WsPQM6q6kEenlwlRDvuXyJz2n0C2
	FtiGcqiTMewUPcAONvpDbVx2F5UpIGkmEZpGwEMkDNcmc+x/S0rZvEmaYI/c8xc69DcYyM
	2EIPRh2+iBTo797CVStPjXyqEZC5dog=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-e_b-rrf6PoCAL8m62aXggA-1; Tue, 31 Aug 2021 08:17:41 -0400
X-MC-Unique: e_b-rrf6PoCAL8m62aXggA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE2BF8799E0;
	Tue, 31 Aug 2021 12:17:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CDD91007611;
	Tue, 31 Aug 2021 12:17:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 0733718009CC; Tue, 31 Aug 2021 14:15:46 +0200 (CEST)
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
Subject: [PATCH 14/29] tcg_funcs:Add  tcg_exec_{realizefn,unrealizefn} to TCGModuleOps
Date: Tue, 31 Aug 2021 14:15:30 +0200
Message-Id: <20210831121545.2874233-15-kraxel@redhat.com>
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
X-TUID: sqXia2U4HOjd

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/exec/cpu-all.h   |  2 --
 include/tcg/tcg-module.h |  2 ++
 accel/tcg/cpu-exec.c     | 12 ++++++++++--
 accel/tcg/tcg-module.c   |  6 ++++++
 cpu.c                    |  4 ++--
 5 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 32cfb634c6a0..c2bfd0ea1de1 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -440,8 +440,6 @@ void dump_opcount_info(void);
 #ifdef CONFIG_TCG
 /* accel/tcg/cpu-exec.c */
 int cpu_exec(CPUState *cpu);
-void tcg_exec_realizefn(CPUState *cpu, Error **errp);
-void tcg_exec_unrealizefn(CPUState *cpu);
 #endif /* CONFIG_TCG */
 
 /* Returns: 0 on success, -1 on error */
diff --git a/include/tcg/tcg-module.h b/include/tcg/tcg-module.h
index 159cbd3e7ce6..5dd4deb9ed57 100644
--- a/include/tcg/tcg-module.h
+++ b/include/tcg/tcg-module.h
@@ -11,6 +11,8 @@ struct TCGModuleOps {
     bool (*tlb_plugin_lookup)(CPUState *cpu, target_ulong addr, int mmu_idx,
                               bool is_store, struct qemu_plugin_hwaddr *data);
 #endif
+    void (*tcg_exec_unrealizefn)(CPUState *cpu);
+    void (*tcg_exec_realizefn)(CPUState *cpu, Error **errp);
 };
 extern struct TCGModuleOps tcg;
 
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index e5c0ccd1a2ab..d41d1d2bd24f 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -981,7 +981,7 @@ int cpu_exec(CPUState *cpu)
     return ret;
 }
 
-void tcg_exec_realizefn(CPUState *cpu, Error **errp)
+static void tcg_exec_realizefn(CPUState *cpu, Error **errp)
 {
     static bool tcg_target_initialized;
     CPUClass *cc = CPU_GET_CLASS(cpu);
@@ -999,7 +999,7 @@ void tcg_exec_realizefn(CPUState *cpu, Error **errp)
 }
 
 /* undo the initializations in reverse order */
-void tcg_exec_unrealizefn(CPUState *cpu)
+static void tcg_exec_unrealizefn(CPUState *cpu)
 {
 #ifndef CONFIG_USER_ONLY
     tcg_iommu_free_notifier_list(cpu);
@@ -1031,3 +1031,11 @@ void dump_drift_info(void)
 }
 
 #endif /* !CONFIG_USER_ONLY */
+
+static void tcg_module_ops_exec(void)
+{
+    tcg.tcg_exec_realizefn = tcg_exec_realizefn;
+    tcg.tcg_exec_unrealizefn = tcg_exec_unrealizefn;
+}
+
+type_init(tcg_module_ops_exec);
diff --git a/accel/tcg/tcg-module.c b/accel/tcg/tcg-module.c
index db3d3e9e9318..36c1df564f31 100644
--- a/accel/tcg/tcg-module.c
+++ b/accel/tcg/tcg-module.c
@@ -21,6 +21,10 @@ static bool tlb_plugin_lookup_stub(CPUState *cpu, target_ulong addr, int mmu_idx
 }
 #endif
 
+static void tcg_exec_realizefn_stub(CPUState *cpu, Error **errp)
+{
+}
+
 struct TCGModuleOps tcg = {
     .tlb_flush = update_cpu_stub,
     .tlb_flush_page = tlb_flush_page_stub,
@@ -28,4 +32,6 @@ struct TCGModuleOps tcg = {
     .tlb_reset_dirty = tlb_reset_dirty_stub,
     .tlb_plugin_lookup = tlb_plugin_lookup_stub,
 #endif
+    .tcg_exec_realizefn = tcg_exec_realizefn_stub,
+    .tcg_exec_unrealizefn = update_cpu_stub,
 };
diff --git a/cpu.c b/cpu.c
index 26277f387baf..d1c9f68a26e7 100644
--- a/cpu.c
+++ b/cpu.c
@@ -140,7 +140,7 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
 #ifdef CONFIG_TCG
     /* NB: errp parameter is unused currently */
     if (tcg_enabled()) {
-        tcg_exec_realizefn(cpu, errp);
+        tcg.tcg_exec_realizefn(cpu, errp);
     }
 #endif /* CONFIG_TCG */
 
@@ -172,7 +172,7 @@ void cpu_exec_unrealizefn(CPUState *cpu)
 #ifdef CONFIG_TCG
     /* NB: errp parameter is unused currently */
     if (tcg_enabled()) {
-        tcg_exec_unrealizefn(cpu);
+        tcg.tcg_exec_unrealizefn(cpu);
     }
 #endif /* CONFIG_TCG */
 
-- 
2.31.1
