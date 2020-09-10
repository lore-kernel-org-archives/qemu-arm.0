Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1060183lfq;
        Thu, 10 Sep 2020 00:02:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8025fD6YfJZjxMr/Bbuwrxk7jLPbjKwrAnNtSqOa8sYsFT/hKyl0kQ00whqQISK+LhPC3
X-Received: by 2002:a25:ec11:: with SMTP id j17mr10673044ybh.509.1599721322270;
        Thu, 10 Sep 2020 00:02:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599721322; cv=none;
        d=google.com; s=arc-20160816;
        b=Hn25J3qis/DlVeB7WRmLv44J0E7QtV+LlgG0qEcGYff+morM3CTjTWW3tEqOQ4ZLCN
         GVdZEA1XHesmHQVcleS8bku/QXYm4uO8BbAoX0+Tfptcj+YFLY19A7jr5M3xYQdD86Wt
         +x+lCBKFmbIpP7PZpMUBJHzdXvmcYQFUKW8h2GVR0hWkZukm4ft5I+s8fxh9aCKZybhg
         Hh9BMNPVybmUXEQjs36whceyrkG4f2uJz0hXuhz8Z1NobnwcI4wdnL2Jv/ZQtkTSRQRq
         hjKgXbWmvTNbTUX/6UneDaLqx5JvfRhWThzfV+KAMdKuok7eBOJpqVSTsKTTgd+hx0BT
         oq2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rOfPlRcHNPnFEFQL04D9b7WV0+f6qJ96Y7nXN27AiJ8=;
        b=0O8nDF+l30ukFgCC+AWyjvFEmL6/D3PZeNziNpcQvKi29hNyBj+4L58PD3E8xvL0S8
         bIDqmzxdSau8UgRTrGMpLTanYMpgDwGc3GbKdXVGSjNR3fLpGgastFbT/YZSPXujw49C
         qHt/LhR8Oi1Iyy4ZQCzZKshNegaQvpN389Tx5foWZ6McebQqjYY/O53oSy1qSB/fPY8v
         X3SptQn/uqMkyuq/kM7YyhtLgUmFLWYAFH2O73kMgKl/s2r6JAxLBjsK1Z4Z0JMj7fZt
         7fFgVy3/4RU7w29y+G1gsVkSvM+2UBuL3dcdH4PMLo0yU7LAuXRGGvvSal1qhev5HOZc
         cPuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E8HoDR1x;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id 132si5152969ybd.436.2020.09.10.00.02.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Sep 2020 00:02:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E8HoDR1x;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599721321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rOfPlRcHNPnFEFQL04D9b7WV0+f6qJ96Y7nXN27AiJ8=;
	b=E8HoDR1xakX1Zi/Tk+P3apWt62fnF/8LzuoaQLhUiPQ1/RxXFiBa6luEkKGd23xnMyXszt
	Qv+xkCpyOiGeFUl7T4zO7XhVARYPNJfltRxIeHJbxdRQksLPZCKmigCWh+pniBgnGJuvQt
	r0hKNROiRD1A8NtlT0pPKCCq/bk0dzo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-h1N9DbMMOB-7MkItVc7Uiw-1; Thu, 10 Sep 2020 03:01:58 -0400
X-MC-Unique: h1N9DbMMOB-7MkItVc7Uiw-1
Received: by mail-wr1-f71.google.com with SMTP id x15so1871041wrm.7
        for <alex.bennee@linaro.org>; Thu, 10 Sep 2020 00:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rOfPlRcHNPnFEFQL04D9b7WV0+f6qJ96Y7nXN27AiJ8=;
        b=QrmeEqKORL53NBuvwEVGJYZqwV0fhj8CbN+L4IiueGo26LhBiZmSrUKXkLIs5v/Nvq
         SBrMLTPuH058DwPNAPbVsrvjfzVYeYCcGgATBA/KT5MYC2eSSqYy4+jFXg0mmdHmyjgv
         JE+1xlXZU0ImswdAqjIimjSYyw67mgxJ2Mw9A/vr4Zj9eCD5deDJDAEX3/irbBvkeCev
         A1fiyrjreXEoBusyK7O5VkP+eAHBTT/HEehfb+R4GnhQ0nil34hl+oOqT3jf+Gcc0p1t
         wrxzs6hgPKzX0tkVk3yzkpTp7GeJpJ5X7EWOMGtqxLU6xHAX/Rl6mLAwyUfnh197WVGt
         N3+g==
X-Gm-Message-State: AOAM531WShTIvP4tJUNcVPoE5KYwGOSdnAALztzsLL8krEAL7aRm03qJ
	K2ZGATcHpGWwLPEWEisL5s/HFNtl2YCL+xKb0jocXxNr78YdzUnNd+5bNovVlxpOqhbx8YGap85
	IrdnLb2V5oTLxb4hB
X-Received: by 2002:adf:e852:: with SMTP id d18mr8003815wrn.40.1599721316985;
        Thu, 10 Sep 2020 00:01:56 -0700 (PDT)
X-Received: by 2002:adf:e852:: with SMTP id d18mr8003791wrn.40.1599721316799;
        Thu, 10 Sep 2020 00:01:56 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (65.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.65])
        by smtp.gmail.com with ESMTPSA id f6sm2615123wme.32.2020.09.10.00.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 00:01:56 -0700 (PDT)
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
Subject: [PATCH 4/6] hw/net/xilinx_axienet: Rename StreamSlave as StreamSink
Date: Thu, 10 Sep 2020 09:01:29 +0200
Message-Id: <20200910070131.435543-5-philmd@redhat.com>
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
X-TUID: l1iyQLQUJm/g

