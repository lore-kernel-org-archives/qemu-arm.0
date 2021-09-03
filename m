Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1173978lfb;
        Fri, 3 Sep 2021 04:07:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwfizlcfI4n5+aBTIm3evfBwJ4lUkjnW01lrYZGieUyC5VFSCjhfa12n6gawzBzFaF+ffZ
X-Received: by 2002:a17:907:7785:: with SMTP id ky5mr3589086ejc.247.1630667268811;
        Fri, 03 Sep 2021 04:07:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667268; cv=none;
        d=google.com; s=arc-20160816;
        b=J0nD1v7L2ZyDEVJJ1SF+ILsyrISfRehZiwq/JmJbK47T3nzaDAuLRwTdMGHK0dB0j8
         oImbgB9qjrlME5akazvsMLZbYgm31AZSVnoo2QgZyGS/1d46SJFSNhKw52bCG/2y3JsP
         RX8KlLxtVrkIQz5PtzwLhWKqNFvyx6Qnl5TJlNPvHObtIuz6EKS5oLv1uivnveZ2NA2M
         rStZonANhkfMxqSGGGAPHnOFz0+bWY1EAr/V92/DPJa81tMLVJQME7K49SmfzLnTqfbu
         a0F2UtGC3W4Op+bSkANz9sWnQDl5vR47+uPvhxNvwdEbkNfvLpr7KzMNjku6C//rzbRi
         8C3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=E9PypJHZFiMU1wwHSEPf1Pz6upK9EcgUKxTQXXjwTWw=;
        b=BDt0ZRgZQ0bkxfXf6PmLcaOWYoZ/zGwDgWWivb6JCg+7TiPvdFCyHbGggdsIGODauX
         2WBkrvxEyDbZWh/ItIr02v3c0oIHFHf3CAW2nzFo5Lyf6IPy1bwFDvG6DOBX6rDHKwq5
         puVFX8bmQVTHOwEVT8Q2RZp6kYb94FkiHgjVdAy8Dp2yjh637O4IzRd77Y2J3w9orCPe
         3/ANLhlissBe712lrysUdt1KqHKVFgIonY4KGU+vC7gdoCymG96JIeKOJSdqEBuJleOv
         I9N0lqdpc/0IasyVyNhVrvwseFnxTq49uH8emSx15YeTaFMEGmD6V3Z1jhsl2c2EbeMT
         2/pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GSRKkGqv;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id t14si4773828edw.213.2021.09.03.04.07.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:07:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GSRKkGqv;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E9PypJHZFiMU1wwHSEPf1Pz6upK9EcgUKxTQXXjwTWw=;
	b=GSRKkGqvlIogjHFds+ZsksoNN2PBmHOpXGybVcc/N8xVWfkQ91KCnAsj7+P20BVb2psImS
	lCNOWk1XKpJWc3Jj7ogqGhf+MiQonaheIW1unLC8fByzWk1lAlC7kTOppt8rELWuN4XXTv
	ZV2jqY6KsXajDITwVRrTy6UQy9aB4+g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-EdOqh2q9NjWpP4JZUTe7bQ-1; Fri, 03 Sep 2021 07:07:46 -0400
X-MC-Unique: EdOqh2q9NjWpP4JZUTe7bQ-1
Received: by mail-wm1-f71.google.com with SMTP id c2-20020a7bc8420000b0290238db573ab7so2518030wml.5
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 04:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E9PypJHZFiMU1wwHSEPf1Pz6upK9EcgUKxTQXXjwTWw=;
        b=Vx9jzXNkmQfuByvj+BFmlPy0n7YrTlLAPfWTMSoqNywhlvsA34cFbwFn1s7Vnio+e1
         GWTYsAY5XKJveeLE1Pf/m99YKVPRMiasL5bAqHAQFxQbLSO7LP4xcMF0TJsvNuWq2Zo2
         iiH/2YCmZa6B7GdxHyDtcXEZZspTrnADAxpoAD4woIqX9IzkaZf7ZPlQ91EAgsHnnWxi
         I+VCO5CxJwZLwCaICzhBxIW3YtHsJ37h77KR2zZytCA+0sGeuqIEekO9vcc/Plrw4AFN
         G/7BFE/7aOJFjNih6iDR26wp5oorpinfoJ5H2JBCOJqxFiWQ1oa5pKBSRi99EI1IMp0a
         hWoQ==
X-Gm-Message-State: AOAM530+vuzPiK8+RXIGmAl5LCEieZtNMmL3F2+Id77XsDlNdvUaWSDF
	LaYnIzORAWq0Oo+J7kfmlVaBY5T/dOZZK4YUzOA9SM0Xupk/N6PQVc3uram59ZNudSjv2LXLaz9
	j1CdglIv3N6YowHOj
X-Received: by 2002:adf:e887:: with SMTP id d7mr3332684wrm.79.1630667265699;
        Fri, 03 Sep 2021 04:07:45 -0700 (PDT)
X-Received: by 2002:adf:e887:: with SMTP id d7mr3332646wrm.79.1630667265554;
        Fri, 03 Sep 2021 04:07:45 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id o5sm4341463wrw.17.2021.09.03.04.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:07:45 -0700 (PDT)
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
Subject: [PATCH 07/28] hw/9pfs: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:41 +0200
Message-Id: <20210903110702.588291-8-philmd@redhat.com>
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
X-TUID: AZGL1Mz0AXHT

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
 hw/9pfs/9p-synth.c | 2 +-
 hw/9pfs/9p.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
index b38088e0664..7d983574af5 100644
--- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -497,7 +497,7 @@ static int synth_name_to_path(FsContext *ctx, V9fsPath *dir_path,
 out:
     /* Copy the node pointer to fid */
     g_free(target->data);
-    target->data = g_memdup(&node, sizeof(void *));
+    target->data = g_memdup2_qemu(&node, sizeof(void *));
     target->size = sizeof(void *);
     return 0;
 }
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 2815257f425..5bf1bd7229f 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -202,7 +202,7 @@ void v9fs_path_copy(V9fsPath *dst, const V9fsPath *src)
 {
     v9fs_path_free(dst);
     dst->size = src->size;
-    dst->data = g_memdup(src->data, src->size);
+    dst->data = g_memdup2_qemu(src->data, src->size);
 }
 
 int v9fs_name_to_path(V9fsState *s, V9fsPath *dirpath,
-- 
2.31.1
