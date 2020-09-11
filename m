Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2009328lfq;
        Fri, 11 Sep 2020 00:28:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/SEqtFIGgc01ok4Hm3U4bEL2d2zPaEHPqLNnQJllZ5f/0rGx37PraHDq0XWruhizJuV/6
X-Received: by 2002:a17:906:6884:: with SMTP id n4mr827705ejr.50.1599809302024;
        Fri, 11 Sep 2020 00:28:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599809302; cv=none;
        d=google.com; s=arc-20160816;
        b=GxmYP5VNMxWMW4Y6C70WtPi/WWM2Y4U1hWaS9bplHsGmK9eSD4Tpdz2vOsWRl9V82W
         ooxg8U+BPddMn+QLFe6ki+YCmIe8D2PC7vf7r/vMO6ngAJN0M9R5IzZ6xrv3z01JvW4N
         MN3Xcf+uvTNiVyaAFgzTlku08YxYjBP/ZI/MCYpRJ4gLr8Sgjjf4nL2KM1rE75zZMefP
         NH+qkzvBiN9W8yefNUmwplKfu2zEGdsGWRIRwgMmHjJxFNIRDbLOGQz8JTSrTf0ISzdI
         NRKyFGqSMp4mn1uI3WK/vFglqL9+fcTuwqERwEfpr/qO9tuEmUEzdyIqGB53h2P+izdQ
         wwaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=JjKafxUPP45f5IT06o5f0VT+vHA02CW8qJlagtnzvDY=;
        b=EOiglWHyLCAglzYPaRmLhNkI1A6ALIQqyXSNve91MS8OyjtJE5KvRSuLBqLS9vUcR1
         U8XrKU3uMGkU9WF2090vgqoBDPRql8yKlOglaYM1H3JkmbbQ0eXE0Y+8JG8Rlz2WmqKY
         FXnoO0m28Lgq8gXTnXUVIl/l7iuQU8nFfzSH06N51taK+gwSC41vZYp/g7PnUhCQCmXZ
         3jhCwFxOGWrL/MnKRuHHTqsnK5oUqM32nIDzML6ivnkuhwijGlCQaS5bQ3zotHj84JtW
         IKCGNPY6wuwJeNs9MHjttABi43KSTEUozBOb5+tGgzYk+2NHKA221pBjc8X7k9pCg2ng
         Qz+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LaJqX9wR;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id i5si745427ejs.267.2020.09.11.00.28.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2020 00:28:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LaJqX9wR;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599809300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JjKafxUPP45f5IT06o5f0VT+vHA02CW8qJlagtnzvDY=;
	b=LaJqX9wR2lAIkA8R8Vu6U3V1n4G0e0o9utetwdwGOW491SsqKH0umdEv5cjehbuc37qB+3
	5TQ3Tm1cjRZWmVuOvSGWwddX9JpEKXjthv57sL0HrikOPocCD/RnsdPqs46hIuCWF2Je5G
	wjizidNWEA1EvOw1bZOFS2Ua1kqt6ak=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-puGna51JPsauoZLFUeqZEg-1; Fri, 11 Sep 2020 03:28:19 -0400
X-MC-Unique: puGna51JPsauoZLFUeqZEg-1
Received: by mail-ed1-f70.google.com with SMTP id l2so3876999ede.19
        for <alex.bennee@linaro.org>; Fri, 11 Sep 2020 00:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JjKafxUPP45f5IT06o5f0VT+vHA02CW8qJlagtnzvDY=;
        b=U6TbwlCxhs6/HAq6OCLFwwzrThvSBES0aRXydxgo74qSRc0EELxR1wR4+692fsFiXB
         1rZJVKcjDdq4rEOeTXxmcv7jx/JeY/De+rQmB1uCrHLCEBIOFget3U9lq5GkE2xEGG0i
         ISjptb5tcevdd7k27VP86qS46Hd5xIB7DuPgQObh4TnYB2IdPVxTrmyKuSJKS/EFk520
         LeBmoCIdAFJCHclNybJfJ9e8X16ah6syzPBQTc1Tq1BLxq3+o8W4OnNi7ieoWIWHT6Ic
         753IQ8An8deLF7vaGNVI6FOVeTXzOvSrIK4np8qT+rAsA0MaFP4bUZxzfYhsrZ/ie7+Z
         C2lQ==
