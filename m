Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp904712wrv;
        Wed, 17 Jul 2019 06:52:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzgp25jf04V9cS8tgxk/ZvIuZJlDcIaFAfXZ10/pHRygoybr2eqYe9oYwiv3y1JF0YIBHE0
X-Received: by 2002:a05:6402:1557:: with SMTP id p23mr34517543edx.207.1563371560317;
        Wed, 17 Jul 2019 06:52:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563371560; cv=none;
        d=google.com; s=arc-20160816;
        b=scDhBGpBIR6v/8D4pFyiAQ24AZ0mm/gADjzcqSP0ZgQMjuBUf1d9uRzGJQ9WfAw6eI
         UoYKKXMu2VZxaeqvqEpGQobwuJYwO/xgsD+QZM+tAtq9EWHZlq+M9Ty+qwhbtqVBjdLU
         AlJwfGOtBk01rj0AR+HfykvGFrbSKc2WeefGX2nCnxoP2eh0T+SroE+Tm6IAdxfqQYyd
         2ThUDxYukXS/jATDjyvtRQ9Tb/vmWxbpUmvTyG727fubT+AaGg60jCN3UYOxsn3Dwilo
         7TZZFQPFwmqQFuQyULa3Nq0TLvwrE5E4dbYnGfjUW6z9oVfx+evwrIRDu4TnTW7rbIlu
         sUQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=lcPKlikHVw0UKOu5w7sujRIctLFD92nRZ7VhRKeyegM=;
        b=EJTTrwJtcIPTXnMf0mX7gCOGU9Iyzr2nsebvZBtdMBXu/sdUCiBsIP/f+HPd5yDyIE
         jy4EBmB0B7CHbqGjOrCzse05dzH9/d1cag+VL/XmWIynRcUdLffm889czE/7oemlZSZ/
         c3gSrmdarhBqX8UYw4zp82YDRfFRaCO4Td7OfD9r7pgGiZfYUAKQewi2x3HQsTha4zjc
         Ymo6Ry1mTZntKrk3cVrj8YjcohZbJcubFH4R9MsSIvp2/aAOXl4Tgklyu6k5UqjVGdxO
         jI6kTUVQ8vwEFdlkC78vz5K+PESrXbdbBZW7Z2tkO2BAPYNrv1ZksNTpQhVJMdJxpwuM
         mDvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13si12638812ejb.163.2019.07.17.06.52.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2019 06:52:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hnkMI-0003FV-PQ
	for alex.bennee@linaro.org; Wed, 17 Jul 2019 09:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58310)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hnkMC-000342-6L
 for qemu-arm@nongnu.org; Wed, 17 Jul 2019 09:52:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hnkMB-0002MX-5L
 for qemu-arm@nongnu.org; Wed, 17 Jul 2019 09:52:32 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40331)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hnkMA-0002Ld-Tc
 for qemu-arm@nongnu.org; Wed, 17 Jul 2019 09:52:31 -0400
Received: by mail-wm1-f66.google.com with SMTP id v19so22272917wmj.5
 for <qemu-arm@nongnu.org>; Wed, 17 Jul 2019 06:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lcPKlikHVw0UKOu5w7sujRIctLFD92nRZ7VhRKeyegM=;
 b=VyPrBU52RMauYRRROjdZl2jJAx2A6E1nAr5up6nP/KhP2D9mVClcn90D7TIzB63ZGi
 S4d5Dj8AFTbd4kw+My9Dg0tnxRBcgCOiLrVmeczvDm3XiInrCozuQfeaOmj5A7WUoKjd
 Z+dnruS6IwjaxUElmu0yQzqq7N5KnOIOPL4ffRLJu4HNazUfSPSVwOmRo4Sxsx/tBkeX
 5K9Gt0Xp0xGZKVX3RrJSMiCvYAmpcry7F1LuZC4GL/glp8OAslovO/sF0ymSTwgiJw7+
 KUNkTCIargk5a/1ZQaOj9jYIGQCxTZux6Nfmfd9UlBAL+wIMbVLw5RHGt0RfqG2H4W/S
 FMiQ==
X-Gm-Message-State: APjAAAVK19isCp3L2AxOd6VPzeB8VNKxuFgYq5oXmjZtgWU9kAUDSxmE
 zcWqaJTL9Ubn//NyNz4iAqizpA==
X-Received: by 2002:a05:600c:2388:: with SMTP id
 m8mr35524465wma.23.1563371549409; 
 Wed, 17 Jul 2019 06:52:29 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:e427:3beb:1110:dda2?
 ([2001:b07:6468:f312:e427:3beb:1110:dda2])
 by smtp.gmail.com with ESMTPSA id h133sm24905915wme.28.2019.07.17.06.52.28
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Jul 2019 06:52:28 -0700 (PDT)
To: Collin Walling <walling@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20190715095545.28545-1-philmd@redhat.com>
 <20190715095545.28545-2-philmd@redhat.com>
 <ca528cdc-6118-0b2f-c1b8-30b06875dde8@redhat.com>
 <CAFEAcA-wgTVfj0TUJ=piP0wEgLGiNpOYia5DK2GQAO4Q7gNaWg@mail.gmail.com>
 <6d69e8ad-d720-ce04-20f2-a03193903078@redhat.com>
 <20190715125653.6e65d575.cohuck@redhat.com>
 <c1c68faf-0424-6c7c-e39f-42159457c3ee@redhat.com>
 <20190715130955.4a117388.cohuck@redhat.com>
 <13fce62f-234c-1b13-595f-5910c066bc4f@redhat.com>
 <6c39a198-e951-c0bd-1ddc-5d227afe72ff@redhat.com>
 <87a7dfth4i.fsf@dusky.pond.sub.org>
 <20190715181206.3cb1db93.cohuck@redhat.com>
 <799aa0f5-8850-5caa-5103-e1cf3cdb018f@redhat.com>
 <87h87m2knh.fsf@dusky.pond.sub.org>
 <beb5fe93-991d-ba2b-d2c1-51e01b912dbe@redhat.com>
 <50befb09-d381-4362-9cd1-6fb11c96a719@linux.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <633cc3f7-eb20-1bfe-03d2-e481be188eb1@redhat.com>
Date: Wed, 17 Jul 2019 15:52:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <50befb09-d381-4362-9cd1-6fb11c96a719@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-arm] [Qemu-devel] [qemu-s390x] [RFC PATCH 1/3]
 hw/Kconfig: PCI bus implies PCI_DEVICES
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
 Palmer Dabbelt <palmer@sifive.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Helge Deller <deller@gmx.de>,
 Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>,
 "open list:S390" <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dBy126H1T94S

On 17/07/19 14:59, Collin Walling wrote:
> On 7/16/19 11:04 AM, Thomas Huth wrote:
>> On 16/07/2019 15.06, Markus Armbruster wrote:
>>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>>
>>>> On 15/07/19 18:12, Cornelia Huck wrote:
>>>>>> Is it INTx vs. MSI vs. MSI-X?
>>>>>
>>>>> I think for s390x we need (INTx || MSI) vs MSI-X...
>>>>
>>>> I think MSI vs MSI-X is just how it's configured, not the actual
>>>> behavior, so it should be irrelevant.
>>>
>>> My best guesses from confusing information, please correct
>>> misunderstandings:
>>>
>>> 1. PCI devices need to support MSI or MSI-X to work with s390x.
>>
>> I think Cornelia mentioned that we might even require MSI-X there ...
>> Collin (being listed as "S390 PCI" maintainer), can you confirm?
> 
> MSI-X is mandatory for PCI devices in the s390 architecture.

How are MSI and MSI-X distinguished?

Paolo
