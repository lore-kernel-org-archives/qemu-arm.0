Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1946831wrq;
        Sun, 10 Feb 2019 17:16:42 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaFjYlAFL47Aer2gYgEiC1oJtlAG79eLdA+sPLAfhUzAq2uKhkA9ALspsIuwYSmKt9jwOUi
X-Received: by 2002:a5d:468f:: with SMTP id u15mr17380982wrq.188.1549847802855;
        Sun, 10 Feb 2019 17:16:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549847802; cv=none;
        d=google.com; s=arc-20160816;
        b=gPGH9w5fB9RbJ/BcZN78Lgk8YIDeYWAoWUwm3UKVyyq+vBH2Kt1wxxX0j5GjmixYNn
         anH01suCRoh+n2m+xKuDvU/3HfNse0wdckltnmUx8rpoE0ookmrf5vuPBIYV8PIkTogt
         Y8qkMOnnthFQqtzG/ShlRqK2yGp942jm8LwyD5hpRylfVlJDv9X/mO1UKpLlT5dS4noS
         qwc9t1DAqL/Az5/+p/7pyuzDJ9jTWUM8m0Kls6QyasPuiCcSMkN5msPOBPY5ZLX9+F4B
         3NC9dsBNyePucriezsj+NpQbrVCa1QQ5sulv4yyCu96MdU8DeDFIyfMCeKkuh5pPC8VP
         HzjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=MvaIKsOMPQ7hbRMjemvvtwhP7sBFQA2Gv3Y/7+kAWX0=;
        b=cspNed7r1+vH8NLu7q2bPswU0dKvBqMSFxtrLFGp/xELP+2xs6DfFmAIS/2HcRKQsb
         gUAAXpaW9xu+GpNor4R75K8WXBmXHJQLgf2Q9t5Ejt/NhYRmZmgST3ZMzaFiLEFBTJis
         iEGONGbEvu4b/jAD3uNkELF4srkC9PtVZ2h1OnVkwJEWQMr5+C1FhnOF+aZSG7qQAENs
         2f7n+HAXwSS+R9DVTlfNO0eJrDXFi4nkOtugInprVsoGhCIjNXaD4ZBLL7PajGzIN7BA
         VD2aD5N7tLFFIJRJK9H2Y05fbGxAKWqWMEKV5oahXY4/smq1XzV1I0D6UZAUVH7DY0KK
         LTVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OeNmJRWY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f18si6415735wme.168.2019.02.10.17.16.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Feb 2019 17:16:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OeNmJRWY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42183 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gt0DB-000326-OO
	for alex.bennee@linaro.org; Sun, 10 Feb 2019 20:16:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37689)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05w-0005yH-Oo
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:09:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05s-00008Z-EZ
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:09:12 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:38628)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gt05s-0008T0-1d
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:09:08 -0500
Received: by mail-pl1-x644.google.com with SMTP id e5so4510889plb.5
	for <qemu-devel@nongnu.org>; Sun, 10 Feb 2019 17:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MvaIKsOMPQ7hbRMjemvvtwhP7sBFQA2Gv3Y/7+kAWX0=;
	b=OeNmJRWYjbAAGxeF8eAGRyomWMZYqMo+HpCnjZC8mVnI1fk6ZT++0jvc1JfCTJtr7M
	132XkFBNjBWB8ebtPsHJGt7ZZlua+eH7poE9WcjF16J+I027dpq3TnOYd1m5J02oz7KR
	zxaKtDgpCdxK9auAw3o6eKA2F/OwKi3n/+0loEh90XOyITjSQ6Z3Qel/8tvNMuCLo1EK
	2Ne1JHa2YenYpceDkhH1ynZ4O+MdGLQ6gKbTfI80ym4ZKe+G85YQqqH6jN1gxZd3FH1c
	KUew5QOI+/nYCPOj4Iyj90udM56Cfs5f3oh3lCkuA6AtwXexzeRq1FDBiVYu2B/OC5Xp
	lcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MvaIKsOMPQ7hbRMjemvvtwhP7sBFQA2Gv3Y/7+kAWX0=;
	b=Sr3Sw5TMdyidxyydsFujINVAJ8NyjzdSb2YcLPrDN7lLr5NKDgk8l2KFzNrUpj7/jY
	LyED8JImwVaXqbnBKnKC64rH4Vfxod/jdFc6JbdUFcpsJXRE82toOzjnnzXJTee3Y6tV
	ifSqcmJ7w10C9K4vTiQysAvTRh//5T+Fu+/itBMbJ8mY4vuOXFkygML3wDB/sNenC+fu
	dEv1tjRG0Wq/8/aa8P7DMG5TsYFyCOpkSwFUfAl4TbghVmVPBA0guk4JW0MNB4+5OKHz
	e7hua+jnD7hZLE0EVgMXnJXunl1jlM3xx3z5DgeyeExVHOScP2w8pFN8/QC4d/OzGTfb
	7GDA==
