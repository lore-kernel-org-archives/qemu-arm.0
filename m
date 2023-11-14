Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2161205ejc;
        Tue, 14 Nov 2023 08:31:40 -0800 (PST)
X-Received: by 2002:aa7:cfcf:0:b0:523:100b:462b with SMTP id r15-20020aa7cfcf000000b00523100b462bmr7161487edy.5.1699979499998;
        Tue, 14 Nov 2023 08:31:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699979499; cv=none;
        d=google.com; s=arc-20160816;
        b=v7nRz1r6HQoJM+0yp00cLOfyGRhNKMW5dlEHlDi8wHGs4TkyRJzQtshYgh5yZC5uO7
         fBi+hjqWiz9AQ0fDsTT7sGipIVLHRj3PgBFbfT424qXp0ca2oPNBU7/fuIlBAGz0oKTd
         zzapNaASbbZRP7WbrBa6VjOgeHsDJl0DWOatyLek7kjIiraqqK7kwYemgqXrzAnPBa5L
         QED2xLHE1wwhNerEkjtCqWRW2Gx/7+w58SHPZtzvi8/Hqso8pS8XAStnEIj1PyswgPX+
         6fbe5wQcbLKDyW0nVEarc9CnYnw9H8b0VdkJ0KRdsuYvvjj3yuJTqSYZfoGcWwaqnX/p
         uThw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=SmG1RvmEVqSdouF1EAJ1JhQ2v4iViVsF9xcNQ9FZB1E=;
        fh=3ONVdx/N3j+Uu4iiyqRRC3lFqZDQ7vyxbDGhEJiZppI=;
        b=ZGRSHp9Vdkc4xDBdvfNOlbLjHiwf5MJ6ql5z59IjaoSFjunZNeUkO6bgs6U9XicHLW
         Chhm3zvAIUYnPIC4lMWxwzOF5aur8M8AAOXW5kBfTLkZJtDkUD0/YyFBG28RT1FsboEh
         kfZmR8/9z19expeI8KzPF/0PnP54fsxO7fUnyqie3Rk6RTDqGapsd9ZsWxQba/3jKwsV
         rUY0VmzCttB6DsDvoXmsOKgVbJoU5i6qZamqjnQODuaigmDlLZmzF66swj7aCNcjMzEB
         19nCTHQ/aiAXMjefF2XLWZ3Y9k8AkOJcgQ5tw4AMq/FTn4O+YEYWRJjanF9i3d2Xqedk
         TuYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bzuhlklv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ev18-20020a056402541200b005470a679011sor1773584edb.10.2023.11.14.08.31.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 08:31:39 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bzuhlklv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699979499; x=1700584299; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmG1RvmEVqSdouF1EAJ1JhQ2v4iViVsF9xcNQ9FZB1E=;
        b=bzuhlklv8836c/9I1huPZ27KaZRpdV9rnkxtQtYwIWDlGxgorsXIk+Oz/+eo08UPES
         GwfbvFFzGdzyEnndRYaz3l6XujRyi2E2b0NZcMNGGdblbGw1+MIXVZS+0eKp2TGIimIS
         EhAldQ1XmZnQ16EBbnWz+Q0g42dIVKFv9YNxTQY5CBK3QbfemAJGJvR76+KUClbUs14E
         2l9vgXo9WtU4V7HVzjKtHR9kSFp3la5m1Fs6IVPdCYG2hQfCSpuWjL18CBFkzOFHN2Ea
         qgICs0bFOVz/nwE4DO6xlhcZr4WUZUnMY6nqcQtmQLD67Bt7dNANlaXDs0ezc1L9yRR+
         wUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699979499; x=1700584299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SmG1RvmEVqSdouF1EAJ1JhQ2v4iViVsF9xcNQ9FZB1E=;
        b=GZmaLKpRUIrZgA+Dof/qfkGc2LYGMFtNnW/yYT4LMot7LC+cxDU4MUZXC/ed2SlEbb
         NUvOeBNeFvbOStOebu0VLJWSoJ9VhOQURow+cyUD7LvWZnb5KjmoV6CeQJfc30GI3i8s
         e6u4CCiqm8VmPYdi6iIM+vd/VMpGyoAx0Aol5PTJ0fEVCmBpjT3RvZWCVHHQNuTu6f43
         NUfAxH2CNPpMYw7C8CcmuqYBCCYkW2DFyD5Yvt8iua15wM51E6EPiWBPeDJLU2b86HcG
         lhjFEJTJtR2HpYXcX3Jr1M2HBUHOV1gN6q1qUsBT2orFkBrhRSJ6AS9UbcToujytxIc9
         q02w==