X-Gm-Message-State: AOAM533s/Htcmb9X+rPvC2gvo6ypxpfkOvxOajL5CJEPqLUQzKmAfil+
	dsk9DRLzKpZarRUf8UmRCIvLzojaFKmUNzKuGAAMHwy1m/7aGJDNE8Ge4tIagSXpSXO7lCRXvhP
	erRiv5lTOTVoY+YXd
X-Received: by 2002:a05:6402:1d93:: with SMTP id dk19mr665032edb.198.1599809297929;
        Fri, 11 Sep 2020 00:28:17 -0700 (PDT)
X-Received: by 2002:a05:6402:1d93:: with SMTP id dk19mr665006edb.198.1599809297513;
        Fri, 11 Sep 2020 00:28:17 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPv6:2001:b07:6468:f312:6689:90a2:a29f:8336? ([2001:b07:6468:f312:6689:90a2:a29f:8336])
        by smtp.gmail.com with ESMTPSA id m6sm962793ejb.85.2020.09.11.00.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 00:28:16 -0700 (PDT)
Subject: Re: [PATCH 2/6] hw/core/stream: Rename StreamSlave as StreamSink
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
 <20200910070131.435543-3-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cf510052-4059-b53b-fd86-5cfbbd6d95fb@redhat.com>
Date: Fri, 11 Sep 2020 09:28:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200910070131.435543-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TUID: SuDdiv+KE45r

On 10/09/20 09:01, Philippe Mathieu-Daudé wrote:
> In order to use inclusive terminology, rename 'slave stream'
> as 'sink stream'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

From Edgar Iglesias:

Regarding streams, our stream module can be used to model a stream
channel such as AXI stream but also other similar stream protocols. We
actually don't use the AXI stream terminology [in hw/core/stream.c].
E.g, we use buf instead of DATA, EOP (end-of-packet) instead of LAST and
have a flow-control mechanism that doesn't refer to valid/ready.  IMO,
since we're not matching specific protocol names, it would be fine to
switch to generic terms like Source and Sink.

Therefore,

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

