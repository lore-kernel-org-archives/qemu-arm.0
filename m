Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4151755wrv;
        Mon, 15 Jul 2019 06:19:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzuVyJxtcjHh0/2hgdsovzcTthl5+H5Mdwd3boEflBj1C9kHqJdnJ03qtKveuRo6mc/f4HI
X-Received: by 2002:aa7:dad6:: with SMTP id x22mr23130632eds.122.1563196775713;
        Mon, 15 Jul 2019 06:19:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563196775; cv=none;
        d=google.com; s=arc-20160816;
        b=e2CIQI9DXy84Mj1GF0Pqkc5NObZIaOBO1uZGV0hJrcOA6c9jd85nTeJ6OCnfyVtrY8
         P7gwPOma4ApHXkzZvgyNAF5j/ahtxVw9kUk3y5gBF8pHyP1pzIxnPhC3PqOa+Da4CoTM
         NQ60miIBmoraVkLuLbiwWXm9EnTea02zOrWVPQ7W3+hRA5kUVR2xU4/mBGO5iFq7iuyT
         5JqhxILudJtrKFmNRdbnTF2oli8hsV3nAUVFubBTe+45KtRecXrt2z5OUE78DL4dg+m/
         z5otU8KGWSXapj+d+awijsDNn4UZJbk53dsmvp8/VhIs5x8fr/1qr7o8fPEEYoonmmC9
         ycCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=BS3jS7cSFe/WYf55jL9wOIKZjbxYWrXI01bxqmxT/Fc=;
        b=GKWrRyul3FW2z/maE/0MTWEpPfwDgvfdPMl0PYKIq2ZEsAoQFwNxB1VXaYYV0HzjEh
         Q/b1v1lNw/87D2AThHQ/bQgMTQENICKLFM0qpPUTEF2o7sCrc+/E8STOgVmt2TnvX7Bd
         JBMTfTJ4OAiFDu/y09ZjIxOuJ7PO0c1lu9c6BiI2u+D72n4rJimqNHGil3KQ3R7+/khn
         3M4QijDlLt/Fn9XvFtMiMDYvO5hRSdNiOm9eKDGcGjWyQZEGkv7OHtSLJtUCZwUTU2QE
         tnlIHRReLanRe6syzxNbaAqi2FqJzwjDi/bOUseYoL7nb6C+i/cPMFUYkaMk1mQh1gqS
         bzqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gf22si9038948ejb.367.2019.07.15.06.19.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jul 2019 06:19:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hn0tC-0002vD-Rd
	for alex.bennee@linaro.org; Mon, 15 Jul 2019 09:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47015)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <thuth@redhat.com>) id 1hn0t9-0002v6-Nq
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 09:19:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1hn0t8-00016N-M1
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 09:19:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42281)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1hn0t8-000164-De; Mon, 15 Jul 2019 09:19:30 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 151ED3082D6C;
 Mon, 15 Jul 2019 13:19:29 +0000 (UTC)
Received: from thuth.remote.csb (reserved-198-198.str.redhat.com
 [10.33.198.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BE9F6085B;
 Mon, 15 Jul 2019 13:19:17 +0000 (UTC)
To: Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20190715095545.28545-1-philmd@redhat.com>
 <20190715095545.28545-2-philmd@redhat.com>
 <ca528cdc-6118-0b2f-c1b8-30b06875dde8@redhat.com>
 <CAFEAcA-wgTVfj0TUJ=piP0wEgLGiNpOYia5DK2GQAO4Q7gNaWg@mail.gmail.com>
 <6d69e8ad-d720-ce04-20f2-a03193903078@redhat.com>
 <20190715125653.6e65d575.cohuck@redhat.com>
 <c1c68faf-0424-6c7c-e39f-42159457c3ee@redhat.com>
 <20190715130955.4a117388.cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
 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
Organization: Red Hat
Message-ID: <13fce62f-234c-1b13-595f-5910c066bc4f@redhat.com>
Date: Mon, 15 Jul 2019 15:19:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190715130955.4a117388.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Mon, 15 Jul 2019 13:19:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [qemu-s390x] [RFC PATCH 1/3] hw/Kconfig: PCI bus
 implies PCI_DEVICES
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
 Collin Walling <walling@linux.ibm.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Helge Deller <deller@gmx.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>,
 "open list:S390" <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xzqpfZHYp8an

On 15/07/2019 13.09, Cornelia Huck wrote:
> On Mon, 15 Jul 2019 13:04:28 +0200
> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
>=20
>> On 7/15/19 12:56 PM, Cornelia Huck wrote:
>>> On Mon, 15 Jul 2019 12:48:55 +0200
>>> Thomas Huth <thuth@redhat.com> wrote:
>>>  =20
>>>> On 15/07/2019 12.19, Peter Maydell wrote: =20
>>>>> On Mon, 15 Jul 2019 at 11:15, Thomas Huth <thuth@redhat.com> wrote:=
   =20
>>>>>>
>>>>>> On 15/07/2019 11.55, Philippe Mathieu-Daud=C3=A9 wrote:   =20
>>>>>>> If a controller device provides a PCI bus, we can plug any PCI
>>>>>>> daughter card on it.
>>>>>>>
>>>>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>>>>>> ---   =20
>>>>>    =20
>>>>>>> diff --git a/hw/pci/Kconfig b/hw/pci/Kconfig
>>>>>>> index 77f8b005ff..0f7267db35 100644
>>>>>>> --- a/hw/pci/Kconfig
>>>>>>> +++ b/hw/pci/Kconfig
>>>>>>> @@ -1,5 +1,6 @@
>>>>>>>  config PCI
>>>>>>>      bool
>>>>>>> +    imply PCI_DEVICES   =20
>>>>>>
>>>>>> No, please don't change this. This was done on purpose, since almo=
st all
>>>>>> PCI_DEVICES do not work on s390x (so s390x does *not* imply PCI_DE=
VICES).   =20
>>>>>
>>>>> But that means that every board that provides PCI has to have an
>>>>> "imply PCI_DEVICES" line, which is pretty clunky just to work
>>>>> around an s390x limitation.
>>>>>
>>>>> Is there some way in the Kconfig syntax for s390x to say
>>>>> "no PCI_DEVICES" so we can have the corner-case be handled
>>>>> by the s390x Kconfig in one place rather than in 20 places
>>>>> affecting everywhere except s390x?   =20
>>>>
>>>> IIRC the problem on s390x are the legacy IRQs. s390x has only MSIs. =
So I
>>>> guess the correct way to fix this would be to introduce some
>>>> PCI_LEGACY_IRQ switch and let all old devices that do not work with =
MSI
>>>> depend on it. =20
>>>
>>> s/MSI/MSI-X/, IIRC. Not sure how far 'legacy' would stretch. =20
>>
>> Maybe we can have something like PCI_LEGACY_DEVICES and PCI_MSI_DEVICE=
S?
>>
>> So if s390x only selects PCI_LEGACY (not PCI_MSI) bus, then it only ge=
t
>> legacy devices?
>=20
> Wrong way around? We need MSI-X for s390x, not plain MSI or
> 'legacy' (whatever that is).

With "legacy" I meant the old level-triggered interrupts from the early
PCI (non-express) days. Sorry for being imprecise here.

So maybe we need two new switches, PCI_CLASSIC (or so) and PCI_MSIX, and
then the PCI devices should be marked with "default y if PCI_CLASSIC" if
they do not have MSIX support, and with "default y if PCI_MSIX" if they
have MSI-X support?

 Thomas


 Thomas
