Received: by 2002:a17:505:7d82:b0:1be9:327d:8ee3 with SMTP id wv2csp434513njc;
        Wed, 13 Nov 2024 07:12:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU503xjwgHJT9JpzL0RuuesQTAGiBtcx7OaYPVcbtVUjrzfLcOLHUzY9AfYtn6V7SyWh9uL7LUpmtlCuw==@linaro.org
X-Google-Smtp-Source: AGHT+IFrXiMorh7LT5HlIC0lNdyYkpTIyW1UJ9xqDepcQ/BUt7knqg19dbmwvsFkwS4DJu5yN6CS
X-Received: by 2002:a05:6214:578a:b0:6ce:2308:6c1f with SMTP id 6a1803df08f44-6d39e101be3mr269383786d6.3.1731510763895;
        Wed, 13 Nov 2024 07:12:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731510763; cv=none;
        d=google.com; s=arc-20240605;
        b=Z28lBpk0oXQv7TSKhCrguk1ZcVb4fNifK2lMz+MiAguoYlOEZqNjOcjXp8GFEONOVc
         fy+NmxgrO/zOcTTvHvC+KIcpNe8JSehaON4eJx6DKWHX4EFuvQ4e9K+wvOpmyqCUauLq
         nfLgJsII7MiSXd2RQ14P64GT14w6tGqB32Tmuwyz/ZFbw/8P65z8kPXpI4YuxGKXPKx3
         rUh2MYgQGEcZL0IB1yK3Ev6htyrHbDwsi2enXwUCxJCEY37GFYjZvuZU6/bOd40Vm6i7
         3k0A1h+HpKUooLu8K+AkXeZrT1x+7Omw++4q4UcRcU17hAeHDdPotxkcsDVv9IEL/3JZ
         LeJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=3V9nTvgPknEsBDvRmTKghId2TbPVGNXOIqrZi85K+1U=;
        fh=7rHlKMKV04Hwscj/hGIhn5KZivE0F3gtWDAMDo7/MKY=;
        b=eT3gCla5W1y0cmWSiggCE2hZZxEsj5FFzKq2YEGI6eupEXzsNuWDALxgxnj0XJKZXK
         BnxPaLJLNyrVeEsButjsnMZcmgTccuVvQgueWaGBtlofp7H53NenBKgfglNff/e8KqoZ
         XdJdOVntTpIZHC0taTnBNLhQ8+XFPMhLmwTHFrIlVyGOW4+8+5aJoWRJQ2magwQVZGn8
         GfUe1HkSMgo+Zy+0zvoXuYQ+RK4zLxl4Fgn51SWwmklniQTuMGzsoYMsQ2Hn1uEh9HsI
         dGcvQ4prc9RBl/XPcQxrWapxwayHQMOkeLOoteyGbEZIeR/ADXASngOshz9knLYuwxhP
         vL3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jp4gzq6E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d396228665si170763856d6.136.2024.11.13.07.12.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Nov 2024 07:12:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jp4gzq6E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBF2W-0000VV-UA; Wed, 13 Nov 2024 10:12:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1tBF2V-0000V7-Jl; Wed, 13 Nov 2024 10:12:15 -0500
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1tBF2T-0005zh-SM; Wed, 13 Nov 2024 10:12:15 -0500
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2fb5740a03bso10272161fa.1; 
 Wed, 13 Nov 2024 07:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731510731; x=1732115531; darn=nongnu.org;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3V9nTvgPknEsBDvRmTKghId2TbPVGNXOIqrZi85K+1U=;
 b=Jp4gzq6E8O2ImDSUX3NADGtsL8dzfelARp4Q0EsCFGrU7ePK/sSMcUwJ6UFY0WbOIe
 qFIAXtjnFU5C4TBua5j6+sfHAktSFgbdJlYKrL1fiv1/jSwSAfzcqYz+hPO5v5578n9z
 /QZFv6kju05TWs+GpmeSpDxCFqf29Pgg8+bgmHRzljm/wWXCyvxpx2XQIvtM4djcHPEM
 We5NVJgmxVEq0V5F8nQv9GGZblyn0Epgi+a/asvJYMh/mjNmeJ6Zo5Vt1v4ly7V3J72Q
 m92U1EtfkuHmyYKmjGYJ631Q1Gxi7Ek4QnVFiuCBYoOyOfyMXl009qWCziJx1Cp4Pu+M
 r2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731510731; x=1732115531;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3V9nTvgPknEsBDvRmTKghId2TbPVGNXOIqrZi85K+1U=;
 b=Lp87Rg0Z59X0XkzIz8JFnKRgYWWYwL8BZ/md1x5YziTty1J96eK4UXLjgsGO4EqbNW
 L+8Ga8nqFlVymQnMEV1OkOLoICsrsxySG37wx+z/PymhchF6uLeHKFrsbmmGA8cCpbM3
 p1FCwOQ+tK5FLIs7xnMEp9LqH/WEDxxSAlYDSim+PPbuVuPtJ44c2+Jj0EfKlIAUfdg2
 9eeZdgULDwlkg6d3/PVppoFjrd3exwNYmDtGed53eAlUYYmr6gwhsB/zk7WcJxo/7mwl
 eJbajWqSQqcxJ2ttc6IcHfOHA/Apg8YLkeV2YQEdQadIezvih0OFUrhMZDHvS6zXDEOr
 x9uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAtNjRK2zPTjO9VBDm2290/qb6nRjAEk2/OOHqm/LOcUiRDRSXfLAytRaZUsn57E9jhuYuKbq1ng==@nongnu.org
