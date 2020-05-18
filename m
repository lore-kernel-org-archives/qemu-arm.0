Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3157569lfb;
        Mon, 18 May 2020 08:53:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8LTH4qi4pvNnYuDUpg76iFU3YumLNggH0F3J0Y8wcWtJnsw/pd5jCVNW17n1fh+zF4u+d
X-Received: by 2002:a17:906:9419:: with SMTP id q25mr14795712ejx.111.1589817195532;
        Mon, 18 May 2020 08:53:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589817195; cv=none;
        d=google.com; s=arc-20160816;
        b=F8khG2gcl4EpSKiHZEaeghmlr08pA1bHrc87tcpeQQ7PsrRzns3PeTw2P/pPZc71R3
         rUY6m1Dn72tduWywGiAiSmWvrNLu4dIOj7J8c7lvT9C5mRVh7BEwYrvMOHrZEUpBFN6u
         3Cbo04RCLKuOzLaW0FCvw8F2VrU9Su+d8/uATJgR/Vje5InXtXyi3g06e/sOc2/ulEQI
         xR+ySV8/LaSeieIt6hEnyrbePc/1Q14yejwogs+/uQ9lSVNxK6zigREt2eWOLdYMdAcL
         sTFe7//s9rK5qn96qyPcKMoHUV7RZQYvcuwIGlIXe4/hcB1vTE6A0PZ7stTdQ3Cy6+uD
         evRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=WSFyr6f19aP4N4MMJJARifgNu7cVe5tnytMgFa4vhLY=;
        b=ItZaRUM8VjUOik/PQ1qwvuZcHsoM8oUYFZgKjRr90VlsK1/T13/wn0ObFFmd+RkRBY
         Neb1TVXH+vZPpP5mSWEoJ+sO1YeUyhDnubZAmqUlBNx83RquW+jXMXksZMebBoOrVb8q
         G5NKhqNHxTZoEUGgYgrBR7A/F62Nz0LVEHvbHAhH8t7UZhL+ZwdGYQ9Ov4vqfgEeEy1M
         Edm6xEmvaPP85EZNqCaj0G58dpqNpdMz8GZrbLJsRiy7ai3Ub5/E5NAoa/YyArPoOOlk
         1bRPOTwl1Sb6oGLKJU+aSEA3KecLkA7X3cKALnx4lz7MbZm6RBk7uIYQNYg+C5zIdsXe
         Nauw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kCSqrZiB;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id a10si6236233edm.203.2020.05.18.08.53.15;
        Mon, 18 May 2020 08:53:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kCSqrZiB;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728397AbgERPxN (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Mon, 18 May 2020 11:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728267AbgERPxM (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 18 May 2020 11:53:12 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5103CC061A0C
        for <kvm@vger.kernel.org>; Mon, 18 May 2020 08:53:12 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id n5so50210wmd.0
        for <kvm@vger.kernel.org>; Mon, 18 May 2020 08:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WSFyr6f19aP4N4MMJJARifgNu7cVe5tnytMgFa4vhLY=;
        b=kCSqrZiBJYfTvK6U7vz3nNDXw8i72uTGkX8UjayRNSx1b87A6HZyN0RCp9RgEzIN0G
         qWNlCkhAfu32BYTwCLRdc01DpTLebfKGRZENxPGloToarBft+JLovARNHt3Zm5JpiOFb
         VAmXclSfNHTPsASzzd+5Vo/Ib/iqvhUsdfDPO8VIutjrO5t7FrU6hlXCXcT5h2jVueTR
         s/m9n5HsKERdFsQ7+K4XiY/S9K6T8aned4oF9+6DsGouHBcACygZhGM0HhzemufQ8c0m
         1SMjBI0ljkR3A+dajrtCahHCwr35VD8FFfX24g9to1COczOsGSx8MST9/AnK7B7azqah
         +gGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=WSFyr6f19aP4N4MMJJARifgNu7cVe5tnytMgFa4vhLY=;
        b=tYk4lgG4Qr1Xb35Ejkee4gxt9udn9IokIXVVtPZbQN1BNRIOeTGzEUQCqEWbGRYk4W
         j15LknqAciHIphqbGjXkcgWLbNwajxnbuQB7jMkcd193hgq21DEqMCwU0n/3hx5TDAAF
         SvGyLpcCNMwBx/LH6wTZ50gK0WEu3BpScKbym1wkTWXqw8IskHkj5sIvzUYKO5Cce+7Q
         MWOqGyfL9VA2eFh98ldsARTH5ngFjNs4l+zpI/xLqX2tLSBZbGv8DhzvBtYJWOFct1mH
         zrueKXPWz0f+QsWmp1SbYM3BY64Fi7UvJel7m9QbuRXZj9UKG1qHhCQDINhBqM90qHrV
         DVkQ==
X-Gm-Message-State: AOAM532RmqivNAQgAAtMIEPag/0fHnsu1pTrUXmheHE3Hta0XKHBcl7o
        y8r/BqwaMwQaWfn0Nmz5h7U=
X-Received: by 2002:a7b:cf15:: with SMTP id l21mr32568wmg.172.1589817191110;
        Mon, 18 May 2020 08:53:11 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id 7sm17647462wra.50.2020.05.18.08.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 08:53:10 -0700 (PDT)
From:   =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To:     qemu-devel@nongnu.org
Cc:     Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
        qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 1/7] exec: Let address_space_read/write_cached() propagate MemTxResult
Date:   Mon, 18 May 2020 17:53:02 +0200
Message-Id: <20200518155308.15851-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200518155308.15851-1-f4bug@amsat.org>
References: <20200518155308.15851-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 8k6Lnm2eEkiB

Both address_space_read_cached_slow() and
address_space_write_cached_slow() return a MemTxResult type.
Do not discard it, return it to the caller.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/memory.h | 19 +++++++++++--------
 exec.c                | 16 ++++++++--------
 2 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index e000bd2f97..5e8c009169 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2343,10 +2343,11 @@ void *qemu_map_ram_ptr(RAMBlock *ram_block, ram_addr_t addr);
 
 /* Internal functions, part of the implementation of address_space_read_cached
  * and address_space_write_cached.  */
-void address_space_read_cached_slow(MemoryRegionCache *cache,
-                                    hwaddr addr, void *buf, hwaddr len);
-void address_space_write_cached_slow(MemoryRegionCache *cache,
-                                     hwaddr addr, const void *buf, hwaddr len);
+MemTxResult address_space_read_cached_slow(MemoryRegionCache *cache,
+                                           hwaddr addr, void *buf, hwaddr len);
+MemTxResult address_space_write_cached_slow(MemoryRegionCache *cache,
+                                            hwaddr addr, const void *buf,
+                                            hwaddr len);
 
 static inline bool memory_access_is_direct(MemoryRegion *mr, bool is_write)
 {
@@ -2411,15 +2412,16 @@ MemTxResult address_space_read(AddressSpace *as, hwaddr addr,
  * @buf: buffer with the data transferred
  * @len: length of the data transferred
  */
-static inline void
+static inline MemTxResult
 address_space_read_cached(MemoryRegionCache *cache, hwaddr addr,
                           void *buf, hwaddr len)
 {
     assert(addr < cache->len && len <= cache->len - addr);
     if (likely(cache->ptr)) {
         memcpy(buf, cache->ptr + addr, len);
+        return MEMTX_OK;
     } else {
-        address_space_read_cached_slow(cache, addr, buf, len);
+        return address_space_read_cached_slow(cache, addr, buf, len);
     }
 }
 
@@ -2431,15 +2433,16 @@ address_space_read_cached(MemoryRegionCache *cache, hwaddr addr,
  * @buf: buffer with the data transferred
  * @len: length of the data transferred
  */
-static inline void
+static inline MemTxResult
 address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
                            const void *buf, hwaddr len)
 {
     assert(addr < cache->len && len <= cache->len - addr);
     if (likely(cache->ptr)) {
         memcpy(cache->ptr + addr, buf, len);
+        return MEMTX_OK;
     } else {
-        address_space_write_cached_slow(cache, addr, buf, len);
+        return address_space_write_cached_slow(cache, addr, buf, len);
     }
 }
 
diff --git a/exec.c b/exec.c
index 5162f0d12f..877b51cc5c 100644
--- a/exec.c
+++ b/exec.c
@@ -3716,7 +3716,7 @@ static inline MemoryRegion *address_space_translate_cached(
 /* Called from RCU critical section. address_space_read_cached uses this
  * out of line function when the target is an MMIO or IOMMU region.
  */
-void
+MemTxResult
 address_space_read_cached_slow(MemoryRegionCache *cache, hwaddr addr,
                                    void *buf, hwaddr len)
 {
@@ -3726,15 +3726,15 @@ address_space_read_cached_slow(MemoryRegionCache *cache, hwaddr addr,
     l = len;
     mr = address_space_translate_cached(cache, addr, &addr1, &l, false,
                                         MEMTXATTRS_UNSPECIFIED);
-    flatview_read_continue(cache->fv,
-                           addr, MEMTXATTRS_UNSPECIFIED, buf, len,
-                           addr1, l, mr);
+    return flatview_read_continue(cache->fv,
+                                  addr, MEMTXATTRS_UNSPECIFIED, buf, len,
+                                  addr1, l, mr);
 }
 
 /* Called from RCU critical section. address_space_write_cached uses this
  * out of line function when the target is an MMIO or IOMMU region.
  */
-void
+MemTxResult
 address_space_write_cached_slow(MemoryRegionCache *cache, hwaddr addr,
                                     const void *buf, hwaddr len)
 {
@@ -3744,9 +3744,9 @@ address_space_write_cached_slow(MemoryRegionCache *cache, hwaddr addr,
     l = len;
     mr = address_space_translate_cached(cache, addr, &addr1, &l, true,
                                         MEMTXATTRS_UNSPECIFIED);
-    flatview_write_continue(cache->fv,
-                            addr, MEMTXATTRS_UNSPECIFIED, buf, len,
-                            addr1, l, mr);
+    return flatview_write_continue(cache->fv,
+                                   addr, MEMTXATTRS_UNSPECIFIED, buf, len,
+                                   addr1, l, mr);
 }
 
 #define ARG1_DECL                MemoryRegionCache *cache
-- 
2.21.3
