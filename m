Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp1085623ejb;
        Thu, 7 Mar 2024 03:48:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV1fFb4lfvoX/EQtOGuvK6H9SSjOu36iV27duZXWLmMQI+xiXeC5rzT/MvdvOxcQ2EZZWd5AwamK14qCfXDm7AdW/dXVCJB
X-Received: by 2002:a05:600c:4ed2:b0:412:b674:28ff with SMTP id g18-20020a05600c4ed200b00412b67428ffmr13436767wmq.22.1709812139123;
        Thu, 07 Mar 2024 03:48:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709812139; cv=none;
        d=google.com; s=arc-20160816;
        b=HIan4G5lkCAa+R6vC55XAIy+hadz7kTfMRr36Y+vqpHtUaFm+OTNDjbjWk0flJmQYV
         2DQsFWmDO1RbOXpnCEtb7hduoG+wHS/1jecba3eB2WzrMy/qhX0l0Gbgug1PSUaYwC7t
         K3CnCaFl4s7mjiXtn6AoIshb8XpjE3cizin83+YM00Ofph3F2q5Psbo8TDWVS8h0WML4
         veSXWDmdIGizdtxRTuovgv4Lta00vqHFCpu8CXlSOxRt2+tkyyMUPCRIk8bWoRS2Fihd
         ZKz7OAl2es3EBXodocx8LGGccnsRNHINzyWfRM/Jm7iMtrg6GMpKv+0/wCcKsia8D8jg
         PHvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:dkim-signature;
        bh=G/SbbEMUCs/VycRuaZQyQX/2EumGC/JTHxyB6vdSb1o=;
        fh=+NRV2Y+6ysFCHBLMS2LqfG63NUbFi0hXb6uFxczgop8=;
        b=hkfn9aol7RmQ8nZmPc4sqW88r/hJAkr6gQ93dW4yOd04RxD61/omAAJ5x9pjQ1UjZE
         1p5XwyOquMaUI1NkTTnDlm3z0ylHHRM129iFXPltkQXg84IWcVzGVypTD2ojl2VmtWGD
         6RhRAfRcXqtulf/uUKxhgdN/Gsw8qUwDrckDrHJKLwzEcWaJs4Yh//aFc+oXjtG5EqU/
         6+cnRXZWRJPs2apYqEpazGZ6MxUNbCdv/1IOipimhDXXe4/Q30OrpO6Tr5FzMwW2LL5J
         y44H29BMm2yFy+STww2PxN8SHah9lrO5FmmfHUYEt7QrtcrziAX5CrzAiIbb4a8RWgJf
         L/rQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OUBFHlO+;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e24-20020a05600c4b9800b00412d844df51sor3387231wmp.6.2024.03.07.03.48.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 07 Mar 2024 03:48:59 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OUBFHlO+;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709812139; x=1710416939; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G/SbbEMUCs/VycRuaZQyQX/2EumGC/JTHxyB6vdSb1o=;
        b=OUBFHlO+wfAS9Z9yzO8UgS4+WouOmPuuxYxOUpkciihp40HZG5rmzQf422kDpKCHub
         UzQ8r/ZKmbAzWAxaVFZCOt62nRBUmaMA03Bqhq4XUVWGX4bvLlVsDaolqvrPTxus5Kly
         Pv72hL/5l1BOHxl+g7HANbyhSEAVuMelhs2BPELTPeX6EJmQghH7fW4cycpk/6UZOfHA
         jVsSFAj59eP4w3KqmkLMyyhcsgeW79/C4O6RJl6+xcnwz749yVYH2VNd/xUkrJCJeBZh
         XyUNwSOJNdpxleYiv0UfGsqPt1ySZg2EK0rhcEUYMd9jujvdTiF95v5OFeXP2V/nCvH+
         Slgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709812139; x=1710416939;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G/SbbEMUCs/VycRuaZQyQX/2EumGC/JTHxyB6vdSb1o=;
        b=aYqA20SbDmNhHTLlQadb5xMTpVADo6WT98nLwNjWIyYFF+u2ofQ4HwnX7Gncktr8tG
         YF+HIlvRQcJUvFEkqIPRP5VGGwP5fAtdFUqGnebubu9CFGP5wvYprdWs4IV7OEmv9oY1
         nY7aYJEyCatzHRHbMNk0IXQ/C2d7p6TF1/Cu5MYYsfYM5eR6UwZMWPcG5ijAJcZ07m0f
         fo5YPjT1aPQUp3cEFR3RAoXWiXM43EQYxNA1AR18oykupfPwdWIptgEDHR5buk0VmDKE
         H44SX/pyE5Ycy53AhY/WZjdgGxJiyjw/weo9PtMusJ5IDXddTzSWT+dxQbCar/uizwk4
         qDRw==
X-Forwarded-Encrypted: i=1; AJvYcCVoorSezSBo+b7plOAJweaXHpriuJzxuvx9LQBB15tk0d9EqS3mZvyX3vQ48B0Px/yvPrMLQeScA/eBUCG0+dY41+ak80YA
X-Gm-Message-State: AOJu0Yw3g1yOk8RueJSCHXfC1YTDAorIOrB6hlVFjLDadBgsuILBLZw1
	muNJor4jbjryaAaiX0GjN1zYf5uDlJCFy+UmoTtjHcHQIaVMCxZaFan+ysuVNAFstQ==
