Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp114833wrp;
        Mon, 11 Feb 2019 16:08:16 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYAOldlSn5rJ+QEwXM7E+wzDYYxsVqZtkRyvCmeclrJtyfyxutWARAXtu8/t/AjrCDLcDn4
X-Received: by 2002:a25:2d43:: with SMTP id s3mr710770ybe.67.1549930095918;
        Mon, 11 Feb 2019 16:08:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549930095; cv=none;
        d=google.com; s=arc-20160816;
        b=v/GqZ7DIpQI4g1gi85guQT9GJCdPH5Osfyi8KcHb1Qq0qBaGVwo1AdjRkQ/yQYwyOc
         pwicAFUqrO578NlwTnvas6RdbPHprJP70jBICk/x87WXlW8ppueo1E7kpB2RCLPOBbeM
         ubM0uCRkf6fI5YCDGjuAH+nQy70UidpXPhHoq1XKrhiJhZxMjNz4y5x2ApJxWj3eB3Xe
         8iB3FZA7EZWz26r1jMPalN9MFYGt0COpoA2MLUmDpkGfnnQPPYgio7jEoxvwO+ekklir
         VJy6VQU1pebRmqD+te+tvIbP08bJNT3T+957bE9yHYZNQ/3VuuUrbf7Bd65QJAekBdnV
         ZnDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Ju0kTjI209UCLXJK9JoNZjkA22NnBtRT7DAuiRVZe0I=;
        b=D925yaQ/Q8sXkMy5zeMYMoG1hJ2eB6OuZYGf87JqIkrxKXZzlGrCYbdsmFePUAAICS
         VSVhTIMe5WEXHbXrB3324AgLoM6TWfXVE20EkYAC9Da/UbGAZmoQyu2FHYuZwKsmrfID
         wZrTSMQdzLNd216FXXM1WGl2xr/G3BsY6TCCV6GQTzqJ1lP9/rzcSg9t9HWBX/5L42Zl
         /B3ayDPaU8xyEcNJAjvFBjfBcCuJbjMQdleZx35EXzzy5M7F9mFJAW2mrA4VcZ/Dmy0H
         dlZVa5XMYqzTwqR0z0ffS7kq6f3o8QgzzKj4faLhNsz3Axvi84Tg98397WYY+coztPNR
         fF1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eM3Ut9Q8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x8si6654284ybj.75.2019.02.11.16.08.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 16:08:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eM3Ut9Q8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58370 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtLcV-0008S9-8V
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 19:08:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOg-0005qm-NM
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:54:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOe-0004yp-Ke
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:58 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:42473)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtLOe-0004iP-4x
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:56 -0500
Received: by mail-pf1-x441.google.com with SMTP id n74so325251pfi.9
	for <qemu-arm@nongnu.org>; Mon, 11 Feb 2019 15:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ju0kTjI209UCLXJK9JoNZjkA22NnBtRT7DAuiRVZe0I=;
	b=eM3Ut9Q8OhHf/eHwpTKfKXuR4n3UxEo0v3fKALx4rnCNGvNsCyChNUJk9M4shOWu2y
	v8o+idtV1ZR7V0xmQa/7/U6/7IAoSNTzxfrrnOgRERvg3OZ5sN+1Ttoo7UrSQUdZ+80N
	jym1TYVkP+2z9RayUAKeiVf41Iwn7bGi1Nel8eC+SCkJTaTPg53+lMWzY3HqeUg8zDdY
	977BRlcLpE0W243Sz2j8SHb+pAywtQPJu3/c+ogWhslMLup8RPlPwFOqE/mUXBgqGfb8
	DSOtO7DlTBlYWIv+vXkZ6EYkCsZtE2wDjYNU+bWqaj/SWp8rGuTqkxaPK4hbtScQnGvp
	K/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ju0kTjI209UCLXJK9JoNZjkA22NnBtRT7DAuiRVZe0I=;
	b=Uch0QDOB+Y21u7uUlHVCj+MtZxYZ3qqS9HnAuK0ILdRssGJSRLqxrz7205emVgnPS4
	oWxi3PyCPEO064l5ZA2XXOeuAVuRo5scanUXeOZMzoBaxaCdcWJ7cwI+7y9MScbaV9xV
	C1sA8se1puLCSGc/zxLwkfvhYd0hVjo4j8O0i1Y5Qi1uQKGHDLMoGD3s0AYyobk1b5FC
	Gp4uMV8plDHnqDYify2mHU4jNrHGwfloBYIUd8A0+UznNB+zoWtixziVUCfdJ3XbhFNP
	Xt/MPTcvxjvMw+BX5jpAC13CLe56/1V94AqHOm26QtDaYWsCrdQYM4GdfQGNfxD/Lyau
	Wzcg==
X-Gm-Message-State: AHQUAub0HKZPQCBnqHmvfVkTO7bl+SkigpkaY+H94Kg/IUHUtXhroE7Q
	H1fWstuvi3nXAN7+7SHP3PkZMg==
X-Received: by 2002:aa7:8802:: with SMTP id c2mr938329pfo.20.1549929215416;
	Mon, 11 Feb 2019 15:53:35 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	c4sm11861031pgq.85.2019.02.11.15.53.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 15:53:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 15:52:56 -0800
