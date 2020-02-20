Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp543344lfg;
        Thu, 20 Feb 2020 05:06:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqxX6l/Q04M94ZDbrgXdrtuZ2JPGpQrZcO37E4szYVWR/K1fNDMptnBgLWBf1YBuThq+McrW
X-Received: by 2002:a9d:1ca3:: with SMTP id l35mr22987568ota.271.1582203982832;
        Thu, 20 Feb 2020 05:06:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582203982; cv=none;
        d=google.com; s=arc-20160816;
        b=FuRC9eTGz5y3og3uCN0u6raTh6pM9PM93CKe7hCwpzPyZ+Be6EZgQfMVaQWfnOTkcn
         vSHuKpWOvhNU34mcRgGn7QH2riuvWjyNMYLiVQHTOS6h978nrrMIwEW1alR0vSzX/8rC
         96S84OwhyQrH1MvT31uVJ+aajuxtLTMXRTwXUuaOkjQBw+8mrKd9ETN5zEva5tQhJ5Cn
         cKTVPufzYgHJlqrK8eNaCxkG+nZVwLauIMzRUVze6gfXPJYCFUtkqgrsjJy1P8j7Jru3
         RmW0ctxW4ClOMkCvmcwm5mHpqxUC73AP6+ERVkgJRlRryuT8+nGFFaRfr2njlPDLjiAi
         +bqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=f0ShsBpyUInIOkeskmM477n/0YX3Rn03mTxtkP3QCEQ=;
        b=nsOOjPlCuVVacX4uXXUZFuYITE+ZHYAfzgt+E78T5T/o1b2jXtGV2QwLX+oHVzOa7C
         pDBV4dAAM4wMLd7RR8lzZE7ogkEnScnuFT+KoZ/iWUtpQP6ji1xayIOAnOYve6pyKQd2
         PosmHxMHUssCuMsTPB1XvVIA0uSUNGKzvOw1c//+K7r5PLEfT7dnQ1ZZFhCbzCgErHZy
         U/i1k18lpWqW4dJqtObeSWb4BarBwtZuoXnMk7AzJh2kl+F6swFZXXaoHpuqF7hQWSGJ
         ACflB3m5/J8f5EpxR+MF7yNpVc8Lr22SRGZOET/7JdSupVNeRddtad6Fvc7pkFHO6UQn
         eIJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RkpHTvVx;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id b2si1957201ots.284.2020.02.20.05.06.22;
        Thu, 20 Feb 2020 05:06:22 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RkpHTvVx;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728115AbgBTNGV (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 20 Feb 2020 08:06:21 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49684 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728129AbgBTNGV (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 20 Feb 2020 08:06:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582203979;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:  content-type:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f0ShsBpyUInIOkeskmM477n/0YX3Rn03mTxtkP3QCEQ=;
        b=RkpHTvVxoA6EN+px0g/siCn4StJ5rLMmXztnagN5X5NPCuBnUYFtVND+lDln4EhnJptUkc
        xn1wsgg1Vuu9zWz5MN0AyV9y/5oE4YU3gUhR2pejBdPT9VwF9++T2FXu8/Bvrtog9vibrB
        UYJdDjRBDxVTj8nW/s3o/FbHMKoMN6I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-1dhPhWMvOZCxF72YQPgxWQ-1; Thu, 20 Feb 2020 08:06:17 -0500
X-MC-Unique: 1dhPhWMvOZCxF72YQPgxWQ-1
Received: by mail-wm1-f70.google.com with SMTP id b205so806641wmh.2
        for <kvm@vger.kernel.org>; Thu, 20 Feb 2020 05:06:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f0ShsBpyUInIOkeskmM477n/0YX3Rn03mTxtkP3QCEQ=;
        b=dhCYssWxHvoKhuxK+ODATSs06aTKFvGR7bMMjIlkeoFtXDLJ8agLMsbx/PZMWi5s5E
         1ZF8kYAv8H1m6yur9OBgO41k6GKDiZjh0rlpcU//5rdwSbL87+ZPxsQhGM9OsNkDpMZ0
         vO4a+RoikBhfN5V+/2HLClMP7yRaEFFuNDIgD7QUGyEunODS52czDNUXCRaf1yf7HNHt
         h/4N7lh4mbe7YfGpcsbKjhgtCY22donfqlFT/f01W85wW7P1FHar+2GO8Ru1nBoYLLsI
         l8f0RE1w5Gvvqx3BD9DGB881/Sh3BrduAbwHU0gTNlZ7o8VrihQg23icz5PhqIDvkOq+
         GTVg==
X-Gm-Message-State: APjAAAVxxT4/oM+y2CYJOty7O+ZF26/N9FxWxzxpVvHK6JNAx9kF+pIh
        mlQ8VebU3QuvSyIEFZsSWtO2mLt8VXarAjMZUGFPitSaGlC8a/0KQXkTlrLDifCgrzs177lRs/8
        qN1hhqLSVS/G0
X-Received: by 2002:adf:ec02:: with SMTP id x2mr9464159wrn.8.1582203976198;
        Thu, 20 Feb 2020 05:06:16 -0800 (PST)
X-Received: by 2002:adf:ec02:: with SMTP id x2mr9464128wrn.8.1582203975917;
        Thu, 20 Feb 2020 05:06:15 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net. [88.21.202.78])
        by smtp.gmail.com with ESMTPSA id b67sm4594690wmc.38.2020.02.20.05.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 05:06:15 -0800 (PST)
From:   =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To:     Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc:     "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Anthony Perard <anthony.perard@citrix.com>,
        Fam Zheng <fam@euphon.net>,
        =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
        kvm@vger.kernel.org, Laurent Vivier <lvivier@redhat.com>,
        Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
        Eric Auger <eric.auger@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        qemu-s390x@nongnu.org,
        Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
        Gerd Hoffmann <kraxel@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org,
        Alistair Francis <alistair@alistair23.me>,
        qemu-block@nongnu.org,
        =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
        Jason Wang <jasowang@redhat.com>,
        xen-devel@lists.xenproject.org,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Dmitry Fleytman <dmitry.fleytman@gmail.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Igor Mitsyanko <i.mitsyanko@gmail.com>,
        Paul Durrant <paul@xen.org>,
        Richard Henderson <rth@twiddle.net>,
        John Snow <jsnow@redhat.com>
Subject: [PATCH v3 06/20] exec: Let the address_space API use void pointer arguments
Date:   Thu, 20 Feb 2020 14:05:34 +0100
Message-Id: <20200220130548.29974-7-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200220130548.29974-1-philmd@redhat.com>
References: <20200220130548.29974-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Xr1e7OD0RwmB

As we are only dealing with a blob buffer, use a void pointer
argument. This will let us simplify other APIs.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/exec/memory.h | 12 ++++++------
 exec.c                | 11 ++++++-----
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 6f8084f45e..afee185eae 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2052,7 +2052,7 @@ void address_space_remove_listeners(AddressSpace *as);
  * @is_write: indicates the transfer direction
  */
 MemTxResult address_space_rw(AddressSpace *as, hwaddr addr,
-                             MemTxAttrs attrs, uint8_t *buf,
+                             MemTxAttrs attrs, void *buf,
                              hwaddr len, bool is_write);
 
 /**
@@ -2070,7 +2070,7 @@ MemTxResult address_space_rw(AddressSpace *as, hwaddr addr,
  */
 MemTxResult address_space_write(AddressSpace *as, hwaddr addr,
                                 MemTxAttrs attrs,
-                                const uint8_t *buf, hwaddr len);
+                                const void *buf, hwaddr len);
 
 /**
  * address_space_write_rom: write to address space, including ROM.
@@ -2096,7 +2096,7 @@ MemTxResult address_space_write(AddressSpace *as, hwaddr addr,
  */
 MemTxResult address_space_write_rom(AddressSpace *as, hwaddr addr,
                                     MemTxAttrs attrs,
-                                    const uint8_t *buf, hwaddr len);
+                                    const void *buf, hwaddr len);
 
 /* address_space_ld*: load from an address space
  * address_space_st*: store to an address space
@@ -2334,7 +2334,7 @@ void address_space_unmap(AddressSpace *as, void *buffer, hwaddr len,
 
 /* Internal functions, part of the implementation of address_space_read.  */
 MemTxResult address_space_read_full(AddressSpace *as, hwaddr addr,
-                                    MemTxAttrs attrs, uint8_t *buf, hwaddr len);
+                                    MemTxAttrs attrs, void *buf, hwaddr len);
 MemTxResult flatview_read_continue(FlatView *fv, hwaddr addr,
                                    MemTxAttrs attrs, void *buf,
                                    hwaddr len, hwaddr addr1, hwaddr l,
@@ -2374,7 +2374,7 @@ static inline bool memory_access_is_direct(MemoryRegion *mr, bool is_write)
  */
 static inline __attribute__((__always_inline__))
 MemTxResult address_space_read(AddressSpace *as, hwaddr addr,
-                               MemTxAttrs attrs, uint8_t *buf,
+                               MemTxAttrs attrs, void *buf,
                                hwaddr len)
 {
     MemTxResult result = MEMTX_OK;
@@ -2433,7 +2433,7 @@ address_space_read_cached(MemoryRegionCache *cache, hwaddr addr,
  */
 static inline void
 address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
-                           void *buf, hwaddr len)
+                           const void *buf, hwaddr len)
 {
     assert(addr < cache->len && len <= cache->len - addr);
     if (likely(cache->ptr)) {
diff --git a/exec.c b/exec.c
index 980cc0e2b2..1a80159996 100644
--- a/exec.c
+++ b/exec.c
@@ -3271,7 +3271,7 @@ static MemTxResult flatview_read(FlatView *fv, hwaddr addr,
 }
 
 MemTxResult address_space_read_full(AddressSpace *as, hwaddr addr,
-                                    MemTxAttrs attrs, uint8_t *buf, hwaddr len)
+                                    MemTxAttrs attrs, void *buf, hwaddr len)
 {
     MemTxResult result = MEMTX_OK;
     FlatView *fv;
@@ -3287,7 +3287,7 @@ MemTxResult address_space_read_full(AddressSpace *as, hwaddr addr,
 
 MemTxResult address_space_write(AddressSpace *as, hwaddr addr,
                                 MemTxAttrs attrs,
-                                const uint8_t *buf, hwaddr len)
+                                const void *buf, hwaddr len)
 {
     MemTxResult result = MEMTX_OK;
     FlatView *fv;
@@ -3302,7 +3302,7 @@ MemTxResult address_space_write(AddressSpace *as, hwaddr addr,
 }
 
 MemTxResult address_space_rw(AddressSpace *as, hwaddr addr, MemTxAttrs attrs,
-                             uint8_t *buf, hwaddr len, bool is_write)
+                             void *buf, hwaddr len, bool is_write)
 {
     if (is_write) {
         return address_space_write(as, addr, attrs, buf, len);
@@ -3326,7 +3326,7 @@ enum write_rom_type {
 static inline MemTxResult address_space_write_rom_internal(AddressSpace *as,
                                                            hwaddr addr,
                                                            MemTxAttrs attrs,
-                                                           const uint8_t *buf,
+                                                           const void *ptr,
                                                            hwaddr len,
                                                            enum write_rom_type type)
 {
@@ -3334,6 +3334,7 @@ static inline MemTxResult address_space_write_rom_internal(AddressSpace *as,
     uint8_t *ram_ptr;
     hwaddr addr1;
     MemoryRegion *mr;
+    const uint8_t *buf = ptr;
 
     RCU_READ_LOCK_GUARD();
     while (len > 0) {
@@ -3366,7 +3367,7 @@ static inline MemTxResult address_space_write_rom_internal(AddressSpace *as,
 /* used for ROM loading : can write in RAM and ROM */
 MemTxResult address_space_write_rom(AddressSpace *as, hwaddr addr,
                                     MemTxAttrs attrs,
-                                    const uint8_t *buf, hwaddr len)
+                                    const void *buf, hwaddr len)
 {
     return address_space_write_rom_internal(as, addr, attrs,
                                             buf, len, WRITE_DATA);
-- 
2.21.1
