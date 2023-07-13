Received: by 2002:a05:7022:629e:b0:68:46be:293d with SMTP id e30csp2849644dle;
        Thu, 13 Jul 2023 11:07:37 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE75po1CP2RtqLeUcMn66fHQz7hLbHqNMdOnNyj8RdNhJPo83kxbv6n2QBs2sopbr4fOJ9J
X-Received: by 2002:a05:620a:38cb:b0:767:e73b:d80e with SMTP id qq11-20020a05620a38cb00b00767e73bd80emr2481250qkn.32.1689271657488;
        Thu, 13 Jul 2023 11:07:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689271657; cv=none;
        d=google.com; s=arc-20160816;
        b=yzh83n9oq2mlF7ESX2DvTk1BWsTMMQBx2XzZ/jFZ8pEWos6DBNq3294o1obPZV+fIO
         RdXojYker27J5nLNcGdj0jOZ7o6IZdrStg58n1BLsnNHIoY1VtqVx0Y65EEIlb5CraE/
         v6ytOxZCzIBBb3WBhguH5CpE4HcUoNcUcB8AP5ASs0uc4Ahs58PNEX2ZzN8APMY1mvzF
         115DfqyckFrlDFXusi9M82em4KaJe8v9nrAXdeW7mq3ai2WOIzKEz08SV6ccTqOpHEiG
         CYWWEYdEYDRloY6ViCT7gKJbaryb81EsLPIKV19lA7el/ECWSG3IfAZXX3AUyfUReskG
         xZRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version;
        bh=m8vCN65AWkmfSujxBkeMsv+9E95pnQqPyTWD9zgJRG4=;
        fh=KnXMdIFw5PjiF3qLviiiebqeSxs6Dcxr4bqgt5OsuIk=;
        b=wWSJUwTCfhMXuXpVoLkWWMi1GzqC30Y6y2y73qCSwf93yVUrMO5hlUtMs/GA/da5t9
         ljbKvXyHBk9k6cubVQ9icwmjpBFxAZnsqaI8MjAAYFSnoW8Oc5htsytRC+8Z3wGPsfF6
         m3kITKJsgQqJl0cDJZUMn3OfBl4Zm29TDJDsjwRyqMRAelUpRWmOZDCJ6QFVhPDBeuFu
         pHWtpL6gNHvfrm5ThupBFmn9lQLEgfbcvuObyv5qXyNEE/Jv1ynSLWn3z2uhvyRGPkIc
         lFBYn9wI6LCLdTT+KWOmOXJ1JeiHaeBwAIG5/FHsU/DLo1ETxz2nsoUdqMJKrImNi90R
         ANzg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qs6-20020a05620a394600b00767093ac5e2si3380442qkn.68.2023.07.13.11.07.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jul 2023 11:07:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qK0ir-00029o-Tb; Thu, 13 Jul 2023 14:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1qK0iq-00029b-NW; Thu, 13 Jul 2023 14:07:24 -0400
Received: from mail-pl1-f172.google.com ([209.85.214.172])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1qK0io-0008C3-VG; Thu, 13 Jul 2023 14:07:24 -0400
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1b8b2886364so6082635ad.0; 
 Thu, 13 Jul 2023 11:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689271640; x=1691863640;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m8vCN65AWkmfSujxBkeMsv+9E95pnQqPyTWD9zgJRG4=;
 b=FRg2SY56yYrMN1y3J8M+er4j53VmPRt62NU4TsDE3ZWAFSOi/STVH+MWCiqzEm2HlD
 gMVLWYHNz+6RVf/J+XNKilMImFyBGNkz+hGPuHxDin/nNGucqRcVs6+Ba48leICJYXn3
 cB2WML66bPznZx/Ij1oU8HnMm3/oL9+sxGlE3JzEfqP3VFW7ZQddePIhMENyDyJp/HVV
 lqKAeggfOyWP/ZDo9C4SbKEu3eitUJjb3/sGUWCfzBIAr3IFlTGFaZurkjhE8vjJQvvQ
 TUXIy2F0Vb/hBTxbIzVtukwTbgNGAwxs27cKI13D/1BUzFZTdlo6GOtMqv8w8WWp6aFL
 Yy+A==
X-Gm-Message-State: ABy/qLbyoo0DUwPdJXXsBt8naSohf8UQX3fiPvUbw0OPmRXiLqKrZlMj
 9jhXbPE9LtHZhaNKwMZnZxx5zexUgdU=
X-Received: by 2002:a17:902:e54b:b0:1b8:177e:c805 with SMTP id
 n11-20020a170902e54b00b001b8177ec805mr1726761plf.42.1689271639920; 
 Thu, 13 Jul 2023 11:07:19 -0700 (PDT)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com.
 [209.85.216.54]) by smtp.gmail.com with ESMTPSA id
 d14-20020a170903230e00b001b864add154sm6229495plh.154.2023.07.13.11.07.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 11:07:19 -0700 (PDT)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2674d0e10c4so491688a91.3; 
 Thu, 13 Jul 2023 11:07:19 -0700 (PDT)