X-Gm-Message-State: AOJu0YyfxExchKqZAnXeglBXTehK4eP3YLvgzhNk48vl+pb4Kk67/dCK
 +PLgZpkwoLYFltuif3e56omQTbUXzFD0CYe6NMqtDLKFGXrtE4xr
X-Received: by 2002:a05:651c:12c3:b0:2f7:4f84:50a2 with SMTP id
 38308e7fff4ca-2ff426fbbeamr44336841fa.31.1731510731309; 
 Wed, 13 Nov 2024 07:12:11 -0800 (PST)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff178fa226sm23839981fa.46.2024.11.13.07.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 07:12:10 -0800 (PST)
Date: Wed, 13 Nov 2024 16:12:09 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Gustavo Romero <gustavo.romero@linaro.org>
Subject: Re: [PATCH 04/20] hw/net/xilinx_ethlite: Update QOM style
Message-ID: <ZzTByV5P4oDBAZVO@zapote>
References: <20241112181044.92193-1-philmd@linaro.org>
 <20241112181044.92193-5-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241112181044.92193-5-philmd@linaro.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +rw3HKKCDPjt

On Tue, Nov 12, 2024 at 07:10:28PM +0100, Philippe Mathieu-Daudé wrote:
> Use XlnxXpsEthLite typedef, OBJECT_DECLARE_SIMPLE_TYPE macro;
> convert type_init() to DEFINE_TYPES().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>


