Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp993500ejq;
        Wed, 17 May 2023 03:51:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Ui/eo53HssOJA0PbW/8YNBG7vCEf6M9qekFDC51haxTxbllbChOnWMQZU1G+YhJnCUc5l
X-Received: by 2002:aa7:d14d:0:b0:502:9a5b:206e with SMTP id r13-20020aa7d14d000000b005029a5b206emr1658172edo.9.1684320673671;
        Wed, 17 May 2023 03:51:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684320673; cv=none;
        d=google.com; s=arc-20160816;
        b=ao/XTcPSh1/Q8pteD6q8J1FnjOa8Zr2fFJls3Jel0qdyCQ8dhFRKVeqI/CtUv3yCDR
         5I9XMNhJlqrdqhsz/Fq7ZWuz4Ugb9+9F+9aeTLDZ2zFTdDf9MPAieLZzEKunZ/V0UNEU
         GqIqvnNGurtBRnvEcsYjaNtCpcsZkow6Gxh8zL5ijGI9AF/ZInNEaU+oOC3aqEEf0zct
         o8biIoH4Ld6e0RrI6aEyL6F5WDh3Z28Sh9abHGXpFsax3rM8uOU2svQ0eAIJaeP2BT38
         cvV+ghxKI2X7lVZQnheOzqMV/Dpolc8zMHghRbBXbGNHMvNpyONp/w4wTJV7CaCB9UwP
         6Sng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=G3OFtXxRc6EUtn8a7dG3Aj1fCYNAGD26Jo8vWwMNw8A=;
        b=oD2T3tTdgAZZynJ0MYE8x46fp/k03euzm68HA/XTxQX2y3nHrItdRUzGe3u0Xdn0Ox
         7/DFckD3uiSnE2mnQbivmI9b0mVUYTANQKNHXThJaqua5KsAI0WRzDOohOH0Be7aDy4J
         6nVOXN/S2MNtK2ljTVK03mZ34k59PWGtHYQDiBgkMQsalHmXehdJovGAFZq/INc/YAZW
         qCs8jK5b9v+PuLDc/WCc5NyIeYVDnxJaB9fZTKrAC71gtPOc/C1FNPXpYlGCQu9AI8/8
         oTIdygv8kweqVIVLKJfr+qZvfG7Yxw8+UGySsKK0GBKOWyPInmejPu1Jov+stdD2vXB4
         txZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="T/K0Vgf+";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id u1-20020a50eac1000000b0050bd35cd0cbsi16113602edp.591.2023.05.17.03.51.13
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 03:51:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="T/K0Vgf+";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684320672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3OFtXxRc6EUtn8a7dG3Aj1fCYNAGD26Jo8vWwMNw8A=;
	b=T/K0Vgf+abO4mnfqZ9oHeBUSeFqDSz3YGWRUdZEnXJI+9ME8+GRdObOpJqD7EcOxXKa1eB
	L+aY++5cznR8OGZ7Y9hQYrg3RXoFY9IzHjIrBqXg9nPLcFS8WjfGThEBdUYHz8Dk2qUpCC
	0Z9OKXy7V9+URKbum0iFRocleYxq4Y4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-735EsXnwO8GWDVeHmRsTAQ-1; Wed, 17 May 2023 06:51:09 -0400
X-MC-Unique: 735EsXnwO8GWDVeHmRsTAQ-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3093b0cf714so242131f8f.2
        for <alex.bennee@linaro.org>; Wed, 17 May 2023 03:51:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684320668; x=1686912668;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G3OFtXxRc6EUtn8a7dG3Aj1fCYNAGD26Jo8vWwMNw8A=;
        b=CH+tLPm2O2cfX3IlqBC1PhdvEXcXfBs65ueT8Nvk8QHAqQpMDabCsHc3YTyjjnHxpH
         hf52jdrcoKtmYOlmN2FB6iBZZCQx/x8aExqY8zMhFJ7ES4hfWJTisUHQV7qmk1FnL+5D
         MxhRNFL199ZGefXafTrF94KTOVfBSOSzqbK0y/JD5BSUy0UsMTMdXO0ITOh3aYK4QS8F
         Jf5jXww0l5NEzyg1Vh35KFwcMcY+bhW0KJ2r5psgp3/vjVfTEDnXLbdW5/1uGQ8aDIn+
         FOZl6LE+12TYMYZDpcOJDbXXarBXyZy2JfOOO79c878V5Hkozqeq2Ne/+feIUT2Exphz
         RQDA==
X-Gm-Message-State: AC+VfDzgNzjzbc+fttO2Q0pjBP4eS+ViMm/itaGlFPnOwXMFB0qKjzz7
	Q8R9I03x3HkV/8ABa/S8oQJfbGC57fPEpV0Aq8vOICYeOvXQwNEgcw4iSjTEKv7LldOX8grD4yk
	FFkdCP22oYTXOByPV
X-Received: by 2002:a5d:4389:0:b0:306:2b40:1258 with SMTP id i9-20020a5d4389000000b003062b401258mr308920wrq.21.1684320668273;
        Wed, 17 May 2023 03:51:08 -0700 (PDT)
X-Received: by 2002:a5d:4389:0:b0:306:2b40:1258 with SMTP id i9-20020a5d4389000000b003062b401258mr308900wrq.21.1684320667897;
        Wed, 17 May 2023 03:51:07 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.3] (ip-109-43-177-218.web.vodafone.de. [109.43.177.218])
        by smtp.gmail.com with ESMTPSA id g6-20020adfe406000000b003093946ea60sm2344564wrm.46.2023.05.17.03.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 03:51:06 -0700 (PDT)
