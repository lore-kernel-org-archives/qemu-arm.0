Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1174405lfb;
        Fri, 3 Sep 2021 04:08:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPYUGOpKeixac21pMZ76EBzQyKyjQLYu3chiTk0zlfFqEZLEqjkFVSwu2nj5Nx4BNM1b2R
X-Received: by 2002:a17:906:165a:: with SMTP id n26mr3619229ejd.236.1630667298715;
        Fri, 03 Sep 2021 04:08:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667298; cv=none;
        d=google.com; s=arc-20160816;
        b=EQFVYiCI3vYHGU2IES+EmVdILNHxbIrEoP+aDvJe44yLVi2QeSjw/dk/SAs1YnE+r/
         llWGoJTSspzBvEgb31P/A8Fe59ntsmu+l0nOYn/KUoZoxZJOhccUqh5fvpk4TFscxMVH
         QODlkOZJk4qpwfvR5rWxADs1NzH79mtyBtIn78rJQNetFYDJRfR5QJ+5ZSSrUPoZ/xvE
         v2y5anjMdZ8QeMdG/2AIA2wj6YuD8sCzsDo7rbsEy45WSfuosq7fq4cQ65KK2uzdn6Nr
         hcsUbkAsPvVDXbp9adgXMrtUWmnBjYkxP1g62OOAGeOdMZnh+tkr5NvYVpbE4aNBH69k
         sfow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=DAHpDs712oI1Di1eaFqrdG2Typ24HrNYG4qVZsBh0cw=;
        b=CDu0TC1t27DnzVOctlF6bLCIeukJwaHitE0GHj7gXusu0ElLSjf8w9BYYxJLaA9T6d
         0xfF7IqlBpDXmGTfoPFAynTgNAwySXz1ji+Ft+5DS6qTNTuKqWLOxUMz7JsHsfmjy/Fd
         4MfJNF2pgio1wqZJzyTky2QqA8P+UG6WOoWnGwiiF00eMHvnAGZT4YS0SUYl5+AGOypP
         T7L3TWCb3ZKeoQtx4GLvCFz5+wNFm3vGo10DdcdcnJH0J/q8DQ1f9+I73FZaeB3Y9uIS
         m48hA5gk+OINNwAO6EIaiCfIibrP8yMwyiGE8+9LOKFCkd5mPUuzqllv4fCKJsKf+vyy
         4NPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="OTAWoo+/";
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id g6si5823031edb.162.2021.09.03.04.08.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:08:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="OTAWoo+/";
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DAHpDs712oI1Di1eaFqrdG2Typ24HrNYG4qVZsBh0cw=;
	b=OTAWoo+/Lv1PaK9hp39LKj+kMmwwqL/xm1cRRo7o69GgIpqIMNYFcJZU6k1VWu+91g6g2e
	P7nPvPHNuDn+OZr6h7lQMYNhr2mK3lRXzZxv8QzMxTCtnkVlrluB2vOcjmZN0SXgceX4+k
	ARYaZ9D3bpFt0Rgt68nbjbQD2DCUv9U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-kM1z4s5QO9WvFVjrCpx_NA-1; Fri, 03 Sep 2021 07:08:14 -0400
X-MC-Unique: kM1z4s5QO9WvFVjrCpx_NA-1
Received: by mail-wm1-f72.google.com with SMTP id r125-20020a1c2b830000b0290197a4be97b7so1831183wmr.9
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 04:08:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DAHpDs712oI1Di1eaFqrdG2Typ24HrNYG4qVZsBh0cw=;
        b=ugPKJsh0ayKqzY2yqZC/UHG96UPGoCc3SloXEa0xKcuSJE4IulrCEXjPWEYUTCeMlk
         CpALeUP32kGrywldMOf+j2xnUnZCEC5hjUSkXf/QoOo5vWrOczuD4TSbKHWUYCfFYK+s
         XoaUI3WbPaWtcts/Fd5n9FsNkD5E5zESequHUC8BidLUV7Q3xV6Alh3Fn3dAuYENjwgL
         /9I+18k+4Xr359lhgkP3BHI6KLrd/cBaNo/ojXuO030SN3kGm3jCMVUIImVib5BeOStW
         fzyJns6vw9xQU2g5YVMpqzXQEun7xTvfwyxO5cw4eun5CkaDsAxqe5Bflz1smbT8RMjU
         dzqA==
X-Gm-Message-State: AOAM532nJTSCH2tWF7/4qbNlG7zvK3e940U1vUXnBeZ0Qa+/Zc7im1IW
	tJqfGKy/jlG+J2kCjNR4odTmkDvZPBBBp5hHUkc5homvhJpq6yVETXT63qNsph7c54kfeQrYI4R
	neBvduNdchE9Blyb1
X-Received: by 2002:adf:db83:: with SMTP id u3mr3485677wri.363.1630667293636;
        Fri, 03 Sep 2021 04:08:13 -0700 (PDT)
X-Received: by 2002:adf:db83:: with SMTP id u3mr3485647wri.363.1630667293467;
        Fri, 03 Sep 2021 04:08:13 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id y21sm4191900wmc.11.2021.09.03.04.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:08:13 -0700 (PDT)
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
Subject: [PATCH 12/28] hw/i386/multiboot: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:46 +0200
Message-Id: <20210903110702.588291-13-philmd@redhat.com>
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
X-TUID: hGvDtrXNP4JZ

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
 hw/i386/multiboot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/multiboot.c b/hw/i386/multiboot.c
index 9e7d69d4705..f536e3c8c96 100644
--- a/hw/i386/multiboot.c
+++ b/hw/i386/multiboot.c
@@ -387,7 +387,7 @@ int load_multiboot(FWCfgState *fw_cfg,
     mb_debug("           mb_mods_count = %d", mbs.mb_mods_count);
 
     /* save bootinfo off the stack */
-    mb_bootinfo_data = g_memdup(bootinfo, sizeof(bootinfo));
+    mb_bootinfo_data = g_memdup2_qemu(bootinfo, sizeof(bootinfo));
 
     /* Pass variables to option rom */
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ENTRY, mh_entry_addr);
-- 
2.31.1
