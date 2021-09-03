Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1174659lfb;
        Fri, 3 Sep 2021 04:08:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwu6LDFEBCxUbTqSALeUrbGY/rrdEVQyop67y2IT3Vn151gvyYT9+ynkAkJFMR/6S3sZyUM
X-Received: by 2002:a50:99cc:: with SMTP id n12mr3450504edb.53.1630667316590;
        Fri, 03 Sep 2021 04:08:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667316; cv=none;
        d=google.com; s=arc-20160816;
        b=ZJ631KA7YdEE/ucwiyB7JF0NWgdFaqVk6345zOOV8UCZeDsoggYn3WZ/aCUfgBFWt8
         EutbVycufqiyiDo4+RJfq3QQtqO1i5zgvMrstUtyGV2WNlWbZ2A4FqO4V1eBpuKWY38W
         7Co0hc4N6Huglxge7l9EEJHlQLEnNLyuorDbf4cmtGhcYqH3NJKp0PuVINAa1YZgCMt4
         qj8tV7O8skmDNJ85kIwOO5CJt5OwGyuQEpaj5jX8PpPqawpzfSPF3PEXFYMOUlyNnTR1
         ZWFOxW+Z/RPttj4d2jxAkOw5R6uIL8sL5WfxgjL1ROjplZeyJSk1ZfB1SZMUrPNF4L41
         5low==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=dJwik153XkNmqJfLX2OaJbitNFOzhpORupSCbSGdFBs=;
        b=n2tYJz6nPtzY9bU+PfzOds+ljMSEPEuEYkUW2jrAR83DbczpIpGejWOggQS9AZrER0
         GpqwDX9yodh5jHDydvxehmGBcywjoUo2apaLmS0xADsv6194vP2xqa84abasbGeNSvqz
         4cNl3aUAEW6ABrU0xGnDvRD4luEIUgxNKITBrfo6dZI+gQzL8Ua+YJF6vtalThcROkPi
         af6GPgBR/8fO4iYPUIdIS7IyVQbW9Z5DC9CRcdqF3MFnbPLmsc7iVP0rrShTmd9khfTv
         HLKqDPMg+YEBx4v6CGcSao2G2KY9fQFnXuvrVaiGrEdqzsOMzt4GfYBRgyYeIlSiG8Ut
         5+Qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AoTrR8Us;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id x15si5395268edd.328.2021.09.03.04.08.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:08:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AoTrR8Us;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dJwik153XkNmqJfLX2OaJbitNFOzhpORupSCbSGdFBs=;
	b=AoTrR8UsPuhWiV7yvy7ftPfmSa3h9u5mAFt1wW6xaFYI87luPlEwkRVlT/IPzgVmn0VTeB
	5Yrk/AgdLtgDPLDtbPlTke5CYLTXvbKi1rO5aHaxL5gwm/yTx9EwV4Mq8T2LH8kjToPCQL
	YmjEX8PQMicgp1xxjQV894uupRg8Gbg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-K0iptHkkMvWLmKEtQh2nmQ-1; Fri, 03 Sep 2021 07:08:32 -0400
X-MC-Unique: K0iptHkkMvWLmKEtQh2nmQ-1
Received: by mail-wr1-f72.google.com with SMTP id y13-20020adfe6cd000000b00159694c711dso261415wrm.17
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 04:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dJwik153XkNmqJfLX2OaJbitNFOzhpORupSCbSGdFBs=;
        b=k3yyeJS/zi8l7R3oGN3Ky2EgHwuIBRNES3SMpM5eF8xszylHEEpqulcJiCPU3ubzD7
         E1wE/FV2i518RYETAHgBerrz77HM2deFEOxuZcFwVXmK8S944CNs3GkCKuaYhby3Wseu
         eLXx1IoOkxo6FUYw85wZ0nro3b4bMQwLKxVDfg7s8P2LuLj/7NhZRqvJfPc8ZahO6wMX
         ZVT19kPpsZncqJS+0cDWxo1DJRE+vGDfoheVcsVrRb1Hal8CmXE32ngGql1arneRDGg7
         yOnZhRa4nz7FX4HXR1HrbGxVgOYbNAyG/75HXOwpFB7oFeBHDf6CuXx+N+hRrlQ0hGAA
         +LDw==
X-Gm-Message-State: AOAM532EIopF7RLE6Ukp4iBNCA6UGQ7O3MX2VicvxS1t2kC/flBTgAkG
	Mf9GktMt7QXWrUvoMDoxTGwEIcBn/G65HjvNAEmbo/wBiblhtlPQO+uaXmwgPUvkPBJZsuElAKF
	KyM5gCLy0DOzY2raH
X-Received: by 2002:a1c:3587:: with SMTP id c129mr7583817wma.57.1630667311051;
        Fri, 03 Sep 2021 04:08:31 -0700 (PDT)
X-Received: by 2002:a1c:3587:: with SMTP id c129mr7583780wma.57.1630667310694;
        Fri, 03 Sep 2021 04:08:30 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id x21sm890930wmc.14.2021.09.03.04.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:08:30 -0700 (PDT)
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
Subject: [PATCH 15/28] hw/scsi/mptsas: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:49 +0200
Message-Id: <20210903110702.588291-16-philmd@redhat.com>
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
X-TUID: DWsH5BZUKZuQ

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
 hw/scsi/mptsas.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index db3219e7d20..d05735d3e11 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -449,7 +449,8 @@ static void mptsas_process_scsi_task_mgmt(MPTSASState *s, MPIMsgSCSITaskMgmt *re
             } else {
                 MPTSASCancelNotifier *notifier;
 
-                reply_async = g_memdup(&reply, sizeof(MPIMsgSCSITaskMgmtReply));
+                reply_async = g_memdup2_qemu(&reply,
+                                             sizeof(MPIMsgSCSITaskMgmtReply));
                 reply_async->IOCLogInfo = INT_MAX;
 
                 count = 1;
@@ -476,7 +477,7 @@ static void mptsas_process_scsi_task_mgmt(MPTSASState *s, MPIMsgSCSITaskMgmt *re
             goto out;
         }
 
-        reply_async = g_memdup(&reply, sizeof(MPIMsgSCSITaskMgmtReply));
+        reply_async = g_memdup2_qemu(&reply, sizeof(MPIMsgSCSITaskMgmtReply));
         reply_async->IOCLogInfo = INT_MAX;
 
         count = 0;
-- 
2.31.1