Message-ID: <496ffe3f-f56e-ab64-37b6-3379b9372669@redhat.com>
Date: Wed, 17 May 2023 12:51:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH-for-8.0 1/3] hw/ppc: Replace tswap32() by const_le32()
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Alistair Francis <alistair@alistair23.me>,
 David Gibson <david@gibson.dropbear.id.au>, Jason Wang
 <jasowang@redhat.com>, Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-2-philmd@linaro.org>
 <8d47b826-2011-3203-c682-aa32a76b8dc2@linaro.org>
 <d73fe725-565e-7fcb-e7d3-846189459545@linaro.org>
 <a1f4b5a6-0a8a-5a04-8ab6-f3f08b9d36aa@linaro.org>
 <CAFEAcA_F3Z+UPW-wHs8xedYX3TiV8CRQAom0DhefKLFH_Ejgog@mail.gmail.com>
 <b46e4c40-257f-8a89-85b8-8c2806f395be@linaro.org>
 <10186d7a-2df0-2fcf-8eef-8e34bcc2d8cc@kaod.org>
 <CAFEAcA8WF6GXaPt6+=KbaLSP5w+r1dps6fcc21+Um3VFAPDp5A@mail.gmail.com>
 <b270f7de-a0f1-3b1e-5540-550420acef26@kaod.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <b270f7de-a0f1-3b1e-5540-550420acef26@kaod.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: MYsUl8baG0r6

On 13/12/2022 19.13, Cédric Le Goater wrote:
> On 12/13/22 18:23, Peter Maydell wrote:
>> On Tue, 13 Dec 2022 at 16:53, Cédric Le Goater <clg@kaod.org> wrote:
>>>
>>> On 12/13/22 17:27, Richard Henderson wrote:
>>>> On 12/13/22 10:21, Peter Maydell wrote:
>>>>> It does seem odd, though. We have a value in host endianness
>>>>> (the EPAPR_MAGIC constant, which is host-endian by virtue of
>>>>> being a C constant). But we're storing it to env->gpr[], which
>>>>> is to say the CPUPPCState general purpose register array. Isn't
>>>>> that array *also* kept in host endianness order?
>>>>
>>>> Yes indeed.
>>>>
>>>>> If so, then the right thing here is "don't swap at all",
>>>>
>>>> So it would seem...
>>>>
>>>>> i.e. just "env->gpr[6] = EPAPR_MAGIC;". But that would imply
>>>>> that the current code is setting the wrong value for the GPR
>>>>> on little-endian hosts, which seems a bit unlikely...
>>>>
>>>> ... unless this board has only been tested on matching hosts.
>>>
>>> But these are register default values. Endianness doesn't apply
>>> there. Doesn't it ?
>>
>> Any time you have a value that's more than 1 byte wide,
>> endianness applies in some sense :-) We choose for our
>> emulated CPUs typically to keep register values in struct
>> fields and variables in the C code in host endianness. This
>> is the "obvious" choice given that you want to be able to
>> do things like do a simple host add to emulate a guest CPU
>> add, but in theory you could store the values the other
>> way around if you wanted (then "store register into RAM"
>> would be trivial, and "add 1 to register" would require
>> extra effort; currently it's the other way round.)
>>
>> Anyway, I think that in the virtex_ml507 and sam460ex code
>> the use of tswap32() should be removed. In hw/ppc/e500.c
>> we get this right:
>>      env->gpr[6] = EPAPR_MAGIC;
>>
>> We have a Linux kernel boot test in the avocado tests for
>> virtex_ml507 -- we really do set up this magic value wrongly
>> afaict, but it seems like the kernel doesn't check it (the
>> test passes regardless of whether we swap the value or not).
>>
>> I think what has happened here is that this bit of code is
>> setting up CPU registers for an EPAPR style boot, but the
>> test kernel at least doesn't expect that. It boots via the
>> code in arch/powerpc/kernel/head_44x.S. That file claims
>> in a comment that it expects
>>   *   r3 - Board info structure pointer (DRAM, frequency, MAC address, etc.)
>>   *   r4 - Starting address of the init RAM disk
>>   *   r5 - Ending address of the init RAM disk
>>   *   r6 - Start of kernel command line string (e.g. "mem=128")
>>   *   r7 - End of kernel command line string
>>
>> but actually it only cares that r3 == device-tree-blob.
>>
>> Documentation/powerpc/booting.rst says the expectation
>> (for a non-OpenFirmware boot) is:
>>                  r3 : physical pointer to the device-tree block
>>                  (defined in chapter II) in RAM
>>
>>                  r4 : physical pointer to the kernel itself. This is
>>                  used by the assembly code to properly disable the MMU
>>                  in case you are entering the kernel with MMU enabled
>>                  and a non-1:1 mapping.
>>
>>                  r5 : NULL (as to differentiate with method a)
>>
>> which isn't the same as what the kernel code actually cares about
>> or what the kernel's comment says it cares about...
>>
>> So my guess about what's happening here is that the intention
>> was that these boards should be able to boot both kernels built
>> to be entered directly in the way booting.rst says, and also
>> kernels and other guest programs built to assume boot by
>> EPAPR firmware, but this bug means that we're only currently
>> supporting the first of these two categories. The reason nobody's
>> noticed before is presumably that in practice nobody's trying to
>> boot the "built to boot from EPAPR firmware" type binary on
>> these two boards.
>>
>> TLDR: we should drop the "tswap32()" entirely from both files.
> Yes. I think so too.

I agree. Philippe, could you please respin this patch 1 here accordingly?

  Thomas
