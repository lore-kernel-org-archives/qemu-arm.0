Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2009486lfq;
        Fri, 11 Sep 2020 00:28:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0BZBTM6l32SAV+S8/YFMq1mRgXBPNoHTe70AWLVjjiPT4onZbQh9D8iWYQEbm1rX7PqTi
X-Received: by 2002:a25:7084:: with SMTP id l126mr658533ybc.454.1599809320800;
        Fri, 11 Sep 2020 00:28:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599809320; cv=none;
        d=google.com; s=arc-20160816;
        b=s8SJk1R4rY2x0XucI+NvapV5zFGUQ1FCzEnrsjJuKCF3qVFSKv2w3K5rSTEw8q1DQx
         el7/b0pB1OyISeLg43IjRPnRiBM5w9vHgYP8+9gopftLAgpsWa7xRn/y55tEKiuGK1dt
         7Mfejhckxf6bUCF9Bo5UeoZkH96L1yjvVoBGnb0LL+ILTYbpRm18Oik3cCnzLlT5Jr3c
         YiYZr05mtZJuqkrUUOgHxQoEo2tf87OnKbi/YJYKf4h9mrwWCZtQ7aI7MP09Vh7hR6XN
         x0wKE4t8ZXO3yufsJ83MZqub8mP6X6GVNlCzv/nXhxhxXzOv817ooPi6woByCMk0Cm2M
         LV7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=JHiQFD3vupbkNfCoZoJphbTkUL+RRIYm7TfbINdW/ro=;
        b=DRC0WcLe4jT752vVa5PJV00f5x6V8mmaa+mJzM21AKN5bunbKb1/mYmV36Lo+6QBoL
         jqFPqVR13ZC2lVZCXEpm0JSwmbrfGZ9auUy3pNlWSq5skTYgjaCPRefg/ssusSLkUHOz
         CdSAboB5UWD2Px4e2lkamdPN/XJb/DfIeVDaakdtxV2HpuzK1iydsjuZXw3jywb5HF8E
         nBzMvNJOOuyX8DLeOq3e2KTWdWOtdnTPTHZ+4Qn9HJwWKVtdpJJkxpVWoI30CGMCR0nT
         pUtV7wlc5X1s9Qib+Qg7KF2xjmsccuim6SJC01SiHnar5SqWwgla1v0oK+q+meYrdDgh
         N6vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f4oxr5Sz;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id x4si1421786ybe.193.2020.09.11.00.28.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2020 00:28:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f4oxr5Sz;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599809320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JHiQFD3vupbkNfCoZoJphbTkUL+RRIYm7TfbINdW/ro=;
	b=f4oxr5Sz16WRK2VYmPk8qvMRhozo/PO8dN1sw8BI5fpXpJFGHbGCFM7u9gfEbrjK2pQmKD
	3U8gpw9gjZhFUXyDdzB16+VcGTtnsGujn0eVt0ELWmS8RwTg5w+AaEagHAYkhrcYnzSJGd
	uPMOPjVsWEQEtX+hZBIhceIDdSXc2pY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-mnMdoFmSMVWXp17TXJRJRQ-1; Fri, 11 Sep 2020 03:28:36 -0400
X-MC-Unique: mnMdoFmSMVWXp17TXJRJRQ-1
Received: by mail-ej1-f72.google.com with SMTP id b1so4221266eje.3
        for <alex.bennee@linaro.org>; Fri, 11 Sep 2020 00:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JHiQFD3vupbkNfCoZoJphbTkUL+RRIYm7TfbINdW/ro=;
        b=WO6ot+YpbSd0zOq+YpTfstyU7ueBvmMqU1ZJq7+hscN25AzYSSHCjtQUvQHPJ3vyVO
         qX9hFP/+I7pognPSgFepXJfyKfII9q3XZmRiYBLwS9EzYKY3BtqtaQTXyT4mx5o2aHRj
         MtcR0lCJBVVFQxyreWa8qLWlD83IuLmN3ELELR3ymz4HcfmU2BvNuVbqYxdEQPDlTAdw
         9EvG4mrb3zV/lculvcQl1wEW7EVDLyxox//wJ6ob0pkneastE/ntVzFNggMZ9VAYOmxx
         DwGqmjEZDPs/UsHwlQVTh2NTyx+0vhM8OnMJXDiMdbTlnDNjjI9pLGZnJmEfh/SQhxWZ
         85XA==
