Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp935695lfm;
        Wed, 1 Jul 2020 16:07:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8Hb1LdbvBwNJFFeI0y15qZRw/D0JGMUOKvJ/twlhqZDsNdz2gvC04LEvdc5kwqIJgelsu
X-Received: by 2002:a25:c7d3:: with SMTP id w202mr29977122ybe.84.1593644834369;
        Wed, 01 Jul 2020 16:07:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593644834; cv=none;
        d=google.com; s=arc-20160816;
        b=SuNUS6RafydHT9s3AJ+23U9xN1/MOA5/8A7+rYTQu93UKwwVuRj9bqDWQrWiiDJzb0
         qsCV7D9wXWpYvgMmfLseUgKFNmnchzoq97HZkdaxI0uj6m3HELAgfpXm6nNfeNb7KKvn
         cfE4BwZbuA3yuKB2JqkfZEwT7d5bdGnuyJ1FJ2waoPMczjHRFvZAchnIA39K/7+WT0r0
         WQz1/EqVsRXoG1tzg1qo8J48qK8wEkmS2RUbnLe1TU4Bu/jOvsPVg1m9lgiN3F1X9cy8
         pJ3wLFnMwhcg4qCMEHKa6UHszMoCt80kKrbx5yUd9a321bcAZgEUtJqlYqL/tbfLFqCy
         bPTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+SBC+1bi7YP30ifabfY7Lj/c0eUxzfyQUx9HqZ1HkWs=;
        b=C+SDK1nM2hhnDlb4ccLQoqh3Q6odCK48+2f4+aAmMgtORS6klI+xqwpn92lkCmnwDN
         6u3ktutAwB60cDCKedH6hPTC998LXYfEySo1p/6sW+Dgw+g0+ibdHsIoya5bRjDvKxh7
         pntAduG7clVF3hITiEp/cZX5zxr1LIxYO+IVoe3p4zDXcZNnZ3QNZS2Jr3CtWlBrFRNq
         nPbF4Dbvp+8U932WHu07q8pq/RAp2CXAiGf3XQSkUkRDlyB+kEk0nAVZBnu4zbMCtLfW
         /Az+LNuvP113gRCM7hJphA+agK7EKjArcvtIb+DFzm2Fz5oA9VEzYPtf8JSIihUSH3dY
         LXuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=CUT2ytIq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f123si7563612ybg.424.2020.07.01.16.07.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Jul 2020 16:07:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=CUT2ytIq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqlov-0001Ep-Iz
	for alex.bennee@linaro.org; Wed, 01 Jul 2020 19:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1jqloY-0001Dx-IG
 for qemu-arm@nongnu.org; Wed, 01 Jul 2020 19:06:50 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:35444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1jqloV-0001Jv-Il
 for qemu-arm@nongnu.org; Wed, 01 Jul 2020 19:06:50 -0400
Received: by mail-ej1-x642.google.com with SMTP id rk21so26799327ejb.2
 for <qemu-arm@nongnu.org>; Wed, 01 Jul 2020 16:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+SBC+1bi7YP30ifabfY7Lj/c0eUxzfyQUx9HqZ1HkWs=;
 b=CUT2ytIqZZhmeZrHGRoCxKAgJNfEHkXf7qigPD+31/1aqGULywvsF8kt4LxShOsiH6
 tWC/RFBywPUa3tHysfv/xDeAxNol//Px/lbhsOSnt8As5J4C1LwTUykk2LlcYEj62ZO+
 BugrC7xzt5QIvvk9Tw+TYYxyP7JlH/x5rOWJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+SBC+1bi7YP30ifabfY7Lj/c0eUxzfyQUx9HqZ1HkWs=;
 b=tbmp+Gjba6iR8Yw2tJCabiQM8TtFOIKLNnMOWwMSqzVlVnOA1O0DuXziNCNZGVssHu
 LUPKCJbtkhBcIpOGITEvN6xWZTRvB8JoucA1HuN+u2+IoQ4tCeoe/XXcqRYWcq2ZAf3b
 23AZeXyZOaB4LG//zOlEoxmd8wYT1mcqqy/AxerJDFdyJF6FmO3gNUGxqEPtGPK3IrQh
 xTYKTRvu/qjKa1h9xLaHvmzwpDY1oWllMDynR1ofkSN/eE2OyDjXLCc4QdPey0UofaRb
 aeXwEkIUOCDC94at6lLYUlHaHFVyhZrtGvTcyg03STM0QJPAHwgKV2NtcOc2pom2272f
 GnTg==
