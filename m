Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4262075ejb;
        Tue, 13 Dec 2022 06:18:55 -0800 (PST)
X-Received: by 2002:a17:90b:eca:b0:219:1767:da71 with SMTP id gz10-20020a17090b0eca00b002191767da71mr21548151pjb.27.1670941134890;
        Tue, 13 Dec 2022 06:18:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670941134; cv=none;
        d=google.com; s=arc-20160816;
        b=oAXjKUrEX4Gu+KVVZhZNfZEvg6tBAwkHU4WWdYpbXCUiL1oOo90Zx3jEORKXNUwZ0o
         hAQ7XhZzXSxtwWcMXaKiVTnnRyNodR63inrM45zt/+4pZyLa1WAi7fMgUUVw4MSc2BjE
         qFfVxU//p7BPedAaVb/yTswNukDg66oILwrZ8ljFM6H+K73Je6ZidbRdyEwkNSAo8XMc
         I+mcxnO2mLjoQf0iBWElwqdd7INwm387zryN1NEG9Vcyuf6F9vfFhdGXWjHd3zdF4VAz
         K6R9ICATrs4bv4k5pXYM0KQwdsdnrn6zQ2hswUUgxcSESHDmGucp88ooyy54RSasDtrI
         wQyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+m6ZKAICPn9j3w/htDAK7QNQLYXiFdOWEL40MP21xhA=;
        b=qiIh4J8O39bTZhwc96xfiRfAdeusDWOkusG9IiBC0x2P+9AxB2ofLaoAHD1/0yyz3Q
         6xVv17BdVPX4MZNO58YW5BTJAh9tNcspwnrTsHWOBnKZx9DqZxqSY678WdM0bnF4/nYN
         jyuuu8v3leJn3Mp4p4g+skCYMlrCN7EaWvUWjrpJxcdobM30MqqBEtjDUsf9N2qOtlgt
         62tyZiRE/dImG3zAGn1+aDmNEvXmQQnZroLtGG7ldq2L552aaKCEUF/IWNOt4szk3df5
         wNoKW8zOgC/qjzRrWP0Bh6BZQ2cLGfa9NUxibhjqF69qMR8Z7py9nb26Dpax/ZyDNIMJ
         96uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WPRyl7t+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d7-20020a17090a7bc700b0021961f0f6a8sor5600968pjl.19.2022.12.13.06.18.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 Dec 2022 06:18:54 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WPRyl7t+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+m6ZKAICPn9j3w/htDAK7QNQLYXiFdOWEL40MP21xhA=;
        b=WPRyl7t+ywhcpnp/UEHC1DaWN7KsyMuiKOARM9g9NpqewayvRUDHdB7aOCNtBgcASD
         s/SNi2s/HE49WwFvXIiWA97auvqv/oKasO2S12/64Ua7NNroGFrsiYkDSc1dSI2P+Yqj
         ALXOf1FJMEpUkQ/+wxdTlRBqb8WJVN6Cp0rSW5L098vlfpXZhByMe5slgIDRF6rHgWnZ
         NwrPjmEyb+NYqhlKsj2Ho4pUt+jEihASKbwM9cpCPBu3cDMOX9yFEVbX10vLNiJt4xox
         Q4NCH4E8RosYYSPNDm1RDKd+y2njzTM7svt+rjy2bG1EJijmQshjWTGZveyHivndqE79
         dYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+m6ZKAICPn9j3w/htDAK7QNQLYXiFdOWEL40MP21xhA=;
        b=Z0S8YKK6lJiIxP2WECyS1pyDOBcTgniXt5Lm7iIufk/E55Xwrt2cOHY6E/iTmsh/GH
         l8AM4sKbzNFy/ZjzDnarFaVDa2hKPCWSzLyWa5yTXswBcg0bJGQ4TO3Kd1YDuONfK+cD
         xHXLi38fWaXij+ogHXgjmOxNUHDm4E1IXtgIoPPu6M9iJ63G2gG+pI6eIwKpXvtrkjq2
         9VMueEneF5xj4nUmmWhWucb7yy0hvKIFOFC6at8f0IUdgADvoipwomETsc0DgTd/Iw/K
         TRRgudqHsmyLD6SyHY3iZwzF/TssNBzUhW/hgODiVFLIj7RRnwDlUytb+EhjjW4CIlAu
         yrKw==