X-Gm-Message-State: AOAM530G6y1gDAL9PB5uFAkL/X7yodaC78/MKQI9M16GO26Ht9+90NIl
	1R1oGdVy14c/agvbzi6cSruSSS3o8VVrkb3/eqPrPWbfngLdGJBDOlBybshfJpafofnlM1gJgY8
	XO8TxxhBELKkcmb62
X-Received: by 2002:a05:6402:48a:: with SMTP id k10mr689725edv.22.1599809315428;
        Fri, 11 Sep 2020 00:28:35 -0700 (PDT)
X-Received: by 2002:a05:6402:48a:: with SMTP id k10mr689714edv.22.1599809315254;
        Fri, 11 Sep 2020 00:28:35 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPv6:2001:b07:6468:f312:6689:90a2:a29f:8336? ([2001:b07:6468:f312:6689:90a2:a29f:8336])
        by smtp.gmail.com with ESMTPSA id o93sm970877edd.75.2020.09.11.00.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 00:28:34 -0700 (PDT)
Subject: Re: [PATCH 3/6] hw/dma/xilinx_axidma: Rename StreamSlave as
 StreamSink
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-trivial@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Joel Stanley <joel@jms.id.au>
References: <20200910070131.435543-1-philmd@redhat.com>
 <20200910070131.435543-4-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <71dad67c-a36e-8cd1-1f47-7a9bba1c74b0@redhat.com>
Date: Fri, 11 Sep 2020 09:28:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200910070131.435543-4-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TUID: ox/eNsWOLq47

