Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1060144lfq;
        Thu, 10 Sep 2020 00:01:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZkxgQOF6VBVAVpraS8evft1xjgsjHzx74Sl+PeweNB9lVqQavMEeAU/MbFr0PASnjwoGd
X-Received: by 2002:a17:906:9491:: with SMTP id t17mr7671118ejx.253.1599721317657;
        Thu, 10 Sep 2020 00:01:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599721317; cv=none;
        d=google.com; s=arc-20160816;
        b=zs6AUkWoGTBnFCX8121lBaZb1E2oYOQuXVNZvfGZ0EABQ0DNfvrmwR42LAYusmCnlF
         Ca6EV1Atali3VEHkZLgWsVqqiJr/HLwaNDhG6IH5LFziesg7kJDuxnpH0zaaXGS++TyV
         abvRRR2MY72G3txA4hBx9nB6PPFFBpVb6ZC14+NeKvAV6upf5jQ9JXKDcTH3pXMs9qXF
         fD97A4y5RqOLsL3qTzVMMG2+v21JqezE5+4969tMj0Tp7ehZAtjXZuW/7QXHdTdPhmyE
         EPMRB7qRl1HC2rxeP2Kp1+mIxe+IU6Z1Epk3WILhRns8ZmvO3fm2OtNMGFVnGQxCUxmT
         8w6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tLJtjbF1Sn9R0haF3xV7HnFQaxPu+haN5ye/cmISEq4=;
        b=OdzyMT1797lLHlKktK0pKM0Xxef2VWiULevsWTJA/EUaUlLn22yWNQr2DU6+M9hp/i
         m9vdlqHIjqKO0uA47dO2ZYzte/whRm2sI/e3NVtRlx+Qhfc/NUu6GLOAJkxtwUwHD6uD
         2B/0wcffQKFbugvGEz5y3iqUFN+G9uxx55TGmRgpzOhgBgXdA9BlkphzPypDz8L3Y5Oi
         M2ZgzWVNQC/FZ2BOZfbE794qG/7HvrGSb9qgNU3wACmymM+tLiT40esVB/9yNZLzZXge
         bwQr8ul24JLkr5QdWuEjR6r5xWJlJXHJIfPQ5AjIpMxzx3PMJvVg+/TiGwtSKGIFBuJU
         f8SA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TrxS+4zH;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id q25si3153535edb.467.2020.09.10.00.01.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Sep 2020 00:01:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TrxS+4zH;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599721316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tLJtjbF1Sn9R0haF3xV7HnFQaxPu+haN5ye/cmISEq4=;
	b=TrxS+4zHj3gLTE/lhdybqFzS3xouImV4qx1j3MwfOV3UPiQCjENZS0S3YXXOZb+ZGY4w2S
	dHfQPXyrnMFVCzDa9Tc2krC7C9j4Mo6siiJm5FNjXZBUEf+DW94mFxWq2ANqqlWQUs4d4s
	M6A2eYe1PouvXuPNB3Nw1sffLCLccdY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-u1yG7bg3OrihFLjXbLFJnQ-1; Thu, 10 Sep 2020 03:01:52 -0400
X-MC-Unique: u1yG7bg3OrihFLjXbLFJnQ-1
Received: by mail-wr1-f72.google.com with SMTP id a10so1863115wrw.22
        for <alex.bennee@linaro.org>; Thu, 10 Sep 2020 00:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tLJtjbF1Sn9R0haF3xV7HnFQaxPu+haN5ye/cmISEq4=;
        b=dDXKHx2JpCIZlZISPEm3aQBr/eur78Q/aFRupxA6ozVIaxVki7mhnRJyo2HNAshO9K
         MV9cxVkJmeT4Owdg92FuylUjE5qg5isBlpQQL+KAjibJPqEc5X6F930tgwraxohVrjbE
         k0UIm5x8djLQdhyxlndmKNO3wGHFthUYwl+/c3RpzWyvVcSlcODmAB/sRm9NPXK1JBUy
         jVLsV8AqOpjnx/O9o6zXfPeEpzBB80okYqp3xI/LlVD59PROl5vTa++SxTwpx1/4Ygct
         vIjYof+W8FSH+qRLwZvER8mloDcvkHchCCpkAXMFkSJ8EI3ocs1K2cpet8w39qR7LIiG
         Pxbw==
