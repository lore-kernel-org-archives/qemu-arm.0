Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp105155njb;
        Tue, 4 Feb 2025 01:58:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUKhYVZQdfMf3z1rL1EcBlKpqMIU7D77hGaP4CgZD3P3hA3E+kA4Y4JmY1zFg2LOAVtu+zTJnz7R9If/Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEYm+zLGW9sKg4MopXw94wonuPzHwmK4hVEzsr/UkFxZ4E0hKAe8KA2eT+dG95hbAJLe4sV
X-Received: by 2002:a05:600c:3b0e:b0:434:fbda:1f36 with SMTP id 5b1f17b1804b1-438dc40cab1mr200604135e9.20.1738663122426;
        Tue, 04 Feb 2025 01:58:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738663122; cv=none;
        d=google.com; s=arc-20240605;
        b=bgFBajUzz2h4x0Q5JEPiT5qQJukjma1Jtjg7dVIW5UTA6GrI1TyN3WGvkIl31yQHrf
         tq9AEsoHzeN0JCjSAkJ8Eygpju3MrW86xjz/WHgxnqL33AstFT+FtWV7RLZ1/E5vSmxI
         7xabH1wRRQhnI1Thwdh1YRP2rZAWeUvYW2HVfscMt3PXSg8RRVI0rxyjbYGoyvhpMg1a
         6DQAwTPmhcTDPEd/bjuoDO/iaXklKsAZRp+A7l/Ful1ZJ+Xx1pcnFE1hztX6kGdp8a12
         mxrol8o8QeSFgPuTIphGS2K7zplVg5x889SN+tQjmehMGnbFtiRFoezkYnnb6hnqjhjP
         ObRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date;
        bh=lTePR5umiTgLiqhcUi8BFmWFgDC0js/kpvSSOPYew+s=;
        fh=EP158TUx0vA27RdGBygosBn6dysmMrs116aAZsmuFuc=;
        b=WDx3wumz2Nwg+0xlZNrQBUpI+LYLTkxkFcTgdJIfge2n0yYoGM8cSJYSgcM3OYM9Xl
         foilF37bKNokiRSyKiomIOi8OTOtTjurt+LADDobqzlJVzjZzE5J6o1nImuGRDQ8mkAs
         qOxGYtmYmjb3iAe92XjRSoBxzWN21CIJD+LLtZl/MbxaYb/kLQv9V12m7pHkOaMFK1dh
         w5phUI2BWywMELhMEHF6nPaxOL6VgVMo7DFdythf8RC0oTNS9OypYiULwqJCz9hvphTH
         BFoMt+6lOT6ByLQgzXKAlDy/a85AGaiy+zVGpaYJn0QU3xfB1zoFc7u8AAApOysyTGVP
         jiJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of balaton@eik.bme.hu designates 152.66.115.2 as permitted sender) smtp.mailfrom=balaton@eik.bme.hu;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <balaton@eik.bme.hu>
Received: from zero.eik.bme.hu (zero.eik.bme.hu. [152.66.115.2])
        by mx.google.com with ESMTPS id ffacd0b85a97d-38c5c20ddb9si7503587f8f.849.2025.02.04.01.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 01:58:42 -0800 (PST)
Received-SPF: pass (google.com: domain of balaton@eik.bme.hu designates 152.66.115.2 as permitted sender) client-ip=152.66.115.2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of balaton@eik.bme.hu designates 152.66.115.2 as permitted sender) smtp.mailfrom=balaton@eik.bme.hu;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id D33B44E601A;
	Tue, 04 Feb 2025 10:58:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id fUcay_nW9171; Tue,  4 Feb 2025 10:58:39 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id EB5774E6013; Tue, 04 Feb 2025 10:58:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id E905674577C;
	Tue, 04 Feb 2025 10:58:39 +0100 (CET)
Date: Tue, 4 Feb 2025 10:58:39 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, 
    =?ISO-8859-15?Q?Daniel_P_=2E_Berrang=E9?= <berrange@redhat.com>, 
    Laurent Vivier <lvivier@redhat.com>, 
    Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>, 
    Jared Mauch <jared+home@puck.nether.net>, Fabiano Rosas <farosas@suse.de>, 
    Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
    =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, 
    devel@lists.libvirt.org