X-Gm-Message-State: AOJu0YwL/QEnXx5b0d+byKEh2GMdsfJCUpNXcK41WR0HUzk+OC+PFSTB
	tQs1kOqtb6Y4qMlQxKf6mQXrhrxq
X-Google-Smtp-Source: AGHT+IHL3uPIWo3k1FIfttqQPpxRZY2ZBH7YhX3W4Qy+3Zh4pc0MQhOvVP2dpnkHA2n+Lr+G86EpBQ==
X-Received: by 2002:aa7:c487:0:b0:547:cbc:e07d with SMTP id m7-20020aa7c487000000b005470cbce07dmr7903450edq.1.1699979499591;
        Tue, 14 Nov 2023 08:31:39 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id d17-20020aa7c1d1000000b0052febc781bfsm5326899edp.36.2023.11.14.08.31.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Nov 2023 08:31:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH-for-9.0 2/9] hw/xen/hvm: Propagate page_mask to a pair of functions
Date: Tue, 14 Nov 2023 17:31:16 +0100
Message-ID: <20231114163123.74888-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114163123.74888-1-philmd@linaro.org>
References: <20231114163123.74888-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 982wZimFc7Lm

We are going to replace TARGET_PAGE_MASK by a
runtime variable. In order to reduce code duplication,
propagate TARGET_PAGE_MASK to get_physmapping() and
xen_phys_offset_to_gaddr().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/xen/xen-hvm.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 8aa6a1ec3b..3b10425986 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -174,11 +174,12 @@ static void xen_ram_init(PCMachineState *pcms,
     }
 }
 
-static XenPhysmap *get_physmapping(hwaddr start_addr, ram_addr_t size)
+static XenPhysmap *get_physmapping(hwaddr start_addr, ram_addr_t size,
+                                   int page_mask)
 {
     XenPhysmap *physmap = NULL;
 
-    start_addr &= TARGET_PAGE_MASK;
+    start_addr &= page_mask;
 
     QLIST_FOREACH(physmap, &xen_physmap, list) {
         if (range_covers_byte(physmap->start_addr, physmap->size, start_addr)) {
@@ -188,9 +189,10 @@ static XenPhysmap *get_physmapping(hwaddr start_addr, ram_addr_t size)
     return NULL;
 }
 
-static hwaddr xen_phys_offset_to_gaddr(hwaddr phys_offset, ram_addr_t size)
+static hwaddr xen_phys_offset_to_gaddr(hwaddr phys_offset, ram_addr_t size,
+                                       int page_mask)
 {
-    hwaddr addr = phys_offset & TARGET_PAGE_MASK;
+    hwaddr addr = phys_offset & page_mask;
     XenPhysmap *physmap = NULL;
 
     QLIST_FOREACH(physmap, &xen_physmap, list) {
@@ -252,7 +254,7 @@ static int xen_add_to_physmap(XenIOState *state,
     hwaddr phys_offset = memory_region_get_ram_addr(mr);
     const char *mr_name;
 
-    if (get_physmapping(start_addr, size)) {
+    if (get_physmapping(start_addr, size, TARGET_PAGE_MASK)) {
         return 0;
     }
     if (size <= 0) {
@@ -325,7 +327,7 @@ static int xen_remove_from_physmap(XenIOState *state,
     XenPhysmap *physmap = NULL;
     hwaddr phys_offset = 0;
 
-    physmap = get_physmapping(start_addr, size);
+    physmap = get_physmapping(start_addr, size, TARGET_PAGE_MASK);
     if (physmap == NULL) {
         return -1;
     }
@@ -373,7 +375,7 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
     int rc, i, j;
     const XenPhysmap *physmap = NULL;
 
-    physmap = get_physmapping(start_addr, size);
+    physmap = get_physmapping(start_addr, size, TARGET_PAGE_MASK);
     if (physmap == NULL) {
         /* not handled */
         return;
@@ -633,7 +635,7 @@ void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
         int rc;
         ram_addr_t start_pfn, nb_pages;
 
-        start = xen_phys_offset_to_gaddr(start, length);
+        start = xen_phys_offset_to_gaddr(start, length, TARGET_PAGE_MASK);
 
         if (length == 0) {
             length = TARGET_PAGE_SIZE;
-- 
2.41.0