X-Gm-Message-State: AOAM530mfPoY610OpK20zYlR/9L6S1CTEjy2/q8r8+DEfR2c2qVVHHe3
	6296rbxFbLxCv/N4f/Nc2Ko6Cb8sU+WZctF/JdhrGDPk6bdv3iAMeGJH+YqbzMvJa9xj71hZBGg
	Xk69DZTfKdtCs9riC
X-Received: by 2002:a5d:4ccb:: with SMTP id c11mr7278658wrt.159.1599721311425;
        Thu, 10 Sep 2020 00:01:51 -0700 (PDT)
X-Received: by 2002:a5d:4ccb:: with SMTP id c11mr7278646wrt.159.1599721311241;
        Thu, 10 Sep 2020 00:01:51 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (65.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.65])
        by smtp.gmail.com with ESMTPSA id n21sm2230672wmi.21.2020.09.10.00.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 00:01:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	Jason Wang <jasowang@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	qemu-trivial@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 3/6] hw/dma/xilinx_axidma: Rename StreamSlave as StreamSink
Date: Thu, 10 Sep 2020 09:01:28 +0200
Message-Id: <20200910070131.435543-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200910070131.435543-1-philmd@redhat.com>
References: <20200910070131.435543-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: yCbZ3LD89cYp

In order to use inclusive terminology, rename 'slave stream'
as 'sink stream'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/dma/xilinx_axidma.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index cf12a852ea1..19e14a2997e 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -46,11 +46,11 @@
      OBJECT_CHECK(XilinxAXIDMA, (obj), TYPE_XILINX_AXI_DMA)
 
 #define XILINX_AXI_DMA_DATA_STREAM(obj) \
