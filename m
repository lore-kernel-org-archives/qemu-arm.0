Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1952440ejd;
        Thu, 18 Apr 2024 12:26:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCURkYcXggSEzJqgB+CdQpy/SLNnVfIapVuYTVDxSnWYVzVemL+T4MiclGOup9RtT4oScGbuDwRYBgKZwxAYZxXOj44zFDTC
X-Received: by 2002:a17:906:d157:b0:a55:604e:8a5c with SMTP id br23-20020a170906d15700b00a55604e8a5cmr52067ejb.53.1713468378203;
        Thu, 18 Apr 2024 12:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713468378; cv=none;
        d=google.com; s=arc-20160816;
        b=0L7gpqKG/PNTEpV/oU9OsIfjZXQy43s/5DaVeQ3pjOiCx4JNqlLryk8d3ZATuMbWGK
         sEYCeKYFHDuFVpeHxRitt4WxDDwm5A4tE8RrQqUvf6w8x6z+qQUiksC8jkyPXTjEaRQP
         45ro7tTbY+KvKHtlvgAn4exFKSNnli9vyCehgYHVVxorVmqksGJQXGLqu4Uw7zzfuwlu
         H68IsdxA7V9Pyyldr7UiNXQT0YlYc/mGJwqPUdFI8BjVOWO0hh/rXNIdEvKPUElRALi4
         U3aN3LLq2Bm/xo+1SelMMGNbvHzFoliJLbpsGnnSmx6rE4MzSYe0j6HFvIW0z6x9IpSJ
         FebQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zLjP+56aWYnnkz1DDDJchrnGcEe4NhmJ8So9/v4UjQ4=;
        fh=z+sqHUqzhw5urjAlqr8Wa0OYFoDiYWnyPYznOlX+4Lg=;
        b=ZmLaX+uvWjnbipYgKZRdE56lqxOP4//PLdSHhFduaTZ6x3HzodlyfCziJWq+Jf4psJ
         IQW7tasmA/GfAB5yDuvz/sbuzQh4rT2JPhJMS6hoC9bNxa6Twm8llGRaCJJpgrGbQqh3
         L4+C0Owf4pXGzlM+rMFVObPHt0d3yTGXSOkwNX0yH4z5V/5hHazQwLTxMntDRbk+9KEn
         Hw+6OYzQKfDFVtPd6OhqXKX+GfKDWh38NHURW8iQaoIRJ95dAVbp/BzEg8pfBbZZDVuJ
         4SmOo7OvvSBBU70xeANV3gxxVvFSwCPHycmS6YC7Na8VLIXtqQbfAXtn4PPuSXKhLczn
         o+rw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LU7UnQiq;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p17-20020a17090628d100b00a51a6ecbdc2sor677673ejd.10.2024.04.18.12.26.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Apr 2024 12:26:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LU7UnQiq;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713468378; x=1714073178; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLjP+56aWYnnkz1DDDJchrnGcEe4NhmJ8So9/v4UjQ4=;
        b=LU7UnQiqItCClJQ+vpLJN9yVXMHXxVeQHszhJCziIXe63KnOActvkliSIwL9BpEbMx
         sYGFmmjZ5IyXfylIFAxoYpEeZbc4kYxouCuVV+2KpYyVXs5ra1bwzOrfHv3Uc2h689aW
         0IbdKI1wgINN9ioMRH0G3MI4elOsTUCPWG/U36IA7vXctg5pV6eigDTSU04GcifxTSdC
         JfCsV74vVEOXN6XeJrYqpaRqYu0OAJYNcjwesEPWLTFyNm6kyu47ucGV/U2Meg2t+/BI
         /MXgyem+bAA50XQZgVMGxJJCx+u9+E+PbLMXSkQ0skEOBZe0Q+az7uRs8eFsCXdpwgiW
         PSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468378; x=1714073178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zLjP+56aWYnnkz1DDDJchrnGcEe4NhmJ8So9/v4UjQ4=;
        b=IEynklYoNQ8HMnNeYhHXgxD7ISLAkb8y1lzZbABuLYIR549VwuGWN/nk8KiFr2bkI/
         golx59wR4G8ufVXLi6I4MX8IsSiBRu4MgalzkQVIYJPQKtlKu9SmtwLrWoO/Bc8P8blw
         /cJ3va2MsP9XcE6TOYhZ7ofQah4WI/X33RAk4rDmoetDm8gud0rpgH0CNeOgn/xgS37O
         bn6FjKucgsme4XkBSkbQz+jVQgtQ1pCXFvVxh9Qq0Mg4ftxVCX9pBPswSVw3dTyb5Vrj
         3LVEy2AftR42npo5agbJe6b8WDKa7fAt2WVgSIri94QEbJ8unullY7T/VtLbR/2n9qfV
         H8rg==
