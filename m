Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4265908ejb;
        Tue, 13 Dec 2022 06:23:43 -0800 (PST)
X-Received: by 2002:ac2:4bd5:0:b0:4a4:68b7:e74b with SMTP id o21-20020ac24bd5000000b004a468b7e74bmr5568735lfq.53.1670941423714;
        Tue, 13 Dec 2022 06:23:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670941423; cv=none;
        d=google.com; s=arc-20160816;
        b=n0r9is4UumchvAW59ACu6yGxW1TITtxlvzcdPORzio6vSgMrPfHPnigZ5J23h9pl/6
         /eq1pFTSd5U4i3iaZA3AFngaPTvOwmNnf9tm9Nb0oF0Yf8h157rpWBJyUFzPTea+XacO
         MIClFnlSMAZfQv7sU5dIdxVWflGMasVguwpTFk5oga2zToRu2Z08NH79S07G7KzonwkX
         HP7iXtkYUSubIBLfMgwQs8hgLEi2uWIxc9vzZN+I3OOKUpBzuji9Ma3xN6tpxj7rJEL5
         z3IPEJ/aNYUh4wSaPDWmCilf457oBMLL/kt34yCXu0lgfcTYtDB0ojstMRHe3W3AUpBt
         5Hzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=e5zzLhMCE4m/P0+GnT6JWCNY7dNVF5Jn5ir2faVnvHA=;
        b=FVhF7PrTqWH0gGghTeDcaHzNztVJjOMSfXmAFn+fK9H2mnF9JmjJqYX732kOwlxYzP
         5vWyGnbFT7LK31nI9KEQoTKoi/GEV8hSXOdhVrkAD9EpgbvstZfYqUvnSQ7hqna3eGuS
         xy6PUd1ziWXg+smrdqpAckkbDnMo9QLulYtcWxBXyk5uBgzyQkciYO9XFbCSNwUIDbQL
         wkeV+7rVkZnuCtGABl441RTyzf9d+qjyeWr/gVkxIOJCW8bgCEbTBcKox2+0s27SxzdO
         iCLvVTrXSyOFRJPPWi3mVZFkXodbDsuVebpdljHv1SdDmoL5Z8JJacUlr1gLpqAvwb9p
         wTaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=C5CIlL6P;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bj37-20020a2eaaa5000000b0027a05e7b59csor1225165ljb.37.2022.12.13.06.23.43
        (Google Transport Security);
        Tue, 13 Dec 2022 06:23:43 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=C5CIlL6P;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e5zzLhMCE4m/P0+GnT6JWCNY7dNVF5Jn5ir2faVnvHA=;
        b=C5CIlL6PlBwBjoNhGNPIOzJPBzPa8/yZxWif2z97y+BBpAA5ZZMOnSf9HImTiJ3t7j
         oX8wDwsru81NRdHJjJxmVA7mmzyKSYEu45CrHuLF6PlDZ6W4SivBCMeXRuPpGgIw9Adv
         RzE3iU9kHj9Ph+SxxLfrPLctPgYq5rWs+ptFMhfhVOI0ZB3FnwkzYezeqvXKYa9UFTU8
         5orGV/NrQND88m7cV8PpftyGBGPHL+ImLj744n6Fz8AA9GpnOoLH2wBKuqJ5lXZBFz3w
         5MRx9QWbtkrPWaVaxGVLuJv+5YeJQgJgEc0sDBbSDFsqlOS//y8Wp6Xr7m/GiLvFl/zO
         vFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e5zzLhMCE4m/P0+GnT6JWCNY7dNVF5Jn5ir2faVnvHA=;
        b=VL40oEeN6huekj4HUI1pWx3jak7JCQ8ZJmendGZOgMK0lEmHRN66S6k6RCc3OI3Tl0
         Wj63b2N38adGwgPqKlSzllfmHRBg/IQFQjDNiwDB2u/CO5SbXGDL21h2emW0HNbwbkJ0
         0K2aC6lJ+xgD7b/sSLBjcNpcwsEwvnWrl7f/Rrt2HOJznc5V7ExcGGVwIjNH9XQ5f+53
         p7zad4ETsJFpDVoWMsblIA4UhEq77WO0x/Jdj406kgQN5nDKn4grTXicKw2Tt6qy6/5M
         /zPiDGLch33MNkdFlvme6xd7PWToetjFCMkhsjpsbFdG3mNcznxV2SzbQauWnWWLqIWE
         wIwQ==
X-Gm-Message-State: ANoB5pn/rN1nxAghFPBM6WfEPbQamH9iTNrVQFLT+PPLpPYLRCqKfi5R
	/oGLzit7O3eKpMbFYdxdN9cckkiPv4xCCimT
