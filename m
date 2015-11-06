Received: by 10.182.105.169 with SMTP id gn9csp1072423obb;
        Fri, 6 Nov 2015 05:42:14 -0800 (PST)
X-Received: by 10.31.162.148 with SMTP id l142mr13273464vke.40.1446817334539;
        Fri, 06 Nov 2015 05:42:14 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x229.google.com (mail-vk0-x229.google.com. [2607:f8b0:400c:c05::229])
        by mx.google.com with ESMTPS id g37si177263vki.103.2015.11.06.05.42.14
        for <alex.bennee@linaro.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2015 05:42:14 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::229 as permitted sender) client-ip=2607:f8b0:400c:c05::229;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::229 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro_org.20150623.gappssmtp.com
Received: by vkbk63 with SMTP id k63so2373171vkb.0
        for <alex.bennee@linaro.org>; Fri, 06 Nov 2015 05:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro_org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=I0JnZI8M3p6TqVpnw3zJ59T1zK5h92jAZf/fkPQxfSU=;
        b=qZa6208kpfcHLYF340m6yfmjc+yiwekcnCYe+PTbf3+f7nMiBz7tXSGSG8GZUXEmqz
         +A6TjbsTTUOv4L9Db4dV5CGTcDS2SRcCeRZWTbwnr1A3t1k/5UI++svN2Gs3dB1MvVbk
         NbtLaP5+OszOTY25qWXrePYvALSTnuAmTLYkj4KWYEqQeyvywKRgWFmnkKNBFTYa09il
         sqIGSwldgKPTeuSRlK7YpAzYQBa/V3LO70H8hQGymgYzCud+sxif9hhbMfpWGhVaQfQR
         c8q610HIery7m+xnM/C+wZv9X5udtA4exB02OOqmJzS1iRJ9g0hyLLDaEhbGs/8AQfTd
         9cew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=I0JnZI8M3p6TqVpnw3zJ59T1zK5h92jAZf/fkPQxfSU=;
        b=mM56HjKRdrl3ZUMyPs7Tv7PcrbOZPijfGd2SzFnaD6UYXKf1e7eQH8BMmm/DASnUBg
         NSMWz+YI4OtO45GKQcPFtBAMoxizg6NAkPkLrWmeP0XDyg/sjlR6xlEccqgyF6mnF1KP
         prK2rr//qKtd29Tyfc3PoJL/E4f6h/xq1Pbthj+ssYynjgla2ENPb4J10qFHjg7VvSrM
         AcdaOc/gHP+9yMbV0ZCnpRxicz1QnKuRxJoFlTMU44aKwMmeb909SlWo2j4/SKLMDH+f
         iRipPvymwBDdDtk5hq5N/DBKln+709V3kVvKXoSV5quCWMSRXUIQZSVkImekG1OesNfa
         sbcQ==
X-Gm-Message-State: ALoCoQkNDpB7i4SQlOBOHy7Tn5PXanD8YGWYcWHQpL67eAV8bMEdmQZWVmA1cvIXJOSIBdBycbNx
X-Received: by 10.31.161.146 with SMTP id k140mr13338887vke.90.1446817334343;
 Fri, 06 Nov 2015 05:42:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 6 Nov 2015 05:41:54 -0800 (PST)
In-Reply-To: <20151106132759.GC13308@toto>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-4-git-send-email-peter.maydell@linaro.org> <20151106132759.GC13308@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Nov 2015 13:41:54 +0000
Message-ID: <CAFEAcA_SXyN1CxJd7CA-hkGXGoVkiPP3_wKo31KNZekjvNt0kw@mail.gmail.com>
Subject: Re: [PATCH 03/16] tlb_set_page_with_attrs: Take argument specifying
 AddressSpace to use
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Patch Tracking <patches@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	qemu-arm@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-TUID: vVocyI1qKbW9

On 6 November 2015 at 13:27, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> On Thu, Nov 05, 2015 at 06:15:45PM +0000, Peter Maydell wrote:
>> Add an argument to tlb_set_page_with_attrs which allows the target CPU code
>> to tell the core code which AddressSpace to use.
>>
>> The AddressSpace is specified by the index into the array of ASes which
>> were registered with cpu_address_space_init().

>> --- a/exec.c
>> +++ b/exec.c
>> @@ -445,12 +445,13 @@ MemoryRegion *address_space_translate(AddressSpace *as, hwaddr addr,
>>
>>  /* Called from RCU critical section */
>>  MemoryRegionSection *
>> -address_space_translate_for_iotlb(CPUState *cpu, hwaddr addr,
>> +address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
>>                                    hwaddr *xlat, hwaddr *plen)
>
> Does it make sense to replace the CPUState argument with an AddressSpace *
> and have the callers do the cpu->cpu_ases[asidx]?
> It would be more consistent and eventually maybe eliminate the need for
> address_space_translate_for_iotlb in favor of calling address_space_translate
> directly?

We can't accept an arbitrary AddressSpace, it has to be one which is
embedded in a CPUAddressSpace and which we can thus find the
memory_dispatch for. So you could pass a CPUAddressSpace*, but not
an AddressSpace*. But to pass a CPUAddressSpace we would have to
expose the currently-private-to-exec.c layout of the CPUAddressSpace
struct. I chose not to do that (and you can see the results elsewhere
in the patch series, like the function that's basically just "do
the cs_ases array lookup for me"); there's an argument for making
the structure more widely available to avoid some of that.

thanks
-- PMM
