Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2288077wrs;
        Sun, 18 Aug 2019 23:44:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzD/KHu31EG2og5M15xyzHqKtTsLu7qRe7K9eSrRQX4Alxqzm100tctdmbjgK/gMk8EBnTa
X-Received: by 2002:a37:bb06:: with SMTP id l6mr18407342qkf.1.1566197060324;
        Sun, 18 Aug 2019 23:44:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566197060; cv=none;
        d=google.com; s=arc-20160816;
        b=tyr74ZuKbKPDs+zKuRiWnzSr7l7Sz1Ci3imRss7R4vJoFRfv0dn4D6O8bEZURlp424
         37qiEvsSg6t50/5FkTpsxYbu4DDvB5KEnMsKSLLQrUWmwQdQsE6NDryDiAFsTj9Yn6BR
         iRO3YePYSX0CPV3JUlMt9w/xcTwmkEfiYRWXlvm61CCFASnvgEbfpWysEaX9mWI50Hxa
         Ih5FlBEM0AdEnFHwPkhct7pxV6AeWz2IsI6pkrhHLRh52hQkFNQffmTmLECNXrzQjAP3
         Av8DpzNfhZ9fHHNLPKKEqSmD20iQmOnM1qtSES0mASAtN/EUm9RUg5tqBiJshCq1v4B6
         I8IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=Ti70n/l/LKYsSRkx0AI90OWs8IgnVL9J2qsGvBthHHM=;
        b=vGsz0cBufD3DB/pO/2Oulrgn9ImM/xj+Q4bRRrC19SPOjVMyUBvj1jkQ9Ef0eQxqu3
         hMbqZ+EJhxTwtY1TG5nZDSCL9ZXKoWmvjbdk3BDLhHM70TLSw+PY9ShSnQg+ji9FiWlx
         Y5vx5a9gUVPGQ4Tt+1G9r9xj//rTmNjObYjL2DIyX+VyEn3mUzc57iKJERQCNfCh0OAf
         KGynlUIMb4uoDJY+DILCvTh8lLA0Afc+e1SZXdza8rolH022c4fMyN4Z6CUTF8SCm86t
         9cP7GwcgCVbSt3cE2psX6W7il1r4BL/F7DZiJ1BTKrM/bmCVsUAyWjtNzxCrqwEDYD4H
         IOVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x123si7863783qkb.55.2019.08.18.23.44.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Aug 2019 23:44:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzbOt-0004xr-Os
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 02:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54382)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1hzbNk-0003qm-LI
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 02:43:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hzbNj-0007ph-JJ
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 02:43:08 -0400
Received: from 18.mo6.mail-out.ovh.net ([46.105.73.110]:40390)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hzbNj-0007oe-Du
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 02:43:07 -0400
Received: from player737.ha.ovh.net (unknown [10.109.160.76])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id D77031DD2D1
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 08:43:05 +0200 (CEST)
Received: from kaod.org (lfbn-ren-1-123-36.w83-205.abo.wanadoo.fr
 [83.205.208.36]) (Authenticated sender: clg@kaod.org)
 by player737.ha.ovh.net (Postfix) with ESMTPSA id D6CBD9083C3D;
 Mon, 19 Aug 2019 06:42:58 +0000 (UTC)
To: Eddie James <eajames@linux.ibm.com>, qemu-devel@nongnu.org
References: <1565814456-1264-1-git-send-email-eajames@linux.ibm.com>
 <ca560d31-25ca-5d48-a16a-4fdf74f4779b@kaod.org>
 <24e21dd0-55b8-a5df-57da-2d68bee204a0@linux.ibm.com>
 <cb2d52b2-65ef-41d6-0e3f-6aefb78f4d34@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e93c7ced-ad33-fbca-427b-8996bb4860fe@kaod.org>
Date: Mon, 19 Aug 2019 08:42:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cb2d52b2-65ef-41d6-0e3f-6aefb78f4d34@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 4969722188967086865
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudefkedguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.73.110
Subject: Re: [Qemu-arm] [RFC v2] hw/sd/aspeed_sdhci: New device
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
Cc: andrew@aj.id.au, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nM6HlhMP6hiN

On 15/08/2019 22:21, Eddie James wrote:
>=20
> On 8/15/19 3:13 PM, Eddie James wrote:
>>
>> On 8/15/19 3:05 AM, C=C3=A9dric Le Goater wrote:
>>> Hello Eddie,
>>>
>>> On 14/08/2019 22:27, Eddie James wrote:
>>>>
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sdhci->slots[0].capareg =
=3D (uint64_t)(uint32_t)val;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>> +=C2=A0=C2=A0=C2=A0 case ASPEED_SDHCI_SDIO_148:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sdhci->slots[0].maxcurr =
=3D (uint64_t)(uint32_t)val;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>> +=C2=A0=C2=A0=C2=A0 case ASPEED_SDHCI_SDIO_240:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sdhci->slots[1].capareg =
=3D (uint64_t)(uint32_t)val;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>> +=C2=A0=C2=A0=C2=A0 case ASPEED_SDHCI_SDIO_248:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sdhci->slots[1].maxcurr =
=3D (uint64_t)(uint32_t)val;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>> I think these regs are readonly.
>>
>>
>> Well the actual regs at slot + 0x40/0x48 are indeed, but not the Aspee=
d-specific ones that mirror there. I think the idea is that Aspeed-specif=
ic code can set it's capabilities differently if desired. This may preven=
t the use of alias regions here.
>=20
>=20
> Actually I could be wrong after reading the specs again. It's a little =
confusing. I'm fine with making it read-only anyway, I doubt there will b=
e any code that needs to write it.

Let's ask Aspeed what was the intent. It is a bit weird indeed.=20

>=20
>=20
>>
>>
>>>
>>>> +=C2=A0=C2=A0=C2=A0 default:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (addr < ASPEED_SDHCI_=
REG_SIZE) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
sdhci->regs[TO_REG(addr)] =3D (uint32_t)val;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +}
>>>> +
>>>> +static const MemoryRegionOps aspeed_sdhci_ops =3D {
>>>> +=C2=A0=C2=A0=C2=A0 .read =3D aspeed_sdhci_read,
>>>> +=C2=A0=C2=A0=C2=A0 .write =3D aspeed_sdhci_write,
>>>> +=C2=A0=C2=A0=C2=A0 .endianness =3D DEVICE_NATIVE_ENDIAN,
>>>> +=C2=A0=C2=A0=C2=A0 .valid.min_access_size =3D 4,=20

