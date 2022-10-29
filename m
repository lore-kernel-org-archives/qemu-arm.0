Received: by 2002:a17:906:4687:b0:7ad:c089:ed49 with SMTP id a7csp28885ejr;
        Sat, 29 Oct 2022 11:29:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Pom/w3o5znFZ8HXbhtF0CDdSSyltPfyXob5SL+7ZjAmGSO58nyubkI+wRnr1cU/EupT1y
X-Received: by 2002:ac8:5cd0:0:b0:39c:f33b:d01b with SMTP id s16-20020ac85cd0000000b0039cf33bd01bmr4530526qta.502.1667068195808;
        Sat, 29 Oct 2022 11:29:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667068195; cv=none;
        d=google.com; s=arc-20160816;
        b=urktvdDo82aE7f/t+ymEnpYCobajCCdLNFmGYZg69XbGj4T5BJBGyQrH85N9hkWhQl
         gpjROiLo5Yas6SRKkXAjpfwH2QuA40PNcb0A7AmMC8bKl3CM0Y/zjQTk4ku7lPaEWajd
         qnjYQFZbyxRhuMZGmjrZUi99w/t4ma1pRfOlItIE09ctwKDQWLq88VJbh0QPJHONBW8P
         gi9n99j4r5QICrgHRAaXvfpf1Y/Uhe11gJefgf7q4YQ2EiE9BJ1Wxinqm2z/CZHI5ACR
         e6XDWmz6fJ4AHEHIkRzMCJF9l7uO7lANL2ppMTIn0dwudDooBV0MbbyPHaR8qcB4ZR/b
         w38w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:references:in-reply-to:subject:cc:to:from
         :date:dkim-signature;
        bh=GB7iL0F+2bPhMVLYhvMU2l6HUh0S0DPm01adwxNs+gM=;
        b=Mj1SJ3rUKo1dUGNgLrqf9PHDDXs6KolTXcM18IgZcPELG8nOp/1i7V/vnFDe4ArXEY
         hiov6cXiP2zXIz3WaAXAV8tr2v9SG8h5+3m8bDHKndh7RHJm/vHEaYxiXlLsRvJHKR0x
         BxBJJ5SDYpdhrfXPttWP75AGL7/1UgwJVcCi0NA9+8UAhPciq1fkKkLX+FGLt81WZGPA
         q0a5+bz+5Rdz73McKEsM72n8N4I6eBzAvs95bYCBNvaHbj4jJ2WrVcQJYhKd1T9VX1f9
         I4gGtqo3GyhzVim/0a3F1wYqTHKpVH9nGFuK5VfkADc5b6i4vlC17mFunaX/BYb66SNI
         rvGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=VnwSSocS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d144-20020ae9ef96000000b006ce867561efsi1165929qkg.348.2022.10.29.11.29.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Oct 2022 11:29:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=VnwSSocS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ooqa1-0002XU-Sl; Sat, 29 Oct 2022 14:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ooqZt-0002Sw-Lc; Sat, 29 Oct 2022 14:29:08 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ooqZr-0008AA-OW; Sat, 29 Oct 2022 14:29:05 -0400
Received: by mail-ed1-x52b.google.com with SMTP id v27so12247098eda.1;
 Sat, 29 Oct 2022 11:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GB7iL0F+2bPhMVLYhvMU2l6HUh0S0DPm01adwxNs+gM=;
 b=VnwSSocSX5eFH8DESSXLIsRjrvnmqlgyo3qtMecDwszBRtgxjl/Yi3m8yODWtaGNGm
 ubGRJBv1VyE8vVLZ00duaNMTczEHhBrnQOA6dO31fVl74kHCvIKCPH/mgm9Yt2QvfeaP
 lqP1745zYfvMgfKKxLtYtY8vNlF3IK0YZPznbGnPkhQKBWlBz1pFJSW5OGWiok9f4zU6
 f5blzSOWcV3Nlu/U25dzVl5lEYvLopso7TBRZXpFKcvSWn+hW36JfkanaIE5OgqmVfww
 2NmWPIs1Nvt2MQFl1APl3auM2szTcMnh96s9f4CizCv1u8enKeuQeHKFU+qcCFCCYbkj
 RZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GB7iL0F+2bPhMVLYhvMU2l6HUh0S0DPm01adwxNs+gM=;
 b=SIYBfu7TBCv8wH+G6vbezEcfR8OIClxwyHehyoFg0ceTqgIsS43BoDmUH/v9jV0xHc
 xvndsRDZasryGeU8cR6Iw47oIvRlJaW2T2j7O1C6zvMzrvZYINefKOTEMzGaNEdEgEj/
 rw2ajdjJ1WIE8ariCOgzmw/jdJv3Jhe9NsOUNbLyS+BN+F0QXygUXQ2MP4M3MWAznwQp
 wHDAC0hO6By/OBNFh++5TOTIg0LRPV+4gz7vpH1ipfU1mWTO0EXXPBDdP0v0X2+Wu38Q
 GGnGeC8zcog39gYWazyHV2XcTYQ2hVfD38G+tOIHoeaFYI0G4gGDYJPTD7yCk7sySFuy
 iDpQ==
