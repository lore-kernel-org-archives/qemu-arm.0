Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1511537lfb;
        Fri, 3 Sep 2021 10:40:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/ZJ0OHJl+74ZsYJ5xejzMK82zZFI/wkc3rs6hUnNvOvOwo5Px4lh7us+7HF9gJTF2jrHR
X-Received: by 2002:a17:906:3157:: with SMTP id e23mr2808eje.29.1630690821221;
        Fri, 03 Sep 2021 10:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630690821; cv=none;
        d=google.com; s=arc-20160816;
        b=keWD+LZFsSU9fL9JqbY7Sp4L+q9MAPybnQXVZGspAwnptiC7szFJewZZCcySY7oabg
         Q5eD01WipYHgoxJm0D823dngDVHOYO9KYxB5Ya8pVvvgMPrHaGv3N44CdLsRTibHmTAo
         gGN49APZcxlbSpQBrK08i7Lr7kY/X8dxudJSOOHFNPe67ER1cRMLBwFIcy2Jldn8XfHu
         Y7FI/IvKqwRNjA368tGJm+qtWgFDeMJxiLbD7DwS6TFtsM3EaSxYzUCYr2U87DStNqYt
         FEaK5q2ZvRJ9hc/0wwtLVKRLjtmcpU6dgAbeE6A4N5/ta+lOEmpXK4ISN/mKa7RbAOab
         oYAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=K59TWFNfhgS3efbWdzQjx6xmDgV9ebFReZvuleU1Sck=;
        b=QsUaQ7hMluiVFrGM9DBgsNVHqruC2rbQPBtiGQ8g5XJVNtL8pW1eYkkNKnhysb/mi2
         eNJjvDDZy0K2vcoxXYno0ilYQ392+uumrXuvVX5ZboXAEq8AjCvqELiBRsRSGe8IS8AF
         PNjjiK3OhkZb6FE8HYASJoGK0w87lAp6uPvyVC67HHDKndp3HnKoBG4JLZ8Wf5JmP7JW
         EfSnvlIV16OoNumEmK8Cv+WRPUeTwll2f5CbwHsdimQy+D2tnnHggE2S1HewKDShFxdJ
         RNhKz61kFB7xOQffcc18LtaNUjH+MhTHw1B8UFcz4BgF3RbmDgPmTOB6daGNkHDxl8m3
         riWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f88voKY9;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id s9si139983edh.323.2021.09.03.10.40.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:40:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f88voKY9;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630690820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K59TWFNfhgS3efbWdzQjx6xmDgV9ebFReZvuleU1Sck=;
	b=f88voKY9juU1T6llL9ytNq7KD9cx51B3zLwhENTa4hpoaysUhROvBKCpleMclg9yppOea4
	D4y0OfXk5k4PpWO4r7J++amODNSw5SDpEy0GhzR+VjZ+R8P+1ZWQ7d/LVtFbGu53GGt+jj
	sney3BU7hMmxzTUG811QoINtKxnO/kg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-phYo-EOOOCSSHGVopy3orQ-1; Fri, 03 Sep 2021 13:40:16 -0400
X-MC-Unique: phYo-EOOOCSSHGVopy3orQ-1
Received: by mail-wm1-f71.google.com with SMTP id y188-20020a1c7dc5000000b002e80e0b2f87so52373wmc.1
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K59TWFNfhgS3efbWdzQjx6xmDgV9ebFReZvuleU1Sck=;
        b=dv2xMYPbT2NzuzgDTxtezJ9Psr54jjpI1QMZXh4AfINoLIRd0NqPcy5QzC9KHsT7nc
         JrfLEHYDA1NV2jLSkjdShWYmIOvKFPNjClhbaj5xbnr2vKTWmaMfd6UlfxNgAUaLKA5T
         K5VNjdNjR3b9SMEhfRLNQ+XCR5Z8gf+iKsPGJAiOi1ZbEQRa4Dt1S5sZ2kU09b71TDTT
         vyJaYxlgYyxJn/Uij5ryufwd/HQ3vZ6/AuIDFER/Vwt8NB6875qMC7rE1sVIe/MVFuoU
         sr34303F/kqhTJDTa89lWuVoRpKqi5X/E8aXZfwvsZ0pkAJ3K2DggwJnC5yHfKrpSecB
         EwAQ==
X-Gm-Message-State: AOAM531gwY9cxd+cbtDQHAu8ChTOTBd3GR9hVDbWRNKUZOBh1kno8Deu
	aoshKb1rQqn3JVnzLCqarrKToxGxmbKH+0HPgJiw9k+OiqwEvdoNUqoaZhd7ky58WLrdv3gfwex
	4DWnWj5klTTnSlsaU