> ---
>  hw/net/xilinx_ethlite.c | 48 +++++++++++++++++++----------------------
>  1 file changed, 22 insertions(+), 26 deletions(-)
> 
> diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
> index 2b52597f03..0f59811c78 100644
> --- a/hw/net/xilinx_ethlite.c
> +++ b/hw/net/xilinx_ethlite.c
> @@ -53,10 +53,9 @@
>  #define CTRL_S     0x1
>  
>  #define TYPE_XILINX_ETHLITE "xlnx.xps-ethernetlite"
> -DECLARE_INSTANCE_CHECKER(struct xlx_ethlite, XILINX_ETHLITE,
> -                         TYPE_XILINX_ETHLITE)
> +OBJECT_DECLARE_SIMPLE_TYPE(XlnxXpsEthLite, XILINX_ETHLITE)
>  
> -struct xlx_ethlite
> +struct XlnxXpsEthLite
>  {
>      SysBusDevice parent_obj;
>  
> @@ -73,7 +72,7 @@ struct xlx_ethlite
>      uint32_t regs[R_MAX];
>  };
>  
> -static inline void eth_pulse_irq(struct xlx_ethlite *s)
> +static inline void eth_pulse_irq(XlnxXpsEthLite *s)
>  {
>      /* Only the first gie reg is active.  */
>      if (s->regs[R_TX_GIE0] & GIE_GIE) {
> @@ -84,7 +83,7 @@ static inline void eth_pulse_irq(struct xlx_ethlite *s)
>  static uint64_t
>  eth_read(void *opaque, hwaddr addr, unsigned int size)
>  {
> -    struct xlx_ethlite *s = opaque;
> +    XlnxXpsEthLite *s = opaque;
>      uint32_t r = 0;
>  
>      addr >>= 2;
> @@ -112,7 +111,7 @@ static void
>  eth_write(void *opaque, hwaddr addr,
>            uint64_t val64, unsigned int size)
>  {
> -    struct xlx_ethlite *s = opaque;
> +    XlnxXpsEthLite *s = opaque;
>      unsigned int base = 0;
>      uint32_t value = val64;
>  
> @@ -176,7 +175,7 @@ static const MemoryRegionOps eth_ops = {
>  
>  static bool eth_can_rx(NetClientState *nc)
>  {
> -    struct xlx_ethlite *s = qemu_get_nic_opaque(nc);
> +    XlnxXpsEthLite *s = qemu_get_nic_opaque(nc);
>      unsigned int rxbase = s->rxbuf * (0x800 / 4);
>  
>      return !(s->regs[rxbase + R_RX_CTRL0] & CTRL_S);
> @@ -184,7 +183,7 @@ static bool eth_can_rx(NetClientState *nc)
>  
>  static ssize_t eth_rx(NetClientState *nc, const uint8_t *buf, size_t size)
>  {
> -    struct xlx_ethlite *s = qemu_get_nic_opaque(nc);
> +    XlnxXpsEthLite *s = qemu_get_nic_opaque(nc);
>      unsigned int rxbase = s->rxbuf * (0x800 / 4);
>  
>      /* DA filter.  */
> @@ -214,7 +213,7 @@ static ssize_t eth_rx(NetClientState *nc, const uint8_t *buf, size_t size)
>  
>  static void xilinx_ethlite_reset(DeviceState *dev)
>  {
> -    struct xlx_ethlite *s = XILINX_ETHLITE(dev);
> +    XlnxXpsEthLite *s = XILINX_ETHLITE(dev);
>  
>      s->rxbuf = 0;
>  }
> @@ -228,7 +227,7 @@ static NetClientInfo net_xilinx_ethlite_info = {
>  
>  static void xilinx_ethlite_realize(DeviceState *dev, Error **errp)
>  {
> -    struct xlx_ethlite *s = XILINX_ETHLITE(dev);
> +    XlnxXpsEthLite *s = XILINX_ETHLITE(dev);
>  
>      qemu_macaddr_default_if_unset(&s->conf.macaddr);
>      s->nic = qemu_new_nic(&net_xilinx_ethlite_info, &s->conf,
> @@ -239,7 +238,7 @@ static void xilinx_ethlite_realize(DeviceState *dev, Error **errp)
>  
>  static void xilinx_ethlite_init(Object *obj)
>  {
> -    struct xlx_ethlite *s = XILINX_ETHLITE(obj);
> +    XlnxXpsEthLite *s = XILINX_ETHLITE(obj);
>  
>      sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
>  
> @@ -249,9 +248,9 @@ static void xilinx_ethlite_init(Object *obj)
>  }
>  
>  static Property xilinx_ethlite_properties[] = {
> -    DEFINE_PROP_UINT32("tx-ping-pong", struct xlx_ethlite, c_tx_pingpong, 1),
> -    DEFINE_PROP_UINT32("rx-ping-pong", struct xlx_ethlite, c_rx_pingpong, 1),
> -    DEFINE_NIC_PROPERTIES(struct xlx_ethlite, conf),
> +    DEFINE_PROP_UINT32("tx-ping-pong", XlnxXpsEthLite, c_tx_pingpong, 1),
> +    DEFINE_PROP_UINT32("rx-ping-pong", XlnxXpsEthLite, c_rx_pingpong, 1),
> +    DEFINE_NIC_PROPERTIES(XlnxXpsEthLite, conf),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> @@ -264,17 +263,14 @@ static void xilinx_ethlite_class_init(ObjectClass *klass, void *data)
>      device_class_set_props(dc, xilinx_ethlite_properties);
>  }
>  
> -static const TypeInfo xilinx_ethlite_info = {
> -    .name          = TYPE_XILINX_ETHLITE,
> -    .parent        = TYPE_SYS_BUS_DEVICE,
> -    .instance_size = sizeof(struct xlx_ethlite),
> -    .instance_init = xilinx_ethlite_init,
> -    .class_init    = xilinx_ethlite_class_init,
> +static const TypeInfo xilinx_ethlite_types[] = {
> +    {
> +        .name          = TYPE_XILINX_ETHLITE,
> +        .parent        = TYPE_SYS_BUS_DEVICE,
> +        .instance_size = sizeof(XlnxXpsEthLite),
> +        .instance_init = xilinx_ethlite_init,
> +        .class_init    = xilinx_ethlite_class_init,
> +    },
>  };
>  
> -static void xilinx_ethlite_register_types(void)
> -{
> -    type_register_static(&xilinx_ethlite_info);
> -}
> -
> -type_init(xilinx_ethlite_register_types)
> +DEFINE_TYPES(xilinx_ethlite_types)
> -- 
> 2.45.2
> 
