Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2011559lfq;
        Fri, 11 Sep 2020 00:32:13 -0700 (PDT)
X-Received: by 2002:a19:cb54:: with SMTP id b81mr306473lfg.37.1599809533122;
        Fri, 11 Sep 2020 00:32:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599809533; cv=none;
        d=google.com; s=arc-20160816;
        b=YvaLZ2z5enred5G3nzBn2U1RscCg8g/8FwPhLJ3pmlZclJ67yC/7I1fa8HT5sgX4wa
         8DfR+xs5AdM6f3JZa8cCg5HsgSnrLzMMmdfzUZeAfQXzpTwIp9VM3/Nw0i7Lh4xWFyGA
         Rl/gLYuHPOcPuFNkH+D+nIkkWptcJUIEFS7cqwMfa3H/CWqIL5HumAjptNiguJM/Es/u
         wCYMf4EgiI4bxAzkJyvM3vRFVQbOFHhA47AG5DHGF0liGs6mJcDRMC8x14vjLQkcFmfO
         kWDascQ46Lhiop3ybn8tqrA7wV1rKz7AU4QOYTCoRDRIQMBhRaBhJ9ia14zTbuSqe5B7
         gBMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=LHK4F2MqWd5dXKy2V+64wHdCsq3BPH6G32kaFVS1Kgg=;
        b=iHKqVsCk7qGMcELmQyoIN+CFhJTjjTpI/GS2Xs5qoHYGwDbIrdUiGK0uqNt0t8LUvP
         lX+kEzTZgQfS66aYA8eMsFEuc8rf/1YnDeNn3atXeh6w98BK0fNl/3r72X1aEKRwG74p
         kvhBkiKQExX0gS8qY+5ktUAWTJDP4M7PjElagLBATgXD9V1L3I+e48Yn896ShXze0x0P
         VteQGJzgG2xVruV5iKqtZNB6biRm2fp/ktI4ymLUZcQmEnSGEmQudp41aKt71UJJagmY
         d5GVTZ6xV3q2qCcKdYVvIA3cn4trtPrhhuJiTFuXY2ZFL5+WHeequd/5VIOwCJYnd66X
         HaSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=UNV2LkEj;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m2sor250128lfg.54.2020.09.11.00.32.12
        (Google Transport Security);
        Fri, 11 Sep 2020 00:32:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=UNV2LkEj;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=LHK4F2MqWd5dXKy2V+64wHdCsq3BPH6G32kaFVS1Kgg=;
        b=UNV2LkEjubfC/T5nSdh5SJQEeFEi+/GuTRy/PdeUmphzfexU206EnRai71uF2gRuaA
         IzvGp1pSIwarpiPgMDh1q8s8jH8rE0hyo3KMsCt68m0uRFNYIKpoTBbEs+gG0gA1Bm7B
         coX9xzWLNnjUtL1klXrTbpYVZBlCrFnSqCFCnQiY+Xc6vz8amBpGd+V0uQ7LeF256iPo
         7Hn/qLsgr/Y6sCDJgMyfj5L4Hr5+WwWHkIYK8YUs1TehOZDpoDM/ly3ZvJfFcfSp5Z2V
         j65gPkHQWFVCq0S2N6MvkqyLUCq5UIoz+tuVlXjfqd3LGBdwxpVhi3UEsx2FrffvdZVn
         ENNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=LHK4F2MqWd5dXKy2V+64wHdCsq3BPH6G32kaFVS1Kgg=;
        b=jKU8w8SA8Ev30sMiN2kxm39L0Lv9b6ZX44Ycl7d5CE7saUcbRhH1MuPVKNxE7Ii2Mn
         CqDXcjcfA+U9HtX1jqbuqoe7OleuWvTweqNf3LGqo3MS36JuHPa9xdqNb/+3K1pzPnJE
         iJE8/jxCVOEfbpLZjFyHFE2qGnL5lrzrJBScuIr25IeMxzFJMTqdNTilZqj38BFwtIKw
         p5XU1qSt0z4b5w1QbCVkuN/8eaGhZW31BtBnfYeowu97Q8OAdqyEUNcTU5TUUYsmdDF/
         xAZNaL2oyVxIMYrnB88N76KtQ6NQGD1tfSOWvL3L+0Sb+n2SAFPHJyrCv6CLctkn3VME
         JQgQ==