On 10/09/20 09:01, Philippe Mathieu-Daudé wrote:
> In order to use inclusive terminology, rename 'slave stream'
> as 'sink stream'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/dma/xilinx_axidma.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> index cf12a852ea1..19e14a2997e 100644
> --- a/hw/dma/xilinx_axidma.c
> +++ b/hw/dma/xilinx_axidma.c
> @@ -46,11 +46,11 @@
>       OBJECT_CHECK(XilinxAXIDMA, (obj), TYPE_XILINX_AXI_DMA)
>  
>  #define XILINX_AXI_DMA_DATA_STREAM(obj) \
> -     OBJECT_CHECK(XilinxAXIDMAStreamSlave, (obj),\
> +     OBJECT_CHECK(XilinxAXIDMAStreamSink, (obj),\
>       TYPE_XILINX_AXI_DMA_DATA_STREAM)
>  
>  #define XILINX_AXI_DMA_CONTROL_STREAM(obj) \
> -     OBJECT_CHECK(XilinxAXIDMAStreamSlave, (obj),\
> +     OBJECT_CHECK(XilinxAXIDMAStreamSink, (obj),\
>       TYPE_XILINX_AXI_DMA_CONTROL_STREAM)
>  
>  #define R_DMACR             (0x00 / 4)
> @@ -63,7 +63,7 @@
>  #define CONTROL_PAYLOAD_SIZE (CONTROL_PAYLOAD_WORDS * (sizeof(uint32_t)))
>  
>  typedef struct XilinxAXIDMA XilinxAXIDMA;
> -typedef struct XilinxAXIDMAStreamSlave XilinxAXIDMAStreamSlave;
> +typedef struct XilinxAXIDMAStreamSink XilinxAXIDMAStreamSink;
>  
>  enum {
>      DMACR_RUNSTOP = 1,
> @@ -118,7 +118,7 @@ struct Stream {
>      unsigned char txbuf[16 * 1024];
>  };
>  
> -struct XilinxAXIDMAStreamSlave {
> +struct XilinxAXIDMAStreamSink {
>      Object parent;
>  
>      struct XilinxAXIDMA *dma;
> @@ -133,8 +133,8 @@ struct XilinxAXIDMA {
>      uint32_t freqhz;
>      StreamSink *tx_data_dev;
>      StreamSink *tx_control_dev;
> -    XilinxAXIDMAStreamSlave rx_data_dev;
> -    XilinxAXIDMAStreamSlave rx_control_dev;
> +    XilinxAXIDMAStreamSink rx_data_dev;
> +    XilinxAXIDMAStreamSink rx_control_dev;
>  
>      struct Stream streams[2];
>  
> @@ -390,7 +390,7 @@ static size_t
>  xilinx_axidma_control_stream_push(StreamSink *obj, unsigned char *buf,
>                                    size_t len, bool eop)
>  {
> -    XilinxAXIDMAStreamSlave *cs = XILINX_AXI_DMA_CONTROL_STREAM(obj);
> +    XilinxAXIDMAStreamSink *cs = XILINX_AXI_DMA_CONTROL_STREAM(obj);
>      struct Stream *s = &cs->dma->streams[1];
>  
>      if (len != CONTROL_PAYLOAD_SIZE) {
> @@ -407,7 +407,7 @@ xilinx_axidma_data_stream_can_push(StreamSink *obj,
>                                     StreamCanPushNotifyFn notify,
>                                     void *notify_opaque)
>  {
> -    XilinxAXIDMAStreamSlave *ds = XILINX_AXI_DMA_DATA_STREAM(obj);
> +    XilinxAXIDMAStreamSink *ds = XILINX_AXI_DMA_DATA_STREAM(obj);
>      struct Stream *s = &ds->dma->streams[1];
>  
>      if (!stream_running(s) || stream_idle(s)) {
> @@ -423,7 +423,7 @@ static size_t
>  xilinx_axidma_data_stream_push(StreamSink *obj, unsigned char *buf, size_t len,
>                                 bool eop)
>  {
> -    XilinxAXIDMAStreamSlave *ds = XILINX_AXI_DMA_DATA_STREAM(obj);
> +    XilinxAXIDMAStreamSink *ds = XILINX_AXI_DMA_DATA_STREAM(obj);
>      struct Stream *s = &ds->dma->streams[1];
>      size_t ret;
>  
> @@ -534,8 +534,8 @@ static const MemoryRegionOps axidma_ops = {
>  static void xilinx_axidma_realize(DeviceState *dev, Error **errp)
>  {
>      XilinxAXIDMA *s = XILINX_AXI_DMA(dev);
> -    XilinxAXIDMAStreamSlave *ds = XILINX_AXI_DMA_DATA_STREAM(&s->rx_data_dev);
> -    XilinxAXIDMAStreamSlave *cs = XILINX_AXI_DMA_CONTROL_STREAM(
> +    XilinxAXIDMAStreamSink *ds = XILINX_AXI_DMA_DATA_STREAM(&s->rx_data_dev);
> +    XilinxAXIDMAStreamSink *cs = XILINX_AXI_DMA_CONTROL_STREAM(
>                                                              &s->rx_control_dev);
>      int i;
>  
> @@ -634,7 +634,7 @@ static const TypeInfo axidma_info = {
>  static const TypeInfo xilinx_axidma_data_stream_info = {
>      .name          = TYPE_XILINX_AXI_DMA_DATA_STREAM,
>      .parent        = TYPE_OBJECT,
> -    .instance_size = sizeof(struct XilinxAXIDMAStreamSlave),
> +    .instance_size = sizeof(struct XilinxAXIDMAStreamSink),
>      .class_init    = xilinx_axidma_stream_class_init,
>      .class_data    = &xilinx_axidma_data_stream_class,
>      .interfaces = (InterfaceInfo[]) {
> @@ -646,7 +646,7 @@ static const TypeInfo xilinx_axidma_data_stream_info = {
>  static const TypeInfo xilinx_axidma_control_stream_info = {
>      .name          = TYPE_XILINX_AXI_DMA_CONTROL_STREAM,
>      .parent        = TYPE_OBJECT,
> -    .instance_size = sizeof(struct XilinxAXIDMAStreamSlave),
> +    .instance_size = sizeof(struct XilinxAXIDMAStreamSink),
>      .class_init    = xilinx_axidma_stream_class_init,
>      .class_data    = &xilinx_axidma_control_stream_class,
>      .interfaces = (InterfaceInfo[]) {
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
