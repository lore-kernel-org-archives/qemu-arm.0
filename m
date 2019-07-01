Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2707560wru;
        Mon, 1 Jul 2019 07:22:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwycsTTiq000tz76sCraiQ8zkyuTlmM3mksNHCHidynDbUF1VTwuHnWYKVz3kxMdzgOKkhh
X-Received: by 2002:aa7:c24b:: with SMTP id y11mr4724004edo.239.1561990927294;
        Mon, 01 Jul 2019 07:22:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561990927; cv=none;
        d=google.com; s=arc-20160816;
        b=p9jyIygFEzqnQNZJWMFLTDr8T+vpSF7gB7Y5Z2ZwEewoZ93EhBb+SXFvcCgAY250mR
         DSviu1vTB4tyUehfGALDjHEcsFpVXJalbc3dNxk3gPF2S0lYpVNwQ7ruybp2L7o8wBUt
         oM6OWJXtxiG5eGtYp6LXdtooBwOTDMlwXSPsFBpRgUlRp3CQ7Na0lpXibwHRl3sVwOFf
         cUDxJtRHSSYYBXQ57sEWl6zGXvU4I/CM8FtL3HSuEEmUB4nwHD7fE3QD74ZGE9DPgu5p
         VmimzigDJ+2NGVEMv6HayGxKLarJplVMb5JAhJ0bZXYVAfFEgdM7nX6+Qa//HH54q5u+
         QJXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=LP+V8V/94+YW963cU63vd/3xASUcP+23Oindl/Bd47Y=;
        b=v7RrhuKw2uJ+9B5koYcrL3+pnJNvqPdmACo14cGCp8Gc2P9nbKRs0vvAsgNL3csNaQ
         85uGlgHriqs/FqW5eEwIaPBTS/guWTaBqDQ6GmeCZUAf3DcScmsWvKAECo4QvmYgBQhy
         h9yLVGwV2Xuzk6jbIUT+t6SQcqoHUtZDmMx4oQN6OFYAS75mNlfVkS2MEpzrwUTp7VVT
         tFVOE4TP4jfQ6IAr6yYBdqN5Vyy0yJtXfjGCASUXw58xfe1/m08+jFeDN/TEI0hqvfVA
         l3IOlZUFoQ0nK8SbnYBj1Vc3zo1KyZYywBsAhldbRGyNM5kAYfVhLJl4Bwg873SMscsw
         YC+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17si7139888ejd.150.2019.07.01.07.22.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 07:22:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhxC2-0006rI-Ah
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 10:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46651)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hhwhg-0007kM-2O
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 09:50:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hhwhe-0001Sa-OL
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 09:50:43 -0400
Received: from 6.mo69.mail-out.ovh.net ([46.105.50.107]:37157)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hhwhe-0001OW-HA
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 09:50:42 -0400
Received: from player693.ha.ovh.net (unknown [10.109.143.109])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id BD5755ED29
 for <qemu-arm@nongnu.org>; Mon,  1 Jul 2019 15:50:34 +0200 (CEST)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: clg@kaod.org)
 by player693.ha.ovh.net (Postfix) with ESMTPSA id 405EC769EFB6;
 Mon,  1 Jul 2019 13:50:29 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190618165311.27066-1-clg@kaod.org>
 <20190618165311.27066-16-clg@kaod.org>
 <CAFEAcA-J+bS2-EtX6pTFYJ1XMaNLx0roYEoQMxV_=-mwMSPDgg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6a826ad0-1830-a865-d267-80529ad27a84@kaod.org>
Date: Mon, 1 Jul 2019 15:50:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-J+bS2-EtX6pTFYJ1XMaNLx0roYEoQMxV_=-mwMSPDgg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 1128714660789586859
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrvdeigdeilecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.50.107
Subject: Re: [Qemu-arm] [PATCH v2 15/21] aspeed/smc: add support for DMAs
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hZBp0qzO4ix8

