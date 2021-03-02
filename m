Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4538947lfg;
        Tue, 2 Mar 2021 06:59:35 -0800 (PST)
X-Received: by 2002:a50:fa42:: with SMTP id c2mr2638199edq.159.1614697175187;
        Tue, 02 Mar 2021 06:59:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614697175; cv=none;
        d=google.com; s=arc-20160816;
        b=iMD1oa/V9Wfeb+plj85cKpfr+5OTY44RUAs2jkE2urEs4PYBoqytvMj7zHyiwVORo8
         k6MjG+fijG1ELriC8gghQWMVAYYoqCXS2eHZDSW1cgJ56m/Vh9JmN3eKu9SxUxCmuQRE
         mAi9rIt64eewTbULp515+AgH1KOImaitbwBEleMuHjBbCuoPcBAXvQk5+StushLQu4nS
         Y+f7es1PYliHL2f9vaxruj70bdsnm5J6EiispUO6eWlrKKhVhuAvGxlyaYXM+8xjtRKi
         97cSKbTx9k5NzywlM+5ZvQeRdndrOzAr2GTPMyo2oFm5CxFA3m7dUhc/qvgEEGg9iQW9
         KotA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=3zGnBy/ooDQWipOUXA4VYqSSXUzahy8KeeI37j2hOl0=;
        b=CT3eVXXgf9cBlsE5pZZ5VPmzzYOrsmAcgm/gjt4Kc5ztq6C50N2UZUCt39Wyh6nBqa
         3QBJtzz8zsYv1KNHE1BhVcwkl5AolPw/HF3gytlY96KNfxCYqN9f+GBG5B9nOwxhNc39
         8O2b6erKqC6HXDwBOrq4YF3cROmHPA7ONw7fULkQj2ISwBs1bXzqEzQx2RqzWaYKTUTX
         YP6+TZz9/F5+qxeYK7t+A272TLUBhZoUscUQTEqQxTjBHwhBFng3J27XGwTGrZLIGSTO
         K6DDLwbwB4VUhStNbROYbhQ63+KwwYm8Y0Kto0pN4CJxA+ZOW+Y9vJxIcTjtsdFrcjSV
         WrEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hrbj53fq;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z20sor5576603ejp.16.2021.03.02.06.59.34
        (Google Transport Security);
        Tue, 02 Mar 2021 06:59:35 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hrbj53fq;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3zGnBy/ooDQWipOUXA4VYqSSXUzahy8KeeI37j2hOl0=;
        b=hrbj53fqkMBtZA2J1FnZ2hMh8+sYgsr2SU6kVUQf0G34z42mpX99FO0+V74efSMtlX
         earTnCobIGP1bSiKpMIxuhb8mOf06c6siiaVWSv8WKtltNAg9Hah56HpKmNRHjtxClBe
         jXagw7rXXEVywslEhXVnPvwu0VJ99rwJAH9H9vzahsT0yqlHhyg9xGgczNrtXJBNmLyA
         6EsAgFb4AVFqcmsVPzANn+gHCwMrbibaVlmzFrDjhNh060qK39uijtDUrsGwSnH9GtaP
         hBk6QfJTvGKdea4z9CfiSNpelFKlXzvj2leX46XxL7O7mEnOu+26uPj7hIswmFUF7mgK
         VpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=3zGnBy/ooDQWipOUXA4VYqSSXUzahy8KeeI37j2hOl0=;
        b=NakxmlMacWMOfInYvRQkrJg0z4xLtKVuyMnKrbWDxjjOPoUic4ZzAyo8g7wT7WdYOh
         62OfaV2IhSWXsIEACab5wlXFS++Hd0lXuWzbkZfAiqDmSUyjit3TcVt+WHD7PJdV7f3I
         xWvVVo/mdptOGZsLArCAAh6ZsPLStyG0YIRnHOX/Hd5USLMKAvmzJjVQyfJZjesa8z0L
         0hOVEJdYPJs75k0ZbVoZKDQO0QmhsBWX0dBd0i+vtk6sexfkySATPxPdZnixnPa0a91n
         Nj4gmZ3JLIu5Lr6tNYOvMH37Zy80g6gQYhAly9lms2Kdco7fnaRk/p37Z+GUYQ/+dKbE
         3p+Q==