X-Gm-Message-State: AHQUAuaeZpWKTc0GdRyr085s2+RaENp3tA5ea8mhzwv7aOqXZ0G2QHWx
	V8PqpTeOzuC927XfyEJQei1svBuiVok=
X-Received: by 2002:a17:902:7608:: with SMTP id
	k8mr29078056pll.245.1549847342745; 
	Sun, 10 Feb 2019 17:09:02 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	g14sm17177630pfg.27.2019.02.10.17.09.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Feb 2019 17:09:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 10 Feb 2019 17:08:27 -0800
Message-Id: <20190211010829.29869-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211010829.29869-1-richard.henderson@linaro.org>
References: <20190211010829.29869-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-devel] [PATCH v2 24/26] target/arm: Add allocation tag
 storage for system mode
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NwB/WHkn/lEh

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 96 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 87 insertions(+), 9 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index ad2902472d..3abed62018 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -53,19 +53,19 @@ static uint64_t strip_tbi(CPUARMState *env, uint64_t ptr)
 static uint8_t *allocation_tag_mem(CPUARMState *env, uint64_t ptr,
                                    bool write, uintptr_t ra)
 {
-#ifdef CONFIG_USER_ONLY
     ARMCPU *cpu = arm_env_get_cpu(env);
+    CPUState *cs = CPU(cpu);
     uint64_t clean_ptr = strip_tbi(env, ptr);
     uint8_t *tags;
     uintptr_t index;
-    int flags;
 
-    flags = page_get_flags(clean_ptr);
+#ifdef CONFIG_USER_ONLY
+    int flags = page_get_flags(clean_ptr);
 
     if (!(flags & PAGE_VALID) || !(flags & (write ? PAGE_WRITE : PAGE_READ))) {
         /* SIGSEGV */
         env->exception.vaddress = ptr;
-        cpu_restore_state(CPU(cpu), ra, true);
+        cpu_restore_state(cs, ra, true);
         raise_exception(env, EXCP_DATA_ABORT, 0, 1);
     }
 
@@ -82,16 +82,94 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, uint64_t ptr,
     if (tags == NULL) {
         size_t alloc_size = TARGET_PAGE_SIZE >> (LOG2_TAG_GRANULE + 1);
         tags = page_alloc_target_data(clean_ptr, alloc_size);
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
+    index = tlb_index(env, mmu_idx, clean_ptr);
+    te = tlb_entry(env, mmu_idx, clean_ptr);
+    if (!tlb_hit(write ? tlb_addr_write(te) : te->addr_read, clean_ptr)) {
+        /* ??? Expose VICTIM_TLB_HIT from accel/tcg/cputlb.c.  */
+        tlb_fill(cs, ptr, 16, write ? MMU_DATA_STORE : MMU_DATA_LOAD,
+                 mmu_idx, ra);
+        index = tlb_index(env, mmu_idx, clean_ptr);
+        te = tlb_entry(env, mmu_idx, clean_ptr);
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
+    physaddr = ((iotlbentry->addr & TARGET_PAGE_MASK) + clean_ptr
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
+                      clean_ptr, physaddr);
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
     index = extract32(clean_ptr, LOG2_TAG_GRANULE + 1,
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