X-Gm-Message-State: ACrzQf1LAcLeZotV/LKm7R8sFBkc7HB9/djr+lf03JjYMw098gR/wBIg
 2fQkByZzaRhJMT7W9XrYJNM=
X-Received: by 2002:a05:6402:110b:b0:462:dd93:28ff with SMTP id
 u11-20020a056402110b00b00462dd9328ffmr5462116edv.421.1667068138161; 
 Sat, 29 Oct 2022 11:28:58 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf0bb200f50836641a6239f2.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:f508:3664:1a62:39f2])
 by smtp.gmail.com with ESMTPSA id
 dm17-20020a05640222d100b0044ef2ac2650sm1073127edb.90.2022.10.29.11.28.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Oct 2022 11:28:57 -0700 (PDT)
Date: Sat, 29 Oct 2022 18:28:54 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>, 
 Alistair Francis <alistair@alistair23.me>, Bin Meng <bin.meng@windriver.com>, 
 Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Jan Kiszka <jan.kiszka@web.de>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_6/7=5D_hw/sd/sdhci=3A_Imp?=
 =?US-ASCII?Q?lement_Freescale_eSDHC_device_model?=
In-Reply-To: <590683A5-2774-432C-A47A-ED755054479C@gmail.com>
References: <20221018210146.193159-1-shentey@gmail.com>
 <20221018210146.193159-7-shentey@gmail.com>
 <f9dd1e1e-65b6-c74d-d957-43774393c2a4@linaro.org>
 <724F8CC8-C5E8-4785-B5C2-F1D327863717@gmail.com>
 <590683A5-2774-432C-A47A-ED755054479C@gmail.com>
Message-ID: <DB3C19E8-007B-46F6-96B3-EE0CF6AD2019@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hVF1MmVRonKL

Am 29=2E Oktober 2022 13:04:00 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>Am 29=2E Oktober 2022 11:33:51 UTC schrieb Bernhard Beschow <shentey@gmai=
l=2Ecom>:
>>Am 27=2E Oktober 2022 21:40:01 UTC schrieb "Philippe Mathieu-Daud=C3=A9"=
 <philmd@linaro=2Eorg>:
