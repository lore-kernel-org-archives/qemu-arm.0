Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2011436lfq;
        Fri, 11 Sep 2020 00:31:58 -0700 (PDT)
X-Received: by 2002:a05:6512:4cb:: with SMTP id w11mr305088lfq.33.1599809518819;
        Fri, 11 Sep 2020 00:31:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599809518; cv=none;
        d=google.com; s=arc-20160816;
        b=dLm2T8dLSz1LFhuz9s5vlK56UxMQQHB8pxr1dLXj/80pQvRSPQLmX1OheG3Y5rdIE3
         vzh/NxV/Ka81L3SiutOm1yEC5U9wq+Oyz5kvVyZpFdCetzb//NvOxv3Squdtsxx8IKUH
         p6Zy21qIPdcH79ONbSmLsonJNqlwOc4QMgEroiiGdjzUngZh33rQKabYzVu43YjlWSNd
         krv6O/0Y/xZi/a7Zn1yOc/TTAvc5fzHPCFiGoRwh9mTywsYVbKT4V/nLfS/7V5E8hVcH
         Q0t8aAgaRaZ0qq0k8j4bnlEVZTCbtzwzF5qH8Gj3te1tcmpI/qKD0vOEDMbGMSCCjS5k
         /v5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=gLWFaOrTgYE9gb7vfvSK1qpEJDLObDW4x6A89Wj47sE=;
        b=hhOAItJAG0fjm69ZtuAhr5cRdLieJEzvmfUdVGG1M6wv12Dpyf6LP1/Dnq0sOf8eIQ
         mTGXeg/DD2TC9A7s5LsCJVwC+auYBafM3mtQCHVrDgEKyU4GBkNnYZKiVktCCXySNg6R
         9dU5ZpXBnaX/FfucPYZrXj7iE3rQCKWFuYPjLMExDMEgOh2U9UOSMqm7hkBFWs6sdAyh
         o66y51X8iVChJN0zoMht1NcoYVubeMwQdB5uRSOQkXHOzRxdWhbVBdkmHWKgcpdI1JJv
         m95XcRbi1RWLjwO3uvFT94wK2U4Pp6AicrlYsLhnaecGLzLLw4T7no8YRtAgcCVj3mU7
         qm3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=J9S5khHy;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q28sor248532lfo.34.2020.09.11.00.31.58
        (Google Transport Security);
        Fri, 11 Sep 2020 00:31:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=J9S5khHy;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=gLWFaOrTgYE9gb7vfvSK1qpEJDLObDW4x6A89Wj47sE=;
        b=J9S5khHysLs8NJ7BNlj7gJ8WBPGTPm34CVbBTUbMTeVEoOZC0IsmPxU+MQZUOk9i/V
         E8q/IKjL3Z5ny4GYADQ8eDp8Ui7hFaqdizplVDg28yJXb3Pfw3DBXHuDMDVGzDX54yfd
         F042DpuoH9om/VI+nSYQX/jdxWSqPLWhVUM1FwGtjl3w83km8KFct2KMWQ1tTNnrFZq2
         C40FIEU3Dn/R2pLdopymR1Ha22XrDpMBb9XdmYpc38DondqPxynGhYmjwgoAz580clGj
         4tqZUx1u2sK+9Q5Qp8wIupAWzwwUcT+VBcp2HqB48J7u1gp2XKQh0fsP26jUiQXDIZZ7
         N7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=gLWFaOrTgYE9gb7vfvSK1qpEJDLObDW4x6A89Wj47sE=;
        b=dd9EdJZDm118ONJelZFoCivkLXyCQKuosVjnX/mc3ZoafwA+Dc435tWaAF9NgbBXbX
         0aLpFaY4RAgfo01xAOMCOlwucYBAXEwKdcQNJhDUpKF1nGIqMe232eRW+IiAotx6fXfN
         nThn6ZTgLA6KHG3AC6KOpar4AsQej8CEpxPjn1wLj90Fm4xqYiWUppzDZqSdaH2UGxzy
         C4/ToIxT+XHZJZbhUrJ6IB1q410sDKdSHI38mABE5LbqBRvTijeQCOiq3lFFKmB2Yasa
         Rp9NG5bnEWZ37vtjLImdR7YvqPu9sJM2XdWbJtucI0fAue30jaCKWFmdyFTBs6cup3tU
         Y5OA==
