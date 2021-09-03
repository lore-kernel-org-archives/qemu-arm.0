Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1175545lfb;
        Fri, 3 Sep 2021 04:09:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzntmHX81U+su0lAYN0jHd/UGl3UsfH3nckiODtHsmirB/aTXBcU6LjTSqZd7cwju0VVldB
X-Received: by 2002:a50:eb95:: with SMTP id y21mr3456731edr.139.1630667376612;
        Fri, 03 Sep 2021 04:09:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667376; cv=none;
        d=google.com; s=arc-20160816;
        b=eYg7960D82ykXgOjFZIiVJr2MhIaw6PM7JwC2Z9w1LC8jqH87WHLvXnbTilcPUh4bi
         6ItgBF67sS/dONlZ37tfWQVSsJ/apy5Gq7TxhQQElyPk7sWEt7OVa2hkiRvjUZ0iQCBt
         +X+X0gwxKCFm6ZRhmY2KfpXR+PKrh5Zjv7FZ18aLJZdKONG3sOAbPSymN7WLIvpZyvTW
         7BZF9sFPariBtdWp/9vWL/VRU5RtxmgMLJvuPwV3L5YlPtRcYOgtjFeT7wP+4W9fNPCQ
         5qOyWUiiMghrLNkiwk46Z0BcK7O9ImtdcCYRgWs5L1mFsqBNmzeOK7GWAHck26Y7DE0u
         8RdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=IGLIaIG1oc/f/hK8LLmc1ZCw3aRo0zL/iFOeAMJ8CLs=;
        b=L4jYf27d878104gfO5EgdjnhXzGz2/Gm/ByBpapaICJjcFCQc+BDqD1rt574ydnxoE
         s9RguLNQKg2PaELsLQ8dsrU+wAIfd62PjOb7vnmj1dvQLHoxR9P6x/yhPy9gR9Q1gAtg
         uYhJ4V/3pwNR76VM7Q4nLqiikJDQ8xlxQO3IWKCrCIvRkIc4A1cDwtO7HIwsfz9N+Apr
         IvCjwamo7lwip1xP79/Ow4Blql4qG09eYwREFhlpvBx/WqAeMOe7y8+VN9EWUzA7z4lj
         2jUKBQ6OU0R7nElgL7FRQRMgSOE2X9kLPuKhqBSJjzbnGCiUR25krUoV35G1dpiOds2b
         O36w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Qky2GCJA;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id l26si2236457edc.46.2021.09.03.04.09.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:09:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Qky2GCJA;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IGLIaIG1oc/f/hK8LLmc1ZCw3aRo0zL/iFOeAMJ8CLs=;
	b=Qky2GCJAuUP8ghHUYVQd6jR4K6hnU6vn1qZ6GzzY7rMOE3J06M+ZUhPqWzRRff4nuKBXJG
	t5kd5xhWULM0G8j94RwWQoIfVaycj/mD3GiqzCeayUdpwG8wde4XRwm4hjuF6rcZAGZyyC
	AvMJpdAsKbqW+1vGAhxEDy9gmUPmeZQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119--dpGEKZEN1OgIZLCyG9twA-1; Fri, 03 Sep 2021 07:09:34 -0400
X-MC-Unique: -dpGEKZEN1OgIZLCyG9twA-1
Received: by mail-wm1-f70.google.com with SMTP id j135-20020a1c238d000000b002e87aa95b5aso2521973wmj.4
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 04:09:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IGLIaIG1oc/f/hK8LLmc1ZCw3aRo0zL/iFOeAMJ8CLs=;
        b=DE1X/YqPuzsId7aJRMWV4m5HQvS0sOZkFR4GBykS7WUOyf9XSZGK31EyK4OXhypWMU
         XPFmSgxV5t/9Gdz9Jla9YSyhYuvWMzSNS8YCnypKsyqAaqfow2lEPomHr2gvx405hz0d
         tPsSIMgB14Jl8+7hnBgIMYSVviw0WRFIZarvBW45VsikcoUp0lrOAKfsdQByQzhzzTNE
         b1AHe2DmzADlzCHj++vzlLZRMD1V9XgOicyATEWa73tnm38Z3ykH4w9gwbpC1S48yUze
         DW2BiyXP3ZWxAUpDOvyiMp8nnD/568kttkRCtVr6k4ygXwqYyyKXNjLbiSbpev8LJTzM
         FeOg==
X-Gm-Message-State: AOAM532WDzp7fFUVx1BMmfYda4CI94IPuKOidLOJ/VmX1BgqcprK1cBV
	/HXzu08bilHbpH1zfTpF9oGV1K5ZnEBimLapRXxvMBVQbEGN4RlcsSU+bdaLhU35RkgaXozPdjM
	FvRYPlIeXGgrRJXxJ
X-Received: by 2002:adf:fd51:: with SMTP id h17mr3315342wrs.178.1630667372948;
        Fri, 03 Sep 2021 04:09:32 -0700 (PDT)
X-Received: by 2002:adf:fd51:: with SMTP id h17mr3315291wrs.178.1630667372803;
        Fri, 03 Sep 2021 04:09:32 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id z19sm4806706wma.0.2021.09.03.04.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:09:32 -0700 (PDT)
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
Subject: [PATCH 26/28] target/ppc: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:07:00 +0200
Message-Id: <20210903110702.588291-27-philmd@redhat.com>
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
X-TUID: JrpHfbRBo9AE

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
 target/ppc/mmu-hash64.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 19832c4b46f..2ee6025a406 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -1122,7 +1122,8 @@ void ppc_hash64_init(PowerPCCPU *cpu)
         return;
     }
 
-    cpu->hash64_opts = g_memdup(pcc->hash64_opts, sizeof(*cpu->hash64_opts));
+    cpu->hash64_opts = g_memdup2_qemu(pcc->hash64_opts,
+                                      sizeof(*cpu->hash64_opts));
 }
 
 void ppc_hash64_finalize(PowerPCCPU *cpu)
-- 
2.31.1