X-Forwarded-Encrypted: i=1; AJvYcCXSMdHZIlrqDoq3vWrmc0NEiVqHGBV77CKjf2gJS7ep29lPXj4cUQRjhzKEhMpLZROTJKlLgQkM86V8rbbuZ18ski/ySoNr
X-Gm-Message-State: AOJu0YywRrpD2z7AfDSh7n3sFBXHKQ0cSkhifCn1YQaf3OIy+kZ1hDjO
	ghWQF5BLZE5nkvO0/XG24VasLt6BdN4Qr7MjlKM0wrpDSVppJU4CHFOlk2vjh5dlxg==
X-Google-Smtp-Source: AGHT+IGIyJcuxTWVzJ5A2zRDxQxrv2YI3QEWh/QF+lto57+gXutKQjVp9+gj3KNHJecg6m3omxb4CQ==
X-Received: by 2002:a17:906:19cf:b0:a52:6fca:9151 with SMTP id h15-20020a17090619cf00b00a526fca9151mr48443ejd.49.1713468377872;
        Thu, 18 Apr 2024 12:26:17 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.151.213])
        by smtp.gmail.com with ESMTPSA id f5-20020a1709067f8500b00a5559f0f9dcsm1275997ejr.79.2024.04.18.12.26.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Apr 2024 12:26:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Xu <peterx@redhat.com>
Subject: [PATCH 08/24] physmem: Move TCG CPU IOTLB methods around
Date: Thu, 18 Apr 2024 21:25:07 +0200
Message-ID: <20240418192525.97451-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ZFp+uTdVi93E

The next commit will restrict TCG specific code in physmem.c
using some #ifdef'ry. In order to keep it simple, move
iotlb_to_section() and memory_region_section_get_iotlb()
around close together.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 system/physmem.c | 50 ++++++++++++++++++++++++------------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/system/physmem.c b/system/physmem.c
index dd7b222942..cf6334f3a3 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -736,6 +736,31 @@ translate_fail:
     return &d->map.sections[PHYS_SECTION_UNASSIGNED];
 }
 
+MemoryRegionSection *iotlb_to_section(CPUState *cpu,
+                                      hwaddr index, MemTxAttrs attrs)
+{
+    int asidx = cpu_asidx_from_attrs(cpu, attrs);
+    CPUAddressSpace *cpuas = &cpu->cpu_ases[asidx];
+    AddressSpaceDispatch *d = cpuas->memory_dispatch;
+    int section_index = index & ~TARGET_PAGE_MASK;
+    MemoryRegionSection *ret;
+
+    assert(section_index < d->map.sections_nb);
+    ret = d->map.sections + section_index;
+    assert(ret->mr);
+    assert(ret->mr->ops);
+
+    return ret;
+}
+
+/* Called from RCU critical section */
+hwaddr memory_region_section_get_iotlb(CPUState *cpu,
+                                       MemoryRegionSection *section)
+{
+    AddressSpaceDispatch *d = flatview_to_dispatch(section->fv);
+    return section - d->map.sections;
+}
+
 void cpu_address_space_init(CPUState *cpu, int asidx,
                             const char *prefix, MemoryRegion *mr)
 {
@@ -957,14 +982,6 @@ bool cpu_physical_memory_snapshot_get_dirty(DirtyBitmapSnapshot *snap,
     return false;
 }
 
-/* Called from RCU critical section */
-hwaddr memory_region_section_get_iotlb(CPUState *cpu,
-                                       MemoryRegionSection *section)
-{
-    AddressSpaceDispatch *d = flatview_to_dispatch(section->fv);
-    return section - d->map.sections;
-}
-
 static int subpage_register(subpage_t *mmio, uint32_t start, uint32_t end,
                             uint16_t section);
 static subpage_t *subpage_init(FlatView *fv, hwaddr base);
@@ -2434,23 +2451,6 @@ static uint16_t dummy_section(PhysPageMap *map, FlatView *fv, MemoryRegion *mr)
     return phys_section_add(map, &section);
 }
 
-MemoryRegionSection *iotlb_to_section(CPUState *cpu,
-                                      hwaddr index, MemTxAttrs attrs)
-{
-    int asidx = cpu_asidx_from_attrs(cpu, attrs);
-    CPUAddressSpace *cpuas = &cpu->cpu_ases[asidx];
-    AddressSpaceDispatch *d = cpuas->memory_dispatch;
-    int section_index = index & ~TARGET_PAGE_MASK;
-    MemoryRegionSection *ret;
-
-    assert(section_index < d->map.sections_nb);
-    ret = d->map.sections + section_index;
-    assert(ret->mr);
-    assert(ret->mr->ops);
-
-    return ret;
-}
-
 static void io_mem_init(void)
 {
     memory_region_init_io(&io_mem_unassigned, NULL, &unassigned_mem_ops, NULL,
-- 
2.41.0
