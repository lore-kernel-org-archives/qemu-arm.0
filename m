Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4009419wrv;
        Mon, 15 Jul 2019 04:04:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqydiwnuvImNm4uAAAnMltxTX5+jCdvzprswlfzyelsrgpWFY4QNNC8yXm//sMUJFnNPB6TI
X-Received: by 2002:a17:906:7f91:: with SMTP id f17mr19405617ejr.250.1563188677921;
        Mon, 15 Jul 2019 04:04:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563188677; cv=none;
        d=google.com; s=arc-20160816;
        b=NfIjYBytbHVeGQCWjYXU7GTf0weQF7jL1mioITOr7tKNH4p5CAf3CNGA5dXU/k7N/1
         79y2mXLEehJzzhyCy7QT9ghI18S2OwvUEHcfPdC7aC+GwBERVRX6iAD/gM2s4OWmHp4u
         GlnJbiRMUPfF6RtcWpPBrIY2GxdhpTSq/57pL1yr/iiLe/RkPYADnatX/uIni5x4OPH7
         B0eYNxEXmjtTOgQpc4/cbN8wLXZxZkaA0DHpuB1PB8lrbeFn63ZecpZ12OopieQ4k8Rj
         vB8GZvXhSi64/80L95kRA/GvC/q23MFRGp4cjkn1jc7Ti3rm9nPmYVl6e/GNdyOMbyBf
         hNcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=3h7FJeb5FfXjJncaNSFPcAq5CrVN6sKZxo1A34lkJ90=;
        b=yc2ePZliEDatzHsnXmcAHU0P/YyTTaq8U747npTlkQ56jx9uzyPpvtW+GZhwpSIXlJ
         S3yo599uGpvkES6YK2Gr+6/+uk/Wc2DwjSBwCRb1qZwVYS2A5U15ZJOgIH0wfSMwIEsd
         A3XKrJ645v9B5cEEGvWlSbNpG6ZTOSnWQ6XsOVxoaj3jAe/yXpHpWWeIBQOAzEF+PQnd
         6aGigz+YpcEOQENyeAxXPJ0GvM5WGmE4a+rZ6ELWsJxGrGYVEWrg8pR240vuvUSyztsz
         bHNZSaGPk0WPwRtA1YZfIVIfFGdu7l2Vh9mqLAH/30BTYzRB/ID2GEnukG/Bfrt+yvYu
         LRmw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dc19si9154726ejb.324.2019.07.15.04.04.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jul 2019 04:04:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hmyma-0004YO-KA
	for alex.bennee@linaro.org; Mon, 15 Jul 2019 07:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44933)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hmymW-0004Wa-IH
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 07:04:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hmymV-0003GT-GA
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 07:04:32 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34074)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hmymV-0003GB-AJ
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 07:04:31 -0400
Received: by mail-wm1-f67.google.com with SMTP id w9so14039949wmd.1
 for <qemu-arm@nongnu.org>; Mon, 15 Jul 2019 04:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3h7FJeb5FfXjJncaNSFPcAq5CrVN6sKZxo1A34lkJ90=;
 b=eWYjcHTIn5Z7DG42cSj6JqK4Bhwky/k3XDRtQsn42oCtciJ5MivnvRzksOIKJWe9a4
 sMQFxbgWbsMk8bsGuq+CyySDHD4vWt1BUqPVxepJdj8ER2hk3fUduMTgtznhelZybm//
 XrSUeiQnYtgqkO6Q5dsmJ/corh6ghTyNnjZ/UvU2B/dwDgl2Qnw3yHlHNHXHQ5BN9s2C
 r9CurqGArLKUNB8mVQj5lujuFzuiyIwzvkdZuyebgpVa63rhD1JX6WvXT8RNvorukAo5
 I6Rne9rlVjFlP7zDakIr/vO76Hp9Gnh5+axxbkwbHKPFABRNPMc/9CNrMSE1f+NtqNdE
 nl2w==