X-Gm-Message-State: AOAM53055JQWiF7wjgLj8Snm0AMrOYI1ohWK9irQkGrr/AtXIWQMml9f
	ke3+3z8khzklrOzfbSwshY4=
X-Google-Smtp-Source: ABdhPJynaUdw0cL24VPHKuwLMvVQCWLtF4qVFNhOWznD/sR29cSv/Nil8HkSdxS5NbVPVXctVcFXRA==
X-Received: by 2002:a19:8247:: with SMTP id e68mr304829lfd.65.1599809518529;
        Fri, 11 Sep 2020 00:31:58 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
        by smtp.gmail.com with ESMTPSA id a12sm365545ljk.109.2020.09.11.00.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 00:31:58 -0700 (PDT)
Date: Fri, 11 Sep 2020 09:31:57 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org, qemu-arm@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Jeffery <andrew@aj.id.au>, Jason Wang <jasowang@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-trivial@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 3/6] hw/dma/xilinx_axidma: Rename StreamSlave as
 StreamSink
Message-ID: <20200911073157.GD2954729@toto>
References: <20200910070131.435543-1-philmd@redhat.com>
 <20200910070131.435543-4-philmd@redhat.com>
 <71dad67c-a36e-8cd1-1f47-7a9bba1c74b0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <71dad67c-a36e-8cd1-1f47-7a9bba1c74b0@redhat.com>
X-TUID: hp/BK1uyrdvs

