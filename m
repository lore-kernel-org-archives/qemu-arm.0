Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp621915lfq;
        Tue, 8 Sep 2020 06:47:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxM74QrvfIBBX4AXyaunGduvz4lXG179Dhz2oV3CeAPCzUUSEMjllxFKu9FHeDox+GTQPBz
X-Received: by 2002:a25:dfc4:: with SMTP id w187mr33391448ybg.506.1599572865716;
        Tue, 08 Sep 2020 06:47:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599572865; cv=none;
        d=google.com; s=arc-20160816;
        b=aXqVQUQdvmIJyBPDtWJDMCc59QPUBxZmAtnO7pufiDa2Au0mmjBQTR3sGSjAqQzoGk
         MBwg3k2E6YFAakFN2OKqET2XwrX9xdBBG4wxFhbw5ato/ajieeGb503guC9D5okBz2x4
         2dswK0+gmSUaOGMQFFjDYGvzHTzF+DTSsQQRT3jHa34IGhYsIa22OBx9bTCBTTUYqo9t
         g9G6ke83Szpdv8IkQ+bFEFpXNtCn4Fk9pCf8UTDBVvWwn5LROVf3p3lsB2In/0sFs8l1
         AsmLR2sxP2Aa3N2JjAcLxRyjXMlI8h9oFcyUYT2CFbWF83+tw14fNcU/JQtVTAB5mxhh
         aCsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=h9D63/GnAdET+Pfu3KRV+q0nr7oZ3TMVfwl2QOqMB1g=;
        b=OhV++b16X8ED9utWlZc2Kt1FSEjUWe12S0+fGS+m+5mkldWhlVsT2/WjUuIwoPwbih
         wcDfJXftQRpfMp3L/GkdQChxl3kkg7fGJqGhIWjNtaFFm6Fv2YbnQkrUoUXY9FYQo1wb
         ACNCYRmKoq6bEFOqaLIvxz8cHK26I52pED5x5Om9mVAB96GNjy7DltUemdvL10xl8WU1
         y4J29SwvgeQTrjbEP2JcXlzmyDW20igsgvoQ2pUNasfMnFFyG9CoxHiVtMQF9C/eNXn/
         YszLiWjnJZqbUYjqUYlfI7gnQYQneKq4ylb+Dz84Ajkccl7IAxRsDJ96gftwgUWN05YO
         HfrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P6I9qhzT;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id v200si18646476ybv.181.2020.09.08.06.47.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2020 06:47:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P6I9qhzT;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599572865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=h9D63/GnAdET+Pfu3KRV+q0nr7oZ3TMVfwl2QOqMB1g=;
	b=P6I9qhzT0CcRXFgSKZEkUJMfkdvyejGMowuR8lkgiAxFUd2+YxPCTngyOFXe+mTnu3kPvP
	X1V4leLOtLT+S3t/INNxd0K/X8B49yypW7UTG69ehx1qhF+GGcg2Du1nMJOUXouaOQ2EgQ
	qp6zmeytYZR67/Q6qtTtfg/E2YP7VDE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-ILZn8WPrOfuEzEzOYh59Kg-1; Tue, 08 Sep 2020 09:47:40 -0400
X-MC-Unique: ILZn8WPrOfuEzEzOYh59Kg-1
Received: by mail-wm1-f71.google.com with SMTP id a7so4772333wmc.2
        for <alex.bennee@linaro.org>; Tue, 08 Sep 2020 06:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=h9D63/GnAdET+Pfu3KRV+q0nr7oZ3TMVfwl2QOqMB1g=;
        b=DjhbwfPYcdR7sopnd20Kg5YL8DpTzIrtRbBXn91VgtNsApoH9C1W/vwuxfUjtg5Ls1
         txN9/O1u84F1NuQCXumetlJiRv9SJNZaXwJsMc+ojY0Pky5/rtmFYDC3WyodR6wisu7p
         Wzzm7ZrmAxYC8e4CV0XEYEslEFTA7KQGGYIjprISkWd3dO219hJh72H1jjv+/4kDp4Az
         7Y8RBC7ikIy9uneWJZ+AO9s3K3j0OUa9tqJ6/OnHI8rXLdeemZPYJfprmxvVFyUqFXLU
         CADjq+Gkb6xji9Mcw0AoG6PQdP3x6WRSqSJyyuzQJlEIPY4L4D2m9hxm00BVXpLzcqt2
         4zTg==
X-Gm-Message-State: AOAM530z0vmyfKdAQeLzgTXSjP04qr2O1godGzoxmntsAEAQBSNdZCq7
	OPPVophgQLEBMNeZN13gkvYIDUj5b2LP4bmtcxiX2eBmrIMYbWiI+35HnBOZju7349o4mHTFWuY
	cTesBOk4BjABwhFbQ
X-Received: by 2002:a1c:3284:: with SMTP id y126mr4550777wmy.146.1599572859516;
        Tue, 08 Sep 2020 06:47:39 -0700 (PDT)
X-Received: by 2002:a1c:3284:: with SMTP id y126mr4550745wmy.146.1599572859211;
        Tue, 08 Sep 2020 06:47:39 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.65])
        by smtp.gmail.com with ESMTPSA id s5sm34461454wrm.33.2020.09.08.06.47.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 06:47:38 -0700 (PDT)
