Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1173753lfb;
        Fri, 3 Sep 2021 04:07:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKIVImJ8jXaOEkfZ1mShtXEQugoBcTWUqecBrwaGJ4wxaY8xcVZHuvj9//ajcoc63EUk5X
X-Received: by 2002:a17:906:2dd8:: with SMTP id h24mr3545265eji.204.1630667257500;
        Fri, 03 Sep 2021 04:07:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667257; cv=none;
        d=google.com; s=arc-20160816;
        b=Pw07FcfIIkl28kPzZS00M2cRjLg9c1LMfktRqg12rtZ0RenmSR3rGOqfMgcs0FwOGo
         FE7/M3LpCkZNRKaqiFvOqDJmr1C5DoQGL/VuxAHNPX+IyvGSMOdrdkqp7Ni5o4NyJ874
         o0H6ZVMPU2nBRuZhK8Dzaq4k6i3nbO1itAhr7Q+JR5xJ1nOwazn2JLGGtbhznN4LhcHJ
         dm8iNa0ctbslz8PdCeDCJQ2TfkbIjAXuGU4nQyJdKmrltvqN/ZK1cC3ydfdEGUeuFW1l
         LeuoPT/JAipZjKD6/pCX8mAv0yz6KzgTvpsYZ7dyM8JuRniVdEsE8WAHG9gacTPoQ3tG
         SHnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FZHOag7nyoHENtq9LgEUpVfsjfcHne0EwT0c8I8en8s=;
        b=XjX0I76OjKU/jxM//m7ZSlam6tPdPENIcjGDWwZyVk1Vh0HEwNQ3zr2xVSBOETXyCn
         OUDdWsq6XYlYRxGGeECpwiv5/SteZIWfy2uUjAhbzNHZcAh1cyVDPxhkmTCzQKODbqwD
         VrN7kHMwtgLE3UV2WqBSHoht2mhY9dZ98eMN4uRWnCVKndG9YMRkPElKPL2qy8rvzM4B
         ID+Npywt25zfqA0tnVAUmb5l/4kypCs+swFUdJ8zbB7j0goaM6UOb09RlagsossRlunU
         LK9gSQEKv8EW6R3H3IIqbCBpHEL7tBHL+US0KcXc/N4N14F+nMvgLHwEbb7tEjnW3XDo
         C2Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Qw79lfK/";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id u4si5281473edp.371.2021.09.03.04.07.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:07:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Qw79lfK/";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FZHOag7nyoHENtq9LgEUpVfsjfcHne0EwT0c8I8en8s=;
	b=Qw79lfK/lb5Jj897xrwt4Uhi5DHpvGe1cz3AZArQyadhQy0CT38ptGasp7+KYZ0ECxtqLa
	cjZwjS7sY2uniYckZqks4OeFK75qej8Vey2Hv2maFtr0YVISfgzo88brPve/aUrZFnNYAp
	RxKsHcRvw/4ApDecZlLi0iW4unaQloE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-Hrq542WUNhaMcMhiU3dDgQ-1; Fri, 03 Sep 2021 07:07:35 -0400
X-MC-Unique: Hrq542WUNhaMcMhiU3dDgQ-1
Received: by mail-wm1-f70.google.com with SMTP id e33-20020a05600c4ba100b002f8993a54f8so847079wmp.7
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 04:07:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FZHOag7nyoHENtq9LgEUpVfsjfcHne0EwT0c8I8en8s=;
        b=YwUi2elD/IFTjp27zVQEbIVeCDMnidW5LR7j0Bg7RF+wrTyAwDDJWCoaiAr0Yapd3n
         4sIL/P8vvUav5gc/h7pZkTj2Vw9+0lI1v2hsvLAqdr8+Qj/XzSPyU6PL6TaNkjxFqlqc
         ODtvjZKvx/yV95zqYWbsSSKDL83V1DGIRBxL8xjT4Z8sf3L0GVm/0dyjKTXjH2eCvJBw
         RhT8UPGi0PftRyA+YrWTeNpUWl2gofmADUtP6bbgzKHCVCLogMNX3jX1AcoVgwU1xVw3
         GuVGNV8ZePBDsWzbhWk0cSk3/94FGCaH4nQkPnUblehczyFgWuiXKbQWnGXD4jt62XV8
         DcBQ==
X-Gm-Message-State: AOAM531CV3mlbm3Jdg++8iHWNH1+ToWDDoMzIOClj94FZLF35LaJ/8IJ
	C4AdDlcrdpZ7wc3WN75OVWN21MTvOo0laXUMXMTUGXZ/yXVr+bXWu2awtWYawdBxyLTD84rrGxO
	cmfDAfLUDRVKojU6T
X-Received: by 2002:a05:6000:18c2:: with SMTP id w2mr3345264wrq.282.1630667254348;
        Fri, 03 Sep 2021 04:07:34 -0700 (PDT)
X-Received: by 2002:a05:6000:18c2:: with SMTP id w2mr3345238wrq.282.1630667254198;
        Fri, 03 Sep 2021 04:07:34 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id w1sm3983986wmc.19.2021.09.03.04.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:07:33 -0700 (PDT)
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
Subject: [PATCH 05/28] block/qcow2-bitmap: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:39 +0200
Message-Id: <20210903110702.588291-6-philmd@redhat.com>
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
X-TUID: 5+3uXXSnYf3F

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
 block/qcow2-bitmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index 8fb47315515..ec303acb46b 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -1599,7 +1599,7 @@ bool qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
                            name);
                 goto fail;
             }
-            tb = g_memdup(&bm->table, sizeof(bm->table));
+            tb = g_memdup2_qemu(&bm->table, sizeof(bm->table));
             bm->table.offset = 0;
             bm->table.size = 0;
             QSIMPLEQ_INSERT_TAIL(&drop_tables, tb, entry);
-- 
2.31.1
