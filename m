Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2009543lfq;
        Fri, 11 Sep 2020 00:28:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2zXlU1oIdbYJJwjierENwES5+7xan5aLPmu8dvooTpUkIOmeRxiwuKm/UPo/M1F1lMnFF
X-Received: by 2002:a25:3896:: with SMTP id f144mr619149yba.375.1599809323935;
        Fri, 11 Sep 2020 00:28:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599809323; cv=none;
        d=google.com; s=arc-20160816;
        b=uxa1jQsM2WUpawrJWqxcGJxf2hdmmp3GEedkkHdifMMuhvRofPD5TTvABVv5WUU+75
         tXLNR/bKhY6c0/TIjzBzosZl9zYmrIAdAsSVvL6NHfKqvNI4qzqLh6NhVnMguqsqlsgb
         YtM7w8nCTxCzJTPNZYCBIsK/GLXTLoUj0uwOynKMAt2Rdz75YvxDZyVl9EK3xtPQYbmb
         gAAeHZb4AvuZqOkcwKP15oZtxjpAElyDvOvOsrbDCSVo5AC9EzpO+DX/UdlxHWhC5h0Z
         fDyej/ki/ha5B4/QSFeuVxmNEYD5IPeJorMiiSzwgQ42/mq+Ym8RDYjxC9VK3HueH3ng
         CGEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=/UD7ECwp4WuKH9NLuZzUXFZF2DqwUuCPjbSxMoZcruU=;
        b=FWi29H3DQX81oOgKDBbfDs76naaR+8aoabmHnZQs+ECad73Xjzal9MH9EEDj3ku+hV
         2V42Em2GMzWxBHi6B2+nv5/1D+obly5YoRZ3VVUTHqGcFocrVfJh8EPPkksjQIrLIzqv
         F5sP4/tHwTgkqeiYEzOeKTU0/cYEmc/fwfSvdj5gzFkw5Z9U99U5c0hFSxi3OwBjFSbS
         E+sxEnvIiYrCyxlGS27Pv8HM02brxpF6uDupFWVwrY+t6bH5ZQL8KaxaPV9ZknfrdqKS
         C3aqWO+zOSwhCSp7pCmkv6ATuCZUuqUwpK9gJ7I1L3S/culUhKW7qaZ9tF/SI1/Bz0hA
         Ao/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FNCS+A3m;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id d197si1555925ybc.65.2020.09.11.00.28.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2020 00:28:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FNCS+A3m;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599809323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/UD7ECwp4WuKH9NLuZzUXFZF2DqwUuCPjbSxMoZcruU=;
	b=FNCS+A3mCflKOJgHG5IqGm8Y9WGHMQoznKGb/lGW3di1hOUFI0JP0BZibF8p4K04tB1tOy
	ZvWCCi8UKN0OUzys3yReii2d6ZudYw1uGdH9Zf3y1LHE+z/6iyCNNIMaUxgZ9DbMZXDKwZ
	HVMq13jmQO9pd58UuqrTwosAZWCwwAM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-0XrA_3b7OT-zsKMZ9EfZww-1; Fri, 11 Sep 2020 03:28:39 -0400
X-MC-Unique: 0XrA_3b7OT-zsKMZ9EfZww-1
Received: by mail-ed1-f69.google.com with SMTP id d13so3866229edz.18
        for <alex.bennee@linaro.org>; Fri, 11 Sep 2020 00:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/UD7ECwp4WuKH9NLuZzUXFZF2DqwUuCPjbSxMoZcruU=;
        b=S1qvw1cHjdldi+NcY66cPK/qACfvQ/wnav5r2c6Q3Y2RCZyE5l8vdmMinJTEtugsSC
         8guotTZHR4qE5LOGRjFd+RFKM+qPWEUdSKAsf8lF6JQIzyXGqkKP/yfDsDNFpX0kFMO/
         4KB4/x/M/Pp54qsabmXGbeWjT7W5d0wxd2n2rtJn3mnw1/HTD0ZKu6RG53Med4bCYiO6
         yEK8l1D8IPKeAWalYxNEeqdSY+33XBOG5WzMVJjXOqHSodsrddvrmYHRq+omoWk5fYhB
         humd9koI0JUJ7W9frdhZ0zHSexlJeBQwmJ79Gnkmtf6gpzPxzCRkQKPp4lcKeD4wvOLl
         ILAA==
X-Gm-Message-State: AOAM533BlUkvnGd1E/9oIpIU+nj5iMRg2JIUCTfb6t1EZb80FIUaJzxZ
	TO26/4MIHL2suEXzspfBeT8XpibE8oFaPEctzasfalgb/BbkqXlJmVDnm/FWMF1iPBsjGs49e68
	EOmVCEDd6IOoKWzvO
X-Received: by 2002:a17:906:3755:: with SMTP id e21mr758709ejc.39.1599809318707;
        Fri, 11 Sep 2020 00:28:38 -0700 (PDT)
X-Received: by 2002:a17:906:3755:: with SMTP id e21mr758688ejc.39.1599809318522;
        Fri, 11 Sep 2020 00:28:38 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPv6:2001:b07:6468:f312:6689:90a2:a29f:8336? ([2001:b07:6468:f312:6689:90a2:a29f:8336])
        by smtp.gmail.com with ESMTPSA id f13sm947456edn.73.2020.09.11.00.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 00:28:37 -0700 (PDT)
Subject: Re: [PATCH 4/6] hw/net/xilinx_axienet: Rename StreamSlave as
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
 <20200910070131.435543-5-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9214b56d-59e7-1229-bf01-b6dca0445014@redhat.com>