X-Gm-Message-State: APjAAAUfY3CWHi7Z6VxEMmKqwMg9isuIqgW9NTLNkQPPzrNoWeyQ6pHa
 Ju070QecHy34812vPqUCE2ectw==
X-Received: by 2002:a7b:c206:: with SMTP id x6mr24185721wmi.156.1563188670329; 
 Mon, 15 Jul 2019 04:04:30 -0700 (PDT)
Received: from [192.168.1.37] (62.red-83-42-61.dynamicip.rima-tde.net.
 [83.42.61.62])
 by smtp.gmail.com with ESMTPSA id p3sm15390645wmg.15.2019.07.15.04.04.28
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jul 2019 04:04:29 -0700 (PDT)
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20190715095545.28545-1-philmd@redhat.com>
 <20190715095545.28545-2-philmd@redhat.com>
 <ca528cdc-6118-0b2f-c1b8-30b06875dde8@redhat.com>
 <CAFEAcA-wgTVfj0TUJ=piP0wEgLGiNpOYia5DK2GQAO4Q7gNaWg@mail.gmail.com>
 <6d69e8ad-d720-ce04-20f2-a03193903078@redhat.com>
 <20190715125653.6e65d575.cohuck@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <c1c68faf-0424-6c7c-e39f-42159457c3ee@redhat.com>
Date: Mon, 15 Jul 2019 13:04:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190715125653.6e65d575.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
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
 qemu-ppc <qemu-ppc@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vw63txCsJdso

On 7/15/19 12:56 PM, Cornelia Huck wrote:
> On Mon, 15 Jul 2019 12:48:55 +0200
> Thomas Huth <thuth@redhat.com> wrote:
> 
>> On 15/07/2019 12.19, Peter Maydell wrote:
>>> On Mon, 15 Jul 2019 at 11:15, Thomas Huth <thuth@redhat.com> wrote:  
>>>>
>>>> On 15/07/2019 11.55, Philippe Mathieu-Daudé wrote:  
>>>>> If a controller device provides a PCI bus, we can plug any PCI
>>>>> daughter card on it.
>>>>>
>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>> ---  
>>>   
>>>>> diff --git a/hw/pci/Kconfig b/hw/pci/Kconfig
>>>>> index 77f8b005ff..0f7267db35 100644
>>>>> --- a/hw/pci/Kconfig
>>>>> +++ b/hw/pci/Kconfig
>>>>> @@ -1,5 +1,6 @@
>>>>>  config PCI
>>>>>      bool
>>>>> +    imply PCI_DEVICES  
>>>>
>>>> No, please don't change this. This was done on purpose, since almost all
>>>> PCI_DEVICES do not work on s390x (so s390x does *not* imply PCI_DEVICES).  
>>>
>>> But that means that every board that provides PCI has to have an
>>> "imply PCI_DEVICES" line, which is pretty clunky just to work
>>> around an s390x limitation.
>>>
>>> Is there some way in the Kconfig syntax for s390x to say
>>> "no PCI_DEVICES" so we can have the corner-case be handled
>>> by the s390x Kconfig in one place rather than in 20 places
>>> affecting everywhere except s390x?  
>>
>> IIRC the problem on s390x are the legacy IRQs. s390x has only MSIs. So I
>> guess the correct way to fix this would be to introduce some
>> PCI_LEGACY_IRQ switch and let all old devices that do not work with MSI
>> depend on it.
> 
> s/MSI/MSI-X/, IIRC. Not sure how far 'legacy' would stretch.

Maybe we can have something like PCI_LEGACY_DEVICES and PCI_MSI_DEVICES?

So if s390x only selects PCI_LEGACY (not PCI_MSI) bus, then it only get
legacy devices?

Other MSI compliant should select PCI_MSI instead. PCI alone seems to
give troubles.

> cc:ing Collin in case there's something else.
> 