X-Gm-Message-State: AOAM531nq6XcL3BVzd1fulcGPABRsGrxiBe60JjuF7wV0pGETfkC1fc2
	ZuT4rdQuc8YAll4372zOWrw=
X-Google-Smtp-Source: ABdhPJxyeuqUgihgOc4fwupdHuaN5J/O1r9PTCdHVhBWU7k75LyYISClw14MKQIX4EKOUkT1VwT9LQ==
X-Received: by 2002:a19:ca48:: with SMTP id h8mr297019lfj.173.1599809532525;
        Fri, 11 Sep 2020 00:32:12 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
        by smtp.gmail.com with ESMTPSA id j4sm362441ljc.116.2020.09.11.00.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 00:32:11 -0700 (PDT)
Date: Fri, 11 Sep 2020 09:32:11 +0200
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
Subject: Re: [PATCH 4/6] hw/net/xilinx_axienet: Rename StreamSlave as
 StreamSink
Message-ID: <20200911073211.GE2954729@toto>
References: <20200910070131.435543-1-philmd@redhat.com>
 <20200910070131.435543-5-philmd@redhat.com>
 <9214b56d-59e7-1229-bf01-b6dca0445014@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9214b56d-59e7-1229-bf01-b6dca0445014@redhat.com>
X-TUID: 8ku3Npp7WZ/G

