Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1515496lfb;
        Fri, 3 Sep 2021 10:46:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxO8mr5SBvFUMZ7L7e9O6VnOmeYxX+NLG00VxzdBanKgeo3yWugdnHn8huRdMPiMo4FTvec
X-Received: by 2002:a05:6402:d77:: with SMTP id ec55mr178144edb.248.1630691169503;
        Fri, 03 Sep 2021 10:46:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691169; cv=none;
        d=google.com; s=arc-20160816;
        b=YLXC+onwFvrvp7Ew1x5JV22+IX1baw+E/CpyL+lyBoAY1E/84gGM7tvOiyL6C7tCrF
         qJWYn5eXpENttqzKGZWL6RqrDTvB84ynAS2QJZ2mkGYa2MoGG4WIqn8jofDcrG1TUjPp
         X9ZzA/vSAagTy2/BiZ0NvWmUsxIkg7gQO4e6KtfF2Guyt+px6c/bTRuJDliijXcHpVvj
         8nUVYWlzq8jIAUu6XZNQXC9gzRyKaglLSdCWp/Tm15url5JKLupk89HH+pKz2wsr+j8p
         9GD72zniMcUm4QXmNgcwCdWPCcREcOhBA298U/uAYnh6+mkTR2wtvkS2uQq1VwwcC8Ry
         WMyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gZ88+NQf7Dpg62xRnIhpn8RZKl/GOm/FncpeFehqzR4=;
        b=0fkbBuCS93VQQPvImyzfjl09hUEx+J5dwxq/FfwVigj7rFhdS1mkY2Hu3nTXI8WRYe
         8QA8MeWC8gtRt0KxMZtYzPhUOlU+ZxITdxXDcvD0r14xC+l/GcLiqxJuZjc48oKnH677
         m9UbcCizf3BZeAE1x2LPhCBS2LEXgGvGUkPTBOrb0c3++3ljRxQ3W/Za6DYDpshKAuFv
         CtxHOLS8yxJjSLxe8ZHttKMKOcNm/yR94IdwzJuan6+IzzuOe6AHoAPDWj+4DwIIPCK+
         jRDVn6YMgcHKTtjGrB1xnSpaZxQgrGeZiCVG9mEO+cWoyWY86OUk33oEt6sW8rVaJL8H
         O/hA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BwYsLPNr;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id lu2si5967352ejb.166.2021.09.03.10.46.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:46:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BwYsLPNr;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gZ88+NQf7Dpg62xRnIhpn8RZKl/GOm/FncpeFehqzR4=;
	b=BwYsLPNrnL1gbKGonIZp4VWtOfSbgy7WAb0EG13m6zfeDanMAV5X35e4WdG/6D8x1jvT1U
	f/CxUWhAjtqQocusKq5HHwLJCQfKKn2T6crsoVuTvbKJBOSdk/+eV2PGMSLb41SD1WQSOG
	gxI9b5OUrXaVLAbl7HjVRZ4awHwLFkY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-MsqpqWr7N0OxpP2Kh6XjIw-1; Fri, 03 Sep 2021 13:46:07 -0400
X-MC-Unique: MsqpqWr7N0OxpP2Kh6XjIw-1
Received: by mail-wr1-f72.google.com with SMTP id p18-20020a5d4e12000000b0015940dc586aso1821507wrt.6
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gZ88+NQf7Dpg62xRnIhpn8RZKl/GOm/FncpeFehqzR4=;
        b=CPhg1QyZ2EkbAWSAzcM0AzFxKrKImNCs9/hVtfX2FErpvMnbv0JBI+94rkVN6IMDlr
         cjxdgy+SEjnGR39swP/Dg7JJggj7EJi+Bc2UfwpNiiE+DfAVtODfSvyC1eA8br4kJDNm
         TCwrNYZK4KtE4KLz6jkXwfLHdcwqJHNfWQ4paDJiqtrqBTV2Ufb8vOlQWqW17TJdWXIp
         CjAbIxNQjUUnrIJA4ozVipwfAZYjmqzVwZxtd3BIu+7Ga1oMcZz+7TxPZOIuGN+NGleT
         7xX6oOHSChYurmOMYYYEXtVZTZXBJaoNxXZ9eb0S2WfpD9FVQ/SWV1hTaaIrpK0hlxvH
         j17w==
X-Gm-Message-State: AOAM5335O9cJcrnV3ZYwKn8j3ptu741YG3G9leuu8tplkfy00kIJflRI
	6wdsQRQHNzL3Evzeoy0IM5a1//pXm0ggHlG0O3xIVpLe8emGvcwyQ+lMoyumgCR4AxGbXD5D3AV
	IHy7azA40OnWlxjlA
X-Received: by 2002:a7b:c351:: with SMTP id l17mr37208wmj.120.1630691166014;
        Fri, 03 Sep 2021 10:46:06 -0700 (PDT)
X-Received: by 2002:a7b:c351:: with SMTP id l17mr37191wmj.120.1630691165825;
        Fri, 03 Sep 2021 10:46:05 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id z2sm17928wma.45.2021.09.03.10.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:46:05 -0700 (PDT)
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
Subject: [PATCH v3 10/28] hw/core/machine: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:52 +0200
Message-Id: <20210903174510.751630-11-philmd@redhat.com>
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
X-TUID: ge+qR5eHkNDZ

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
 hw/core/machine.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 067f42b528f..c3e5371b177 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -615,8 +615,8 @@ HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine)
 
         cpu_item->type = g_strdup(machine->possible_cpus->cpus[i].type);
         cpu_item->vcpus_count = machine->possible_cpus->cpus[i].vcpus_count;
-        cpu_item->props = g_memdup(&machine->possible_cpus->cpus[i].props,
-                                   sizeof(*cpu_item->props));
+        cpu_item->props = g_memdup2(&machine->possible_cpus->cpus[i].props,
+                                    sizeof(*cpu_item->props));
 
         cpu = machine->possible_cpus->cpus[i].cpu;
         if (cpu) {
-- 
2.31.1
