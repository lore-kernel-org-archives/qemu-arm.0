Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1500116lfp;
        Fri, 24 Sep 2021 11:44:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx05+TjPYIfi7zJgo8czT5KANe7fhZJ5BsxtC+QlQlp+uE4Hb+hy39kOCtfxMM7LniXa3qM
X-Received: by 2002:a05:6214:13e9:: with SMTP id ch9mr11703661qvb.45.1632509054050;
        Fri, 24 Sep 2021 11:44:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632509054; cv=none;
        d=google.com; s=arc-20160816;
        b=jpLzH4ye+5Q/mV/xkN0+Dn5Ni47fEID88nRQKLqjwTxQveOTGzFFduuslcCcZ8XqcR
         cbWIlhX81ILcTLVREj+4Szhw7Zz4eNJy4vwBKrFxBdqYVYE7Ifrax/yJoWgpPHr+2PK9
         804wJoOv7dKQ8nIJUuWGAv1K+UEJRtWIrJT3qY/KgC9CxhfSnUd6DTUfcwbCtefI31P4
         dwbyXp4Sxw27S8VvfH7qE0PjJu2qdy2m9lQAD+kUcxBdIu+LzjYBpamm5WSRliygeGTH
         Y5PPHZfWgD14LHCcCdfWA+bHtjiyveA6m91kUV3Zi/sLC3kpAe6FVJeIL9l5Y6zhJogN
         UPDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+tFmkGz9wd2B/JiKAsbFeSjzrAKs4XAFmONGYZc7HHk=;
        b=GzxwAbmunfKsS3jWgUG8VLUEL7YovTHZkHTXz1bOJ1HImL14A78iOT1VO1GRPGjeaz
         0y8HBFWtwWFglw9UhVn3jK+cmXz/vfhWOo24V5td1OHo6Wq6tqkmF2d22YyS2AQlYS2G
         mVwHT+HXcX6pglaLBNwcF7pOHlEOcqlzP+uFSZtxpA/0QPpu1T2cRiIv53bV9L0Vs9tq
         /rrUj1hBd1h8e6ioSUsTftNLxCNhF69u/1NybUwuhY5MfCE0Lm0LIUeVcFm2uOhynY/p
         tKJG76jGAXD5t+44Np8eKGtxCSjC8UhoUA7GC3qJrfLPE1yv1dZQVFnVudh3keKjB67v
         fpHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=WK71u0a+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z22si6998804qtm.203.2021.09.24.11.44.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Sep 2021 11:44:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=WK71u0a+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:58498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mTqBB-0007QS-GU
	for alex.bennee@linaro.org; Fri, 24 Sep 2021 14:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1mTqB1-0007Od-3F
 for qemu-arm@nongnu.org; Fri, 24 Sep 2021 14:44:03 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:45956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1mTqAz-0002JM-7H
 for qemu-arm@nongnu.org; Fri, 24 Sep 2021 14:44:02 -0400
Received: by mail-ed1-x536.google.com with SMTP id dm26so5369532edb.12
 for <qemu-arm@nongnu.org>; Fri, 24 Sep 2021 11:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+tFmkGz9wd2B/JiKAsbFeSjzrAKs4XAFmONGYZc7HHk=;
 b=WK71u0a+6GUNLBP488v3g/k4lN9qKs+sinOy4225jmbeM0O73qe46rxIIfSwb3jL8v
 dYIiRYAoainoILBLN80T6aU0xGuL8q42E0nRkj7rQTBkOIHokT8MvZWG3JmZzpRSt+Hn
 UmNWyUOemWq+O8zIRCm8NP15oUqDd7T8CquUYUhO+vP9f94d97YLMSCREWOGiPYAn/Jx
 YxRsi7rWp//xmLOaKjxT6yi60iY17M39ydhROxPXjAdb7NDU2YjWhStN/eIxvcJK/V91
 HGbNGt8f1HdLdlw0d4l0Ts0+8rqe2NmnftEdzJAxIslk9uQCpmLkm2s02OPr+Fi8TIcO
 5TCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+tFmkGz9wd2B/JiKAsbFeSjzrAKs4XAFmONGYZc7HHk=;
 b=AVdMv+4gsvdRQM5ax/MM0QP7ucxPmBSRHSO7qcryLMS10iuGyROmQXSZUWOAC9WPiv
 tpRXWVLNebMNc315VCFLn+AR1R9rQI36BMw7FofnU+aWIeDtqMdwcmkqeFIPWKizXa9z
 ENtAzl4iAnU9YDaKjOFJtPsxKEHTrqlmkHKMqFS2ZSeFJMshFTrd6K0X+IXsPKgT7qpP
 C7/GxFdz/imGoioZgX2RoU+9Kn5mvXI4wp+C2mnO/IU2AtSP68e+UwKXwmkM4yg0Vsmr
 JDUDc0yJp8mxh2IklHqNaID7DKHjbw+0oZtiYZt+1Fm1LIkT1iF8mbI9mX9dPmf0L2CA
 L1KQ==
