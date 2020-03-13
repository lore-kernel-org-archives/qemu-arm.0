Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2501979lfc;
        Fri, 13 Mar 2020 11:38:05 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvZeoYNW4layRRV6DKGrla8IK9slzIubJo6SIZ7FEIBCl0YnvkAeoLOAFjbLw7oExMCligO
X-Received: by 2002:a50:de43:: with SMTP id a3mr13423830edl.295.1584124685554;
        Fri, 13 Mar 2020 11:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584124685; cv=none;
        d=google.com; s=arc-20160816;
        b=S4B21h1ObkVatCVLrQXCcidyeTluijY5a4AnFNjaPmcQH8XfLkPAdzu9LgRoYm4VxU
         Ee6+4OI0HRU6GAZJ0OmG115+0nDvm6HBcAQnQEfYvc8uT7z4jWjtxsYOsSmxs74xoFD2
         PQ2q2uLLjCz0abbR0Mc0HSgNB7LEBbeEZOKcXZsWi2v/3wmMgG0ypRa52psfdsbAKEdB
         0t6jurQBPTqA1HuTcjEWNj7aw1Y9rEDbmhK129VyPAy4WNZSSDZrP6NZosx/wm8Z6Qwj
         A2AAzS9fGU+bP8Xr0LeB/WT1SCq+JNqpkJ5uVpS1TPcYePg+APlugvvTun/tfZ1LgTla
         +jaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5MOJ97Mg3uK0x1VWiafJ67lfSZFLwR4mry93M3PzeTE=;
        b=OCVkwNC6pjWz8fb0WtEJ30OCBAJ8Otyijg3pUSqqhK7dJaP+7O1zSoYp6zjxXA8bbM
         U++e9GiGnbzdTJ2TrQDYshOKp1CQ2YQ1mBGhrYfDItG6Y4Z4VXlPWt4XHznQ88IJdjEY
         o7/jLPehEXDSqV++awmGvkJxkQJ/ner4SylhuQsW395AS/6ZbnMM/nHcgZuMfKpeNVwI
         lm0FHUJtC1F0yIkdcb1bEV1xtwiu0Bx0ECmID08W+W/KlW0/qBmU3ljAiWENz3aahTdj
         jU7+DDaQmyXd1FYCqxmv6wrkwFRG5FMmvKby2DEHlCIPUFdkxfJgD82IIa42NB1f5LUE
         MUqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XIYSYisv;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id c8si5740698ejs.260.2020.03.13.11.38.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Mar 2020 11:38:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XIYSYisv;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584124684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5MOJ97Mg3uK0x1VWiafJ67lfSZFLwR4mry93M3PzeTE=;
	b=XIYSYisvM95Af3fWw7nYZzTplHxmjkStADU3uyEILCsJyyExYyqMRsbSzvf/VGJBXNtkW8
	2/rRdAsC+DKYRDptOH92jKggvnC4jJxrrI4IDqlpCIFeivkUT2Bm+a4St/A5h8XsoUWSo8
	9J26HPLTeUS3W1pmwiYBM7h4aLjZsLE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-HbZNr5C1Nr2YgR-mC03R0A-1; Fri, 13 Mar 2020 14:38:02 -0400
X-MC-Unique: HbZNr5C1Nr2YgR-mC03R0A-1
Received: by mail-wr1-f70.google.com with SMTP id q18so4706459wrw.5
        for <alex.bennee@linaro.org>; Fri, 13 Mar 2020 11:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bmLIgnK8nZe09V5xRPW03+txWxMqC+nMqZrcX0UoUn8=;
        b=C6d8D5Ys2yf7MzwBUCFN60f7BDMSO1fR66KjLKSAl2S/RFD6Dm+Hv/WqWWA/TF6pm1
         +k+cP7KrBhpQKKW8HOQTUa1lEqZkG97clo9W2OgTk2dm0/eCnG72YOvlzWWDuWH1pAD2
         lOo+l030mX625bwfplDdyn6pWhv3wme6NCMeCPRppGpkH7ojMXw/tWAqyUQwJgH7IpQY
         gbN6sjwEk4hj2q4Gdj6qi+K1xA3GigTfsffzkW+4VyQV+62GwxO9eV9Lozt85r2WV/fL
         guQE8uFeTs0japL/1m8GGbOGHzWKLp4l9bkjVUoBGmKuzuUZ5S2pU9/5IFuETMqn0sMq
         7jpQ==