X-Google-Smtp-Source: AGHT+IGkmoMw3a1DPayc7QnWHr4dDS3sIBh8SO1Tg4XHtfrHtXIYWWCQjxeTzAsb6sqGUSlj3ULtUw==
X-Received: by 2002:a05:600c:3c86:b0:412:8d98:78a with SMTP id bg6-20020a05600c3c8600b004128d98078amr14629463wmb.13.1709812138686;
        Thu, 07 Mar 2024 03:48:58 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from meli.delivery (adsl-101.109.242.224.tellas.gr. [109.242.224.101])
        by smtp.gmail.com with ESMTPSA id fa18-20020a05600c519200b004130c1dc29csm2432000wmb.22.2024.03.07.03.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 03:48:58 -0800 (PST)
Date: Thu, 07 Mar 2024 13:46:27 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-arm@nongnu.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, David Woodhouse <dwmw@amazon.co.uk>, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Alex Benn=?UTF-8?B?w6k=?= e <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>
Bcc: 
Subject: Re: [PATCH-for-9.0 2/9] hw/xen/hvm: Propagate page_mask to a pair of functions
User-Agent: meli 0.8.5-rc.3
References: <20231114163123.74888-1-philmd@linaro.org> <20231114163123.74888-3-philmd@linaro.org>
In-Reply-To: <20231114163123.74888-3-philmd@linaro.org>
Message-ID: <9z7hk.qddjfbvts5k7@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-TUID: oaxBLa9wJeKn

On Tue, 14 Nov 2023 18:31, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>We are going to replace TARGET_PAGE_MASK by a
>runtime variable. In order to reduce code duplication,
>propagate TARGET_PAGE_MASK to get_physmapping() and
>xen_phys_offset_to_gaddr().
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---
> hw/i386/xen/xen-hvm.c | 18 ++++++++++--------
> 1 file changed, 10 insertions(+), 8 deletions(-)
>
>diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
>index 8aa6a1ec3b..3b10425986 100644
>--- a/hw/i386/xen/xen-hvm.c
>+++ b/hw/i386/xen/xen-hvm.c
>@@ -174,11 +174,12 @@ static void xen_ram_init(PCMachineState *pcms,
>     }
> }
> 
>-static XenPhysmap *get_physmapping(hwaddr start_addr, ram_addr_t size)
>+static XenPhysmap *get_physmapping(hwaddr start_addr, ram_addr_t size,
>+                                   int page_mask)
> {
>     XenPhysmap *physmap = NULL;
> 
>-    start_addr &= TARGET_PAGE_MASK;
>+    start_addr &= page_mask;
> 
>     QLIST_FOREACH(physmap, &xen_physmap, list) {
>         if (range_covers_byte(physmap->start_addr, physmap->size, start_addr)) {
>@@ -188,9 +189,10 @@ static XenPhysmap *get_physmapping(hwaddr start_addr, ram_addr_t size)
>     return NULL;
> }
> 
>-static hwaddr xen_phys_offset_to_gaddr(hwaddr phys_offset, ram_addr_t size)
>+static hwaddr xen_phys_offset_to_gaddr(hwaddr phys_offset, ram_addr_t size,
>+                                       int page_mask)
> {
>-    hwaddr addr = phys_offset & TARGET_PAGE_MASK;
>+    hwaddr addr = phys_offset & page_mask;
>     XenPhysmap *physmap = NULL;
> 
>     QLIST_FOREACH(physmap, &xen_physmap, list) {
>@@ -252,7 +254,7 @@ static int xen_add_to_physmap(XenIOState *state,
>     hwaddr phys_offset = memory_region_get_ram_addr(mr);
>     const char *mr_name;
> 
>-    if (get_physmapping(start_addr, size)) {
>+    if (get_physmapping(start_addr, size, TARGET_PAGE_MASK)) {
>         return 0;
>     }
>     if (size <= 0) {
>@@ -325,7 +327,7 @@ static int xen_remove_from_physmap(XenIOState *state,
>     XenPhysmap *physmap = NULL;
>     hwaddr phys_offset = 0;
> 
>-    physmap = get_physmapping(start_addr, size);
>+    physmap = get_physmapping(start_addr, size, TARGET_PAGE_MASK);
>     if (physmap == NULL) {
>         return -1;
>     }
>@@ -373,7 +375,7 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
>     int rc, i, j;
>     const XenPhysmap *physmap = NULL;
> 
>-    physmap = get_physmapping(start_addr, size);
>+    physmap = get_physmapping(start_addr, size, TARGET_PAGE_MASK);
>     if (physmap == NULL) {
>         /* not handled */
>         return;
>@@ -633,7 +635,7 @@ void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
>         int rc;
>         ram_addr_t start_pfn, nb_pages;
> 
>-        start = xen_phys_offset_to_gaddr(start, length);
>+        start = xen_phys_offset_to_gaddr(start, length, TARGET_PAGE_MASK);
> 
>         if (length == 0) {
>             length = TARGET_PAGE_SIZE;
>-- 
>2.41.0
>
>


Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