> ---
>  include/hw/ssi/xilinx_spips.h |  2 +-
>  include/hw/stream.h           | 46 +++++++++++++++++------------------
>  hw/core/stream.c              | 20 +++++++--------
>  hw/dma/xilinx_axidma.c        | 32 ++++++++++++------------
>  hw/net/xilinx_axienet.c       | 20 +++++++--------
>  hw/ssi/xilinx_spips.c         |  2 +-
>  6 files changed, 61 insertions(+), 61 deletions(-)
> 
> diff --git a/include/hw/ssi/xilinx_spips.h b/include/hw/ssi/xilinx_spips.h
> index 6a39b55a7bd..fde8a3ebda6 100644
> --- a/include/hw/ssi/xilinx_spips.h
> +++ b/include/hw/ssi/xilinx_spips.h
> @@ -97,7 +97,7 @@ typedef struct {
>  typedef struct {
>      XilinxQSPIPS parent_obj;
>  
> -    StreamSlave *dma;
> +    StreamSink *dma;
>      int gqspi_irqline;
>  
>      uint32_t regs[XLNX_ZYNQMP_SPIPS_R_MAX];
> diff --git a/include/hw/stream.h b/include/hw/stream.h
> index ed09e83683d..8ca161991ca 100644
> --- a/include/hw/stream.h
> +++ b/include/hw/stream.h
> @@ -3,52 +3,52 @@
>  
>  #include "qom/object.h"
>  
> -/* stream slave. Used until qdev provides a generic way.  */
> -#define TYPE_STREAM_SLAVE "stream-slave"
> +/* stream sink. Used until qdev provides a generic way.  */
> +#define TYPE_STREAM_SINK "stream-slave"
>  
> -#define STREAM_SLAVE_CLASS(klass) \
> -     OBJECT_CLASS_CHECK(StreamSlaveClass, (klass), TYPE_STREAM_SLAVE)
> -#define STREAM_SLAVE_GET_CLASS(obj) \
> -    OBJECT_GET_CLASS(StreamSlaveClass, (obj), TYPE_STREAM_SLAVE)
> -#define STREAM_SLAVE(obj) \
> -     INTERFACE_CHECK(StreamSlave, (obj), TYPE_STREAM_SLAVE)
> +#define STREAM_SINK_CLASS(klass) \
> +     OBJECT_CLASS_CHECK(StreamSinkClass, (klass), TYPE_STREAM_SINK)
> +#define STREAM_SINK_GET_CLASS(obj) \
> +    OBJECT_GET_CLASS(StreamSinkClass, (obj), TYPE_STREAM_SINK)
> +#define STREAM_SINK(obj) \
> +     INTERFACE_CHECK(StreamSink, (obj), TYPE_STREAM_SINK)
>  
> -typedef struct StreamSlave StreamSlave;
> +typedef struct StreamSink StreamSink;
>  
>  typedef void (*StreamCanPushNotifyFn)(void *opaque);
>  
> -typedef struct StreamSlaveClass {
> +typedef struct StreamSinkClass {
>      InterfaceClass parent;
>      /**
> -     * can push - determine if a stream slave is capable of accepting at least
> +     * can push - determine if a stream sink is capable of accepting at least
>       * one byte of data. Returns false if cannot accept. If not implemented, the
> -     * slave is assumed to always be capable of receiving.
> -     * @notify: Optional callback that the slave will call when the slave is
> +     * sink is assumed to always be capable of receiving.
> +     * @notify: Optional callback that the sink will call when the sink is
>       * capable of receiving again. Only called if false is returned.
>       * @notify_opaque: opaque data to pass to notify call.
>       */
> -    bool (*can_push)(StreamSlave *obj, StreamCanPushNotifyFn notify,
> +    bool (*can_push)(StreamSink *obj, StreamCanPushNotifyFn notify,
>                       void *notify_opaque);
>      /**
> -     * push - push data to a Stream slave. The number of bytes pushed is
> -     * returned. If the slave short returns, the master must wait before trying
> -     * again, the slave may continue to just return 0 waiting for the vm time to
> +     * push - push data to a Stream sink. The number of bytes pushed is
> +     * returned. If the sink short returns, the master must wait before trying
> +     * again, the sink may continue to just return 0 waiting for the vm time to
>       * advance. The can_push() function can be used to trap the point in time
> -     * where the slave is ready to receive again, otherwise polling on a QEMU
> +     * where the sink is ready to receive again, otherwise polling on a QEMU
>       * timer will work.
> -     * @obj: Stream slave to push to
> +     * @obj: Stream sink to push to
>       * @buf: Data to write
>       * @len: Maximum number of bytes to write
>       * @eop: End of packet flag
>       */
> -    size_t (*push)(StreamSlave *obj, unsigned char *buf, size_t len, bool eop);
> -} StreamSlaveClass;
> +    size_t (*push)(StreamSink *obj, unsigned char *buf, size_t len, bool eop);
> +} StreamSinkClass;
>  
>  size_t
> -stream_push(StreamSlave *sink, uint8_t *buf, size_t len, bool eop);
> +stream_push(StreamSink *sink, uint8_t *buf, size_t len, bool eop);
>  
>  bool
> -stream_can_push(StreamSlave *sink, StreamCanPushNotifyFn notify,
> +stream_can_push(StreamSink *sink, StreamCanPushNotifyFn notify,
>                  void *notify_opaque);
>  
>  
> diff --git a/hw/core/stream.c b/hw/core/stream.c
> index a65ad1208d8..19477d0f2df 100644
> --- a/hw/core/stream.c
> +++ b/hw/core/stream.c
> @@ -3,32 +3,32 @@
>  #include "qemu/module.h"
>  
>  size_t
> -stream_push(StreamSlave *sink, uint8_t *buf, size_t len, bool eop)
> +stream_push(StreamSink *sink, uint8_t *buf, size_t len, bool eop)
>  {
> -    StreamSlaveClass *k =  STREAM_SLAVE_GET_CLASS(sink);
> +    StreamSinkClass *k =  STREAM_SINK_GET_CLASS(sink);
>  
>      return k->push(sink, buf, len, eop);
>  }
>  
>  bool
> -stream_can_push(StreamSlave *sink, StreamCanPushNotifyFn notify,
> +stream_can_push(StreamSink *sink, StreamCanPushNotifyFn notify,
>                  void *notify_opaque)
>  {
> -    StreamSlaveClass *k =  STREAM_SLAVE_GET_CLASS(sink);
> +    StreamSinkClass *k =  STREAM_SINK_GET_CLASS(sink);
>  
>      return k->can_push ? k->can_push(sink, notify, notify_opaque) : true;
>  }
>  
> -static const TypeInfo stream_slave_info = {
> -    .name          = TYPE_STREAM_SLAVE,
> +static const TypeInfo stream_sink_info = {
> +    .name          = TYPE_STREAM_SINK,
>      .parent        = TYPE_INTERFACE,
> -    .class_size = sizeof(StreamSlaveClass),
> +    .class_size = sizeof(StreamSinkClass),
>  };
>  
>  
> -static void stream_slave_register_types(void)
> +static void stream_sink_register_types(void)
>  {
> -    type_register_static(&stream_slave_info);
> +    type_register_static(&stream_sink_info);
>  }
>  
> -type_init(stream_slave_register_types)
> +type_init(stream_sink_register_types)
> diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> index a4812e480a0..cf12a852ea1 100644
> --- a/hw/dma/xilinx_axidma.c
> +++ b/hw/dma/xilinx_axidma.c
> @@ -131,8 +131,8 @@ struct XilinxAXIDMA {
>      AddressSpace as;
>  
>      uint32_t freqhz;
> -    StreamSlave *tx_data_dev;
> -    StreamSlave *tx_control_dev;
> +    StreamSink *tx_data_dev;
> +    StreamSink *tx_control_dev;
>      XilinxAXIDMAStreamSlave rx_data_dev;
>      XilinxAXIDMAStreamSlave rx_control_dev;
>  
> @@ -264,8 +264,8 @@ static void stream_complete(struct Stream *s)
>      ptimer_transaction_commit(s->ptimer);
>  }
>  
> -static void stream_process_mem2s(struct Stream *s, StreamSlave *tx_data_dev,
> -                                 StreamSlave *tx_control_dev)
> +static void stream_process_mem2s(struct Stream *s, StreamSink *tx_data_dev,
> +                                 StreamSink *tx_control_dev)
>  {
>      uint32_t prev_d;
>      uint32_t txlen;
> @@ -387,7 +387,7 @@ static void xilinx_axidma_reset(DeviceState *dev)
>  }
>  
>  static size_t
> -xilinx_axidma_control_stream_push(StreamSlave *obj, unsigned char *buf,
> +xilinx_axidma_control_stream_push(StreamSink *obj, unsigned char *buf,
>                                    size_t len, bool eop)
>  {
>      XilinxAXIDMAStreamSlave *cs = XILINX_AXI_DMA_CONTROL_STREAM(obj);
> @@ -403,7 +403,7 @@ xilinx_axidma_control_stream_push(StreamSlave *obj, unsigned char *buf,
>  }
>  
>  static bool
> -xilinx_axidma_data_stream_can_push(StreamSlave *obj,
> +xilinx_axidma_data_stream_can_push(StreamSink *obj,
>                                     StreamCanPushNotifyFn notify,
>                                     void *notify_opaque)
>  {
> @@ -420,7 +420,7 @@ xilinx_axidma_data_stream_can_push(StreamSlave *obj,
>  }
>  
>  static size_t
> -xilinx_axidma_data_stream_push(StreamSlave *obj, unsigned char *buf, size_t len,
> +xilinx_axidma_data_stream_push(StreamSink *obj, unsigned char *buf, size_t len,
>                                 bool eop)
>  {
>      XilinxAXIDMAStreamSlave *ds = XILINX_AXI_DMA_DATA_STREAM(obj);
> @@ -591,9 +591,9 @@ static void xilinx_axidma_init(Object *obj)
>  static Property axidma_properties[] = {
>      DEFINE_PROP_UINT32("freqhz", XilinxAXIDMA, freqhz, 50000000),
>      DEFINE_PROP_LINK("axistream-connected", XilinxAXIDMA,
> -                     tx_data_dev, TYPE_STREAM_SLAVE, StreamSlave *),
> +                     tx_data_dev, TYPE_STREAM_SINK, StreamSink *),
>      DEFINE_PROP_LINK("axistream-control-connected", XilinxAXIDMA,
> -                     tx_control_dev, TYPE_STREAM_SLAVE, StreamSlave *),
> +                     tx_control_dev, TYPE_STREAM_SINK, StreamSink *),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> @@ -606,21 +606,21 @@ static void axidma_class_init(ObjectClass *klass, void *data)
>      device_class_set_props(dc, axidma_properties);
>  }
>  
> -static StreamSlaveClass xilinx_axidma_data_stream_class = {
> +static StreamSinkClass xilinx_axidma_data_stream_class = {
>      .push = xilinx_axidma_data_stream_push,
>      .can_push = xilinx_axidma_data_stream_can_push,
>  };
>  
> -static StreamSlaveClass xilinx_axidma_control_stream_class = {
> +static StreamSinkClass xilinx_axidma_control_stream_class = {
>      .push = xilinx_axidma_control_stream_push,
>  };
>  
>  static void xilinx_axidma_stream_class_init(ObjectClass *klass, void *data)
>  {
> -    StreamSlaveClass *ssc = STREAM_SLAVE_CLASS(klass);
> +    StreamSinkClass *ssc = STREAM_SINK_CLASS(klass);
>  
> -    ssc->push = ((StreamSlaveClass *)data)->push;
> -    ssc->can_push = ((StreamSlaveClass *)data)->can_push;
> +    ssc->push = ((StreamSinkClass *)data)->push;
> +    ssc->can_push = ((StreamSinkClass *)data)->can_push;
>  }
>  
>  static const TypeInfo axidma_info = {
> @@ -638,7 +638,7 @@ static const TypeInfo xilinx_axidma_data_stream_info = {
>      .class_init    = xilinx_axidma_stream_class_init,
>      .class_data    = &xilinx_axidma_data_stream_class,
>      .interfaces = (InterfaceInfo[]) {
> -        { TYPE_STREAM_SLAVE },
> +        { TYPE_STREAM_SINK },
>          { }
>      }
>  };
> @@ -650,7 +650,7 @@ static const TypeInfo xilinx_axidma_control_stream_info = {
>      .class_init    = xilinx_axidma_stream_class_init,
>      .class_data    = &xilinx_axidma_control_stream_class,
>      .interfaces = (InterfaceInfo[]) {
> -        { TYPE_STREAM_SLAVE },
> +        { TYPE_STREAM_SINK },
>          { }
>      }
>  };
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index 2e89f236b4a..0c4ac727207 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -323,8 +323,8 @@ struct XilinxAXIEnet {
>      SysBusDevice busdev;
>      MemoryRegion iomem;
>      qemu_irq irq;
> -    StreamSlave *tx_data_dev;
> -    StreamSlave *tx_control_dev;
> +    StreamSink *tx_data_dev;
> +    StreamSink *tx_control_dev;
>      XilinxAXIEnetStreamSlave rx_data_dev;
>      XilinxAXIEnetStreamSlave rx_control_dev;
>      NICState *nic;
> @@ -855,7 +855,7 @@ static ssize_t eth_rx(NetClientState *nc, const uint8_t *buf, size_t size)
>  }
>  
>  static size_t
> -xilinx_axienet_control_stream_push(StreamSlave *obj, uint8_t *buf, size_t len,
> +xilinx_axienet_control_stream_push(StreamSink *obj, uint8_t *buf, size_t len,
>                                     bool eop)
>  {
>      int i;
> @@ -877,7 +877,7 @@ xilinx_axienet_control_stream_push(StreamSlave *obj, uint8_t *buf, size_t len,
>  }
>  
>  static size_t
> -xilinx_axienet_data_stream_push(StreamSlave *obj, uint8_t *buf, size_t size,
> +xilinx_axienet_data_stream_push(StreamSink *obj, uint8_t *buf, size_t size,
>                                  bool eop)
>  {
>      XilinxAXIEnetStreamSlave *ds = XILINX_AXI_ENET_DATA_STREAM(obj);
> @@ -1005,9 +1005,9 @@ static Property xilinx_enet_properties[] = {
>      DEFINE_PROP_UINT32("txmem", XilinxAXIEnet, c_txmem, 0x1000),
>      DEFINE_NIC_PROPERTIES(XilinxAXIEnet, conf),
>      DEFINE_PROP_LINK("axistream-connected", XilinxAXIEnet,
> -                     tx_data_dev, TYPE_STREAM_SLAVE, StreamSlave *),
> +                     tx_data_dev, TYPE_STREAM_SINK, StreamSink *),
>      DEFINE_PROP_LINK("axistream-control-connected", XilinxAXIEnet,
> -                     tx_control_dev, TYPE_STREAM_SLAVE, StreamSlave *),
> +                     tx_control_dev, TYPE_STREAM_SINK, StreamSink *),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> @@ -1023,14 +1023,14 @@ static void xilinx_enet_class_init(ObjectClass *klass, void *data)
>  static void xilinx_enet_control_stream_class_init(ObjectClass *klass,
>                                                    void *data)
>  {
> -    StreamSlaveClass *ssc = STREAM_SLAVE_CLASS(klass);
> +    StreamSinkClass *ssc = STREAM_SINK_CLASS(klass);
>  
>      ssc->push = xilinx_axienet_control_stream_push;
>  }
>  
>  static void xilinx_enet_data_stream_class_init(ObjectClass *klass, void *data)
>  {
> -    StreamSlaveClass *ssc = STREAM_SLAVE_CLASS(klass);
> +    StreamSinkClass *ssc = STREAM_SINK_CLASS(klass);
>  
>      ssc->push = xilinx_axienet_data_stream_push;
>  }
> @@ -1049,7 +1049,7 @@ static const TypeInfo xilinx_enet_data_stream_info = {
>      .instance_size = sizeof(struct XilinxAXIEnetStreamSlave),
>      .class_init    = xilinx_enet_data_stream_class_init,
>      .interfaces = (InterfaceInfo[]) {
> -            { TYPE_STREAM_SLAVE },
> +            { TYPE_STREAM_SINK },
>              { }
>      }
>  };
> @@ -1060,7 +1060,7 @@ static const TypeInfo xilinx_enet_control_stream_info = {
>      .instance_size = sizeof(struct XilinxAXIEnetStreamSlave),
>      .class_init    = xilinx_enet_control_stream_class_init,
>      .interfaces = (InterfaceInfo[]) {
> -            { TYPE_STREAM_SLAVE },
> +            { TYPE_STREAM_SINK },
>              { }
>      }
>  };
> diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
> index b9371dbf8d7..6109ba55107 100644
> --- a/hw/ssi/xilinx_spips.c
> +++ b/hw/ssi/xilinx_spips.c
> @@ -1353,7 +1353,7 @@ static void xlnx_zynqmp_qspips_init(Object *obj)
>  {
>      XlnxZynqMPQSPIPS *rq = XLNX_ZYNQMP_QSPIPS(obj);
>  
> -    object_property_add_link(obj, "stream-connected-dma", TYPE_STREAM_SLAVE,
> +    object_property_add_link(obj, "stream-connected-dma", TYPE_STREAM_SINK,
>                               (Object **)&rq->dma,
>                               object_property_allow_set_link,
>                               OBJ_PROP_LINK_STRONG);
> 