X-Received: by 2002:a5d:618f:: with SMTP id j15mr279338wru.80.1630690815539;
        Fri, 03 Sep 2021 10:40:15 -0700 (PDT)
X-Received: by 2002:a5d:618f:: with SMTP id j15mr279319wru.80.1630690815396;
        Fri, 03 Sep 2021 10:40:15 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id l15sm46863wms.38.2021.09.03.10.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:40:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	qemu-ppc@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-block@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 01/30] hw/hyperv/vmbus: Remove unused vmbus_load/save_req()
Date: Fri,  3 Sep 2021 19:39:39 +0200
Message-Id: <20210903174008.749126-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903174008.749126-1-philmd@redhat.com>
References: <20210903174008.749126-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: wwHyxHCV91ip

vmbus_save_req() and vmbus_load_req() are not used.
Remove them to avoid maintaining dead code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/hyperv/vmbus.h |  3 --
 hw/hyperv/vmbus.c         | 59 ---------------------------------------
 2 files changed, 62 deletions(-)

diff --git a/include/hw/hyperv/vmbus.h b/include/hw/hyperv/vmbus.h
index f98bea3888d..8ea660dd8e6 100644
--- a/include/hw/hyperv/vmbus.h
+++ b/include/hw/hyperv/vmbus.h
@@ -223,7 +223,4 @@ int vmbus_map_sgl(VMBusChanReq *req, DMADirection dir, struct iovec *iov,
 void vmbus_unmap_sgl(VMBusChanReq *req, DMADirection dir, struct iovec *iov,
                      unsigned iov_cnt, size_t accessed);
 
-void vmbus_save_req(QEMUFile *f, VMBusChanReq *req);
-void *vmbus_load_req(QEMUFile *f, VMBusDevice *dev, uint32_t size);
-
 #endif
diff --git a/hw/hyperv/vmbus.c b/hw/hyperv/vmbus.c
index c9887d5a7bc..18d3c3b9240 100644
--- a/hw/hyperv/vmbus.c
+++ b/hw/hyperv/vmbus.c
@@ -1311,65 +1311,6 @@ static const VMStateDescription vmstate_vmbus_chan_req = {
     }
 };
 
-void vmbus_save_req(QEMUFile *f, VMBusChanReq *req)
-{
-    VMBusChanReqSave req_save;
-
-    req_save.chan_idx = req->chan->subchan_idx;
-    req_save.pkt_type = req->pkt_type;
-    req_save.msglen = req->msglen;
-    req_save.msg = req->msg;
-    req_save.transaction_id = req->transaction_id;
-    req_save.need_comp = req->need_comp;
-    req_save.num = req->sgl.nsg;
-    req_save.sgl = g_memdup(req->sgl.sg,
-                            req_save.num * sizeof(ScatterGatherEntry));
-
-    vmstate_save_state(f, &vmstate_vmbus_chan_req, &req_save, NULL);
-
-    g_free(req_save.sgl);
-}
-
-void *vmbus_load_req(QEMUFile *f, VMBusDevice *dev, uint32_t size)
-{
-    VMBusChanReqSave req_save;
-    VMBusChanReq *req = NULL;
-    VMBusChannel *chan = NULL;
-    uint32_t i;
-
-    vmstate_load_state(f, &vmstate_vmbus_chan_req, &req_save, 0);
-
-    if (req_save.chan_idx >= dev->num_channels) {
-        error_report("%s: %u(chan_idx) > %u(num_channels)", __func__,
-                     req_save.chan_idx, dev->num_channels);
-        goto out;
-    }
-    chan = &dev->channels[req_save.chan_idx];
-
-    if (vmbus_channel_reserve(chan, 0, req_save.msglen)) {
-        goto out;
-    }
-
-    req = vmbus_alloc_req(chan, size, req_save.pkt_type, req_save.msglen,
-                          req_save.transaction_id, req_save.need_comp);
-    if (req_save.msglen) {
-        memcpy(req->msg, req_save.msg, req_save.msglen);
-    }
-
-    for (i = 0; i < req_save.num; i++) {
-        qemu_sglist_add(&req->sgl, req_save.sgl[i].base, req_save.sgl[i].len);
-    }
-
-out:
-    if (req_save.msglen) {
-        g_free(req_save.msg);
-    }
-    if (req_save.num) {
-        g_free(req_save.sgl);
-    }
-    return req;
-}
-
 static void channel_event_cb(EventNotifier *e)
 {
     VMBusChannel *chan = container_of(e, VMBusChannel, notifier);
-- 
2.31.1
