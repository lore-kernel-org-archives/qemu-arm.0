Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1428952lfg;
        Sat, 1 May 2021 17:26:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtR/sLKzksC2ZissxpJsVttHzIPBAtMpzwV4jzfj0JuJh3ziX+OQszrqQLWOjjiP2xHxWb
X-Received: by 2002:a6b:4908:: with SMTP id u8mr9208580iob.143.1619915169830;
        Sat, 01 May 2021 17:26:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619915169; cv=none;
        d=google.com; s=arc-20160816;
        b=MsJKArn0hI/x55RGKDmPn/dZBI/s12yHmR4zeCvwPsc7/LtotE9PKTHK/DDQPF5mOj
         vSKCNa4rwfWTR0Gz+DST1Qyx6HHVKp872Cqfs/oO5K25GVhzMykJHwNtCQ/6XIN9x6hc
         pOITqVaTLaZ0T8CRhADhE4Kun23yaPcBEsw4r7X5srLmuBKkp3vk3UDzcQNrjSBTH5eU
         7CjGV21d95QuoFEjmTHuqeomkhwZeJb/cUZrMSIX6/J6HZUN1IAmcCuyHKmkqxNDVvkd
         CRAgWwnjJopQTv5RdTn8bi9fhQsugdGmM/+Fj/aNzbf/2pODbyDkWg1n4e7yU7KpXfqG
         eI6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=vvqrVbMO2HYW6vq9F8x/DjKIk+zes5NwkgUttstC76s=;
        b=pAVEkj3Crbi6d0RwcTeuQDS8Iu8EuVb8p+BqQLKX+my1aD/nfhKuD1dOhfnYePu/OU
         7lCDNPo3ymZKYceY1wTpS2KDYbIwRJtAPI8QsOKIueagrTqcIs5DJ4vogdVpP16gVI2S
         dVP2NQkfoKTF0yxu0/PE0B7Dl++a29KtUORDDLiOXcddmrlG00qMDieF8bcCOy1vUjwt
         BwyLld0upS/oqk5X5j80ypgK7rRodDbvNZvuOks63mv46vK8FwzISqz2znRkbph5heIh
         TI64FIKZ3nGawSBdKmO4RUqVG0rqL5ubVFFIjCwLIV2O//5mz5N4OhyBtDruDmOA13iL
         PbpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rdbKB81O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j24si7893176jad.22.2021.05.01.17.26.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 May 2021 17:26:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rdbKB81O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lczw1-0005nZ-6E
	for alex.bennee@linaro.org; Sat, 01 May 2021 20:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lczvQ-0005iN-9Z; Sat, 01 May 2021 20:25:34 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:35732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lczvG-0005Ky-Si; Sat, 01 May 2021 20:25:30 -0400
Received: by mail-ej1-x62a.google.com with SMTP id m12so2611308eja.2;
 Sat, 01 May 2021 17:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vvqrVbMO2HYW6vq9F8x/DjKIk+zes5NwkgUttstC76s=;
 b=rdbKB81OfTt6sldmzMeE63tFRKrj9ATz6iumL5E7ReenMm8VHn507JO5k1QdJoLYCX
 OIblrX+ubwOQdb9IfVZyV0V2LeTyw3VfFwDlt/XQqi2nVJ8ysyqkpOA6day6nH6Bq/Ar
 xNAIx/rk1PFbEi0nl1T7u2T02N6mQIM2ZAI+Bj3f0apiu/adhDW5kUH+F+AJoJT18z5q
 UILiW5WUrLTepee41IjfGInPJiqHXY+ZugUDfv3YYnAneDo2pf+8bSsvYOIhlrFUvbeW
 7bxrrm3usnNnHAfnoDEjG3HgR7UoFUiMaxZ62q/UsOn4HyA2SXeepsMrKCVOFwSvhSa6
 UHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vvqrVbMO2HYW6vq9F8x/DjKIk+zes5NwkgUttstC76s=;
 b=dI9L7BGvpoVvXM9Quv/M/OdRxSdNnmDBnhL5Ovs9y0T82z7f+5b+ynPvU/ldah2s69
 bPNp+yEXLBekQ4vDL39zhVPevaJCPitTr8DGa9jvEsU4Ji4MjfMIG1fj1ApiwuQixgiL
 23lG9CrUsFQvprdQYFEvAmOYxA0xyuUaWQA9Xj1qtoupR1MiqGs+te9g3GHtc2gOi1Rc
 5IbHsoscqFcwZ7xfCbxr3bC8nusKBEs34XyihgtZKHGrfCTXUk5Ad2+xs2RoV11jT+P2
 fr8yyQRuyf0YK8U/DOmz1Nxs52vEG6Jxx6q1FpjHwkEhLcZw7uotKN/qD35ascTte4N8
 OM4A==
X-Gm-Message-State: AOAM530rYU7Fhh9aKXrs6Mt2L3OyENUtiQ+mWwUdFeuoMIz+Y3j+cwFq
 okV1U7zwLn4WSWeMafWYPp5teHGl7sIecQIzM0M=
