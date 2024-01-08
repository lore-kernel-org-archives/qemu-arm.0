Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp2389886ejo;
        Mon, 8 Jan 2024 08:38:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGD2VMo1lhGGpHpmapyX9d1CyCvUMPUB7FtStQ1E24OmzxpSTYTjjlv20CnDsHTNBO6Ipv+
X-Received: by 2002:a05:6870:898f:b0:204:4044:55c0 with SMTP id f15-20020a056870898f00b00204404455c0mr1506244oaq.98.1704731879809;
        Mon, 08 Jan 2024 08:37:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704731879; cv=none;
        d=google.com; s=arc-20160816;
        b=puK3daQN4m3j+hUK2ykrss9vpqeGcQrdfLgCWFQ/uIBqHN1eo0YvxXqoavXwt9cfR0
         m1X37y89lXZtffbeLMWMq4Dy2q5B25nRsE8J0nS0t2SZiQXL/K4z6QbZRWIDWwlmX+0O
         RZYyLLIBgtFXwXlI6wuYlRBPMRP0J2RAZgJj50xjntDktGdYs/3/jxMcE3NWbJnSM4jb
         wjWTEP0lFB6Wn6x77srNqjBSOymIndvlUETlmYDEWcJC60fEs5JtwjQPfb56dFAImlCc
         Xj+vm6YX6mgc3UpkodBKVFWWkuodlP+P5atMRkbaaAQpsFOOF/4bfYcPsd8chRy4R5En
         CBYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=g+ze6ScecUWqpBL1ym3zeCBrNvLJSj4Of46u1qqP/x4=;
        fh=5fMz2F8zQkRjlaxnj3AO/pLGiW7hAhGPmcy5QVDwW54=;
        b=F0CpvGSv8T8L1ue8Fw3tlcX5yi3SSPEGdsNYNPj/py/ci4eLDUl8p5IIzJ4VnUX5NN
         MtEWklKFjjpQI6ZCseYMco+97P3xGnsrI0uPmGiYPUn+SW8ApF94GeaGtYKdHZEVTJli
         B94e4ssItS5Uq6FWl6al65HZ7FJedCjmxr19ogqD2KM6AD5w6OaFVk9xHRI2jh2o7znH
         e1p0UAMZIHhe1b/4WCgMEtTrymoPdbGi8yM75gRdExoJyxSAGAfafv/UhezX7afypr4J
         bJqsMaBUeh85DMa4/hjf5V5wOSp7owZ1j8yB3iE7oEiq/DS7b+3G+4wNvk3/HCiSZ4rD
         s5Sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T8qAz35+;
       spf=pass (google.com: domain of stefanha@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <stefanha@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id oq40-20020a05620a612800b00781e7ea37dcsi38193qkn.472.2024.01.08.08.37.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 08:37:59 -0800 (PST)
Received-SPF: pass (google.com: domain of stefanha@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T8qAz35+;
       spf=pass (google.com: domain of stefanha@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704731879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g+ze6ScecUWqpBL1ym3zeCBrNvLJSj4Of46u1qqP/x4=;
	b=T8qAz35+zfJSbkaJ7GfmpEvhefFJGuAtrDBQgjpiMyypjAWEv8m+p0dpF19DSm9KTDa2xl
	s39IaZQNceZAFMWpLJSAEiulsjC9A/685q7jgzn5UkHvTdY66TZ4Xxf6Dg0koJJ3PsZ+0/
	G/m8PsFz0nLZjD592miwCw1hNph24Ls=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-452-Z5Yk12GVOpSLz6gobTghhg-1; Mon,
 08 Jan 2024 11:37:54 -0500
X-MC-Unique: Z5Yk12GVOpSLz6gobTghhg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 207E43813BC5;
	Mon,  8 Jan 2024 16:37:51 +0000 (UTC)
Received: from localhost (unknown [10.39.194.85])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DEE9540C6EB9;
	Mon,  8 Jan 2024 16:37:49 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	qemu-block@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	kvm@vger.kernel.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	qemu-arm@nongnu.org,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Jiri Slaby <jslaby@suse.cz>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Paul Durrant <paul@xen.org>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Kevin Wolf <kwolf@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	xen-devel@lists.xenproject.org,
	Anthony Perard <anthony.perard@citrix.com>,
	Weiwei Li <liwei1518@gmail.com>,
	qemu-ppc@nongnu.org,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Song Gao <gaosong@loongson.cn>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	qemu-riscv@nongnu.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexander Graf <agraf@csgraf.de>,
	Markus Armbruster <armbru@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Stefan Weil <sw@weilnetz.de>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Hailiang Zhang <zhanghailiang@xfusion.com>,
	Hyman Huang <yong.huang@smartx.com>,
	Michael Roth <michael.roth@amd.com>,
	Fam Zheng <fam@euphon.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Stafford Horne <shorne@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Cameron Esfahani <dirty@apple.com>,
	Eric Farman <farman@linux.ibm.com>,
	Jason Wang <jasowang@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Hanna Reitz <hreitz@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jagannathan Raman <jag.raman@oracle.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Bin Meng <bin.meng@windriver.com>,
	Fabiano Rosas <farosas@suse.de>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PULL 4/6] qemu/main-loop: rename qemu_cond_wait_iothread() to qemu_cond_wait_bql()
Date: Mon,  8 Jan 2024 11:37:33 -0500
Message-ID: <20240108163735.254732-5-stefanha@redhat.com>
In-Reply-To: <20240108163735.254732-1-stefanha@redhat.com>
References: <20240108163735.254732-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-TUID: XNIY8BUHtRy7

The name "iothread" is overloaded. Use the term Big QEMU Lock (BQL)
instead, it is already widely used and unambiguous.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Paul Durrant <paul@xen.org>
Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-id: 20240102153529.486531-4-stefanha@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
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
index bae1c2a803..f8a675eb30 100644
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
index 1ede629f1f..68d161d96b 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -533,12 +533,12 @@ void bql_unlock(void)
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