On Fri, Sep 11, 2020 at 09:28:34AM +0200, Paolo Bonzini wrote:
> On 10/09/20 09:01, Philippe Mathieu-Daudé wrote:
> > In order to use inclusive terminology, rename 'slave stream'
> > as 'sink stream'.
> > 
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > ---
> >  hw/dma/xilinx_axidma.c | 26 +++++++++++++-------------
> >  1 file changed, 13 insertions(+), 13 deletions(-)
> > 
> > diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> > index cf12a852ea1..19e14a2997e 100644
> > --- a/hw/dma/xilinx_axidma.c
> > +++ b/hw/dma/xilinx_axidma.c
> > @@ -46,11 +46,11 @@
> >       OBJECT_CHECK(XilinxAXIDMA, (obj), TYPE_XILINX_AXI_DMA)
> >  
> >  #define XILINX_AXI_DMA_DATA_STREAM(obj) \
> > -     OBJECT_CHECK(XilinxAXIDMAStreamSlave, (obj),\
> > +     OBJECT_CHECK(XilinxAXIDMAStreamSink, (obj),\
> >       TYPE_XILINX_AXI_DMA_DATA_STREAM)
> >  
> >  #define XILINX_AXI_DMA_CONTROL_STREAM(obj) \
> > -     OBJECT_CHECK(XilinxAXIDMAStreamSlave, (obj),\
> > +     OBJECT_CHECK(XilinxAXIDMAStreamSink, (obj),\
> >       TYPE_XILINX_AXI_DMA_CONTROL_STREAM)
> >  
> >  #define R_DMACR             (0x00 / 4)
> > @@ -63,7 +63,7 @@
> >  #define CONTROL_PAYLOAD_SIZE (CONTROL_PAYLOAD_WORDS * (sizeof(uint32_t)))
> >  
> >  typedef struct XilinxAXIDMA XilinxAXIDMA;
> > -typedef struct XilinxAXIDMAStreamSlave XilinxAXIDMAStreamSlave;
> > +typedef struct XilinxAXIDMAStreamSink XilinxAXIDMAStreamSink;
> >  
> >  enum {
> >      DMACR_RUNSTOP = 1,
> > @@ -118,7 +118,7 @@ struct Stream {
> >      unsigned char txbuf[16 * 1024];
> >  };
> >  
> > -struct XilinxAXIDMAStreamSlave {
> > +struct XilinxAXIDMAStreamSink {
> >      Object parent;
> >  
> >      struct XilinxAXIDMA *dma;
> > @@ -133,8 +133,8 @@ struct XilinxAXIDMA {
> >      uint32_t freqhz;
> >      StreamSink *tx_data_dev;
> >      StreamSink *tx_control_dev;
> > -    XilinxAXIDMAStreamSlave rx_data_dev;
> > -    XilinxAXIDMAStreamSlave rx_control_dev;
> > +    XilinxAXIDMAStreamSink rx_data_dev;
> > +    XilinxAXIDMAStreamSink rx_control_dev;
> >  
> >      struct Stream streams[2];
> >  
> > @@ -390,7 +390,7 @@ static size_t
> >  xilinx_axidma_control_stream_push(StreamSink *obj, unsigned char *buf,
> >                                    size_t len, bool eop)
> >  {
> > -    XilinxAXIDMAStreamSlave *cs = XILINX_AXI_DMA_CONTROL_STREAM(obj);
> > +    XilinxAXIDMAStreamSink *cs = XILINX_AXI_DMA_CONTROL_STREAM(obj);
> >      struct Stream *s = &cs->dma->streams[1];
> >  
> >      if (len != CONTROL_PAYLOAD_SIZE) {
> > @@ -407,7 +407,7 @@ xilinx_axidma_data_stream_can_push(StreamSink *obj,
> >                                     StreamCanPushNotifyFn notify,
> >                                     void *notify_opaque)
> >  {
> > -    XilinxAXIDMAStreamSlave *ds = XILINX_AXI_DMA_DATA_STREAM(obj);
> > +    XilinxAXIDMAStreamSink *ds = XILINX_AXI_DMA_DATA_STREAM(obj);
> >      struct Stream *s = &ds->dma->streams[1];
> >  
> >      if (!stream_running(s) || stream_idle(s)) {
> > @@ -423,7 +423,7 @@ static size_t
> >  xilinx_axidma_data_stream_push(StreamSink *obj, unsigned char *buf, size_t len,
> >                                 bool eop)
> >  {
> > -    XilinxAXIDMAStreamSlave *ds = XILINX_AXI_DMA_DATA_STREAM(obj);
> > +    XilinxAXIDMAStreamSink *ds = XILINX_AXI_DMA_DATA_STREAM(obj);
> >      struct Stream *s = &ds->dma->streams[1];
> >      size_t ret;
> >  
> > @@ -534,8 +534,8 @@ static const MemoryRegionOps axidma_ops = {
> >  static void xilinx_axidma_realize(DeviceState *dev, Error **errp)
> >  {
> >      XilinxAXIDMA *s = XILINX_AXI_DMA(dev);
> > -    XilinxAXIDMAStreamSlave *ds = XILINX_AXI_DMA_DATA_STREAM(&s->rx_data_dev);
> > -    XilinxAXIDMAStreamSlave *cs = XILINX_AXI_DMA_CONTROL_STREAM(
> > +    XilinxAXIDMAStreamSink *ds = XILINX_AXI_DMA_DATA_STREAM(&s->rx_data_dev);
> > +    XilinxAXIDMAStreamSink *cs = XILINX_AXI_DMA_CONTROL_STREAM(
> >                                                              &s->rx_control_dev);
> >      int i;
> >  
> > @@ -634,7 +634,7 @@ static const TypeInfo axidma_info = {
> >  static const TypeInfo xilinx_axidma_data_stream_info = {
> >      .name          = TYPE_XILINX_AXI_DMA_DATA_STREAM,
> >      .parent        = TYPE_OBJECT,
> > -    .instance_size = sizeof(struct XilinxAXIDMAStreamSlave),
> > +    .instance_size = sizeof(struct XilinxAXIDMAStreamSink),
> >      .class_init    = xilinx_axidma_stream_class_init,
> >      .class_data    = &xilinx_axidma_data_stream_class,
> >      .interfaces = (InterfaceInfo[]) {
> > @@ -646,7 +646,7 @@ static const TypeInfo xilinx_axidma_data_stream_info = {
> >  static const TypeInfo xilinx_axidma_control_stream_info = {
> >      .name          = TYPE_XILINX_AXI_DMA_CONTROL_STREAM,
> >      .parent        = TYPE_OBJECT,
> > -    .instance_size = sizeof(struct XilinxAXIDMAStreamSlave),
> > +    .instance_size = sizeof(struct XilinxAXIDMAStreamSink),
> >      .class_init    = xilinx_axidma_stream_class_init,
> >      .class_data    = &xilinx_axidma_control_stream_class,
> >      .interfaces = (InterfaceInfo[]) {
> > 
> 
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

