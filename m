Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4975791lfb;
        Tue, 31 Aug 2021 05:19:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOYDu+877V69348X9gaQpR+QnGYWBT0JpaLrY0BvZ00uNzyY5ASooMnlzqJb0fR6hRIUkw
X-Received: by 2002:aa7:cb13:: with SMTP id s19mr30019280edt.87.1630412353323;
        Tue, 31 Aug 2021 05:19:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630412353; cv=none;
        d=google.com; s=arc-20160816;
        b=pl/PzozfzqE04P8HqIW7biVqQpylT8JWsLbCdrZzkmT2+QapkR1CHJU+45LihL4y4F
         eI3Ek5eOdjZi7kL155rwVkJ+hscU+zRX2m235GDL9lrKqektOsqUn83J1iH0pkIvtDt+
         s4KlJn+Dvs/UWVo6PYLbeQ6yCvtGU5LBpUPjdzrX0BF+G2gETwwreTJnCCpdkggFVfc4
         8tdu2jqKkZ5+nFoGmD5ze7NhWiZ24+dNaGKHpUGWtr6mGJLsyj2SdyR04ePMN/0EHIPi
         KMLB6F6L3tTxl9XakzaFDkFSDutKr6y3WoZlhrJtMGJkIKYmNwr4i/B8R+Uy0wi0Idgv
         FUvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bAh7jA6EdUo63aN7uq8/4SBOFFdgzWJ9ei5/ZCA+u+k=;
        b=MHEf53oiVy4les4BCAK7bVasUtV/aEx77m7HACE1cfnqUHaXLtuyzKxa1vUCsd26tu
         V7m1iOqkJR5toBxunevs+V2HrJdiYoEZR4Hr6TfRqdGaPDBuwuIP/z2eH8kK5Nd2Vvqy
         lXeImVS2iYU7IhsUXrC8FCdJqTUOYS468EGcJYsMJXlddT0JE/NGs9o4UFz72AARE3Fy
         hK3gmH0ShE/dJzM6WhjOsovqzpREsIV41J0IysPV8+pQk1VHARaa+rWzrn1C8xmCOdAw
         IbzsihX38n/7PD7Th4VTvWJCL9spt0COBNAVcxAvM5sl97Zaa76aVdvFH100D9mS/QQJ
         sWdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ly5Q44HC;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id o10si4594310edc.75.2021.08.31.05.19.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Aug 2021 05:19:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ly5Q44HC;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630412352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bAh7jA6EdUo63aN7uq8/4SBOFFdgzWJ9ei5/ZCA+u+k=;
	b=Ly5Q44HCjB8/MUI88Ee4Wi1c9tD6fET4IMWDwn4i5NQI1faituUSEG0p1NzzBmxB67y2lx
	9wlSAU7qUmhLqucah/UH3mV+kpO4OEjnWNs2WgIG8Zn6yf9Gr5WOnE+xZDPzkeIrp/MyRb
	QX/PQGDKuRJPflEtchdlWHBVOYsAloA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-mJxDlrd5P4CCeJlY2hFhXg-1; Tue, 31 Aug 2021 08:19:11 -0400
X-MC-Unique: mJxDlrd5P4CCeJlY2hFhXg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5E35100960B;
	Tue, 31 Aug 2021 12:19:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D6511001281;
	Tue, 31 Aug 2021 12:18:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 2C2E518009EE; Tue, 31 Aug 2021 14:15:47 +0200 (CEST)
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
Subject: [PATCH 26/29] tcg_i386_funcs: Add cpu_set_ignne to TCGI386ModuleOps
Date: Tue, 31 Aug 2021 14:15:42 +0200
Message-Id: <20210831121545.2874233-27-kraxel@redhat.com>
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
X-TUID: blxzPWp4ykBX

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/tcg/tcg-module-i386.h       | 1 +
 target/i386/cpu.h                   | 1 -
 accel/tcg/tcg-module-i386.c         | 5 +++++
 hw/i386/pc.c                        | 2 +-
 target/i386/tcg/sysemu/fpu_helper.c | 3 ++-
 5 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/tcg/tcg-module-i386.h b/include/tcg/tcg-module-i386.h
index 7b99b9836a20..aa96aca82c4a 100644
--- a/include/tcg/tcg-module-i386.h
+++ b/include/tcg/tcg-module-i386.h
@@ -6,6 +6,7 @@ struct TCGI386ModuleOps {
     void (*update_mxcsr_status)(CPUX86State *env);
     void (*update_mxcsr_from_sse_status)(CPUX86State *env);
     void (*x86_register_ferr_irq)(qemu_irq irq);
+    void (*cpu_set_ignne)(void);
 };
 extern struct TCGI386ModuleOps tcg_i386;
 
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d1819166ae11..6b9b1fad016f 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1836,7 +1836,6 @@ int cpu_x86_support_mca_broadcast(CPUX86State *env);
 int cpu_get_pic_interrupt(CPUX86State *s);
 /* MSDOS compatibility mode FPU exception support */
 void fpu_check_raise_ferr_irq(CPUX86State *s);
-void cpu_set_ignne(void);
 void cpu_clear_ignne(void);
 
 /* mpx_helper.c */
diff --git a/accel/tcg/tcg-module-i386.c b/accel/tcg/tcg-module-i386.c
index f6d367912c17..307238e3bc78 100644
--- a/accel/tcg/tcg-module-i386.c
+++ b/accel/tcg/tcg-module-i386.c
@@ -5,6 +5,10 @@ static void i386_update_cpu_stub(CPUX86State *cpu)
 {
 }
 
+static void i386_update_stub(void)
+{
+}
+
 static void x86_register_ferr_irq_stub(qemu_irq irq)
 {
 }
@@ -14,4 +18,5 @@ struct TCGI386ModuleOps tcg_i386 = {
     .update_mxcsr_status = i386_update_cpu_stub,
     .update_mxcsr_from_sse_status = i386_update_cpu_stub,
     .x86_register_ferr_irq = x86_register_ferr_irq_stub,
+    .cpu_set_ignne = i386_update_stub,
 };
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 102b22394689..4b74776f6d8a 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -389,7 +389,7 @@ static void ioportF0_write(void *opaque, hwaddr addr, uint64_t data,
                            unsigned size)
 {
     if (tcg_enabled()) {
-        cpu_set_ignne();
+        tcg_i386.cpu_set_ignne();
     }
 }
 
diff --git a/target/i386/tcg/sysemu/fpu_helper.c b/target/i386/tcg/sysemu/fpu_helper.c
index 9caf164a7269..6453760b33c7 100644
--- a/target/i386/tcg/sysemu/fpu_helper.c
+++ b/target/i386/tcg/sysemu/fpu_helper.c
@@ -42,7 +42,7 @@ void cpu_clear_ignne(void)
     env->hflags2 &= ~HF2_IGNNE_MASK;
 }
 
-void cpu_set_ignne(void)
+static void cpu_set_ignne(void)
 {
     CPUX86State *env = &X86_CPU(first_cpu)->env;
     env->hflags2 |= HF2_IGNNE_MASK;
@@ -59,6 +59,7 @@ void cpu_set_ignne(void)
 static void tcgi386_module_ops_fpu_sys(void)
 {
     tcg_i386.x86_register_ferr_irq = x86_register_ferr_irq;
+    tcg_i386.cpu_set_ignne = cpu_set_ignne;
 }
 
 type_init(tcgi386_module_ops_fpu_sys);
-- 
2.31.1
