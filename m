Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp90380lfg;
        Thu, 28 Jul 2022 00:26:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sZC7hbMwxzmtZcfg4/FbC/Mndu1vJzp/+TPjgYAleyZWfsG+VDm3jEhDsUd6iSTwph+2oP
X-Received: by 2002:a05:6214:1a48:b0:474:6bf:13c6 with SMTP id fi8-20020a0562141a4800b0047406bf13c6mr22460693qvb.56.1658993163653;
        Thu, 28 Jul 2022 00:26:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658993163; cv=none;
        d=google.com; s=arc-20160816;
        b=axKYEcYW5g3QGdZm1aJzpjko/wWGJpiWaTY7SJfe9qmsmp15IH233dlm0yA6GnBVS6
         Bsz/4oKgLPtU/lalUep2kSDMOODWrTW0EDwgg9iqokXIq7sfXcWTNqts+ONu8+zE54eR
         zD29yacnCUGRYfjVbrnu3ng4I3RybSWlRlLHxGtFAUv16/RkDYbKaJnCtwJ7V32Ii/uO
         SiPwW1RrwAt0MW/CHpRk+ghi34wcnW2T3CQBMQD1JaqBpyvY712oH51GZyA6OzzwBpjS
         Bo7GR5Pl0qfaBl1yG2KvXZhvrcJ6+jcr2s2ynObgJSynIHNPUusrywBIKuwP+djLlvED
         hJ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=l15Kj6Unzh6fF5IwMDXFTXEbGfGj7Eu+Iih9FO8l06o=;
        b=IpvdZOXplBZdhI41QagGy3SeHVdkrzBI8zClKZloQFHfeKEQOVxeRTAjlAJ9tyHZCw
         EAnfow2+zS3Cv8TEv7Yc04muApiXiEhaN8S0+VQQfv2ZJ2q1D+e6/bNvESp/6FUNdJZS
         ZjBqF5j5POf/TjBj09snqgvos6ukvnJNXwGkb08u+M1GoqZo29WDXBxourIflgaTrPeq
         ispwP5JdEQZ1njfa0z8pzDnJOBo4uQlpGycOaGnyMaZ4D4UFu3m8RTcJss+uvmdW8/D8
         xRpm3MJ4Swn9Xit7bpW+4e9nLDi7peKZ132yVzUiYp+YV6SvOraGuzpb/pJ1PyxRUMWY
         xTpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=JNVadVW7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id js13-20020a0562142aad00b00472eff18771si32660qvb.390.2022.07.28.00.26.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jul 2022 00:26:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=JNVadVW7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oGxuF-0003fI-1v
	for alex.bennee@linaro.org; Thu, 28 Jul 2022 03:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangzq.jn@gmail.com>)
 id 1oGxpX-0001i1-EA; Thu, 28 Jul 2022 03:21:11 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:43741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wangzq.jn@gmail.com>)
 id 1oGxpS-0007kc-Df; Thu, 28 Jul 2022 03:21:08 -0400
Received: by mail-ej1-x643.google.com with SMTP id b11so1610987eju.10;
 Thu, 28 Jul 2022 00:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=l15Kj6Unzh6fF5IwMDXFTXEbGfGj7Eu+Iih9FO8l06o=;
 b=JNVadVW7y/a3EjapL6gyxv6mPEMV+XivXOveDCmTWy9bcFyvZhZAxywXdabLaZ5SAS
 TvnXKmt9kiYuEdpRVsEftdruqt/WaolDii6qtfHHVJ1kNqjmzICA0piAhJtC19Xvjgks
 5aBQdfFS5pVVzI3h1Y0eyto6D9K7P6CL5ZpKHZwJp/P3uhsliHEXPnd9jwaMNfeHaT85
 KvH7xUJRDz+AKDMlDde+F6oeIVpPNpRt5Uh0qV8eLnluaKI369juG7TMU6ajg+tfHrwR
 O815C2vnQZC1sx9420WMGW8YjDR9lah9hhp9igODdfz7rF8r/WELW7b/NueeIsv3QPsV
 WzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l15Kj6Unzh6fF5IwMDXFTXEbGfGj7Eu+Iih9FO8l06o=;
 b=hGlFgEF6d2XM5sMJ7+N8L7wMiNHtxf312yEJJCDkawhYkOFPTqokyOh/1WDeEb3Wd9
 B5VRW3DTEH6/SMrTcpNkC+HT2G1OjWUI0iUA4PEVmp7kHsOuBaUSqCyTKsz36pClKfXH
 6BsQktGUgmCUG1Dpds7Fv6Ej5JUhucHn4cak91Y6iw5ORJO0UIU3SzaAQv3i8u2S/Dvy
 fecKxz0dvktAzEWtyLWmom4VweIkhEy7dNInfQEOD1QEuyr30CpRGfGzH9WqlGN9yMY4
 648DtnQtyFAJT4IOh0XITwkJGxVxTHRhbsvRTAiVMLfz7v2iSYnOJQpQZxa94d63RApA
 WUbg==
X-Gm-Message-State: AJIora8oAmb8RVrBv88wuk4JEbvtBVkihi+Qn3mrZ6yA97EU31m18O8e
 /gYy6Dc0PKg5PgkmqgscUfPtD3OxHjU+gZNJCi8=