X-Gm-Message-State: ANhLgQ2ePP6acESF6j5fvNMyx2pQtRO3cx0qyQVL0qQKOgvAObDze5AI
	Ykqss33xh6//DyU6Z/uPoKiuYEsz9rtOPJHRWd3UkNC13Cum3lD5+BjNo9yrnxgwZcwZuMs4FF9
	FyYCpFXaE28DUVdXl
X-Received: by 2002:a1c:9c52:: with SMTP id f79mr12078002wme.30.1584124681708;
        Fri, 13 Mar 2020 11:38:01 -0700 (PDT)
X-Received: by 2002:a1c:9c52:: with SMTP id f79mr12077972wme.30.1584124681479;
        Fri, 13 Mar 2020 11:38:01 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net. [88.21.205.47])
        by smtp.gmail.com with ESMTPSA id q4sm36337983wro.56.2020.03.13.11.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 11:38:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-ppc@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-riscv@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-arm@nongnu.org,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 13/14] target/s390x: Restrict CpuClass::get_crash_info() to system-mode
Date: Fri, 13 Mar 2020 19:36:51 +0100
Message-Id: <20200313183652.10258-14-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200313183652.10258-1-philmd@redhat.com>
References: <20200313183652.10258-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: bIRao37HeqC0

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/s390x/cpu.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 3dd396e870..3b1377c20a 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -237,6 +237,7 @@ out:
     error_propagate(errp, err);
 }
=20
+#if !defined(CONFIG_USER_ONLY)
 static GuestPanicInformation *s390_cpu_get_crash_info(CPUState *cs)
 {
     GuestPanicInformation *panic_info;
@@ -246,11 +247,7 @@ static GuestPanicInformation *s390_cpu_get_crash_info(=
CPUState *cs)
     panic_info =3D g_malloc0(sizeof(GuestPanicInformation));
=20
     panic_info->type =3D GUEST_PANIC_INFORMATION_TYPE_S390;
-#if !defined(CONFIG_USER_ONLY)
     panic_info->u.s390.core =3D cpu->env.core_id;
-#else
-    panic_info->u.s390.core =3D 0; /* sane default for non system emulatio=
n */
-#endif
     panic_info->u.s390.psw_mask =3D cpu->env.psw.mask;
     panic_info->u.s390.psw_addr =3D cpu->env.psw.addr;
     panic_info->u.s390.reason =3D cpu->env.crash_reason;
@@ -276,6 +273,7 @@ static void s390_cpu_get_crash_info_qom(Object *obj, Vi=
sitor *v,
                                      errp);
     qapi_free_GuestPanicInformation(panic_info);
 }
+#endif
=20
 static void s390_cpu_initfn(Object *obj)
 {
@@ -285,16 +283,16 @@ static void s390_cpu_initfn(Object *obj)
     cpu_set_cpustate_pointers(cpu);
     cs->halted =3D 1;
     cs->exception_index =3D EXCP_HLT;
+#if !defined(CONFIG_USER_ONLY)
     object_property_add(obj, "crash-information", "GuestPanicInformation",
                         s390_cpu_get_crash_info_qom, NULL, NULL, NULL, NUL=
L);
-    s390_cpu_model_register_props(obj);
-#if !defined(CONFIG_USER_ONLY)
     cpu->env.tod_timer =3D
         timer_new_ns(QEMU_CLOCK_VIRTUAL, s390x_tod_timer, cpu);
     cpu->env.cpu_timer =3D
         timer_new_ns(QEMU_CLOCK_VIRTUAL, s390x_cpu_timer, cpu);
     s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
 #endif
+    s390_cpu_model_register_props(obj);
 }
=20
 static void s390_cpu_finalize(Object *obj)
@@ -477,13 +475,13 @@ static void s390_cpu_class_init(ObjectClass *oc, void=
 *data)
     cc->do_interrupt =3D s390_cpu_do_interrupt;
 #endif
     cc->dump_state =3D s390_cpu_dump_state;
-    cc->get_crash_info =3D s390_cpu_get_crash_info;
     cc->set_pc =3D s390_cpu_set_pc;
     cc->gdb_read_register =3D s390_cpu_gdb_read_register;
     cc->gdb_write_register =3D s390_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug =3D s390_cpu_get_phys_page_debug;
     cc->vmsd =3D &vmstate_s390_cpu;
+    cc->get_crash_info =3D s390_cpu_get_crash_info;
     cc->write_elf64_note =3D s390_cpu_write_elf64_note;
 #ifdef CONFIG_TCG
     cc->cpu_exec_interrupt =3D s390_cpu_exec_interrupt;
--=20
2.21.1
