Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1514960lfb;
        Fri, 3 Sep 2021 10:45:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTZDafAOhvsBzvBlgwBd1EVxy1q+OvymCD1kPOsepLcCYkQMzRw8OXAvSGIyzyiPe7B930
X-Received: by 2002:a17:906:9a4e:: with SMTP id aj14mr77234ejc.84.1630691121663;
        Fri, 03 Sep 2021 10:45:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691121; cv=none;
        d=google.com; s=arc-20160816;
        b=t56dZYWRkouwRtx9pvyIobf4211FCix9LrKsPchbi/aiMWHZNLe/DKcfGvON/4z5U5
         fzo4+FHy2WTOWc3ORz3PjIOkeoDIudvqC9QKHvwpfzZ/5qoUmag5AxXpCrYhOi/ufM2A
         2g7EWaBAu6SotYJ9urr5ZH2dkCg3tNQECf4cyRypEJ3HSVyvh+IW+IyJw3twffYJHtXv
         L9T6/kJjuzJFRDwX8+7/d1/HT7txFgB9IWwr1CnxeptuGsoFTz5PSEqeBt82S6hYUT6b
         PDW9+nBNRIS8DfZusqEurHdjl33N+TptWZpqvW3eyrxzS3qFAWbT44JkRkJE890LvEuU
         mLvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=K59TWFNfhgS3efbWdzQjx6xmDgV9ebFReZvuleU1Sck=;
        b=IIjG2lg8OYIHXcu5hqrpcrM4E7ctY1rAEWDxLn/QRe/Mj0rQXmy+qYv1PULVNOC67H
         CQB4ZlgFc7GAn7YKV4y5eDv+OvhHQH/XAshZHpBkI/pIjOiUVkbNtwLdMyZSoVRGLbUs
         bx+6fgScBuSflbiFsJxdmFrlz6QeeFHk1AZ7A0aYiAPvAy5dkWoIwpzV3jlxRm4MCCDg
         WW3xezNm+CTaxQdZ8rqQSUKLHEbdgn0GyzRTX7sd5K3LmpkZ7c116CPcxX8bXZXgnLKH
         qmuzl3Hko+X8lKzszay7+McwmmRXiUIYChUWGPeAaUXeeKGfgAr2y0fzVuKDw/8A7yNh
         rWSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Nr+bJgHh;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id i11si207924edb.418.2021.09.03.10.45.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:45:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Nr+bJgHh;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K59TWFNfhgS3efbWdzQjx6xmDgV9ebFReZvuleU1Sck=;
	b=Nr+bJgHh9BeBU8We15v74E73D9PlWpIhUYiJU5nUApjLx1AbiEGRhMLssNT6ypFpU+1CQT
	1V92Op9JpIQOLxe/GRW9SKILEQgxlaAYXh1OpMyA4L2DDd4/4gWgIyzUH4RfcecQCFBq/M
	irO8niW13SscFe2wLUasduqAHbBW4iM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-yll8UkxBMjCD58T5s0d6lA-1; Fri, 03 Sep 2021 13:45:19 -0400
X-MC-Unique: yll8UkxBMjCD58T5s0d6lA-1
Received: by mail-wm1-f72.google.com with SMTP id n16-20020a1c7210000000b002ea2ed60dc6so52498wmc.0
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K59TWFNfhgS3efbWdzQjx6xmDgV9ebFReZvuleU1Sck=;
        b=T5B+GZzKXaEjsQlVQipArRSfhO0HmhAKVfqPI6lULwudgFdfx8wCGxaVGmwicZLqKG
         Eg7jKgUzjFLGiqEQ2vhMOeqU9VGwSAVEjFSRaS49cO+GIorSWT6TcTOl5EOtQmYpTg1x
         lPFQKLftX9CcLFARIgN26T8qsqf0tJYS4FdbJTOEdBOvdxSUXclkSx3yb6bNee0IGZo9
         tuP/5N89QAP3s8bHpyBnoA/AJkNO/J7jFdwdH7/SOcPXTF5lkWMUR4YVUruTLxbVKXBr
         nXYZvGI7eixlSme6NU9eJQCPFbkcH4sUFj2uY4Og6aMCoXqDXpaHf3gfv9+CgkSwB44F
         +yVg==
X-Gm-Message-State: AOAM530c0qpshSxu7h7A+OGvpIysYHWHOZNlzphEMm6Z0FEvRBoHzN2F
	o5qEuAa7q2wVhcHxFmPrLeuJeFJ5o7xcCdexbJzlYUG5AbWg0wRj/ADYvYHKBF0XOaXdRIwNcYl
	2WTKnwECiBAgRgx4r
X-Received: by 2002:a7b:c94c:: with SMTP id i12mr11412wml.111.1630691118350;
        Fri, 03 Sep 2021 10:45:18 -0700 (PDT)
X-Received: by 2002:a7b:c94c:: with SMTP id i12mr11389wml.111.1630691118170;
        Fri, 03 Sep 2021 10:45:18 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id h16sm5224136wre.52.2021.09.03.10.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:45:17 -0700 (PDT)
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
Subject: [PATCH v3 01/28] hw/hyperv/vmbus: Remove unused vmbus_load/save_req()
Date: Fri,  3 Sep 2021 19:44:43 +0200
Message-Id: <20210903174510.751630-2-philmd@redhat.com>
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
X-TUID: 1BlLa1tSTdCl

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