On 01/07/2019 15:06, Peter Maydell wrote:
> On Tue, 18 Jun 2019 at 17:55, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
>>
>> The FMC controller on the Aspeed SoCs support DMA to access the flash
>> modules. It can operate in a normal mode, to copy to or from the flash
>> module mapping window, or in a checksum calculation mode, to evaluate
>> the best clock settings for reads.
>>
>> The model introduces two custom address spaces for DMAs: one for the
>> AHB window of the FMC flash devices and one for the DRAM. The latter
>> is populated using a "dram" link set from the machine with the RAM
>> container region.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> Acked-by: Joel Stanley <joel@jms.id.au>
>> +/*
>> + * Accumulate the result of the reads to provide a checksum that will
>> + * be used to validate the read timing settings.
>> + */
>> +static void aspeed_smc_dma_checksum(AspeedSMCState *s)
>> +{
>> +    MemTxResult result;
>> +    uint32_t data;
>> +
>> +    if (s->regs[R_DMA_CTRL] & DMA_CTRL_WRITE) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "%s: invalid direction for DMA checksum\n",  __=
func__);
>> +        return;
>> +    }
>> +
>> +    while (s->regs[R_DMA_LEN]) {
>> +        result =3D address_space_read(&s->flash_as, s->regs[R_DMA_FLA=
SH_ADDR],
>> +                                    MEMTXATTRS_UNSPECIFIED,
>> +                                    (uint8_t *)&data, 4);
>=20
> This does a byte-by-byte read into a local uint32_t...
>=20
>> +        if (result !=3D MEMTX_OK) {
>> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: Flash read failed @%0=
8x\n",
>> +                          __func__, s->regs[R_DMA_FLASH_ADDR]);
>> +            return;
>> +        }
>> +
>> +        /*
>> +         * When the DMA is on-going, the DMA registers are updated
>> +         * with the current working addresses and length.
>> +         */
>> +        s->regs[R_DMA_CHECKSUM] +=3D data;
>=20
> ...which we then use as a (host-endian) 32-bit value.
>=20
> This will behave differently on big endian and little endian hosts.
> If the h/w behaviour is to to load a 32-bit data type you probably
> want address_space_ldl_le() (or _be() if it's doing a big-endian load).
>=20
>> +        s->regs[R_DMA_FLASH_ADDR] +=3D 4;
>> +        s->regs[R_DMA_LEN] -=3D 4;
>> +    }
>> +}
>> +
>> +static void aspeed_smc_dma_rw(AspeedSMCState *s)
>> +{
>> +    MemTxResult result;
>> +    uint32_t data;
>> +
>> +    while (s->regs[R_DMA_LEN]) {
>> +        if (s->regs[R_DMA_CTRL] & DMA_CTRL_WRITE) {
>> +            result =3D address_space_read(&s->dram_as, s->regs[R_DMA_=
DRAM_ADDR],
>> +                                        MEMTXATTRS_UNSPECIFIED,
>> +                                        (uint8_t *)&data, 4);
>> +            if (result !=3D MEMTX_OK) {
>> +                qemu_log_mask(LOG_GUEST_ERROR, "%s: DRAM read failed =
@%08x\n",
>> +                              __func__, s->regs[R_DMA_DRAM_ADDR]);
>> +                return;
>> +            }
>> +
>> +            result =3D address_space_write(&s->flash_as,
>> +                                         s->regs[R_DMA_FLASH_ADDR],
>> +                                         MEMTXATTRS_UNSPECIFIED,
>> +                                         (uint8_t *)&data, 4);
>> +            if (result !=3D MEMTX_OK) {
>> +                qemu_log_mask(LOG_GUEST_ERROR, "%s: Flash write faile=
d @%08x\n",
>> +                              __func__, s->regs[R_DMA_FLASH_ADDR]);
>> +                return;
>> +            }
>> +        } else {
>> +            result =3D address_space_read(&s->flash_as, s->regs[R_DMA=
_FLASH_ADDR],
>> +                                        MEMTXATTRS_UNSPECIFIED,
>> +                                        (uint8_t *)&data, 4);
>> +            if (result !=3D MEMTX_OK) {
>> +                qemu_log_mask(LOG_GUEST_ERROR, "%s: Flash read failed=
 @%08x\n",
>> +                              __func__, s->regs[R_DMA_FLASH_ADDR]);
>> +                return;
>> +            }
>> +
>> +            result =3D address_space_write(&s->dram_as, s->regs[R_DMA=
_DRAM_ADDR],
>> +                                         MEMTXATTRS_UNSPECIFIED,
>> +                                         (uint8_t *)&data, 4);
>> +            if (result !=3D MEMTX_OK) {
>> +                qemu_log_mask(LOG_GUEST_ERROR, "%s: DRAM write failed=
 @%08x\n",
>> +                              __func__, s->regs[R_DMA_DRAM_ADDR]);
>> +                return;
>> +            }
>> +        }
>=20
> Since the code here doesn't do anything with the data the
> address_space_read/write here aren't wrong, but you might
> prefer to use the ldl and stl functions to avoid the casts
> to uint8_t* and need to specify the length.

yes. I will check with the HW guys to know precisely how the values are
read and accumulated.

Thanks,

C.=20