In order to use inclusive terminology, rename 'slave stream'
as 'sink stream'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/net/xilinx_axienet.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index 0c4ac727207..4e48535f373 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -46,11 +46,11 @@
      OBJECT_CHECK(XilinxAXIEnet, (obj), TYPE_XILINX_AXI_ENET)
 
 #define XILINX_AXI_ENET_DATA_STREAM(obj) \
-     OBJECT_CHECK(XilinxAXIEnetStreamSlave, (obj),\
+     OBJECT_CHECK(XilinxAXIEnetStreamSink, (obj),\
      TYPE_XILINX_AXI_ENET_DATA_STREAM)
 
 #define XILINX_AXI_ENET_CONTROL_STREAM(obj) \
-     OBJECT_CHECK(XilinxAXIEnetStreamSlave, (obj),\
+     OBJECT_CHECK(XilinxAXIEnetStreamSink, (obj),\
      TYPE_XILINX_AXI_ENET_CONTROL_STREAM)
 
 /* Advertisement control register. */
@@ -310,10 +310,10 @@ struct TEMAC  {
     void *parent;
 };
 
-typedef struct XilinxAXIEnetStreamSlave XilinxAXIEnetStreamSlave;
+typedef struct XilinxAXIEnetStreamSink XilinxAXIEnetStreamSink;
 typedef struct XilinxAXIEnet XilinxAXIEnet;
 
-struct XilinxAXIEnetStreamSlave {
+struct XilinxAXIEnetStreamSink {
     Object parent;
 
     struct XilinxAXIEnet *enet;
@@ -325,8 +325,8 @@ struct XilinxAXIEnet {
     qemu_irq irq;
     StreamSink *tx_data_dev;
     StreamSink *tx_control_dev;
-    XilinxAXIEnetStreamSlave rx_data_dev;
-    XilinxAXIEnetStreamSlave rx_control_dev;
+    XilinxAXIEnetStreamSink rx_data_dev;
+    XilinxAXIEnetStreamSink rx_control_dev;
     NICState *nic;
     NICConf conf;
 
@@ -859,7 +859,7 @@ xilinx_axienet_control_stream_push(StreamSink *obj, uint8_t *buf, size_t len,
                                    bool eop)
 {
     int i;
-    XilinxAXIEnetStreamSlave *cs = XILINX_AXI_ENET_CONTROL_STREAM(obj);
+    XilinxAXIEnetStreamSink *cs = XILINX_AXI_ENET_CONTROL_STREAM(obj);
     XilinxAXIEnet *s = cs->enet;
 
     assert(eop);
@@ -880,7 +880,7 @@ static size_t
 xilinx_axienet_data_stream_push(StreamSink *obj, uint8_t *buf, size_t size,
                                 bool eop)
 {
-    XilinxAXIEnetStreamSlave *ds = XILINX_AXI_ENET_DATA_STREAM(obj);
+    XilinxAXIEnetStreamSink *ds = XILINX_AXI_ENET_DATA_STREAM(obj);
     XilinxAXIEnet *s = ds->enet;
 
     /* TX enable ?  */
@@ -954,8 +954,8 @@ static NetClientInfo net_xilinx_enet_info = {
 static void xilinx_enet_realize(DeviceState *dev, Error **errp)
 {
     XilinxAXIEnet *s = XILINX_AXI_ENET(dev);
-    XilinxAXIEnetStreamSlave *ds = XILINX_AXI_ENET_DATA_STREAM(&s->rx_data_dev);
-    XilinxAXIEnetStreamSlave *cs = XILINX_AXI_ENET_CONTROL_STREAM(
+    XilinxAXIEnetStreamSink *ds = XILINX_AXI_ENET_DATA_STREAM(&s->rx_data_dev);
+    XilinxAXIEnetStreamSink *cs = XILINX_AXI_ENET_CONTROL_STREAM(
                                                             &s->rx_control_dev);
 
     object_property_add_link(OBJECT(ds), "enet", "xlnx.axi-ethernet",
@@ -1046,7 +1046,7 @@ static const TypeInfo xilinx_enet_info = {
 static const TypeInfo xilinx_enet_data_stream_info = {
     .name          = TYPE_XILINX_AXI_ENET_DATA_STREAM,
     .parent        = TYPE_OBJECT,
-    .instance_size = sizeof(struct XilinxAXIEnetStreamSlave),
+    .instance_size = sizeof(struct XilinxAXIEnetStreamSink),
     .class_init    = xilinx_enet_data_stream_class_init,
     .interfaces = (InterfaceInfo[]) {
             { TYPE_STREAM_SINK },
@@ -1057,7 +1057,7 @@ static const TypeInfo xilinx_enet_data_stream_info = {
 static const TypeInfo xilinx_enet_control_stream_info = {
     .name          = TYPE_XILINX_AXI_ENET_CONTROL_STREAM,
     .parent        = TYPE_OBJECT,
-    .instance_size = sizeof(struct XilinxAXIEnetStreamSlave),
+    .instance_size = sizeof(struct XilinxAXIEnetStreamSink),
     .class_init    = xilinx_enet_control_stream_class_init,
     .interfaces = (InterfaceInfo[]) {
             { TYPE_STREAM_SINK },
-- 
2.26.2
