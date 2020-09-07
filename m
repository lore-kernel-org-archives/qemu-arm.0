Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp3636828lfc;
        Mon, 7 Sep 2020 03:37:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyogNUIPrzKMzIe46GCxlqM3hvkLjKeRx4v6q+A0dHDs9TkV1fRQ8MQ/h0pPHfrVZIpuEq+
X-Received: by 2002:a25:3fc7:: with SMTP id m190mr20704784yba.450.1599475054880;
        Mon, 07 Sep 2020 03:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599475054; cv=none;
        d=google.com; s=arc-20160816;
        b=ihXNx0+eG7QMNx9pew7b+zzDYZWy17NMVNThHrpg9SwJG+dEV0Npl3J0h2IX37PZyY
         oU1ySTbizFop/T515FcQbKDWZoDJyouJo0Bmtb9F4yIcRyocsNqu6VuPDBXs8U1+MxeS
         4C/gHmc748vjYQvKsrzyA3AaVfPZyTDtVbip+KKeDPobuhrXLDbZXSB0XVvfbWhNppmN
         RGS0nFc0C2Ecmgbx2Gucuqzu+MF8zsPLH3QncBMtZZu1ep3Het7X0qvcEvHzdnBU4PD5
         Gp8Ilfj8wcdg1dHEWWsKLZKvTsShzxUGWHPfLZWyljYf7jIYug6vc9sDCUYeSCCr9z/B
         h+UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=cnINg1J2bCej3r7Z8gr9dtDdjjmqX6IoTmfKECstSoQ=;
        b=JcW5vKSmRhZp6AYhopGzCw22rfMWzUi0nOOigaJLDxkv794T/npt6DfcipYjxSHgiQ
         J9Q5ban4o4SVQbw/iVoc4lIWWhbwA+BFhlWZuzvLLJUtuRw5fmEe53eN6WU1IVinUL/k
         Nz88WcSbZzFrVUadvuavbbn84/1/8NG3h5EDwZsrAX/5xtQjTnbKj9qw4p/hecOTZtKt
         xLUoenSWfP3tEZm4mNHikfxyTfIXSEAiZyPCKcDxdfeGVycFsFoEMoCCh/4wES+D6zPk
         wzX1sTuws88WhBO2KdfwneFZsjlFcMcjPzuikhKa68mpyoDss/csZ8HVx1OHa1HDn4X3
         FgwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="dnNYmeh/";
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id k22si10669598ybk.444.2020.09.07.03.37.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Sep 2020 03:37:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="dnNYmeh/";
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599475054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cnINg1J2bCej3r7Z8gr9dtDdjjmqX6IoTmfKECstSoQ=;
	b=dnNYmeh/xqjt6iymFkKVvWDC2/kIIOQKa4/LpWJlYlUvL+WTIobKsbWGSmkm3QAZrMJquF
	6W9/HZq2kHt4rcOIqBrwRAQjn2wFshKrYnLg/2oeGj23Drh/0Q8c1hLDxlPHFDvLoE6Yvj
	yodfWdoxSdjNtLWCpqHgkW1iFBjFAmM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-zqMZqQb0OteejewR78umaQ-1; Mon, 07 Sep 2020 06:37:32 -0400
X-MC-Unique: zqMZqQb0OteejewR78umaQ-1
Received: by mail-wr1-f70.google.com with SMTP id f18so5559619wrv.19
        for <alex.bennee@linaro.org>; Mon, 07 Sep 2020 03:37:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=cnINg1J2bCej3r7Z8gr9dtDdjjmqX6IoTmfKECstSoQ=;
        b=gTKBdMfbNAZKmGjyBBch89cVTkBU1T/Tje2IWmyzrxMGlOz676Q8mimWWvBqhRtMaw
         In+XeJkeyXPzx6QzHLRT/Rw+51HRj6GsgU5Hw60RU0K3WKV1PyRIHkoaJryqvQGckASc
         tC4RvaLlfbmjcbPBKtl9x8q2AGwAuxhMoiaizTCABs7QNzI3wRHECKPYK30xzZoT75hP
         1bxMJnJKLCuRqiY3uLUk3owOPlNycvMChPHDF2rSpQ+sO6z0VBj/9Tx4Fkdl6Qz0/3Gg
         cJCieo3wIkaEBN185Dhv2fLKCjVjpBpUbb6dGhEBPyX2hcGQEkYDKF8Bk6BVjtfbJOqu
         +omw==
X-Gm-Message-State: AOAM5316LQ+uH98Y+TfT9pDGZgKShYwF+yzOeBQARNRNOaO/MgeyKyn+
	8WiZGca+/PMa6pGDGtRV+RbTsZ2nhB7zNPL+LCVaH2Zc8Ej8UeP5j8o06zYCj/wbmPQotIXU7Xz
	9yS8Yz5ExcR5PCk+F
X-Received: by 2002:a1c:9a8c:: with SMTP id c134mr19094152wme.136.1599475051559;
        Mon, 07 Sep 2020 03:37:31 -0700 (PDT)
X-Received: by 2002:a1c:9a8c:: with SMTP id c134mr19094128wme.136.1599475051271;
        Mon, 07 Sep 2020 03:37:31 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.65])
        by smtp.gmail.com with ESMTPSA id d2sm8197847wro.34.2020.09.07.03.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 03:37:30 -0700 (PDT)
Subject: Re: [PATCH 1/4] Acceptance tests: use an available kernel image
 package for arm
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
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
 <34814b29-a47a-efd3-971b-520bc5ac6309@redhat.com>
 <20200907102849.GE810755@redhat.com>
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
Message-ID: <8b99d285-3225-1fdd-3e49-56c9752698f0@redhat.com>
Date: Mon, 7 Sep 2020 12:37:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200907102849.GE810755@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TUID: uBPPhCQsKloK

On 9/7/20 12:28 PM, Daniel P. Berrangé wrote:
> On Mon, Sep 07, 2020 at 11:59:18AM +0200, Philippe Mathieu-Daudé wrote:
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
> ..snip...
> 
> Well that looks better than what is done for the JEOS images currently
> on avocado-project.org, as I can't tell what distro those came from
> at all.
> 
> If we're hosting images built by some 3rd party, and we intend to rely
> on the 3rd party to satisfy source availability, then we need to be sure
> that the 3rd party is themselves still distributing the same images.
> 
> IIUC, from Cleber's commit here the original images we're pointing to
> are now 404s. If the URLs moved, we just need to update to fix the URLs
> to point the new location. If the content was entirely removed though,
> we shouldn't mirror it ourselves, because we can't rely on the original
> vendor to be providing the source at that point.

Having backups and the SHA1 of the files already commited in our
repository, this is the outcome I prefer.
Let see what other think on this topic.

Thanks for your insights :)

> 
> Regards,
> Daniel
> 
