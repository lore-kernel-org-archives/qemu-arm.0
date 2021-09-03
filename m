Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1173702lfb;
        Fri, 3 Sep 2021 04:07:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwmuRBtJc8tArOyXjVXILnJvy2ZwyzwT+Lxqq3mJJ5TYl053kqZPHez5Flwg+tNo24NaGz
X-Received: by 2002:a05:600c:2f08:: with SMTP id r8mr7794014wmn.86.1630667253993;
        Fri, 03 Sep 2021 04:07:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667253; cv=none;
        d=google.com; s=arc-20160816;
        b=B/apN2EoaTUkRmCM6MUbs16LxH60HfTvOfiRiyjtdGAqXhbjdU2b2xb00V78I8h6yh
         gZSKo0DnCX5Qr7gCUfWQyPXECtO3NYkusTUKC+tPV70krHL97S6w0KMZwXOqbtu9oj/J
         +62/KhWs1HjNw2RucTEGVoxEKItQLdFYFL/UzGKrc2z5+t+vlPlu+wNTFy+apu3bEcC4
         6cFUIw7gwRh4Jx/s4QR5Oz+LxgYYVPSF5ZYUdFrSZozkarc59yEhwzkXyS0tDpnyJKLC
         VbbwfMbRPERImkF+lNvzWrVVupsyROfNXWdERDe+TD5RpO95MkFhdN7RQsqIzNu6Jl9q
         BaTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YRPx8k5aASvYP1xf6/9soHjF4TaI9K/GxMLKkwWKabI=;
        b=UJJd5Ra7ApjHUiibRC6+/OKB4a0MHH11Z0qXnpVZznqVssSduUedzyGmXzQhwMlDZR
         eNaHEh4aGWYCEA+MBWF51p3gJgopC6O3t0Kl00sN3WmvAqjW25UJlUY7vgyrzq6lawpy
         5tYTM4xDjyQBi7ZXdaGjOnSGtSTqEPQfAxQbZ/CbkC3HzucNLIiMzSlxrt6IDtyiIQsv
         PjhVA8nFjv0UGAUcFZ0/VYxan+8svpDa7JoKlbMJ61Va7lsmRvUoP1056Ywz2CwdfHyg
         KzCbHAi1odSSOf3n2v9mUcx691NccZQIh2f7m2/Mpefd7vZFvMgzfo2WDHoX3yWSJvAZ
         hmOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="V4Rhcr/4";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id y7si6225063edm.197.2021.09.03.04.07.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:07:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="V4Rhcr/4";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YRPx8k5aASvYP1xf6/9soHjF4TaI9K/GxMLKkwWKabI=;
	b=V4Rhcr/4SsJ/FFbJ/vIbye3amfK7eyvH2Yr0SX3vVMSwKpZ/gnKDFEtQ6YwpsAQ5jMFimc
	Q4dTs3ZcRRTgbwbkXrmZ6MpHgMMMgLSFZGqq+IH66ro7EFcrjVOsQf+JLNz4fJWj7apbzD
	Yi7AsQ1Yo021ka6Bf6dA4Hg7N1+v6UM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-SfcXP4sHOza4ruEZNnI0wg-1; Fri, 03 Sep 2021 07:07:29 -0400
X-MC-Unique: SfcXP4sHOza4ruEZNnI0wg-1
Received: by mail-wm1-f71.google.com with SMTP id f17-20020a05600c155100b002f05f30ff03so2524983wmg.3
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 04:07:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YRPx8k5aASvYP1xf6/9soHjF4TaI9K/GxMLKkwWKabI=;
        b=EDlKqAzl/uwDp1DxutcE1/QGhUNRDcktSCD5HHBhmCDAaPEHQUZndwaeAb5hESxqQ4
         HM0pKmbm/DZIIn2f+NVdiZtn24ZOz4k+r5LjYAM21U/p1bC4sINh98i24u4iLfeYoEXK
         q18eDhVMTH9IOtB0hp+k2Hmb4i9TePVabx6yFcomChbTjI69VzV619vFV40HbnoFg7oZ
         MCJQDbbCJXnfZVIDyeLtNVUtZLqk9SdYWgP+QpB2hQsvtnJEn0qJ9D9JQ8TTMachFHsX
         i6s3VuHKIFZreSkQXqiljqIQ61kUABFB1pXOyOOr2d8Fi6KkEUnIIZV1901SL8Fv9enD
         iZTQ==
