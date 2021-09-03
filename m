Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1173878lfb;
        Fri, 3 Sep 2021 04:07:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1FwJB9l6BXbZJ4pSyPU/NQ5TlrAAavmXYisoZNuJhMdCzmauw9nnG50DOGzA5KHexYXa0
X-Received: by 2002:a17:906:b0c8:: with SMTP id bk8mr3586780ejb.412.1630667263117;
        Fri, 03 Sep 2021 04:07:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667263; cv=none;
        d=google.com; s=arc-20160816;
        b=XlKL7/hkfWd1ccDKi/cSrGhoe1GArHzZ14aORiJd4wpjAnwjFUJNxgu883Ii23LiQZ
         Dnuhh+jlPUEr/1MTNufd7SJxq/y9CwETr9tzRVk2bQwHzZnuEEDbuaAfklPQgShu8Eap
         Z6IjUQLrfodmtsdz1hkeRa8C4cxZErOcjXcuitw9+SI3Yv39t2YU5GyuEefYJcFBBTRw
         zkweDV/eegjCgsqGXFUrLQl8uducVj3/HPrALTJtpSsLmoiPp5LNRAtMl9p35q52Aefp
         tInW0ZqeK+ZK5J/lXuJaZeky67dE1SE39fKtSy7ebN8lb/NXTFbQTtLzE6mLnZSpNlda
         JIgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vyN09QcPG+VDBDsPFQVE2hfeE/VYAwQywY+WfYVVI7k=;
        b=MG6xKANfkiH7mdlh9Fb+c/jXIE9lrF8PpZZfbWK/IZSJ6pdT/f0E2udoQXeY5iAT5U
         F2QHJgU4N8ejfxIuUe1TMlYOSeauYmgiPt7oLEzOebX2CC1rDmQUIOhAbMEBd7g8qWRi
         Or6FkAv2M3aDBGDXn/TFeOfYBekc+VepDeqk1ulggbBgTovAn4z489lc6olLH2C2k8QW
         JCnU87krGyrTCerq74fQkCtw2fBAxle2f5h+obNGXPWkMaXgh7vU6o7pfqpX5gzNvxAb
         x2kJATa/scHLO1C3ynPzUEAdZQufGMiLtWv0vGyISe0ZNLqircVnzcCyNApXeNimJ9k2
         L3Zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fZqZNun+;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id qw5si5267552ejc.383.2021.09.03.04.07.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:07:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fZqZNun+;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vyN09QcPG+VDBDsPFQVE2hfeE/VYAwQywY+WfYVVI7k=;
	b=fZqZNun+zNtXeoksX6tHw8kpKKGJuqvfH/m/uATVizBNPydrSfBdyVvByR3FX/2kkfh6sT
	avNpxln1ai9+mE3iOtMt05FKbpcDPVWv4j13wSNn8rmzoU+TGf51iF7opc+2YO06G57cP6
	02LdDM8dNlgHj0AVy/BrCHAMjJt4DD4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-x91lYowBMOu8F-A7Y7-bbw-1; Fri, 03 Sep 2021 07:07:41 -0400
X-MC-Unique: x91lYowBMOu8F-A7Y7-bbw-1
Received: by mail-wm1-f70.google.com with SMTP id c2-20020a7bc8420000b0290238db573ab7so2517967wml.5
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 04:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vyN09QcPG+VDBDsPFQVE2hfeE/VYAwQywY+WfYVVI7k=;
        b=I+pOmsutVldvGrpjmEy23xc91R2b4ulgSJztTq0u27CPm0wbKfPmzCgzWeR/Nx4yxT
         ooiDIeBvSXzoNIOl/2lInEN+mRYof7FtXjLXsZQ2pmYmuwFyOjrrvDqapnG1yjmDMzv9
         iPa80yzrUSLYXec+rIcGjMKtucJxvmLoTh4jKhXj5zKo+rqYyJIPhHPbfafpwNECmA4a
         3U4d8Qg9N8k8nDtARIrzBJ3PIifVf+UuOTJdntK6w+nUhxdOMf+W5C8/WFnetrzATexJ
         bdvNCvQ/zB9ZwUX11z8KhJ8yX6XdHdvco70KGHOyyMql1eDdOnt2my0j2MjgB5+42NQ1
         ntbQ==
X-Gm-Message-State: AOAM532vI7K3DS0aCIMTMwpTukdCwHCmC8Ih4E4oyI8q0+DTFtiET1rj
	YteyJmlFW6w+RlzBcNK3JqJe5XZw/MAOvytRJCAueymD+wFLDfWUygt6ZKOTIGgbYBmesOEe7nC
	cYSzrDyw1AU3UQP8b
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr3584601wrm.198.1630667259940;
        Fri, 03 Sep 2021 04:07:39 -0700 (PDT)
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr3584577wrm.198.1630667259732;
        Fri, 03 Sep 2021 04:07:39 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id f3sm3966844wmj.28.2021.09.03.04.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:07:39 -0700 (PDT)
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
Subject: [PATCH 06/28] softmmu: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:40 +0200
Message-Id: <20210903110702.588291-7-philmd@redhat.com>
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
X-TUID: rywfBZS9M0np

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
 softmmu/memory.c | 2 +-
 softmmu/vl.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index bfedaf9c4df..838a274b627 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1140,7 +1140,7 @@ static char *memory_region_escape_name(const char *name)
         bytes += memory_region_need_escape(*p) ? 4 : 1;
     }
     if (bytes == p - name) {
-       return g_memdup(name, bytes + 1);
+        return g_memdup2_qemu(name, bytes + 1);
     }
 
     escaped = g_malloc(bytes + 1);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index ea05bb39c50..a136ef0bfb6 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1154,7 +1154,7 @@ static int parse_fw_cfg(void *opaque, QemuOpts *opts, Error **errp)
     }
     if (nonempty_str(str)) {
         size = strlen(str); /* NUL terminator NOT included in fw_cfg blob */
-        buf = g_memdup(str, size);
+        buf = g_memdup2_qemu(str, size);
     } else if (nonempty_str(gen_id)) {
         if (!fw_cfg_add_from_generator(fw_cfg, name, gen_id, errp)) {
             return -1;
-- 
2.31.1
