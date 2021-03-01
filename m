Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3943386lfg;
        Mon, 1 Mar 2021 13:53:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfFc5gydS4xlf2m+6cSXceiSwhfQyGQBoTd01XdxO1kuRcCekExLUqO7/h1BbhQOPhXbus
X-Received: by 2002:a02:a809:: with SMTP id f9mr9308474jaj.63.1614635623900;
        Mon, 01 Mar 2021 13:53:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614635623; cv=none;
        d=google.com; s=arc-20160816;
        b=yQMzoVcjBV+UZHt5ZT4YlRwQOf+50a5VDSkLlOmRBJYLwXDC5aiHHTCcDSXfLgVZKK
         I/2dl++FazWQrysLywEWkTS2UmPK4DWzT2HnEmsn6pGcIyTDk3i8a2WL9iBzu2WMbwoY
         UqkQxB+LpUIMYvHF6haoGaysiDQlgzmiso13p2qv7Sm6AuV/ujP3+X8dyXbSKQWILKgA
         zPO/aBNGG8WO468EFdPrQvQK+NK5SF81VTEIE38c6MNPy4lIdEtUwkWo6OHLnNd+dqB6
         1zoHDZyFRfgOQskZMs3VCT9WIvhNSNzQePM9NGuTW9eaoenCPa4/D9xBdM5gsM3A02DK
         KSiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3zGnBy/ooDQWipOUXA4VYqSSXUzahy8KeeI37j2hOl0=;
        b=bI5MarAyyB/yzPG5NJvMV+ABRfyNG8Zqo+sTcNXyD0WSUn7N6yeQa8MAYOFTaKPYw0
         lDwHCapOyXnRB+95QTE6sB1qLT5b+viXQl0q/9h1tNQArqgCKz2pQLbOPnb6ieKcNGJB
         yP5GZetEfO1rH0k/OFgNc9I5r52T12QkqagJLJGBh/cxyg5pC4GvHFLxorcvy+Sz5wso
         QU3XojyTwHb9FnwQmOxljUW0qEX0Gv/e4F7nqUhCrByW4QWvgAHaVUfPNjfMBazAGCdC
         RfID84kSrHm6IRhsCIwKaJtiX20Dkca5GZbZERaMDu+yAnDtKDpUR1DlyoWmdtv5oXsR
         vDJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Jywtw3d2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j8si2308505ilq.114.2021.03.01.13.53.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Mar 2021 13:53:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Jywtw3d2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:40536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGqU3-0003co-4q
	for alex.bennee@linaro.org; Mon, 01 Mar 2021 16:53:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGqSt-0002Sp-Q5; Mon, 01 Mar 2021 16:52:33 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:42016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGqSr-0005H7-6A; Mon, 01 Mar 2021 16:52:30 -0500
Received: by mail-ed1-x52b.google.com with SMTP id v13so6305740edw.9;
 Mon, 01 Mar 2021 13:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3zGnBy/ooDQWipOUXA4VYqSSXUzahy8KeeI37j2hOl0=;
 b=Jywtw3d2u6GNAu8hNT06oF89zzDuEEfv9s6nUJ1v3SMT1MvxLeVPbOtjCFxEjtkVz/
 8y18mtsOuKeAUeayj94dAXjC+K5CxKJ3W2dj9SkC0qgFQykLYiO38r4JwJswusfrK8y/
 s95qEK+B/uscHToh+xiPAWrolMk41mkhAJD46IIwHRu5+o66P7SgIkEEfGVx7wAbQ2L+
 RB6jqgRKzYDUdIlWZ0JBNQfi1r+78UW6IeJeeNF6mg72mcGRMfk50mBT/EJe39+lMEP6
 WaxOrsSwq2Dzxeq3q7+TA4l5OksVIjh0Cy5tV+O/vuKKdY6WVHxhKXiWyWpwA1kgbnmW
 I0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3zGnBy/ooDQWipOUXA4VYqSSXUzahy8KeeI37j2hOl0=;
 b=p6RD7Rj6cEPxw3dQ/0KnkMS6A85azBXjP7IhCw6SEf2zJWjwlZOUIQJBujmQDMmmQx
 sIcnxqLcWle1T1qBmuMlmYnKgNKlFB+ycEsfueZblUgJ/NqBtj4CObCT+SH1suwkAIKo
 2vpYfyDkVeCPVIVHsy3B83As9x6gZLn+pOGQ/ICAGVkReSyA5pmS7ADRyI5zzGxAV+dI
 niIPhFKa3IuOFn6BIL7n/KVhUP6tVnKjbS49xTjNrq147jTJ3xVexr2yW6iaXoU1jVic
 SjPaP+86l35cFMkqye4+0Wd+NzU6h+GBp/fmH9YpIZK1RnRb5lvlM6zwoZGWlMHIT+3u
 GtWg==
X-Gm-Message-State: AOAM531v/6Wp4NDvBLzcTuxr+5I7olFE8pVNqnCFsap6puIu5ZFNTMKi
 qvYczBpnyxqAj6Av1k0Ka03K6vaDYLo=
X-Received: by 2002:aa7:d8c4:: with SMTP id k4mr18220924eds.61.1614635546120; 
 Mon, 01 Mar 2021 13:52:26 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c13sm10235931eje.37.2021.03.01.13.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 13:52:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/17] cpu: Move CPUClass::get_crash_info to SysemuCPUOps
Date: Mon,  1 Mar 2021 22:51:03 +0100
Message-Id: <20210301215110.772346-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210301215110.772346-1-f4bug@amsat.org>
References: <20210301215110.772346-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Michael S. Tsirkin" <mst@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wbtUfjCQIFOG

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