Date: Fri, 11 Sep 2020 09:28:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200910070131.435543-5-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TUID: uvdONdc7fvXk

On 10/09/20 09:01, Philippe Mathieu-Daudé wrote:
> In order to use inclusive terminology, rename 'slave stream'
> as 'sink stream'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/net/xilinx_axienet.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index 0c4ac727207..4e48535f373 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -46,11 +46,11 @@
>       OBJECT_CHECK(XilinxAXIEnet, (obj), TYPE_XILINX_AXI_ENET)
>  
>  #define XILINX_AXI_ENET_DATA_STREAM(obj) \
> -     OBJECT_CHECK(XilinxAXIEnetStreamSlave, (obj),\
> +     OBJECT_CHECK(XilinxAXIEnetStreamSink, (obj),\
>       TYPE_XILINX_AXI_ENET_DATA_STREAM)
>  
>  #define XILINX_AXI_ENET_CONTROL_STREAM(obj) \
> -     OBJECT_CHECK(XilinxAXIEnetStreamSlave, (obj),\
> +     OBJECT_CHECK(XilinxAXIEnetStreamSink, (obj),\
>       TYPE_XILINX_AXI_ENET_CONTROL_STREAM)
>  
>  /* Advertisement control register. */
> @@ -310,10 +310,10 @@ struct TEMAC  {
>      void *parent;
>  };
>  
> -typedef struct XilinxAXIEnetStreamSlave XilinxAXIEnetStreamSlave;
> +typedef struct XilinxAXIEnetStreamSink XilinxAXIEnetStreamSink;
>  typedef struct XilinxAXIEnet XilinxAXIEnet;
>  
> -struct XilinxAXIEnetStreamSlave {
> +struct XilinxAXIEnetStreamSink {
>      Object parent;
>  
>      struct XilinxAXIEnet *enet;
> @@ -325,8 +325,8 @@ struct XilinxAXIEnet {
>      qemu_irq irq;
>      StreamSink *tx_data_dev;
>      StreamSink *tx_control_dev;
> -    XilinxAXIEnetStreamSlave rx_data_dev;
> -    XilinxAXIEnetStreamSlave rx_control_dev;
> +    XilinxAXIEnetStreamSink rx_data_dev;
> +    XilinxAXIEnetStreamSink rx_control_dev;
>      NICState *nic;
>      NICConf conf;
>  
> @@ -859,7 +859,7 @@ xilinx_axienet_control_stream_push(StreamSink *obj, uint8_t *buf, size_t len,
>                                     bool eop)
>  {
>      int i;
> -    XilinxAXIEnetStreamSlave *cs = XILINX_AXI_ENET_CONTROL_STREAM(obj);
> +    XilinxAXIEnetStreamSink *cs = XILINX_AXI_ENET_CONTROL_STREAM(obj);
>      XilinxAXIEnet *s = cs->enet;
>  
>      assert(eop);
> @@ -880,7 +880,7 @@ static size_t
>  xilinx_axienet_data_stream_push(StreamSink *obj, uint8_t *buf, size_t size,
>                                  bool eop)
>  {
> -    XilinxAXIEnetStreamSlave *ds = XILINX_AXI_ENET_DATA_STREAM(obj);
> +    XilinxAXIEnetStreamSink *ds = XILINX_AXI_ENET_DATA_STREAM(obj);
>      XilinxAXIEnet *s = ds->enet;
>  
>      /* TX enable ?  */
> @@ -954,8 +954,8 @@ static NetClientInfo net_xilinx_enet_info = {
>  static void xilinx_enet_realize(DeviceState *dev, Error **errp)
>  {
>      XilinxAXIEnet *s = XILINX_AXI_ENET(dev);
> -    XilinxAXIEnetStreamSlave *ds = XILINX_AXI_ENET_DATA_STREAM(&s->rx_data_dev);
> -    XilinxAXIEnetStreamSlave *cs = XILINX_AXI_ENET_CONTROL_STREAM(
> +    XilinxAXIEnetStreamSink *ds = XILINX_AXI_ENET_DATA_STREAM(&s->rx_data_dev);
> +    XilinxAXIEnetStreamSink *cs = XILINX_AXI_ENET_CONTROL_STREAM(
>                                                              &s->rx_control_dev);
>  
>      object_property_add_link(OBJECT(ds), "enet", "xlnx.axi-ethernet",
> @@ -1046,7 +1046,7 @@ static const TypeInfo xilinx_enet_info = {
>  static const TypeInfo xilinx_enet_data_stream_info = {
>      .name          = TYPE_XILINX_AXI_ENET_DATA_STREAM,
>      .parent        = TYPE_OBJECT,
> -    .instance_size = sizeof(struct XilinxAXIEnetStreamSlave),
> +    .instance_size = sizeof(struct XilinxAXIEnetStreamSink),
>      .class_init    = xilinx_enet_data_stream_class_init,
>      .interfaces = (InterfaceInfo[]) {
>              { TYPE_STREAM_SINK },
> @@ -1057,7 +1057,7 @@ static const TypeInfo xilinx_enet_data_stream_info = {
>  static const TypeInfo xilinx_enet_control_stream_info = {
>      .name          = TYPE_XILINX_AXI_ENET_CONTROL_STREAM,
>      .parent        = TYPE_OBJECT,
> -    .instance_size = sizeof(struct XilinxAXIEnetStreamSlave),
> +    .instance_size = sizeof(struct XilinxAXIEnetStreamSink),
>      .class_init    = xilinx_enet_control_stream_class_init,
>      .interfaces = (InterfaceInfo[]) {
>              { TYPE_STREAM_SINK },
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