X-Google-Smtp-Source: AA0mqf6DRawMpdqBftXsHrmtqOkjRPUQyDTzIgj+xswOsw5sa0nA6LGXB/Vr+bKpmBxVVNmqse8y8g==
X-Received: by 2002:a2e:bd87:0:b0:277:23f:4985 with SMTP id o7-20020a2ebd87000000b00277023f4985mr4825138ljq.3.1670941422826;
        Tue, 13 Dec 2022 06:23:42 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (81-232-4-135-no39.tbcn.telia.com. [81.232.4.135])
        by smtp.gmail.com with ESMTPSA id s13-20020a2eb8cd000000b00279f302f652sm278625ljp.111.2022.12.13.06.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 06:23:42 -0800 (PST)
Date: Tue, 13 Dec 2022 15:23:41 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	qemu-devel@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	David Gibson <david@gibson.dropbear.id.au>,
	Jason Wang <jasowang@redhat.com>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org
Subject: Re: [RFC PATCH-for-8.0 3/3] hw/net/xilinx_ethlite: Replace tswap32()
 by be32_to_cpu()
Message-ID: <Y5iK7VFi9B1HwHf/@toto>
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-4-philmd@linaro.org>
 <CAFEAcA-iouFJgu_2cG2TapxYVr-_ZK1Uuwa4mqSL5zNKg6Jq+Q@mail.gmail.com>
 <Y5iEL5YexYliX+cG@toto>
 <CAFEAcA8=fePrpR4LOp6qQznz58kNGgy8ZuiZaEE6Dy43hLvH3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA8=fePrpR4LOp6qQznz58kNGgy8ZuiZaEE6Dy43hLvH3g@mail.gmail.com>
X-TUID: StbntMSFbjiR

On Tue, Dec 13, 2022 at 02:18:42PM +0000, Peter Maydell wrote:
> On Tue, 13 Dec 2022 at 14:14, Edgar E. Iglesias
> <edgar.iglesias@gmail.com> wrote:
> >
> > On Tue, Dec 13, 2022 at 01:53:15PM +0000, Peter Maydell wrote:
> > > On Tue, 13 Dec 2022 at 12:52, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> > > >
> > > > This partly revert commit d48751ed4f ("xilinx-ethlite:
> > > > Simplify byteswapping to/from brams") which states the
> > > > packet data is stored in big-endian.
> > > >
> > > > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > >
> > > > @@ -102,8 +102,8 @@ eth_read(void *opaque, hwaddr addr, unsigned int size)
> > > >              D(qemu_log("%s " TARGET_FMT_plx "=%x\n", __func__, addr * 4, r));
> > > >              break;
> > > >
> > > > -        default:
> > > > -            r = tswap32(s->regs[addr]);
> > > > +        default: /* Packet data */
> > > > +            r = be32_to_cpu(s->regs[addr]);
> > > >              break;
> > > >      }
> > > >      return r;
> > > > @@ -160,8 +160,8 @@ eth_write(void *opaque, hwaddr addr,
> > > >              s->regs[addr] = value;
> > > >              break;
> > > >
> > > > -        default:
> > > > -            s->regs[addr] = tswap32(value);
> > > > +        default: /* Packet data */
> > > > +            s->regs[addr] = cpu_to_be32(value);
> > > >              break;
> > > >      }
> > > >  }
> > >
> > > This is a change of behaviour for this device in the
> > > qemu-system-microblazeel petalogix-s3adsp1800 board, because
> > > previously on that system the bytes of the rx buffer would
> > > appear in the registers in little-endian order and now they
> > > will appear in big-endian order.
> > >
> > > Edgar, do you know what the real hardware does here ?
> 
> > Yeah, I think these tx/rx buffers (the default case with tswap32)
> > should be modelled as plain RAM's (they are just RAM's on real HW).
> > Because we're modeling as MMIO regs, I think we get into endianness
> > trouble when the ethernet output logic treats the content as a blob
> > (thus the need for byteswaps). Does that make sense?
> 
> As a concrete question: if I do a 32-bit load from the buffer
> register into a CPU register, do I get a different value
> on the BE microblaze hardware vs LE microblaze ?

Yes, I beleive so.

If the CPU stores the value and reads it back, you get the same. But the representation on the RAM's is different between LE/BE.
But if the Ethernet logic writes Ethernet packet data into the buffer, LE and BE MicroBlazes will read differient values from the buffers. These buffer "registers" are just RAM's I beleive.

Best regards,
Edgar



