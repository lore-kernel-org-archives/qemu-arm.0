Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1173430lfb;
        Fri, 3 Sep 2021 04:07:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylJp1h8QLZqbP6VcjCaa6smt3cT8JQdfyi6drpzAKuVf3nqE/Li/1Q/U6xpUh245zk4oHc
X-Received: by 2002:aa7:d859:: with SMTP id f25mr3367524eds.247.1630667235501;
        Fri, 03 Sep 2021 04:07:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667235; cv=none;
        d=google.com; s=arc-20160816;
        b=u1ayBoRTE/hyrnBS6HxsWnQuv3mBNDmt04dVKRREPhnGPOHNwuMQbU7WO+gdtObQbm
         rbPeE6AyfKXXKbzYkhmhqPacUqFoMDDbBBpxwpxouZLM+JSMZKPfqEkir57m7uUGQ3oM
         BcYoKiPtxUS8He/G2ktF+AsAqkEIoasvMpFeukZzLsIAs+kuNc892kCNoyWpfFsSPHrE
         A53FtmMElGaec/p//XQMcVF8hKjBEhbndmpDkBkrg7hgZqIrhayan4l/uz/ujW4wMAeI
         VlKloxR0QKGFzlOFdXps1kWaU65ZGPAOhK4RPCpITiSEFm08hb02s+oSWWJBDHEONw59
         Ddaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=K59TWFNfhgS3efbWdzQjx6xmDgV9ebFReZvuleU1Sck=;
        b=XZ6x697e6HALTGh+ekHdRTp9Zqu57+t410tGzwMTiUIhPANfoNFOu+qpXTBbIqzwLd
         ikPKJU7AyBBrYfuQHeiIjXifVmljocOm7aI6HthQbPM0w9beIPfeAu29PGrdEggnOHCh
         yFmbKRxYYQvfs7rxPOa5L60y5ytzD015aHtg6qfzLyGuoMZ+5HgLvYZs8Pc33EQHY/xH
         Sie7GnsR9OCLTuW90nXN9n9a9ClQgX8d1Uxnkw0QHpxpvXqrGcQL+v6elH5xYFICzXcM
         jkb+c3aXDnL49mYxO7On8JyijOuabzYberjTD9Nbv1pvZNLL3/NoWwsPLAZcjHlKDStg
         k3FQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VI1FlFkQ;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id c25si5268723edy.95.2021.09.03.04.07.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:07:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VI1FlFkQ;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K59TWFNfhgS3efbWdzQjx6xmDgV9ebFReZvuleU1Sck=;
	b=VI1FlFkQ40Pp4Hhjgab4vXQWuxpOBXuoLGuzYlLwXcnCEL0c2btDLpBmhaKkxlilSQFL6I
	dc7Si49tFDYV8GsH8GBrMMYWCvRSEe9L0il+kjZb/UId7z5Fn0yWp8jbC9rXHtjWtUNmUo
	LxxhUgChahHe1a8nWcsE8Epgq0Eqswg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-CApoFwFrNwyjK22SvVnZfw-1; Fri, 03 Sep 2021 07:07:13 -0400
X-MC-Unique: CApoFwFrNwyjK22SvVnZfw-1
Received: by mail-wr1-f72.google.com with SMTP id b8-20020a5d5508000000b001574e8e9237so1456630wrv.16
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 04:07:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K59TWFNfhgS3efbWdzQjx6xmDgV9ebFReZvuleU1Sck=;
        b=i97L5LSL1jcvYhACmNy3Myo+OVkJMGViTMzTZ+nROui1/qjqE5Kr0kMkBVTAl9+Y2F
         XR5pjsmAYD10iocTSbrWHvyZxHH69/onnVbvesrzPNrn8rQxn26TevTJcxeCDDmBUOUC
         W/JyZSHFp6MOL5Doxp79wJkziwpPxhNcYrx8TkV+9ZckEDNZwDP4by+CHK9jUMk6hWQa
         RqszTr4YAJX8NhZcAy+93HUce6U8rrEDG+yHX21wYbgOeFElYIM88Pxmks1XR1Sfpfw3
         rkvv3X0S1u1qH48cmJjr+s5ayQyeQ7i7DWZPqMUv5RmTzptWMI38VIq1vQ42ByZnF1YU
         5mZw==
X-Gm-Message-State: AOAM532mTQbY1Ix3s7jAZJQGB8uD53ECKhegNxBWI7temPGH7djdAhFx
	uDPzGzaNhRetz6/yMwFFXaAGJi9u98NvtGBgdljDv3elINR2tdEsavmcfoZp08eouvdo0jKByZR
	aStKjvse5ZTdZ/UZu
X-Received: by 2002:adf:d0c3:: with SMTP id z3mr3510213wrh.108.1630667232030;
        Fri, 03 Sep 2021 04:07:12 -0700 (PDT)
X-Received: by 2002:adf:d0c3:: with SMTP id z3mr3510188wrh.108.1630667231886;
        Fri, 03 Sep 2021 04:07:11 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id j207sm4380948wmj.40.2021.09.03.04.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:07:11 -0700 (PDT)
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
Subject: [PATCH 01/28] hw/hyperv/vmbus: Remove unused vmbus_load/save_req()
Date: Fri,  3 Sep 2021 13:06:35 +0200
Message-Id: <20210903110702.588291-2-philmd@redhat.com>
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
X-TUID: AAMtUoCouPcO

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
