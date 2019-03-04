Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3892429wrx;
        Mon, 4 Mar 2019 10:19:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqy+2KN/zq9EEW4kZ6OzRZOrUNxsZ35Ar7JdtFfQ5szocVu96tyPTX1+E8fPcuoMhoSbAM5P
X-Received: by 2002:aed:3ef6:: with SMTP id o51mr15481104qtf.183.1551723499462;
        Mon, 04 Mar 2019 10:18:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551723499; cv=none;
        d=google.com; s=arc-20160816;
        b=fXsGv0kKjGdeR3booxDG+ZzPrJlPuZAGhN5AWxKz3hn7Px5LHQzA3nyYISWlRhQ7B9
         Om76km+1fTw43JAIMiDtwkA18ZBxlskztgX9RWiruynfmTIIbr42JnHTwuoVtxww8Q6w
         4P6uOPIXSleMJ1YxfaiC1ij+oyQODprya+u+gU4rBMG1ZYtGEzC+wxvTInQEZ6l6o3Yd
         NfCh24NyzkXzgz8ssr2FugDdviU9qwzw8mTWrtfWaCUqUitWEkym+8vL8BFtkAoi6w3+
         2nOWgdeK5VCJ2f6XSi4QyMgxufD3HRPwT2UXIpAsbXllxgv5p8+hz/p+Xupx263AjQcA
         vwHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=Z4KV7GaFmevlqDcX9Cv1lXDvSLs5qtJUKfpu42eXeyo=;
        b=xGtDT6rz6jOAw261zNCh27U1uSDI006DjtSGsxHIeirUsEvIOxjIcTjAc53w+lXxWT
         yzP6ONCnQA52hJhvW36UBvRJTExynmDLHllaR8dO3AbAzhoyiu1iYhqeUc1GgMSYAmEa
         LeGY6FCngPTyPnv5orE+CV3zz4/ybnCjukFHgguH4am0njP5HhYnZD0fz8G6DG5BrnQS
         C0yVSLdcibKcXVPG/UJ2tFJeudIr6KfXBgw3rNSv8qgI/omeHuTiRcovjdf+mECnOEge
         wC4YGlOOXcB4W85Bl7qosY2M2cwvpsA91yTkQCAx4aFOwc0Rhtrh3DEw/ZROH++RB8o+
         /Ukg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.s=mesmtp header.b=NWa5noOU;
       dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=cZyGL2RB;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.26 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com. [66.111.4.26])
        by mx.google.com with ESMTPS id i6si1583339qkd.16.2019.03.04.10.18.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Mar 2019 10:18:19 -0800 (PST)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.26 as permitted sender) client-ip=66.111.4.26;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.s=mesmtp header.b=NWa5noOU;
       dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=cZyGL2RB;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.26 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 137442222B;
	Mon,  4 Mar 2019 13:18:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 04 Mar 2019 13:18:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=
	from:to:cc:subject:date:message-id; s=mesmtp; bh=Z4KV7GaFmevlqDc
	X9Cv1lXDvSLs5qtJUKfpu42eXeyo=; b=NWa5noOUYPCQrLkC4p93DnKXZbiYnjH
	eXEgs8LbanXf1ZCiUQ7efce7HWvEhuoi8O5jY7l4QTGRQ/f7q02I+ON012IVqOF0
	SFtkXrG7tfqCRYhXY5zgXHy3iuSwkbVCwdsyAGaX8pk+S3rcWLLGXi8HbqIXO+rS
	BgbSBFsaetpk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=Z4KV7GaFmevlqDcX9Cv1lXDvSLs5qtJUKfpu42eXeyo=; b=cZyGL2RB
	rYw37Mhlr4+E5PS1MdFbdKgVcs3ahrtDFNfoaCE8ezvmQ32tT3lbs34O82QWddEK
	C5YP0ZMmEIq3zKVB9mJ2N5NxxPpnE5AHnk3PRGleiPR5rZtvrDmAjiWQ6BqqMZNd
	wNVmOLjhRv9wL9MO42cley6ery5NF+UwvA7zGnqMwcN5eqrQCFaOZPoF9NtTvt/4
	QrpVL0A415MEhSYWQjHNet6w0SMdsPFJcr7UXUZDzuXpCVhafHqSpCw6SHfqmZtq
	Clnp4bg/3+zLGT6gpJ2MsPNNlnr8NlOR50tBcdF+SUsly04PL+16xRbndA+K2WTa
	ENizBM/8GOjBMg==
