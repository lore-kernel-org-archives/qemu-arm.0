Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1515691lfb;
        Fri, 3 Sep 2021 10:46:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfCQN9skRr3FHha3Zr54Zu7MWUAA/+IBVQPa3kypyyA5JmjYXfsgUlLXtcewgqLsLloz9l
X-Received: by 2002:a50:ec0d:: with SMTP id g13mr145287edr.233.1630691182259;
        Fri, 03 Sep 2021 10:46:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691182; cv=none;
        d=google.com; s=arc-20160816;
        b=tAg1okWRIdOLLIgJOG3FeBbG0N4v52MQ/jJQuKnutZFttNxsJgF0EqFEUkzpZ/jm2x
         nKVQpfg562t/cuCqJdl7sMSwrWq4SkrKT++f35TkCTpVDW4NKqWqn/QQKArvomIrnqWu
         wEct0xKht4jJgMg3lwX29ACWi2dHyLa8pFmth7GZMzykpJ0rMGV+9tmx3g2BUVHGdNxy
         rplWLLPnG9vWihf+huFp+p3ywzQIfrzw+p5bdgVApwmZAjSapZDKDpJlCTGkkYL91LMg
         1Xxs146oYmxG+FzeUhEW9sHTTX1w/53/bSGntcKrY8wOyhdYvgRjURUYYdoKeBK3PJX8
         QxXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3Z0QUNuHHLKTpTAzIZmgjtHARc7fEMtqBBgS6AoxAXY=;
        b=v8RPvSzKugC7X5aBkpDROfskvr/aYOqx0yzHVCuKsMrrF9n0k1dPpuRTRS1aiedN24
         lAeXnRCQkTTKCYfxQ/k9BOqhZkn0EbbiSJG6fG5kpdkQxwhDoQO+li5Gpo6fpDR2xOV6
         RkelUYtwL9L7CPO02gCRuhm1X3FeDnFMX7YBzTW+QIeuvxtcL7NBPnIcA8BzGUsiAQiw
         j5XrWSQzhBxxMrAPo+5BZRo/oI5PiZrgk7DzvARyciAAS767ASyMw3CE/NwM+vaawuQK
         jkNO+NuK5vpshXPB8hO1Krf0Qhxm096MMdqqAX6ujjvOWKEiLS8c8LwhWrFdlejpQsLk
         vZsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F+UY3hsn;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id n12si141229edx.124.2021.09.03.10.46.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:46:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F+UY3hsn;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Z0QUNuHHLKTpTAzIZmgjtHARc7fEMtqBBgS6AoxAXY=;
	b=F+UY3hsnlItvR10X3NJXVhv01sMswWuJIexawIedTBduyB2Pdyw4D4uFcm7PGmakildki0
	WB9GffbTw/av6LoJiSsVKcc5IaP/13Kg2C7SI8yOuKpQUxQSeRF7fYtIL9XOEefnZ7tZGI
	FCCp8WE/djRVqsec2G94+KuQDZ+JoBI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-FnY90CK5MXSGSoKwTQX_aQ-1; Fri, 03 Sep 2021 13:46:18 -0400
X-MC-Unique: FnY90CK5MXSGSoKwTQX_aQ-1
Received: by mail-wr1-f69.google.com with SMTP id 102-20020adf82ef000000b001576e345169so1815864wrc.7
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3Z0QUNuHHLKTpTAzIZmgjtHARc7fEMtqBBgS6AoxAXY=;
        b=bfD4AZnUF30bFUG04RMZQw8pV//kc5aj9ahJz+RMnM4aBH35ur2X8Q2vNrL8Fhz+pY
         764SJ+brtJ+ZN28FqII+oUqDKpzxZWKI4yjSVRyvtZRDcKe4ZO7TUiGHGnZahZnjG26H
         OxOSOVge1nfCAL3rUKX2+hXjXqxrkcxc161fgVO8USdKhqLRu9REUOFB9EdbGj32FwCE
         nQ1b22kdZTdLIpspixWSaqLCFEWJAX3CUrc2/6TYImY31rkYBUBYhpqsqSPvMmC2+xC3
         HCrUnDRJ3Z1p/BwtF3UJeogOUCnVmCoVQ4Uh0SQo/xerrXJd/DLA6xX8yJ3t5+mxx8tl
         eQdA==
X-Gm-Message-State: AOAM533f0EFKAB4+k+IntjxqF5Qrk8lpRg9NwleLHZ4cv4zR58Jx1P9o
	E/9DtQT64rDQXfTmchBaSS/vJWV8OVW6AcD33WxHYxBQ7xseVgpfA45OiUcEhb/QYAkLThWvTxM
	JGBrkT9zUA1QiAbeT
X-Received: by 2002:a1c:791a:: with SMTP id l26mr42907wme.100.1630691177255;
        Fri, 03 Sep 2021 10:46:17 -0700 (PDT)
X-Received: by 2002:a1c:791a:: with SMTP id l26mr42882wme.100.1630691177104;
        Fri, 03 Sep 2021 10:46:17 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id c1sm69751wml.33.2021.09.03.10.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:46:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	David Hildenbrand <david@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Hanna Reitz <hreitz@redhat.com>,
	qemu-block@nongnu.org,
	qemu-ppc@nongnu.org,
	"Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v3 12/28] hw/i386/multiboot: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:54 +0200
Message-Id: <20210903174510.751630-13-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903174510.751630-1-philmd@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0XQ0ph9zLi1z

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/multiboot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/multiboot.c b/hw/i386/multiboot.c
index 9e7d69d4705..754415d17f3 100644
--- a/hw/i386/multiboot.c
+++ b/hw/i386/multiboot.c
@@ -387,7 +387,7 @@ int load_multiboot(FWCfgState *fw_cfg,
     mb_debug("           mb_mods_count = %d", mbs.mb_mods_count);
 
     /* save bootinfo off the stack */
-    mb_bootinfo_data = g_memdup(bootinfo, sizeof(bootinfo));
+    mb_bootinfo_data = g_memdup2(bootinfo, sizeof(bootinfo));
 
     /* Pass variables to option rom */
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ENTRY, mh_entry_addr);
-- 
2.31.1