-     OBJECT_CHECK(XilinxAXIDMAStreamSlave, (obj),\
+     OBJECT_CHECK(XilinxAXIDMAStreamSink, (obj),\
      TYPE_XILINX_AXI_DMA_DATA_STREAM)
 
 #define XILINX_AXI_DMA_CONTROL_STREAM(obj) \
-     OBJECT_CHECK(XilinxAXIDMAStreamSlave, (obj),\
+     OBJECT_CHECK(XilinxAXIDMAStreamSink, (obj),\
      TYPE_XILINX_AXI_DMA_CONTROL_STREAM)
 
 #define R_DMACR             (0x00 / 4)
@@ -63,7 +63,7 @@
 #define CONTROL_PAYLOAD_SIZE (CONTROL_PAYLOAD_WORDS * (sizeof(uint32_t)))
 
 typedef struct XilinxAXIDMA XilinxAXIDMA;
-typedef struct XilinxAXIDMAStreamSlave XilinxAXIDMAStreamSlave;
+typedef struct XilinxAXIDMAStreamSink XilinxAXIDMAStreamSink;
 
 enum {
     DMACR_RUNSTOP = 1,
@@ -118,7 +118,7 @@ struct Stream {
     unsigned char txbuf[16 * 1024];
 };
 
-struct XilinxAXIDMAStreamSlave {
+struct XilinxAXIDMAStreamSink {
     Object parent;
 
     struct XilinxAXIDMA *dma;
@@ -133,8 +133,8 @@ struct XilinxAXIDMA {
     uint32_t freqhz;
     StreamSink *tx_data_dev;
     StreamSink *tx_control_dev;
-    XilinxAXIDMAStreamSlave rx_data_dev;
-    XilinxAXIDMAStreamSlave rx_control_dev;
+    XilinxAXIDMAStreamSink rx_data_dev;
+    XilinxAXIDMAStreamSink rx_control_dev;
 
     struct Stream streams[2];
 
@@ -390,7 +390,7 @@ static size_t
 xilinx_axidma_control_stream_push(StreamSink *obj, unsigned char *buf,
                                   size_t len, bool eop)
 {
-    XilinxAXIDMAStreamSlave *cs = XILINX_AXI_DMA_CONTROL_STREAM(obj);
+    XilinxAXIDMAStreamSink *cs = XILINX_AXI_DMA_CONTROL_STREAM(obj);
     struct Stream *s = &cs->dma->streams[1];
 
     if (len != CONTROL_PAYLOAD_SIZE) {
@@ -407,7 +407,7 @@ xilinx_axidma_data_stream_can_push(StreamSink *obj,
                                    StreamCanPushNotifyFn notify,
                                    void *notify_opaque)
 {
-    XilinxAXIDMAStreamSlave *ds = XILINX_AXI_DMA_DATA_STREAM(obj);
+    XilinxAXIDMAStreamSink *ds = XILINX_AXI_DMA_DATA_STREAM(obj);
     struct Stream *s = &ds->dma->streams[1];
 
     if (!stream_running(s) || stream_idle(s)) {
@@ -423,7 +423,7 @@ static size_t
 xilinx_axidma_data_stream_push(StreamSink *obj, unsigned char *buf, size_t len,
                                bool eop)
 {
-    XilinxAXIDMAStreamSlave *ds = XILINX_AXI_DMA_DATA_STREAM(obj);
+    XilinxAXIDMAStreamSink *ds = XILINX_AXI_DMA_DATA_STREAM(obj);
     struct Stream *s = &ds->dma->streams[1];
     size_t ret;
 
@@ -534,8 +534,8 @@ static const MemoryRegionOps axidma_ops = {
 static void xilinx_axidma_realize(DeviceState *dev, Error **errp)
 {
     XilinxAXIDMA *s = XILINX_AXI_DMA(dev);
-    XilinxAXIDMAStreamSlave *ds = XILINX_AXI_DMA_DATA_STREAM(&s->rx_data_dev);
-    XilinxAXIDMAStreamSlave *cs = XILINX_AXI_DMA_CONTROL_STREAM(
+    XilinxAXIDMAStreamSink *ds = XILINX_AXI_DMA_DATA_STREAM(&s->rx_data_dev);
+    XilinxAXIDMAStreamSink *cs = XILINX_AXI_DMA_CONTROL_STREAM(
                                                             &s->rx_control_dev);
     int i;
 
@@ -634,7 +634,7 @@ static const TypeInfo axidma_info = {
 static const TypeInfo xilinx_axidma_data_stream_info = {
     .name          = TYPE_XILINX_AXI_DMA_DATA_STREAM,
     .parent        = TYPE_OBJECT,
-    .instance_size = sizeof(struct XilinxAXIDMAStreamSlave),
+    .instance_size = sizeof(struct XilinxAXIDMAStreamSink),
     .class_init    = xilinx_axidma_stream_class_init,
     .class_data    = &xilinx_axidma_data_stream_class,
     .interfaces = (InterfaceInfo[]) {
@@ -646,7 +646,7 @@ static const TypeInfo xilinx_axidma_data_stream_info = {
 static const TypeInfo xilinx_axidma_control_stream_info = {
     .name          = TYPE_XILINX_AXI_DMA_CONTROL_STREAM,
     .parent        = TYPE_OBJECT,
-    .instance_size = sizeof(struct XilinxAXIDMAStreamSlave),
+    .instance_size = sizeof(struct XilinxAXIDMAStreamSink),
     .class_init    = xilinx_axidma_stream_class_init,
     .class_data    = &xilinx_axidma_control_stream_class,
     .interfaces = (InterfaceInfo[]) {
-- 
2.26.2
