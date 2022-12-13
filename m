Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4258242ejb;
        Tue, 13 Dec 2022 06:14:44 -0800 (PST)
X-Received: by 2002:ac2:4c4f:0:b0:4a4:68b8:f4f4 with SMTP id o15-20020ac24c4f000000b004a468b8f4f4mr8282055lfk.58.1670940884076;
        Tue, 13 Dec 2022 06:14:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670940884; cv=none;
        d=google.com; s=arc-20160816;
        b=CNIYJTSQF6nfObNInNyXVc/pG64AlE7f24HQK8n5PzCtkiRYm72Q1Xh6CqB89YRVPt
         mrKErGDFcIDJn/cAQ4ZnNodkEzfPbgCfvNZRedB81wBONtwn9ztAjQ9FzegxFwa/1N0h
         K9ANyLNeWMHT8vtKVXXgTJ/em2YheMKioWZ9d+qCaeUnlq0RdG7ridNSPclj6t1GBpAr
         4MsF6kdD6ftIstK/RTAKzRC10WzGg7o8Hx89Y2wpdwcQO59naZlr+RlGejYYkUCZmvOM
         fy+7w4JGTN8VDjVtdXhVelQFGIClybTmf/Ejl6Con9rapeX1ckxg3u5vjC0sl7wQ5BHZ
         N9IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=ffi4iYpsADx0RphIyE6y/SThpfQghkBcEN/v45tCSu8=;
        b=e0t3gjFzQFA7JNVxruKUg17cHBuVH2zICZtNKzcVJCcJ/WfO+d3XTPk5vAsoc7pcTT
         f6p1/muqEqtPndrS28+N9GgJUadWdIp2rpyQ7Dx0fwDWUec5VPhe+fJOokiMXpwq+4Kd
         GTCoLot1mHp7a6msPXY192xfqJYVb0Ez42/mmFUhj+QorVNTBtUWCXcNWYKeQzkT/DIJ
         FpN6cqhYjoEIkA8k1vW4G0/y4h4k6Gh00tEZpLZSEJKKOAPNmbdOlw9d8voDvy6gECQH
         LB37MNQYGYm+y+IBJevkwIDK5DpYzwhUxag3yP3bhSMHki0hYrupTxA/+ZICcdIWvU23
         safw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=aHZQ2sYn;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w22-20020a194916000000b004979f223c91sor785201lfa.37.2022.12.13.06.14.43
        (Google Transport Security);
        Tue, 13 Dec 2022 06:14:44 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=aHZQ2sYn;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ffi4iYpsADx0RphIyE6y/SThpfQghkBcEN/v45tCSu8=;
        b=aHZQ2sYn1nesw0JylWao1NOuzsMKupEFLmyGRmhJyIut6/D795YpIfNv9nLDo9E8hP
         z8+PFPWuh7ZsRWKPqCqo7zRFJVmMooA3JUtp8G6NE/9S7m9uHN5fp1r9gJ+aMpou5Jz7
         +3Uwk/0NXAofRDSqeg9HVxSaOdR7zd4demCM+g+5ytHoeGjcbb8zw4k2Kc0x2J+QVVJ5
         BzPW0EDXur3jJdebZMOM8xR+hjaZ7o6wjntQFxdzi3wQRpoy4OgIBM0gRnPCUY6mBMaw
         k9zkAwSdcdFQRHA86bALLQ7+6uAESmUDisFFyPsFzdvArSK+QMGOZSNbLzsjo5Clkn3V
         VLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ffi4iYpsADx0RphIyE6y/SThpfQghkBcEN/v45tCSu8=;
        b=egIgOeA05TLdF34gtUsnXOH1js5+EsR6y3Wc6fDpgDRUD9akrHybQH6co2XPPlitGP
         nI0cVdcvgHzlVBVJZMbcUq0DQwN8modWFotBV3kIt0YjQ3OxZph7uwV4kmTeJ8meng1W
         49StS3cYMRJ+4s+Qxnmiif3pgIEAFmjwW/Z9I6wTNPHfg4D23FPrUf1w+ezU7fXoNc4H
         aKkcal2EMq9iM/8EeekQz2AiRaAjHcT6P8AEBx3p/++TxCqNkdU4CjEgrfO+mF55Pyec
         4gxqTdlH3AolLYpfK40Ajb1jCwLVuukDzPIOYqrqPNZL5d9+VyPK4c80aQLpCqGRRb+6
         GnwA==
X-Gm-Message-State: ANoB5pn8r6iVPEtNhchK6QloEwPLbX1g/8aOx2TihYpy5lWinf/sY6rI
	hYrW5JRs10C254KfODlbD5AAmf0J/vtalw==
X-Google-Smtp-Source: AA0mqf5yWk+TEo9M7LmIlKncM6V1GWxga3Ziyam4jG+fVyWjN2JpwMYCdg40zJCa2Wm/0jnMfDDFhg==
X-Received: by 2002:a05:6512:682:b0:4a4:68b8:f4db with SMTP id t2-20020a056512068200b004a468b8f4dbmr7947288lfe.33.1670940883194;
        Tue, 13 Dec 2022 06:14:43 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (81-232-4-135-no39.tbcn.telia.com. [81.232.4.135])
        by smtp.gmail.com with ESMTPSA id v14-20020a19740e000000b0048b365176d9sm379457lfe.286.2022.12.13.06.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 06:14:42 -0800 (PST)
Date: Tue, 13 Dec 2022 14:54:55 +0100
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
Message-ID: <Y5iEL5YexYliX+cG@toto>
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-4-philmd@linaro.org>
 <CAFEAcA-iouFJgu_2cG2TapxYVr-_ZK1Uuwa4mqSL5zNKg6Jq+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA-iouFJgu_2cG2TapxYVr-_ZK1Uuwa4mqSL5zNKg6Jq+Q@mail.gmail.com>
X-TUID: N12eigAHcnbB

On Tue, Dec 13, 2022 at 01:53:15PM +0000, Peter Maydell wrote:
> On Tue, 13 Dec 2022 at 12:52, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> >
> > This partly revert commit d48751ed4f ("xilinx-ethlite:
> > Simplify byteswapping to/from brams") which states the
> > packet data is stored in big-endian.
> >
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> > @@ -102,8 +102,8 @@ eth_read(void *opaque, hwaddr addr, unsigned int size)
> >              D(qemu_log("%s " TARGET_FMT_plx "=%x\n", __func__, addr * 4, r));
> >              break;
> >
> > -        default:
> > -            r = tswap32(s->regs[addr]);
> > +        default: /* Packet data */
> > +            r = be32_to_cpu(s->regs[addr]);
> >              break;
> >      }
> >      return r;
> > @@ -160,8 +160,8 @@ eth_write(void *opaque, hwaddr addr,
> >              s->regs[addr] = value;
> >              break;
> >
> > -        default:
> > -            s->regs[addr] = tswap32(value);
> > +        default: /* Packet data */
> > +            s->regs[addr] = cpu_to_be32(value);
> >              break;
> >      }
> >  }
> 
> This is a change of behaviour for this device in the
> qemu-system-microblazeel petalogix-s3adsp1800 board, because
> previously on that system the bytes of the rx buffer would
> appear in the registers in little-endian order and now they
> will appear in big-endian order.
> 
> Edgar, do you know what the real hardware does here ?
> 

Yeah, I think these tx/rx buffers (the default case with tswap32) should be modelled as plain RAM's (they are just RAM's on real HW).
Because we're modeling as MMIO regs, I think we get into endianness trouble when the ethernet
output logic treats the content as a blob (thus the need for byteswaps). Does that make sense?

Cheers,
Edgar