Subject: Re: [PATCH 1/4] Acceptance tests: use an available kernel image
 package for arm
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Fabien Chouteau
 <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Beraldo Leal <bleal@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20200907042000.415931-1-crosa@redhat.com>
 <20200907042000.415931-2-crosa@redhat.com>
 <001385a1-92eb-d311-88b5-8e1e7f6f1f48@redhat.com>
 <20200907093930.GD810755@redhat.com>
 <34814b29-a47a-efd3-971b-520bc5ac6309@redhat.com> <87r1rcpfpy.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <abf41633-adce-9cb3-dc49-5a0ca5c72fea@redhat.com>
Date: Tue, 8 Sep 2020 15:47:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87r1rcpfpy.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TUID: usRfAhxPh12H

On 9/8/20 3:20 PM, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> On 9/7/20 11:39 AM, Daniel P. Berrangé wrote:
>>> On Mon, Sep 07, 2020 at 10:06:13AM +0200, Philippe Mathieu-Daudé wrote:
>>>> [Cc'ing Daniel who usually have good ideas for that
>>>> kind if project-wide problem]
>>>>
>>>> On 9/7/20 6:19 AM, Cleber Rosa wrote:
>>>>> Which means a newer kernel version.  Expected output was changed
>>>>> to match the new kernel too.
>>>>
>>>> Nack.
>>>>
>>>> Acceptance tests are not to test the latest Linux kernel,
>>>> they aim to assert a specific kernel tested by some developer
>>>> still works while QEMU evolves.
>>>> QEMU doesn't have to adapt to the latest kernel;
>>>> QEMU should keep boot an old kernel.
>>>>
>>>> Testing new kernels is good, you are adding coverage. But
>>>> this break the acceptance testing contract "keep testing
>>>> the same thing over time".
>>>>
>>>> The problem you are trying to fix is the "where to keep
>>>> assets from public locations where they are being removed?"
>>>> one. Two years ago [*] you suggested to use some storage on
>>>> the avocado-project.org:
>>>>
>>>>   For Avocado-VT, there are the JeOS images[1], which we
>>>>   keep on a test "assets" directory.  We have a lot of
>>>>   storage/bandwidth availability, so it can be used for
>>>>   other assets proven to be necessary for tests.
>>>>
>>>>   As long as distribution rights and licensing are not
>>>>   issues, we can definitely use the same server for kernels,
>>>>   u-boot images and what not.
>>>>
>>>>   [1] - https://avocado-project.org/data/assets/
>>>
>>> If I look at stuff under that directory I see a bunch of "Jeos" qcow2
>>> images, and zero information about the corresponding source for the
>>> images, nor any information about the licenses of software included.
>>> IOW what is stored their right now does not appear to comply with the
>>> GPL licensing requirements for providing full and corresponding source.
>>>
>>>> It is time to have QEMU assets managed the same way.
>>>
>>> I'd rather we didn't do anything relying on binary blobs with no
>>> info about how they were built. Pointing to the 3rd party download
>>> URLs was the easy way to ensure we don't have to worry about licensing
>>> problems.
>>
>> I tried to be very strict including the recipe about how to rebuild
>> and description of the source (for licensing) in each commits (Alex
>> Bennée once said Debian/Fedora based was OK):
> 
> Debian and Fedora both have good project hygiene for tracking sources
> for their binary packages and extensive archives which we can work with.
> These other projects seem to be more of a moving feast which I think is
> proving we can't rely on them as a CI test and at best best efforts for
> developer testing.
> 
> It seems Armbian do document their build process but it's not quite as
> easy as just downloading the source deb.

Should we remove the Armbian based tests? I don't have any problem,
as long as the requisites for adding a test are clearly documented
(as there are not obvious to all).

> <snip>
>>
>>>
>>> IIUC, the majority of our acceptance tests needs should be satisfied
>>> with a combination of a Linux kernel and busybox tools. We already
>>> use cross-compilers to build TCG test cases.
>>>
>>> I'd like to see us provide a minimal "config" file for each Linux
>>> kernel combo we need to test. We should be able to define a fairly
>>> simple script that do the Linux build, busybox build and then puts
>>> the combination of them into a disk image.  Something 100% automated
>>> and reviewable.
>>
>> For Debian/Fedora this config is available in their package (or source
>> package).
>>
>>>
>>> Even a minimal linux build takes some time, so we would need to cache
>>> the binary result in some suitable manner. At least this way we have
>>> a clear record of what we're building & how and can thus satisfy the
>>> license rules.
>>
>> Yes, but if the Debian/Fedora build farms already build/published
>> their packages, it is easier to use it directly.
>>
>> QEMU developers are very reluctant to add tests. I suppose we prefer
>> to develop or fix bugs rather than write tests. If we ask full build
>> recipe for each tests, I doubt we'll have much testing.
> 
> I've pondered this before and while it might have a place for random
> weird machines with no mainline distro support it's not a path I'm keen
> to go down. This goes especially for some of the more esoteric ARM
> hardware where you start relying on hacked up vendor trees with very
> specific toolchain requirements.

What I'd really like is to have the test logic in mainstream (not
the test artifacts). That way maintainers can "pass" their tests
when passing maintenance, or if one stop contributing, the tests
are still usable by anyone in the community.

Some closed-source binaries are available publicly, and we can
verify their hash.
Is it acceptable to add test + hash in mainstream, so any developer
in possession of such binaries is free to run the tests? There
should not be any licensing issue.

I would like to avoid "black box" devices we are afraid to modify
because very few people can test them.

Example of tests I'd like to add:
https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg41162.html

Thanks,

Phil.