>>>Hi Bernhard,
>>>
>>>On 18/10/22 23:01, Bernhard Beschow wrote:
>>>> Will allow e500 boards to access SD cards using just their own device=
s=2E
>>>>=20
>>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>>> ---
>>>>   hw/sd/sdhci=2Ec         | 120 +++++++++++++++++++++++++++++++++++++=
++++-
>>>>   include/hw/sd/sdhci=2Eh |   3 ++
>>>>   2 files changed, 122 insertions(+), 1 deletion(-)
>>>>=20
>>>> diff --git a/hw/sd/sdhci=2Ec b/hw/sd/sdhci=2Ec
>>>> index 306070c872=2E=2E8d8ad9ff24 100644
>>>> --- a/hw/sd/sdhci=2Ec
>>>> +++ b/hw/sd/sdhci=2Ec
>>>> @@ -1369,6 +1369,7 @@ void sdhci_initfn(SDHCIState *s)
>>>>       s->transfer_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_da=
ta_transfer, s);
>>>>         s->io_ops =3D &sdhci_mmio_ops;
>>>> +    s->io_registers_map_size =3D SDHC_REGISTERS_MAP_SIZE;
>>>>   }
>>>>     void sdhci_uninitfn(SDHCIState *s)
>>>> @@ -1392,7 +1393,7 @@ void sdhci_common_realize(SDHCIState *s, Error =
**errp)
>>>>       s->fifo_buffer =3D g_malloc0(s->buf_maxsz);
>>>>         memory_region_init_io(&s->iomem, OBJECT(s), s->io_ops, s, "sd=
hci",
>>>> -                          SDHC_REGISTERS_MAP_SIZE);
>>>> +                          s->io_registers_map_size);
>>>
>>>I don't think we want to change this region size=2E [see below]
>>>
>>>>   void sdhci_common_unrealize(SDHCIState *s)
>>>> @@ -1575,6 +1576,122 @@ static const TypeInfo sdhci_bus_info =3D {
>>>>       =2Eclass_init =3D sdhci_bus_class_init,
>>>>   };
>>>>   +/* --- qdev Freescale eSDHC --- */
>>>> +
>>>> +/* Watermark Level Register */
>>>> +#define ESDHC_WML                    0x44
>>>> +
>>>> +/* Control Register for DMA transfer */
>>>> +#define ESDHC_DMA_SYSCTL            0x40c
>>>> +
>>>> +#define ESDHC_REGISTERS_MAP_SIZE    0x410
>>>
>>>My preferred approach would be to create a container region with a
>>>size of ESDHC_REGISTERS_MAP_SIZE=2E Map the SDHC_REGISTERS_MAP region
>>>in the container at offset 0, priority -1=2E Add 2 register regions
>>>for ESDHC_WML and ESDHC_DMA_SYSCTL, and map them with priority 1 in
>>>the container=2E =2E=2E=2E
>>>
>>>> +static uint64_t esdhci_read(void *opaque, hwaddr offset, unsigned si=
ze)
>>>> +{
>>>> +    uint64_t ret;
>>>> +
>>>> +    switch (offset) {
>>>> +    case SDHC_SYSAD:
>>>> +    case SDHC_BLKSIZE:
>>>> +    case SDHC_ARGUMENT:
>>>> +    case SDHC_TRNMOD:
>>>> +    case SDHC_RSPREG0:
>>>> +    case SDHC_RSPREG1:
>>>> +    case SDHC_RSPREG2:
>>>> +    case SDHC_RSPREG3:
>>>> +    case SDHC_BDATA:
>>>> +    case SDHC_PRNSTS:
>>>> +    case SDHC_HOSTCTL:
>>>> +    case SDHC_CLKCON:
>>>> +    case SDHC_NORINTSTS:
>>>> +    case SDHC_NORINTSTSEN:
>>>> +    case SDHC_NORINTSIGEN:
>>>> +    case SDHC_ACMD12ERRSTS:
>>>> +    case SDHC_CAPAB:
>>>> +    case SDHC_SLOT_INT_STATUS:
>>>> +        ret =3D sdhci_read(opaque, offset, size);
>>>> +        break;
>>>
>>>=2E=2E=2E Then you don't need these cases=2E
>>>
>>>> +    case ESDHC_WML:
>>>> +    case ESDHC_DMA_SYSCTL:
>>>> +        ret =3D 0;
>>>> +        qemu_log_mask(LOG_UNIMP, "ESDHC rd @0x%02" HWADDR_PRIx
>>>> +                      " not implemented\n", offset);
>>>
>>>But then I realize you only treat these 2 registers as UNIMP=2E
>>>
>>>So now, I'd create 1 UNIMP region for ESDHC_WML and map it
>>>into SDHC_REGISTERS_MAP (s->iomem) with priority 1, and add
>>>another UNIMP region of ESDHC_REGISTERS_MAP_SIZE - SDHC_REGISTERS_MAP_S=
IZE (=3D 0x310) and map it normally at offset
>>>0x100 (SDHC_REGISTERS_MAP_SIZE)=2E Look at create_unimp() in
>>>hw/arm/bcm2835_peripherals=2Ec=2E
>>>
>>>But the ESDHC_WML register has address 0x44 and fits inside the
>>>SDHC_REGISTERS_MAP region, so likely belong there=2E 0x44 is the
>>>upper part of the SDHC_CAPAB register=2E These bits are undefined
>>>on the spec v2, which I see you are setting in esdhci_init()=2E
>>>So this register should already return 0, otherwise we have
>>>a bug=2E Thus we don't need to handle this ESDHC_WML particularly=2E
>
>My idea here was to catch this unimplemented case in order to indicate th=
is clearly to users=2E Perhaps it nudges somebody to provide a patch?
>
>>>
>>>And your model is reduced to handling create_unimp() in esdhci_realize(=
)=2E
>>>
>>>Am I missing something?
>>
>>The mmio ops are big endian and need to be aligned to a 4-byte boundary=
=2E It took me quite a while to debug this=2E So shall I just create an add=
itional memory region for the region above SDHC_REGISTERS_MAP_SIZE for ESDH=
C_DMA_SYSCTL?
>
>All in all I currently don't have a better idea than keeping the custom i=
/o ops for the standard region and adding an additional unimplemented regio=
n for ESDHC_DMA_SYSCTL=2E I think I'd have to dynamically allocate memory f=
or it where I still need to figure out how not to leak it=2E

By simply reusing sdhci_{read,write} in eSDHC's io_ops struct I was able t=
o remove the custom implementations while having big endian and the alignme=
nts proper=2E However, I don't see a way of adding two memory regions - wit=
h or without a container=2E With a container I'd have to somehow preserve t=
he mmio attribute which is initialized by the parent class, re-initialize i=
t with the container, and add the preserved memory region as child=2E This =
seems very fragile, esp=2E since the parent class has created an alias for =
mmio in sysbus=2E Without a container, one would have two memory regions th=
at both have to be mapped separately by the caller, i=2Ee=2E it burdens the=
 caller with an implementation detail=2E

Any suggestions?

Best regards,
Bernhard
>
>Best regards,
>Bernhard
>>
>>Best regards,
>>Bernhard
>>>
>>>Regards,
>>>
>>>Phil=2E
>>
>

