Received: by 2002:a17:906:eca:b0:a27:dfb7:c645 with SMTP id u10csp1392562eji;
        Tue, 2 Jan 2024 07:35:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9kyRAjgK2P9gAEYIKSTnYlEdb3Gw/nA4xX1xrJq16hBNHCQhRwyI2jLucIPitsag1UfaP
X-Received: by 2002:a05:6830:13d4:b0:6dc:18c:6e79 with SMTP id e20-20020a05683013d400b006dc018c6e79mr7512695otq.36.1704209748184;
        Tue, 02 Jan 2024 07:35:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704209748; cv=none;
        d=google.com; s=arc-20160816;
        b=aIjEBXeZphscVdXBNKAIMUdUAkkt3nGpwLspAghQxFG4RHRXENdo3J1AByK4WqnwN6
         a9om4+qu7BBInDHfMFJpf6heIa5zG3QjXKQ4AoElcqdGTUzJC65hVpvAaGU48nALSD26
         B250Tr4JIKwWOB14at7TdchGkLF+o2uDiGn9URu7x904KEp9vMDsANp9AC9PVjM6puuD
         52sX/hVlqbT37sKhXWIc0b3iGRp1I3e7iLYzqEC2Xdf2qvBW2Hy/zITJ/U0wUbZJU4sI
         VCOMJHMTtPdfz+uG3nZ5SUzZIwDD7MEhRazMwgvTL6CROWenZK+NZAtQgV9XmEAiHWlp
         nRmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OwajIiXGKStV/z0IMsU+Fr0XyTy0YZLrRynkJ5gSOmo=;
        fh=r/Bq2B569Wob7NsFv67ytVewg162R6FrrEg3uyxwPD0=;
        b=WWwb7IP5Yw9hk2wvp+9v+ZirP7KB+QxxREpDFOhIsxDKQMojegDPG+q89+mZjDfvrp
         qyXEz7bOAfdfSA/NSwoQ2emuiW3s3VMlvYO8ejQXQYGr/erOUa4m8kOHci5f9i8Jxlzz
         QuDklZdJXMUaPzy30Nk/HD4u04i4YKX3ZwE9G6rV0VT1l4rlYAtFnZTVk4Nz86ufpS7x
         7Cnr/I6PQ//rZODqGiC5rpOTHjRt4oK8z7KJ0D46Rmrecf8blznM7iXxYsuiHlsDMjxm
         fLIFVFO7at2Mcz2tePGG299PWnqrYkjNKalXMjq2t0NF59e4bgaxWeWNIM/I8LcxZSD1
         6F6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OtKK3i4G;
       spf=pass (google.com: domain of stefanha@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <stefanha@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id c13-20020a05622a024d00b0042383d2deedsi27001185qtx.614.2024.01.02.07.35.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 07:35:48 -0800 (PST)
Received-SPF: pass (google.com: domain of stefanha@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OtKK3i4G;
       spf=pass (google.com: domain of stefanha@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704209747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OwajIiXGKStV/z0IMsU+Fr0XyTy0YZLrRynkJ5gSOmo=;
	b=OtKK3i4GYaFTK4NOtkd25wJRNFdvcPchHVTCmHiEgnY1e0BIRles4kN9PNM3uIdjD/Jf6a
	J+n5b0Pfw5687mGqSiClAGsh9s/6CpTr0Wpr32VDHD5i4vkUQ82mbEU6jcGcMcZ352nrPr
	PsLXEJ/AfMNGik1mQDKJDOpnnycT4aI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-1PB8t8t1Oum-Zc_LQMCeiA-1; Tue, 02 Jan 2024 10:35:43 -0500
X-MC-Unique: 1PB8t8t1Oum-Zc_LQMCeiA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48BBC1019DE2;
	Tue,  2 Jan 2024 15:35:41 +0000 (UTC)
Received: from localhost (unknown [10.39.193.188])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D0B151C060AF;
	Tue,  2 Jan 2024 15:35:39 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>,
	qemu-riscv@nongnu.org,
	Roman Bolshakov <rbolshakov@ddn.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Thomas Huth <thuth@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Fam Zheng <fam@euphon.net>,
	Gerd Hoffmann <kraxel@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	John Snow <jsnow@redhat.com>,
	Stafford Horne <shorne@gmail.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Cameron Esfahani <dirty@apple.com>,
	Alexander Graf <agraf@csgraf.de>,
	David Hildenbrand <david@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org,
	Jiri Slaby <jslaby@suse.cz>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Eric Blake <eblake@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Michael Roth <michael.roth@amd.com>,
	Paul Durrant <paul@xen.org>,
	Jagannathan Raman <jag.raman@oracle.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Hyman Huang <yong.huang@smartx.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	xen-devel@lists.xenproject.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Song Gao <gaosong@loongson.cn>,
	Kevin Wolf <kwolf@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	qemu-ppc@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bin Meng <bin.meng@windriver.com>,
	qemu-arm@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	Leonardo Bras <leobras@redhat.com>,
	Hailiang Zhang <zhanghailiang@xfusion.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	kvm@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Eric Farman <farman@linux.ibm.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v3 3/5] qemu/main-loop: rename qemu_cond_wait_iothread() to qemu_cond_wait_bql()
Date: Tue,  2 Jan 2024 10:35:27 -0500
Message-ID: <20240102153529.486531-4-stefanha@redhat.com>
In-Reply-To: <20240102153529.486531-1-stefanha@redhat.com>
References: <20240102153529.486531-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-TUID: rafW4w++7AWH

The name "iothread" is overloaded. Use the term Big QEMU Lock (BQL)
instead, it is already widely used and unambiguous.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/main-loop.h          | 10 +++++-----
 accel/tcg/tcg-accel-ops-rr.c      |  4 ++--
 hw/display/virtio-gpu.c           |  2 +-
 hw/ppc/spapr_events.c             |  2 +-
 system/cpu-throttle.c             |  2 +-
 system/cpus.c                     |  4 ++--
 target/i386/nvmm/nvmm-accel-ops.c |  2 +-
 target/i386/whpx/whpx-accel-ops.c |  2 +-
 8 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index c26ad2a029..5764db157c 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -371,17 +371,17 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(BQLLockAuto, bql_auto_unlock)
         = bql_auto_lock(__FILE__, __LINE__)
 
 /*
- * qemu_cond_wait_iothread: Wait on condition for the main loop mutex
+ * qemu_cond_wait_bql: Wait on condition for the Big QEMU Lock (BQL)
  *
- * This function atomically releases the main loop mutex and causes
+ * This function atomically releases the Big QEMU Lock (BQL) and causes
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
index c4ea372a3f..5794e5a9ce 100644
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
index 786a9a5639..c951a6c65e 100644
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
             bql_unlock();
diff --git a/system/cpus.c b/system/cpus.c
index 9b68dc9c7c..c8e2772b5f 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -514,12 +514,12 @@ void bql_unlock(void)
     qemu_mutex_unlock(&bql);
 }
 
-void qemu_cond_wait_iothread(QemuCond *cond)
+void qemu_cond_wait_bql(QemuCond *cond)
 {
     qemu_cond_wait(cond, &bql);
 }
 
-void qemu_cond_timedwait_iothread(QemuCond *cond, int ms)
+void qemu_cond_timedwait_bql(QemuCond *cond, int ms)
 {
     qemu_cond_timedwait(cond, &bql, ms);
 }
diff --git a/target/i386/nvmm/nvmm-accel-ops.c b/target/i386/nvmm/nvmm-accel-ops.c
index f9d5e9a37a..6b2bfd9b9c 100644
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
index e783a760a7..189ae0f140 100644
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
2.43.0