On Fri, Sep 11, 2020 at 09:28:38AM +0200, Paolo Bonzini wrote:
> On 10/09/20 09:01, Philippe Mathieu-Daudé wrote:
> > In order to use inclusive terminology, rename 'slave stream'
> > as 'sink stream'.
> > 
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > ---
> >  hw/net/xilinx_axienet.c | 24 ++++++++++++------------
> >  1 file changed, 12 insertions(+), 12 deletions(-)
> > 
> > diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> > index 0c4ac727207..4e48535f373 100644
> > --- a/hw/net/xilinx_axienet.c
> > +++ b/hw/net/xilinx_axienet.c
> > @@ -46,11 +46,11 @@
> >       OBJECT_CHECK(XilinxAXIEnet, (obj), TYPE_XILINX_AXI_ENET)
> >  
> >  #define XILINX_AXI_ENET_DATA_STREAM(obj) \
> > -     OBJECT_CHECK(XilinxAXIEnetStreamSlave, (obj),\
> > +     OBJECT_CHECK(XilinxAXIEnetStreamSink, (obj),\
> >       TYPE_XILINX_AXI_ENET_DATA_STREAM)
> >  
> >  #define XILINX_AXI_ENET_CONTROL_STREAM(obj) \
> > -     OBJECT_CHECK(XilinxAXIEnetStreamSlave, (obj),\
> > +     OBJECT_CHECK(XilinxAXIEnetStreamSink, (obj),\
> >       TYPE_XILINX_AXI_ENET_CONTROL_STREAM)
> >  
> >  /* Advertisement control register. */
> > @@ -310,10 +310,10 @@ struct TEMAC  {
> >      void *parent;
> >  };
> >  
> > -typedef struct XilinxAXIEnetStreamSlave XilinxAXIEnetStreamSlave;
> > +typedef struct XilinxAXIEnetStreamSink XilinxAXIEnetStreamSink;
> >  typedef struct XilinxAXIEnet XilinxAXIEnet;
> >  
> > -struct XilinxAXIEnetStreamSlave {
> > +struct XilinxAXIEnetStreamSink {
> >      Object parent;
> >  
> >      struct XilinxAXIEnet *enet;
> > @@ -325,8 +325,8 @@ struct XilinxAXIEnet {
> >      qemu_irq irq;
> >      StreamSink *tx_data_dev;
> >      StreamSink *tx_control_dev;
> > -    XilinxAXIEnetStreamSlave rx_data_dev;
> > -    XilinxAXIEnetStreamSlave rx_control_dev;
> > +    XilinxAXIEnetStreamSink rx_data_dev;
> > +    XilinxAXIEnetStreamSink rx_control_dev;
> >      NICState *nic;
> >      NICConf conf;
> >  
> > @@ -859,7 +859,7 @@ xilinx_axienet_control_stream_push(StreamSink *obj, uint8_t *buf, size_t len,
> >                                     bool eop)
> >  {
> >      int i;
> > -    XilinxAXIEnetStreamSlave *cs = XILINX_AXI_ENET_CONTROL_STREAM(obj);
> > +    XilinxAXIEnetStreamSink *cs = XILINX_AXI_ENET_CONTROL_STREAM(obj);
> >      XilinxAXIEnet *s = cs->enet;
> >  
> >      assert(eop);
> > @@ -880,7 +880,7 @@ static size_t
> >  xilinx_axienet_data_stream_push(StreamSink *obj, uint8_t *buf, size_t size,
> >                                  bool eop)
> >  {
> > -    XilinxAXIEnetStreamSlave *ds = XILINX_AXI_ENET_DATA_STREAM(obj);
> > +    XilinxAXIEnetStreamSink *ds = XILINX_AXI_ENET_DATA_STREAM(obj);
> >      XilinxAXIEnet *s = ds->enet;
> >  
> >      /* TX enable ?  */
> > @@ -954,8 +954,8 @@ static NetClientInfo net_xilinx_enet_info = {
> >  static void xilinx_enet_realize(DeviceState *dev, Error **errp)
> >  {
> >      XilinxAXIEnet *s = XILINX_AXI_ENET(dev);
> > -    XilinxAXIEnetStreamSlave *ds = XILINX_AXI_ENET_DATA_STREAM(&s->rx_data_dev);
> > -    XilinxAXIEnetStreamSlave *cs = XILINX_AXI_ENET_CONTROL_STREAM(
> > +    XilinxAXIEnetStreamSink *ds = XILINX_AXI_ENET_DATA_STREAM(&s->rx_data_dev);
> > +    XilinxAXIEnetStreamSink *cs = XILINX_AXI_ENET_CONTROL_STREAM(
> >                                                              &s->rx_control_dev);
> >  
> >      object_property_add_link(OBJECT(ds), "enet", "xlnx.axi-ethernet",
> > @@ -1046,7 +1046,7 @@ static const TypeInfo xilinx_enet_info = {
> >  static const TypeInfo xilinx_enet_data_stream_info = {
> >      .name          = TYPE_XILINX_AXI_ENET_DATA_STREAM,
> >      .parent        = TYPE_OBJECT,
> > -    .instance_size = sizeof(struct XilinxAXIEnetStreamSlave),
> > +    .instance_size = sizeof(struct XilinxAXIEnetStreamSink),
> >      .class_init    = xilinx_enet_data_stream_class_init,
> >      .interfaces = (InterfaceInfo[]) {
> >              { TYPE_STREAM_SINK },
> > @@ -1057,7 +1057,7 @@ static const TypeInfo xilinx_enet_data_stream_info = {
> >  static const TypeInfo xilinx_enet_control_stream_info = {
> >      .name          = TYPE_XILINX_AXI_ENET_CONTROL_STREAM,
> >      .parent        = TYPE_OBJECT,
> > -    .instance_size = sizeof(struct XilinxAXIEnetStreamSlave),
> > +    .instance_size = sizeof(struct XilinxAXIEnetStreamSink),
> >      .class_init    = xilinx_enet_control_stream_class_init,
> >      .interfaces = (InterfaceInfo[]) {
> >              { TYPE_STREAM_SINK },
> > 
> 
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
