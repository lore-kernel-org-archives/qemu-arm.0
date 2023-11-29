Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp2926882ejt;
        Wed, 29 Nov 2023 13:26:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3ZhwhTgWzvXheSPv52V38ZQ0mUlKAjQl28G7X9BedVvC3MY4pAWtDrylP+mo99okD8zQg
X-Received: by 2002:a05:6214:3005:b0:67a:45f8:c53c with SMTP id ke5-20020a056214300500b0067a45f8c53cmr16660608qvb.11.1701293210912;
        Wed, 29 Nov 2023 13:26:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701293210; cv=none;
        d=google.com; s=arc-20160816;
        b=aCgLwZyPSeCaQ1HG8YhSVL05Wmej3Hk4dUQTo0hIIcctq2kZwwZNAe3+5MOs/F9tZL
         myyuRSZFieglam1nHDQehYedM5aU318t3DMS/vd+/LhicUwmrC5xaeKJos4Jd4/2i3LH
         6RPv2JyKCX6t7UNick0OrWK+hCEaxn5K6HFPe7oNeVcMGwPwSQUUVzcXk0AGUSzd8R+0
         L/KTGXnbIlSIDOgO6q2Qxnvol8usVlX9aeM9B5VDp9et6JZAEO80r5Z3raHzbPLDRZBC
         3Y4JrzKBukm+JP2oX6Uxz8aDpP+i3i8yhtg2EFwhQu6wUEn8F7OHyqd4HHC4D16pzT7P
         EwFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=DG7+f00gCNxrB4UkczfVTSYAisk/aHQSNhsUg/07D1c=;
        fh=66jOpK19BNwWsQZvN6UyW7PgNiNU+OiaQoFBeggwlKE=;
        b=sj8Ghmhzf0vUrN/D4x0AO0n6AAbKfQN8rzLkFgNMSPRARlLM+aELb4lpOOtnk3KH0v
         cGeMDp6XK2JU2m4ZpTD+WgbiL7U+gtq+x6RhZX4ddnJlA6a6edeF/ZXGV00pxMvleGKC
         iWT8A1CHTawM/cKC8Hulk71AJnzBXmveeKQtRtk3Cu1cnowb/IdTie0HmE9Jbc3JERf5
         6C+V8v1omy0V+5qrhSUxL9Rq/MQRQGv7QEmLc6c+fN67q0E9s+PkY2qKqZ/BT9oEoZIT
         F4mfvAW5uQRob+RgRfCD6d8q2z0/duaQ0Qq7yb7sqQDJgDmsW/i/yoSN54atIfQZ5rCz
         gvHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="K/2pw8Dq";
       spf=pass (google.com: domain of stefanha@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <stefanha@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id l10-20020a0ce6ca000000b0067a51a61a7esi5487530qvn.439.2023.11.29.13.26.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 13:26:50 -0800 (PST)
Received-SPF: pass (google.com: domain of stefanha@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="K/2pw8Dq";
       spf=pass (google.com: domain of stefanha@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701293210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DG7+f00gCNxrB4UkczfVTSYAisk/aHQSNhsUg/07D1c=;
	b=K/2pw8DqGaWKt0HgEbjPSqKnG66XzHIjncfTaoUi3mUFBg5hu7ODWzrNcu4bkmSmkbxVSO
	mw2lIgNeX3IBJOceLktR7L8XxQjkHEUWq4m3j7gzajY1JWcFITSfOlrorep3mJ6+y90Wgq
	OWRbZ12HXLLe/NNjMutULq1PnnNvwGY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-55r8XQSHMnC_rWqi5-T4vw-1; Wed, 29 Nov 2023 16:26:43 -0500
X-MC-Unique: 55r8XQSHMnC_rWqi5-T4vw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37B5C83DCD6;
	Wed, 29 Nov 2023 21:26:41 +0000 (UTC)
Received: from localhost (unknown [10.39.192.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EE2DB2026D66;
	Wed, 29 Nov 2023 21:26:39 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
	Fabiano Rosas <farosas@suse.de>,
	qemu-s390x@nongnu.org,
	Song Gao <gaosong@loongson.cn>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Hyman Huang <yong.huang@smartx.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Paul Durrant <paul@xen.org>,
	Jagannathan Raman <jag.raman@oracle.com>,
	Juan Quintela <quintela@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	Jason Wang <jasowang@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Hailiang Zhang <zhanghailiang@xfusion.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Fam Zheng <fam@euphon.net>,
	Eric Blake <eblake@redhat.com>,
	Jiri Slaby <jslaby@suse.cz>,
	Alexander Graf <agraf@csgraf.de>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Eric Farman <farman@linux.ibm.com>,
	Stafford Horne <shorne@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Cameron Esfahani <dirty@apple.com>,
	xen-devel@lists.xenproject.org,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	qemu-riscv@nongnu.org,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	John Snow <jsnow@redhat.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Michael Roth <michael.roth@amd.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Bin Meng <bin.meng@windriver.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	kvm@vger.kernel.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Peter Xu <peterx@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Leonardo Bras <leobras@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 3/6] qemu/main-loop: rename qemu_cond_wait_iothread() to qemu_cond_wait_bql()
Date: Wed, 29 Nov 2023 16:26:22 -0500
Message-ID: <20231129212625.1051502-4-stefanha@redhat.com>
In-Reply-To: <20231129212625.1051502-1-stefanha@redhat.com>
References: <20231129212625.1051502-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-TUID: guhq5drrRK3F

The name "iothread" is overloaded. Use the term Big QEMU Lock (BQL)
instead, it is already widely used and unambiguous.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/qemu/main-loop.h          | 8 ++++----
 accel/tcg/tcg-accel-ops-rr.c      | 4 ++--
 hw/display/virtio-gpu.c           | 2 +-
 hw/ppc/spapr_events.c             | 2 +-
 system/cpu-throttle.c             | 2 +-
 system/cpus.c                     | 4 ++--
 target/i386/nvmm/nvmm-accel-ops.c | 2 +-
 target/i386/whpx/whpx-accel-ops.c | 2 +-
 8 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index 0b6a3e4824..ec2a70f041 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -373,17 +373,17 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(BQLLockAuto, qemu_bql_auto_unlock)
         = qemu_bql_auto_lock(__FILE__, __LINE__)
 
 /*
- * qemu_cond_wait_iothread: Wait on condition for the main loop mutex
+ * qemu_cond_wait_bql: Wait on condition for the main loop mutex
  *
  * This function atomically releases the main loop mutex and causes
  * the calling thread to block on the condition.
  */
-void qemu_cond_wait_iothread(QemuCond *cond);
+void qemu_cond_wait_bql(QemuCond *cond);
 
 /*
- * qemu_cond_timedwait_iothread: like the previous, but with timeout
+ * qemu_cond_timedwait_bql: like the previous, but with timeout
  */
-void qemu_cond_timedwait_iothread(QemuCond *cond, int ms);
+void qemu_cond_timedwait_bql(QemuCond *cond, int ms);
 
 /* internal interfaces */
 
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index c21215a094..1e5a688085 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -111,7 +111,7 @@ static void rr_wait_io_event(void)
 
     while (all_cpu_threads_idle()) {
         rr_stop_kick_timer();
-        qemu_cond_wait_iothread(first_cpu->halt_cond);
+        qemu_cond_wait_bql(first_cpu->halt_cond);
     }
 
     rr_start_kick_timer();
@@ -198,7 +198,7 @@ static void *rr_cpu_thread_fn(void *arg)
 
     /* wait for initial kick-off after machine start */
     while (first_cpu->stopped) {
-        qemu_cond_wait_iothread(first_cpu->halt_cond);
+        qemu_cond_wait_bql(first_cpu->halt_cond);
 
         /* process any pending work */
         CPU_FOREACH(cpu) {
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index b016d3bac8..67c5be1a4e 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1512,7 +1512,7 @@ void virtio_gpu_reset(VirtIODevice *vdev)
         g->reset_finished = false;
         qemu_bh_schedule(g->reset_bh);
         while (!g->reset_finished) {
-            qemu_cond_wait_iothread(&g->reset_cond);
+            qemu_cond_wait_bql(&g->reset_cond);
         }
     } else {
         virtio_gpu_reset_bh(g);
diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index deb4641505..cb0eeee587 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -899,7 +899,7 @@ void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered)
             }
             return;
         }
-        qemu_cond_wait_iothread(&spapr->fwnmi_machine_check_interlock_cond);
+        qemu_cond_wait_bql(&spapr->fwnmi_machine_check_interlock_cond);
         if (spapr->fwnmi_machine_check_addr == -1) {
             /*
              * If the machine was reset while waiting for the interlock,
diff --git a/system/cpu-throttle.c b/system/cpu-throttle.c
index e98836311b..1d2b73369e 100644
--- a/system/cpu-throttle.c
+++ b/system/cpu-throttle.c
@@ -54,7 +54,7 @@ static void cpu_throttle_thread(CPUState *cpu, run_on_cpu_data opaque)
     endtime_ns = qemu_clock_get_ns(QEMU_CLOCK_REALTIME) + sleeptime_ns;
     while (sleeptime_ns > 0 && !cpu->stop) {
         if (sleeptime_ns > SCALE_MS) {
-            qemu_cond_timedwait_iothread(cpu->halt_cond,
+            qemu_cond_timedwait_bql(cpu->halt_cond,
                                          sleeptime_ns / SCALE_MS);
         } else {
             qemu_bql_unlock();
diff --git a/system/cpus.c b/system/cpus.c
index d5b98c11f5..eb24a4db8e 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -513,12 +513,12 @@ void qemu_bql_unlock(void)
     qemu_mutex_unlock(&qemu_global_mutex);
 }
 
-void qemu_cond_wait_iothread(QemuCond *cond)
+void qemu_cond_wait_bql(QemuCond *cond)
 {
     qemu_cond_wait(cond, &qemu_global_mutex);
 }
 
-void qemu_cond_timedwait_iothread(QemuCond *cond, int ms)
+void qemu_cond_timedwait_bql(QemuCond *cond, int ms)
 {
     qemu_cond_timedwait(cond, &qemu_global_mutex, ms);
 }
diff --git a/target/i386/nvmm/nvmm-accel-ops.c b/target/i386/nvmm/nvmm-accel-ops.c
index 387ccfcce5..0fe8a76820 100644
--- a/target/i386/nvmm/nvmm-accel-ops.c
+++ b/target/i386/nvmm/nvmm-accel-ops.c
@@ -48,7 +48,7 @@ static void *qemu_nvmm_cpu_thread_fn(void *arg)
             }
         }
         while (cpu_thread_is_idle(cpu)) {
-            qemu_cond_wait_iothread(cpu->halt_cond);
+            qemu_cond_wait_bql(cpu->halt_cond);
         }
         qemu_wait_io_event_common(cpu);
     } while (!cpu->unplug || cpu_can_run(cpu));
diff --git a/target/i386/whpx/whpx-accel-ops.c b/target/i386/whpx/whpx-accel-ops.c
index 1f29346a88..d8bec46081 100644
--- a/target/i386/whpx/whpx-accel-ops.c
+++ b/target/i386/whpx/whpx-accel-ops.c
@@ -48,7 +48,7 @@ static void *whpx_cpu_thread_fn(void *arg)
             }
         }
         while (cpu_thread_is_idle(cpu)) {
-            qemu_cond_wait_iothread(cpu->halt_cond);
+            qemu_cond_wait_bql(cpu->halt_cond);
         }
         qemu_wait_io_event_common(cpu);
     } while (!cpu->unplug || cpu_can_run(cpu));
-- 
2.42.0