X-Gm-Message-State: ANoB5pm04zFazs9w8LEZqsJ0sxWZKcv3G38kskuhEuzCr7O5KXAzjbdP
	FRTdEnUguV2SUIoiO8UbmK6kIp4p6DOB98yy0Hs+Ddbg
X-Google-Smtp-Source: AA0mqf7e7VLetqtGNv2LtFG+EuaowCmUrdbYDZVMJPdl/9rnLnDLXB2yktoYvnXe9r8OpzSozvvE6Wi4xoUbggRKqEc=
X-Received: by 2002:a17:90b:3c05:b0:219:e2f1:81ad with SMTP id
 pb5-20020a17090b3c0500b00219e2f181admr350081pjb.19.1670941134469; Tue, 13 Dec
 2022 06:18:54 -0800 (PST)
MIME-Version: 1.0
References: <20221213125218.39868-1-philmd@linaro.org> <20221213125218.39868-4-philmd@linaro.org>
 <CAFEAcA-iouFJgu_2cG2TapxYVr-_ZK1Uuwa4mqSL5zNKg6Jq+Q@mail.gmail.com> <Y5iEL5YexYliX+cG@toto>
In-Reply-To: <Y5iEL5YexYliX+cG@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Dec 2022 14:18:42 +0000
Message-ID: <CAFEAcA8=fePrpR4LOp6qQznz58kNGgy8ZuiZaEE6Dy43hLvH3g@mail.gmail.com>
Subject: Re: [RFC PATCH-for-8.0 3/3] hw/net/xilinx_ethlite: Replace tswap32()
 by be32_to_cpu()
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
	BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Alistair Francis <alistair@alistair23.me>, David Gibson <david@gibson.dropbear.id.au>, 
	Jason Wang <jasowang@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: f7pd12tqcLK4

On Tue, 13 Dec 2022 at 14:14, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> On Tue, Dec 13, 2022 at 01:53:15PM +0000, Peter Maydell wrote:
> > On Tue, 13 Dec 2022 at 12:52, Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org> wrote:
> > >
> > > This partly revert commit d48751ed4f ("xilinx-ethlite:
> > > Simplify byteswapping to/from brams") which states the
> > > packet data is stored in big-endian.
> > >
> > > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >
> > > @@ -102,8 +102,8 @@ eth_read(void *opaque, hwaddr addr, unsigned int =
size)
> > >              D(qemu_log("%s " TARGET_FMT_plx "=3D%x\n", __func__, add=
r * 4, r));
> > >              break;
> > >
> > > -        default:
> > > -            r =3D tswap32(s->regs[addr]);
> > > +        default: /* Packet data */
> > > +            r =3D be32_to_cpu(s->regs[addr]);
> > >              break;
> > >      }
> > >      return r;
> > > @@ -160,8 +160,8 @@ eth_write(void *opaque, hwaddr addr,
> > >              s->regs[addr] =3D value;
> > >              break;
> > >
> > > -        default:
> > > -            s->regs[addr] =3D tswap32(value);
> > > +        default: /* Packet data */
> > > +            s->regs[addr] =3D cpu_to_be32(value);
> > >              break;
> > >      }
> > >  }
> >
> > This is a change of behaviour for this device in the
> > qemu-system-microblazeel petalogix-s3adsp1800 board, because
> > previously on that system the bytes of the rx buffer would
> > appear in the registers in little-endian order and now they
> > will appear in big-endian order.
> >
> > Edgar, do you know what the real hardware does here ?

> Yeah, I think these tx/rx buffers (the default case with tswap32)
> should be modelled as plain RAM's (they are just RAM's on real HW).
> Because we're modeling as MMIO regs, I think we get into endianness
> trouble when the ethernet output logic treats the content as a blob
> (thus the need for byteswaps). Does that make sense?

As a concrete question: if I do a 32-bit load from the buffer
register into a CPU register, do I get a different value
on the BE microblaze hardware vs LE microblaze ?

thanks
-- PMM