X-Received: by 2002:a17:907:2cd4:b0:72b:7fa8:eafc with SMTP id
 hg20-20020a1709072cd400b0072b7fa8eafcmr20346264ejc.438.1658992862519; Thu, 28
 Jul 2022 00:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220728061228.152704-1-wangzhiqiang02@inspur.com>
 <6ad0dee4-58c3-de80-177c-d06bb45ba8af@kaod.org>
In-Reply-To: <6ad0dee4-58c3-de80-177c-d06bb45ba8af@kaod.org>
From: John Wang <wangzq.jn@gmail.com>
Date: Thu, 28 Jul 2022 15:20:51 +0800
Message-ID: <CAHwNHZUsodef8LcE+wjp2OFk=b01zEMx12bLDVoW3h5hFt=xFA@mail.gmail.com>
Subject: Re: [PATCH] aspeed: Enable backend file for eeprom
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: patrick@stwcx.xyz, Peter Maydell <peter.maydell@linaro.org>, 
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, 
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=wangzq.jn@gmail.com; helo=mail-ej1-x643.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Dj58p1JJ5rBc

C=C3=A9dric Le Goater <clg@kaod.org> =E4=BA=8E2022=E5=B9=B47=E6=9C=8828=E6=
=97=A5=E5=91=A8=E5=9B=9B 14:28=E5=86=99=E9=81=93=EF=BC=9A
>
> Hello John,
>
> On 7/28/22 08:12, John Wang wrote:
> > tested on a fp5280g2:
> >
> > $QEMU_BIN -machine fp5280g2-bmc \
> >         -nographic \
> >         -drive file=3D"${IMAGE_PATH}",format=3Draw,if=3Dmtd \
> >         -drive file=3D"eeprom.bin",format=3Draw,if=3Dpflash,index=3D1 \
> >         ${NIC}
> >
> > root@fp5280g2:/sys/bus/i2c/devices/1-0050# hexdump eeprom -C
> > 00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |..........=
......|
> > *
> > ....
> > ....
> > 00000240  2c 87 a3 a4 1d d3 11 b2  02 d2 c2 9d 44 60 cf 3e  |,.........=
..D`.>|
> > 00000250  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |..........=
......|
> >
> > It's same as the "eeprom.bin"
> >
> > Signed-off-by: John Wang <wangzhiqiang02@inspur.com>
> > Change-Id: I5c44785a028144b24aa0b22643266d83addc5eab
> > ---
> >   hw/arm/aspeed.c | 16 ++++++++++++----
> >   1 file changed, 12 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > index 4193a3d23d..80aa687372 100644
> > --- a/hw/arm/aspeed.c
> > +++ b/hw/arm/aspeed.c
> > @@ -431,12 +431,20 @@ static void aspeed_machine_init(MachineState *mac=
hine)
> >       arm_load_kernel(ARM_CPU(first_cpu), machine, &aspeed_board_binfo)=
;
> >   }
> >
> > -static void at24c_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsiz=
e)
> > +static void at24c_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsiz=
e,
> > +                              int index)
> >   {
> >       I2CSlave *i2c_dev =3D i2c_slave_new("at24c-eeprom", addr);
> >       DeviceState *dev =3D DEVICE(i2c_dev);
> >
> > +    DriveInfo *dinfo =3D drive_get_by_index(IF_PFLASH, index);
>
> I don't think IF_PFLASH is the appropriate type.

thanks

>
> Jae proposed a similar patch with IF_NONE which should fit your need :
>
>    https://lore.kernel.org/all/20220718175214.2087644-1-quic_jaehyoo@quic=
inc.com/
>
> Could you please give it a try ?

I tested on a fp5280g2-bmc, It's ok.  I would abandon my patch :=EF=BC=89

>
> It's available on my branch :
>
>    https://github.com/legoater/qemu/commits/aspeed-7.1

I checked it, and will use this tree to module a new machine. :)

>
> Thanks,
>
> C.
>
>
> > +    BlockBackend *blk =3D dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
> > +
> > +    if (blk) {
> > +        qdev_prop_set_drive(DEVICE(dev), "drive", blk);
> > +    }
> >       qdev_prop_set_uint32(dev, "rom-size", rsize);
> > +
> >       i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
> >   }
> >
> > @@ -685,7 +693,7 @@ static void fp5280g2_bmc_i2c_init(AspeedMachineStat=
e *bmc)
> >       I2CSlave *i2c_mux;
> >
> >       /* The at24c256 */
> > -    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 1), 0x50, 32768);
> > +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 1), 0x50, 32768, 1=
);
> >
> >       /* The fp5280g2 expects a TMP112 but a TMP105 is compatible */
> >       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), TYPE_TM=
P105,
> > @@ -918,13 +926,13 @@ static void bletchley_bmc_i2c_init(AspeedMachineS=
tate *bmc)
> >       }
> >
> >       /* Bus 6 */
> > -    at24c_eeprom_init(i2c[6], 0x56, 65536);
> > +    at24c_eeprom_init(i2c[6], 0x56, 65536, 1);
> >       /* Missing model: nxp,pcf85263 @ 0x51 , but ds1338 works enough *=
/
> >       i2c_slave_create_simple(i2c[6], "ds1338", 0x51);
> >
> >
> >       /* Bus 7 */
> > -    at24c_eeprom_init(i2c[7], 0x54, 65536);
> > +    at24c_eeprom_init(i2c[7], 0x54, 65536, 2);
> >
> >       /* Bus 9 */
> >       i2c_slave_create_simple(i2c[9], TYPE_TMP421, 0x4f);
>