Subject: Re: [PATCH v2 11/12] hw/arm/raspi: Deprecate old raspiX machine
 names
In-Reply-To: <e32a54f2-ef46-4964-89d4-a8969b6d1b05@linaro.org>
Message-ID: <1ec3cd49-7fe8-9c80-212d-68939580b8ce@eik.bme.hu>
References: <20250204002240.97830-1-philmd@linaro.org> <20250204002240.97830-12-philmd@linaro.org> <CAFEAcA-3JJ1tZAXsik5hAonuSO9sCqDF1xqPQVhAeN-XwAAhDw@mail.gmail.com> <e32a54f2-ef46-4964-89d4-a8969b6d1b05@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-1784103270-1738663119=:54447"
X-TUID: 5EvK8ZyHTi4E

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1784103270-1738663119=:54447
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 4 Feb 2025, Philippe Mathieu-Daudé wrote:
> On 4/2/25 10:22, Peter Maydell wrote:
>> On Tue, 4 Feb 2025 at 00:23, Philippe Mathieu-Daudé <philmd@linaro.org> 
>> wrote:
>>> 
>>> All previous raspi machines can be created using the
>>> generic machine. Deprecate the old names to maintain
>>> a single one. Update the tests.
>>> 
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> 
>>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>>> index 4a3c302962a..c9a11a52f78 100644
>>> --- a/docs/about/deprecated.rst
>>> +++ b/docs/about/deprecated.rst
>>> @@ -257,6 +257,19 @@ Big-Endian variants of MicroBlaze ``petalogix-ml605`` 
>>> and ``xlnx-zynqmp-pmu`` ma
>>>   Both ``petalogix-ml605`` and ``xlnx-zynqmp-pmu`` were added for little 
>>> endian
>>>   CPUs. Big endian support is not tested.
>>> 
>>> +ARM ``raspi0``, ``raspi1ap``, ``raspi2b``, ``raspi3ap``, ``raspi3b`` and 
>>> ``raspi4b`` machines (since 10.0)
>>> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>>> +
>>> +The Raspberry Pi machines have been unified under the generic ``raspi`` 
>>> machine,
>>> +which takes the model as argument.
>>> +
>>> +    - `raspi0`` is now an alias for ``raspi,model=Zero``
>>> +    - `raspi1ap`` is now an alias for ``raspi,model=1A+``
>>> +    - `raspi2b`` is now an alias for ``raspi,model=2B``
>>> +    - `raspi3ap`` is now an alias for ``raspi,model=3A+``
>>> +    - `raspi3b`` is now an alias for ``raspi,model=3B``
>>> +    - `raspi4b`` is now an alias for ``raspi,model=4B``
>> 
>> This is not how we typically handle "we have a bunch
>> of different devboards in one family". What's wrong with the
>> existing set of machine names?
>
> Zoltan and you don't want to add more machine names, then you
> don't want a generic machine. This is very confusing.

I said either rastpi4b,revision=1.4 or -machine raspi4b -memory 4g would 
be better IMHO. Peter perefers -memory which is also fine with me. I just 
don't think adding more machine names where only RAM size is different 
would be better than using -memory for that as usual.

Regards,
BALATON Zoltan

> See previous patch:
>
>  $ qemu-system-aarch64 -M raspi,model=help
>  Available models (processor):
>  - A          (BCM2835)
>  - B          (BCM2835)
>  - A+         (BCM2835)
>  - B+         (BCM2835)
>  - CM1        (BCM2835)
>  - Zero       (BCM2835)
>  - ZeroW      (BCM2835)
>  - 2B         (BCM2836)
>  - 3B         (BCM2837)
>  - CM3        (BCM2837)
>  - 3B+        (BCM2837)
>  - 3A+        (BCM2837)
>  - CM3+       (BCM2837)
>  - 4B         (BCM2838)
>
> Can we or not add the other raspi models?
>
>> Can we implement "support more than just the fixed amount
>> of RAM" by making '-m 2G' work, without changing the
>> machine names at all, please?
>
> We surely can if we find developers motivated to do the work.
>
> Regards,
>
> Phil.
>
>
--3866299591-1784103270-1738663119=:54447--