X-Gm-Message-State: AOAM533HzM/6qjt9Nd0Lt/dv0oVcViS1fMjUp/bObM5Y5LGTxAvJm7+Z
 pI46FGhHNEosrsP6mmYCyI6ng775OXhKz+pUIyl42w==
X-Received: by 2002:a17:906:1e0c:: with SMTP id
 g12mr13365997ejj.155.1632509039067; 
 Fri, 24 Sep 2021 11:43:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAMvPwGr-FuQWHTQYxppAyT9uPhzCUDcezgz+jV=GwHGoQF4N6A@mail.gmail.com>
 <1a0d6240-6654-0cf7-01ce-ef3ebf497a5c@amsat.org>
 <942903da-c16f-23dd-155d-61af84962935@kaod.org>
In-Reply-To: <942903da-c16f-23dd-155d-61af84962935@kaod.org>
From: Titus Rwantare <titusr@google.com>
Date: Fri, 24 Sep 2021 11:43:22 -0700
Message-ID: <CAMvPwGpWftHwxJBbRUzHmsuguspUPBXgU+ROZqRJ2ypa4z6ETg@mail.gmail.com>
Subject: Re: [PATCH] hw/misc: Add an iBT device model
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 "andrew@aj.id.au" <andrew@aj.id.au>, qemu-arm@nongnu.org, 
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>, 
 Corey Minyard <minyard@acm.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=titusr@google.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tyd7noK0EqpM

On Fri, 24 Sept 2021 at 03:55, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hello Titus,
>
> On 9/24/21 10:42, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 9/24/21 01:48, Titus Rwantare wrote:
> >> Hello all,
> >>
> >> I'd like some clarification on how the following code transfers irqs
> >> back and forth:
> >>> b/hw/arm/aspeed_soc.c
> >>> +    /* iBT */
> >>> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->ibt), errp)) {
> >>> +        return;
> >>> +    }
> >>> +    memory_region_add_subregion(&s->lpc.iomem,
> >>> +                   sc->memmap[ASPEED_DEV_IBT] - sc->memmap[ASPEED_DE=
V_LPC],
> >>> +                   &s->ibt.iomem);
> >>> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_ibt,
>
>
> The iBT device IRQ is connected to a subdevice irq of the LPC device.
> See aspeed_lpc_realize(). And triggered in aspeed_lpc_set_irq()

Yes, that side makes sense. I tried to get at that irq from
aspeed_ibt.c as follows:

qemu_irq_lower(ibt->lpc->subdevice_irqs[aspeed_lpc_ibt]); // or raise

static void aspeed_ibt_realize(DeviceState *dev, Error **errp)
{
AspeedIBTState *ibt =3D ASPEED_IBT(dev);
SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
IPMIInterface *ii =3D IPMI_INTERFACE(dev);
ibt->lpc =3D ASPEED_LPC(dev);
...

but this doesn't work and maybe I'm misusing the dynamic cast?

> >>> +                       qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc_=
ibt));
> >>> }
> >>
> >> and
> >>
> >>> hw/misc/aspeed_ibt.c
> >>> +static void aspeed_ibt_realize(DeviceState *dev, Error **errp)
> >>> +{
> >>> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> >>> +    AspeedIBTState *ibt =3D ASPEED_IBT(dev);
> >> ...
> >>> +
> >>> +    sysbus_init_irq(sbd, &ibt->irq);
> >>
> >> I ask because the code in aspeed_soc.c seems to connect to the
> >> lpc->subdevice_irqs[aspeed_lpc_ibt], initialised on
> >> hw/misc/aspeed_lpc.c:408.
> >> I noticed that bmc firmware running in qemu was checking the BT_CTRL
> >> register less frequently than I'd like while editing this patch to use
> >> the IPMIInterface.
>
> OK.
>
> This might be a problem in aspeed_ibt_update_irq(). This patch is
> an experiment from some few years ago. It still works good enough
> for the witherspoon-bmc and powernv9 machines for simple IPMI
> commands: fru, sdr, lan, power off (to be checked).
>
> Could you share your BMC and host command line ?
>

Host:
-chardev socket,id=3Dipmichr1,host=3Dlocalhost,port=3D9999,reconnect=3D10 \
-device ipmi-bmc-extern,chardev=3Dipmichr1,id=3Dbmc0 \
-device isa-ipmi-bt,bmc=3Dbmc0,irq=3D10 -nodefaults

BMC:
-chardev socket,id=3Dipmichr1,host=3Dlocalhost,port=3D9999,server=3Don,wait=
=3Doff \
-device ipmi-host-extern,chardev=3Dipmichr1,responder=3D/machine/soc/ibt

But for this to work you need Hao's patch as well: [PATCH 7/8]
hw/ipmi: Add an IPMI external host device.
