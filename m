Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1174200lfb;
        Fri, 3 Sep 2021 04:08:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmxmLgVDleaDWZbOYhT1wE61/RyhU7iwdaiDRkeSCjlxY7rFmCdippzNXZ1BJXsCP2OkBx
X-Received: by 2002:a17:906:dfe6:: with SMTP id lc6mr3611622ejc.210.1630667286027;
        Fri, 03 Sep 2021 04:08:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667286; cv=none;
        d=google.com; s=arc-20160816;
        b=UpcJ45gTaD45jjQLlY6dw73YWp7JFIwu0GC4VBK5wjFKx6CKP+gfjzaRsf2C1fhe3G
         SZmEhgTGBdP/M7yC0C9QPOKrfp1k/MMMDBCydibfn38jvgjWeWXN3SdeBesYRGhifbrT
         y4YRC80t+qBhsh5bQlwwmp0w3i8nR66k2hoIcLLjhz1z66Xg3A7djZWkOk07OYIvrCZe
         ucT5T/b6zvHMUqbipZo8hlAIPcaPi0W18lGL3CpY1Z2RRJ34hksdxqJ/5zPYvm7v8pWI
         JRK+H+uf14w8IifrsoGxLOio53+Uw+xvQi79xcP3at1IGoYZg4a0xfXXTCwD7XcqlcP1
         TeXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TAjmPmjyX5Sum8VvmviC+qTvvfAZSwR9odfcOrS4BTU=;
        b=ttEp09jU4lsvHCWDXMPF6ZDYCtwQr8FQXMFyy+dbm+MDUo4Pqm3Phqt3Jh+aNCo2qw
         R86sZ/YQPEeB5215sHSyI54FEiRItv9546fli+cL7HNX+gOSuaOAvxkhZM3h7uq2vsQs
         5xv0YptwpPY+tTmh3Cg+mqeULIb1fghIA1xeUx92QonM5zhcV3vyibn5x7Lqq23pUYE+
         4fUyn0sUJEwVqObCuAIc7Ff03NARMVcGYoJEs4eJIJrBo0OWe1/UAQVEoI1MUvjMqqBP
         1dYHphIMaPA8jpAJ+gu0bW/C9++xnKNjn2GAGZWQJvVlzMm4Nn2XJ4CQIaSxTecAGxUv
         nIoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fGWajPIQ;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id jg9si4284806ejc.708.2021.09.03.04.08.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:08:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fGWajPIQ;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TAjmPmjyX5Sum8VvmviC+qTvvfAZSwR9odfcOrS4BTU=;
	b=fGWajPIQC9tuAdXAIqx+ktyRe3mBJ/NE7UDXeJOzEV2W7oTOcP3DN2u7mQlmwAtDEoMGoy
	C2shAeNZjmVfKhBt0khh1v6PaGc7EKtYyp4IMkrI3DSoSXVjBAV57sDh2W/bvNu00P4joG
	kh2pZcDdqHKRUCoGmq8bbqyFPreDm+g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-YUOBJWX_PaGOF-mPoYAghw-1; Fri, 03 Sep 2021 07:08:03 -0400
X-MC-Unique: YUOBJWX_PaGOF-mPoYAghw-1
Received: by mail-wm1-f69.google.com with SMTP id p11-20020a05600c204b00b002f05aff1663so1845333wmg.2
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 04:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TAjmPmjyX5Sum8VvmviC+qTvvfAZSwR9odfcOrS4BTU=;
        b=Gh7MWatIuSFClzazo0hLZgZ346usEahcvdc5ZZYjgI+BeTslcEe1LtpyQcWE4U24uc
         1IR7AcH0Zt3cn/Dm+1EkshZDYNaIG6q+DAD5vDAgZBdkAYoawHLysh688/Ov6eEF968n
         bXEshf8j6g/M790bTQnzikMUgQ8a5l/BwZcVPSIp/lLOMal4yM+fIMt+ATHDQ3dzKRKH
         +UwbjPzLPK5Iu7QxANU1U1OqJ4bidrnvLI25vHcsXz4hBNUF6e/OdEnSdaKZNK+3rzN/
         Jp8zT3ilbURzfWS0VCFZXIPHH09ZzCYPJdFeuLGHygwuljb4g/nwOtZq8D0BTQI3m+QT
         xAHw==
X-Gm-Message-State: AOAM531icdVWZmY7F6O8NvLtjc6LArig+YSGChGOknILzl7aUeA0Fchj
	FvhOOyWl2TGi1uZEW+C+JFe3EqHAMez/x6nDVwoqpu4+aAlGMLPayShrV3zbCwbV8xPS/2+wZ/m
	a0QBlHasRnvakK0r6
X-Received: by 2002:adf:e809:: with SMTP id o9mr3379825wrm.425.1630667282668;
        Fri, 03 Sep 2021 04:08:02 -0700 (PDT)
X-Received: by 2002:adf:e809:: with SMTP id o9mr3379776wrm.425.1630667282465;
        Fri, 03 Sep 2021 04:08:02 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id m1sm3842996wmq.10.2021.09.03.04.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:08:01 -0700 (PDT)
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
Subject: [PATCH 10/28] hw/core/machine: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:44 +0200
Message-Id: <20210903110702.588291-11-philmd@redhat.com>
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
X-TUID: WkiPr/Gf53E+

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
 hw/core/machine.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 067f42b528f..0808a681360 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -615,8 +615,8 @@ HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine)
 
         cpu_item->type = g_strdup(machine->possible_cpus->cpus[i].type);
         cpu_item->vcpus_count = machine->possible_cpus->cpus[i].vcpus_count;
-        cpu_item->props = g_memdup(&machine->possible_cpus->cpus[i].props,
-                                   sizeof(*cpu_item->props));
+        cpu_item->props = g_memdup2_qemu(&machine->possible_cpus->cpus[i].props,
+                                         sizeof(*cpu_item->props));
 
         cpu = machine->possible_cpus->cpus[i].cpu;
         if (cpu) {
-- 
2.31.1
