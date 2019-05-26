Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4741477wrg;
        Sat, 25 May 2019 18:02:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzdn1YBsJzl79nM6I5RkB7LXusQo3sCNgQT6PX0811nBWA41YOTp01j9WcLa5MxwJbvONal
X-Received: by 2002:a37:4f10:: with SMTP id d16mr68891507qkb.71.1558832571391;
        Sat, 25 May 2019 18:02:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558832571; cv=none;
        d=google.com; s=arc-20160816;
        b=Sfhv846gf3Fm6fwMXJ8069Q8ITvRTbNie85uQ5BusnX9WP7Br0oadYIxHOvADGwoKV
         KDuQgVvJUggVfSJ1Le6E8rKdFoYCLv1CIKhd0PeQJFzxdLuZHaf3xOJBvCQrCsi/HdFl
         CjptaFqLEfz1d0hy2YH47zDZYOiJkQIfx1C3zaYdh1AcpEttgxZ/LaEUU+I6peZqVOvi
         O2Dm6MYvaNtUZ+CfWFgFbqx98zueIurRPlklWSZjhyOWOXavExp4eSMsT9sVOEgd21Ih
         BaB3+ugQwrJAldz6iDldy15wC+Q9jgdulS7vpBlIKadJU2+Vh+lG3kjtzduwsKva2wtr
         TyrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=HLxPrkdBevASRvmB+ZsgA2RjERgw/S4LsH4oRQDrCec=;
        b=BYWNY1L3WZwaISC1Qx4zUROBoLm3tbwSBQhdcEpqSsEn0+g+xwn1NzDFrkLSt0o124
         UYn4OJsQyK6hhkfLFjf+Wrz+4hE/9beeR/2++3Ri3E7DqLMw3VfLa26cprdDWFDlu9Xo
         rWO74XprNAU1GASPkBwpVlwl7yS8wtwkM0wJbZeMmuGZBj/Uuw33aOip7l1aNBs3JueR
         xlyZuBLXv433sSSWlwDIe8bfFUYWNhkpLKcBklWxnHzHZw3FIzP9MWI+F6Nl8KjwnJwH
         431vDdYHXcAZ95y0kKNyfKcewOHPqo/8/UaG7Ql/WxuShnr4UaLVkeXzrzvczX1SiFwx
         ON/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@juliacomputing-com.20150623.gappssmtp.com header.s=20150623 header.b=c6afMm7W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y28si1303834qve.195.2019.05.25.18.02.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 25 May 2019 18:02:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@juliacomputing-com.20150623.gappssmtp.com header.s=20150623 header.b=c6afMm7W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:48850 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hUhYp-0008J5-0V
	for alex.bennee@linaro.org; Sat, 25 May 2019 21:02:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <keno@juliacomputing.com>) id 1hUhXj-0007v5-3A
	for qemu-devel@nongnu.org; Sat, 25 May 2019 21:01:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <keno@juliacomputing.com>) id 1hUhXh-0000Qi-Rg
	for qemu-devel@nongnu.org; Sat, 25 May 2019 21:01:43 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:35497)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <keno@juliacomputing.com>)
	id 1hUhXh-0000Q9-Fn
	for qemu-devel@nongnu.org; Sat, 25 May 2019 21:01:41 -0400
Received: by mail-io1-xd42.google.com with SMTP id p2so10649257iol.2
	for <qemu-devel@nongnu.org>; Sat, 25 May 2019 18:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=juliacomputing-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=HLxPrkdBevASRvmB+ZsgA2RjERgw/S4LsH4oRQDrCec=;
	b=c6afMm7WiLCz+aJ/9cxjQtlkkLuaRvRiJUvFUDnVAWtdiZjwgJ1eHuF5rNnvwOiDOT
	mk6YVAM7mEAAmAy48H8pLJG6WtPatoQGNkI3Xz4ujXMiQ87uiOcmdwFIz7H6EIHKJzFO
	Gj3T48ifd4LM4N1UxPwrRp1C5FE4uNBSIO9AThSZP+yw6FW9zWxdLyuX7XQ1K1I8sdO8
	NPzKc1qxitDwAT7ZXnu8ZrKIxW/8zd3hgtHDslBBwrCGp3nVSyznrr7S4z8gAHGPnzLk
	lOObVf3NAU6V+lqW4QbvAtGdgZ3UwVB2YqmNs7F1JhQqzkGpUBzu+DDDMUO1s2yzrzim
	eEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=HLxPrkdBevASRvmB+ZsgA2RjERgw/S4LsH4oRQDrCec=;
	b=Zx4XP8XCkOPrlBRq05urlEdF+z+AU7d99R4HgC7yIIBH3Cve0O/FoSF3bc8qH5Stco
	76SaYNpXU85i5cBEpEL742q8XOcFDnSSqe2sTdWj2diVnp/ZzcuG1+Q582gxaDIzusti
	6X8BxO8HCHF0DDHI8weMBvJkd7Uq5rBTIqbB3ErJiRIf4mSiy3fyfFfD2hLrzV4Umw4j
	zNKGd3uvJ4wt2wN4K/zBB0MQqmLaeBfFW1C+Y6ZpX7HHG0pgg8cN2TLfg9+2FCkSHHL2
	Mj6UTvPPzG4N0Z833GHPg32eb3f5jfQ3pMCsfyk80aQZDlxG2Z6+nVE0YDLBfqi1SZ5V
	7xLQ==
X-Gm-Message-State: APjAAAWtoU4/5CUWDjMpjbljCUOHklRSeXNlHyI9zsWy2X8tT1/O8HKP
	Uhq7IWL33fOEWFaDdt9vI48ifXxLQ/RFQN39l693Cg==
