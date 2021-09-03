Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1174700lfb;
        Fri, 3 Sep 2021 04:08:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcFEMA59h3CIBUpmF0kFqoLcDo32re7sTSulrPJnYu65wPD7VPoe9EsKxxXeR7mzeStd4/
X-Received: by 2002:a17:907:75d9:: with SMTP id jl25mr3600195ejc.4.1630667319632;
        Fri, 03 Sep 2021 04:08:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667319; cv=none;
        d=google.com; s=arc-20160816;
        b=LEK5g4udjOtbnlEM5nmkqTJhjOg6XKdRgfcbkgDtJ+RXor7Me7Zr0oDr/Gl5f0DR+Y
         NkF57EqdHpFFysEFHIk14GUIeKFUSTcH74PExuZY9y45TVfdWNVL5HwlXaxOjT5h6igf
         7tq8/u5bjJApej1wXCZCmG3JBbL+Nig/xPoB7TFcdnj2uojOGE93AGo6DX6uiMe1bSB2
         /1NNREqyCao8OSEo5lB3fT448U+zVNNZC8BdwGjmz9ZpsNwdEgFEH8mS4QK3yud6tRwd
         WISL7Rv7rpy8Vp1wFylec9ESicG+A6zpzYCWxPITkjn2HV0OZq3jBOfmsOoVR1O4TM4j
         BqYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=EzShw/2xTdEPPWeNVs4kSs4t7kGgMmp/B6AgbgiX3Ec=;
        b=QCUa3EMZ/YQXA0E9uldSLrWJuuVmQph9J/SD7a8ScHWJ6JXNseaG8J44IgNPe5B/oy
         4Syqffie9NMzC6TBCufe3f4Oyngyw9uz4Wv7GOZSXI3Pg8wjsrcJ86CO9fOb2UnwlSJS
         jPCZ68We8iYax73ng+nfncwqDbZmcNchZy5t7mfKWZ5sHVbOtQ/XUn6q6EGO1+8bk7yL
         QLPJX9bwJEzhlnSjaPdB3e7ulBQYPJicJbaY/d4ztWIGIvNeK5guV1W06rHGstQNuPLm
         QAm/eHErU3plgqrqoQmR0lJyfZN2gzEbQw7OOSElXHOwBHgBdcfN0g635QjVwNoM1n7Q
         I9qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jEfAYhgD;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id kv8si5683765ejc.306.2021.09.03.04.08.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:08:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jEfAYhgD;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EzShw/2xTdEPPWeNVs4kSs4t7kGgMmp/B6AgbgiX3Ec=;
	b=jEfAYhgDvqjHnyQH1ge2icy6Ap1XH5HgSIVGQeidbmEu7+IYiQJ0ujB/8C+Wm7GLW41CKT
	kkRE2HSRjz3Ast5s+5f929NAv1CiXpxMBjP86glLKBV91Iznxfy3JOeOH5v+3eRXHw3Qbb
	1pa99PFhSQUYHyklNg4FkUZJwrap5e0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-Ln9gsX76O5CftTZsCEwMdw-1; Fri, 03 Sep 2021 07:08:37 -0400
X-MC-Unique: Ln9gsX76O5CftTZsCEwMdw-1
Received: by mail-wm1-f72.google.com with SMTP id c4-20020a1c9a04000000b002e864b7edd1so1766892wme.6
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 04:08:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EzShw/2xTdEPPWeNVs4kSs4t7kGgMmp/B6AgbgiX3Ec=;
        b=IxfdC2Sd75SAQIKOcAYAl5v/hDkvKc3xEywI8XhcfXaXjlp5L+KihyZXAgxlyZoe6E
         /n+FjiNOC159I/DzmI998ohor+PrrkZ/aFSHhl4ne4n+UPH2FbSswpraHQXHOyTOD15J
         nmF9J2cdvlYf3Z3Ew37RSA585vvVJmVg6jK+8t5Dg2x3ei8p0fmEdKV3oYdacwnln+1P
         c/w92e9Advd6+oli8cv+uoSJ0LF6GJytnxC/gDbzz++bIcLUANSDSRkD1Ylfw95XkFjs
         ElYsleDVWDoJ9KF2+LN0B6DGFgeQDWfRSBcwPTr0L4Dw/not9AfRK4mUJOK2Cymf32Hy
         p39A==
X-Gm-Message-State: AOAM533Oy+ijcMPBJWuRkmaSCYmnrmQHeRyFpkLsHfN/P+0UxfBX8Orj
	f5AfG5sHx2Acq68rh+u3aUKVoSDMbzciunxvRB91AqAU+IBjxX4ly2p/87epqgT4TdHkFlFUBCF
	1xNx1Zr8DCFGUxGKQ
X-Received: by 2002:a5d:4fc7:: with SMTP id h7mr3395746wrw.333.1630667316303;
        Fri, 03 Sep 2021 04:08:36 -0700 (PDT)
X-Received: by 2002:a5d:4fc7:: with SMTP id h7mr3395724wrw.333.1630667316143;
        Fri, 03 Sep 2021 04:08:36 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id s1sm4548992wrs.53.2021.09.03.04.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:08:35 -0700 (PDT)
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
Subject: [PATCH 16/28] hw/ppc/spapr_pci: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:50 +0200
Message-Id: <20210903110702.588291-17-philmd@redhat.com>
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
X-TUID: RTsWUjQnOTqU

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
 hw/ppc/spapr_pci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 7430bd63142..79c0e8d4f98 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -2201,10 +2201,10 @@ static int spapr_pci_post_load(void *opaque, int version_id)
     int i;
 
     for (i = 0; i < sphb->msi_devs_num; ++i) {
-        key = g_memdup(&sphb->msi_devs[i].key,
-                       sizeof(sphb->msi_devs[i].key));
-        value = g_memdup(&sphb->msi_devs[i].value,
-                         sizeof(sphb->msi_devs[i].value));
+        key = g_memdup2_qemu(&sphb->msi_devs[i].key,
+                             sizeof(sphb->msi_devs[i].key));
+        value = g_memdup2_qemu(&sphb->msi_devs[i].value,
+                               sizeof(sphb->msi_devs[i].value));
         g_hash_table_insert(sphb->msi, key, value);
     }
     g_free(sphb->msi_devs);
-- 
2.31.1