Message-Id: <20190211235258.542-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211235258.542-1-richard.henderson@linaro.org>
References: <20190211235258.542-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-arm] [PATCH v3 26/28] target/arm: Add allocation tag storage
 for system mode
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: grM4M3KNitFh

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 96 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 87 insertions(+), 9 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 09c387e2c7..53c3ed862e 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -28,18 +28,18 @@
 static uint8_t *allocation_tag_mem(CPUARMState *env, uint64_t ptr,
                                    bool write, uintptr_t ra)
 {
-#ifdef CONFIG_USER_ONLY
     ARMCPU *cpu = arm_env_get_cpu(env);
+    CPUState *cs = CPU(cpu);
     uint8_t *tags;
     uintptr_t index;
-    int flags;
 
-    flags = page_get_flags(ptr);
+#ifdef CONFIG_USER_ONLY
+    int flags = page_get_flags(ptr);
 
     if (!(flags & PAGE_VALID) || !(flags & (write ? PAGE_WRITE : PAGE_READ))) {
         /* SIGSEGV */
         env->exception.vaddress = ptr;
-        cpu_restore_state(CPU(cpu), ra, true);
+        cpu_restore_state(cs, ra, true);
         raise_exception(env, EXCP_DATA_ABORT, 0, 1);
     }
 
@@ -56,16 +56,94 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, uint64_t ptr,
     if (tags == NULL) {
         size_t alloc_size = TARGET_PAGE_SIZE >> (LOG2_TAG_GRANULE + 1);
         tags = page_alloc_target_data(ptr, alloc_size);
-        assert(tags != NULL);
+    }
+#else
+    int mmu_idx;
+    AddressSpace *as;
+    CPUTLBEntry *te;
+    CPUIOTLBEntry *iotlbentry;
+    MemoryRegionSection *section;
+    MemoryRegion *mr;
+    FlatView *fv;
+    hwaddr physaddr, tag_physaddr, tag_len, xlat;
+
+    /*
+     * Find the TLB entry for this access.
+     * As a side effect, this also raises an exception for invalid access.
+     */
+    mmu_idx = cpu_mmu_index(env, false);
+    index = tlb_index(env, mmu_idx, ptr);
+    te = tlb_entry(env, mmu_idx, ptr);
+    if (!tlb_hit(write ? tlb_addr_write(te) : te->addr_read, ptr)) {
+        /* ??? Expose VICTIM_TLB_HIT from accel/tcg/cputlb.c.  */
+        tlb_fill(cs, ptr, 16, write ? MMU_DATA_STORE : MMU_DATA_LOAD,
+                 mmu_idx, ra);
+        index = tlb_index(env, mmu_idx, ptr);
+        te = tlb_entry(env, mmu_idx, ptr);
     }
 
+    /* If the virtual page MemAttr != Tagged, nothing to do.  */
+    iotlbentry = &env->iotlb[mmu_idx][index];
+    if (!iotlbentry->attrs.target_tlb_bit1) {
+        return NULL;
+    }
+
+    /* If the board did not allocate tag memory, nothing to do.  */
+    as = cpu_get_address_space(cs, ARMASIdx_TAG);
+    if (!as) {
+        return NULL;
+    }
+
+    /* Find the physical address for the virtual access.  */
+    section = iotlb_to_section(cs, iotlbentry->addr, iotlbentry->attrs);
+    physaddr = ((iotlbentry->addr & TARGET_PAGE_MASK) + ptr
+                + section->offset_within_address_space
+                - section->offset_within_region);
+
+    /* Convert to the physical address in tag space.  */
+    tag_physaddr = physaddr >> (LOG2_TAG_GRANULE + 1);
+    tag_len = TARGET_PAGE_SIZE >> (LOG2_TAG_GRANULE + 1);
+
+    /*
+     * Find the tag physical address within the tag address space.
+     *
+     * ??? Create a new mmu_idx to cache the rest of this.
+     *
+     * ??? If we were assured of exactly one block of normal ram,
+     * and thus exactly one block of tag ram, then we could validate
+     * section->mr as ram, use the section offset vs cpu->tag_memory,
+     * and finish with memory_region_get_ram_ptr.
+     */
+    rcu_read_lock();
+    fv = address_space_to_flatview(as);
+    mr = flatview_translate(fv, tag_physaddr, &xlat, &tag_len,
+                            write, MEMTXATTRS_UNSPECIFIED);
+    if (!memory_access_is_direct(mr, write)) {
+        /*
+         * This would seem to imply that the guest has marked a
+         * virtual page as Tagged when the physical page is not RAM.
+         * Should this raise some sort of bus error?
+         */
+        rcu_read_unlock();
+        qemu_log_mask(LOG_GUEST_ERROR, "Tagged virtual page 0x%" PRIx64
+                      " maps to physical page 0x%" PRIx64 " without RAM\n",
+                      ptr, physaddr);
+        return NULL;
+    }
+    rcu_read_unlock();
+
+    /* The board should have created tag ram sized correctly.  */
+    assert(tag_len == TARGET_PAGE_SIZE >> (LOG2_TAG_GRANULE + 1));
+
+    /* FIXME: Mark the tag page dirty for migration.  */
+
+    tags = qemu_map_ram_ptr(mr->ram_block, xlat);
+#endif
+
+    assert(tags != NULL);
     index = extract32(ptr, LOG2_TAG_GRANULE + 1,
                       TARGET_PAGE_BITS - LOG2_TAG_GRANULE - 1);
     return tags + index;
-#else
-    /* Tag storage not implemented.  */
-    return NULL;
-#endif
 }
 
 static int get_allocation_tag(CPUARMState *env, uint64_t ptr, uintptr_t ra)
-- 
2.17.2