X-ME-Sender: <xms:5mt9XIv-bsYjk4BiIn1d5rgka3w08PIUbSFLyoqaKtvp4QWFMALcfw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrfedugdduuddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffosedttdertdertddtnecuhfhrohhmpedfgfhmihhlihhoucfi
    rdcuvehothgrfdcuoegtohhtrgessghrrggrphdrohhrgheqnecuffhomhgrihhnpehgih
    hthhhusgdrtghomhdpghhnuhdrohhrghenucfkphepuddvkedrheelrddvtddrvdduieen
    ucfrrghrrghmpehmrghilhhfrhhomheptghothgrsegsrhgrrghprdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:5mt9XGycXwQ7T6aIZktwlD6CSkAyoxzDcqcNtqI7QBS9QsQSJkijXA>
    <xmx:5mt9XGPp-Gz_uDGEtqcqMHSCsW0-8YkXpN04v0xDde_5fWzve56ThQ>
    <xmx:5mt9XA2Rq1Gh6l96hgpz92nb-TZFqE1v7S5loPfccYTYxcVcFiUktQ>
    <xmx:62t9XOQT9N_DN8MWQn5SmvbRZ_JPGm8UMxIDRmb80mZBYEIV8R4ktQ>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 68CE7E44A5;
	Mon,  4 Mar 2019 13:18:14 -0500 (EST)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Alistair Francis <alistair23@gmail.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Anthony Green <green@moxielogic.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Chris Wulff <crwulff@gmail.com>,	Cornelia Huck <cohuck@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	David Hildenbrand <david@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,	James Hogan <jhogan@kernel.org>,
	Laurent Vivier <laurent@vivier.eu>,	Marek Vasut <marex@denx.de>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>,	Michael Walle <michael@walle.cc>,
	Palmer Dabbelt <palmer@sifive.com>,	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,	qemu-s390x@nongnu.org,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Stafford Horne <shorne@gmail.com>
Subject: [PATCH v7 00/73] per-CPU locks
Date: Mon,  4 Mar 2019 13:17:00 -0500
Message-Id: <20190304181813.8075-1-cota@braap.org>
X-Mailer: git-send-email 2.17.1
X-TUID: Kx7Tbh6U8OS7

v6: https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg07650.html

All patches in the series have reviews now. Thanks everyone!

I've tested all patches with `make check-qtest -j' for all targets.
The series is checkpatch-clean (just some warnings about __COVERITY__).

You can fetch the series from:
  https://github.com/cota/qemu/tree/cpu-lock-v7

---
v6->v7:

- Rebase on master
  - Add a cpu_halted_set call to arm code that wasn't there in v6

- Add R-b's and Ack's.

- Add comment to patch 3's log to explain why the bitmap is added
  there, even though it only gains a user at the end of the series.

- Fix "prevent deadlock" comments before assertions; use
  "enforce locking order" instead, which is more accurate.

- Add a few more comments, as suggested by Alex.

v6->v7 diff (before rebase) below.

Thanks,

		Emilio
---
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index e4ae04f72c..a513457520 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -435,7 +435,7 @@ static inline bool cpu_handle_halt_locked(CPUState *cpu)
             && replay_interrupt()) {
             X86CPU *x86_cpu = X86_CPU(cpu);
 
-            /* prevent deadlock; cpu_mutex must be acquired _after_ the BQL */
+            /* locking order: cpu_mutex must be acquired _after_ the BQL */
             cpu_mutex_unlock(cpu);
             qemu_mutex_lock_iothread();
             cpu_mutex_lock(cpu);
diff --git a/cpus.c b/cpus.c
index 4f17fe25bf..82a93f2a5a 100644
--- a/cpus.c
+++ b/cpus.c
@@ -2062,7 +2062,7 @@ void qemu_mutex_lock_iothread_impl(const char *file, int line)
 {
     QemuMutexLockFunc bql_lock = atomic_read(&qemu_bql_mutex_lock_func);
 
-    /* prevent deadlock with CPU mutex */
+    /* enforce locking order */
     g_assert(no_cpu_mutex_locked());
 
     g_assert(!qemu_mutex_iothread_locked());
diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index bb0729f969..726cb7b090 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -322,7 +322,8 @@ struct qemu_work_item;
  * @mem_io_pc: Host Program Counter at which the memory was accessed.
  * @mem_io_vaddr: Target virtual address at which the memory was accessed.
  * @kvm_fd: vCPU file descriptor for KVM.
- * @lock: Lock to prevent multiple access to per-CPU fields.
+ * @lock: Lock to prevent multiple access to per-CPU fields. Must be acquired
+ *        after the BQL.
  * @cond: Condition variable for per-CPU events.
  * @work_list: List of pending asynchronous work.
  * @halted: Nonzero if the CPU is in suspended state.
@@ -804,6 +805,7 @@ static inline bool cpu_has_work(CPUState *cpu)
     bool (*func)(CPUState *cpu);
     bool ret;
 
+    /* some targets require us to hold the BQL when checking for work */
     if (cc->has_work_with_iothread_lock) {
         if (qemu_mutex_iothread_locked()) {
             func = cc->has_work_with_iothread_lock;
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 3f3c670897..65a14deb2f 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -3216,6 +3216,10 @@ void kvm_arch_pre_run(CPUState *cpu, struct kvm_run *run)
         qemu_mutex_lock_iothread();
     }
 
+    /*
+     * We might have cleared some bits in cpu->interrupt_request since reading
+     * it; read it again.
+     */
     interrupt_request = cpu_interrupt_request(cpu);
 
     /* Force the VCPU out of its inner loop to process any INIT requests