X-Gm-Message-State: AOAM530NMNyqAMpRzTmj9M2Ph+45fKI3DQVaMlOwJxyLE4qe3FCPVem3
 TFj/7eT+kSKvbGUeOqYfXT2H+5zx08vg1LQj0YU=
X-Received: by 2002:a17:906:1c0d:: with SMTP id
 k13mr26074950ejg.477.1593644805912; 
 Wed, 01 Jul 2020 16:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <CA+MHfoubt1g2FzcjTw3a0vNr7X2T8Jb+nYoc4_x=Z2TP51afKg@mail.gmail.com>
 <a7acba46-5a9a-5dd2-71c6-7e4586485823@amsat.org>
 <CA+MHfot6FdS2yT0mEsCW36bCfwy-WY-1KPQ-KDfYBKzTy=Gd7w@mail.gmail.com>
 <CACPK8Xdqr+EufMgooCY=D+Vt98qu11YTHE5Fzi5+xqX=wKReeQ@mail.gmail.com>
 <b3480de1dece41ed80091feba584c500@TWMBX02.aspeed.com>
 <CACPK8Xd=zz5oAXxu0Hd_szVQ5btQCMPPP7K7OrvAcoYr7zdpPQ@mail.gmail.com>
 <7bd34a68-b851-ce8a-b9d7-14ec169f345f@amsat.org>
In-Reply-To: <7bd34a68-b851-ce8a-b9d7-14ec169f345f@amsat.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Jul 2020 23:06:34 +0000
Message-ID: <CACPK8Xd+RscVYwUmgeV4oHLfcMXjPLobegQ7q_aziLYea5a2fQ@mail.gmail.com>
Subject: Re: hw/misc/aspeed_scu: 5d971f9e breaks Supermicro AST2400
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Erik Smit <erik.lucas.smit@gmail.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 42YOOqvR/gYj

On Wed, 1 Jul 2020 at 07:16, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Hi Joel,
>
> On 7/1/20 4:32 AM, Joel Stanley wrote:
> > On Wed, 1 Jul 2020 at 01:23, Ryan Chen <ryan_chen@aspeedtech.com> wrote=
:
> >
> >> On Tue, 30 Jun 2020 at 15:32, Erik Smit <erik.lucas.smit@gmail.com> wr=
ote:
> >>>
> >>> Hi Philippe,
> >>>
> >>> On Tue, 30 Jun 2020 at 17:29, Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org> wrote:
> >>>>
> >>>> Hi Erik,
> >>>>
> >>>> On 6/30/20 5:11 PM, Erik Smit wrote:
> >>>>> Hello,
> >>>>>
> >>>>> 5d971f9e memory: Revert "memory: accept mismatching sizes in
> >>>>> memory_region_access_valid" breaks Supermicro AST2400 u-boot.
> >>>>> Supermicro AST2500 u-boot is fine.
> >>>>>
> >>>>> The u-boot tries to make a 2-byte read from address 0x84, but
> >>>>> aspeed_ast2400_scu_ops has min_access =3D 4. When I change
> >>>>> min_access to
> >>>>> 2 or revert above commit, u-boot boots again.
> >>>>>
> >>>>> Is changing min_access to 2 the right way to fix this?
> >>
> >> Ryan, do all addresses on the AST2400's APB respond to single byte acc=
esses?
> >
> >>         Most register is not support byte access, it need to refer the=
 datasheet descript each area. [chapter : ARM Address Space Mapping]