X-Gm-Message-State: AOAM532lOg4AaGjFRNAVlT23tK7TaZZE5mIwHcZS1kuAEwvHhcVC9Q8g
	mFoGGWiGTsfIZvwM55xxwtxVuH/lyE9ukOHWR3pa+9t/Ldsv5MT51V6M7KVUMLR3O5WoD3KNS0A
	jrTcMTzD5NDzRw58R
X-Received: by 2002:a05:6000:92:: with SMTP id m18mr3355266wrx.293.1630667248769;
        Fri, 03 Sep 2021 04:07:28 -0700 (PDT)
X-Received: by 2002:a05:6000:92:: with SMTP id m18mr3355251wrx.293.1630667248603;
        Fri, 03 Sep 2021 04:07:28 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id f5sm4032824wmb.47.2021.09.03.04.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:07:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Roth <michael.roth@amd.com>,
	Zhang Chen <chen.zhang@intel.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Stefan Weil <sw@weilnetz.de>,
	John Snow <jsnow@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-block@nongnu.org,
	Helge Deller <deller@gmx.de>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Peter Xu <peterx@redhat.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Jason Wang <jasowang@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Yuval Shaia <yuval.shaia.ml@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-ppc@nongnu.org,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH 04/28] accel/tcg: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:38 +0200
Message-Id: <20210903110702.588291-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903110702.588291-1-philmd@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: A5uXkYOKQmOT

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2_qemu() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 accel/tcg/cputlb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index b1e5471f949..1d5069a30d1 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -826,7 +826,7 @@ void tlb_flush_range_by_mmuidx(CPUState *cpu, target_ulong addr,
         tlb_flush_range_by_mmuidx_async_0(cpu, d);
     } else {
         /* Otherwise allocate a structure, freed by the worker.  */
-        TLBFlushRangeData *p = g_memdup(&d, sizeof(d));
+        TLBFlushRangeData *p = g_memdup2_qemu(&d, sizeof(d));
         async_run_on_cpu(cpu, tlb_flush_range_by_mmuidx_async_1,
                          RUN_ON_CPU_HOST_PTR(p));
     }
@@ -868,7 +868,7 @@ void tlb_flush_range_by_mmuidx_all_cpus(CPUState *src_cpu,
     /* Allocate a separate data block for each destination cpu.  */
     CPU_FOREACH(dst_cpu) {
         if (dst_cpu != src_cpu) {
-            TLBFlushRangeData *p = g_memdup(&d, sizeof(d));
+            TLBFlushRangeData *p = g_memdup2_qemu(&d, sizeof(d));
             async_run_on_cpu(dst_cpu,
                              tlb_flush_range_by_mmuidx_async_1,
                              RUN_ON_CPU_HOST_PTR(p));
@@ -918,13 +918,13 @@ void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
     /* Allocate a separate data block for each destination cpu.  */
     CPU_FOREACH(dst_cpu) {
         if (dst_cpu != src_cpu) {
-            p = g_memdup(&d, sizeof(d));
+            p = g_memdup2_qemu(&d, sizeof(d));
             async_run_on_cpu(dst_cpu, tlb_flush_range_by_mmuidx_async_1,
                              RUN_ON_CPU_HOST_PTR(p));
         }
     }
 
-    p = g_memdup(&d, sizeof(d));
+    p = g_memdup2_qemu(&d, sizeof(d));
     async_safe_run_on_cpu(src_cpu, tlb_flush_range_by_mmuidx_async_1,
                           RUN_ON_CPU_HOST_PTR(p));
 }
-- 
2.31.1
