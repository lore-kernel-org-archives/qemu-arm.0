Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1515158lfb;
        Fri, 3 Sep 2021 10:45:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTH5ziod7Vq6hNyu7yy9R6MkgbEedI5U/lkLaUJ5jySg6UE07QR5y9Jz5Yc6QF/TJaUGV7
X-Received: by 2002:a17:906:c249:: with SMTP id bl9mr15722ejb.225.1630691137281;
        Fri, 03 Sep 2021 10:45:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691137; cv=none;
        d=google.com; s=arc-20160816;
        b=Nsc0OQDi5nMIcDOhqwMohhvQKr7KbABflfyQ+dAK7Yjsl4nDxbocIXZBPbEv9Nz5Lw
         pfkFGB7kWxosOyu42FDppKP39Zue6LbYEu02w8UDGRbUBspwRUi1jjl82BJCbI+uMcJu
         6xpzkUEGlt5/KIZGDxwkZ5c7pMxNubShl/i8e7O1BtDovOdaUQ+wTN5dmQUu71ga/aXZ
         inV6QRZ+Jur+UqVorlJBoOZKj5h21WmkoeCEDlQKTeDXQ2a7hw79cBbMr6xLd25OtPrh
         0pE0CHdqUV3JtxLC7btUQ2OSCY1a2IonOG31d0RgqZCKirpzx63KYJw6gyc9ECfUOrBU
         I/Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CXCzW8bCYFLnmDpFGRYWy7aRyivvYc+p/NDbg6+FNF8=;
        b=oJdN17fo/769FkLCcuCSUgX0YtM2f2HPROUsBa8OSssBQU44SUxb1lxd8xF0ygwsKK
         ECEu/f0RZ/gTWdIRY/lq5uCJJIq/n2lZuxdlFZc8OJ1cN8LUpMIXSLIkld5LkzAWanWL
         jvtz6o2G0zOPmlsT5g1WyNoRPcPar1DsVy0zCeSFnQJenLUHP1urv3zQAUqCQFiBETzq
         5hKDJEfVEsohxDsu4aLRQi0HdguFe62Z67gLeMKJ9STMffHcdNas+0gZmaiJ4v1AHHSq
         zvrT6T3JiOOPY/3ld7RazyOL8wsf/ocNcL7NR3BwOUxPHm309160PNaAiggP7nOw9JAZ
         X0ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BfCvZ4cO;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id w9si5840558ejy.113.2021.09.03.10.45.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:45:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BfCvZ4cO;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CXCzW8bCYFLnmDpFGRYWy7aRyivvYc+p/NDbg6+FNF8=;
	b=BfCvZ4cOTUnYP59S8h/fPo++62aztVa1nEUvsMxeKFuZsx4ZWab2yRiI1i7fpL8hk5Kxkh
	PzG79ihjmVL8y4XSfPkuZYKlOeqfYZbKMpwi1P/NF7ADMHB8KZQ84gpToz7IbhGihxQfjU
	efiOi49W8E8gSNTdIr9qoTgBSWM5zGU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-lFoZV_G_Mw-MknMt1D8aHQ-1; Fri, 03 Sep 2021 13:45:35 -0400
X-MC-Unique: lFoZV_G_Mw-MknMt1D8aHQ-1
Received: by mail-wm1-f69.google.com with SMTP id f17-20020a05600c155100b002f05f30ff03so56268wmg.3
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:45:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CXCzW8bCYFLnmDpFGRYWy7aRyivvYc+p/NDbg6+FNF8=;
        b=q4lxc0uqjXUJct9Bc00qMZCkkjxQKfhZF4XvMQH3uGji1GAbWrDCJ9cPReP6mCUeDZ
         qaQsEuwG1Fjmgold/Q3zDDR6PzvK8Kl+TkS2EAP4xVg1F3xFF9h/j13Jqy9ulCQRuDWn
         OHllc7Din7DqMfrcCq8iaiBynKzXKjVOvK0+NZiqAEN8YtqocjbXRjzKBJQ9UezU+0SL
         h+hR8P+7n/d1Qyc5C7JMdb8jYGh64ubmBKNAJBe1MCeLUD3dej/fxt3PzA8SoT26n6bd
         GVgaiChdqTWvXcMLAtr7bl+lRf59+3pYHBcoX0VmHTp8x/yd16TqWaZ+dowAfNOAov3n
         26GA==
X-Gm-Message-State: AOAM533Fu7lrT5guIo9iJtTfDbO3g+mB0RX5qYIBFPbguDoV7ckFvBIc
	+4YY3lIuOknCQZCWbNsCrHg9LvCRrvcihI0sgVSfmm/o8jNVWQdTp6VaL7UGZsGsF6ik2kea8Ns
	b/5xMksYaxdPjK4fh
X-Received: by 2002:adf:c54a:: with SMTP id s10mr238930wrf.405.1630691134080;
        Fri, 03 Sep 2021 10:45:34 -0700 (PDT)
X-Received: by 2002:adf:c54a:: with SMTP id s10mr238902wrf.405.1630691133892;
        Fri, 03 Sep 2021 10:45:33 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id i20sm67976wml.37.2021.09.03.10.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:45:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	David Hildenbrand <david@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Hanna Reitz <hreitz@redhat.com>,
	qemu-block@nongnu.org,
	qemu-ppc@nongnu.org,
	"Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v3 04/28] accel/tcg: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:46 +0200
Message-Id: <20210903174510.751630-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903174510.751630-1-philmd@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rBN/TP7kDCLu

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 accel/tcg/cputlb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index b1e5471f949..08951f0683e 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -826,7 +826,7 @@ void tlb_flush_range_by_mmuidx(CPUState *cpu, target_ulong addr,
         tlb_flush_range_by_mmuidx_async_0(cpu, d);
     } else {
         /* Otherwise allocate a structure, freed by the worker.  */
-        TLBFlushRangeData *p = g_memdup(&d, sizeof(d));
+        TLBFlushRangeData *p = g_memdup2(&d, sizeof(d));
         async_run_on_cpu(cpu, tlb_flush_range_by_mmuidx_async_1,
                          RUN_ON_CPU_HOST_PTR(p));
     }
@@ -868,7 +868,7 @@ void tlb_flush_range_by_mmuidx_all_cpus(CPUState *src_cpu,
     /* Allocate a separate data block for each destination cpu.  */
     CPU_FOREACH(dst_cpu) {
         if (dst_cpu != src_cpu) {
-            TLBFlushRangeData *p = g_memdup(&d, sizeof(d));
+            TLBFlushRangeData *p = g_memdup2(&d, sizeof(d));
             async_run_on_cpu(dst_cpu,
                              tlb_flush_range_by_mmuidx_async_1,
                              RUN_ON_CPU_HOST_PTR(p));
@@ -918,13 +918,13 @@ void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
     /* Allocate a separate data block for each destination cpu.  */
     CPU_FOREACH(dst_cpu) {
         if (dst_cpu != src_cpu) {
-            p = g_memdup(&d, sizeof(d));
+            p = g_memdup2(&d, sizeof(d));
             async_run_on_cpu(dst_cpu, tlb_flush_range_by_mmuidx_async_1,
                              RUN_ON_CPU_HOST_PTR(p));
         }
     }
 
-    p = g_memdup(&d, sizeof(d));
+    p = g_memdup2(&d, sizeof(d));
     async_safe_run_on_cpu(src_cpu, tlb_flush_range_by_mmuidx_async_1,
                           RUN_ON_CPU_HOST_PTR(p));
 }
-- 
2.31.1