> >
> > Thanks Ryan.
> >
> > Summarising that table:
> >
> >  - most addresses are 4 byte write accesses.
> >  - all addresses support 1/2/4 byte reads.
> >
> > The regions that accept 1/2/4 byte access are the SDRAM, SRAM,
> > ethernet MACs, video engine, the flash controller regions (2000_0000
> > -> 2FFF_FFFF and 3000_0000 -> 3FFF_FFFF), and the AHB to LPC bridges
> > (6000_0000 -> 6FFF_FFFF and 7000_0000 -> 7FFF_FFFF).
>
> Useful info. We have:
>
> static const hwaddr aspeed_soc_ast2400_memmap[] =3D {
>
>     /* AHB ??? */
>
>     [ASPEED_IOMEM]  =3D 0x1E600000,
>     [ASPEED_FMC]    =3D 0x1E620000,
>     [ASPEED_SPI1]   =3D 0x1E630000,
>     [ASPEED_ETH1]   =3D 0x1E660000,
>     [ASPEED_ETH2]   =3D 0x1E680000,
>     [ASPEED_EHCI1]  =3D 0x1E6A1000,
>     [ASPEED_VIC]    =3D 0x1E6C0000,
>     [ASPEED_SDMC]   =3D 0x1E6E0000,
>     [ASPEED_SCU]    =3D 0x1E6E2000,
>     [ASPEED_XDMA]   =3D 0x1E6E7000,
>     [ASPEED_ADC]    =3D 0x1E6E9000,
>     [ASPEED_VIDEO]  =3D 0x1E700000,
>     [ASPEED_SRAM]   =3D 0x1E720000,
>     [ASPEED_SDHCI]  =3D 0x1E740000,
>
> This block ^ contains "SRAM, ethernet MACs, video engine
> that accept 1/2/4 byte access". Can we assume all peripherals
> in [0x1E60.0000-0x1E7F.FFFF] accept 1/2/4 byte access?

According to the datasheet, just the SRAM, VIDEO, and ETH{1,2} regions.

1E66_0000-1E67_FFFF (ETH1)
1E68_0000-1E69_FFFF (ETH2)
1E70_0000-1E71_FFFF (VIDEO)
1E72_0000-1E73_FFFF (SRAM)

Confusingly, the SRAM region is documented as a 128KB memory region
but the SRAM itself is only 32KB long.

The other regions are not MMIO regions, but bridges to SPI flash or
over the LPC bus:

0000_0000-0FFF_FFFF (alias for BMC Flash or SDRAM)
1000_0000-15FF_FFFF (legacy BMC Flash)
2000_0000-2FFF_FFFF (BMC Flash)
3000_0000-3FFF_FFFF (Flash: "BIOS" for x86 or "PNOR" for POWER)
4000_0000-5FFF_FFFF (SDRAM)
6000_0000-6FFF_FFFF (AHB2LPC bridge)
7000_0000-7FFF_FFFF (AHB2LPC+ bridge)

This is the full list of regions that are documented as accepting
1/2/4 byte writes. All other regions are documented as only accepting
4 byte writes.

>
>     /* APB ??? */
>
>     [ASPEED_GPIO]   =3D 0x1E780000,
>     [ASPEED_RTC]    =3D 0x1E781000,
>     [ASPEED_TIMER1] =3D 0x1E782000,
>     [ASPEED_UART1]  =3D 0x1E783000,
>     [ASPEED_UART5]  =3D 0x1E784000,
>     [ASPEED_WDT]    =3D 0x1E785000,
>     [ASPEED_PWM]    =3D 0x1E786000,
>     [ASPEED_VUART]  =3D 0x1E787000,
>     [ASPEED_LPC]    =3D 0x1E789000,
>     [ASPEED_IBT]    =3D 0x1E789140,
>     [ASPEED_I2C]    =3D 0x1E78A000,
>
>     [ASPEED_SDRAM]  =3D 0x40000000,
> };
>
> The best description I could find is
> http://i.cloud.opensystemsmedia.com/i__srcfa3ad69f86b70417ba72d4fcbbef08c=
d_paraf0d99c20bd457d46a92c72841873c47.jpeg
> But the buses are not mentioned.
>
> >
> > We don't model the AHB to LPC bridges in qemu, nor the legacy flash
> > controller region at 1000_0000 -> 15FF_FFFF.
> >
> >>>>
> >>>> If you have access to the datasheet and can verify, then yes.
> >>>> Else I suppose C=C3=A9dric, Andrew or Joel can check for you.
> >>>
> >>> I do not have a datasheet. Aspeed seems quite picky about sharing thi=
s
> >>> and I'm just a random researcher.
> >>
> >> Erik, can you point us to the image you're using?
> >>
> >> What is the command line are you testing with?
> >>
> >> Happy to fix the model to support random firmwares, as long as the fix=
 is correct for other (open source) firmwares.
> >>
> >>>
> >>> Best regards,
> >>>
> >>> Erik Smit
> >