X-Received: by 2002:a17:90a:e38e:b0:25c:1397:3c0b with SMTP id
 b14-20020a17090ae38e00b0025c13973c0bmr1394515pjz.37.1689271639448; Thu, 13
 Jul 2023 11:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230713035232.48406-1-j@getutm.app>
 <20230713035232.48406-8-j@getutm.app>
 <CAFEAcA_hKao=-kadeKjZMGOugtSGLHzhzTLiva5aZP7PHQN3xQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_hKao=-kadeKjZMGOugtSGLHzhzTLiva5aZP7PHQN3xQ@mail.gmail.com>
From: Joelle van Dyne <j@getutm.app>
Date: Thu, 13 Jul 2023 11:07:08 -0700
X-Gmail-Original-Message-ID: <CA+E+eSDO-ZVGsEqzja55f9WppKHXkB6ruY4aNgrwWiJySAGY5g@mail.gmail.com>
Message-ID: <CA+E+eSDO-ZVGsEqzja55f9WppKHXkB6ruY4aNgrwWiJySAGY5g@mail.gmail.com>
Subject: Re: [PATCH 07/11] hw/arm/virt: add plug handler for TPM on SysBus
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Joelle van Dyne <j@getutm.app>, qemu-devel@nongnu.org, 
 "open list:Virt" <qemu-arm@nongnu.org>, Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.214.172; envelope-from=osy86dev@gmail.com;
 helo=mail-pl1-f172.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: qygWkJAXOnrz

On Thu, Jul 13, 2023 at 8:31=E2=80=AFAM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Thu, 13 Jul 2023 at 04:52, Joelle van Dyne <j@getutm.app> wrote:
> >
> > TPM needs to know its own base address in order to generate its DSDT
> > device entry.
> >
> > Signed-off-by: Joelle van Dyne <j@getutm.app>
> > ---
> >  hw/arm/virt.c | 37 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 7d9dbc2663..432148ef47 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -2732,6 +2732,37 @@ static void virt_memory_plug(HotplugHandler *hot=
plug_dev,
> >                           dev, &error_abort);
> >  }
> >
> > +#ifdef CONFIG_TPM
> > +static void virt_tpm_plug(VirtMachineState *vms, TPMIf *tpmif)
> > +{
> > +    PlatformBusDevice *pbus =3D PLATFORM_BUS_DEVICE(vms->platform_bus_=
dev);
> > +    hwaddr pbus_base =3D vms->memmap[VIRT_PLATFORM_BUS].base;
> > +    SysBusDevice *sbdev =3D SYS_BUS_DEVICE(tpmif);
> > +    MemoryRegion *sbdev_mr;
> > +    hwaddr tpm_base;
> > +    uint64_t tpm_size;
> > +
> > +    if (!sbdev || !object_dynamic_cast(OBJECT(sbdev), TYPE_SYS_BUS_DEV=
ICE)) {
> > +        return;
> > +    }
> > +
> > +    tpm_base =3D platform_bus_get_mmio_addr(pbus, sbdev, 0);
> > +    assert(tpm_base !=3D -1);
> > +
> > +    tpm_base +=3D pbus_base;
> > +
> > +    sbdev_mr =3D sysbus_mmio_get_region(sbdev, 0);
> > +    tpm_size =3D memory_region_size(sbdev_mr);
> > +
> > +    if (object_property_find(OBJECT(sbdev), "baseaddr")) {
> > +        object_property_set_uint(OBJECT(sbdev), "baseaddr", tpm_base, =
NULL);
> > +    }
> > +    if (object_property_find(OBJECT(sbdev), "size")) {
> > +        object_property_set_uint(OBJECT(sbdev), "size", tpm_size, NULL=
);
> > +    }
> > +}
> > +#endif
>
> I do not like the "platform bus" at all -- it is a nasty hack.
> If the virt board needs a memory mapped TPM device it should probably
> just create one, the same way we create our other memory mapped
> devices. But...
>
> How are TPM devices typically set up/visible to the guest on
> real Arm server hardware ? Should this be a sysbus device at all?

+Alexander Graf who may answer this better.

My understanding is that we need to do this for the device to know its
own address which it needs to return in a register. On ISA devices, it
is always mapped to the same physical address so there's no issues but
for Virt machines, device addresses are dynamically allocated by the
PlatformBusDevice so only at this late stage can we tell the device
what its own address is.

>
> thanks
> -- PMM

Also to Stefan's question on consolidating code: that is ideal but
currently, it seems like much platform setup code is duplicated
amongst the various architecture's Virt machines. There would have to
be a larger effort in de-duplicating a lot of that code. Indeed, we
try to do this already with some of the ACPI stuff in the other
patches. For this specifically, we would need to know the platform
bus' base address which is done differently in ARM64's Virt and in
Loongarch's Virt. All we did was delete some existing duplicated code
and replace it with a different duplicated code :)
