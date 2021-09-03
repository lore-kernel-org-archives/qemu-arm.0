Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1175439lfb;
        Fri, 3 Sep 2021 04:09:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaicWCLYhZCoN+whN306AaXBiuLklx+MdNc+1d+f2VGWyoRH48qbAxlC0K+9fbPTQBL0a1
X-Received: by 2002:a17:906:39d8:: with SMTP id i24mr3691795eje.49.1630667370620;
        Fri, 03 Sep 2021 04:09:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667370; cv=none;
        d=google.com; s=arc-20160816;
        b=YS46GHjxmPhxvvQpFrR8rMnxu3boUHh0bBuDKk0SVcs664PZ8E+LLVU8s4FvJyqPgM
         1s493Sa3qHaGauUvyBSmkkGzjsBFbyUziJ0Bqx5VE+IIA87/oQrfj7EDAXXtXf/Mwh2v
         NBh4/oEcEY8gOKAfIBxBRN1nUuFGO/bDvKkMPO3RZtl5tnJL95Vrp3n8h2qseaS1+xHF
         DU9viVo6mC6uCsSgKZsKifx5J7lje3xepu3cMK7zq9e510RiDv/Y8/EWsj2GoLDC+KrJ
         cREijKRNy6bbIX24yKa2iGfisGVkN5CsSSZdECrPnzDnvHWNeSuSlIfCxc95mF1RRLRI
         dC/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1TRLuEzHEF/4g6uAMMisPruZyA4xzKhXkVqPhmG3sbs=;
        b=W8Tvdv6T037yTKrZyWzWXHTWwe//1nMRWzGmkHlaf7w/+CSoDs//H7/sjgCn2xhHgv
         Xc9BGkmjzWGzCgo8EdAZEu3vkVEEns9525owglm6ItOYTG2RDp98j3+Tj9cWqrCvvDgi
         //SKJa979GFFh6pxqVYcTYoXTznj6xh/fmv/AUjJ6ssYfI2LlhkLXErI2awNTWlfu+Zh
         9qTvABM5gh0rII/7v67rKgbUeENUyrCf5NzICmrxCi16HRH7/+s+NxDNDERMGZEYsXM/
         wfCw9T/JkqPqIcm+G50YuDqVO8uO8A26A4TTX/UOXjRs3ZlNs4ovQpu9hVCUqPoKdVzk
         knLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZYIxNLgj;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id du14si2383890ejc.521.2021.09.03.04.09.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:09:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZYIxNLgj;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1TRLuEzHEF/4g6uAMMisPruZyA4xzKhXkVqPhmG3sbs=;
	b=ZYIxNLgjbaqyby9G7kPx3Tx9q+WOuExdnNxZrmlEbJ7+mfdDTFn3U1ONWyv67Xlt+ssi86
	/scDFsXfYnDHZzzCwKOXdpWORW4o15aNRMhJ6YT6hZk0v+QhrSpuZN8CIDMHU9rfhFc/EU
	Fo7PLmSU/xUlIwBftkhzB+MITE7n06M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-1FGTFMH7PYeYy02NplpudQ-1; Fri, 03 Sep 2021 07:09:28 -0400
X-MC-Unique: 1FGTFMH7PYeYy02NplpudQ-1
Received: by mail-wm1-f69.google.com with SMTP id p5-20020a7bcc85000000b002e7563efc4cso1840127wma.4
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 04:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1TRLuEzHEF/4g6uAMMisPruZyA4xzKhXkVqPhmG3sbs=;
        b=B57MTS1F+ph6FIvmKnd0flxUwo+KbHvXfuvIzFTD3pY2xsp7uNv5O55IaSogSZUhrD
         DxJiOYB+S6O5GJuPl9IBW5fOorpFQa7mptupYHaTU10kwVIEfH9+sIwcmegGSaCq0vSQ
         Im862S4vuYLh/HxmKV4PpvkvHHXU5+9iDX6YYfW69vHd9Mh62kGpg8FreNE7d7mqO2Ju
         wnQR5r1l5VRs5el9BEGa2WLD8QIZNocEO05Tj5FrrImXs2NV0vv4B8mDk3cYZ2ckR6CZ
         +K6gLiI78fufFd++s82K9BBPM7Wn2TVnjUSM2LC14he69yL4ijOt8c0pDqBNwrdezwUp
         SlbQ==
X-Gm-Message-State: AOAM533FQAI4kmn9GXbMWX6444h8DB0JeLNWYkIrWZuHNyGFxudFhnPc
	EYdbqsfgmjB/bMNhBXA+9yyNDoEumDjc4TySoBwSUWdemrdSgxiF744BUoruiP700UkvH0mFLNG
	evqsDfWi7nRjkBhqf
X-Received: by 2002:adf:eac3:: with SMTP id o3mr3437739wrn.60.1630667367343;
        Fri, 03 Sep 2021 04:09:27 -0700 (PDT)
X-Received: by 2002:adf:eac3:: with SMTP id o3mr3437691wrn.60.1630667367173;
        Fri, 03 Sep 2021 04:09:27 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id q195sm4179375wme.37.2021.09.03.04.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:09:26 -0700 (PDT)
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
Subject: [PATCH 25/28] target/arm: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:59 +0200
Message-Id: <20210903110702.588291-26-philmd@redhat.com>
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
X-TUID: MvdBuZ1vEBN/

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
 target/arm/helper.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a7ae78146d4..f3aeff399b9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6242,8 +6242,9 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
 
         /* Create alias before redirection so we dup the right data. */
         if (a->new_key) {
-            ARMCPRegInfo *new_reg = g_memdup(src_reg, sizeof(ARMCPRegInfo));
-            uint32_t *new_key = g_memdup(&a->new_key, sizeof(uint32_t));
+            ARMCPRegInfo *new_reg = g_memdup2_qemu(src_reg,
+                                                   sizeof(ARMCPRegInfo));
+            uint32_t *new_key = g_memdup2_qemu(&a->new_key, sizeof(uint32_t));
             bool ok;
 
             new_reg->name = a->new_name;
@@ -8818,7 +8819,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
      * add a single reginfo struct to the hash table.
      */
     uint32_t *key = g_new(uint32_t, 1);
-    ARMCPRegInfo *r2 = g_memdup(r, sizeof(ARMCPRegInfo));
+    ARMCPRegInfo *r2 = g_memdup2_qemu(r, sizeof(ARMCPRegInfo));
     int is64 = (r->type & ARM_CP_64BIT) ? 1 : 0;
     int ns = (secstate & ARM_CP_SECSTATE_NS) ? 1 : 0;
 
-- 
2.31.1