X-Received: by 2002:a17:906:2c55:: with SMTP id
 f21mr10927300ejh.41.1619915118795; 
 Sat, 01 May 2021 17:25:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210106063504.10841-1-bmeng.cn@gmail.com>
 <20210106063504.10841-4-bmeng.cn@gmail.com>
 <20210430144136.GA2880420@roeck-us.net>
 <CAEUhbmUTLecMcr0=vmBeYJZeK6CdZY4SZcYiOu0E9AawY41+Cg@mail.gmail.com>
 <72acebfa-be17-cca5-ce6a-443ef4d23fce@roeck-us.net>
 <6f92b247-cc78-1e26-5809-2ae4809be5c6@amsat.org>
 <b94a7a17-75bb-5b8d-adf4-ab2ff33c0553@roeck-us.net>
In-Reply-To: <b94a7a17-75bb-5b8d-adf4-ab2ff33c0553@roeck-us.net>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 2 May 2021 08:24:32 +0800
Message-ID: <CAEUhbmVxBiYo_=Xx4w=4d2Y+DYHuHzKFahbUG-7qFS4THFqAkg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] hw/arm: sabrelite: Connect the Ethernet PHY at
 address 6
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9MT33eXf6VCR

On Sun, May 2, 2021 at 7:21 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 5/1/21 2:40 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 5/1/21 10:12 PM, Guenter Roeck wrote:
> >> On 4/30/21 9:28 PM, Bin Meng wrote:
> >>> On Fri, Apr 30, 2021 at 10:41 PM Guenter Roeck <linux@roeck-us.net> w=
rote:
> >>>>
> >>>> Hi,
> >>>>
> >>>> On Wed, Jan 06, 2021 at 02:35:03PM +0800, Bin Meng wrote:
> >>>>> From: Bin Meng <bin.meng@windriver.com>
> >>>>>
> >>>>> At present, when booting U-Boot on QEMU sabrelite, we see:
> >>>>>
> >>>>>   Net:   Board Net Initialization Failed
> >>>>>   No ethernet found.
> >>>>>
> >>>>> U-Boot scans PHY at address 4/5/6/7 (see board_eth_init() in the
> >>>>> U-Boot source: board/boundary/nitrogen6x/nitrogen6x.c). On the real
> >>>>> board, the Ethernet PHY is at address 6. Adjust this by updating th=
e
> >>>>> "fec-phy-num" property of the fsl_imx6 SoC object.
> >>>>>
> >>>>> With this change, U-Boot sees the PHY but complains MAC address:
> >>>>>
> >>>>>   Net:   using phy at 6
> >>>>>   FEC [PRIME]
> >>>>>   Error: FEC address not set.
> >>>>>
> >>>>> This is due to U-Boot tries to read the MAC address from the fuse,
> >>>>> which QEMU does not have any valid content filled in. However this
> >>>>> does not prevent the Ethernet from working in QEMU. We just need to
> >>>>> set up the MAC address later in the U-Boot command shell, by:
> >>>>>
> >>>>>   =3D> setenv ethaddr 00:11:22:33:44:55
> >>>>>
> >>>>
> >>>> With this patch in place, the standard Ethernet interface no longer =
works when
> >>>> booting sabrelite Linux images directly (without u-boot) using the f=
ollowing
> >>>> qemu command.
> >>>>         qemu-system-arm -M sabrelite -kernel arch/arm/boot/zImage
> >>>>         ...
> >>>>
> >>>> The Ethernet interface still instantiates, but packet transfer to th=
e host
> >>>> no longer works. Reverting this patch fixes the problem for me.
> >>>>
> >>>> Is there a qemu command line parameter that is now necessary to inst=
antiate
> >>>> the Ethernet interface when booting Linux ?
> >>>
> >>> Enabling "guest_errors" shows that Linux kernel fec driver is trying
> >>> to read PHY at address 0, which is not what we want.
> >>>
> >>> [imx.fec.phy]imx_phy_read: Bad phy num 0
> >>>
> >>> The device tree blob of the sabrelite does not contain a node for the
> >>> ethernet phy specifying phy address, so I suspect Linux kernel driver
> >>> is using default phy address 0 instead.
> >>>
> >>> Could you please test on a real hardware to see what happens?
> >>>
> >>
> >> The problem is that qemu returns 0 when the OS tries to read from a
> >> non-existing PHY. Linux expects it to return 0xffff, and believes that
> >> a PHY is there if 0 is returned.
> >
> > Correct.
> >
>
> I'll send a patch. Next question is why the Ethernet interfaces on mcimx6=
ul-evk
> and mcimx7d-sabre don't work. I either get no connectivity at all (simila=
r to
> the above) or something like
>
> fec 2188000.ethernet eth1: Unable to connect to phy
> ifconfig: SIOCSIFFLAGS: No such device
>
> Any idea ?

I don't see these 2 are supported targets of QEMU:
https://wiki.qemu.org/Documentation/Platforms/ARM

Regards,
Bin