X-Gm-Message-State: AOAM530g/3dOKxyRD4+gkeIIrBBLfFcBcTG5QDQWqIohp7ZQAIM1jvzy
	eyhVkZ0S6hrbBCMPieFjgrs=
X-Google-Smtp-Source: ABdhPJyN2mVFnlCOkYkKnVAjvSarvywqFg7PFeIIErLqrf37IpeUDy4gsXAaKMRnnplHnCrKmOZBtg==
X-Received: by 2002:a17:906:9386:: with SMTP id l6mr20793142ejx.455.1614697174620;
        Tue, 02 Mar 2021 06:59:34 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id i10sm1002858ejv.106.2021.03.02.06.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 06:59:34 -0800 (PST)
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
Subject: [PATCH v3 10/27] cpu: Move CPUClass::get_crash_info to SysemuCPUOps
Date: Tue,  2 Mar 2021 15:58:01 +0100
Message-Id: <20210302145818.1161461-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302145818.1161461-1-f4bug@amsat.org>
References: <20210302145818.1161461-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9VFtUYsAoDJA

cpu_get_crash_info() is called on GUEST_PANICKED events,
which only occur in system emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            | 1 -
 include/hw/core/sysemu-cpu-ops.h | 5 +++++
 hw/core/cpu.c                    | 4 ++--
 target/i386/cpu.c                | 2 +-
 target/s390x/cpu.c               | 2 +-
 5 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index dfb50b60128..781cd8fc42b 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -150,7 +150,6 @@ struct CPUClass {
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
                            uint8_t *buf, int len, bool is_write);
     void (*dump_state)(CPUState *cpu, FILE *, int flags);
-    GuestPanicInformation* (*get_crash_info)(CPUState *cpu);
     void (*dump_statistics)(CPUState *cpu, int flags);
     int64_t (*get_arch_id)(CPUState *cpu);
     bool (*get_paging_enabled)(const CPUState *cpu);
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index 9c3ac4f2280..b9ffca07665 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -16,6 +16,11 @@
  * struct SysemuCPUOps: System operations specific to a CPU class
  */
 typedef struct SysemuCPUOps {
+    /**
+     * @get_crash_info: Callback for reporting guest crash information in
+     * GUEST_PANICKED events.
+     */
+    GuestPanicInformation* (*get_crash_info)(CPUState *cpu);
     /**
      * @virtio_is_big_endian: Callback to return %true if a CPU which supports
      *       runtime configurable endianness is currently big-endian.
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 09eaa3fa49f..0aebc18c41f 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -220,8 +220,8 @@ GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
     CPUClass *cc = CPU_GET_CLASS(cpu);
     GuestPanicInformation *res = NULL;
 
-    if (cc->get_crash_info) {
-        res = cc->get_crash_info(cpu);
+    if (cc->sysemu_ops->get_crash_info) {
+        res = cc->sysemu_ops->get_crash_info(cpu);
     }
     return res;
 }
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 2d1e61da8ea..b7672a7accc 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7388,6 +7388,7 @@ static Property x86_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps i386_sysemu_ops = {
+    .get_crash_info = x86_cpu_get_crash_info,
     .vmsd = &vmstate_x86_cpu,
 };
 #endif
@@ -7427,7 +7428,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->asidx_from_attrs = x86_asidx_from_attrs;
     cc->get_memory_mapping = x86_cpu_get_memory_mapping;
     cc->get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug;
-    cc->get_crash_info = x86_cpu_get_crash_info;
     cc->write_elf64_note = x86_cpu_write_elf64_note;
     cc->write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
     cc->write_elf32_note = x86_cpu_write_elf32_note;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index a480f4abbaf..04c14fcd9da 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -479,6 +479,7 @@ static void s390_cpu_reset_full(DeviceState *dev)
 
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps s390_sysemu_ops = {
+    .get_crash_info = s390_cpu_get_crash_info,
     .vmsd = &vmstate_s390_cpu,
 };
 #endif
@@ -523,7 +524,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = s390_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
-    cc->get_crash_info = s390_cpu_get_crash_info;
     cc->write_elf64_note = s390_cpu_write_elf64_note;
     cc->sysemu_ops = &s390_sysemu_ops;
 #endif
-- 
2.26.2