X-Received: by 2002:a6b:e703:: with SMTP id b3mr35862874ioh.145.1558832499668; 
	Sat, 25 May 2019 18:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190525151241.5017-1-clg@kaod.org>
	<20190525151241.5017-8-clg@kaod.org>
In-Reply-To: <20190525151241.5017-8-clg@kaod.org>
From: Keno Fischer <keno@juliacomputing.com>
Date: Sat, 25 May 2019 21:01:03 -0400
Message-ID: <CABV8kRycd41XNP09C9mBvTEEReZzFHC3U8gOq0Krzyj+c4KNgA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::d42
Subject: Re: [Qemu-devel] [PATCH 07/19] aspeed: add support for multiple NICs
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C8+x5y3CVQ6d

Drive by comment, since I spotted this in my inbox.
When I tried to make this change (two years ago though),
I additionally needed the following. Unfortunately, I don't quite remember
exactly what the issue was, but I think qemu would crash trying to create m=
ore
than one nic.

---
 hw/net/ftgmac100.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 8127d0532dc..1318de85a4e 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -977,7 +977,8 @@ static void ftgmac100_realize(DeviceState *dev,
Error **errp)
     sysbus_init_irq(sbd, &s->irq);
     qemu_macaddr_default_if_unset(&s->conf.macaddr);

-    s->conf.peers.ncs[0] =3D nd_table[0].netdev;
+    char *netdev_id =3D object_property_get_str(OBJECT(dev), "netdev", NUL=
L);
+    s->conf.peers.ncs[0] =3D qemu_find_netdev(netdev_id);

     s->nic =3D qemu_new_nic(&net_ftgmac100_info, &s->conf,
                           object_get_typename(OBJECT(dev)), DEVICE(dev)->i=
d,



On Sat, May 25, 2019 at 11:22 AM C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
>
> The Aspeed SoCs have two MACs. Extend the Aspeed model to support a
> second NIC.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  include/hw/arm/aspeed_soc.h |  3 ++-
>  hw/arm/aspeed_soc.c         | 33 +++++++++++++++++++--------------
>  2 files changed, 21 insertions(+), 15 deletions(-)
>
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 7247f6da2505..e8556abf4737 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -25,6 +25,7 @@
>  #define ASPEED_SPIS_NUM  2
>  #define ASPEED_WDTS_NUM  3
>  #define ASPEED_CPUS_NUM  2
> +#define ASPEED_MACS_NUM  2
>
>  typedef struct AspeedSoCState {
>      /*< private >*/
> @@ -42,7 +43,7 @@ typedef struct AspeedSoCState {
>      AspeedSMCState spi[ASPEED_SPIS_NUM];
>      AspeedSDMCState sdmc;
>      AspeedWDTState wdt[ASPEED_WDTS_NUM];
> -    FTGMAC100State ftgmac100;
> +    FTGMAC100State ftgmac100[ASPEED_MACS_NUM];
>  } AspeedSoCState;
>
>  #define TYPE_ASPEED_SOC "aspeed-soc"
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index b983d5efc5d1..8cfe9e9515ed 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -229,8 +229,10 @@ static void aspeed_soc_init(Object *obj)
>                                      sc->info->silicon_rev);
>      }
>
> -    sysbus_init_child_obj(obj, "ftgmac100", OBJECT(&s->ftgmac100),
> -                          sizeof(s->ftgmac100), TYPE_FTGMAC100);
> +    for (i =3D 0; i < ASPEED_MACS_NUM; i++) {
> +        sysbus_init_child_obj(obj, "ftgmac100[*]", OBJECT(&s->ftgmac100[=
i]),
> +                              sizeof(s->ftgmac100[i]), TYPE_FTGMAC100);
> +    }
>  }
>
>  static void aspeed_soc_realize(DeviceState *dev, Error **errp)
> @@ -371,19 +373,22 @@ static void aspeed_soc_realize(DeviceState *dev, Er=
ror **errp)
>      }
>
>      /* Net */
> -    qdev_set_nic_properties(DEVICE(&s->ftgmac100), &nd_table[0]);
> -    object_property_set_bool(OBJECT(&s->ftgmac100), true, "aspeed", &err=
);
> -    object_property_set_bool(OBJECT(&s->ftgmac100), true, "realized",
> -                             &local_err);
> -    error_propagate(&err, local_err);
> -    if (err) {
> -        error_propagate(errp, err);
> -        return;
> +    for (i =3D 0; i < nb_nics; i++) {
> +        qdev_set_nic_properties(DEVICE(&s->ftgmac100[i]), &nd_table[i]);
> +        object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "aspeed=
",
> +                                 &err);
> +        object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "realiz=
ed",
> +                                 &local_err);
> +        error_propagate(&err, local_err);
> +        if (err) {
> +            error_propagate(errp, err);
> +           return;
> +        }
> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->ftgmac100[i]), 0,
> +                        sc->info->memmap[ASPEED_ETH1 + i]);
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->ftgmac100[i]), 0,
> +                           aspeed_soc_get_irq(s, ASPEED_ETH1 + i));
>      }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->ftgmac100), 0,
> -                    sc->info->memmap[ASPEED_ETH1]);
> -    sysbus_connect_irq(SYS_BUS_DEVICE(&s->ftgmac100), 0,
> -                       aspeed_soc_get_irq(s, ASPEED_ETH1));
>  }
>
>  static void aspeed_soc_class_init(ObjectClass *oc, void *data)
> --
> 2.20.1
>
>
