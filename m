Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2126949ejc;
        Tue, 14 Nov 2023 07:42:56 -0800 (PST)
X-Received: by 2002:ac2:41d3:0:b0:50a:71ec:a4ee with SMTP id d19-20020ac241d3000000b0050a71eca4eemr6172934lfi.8.1699976576671;
        Tue, 14 Nov 2023 07:42:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699976576; cv=none;
        d=google.com; s=arc-20160816;
        b=YvSv4oBmD35NIZ07NPRs4OslNTJm6nLNTR8DX4tVJT+vIn7tAs+XRsTLuDTBe93xK2
         g/P1oXg337Pe/1PSRLFBbGP0nvtD3jux6STBHgsTrEQzM1ikACY0jKBe7ZCMGKs5RpoP
         Sy+fYPwQxLfU6+sPQeqFzaDAMmV9CgPCWPXNZFN6eP6cUDQslcwZ58kD6KF9yJadNr3Z
         Uy5n3ht32EHjzaasV6CjYtP82c6fnd8iecwW+G5BfHGkUt2KeSdoZOitGD1ZunR1JKRp
         U+rtwyt1RdaAWwHlCMaMZWZvIH2WhipxXjRQuHlLxmpz5sOdWvI0w4bqOKiLx0ZteLkX
         UzVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=gCFoXhGCZFhwzHOt1ECCBxHdb8kGrjYPklFidAhJw58=;
        fh=UHvDv+zkP5t6T7JK4PPrDv1YBJtZN5X3weQkuBCbTMk=;
        b=gaTBJKdvSTbdSAgUFfAlWCJGj1Iwadg+a/+ypFkrHG+RAijs9lAXe5J5Y4wfKpnVON
         VhajRCebdUQF5zD+XfYkySDfuODEjakot6G6IMNmKeLGZC/k8LXOHs+oBecolOA48mpI
         jXT/8mfkoa0OUwYNUOJ/uRuxGUhALeWTs1NGkkmtUbEJELFLD8AsIk6vUPtBaepqfOnB
         JGMLcM0e2c9p2Q8rdWHmH9z/a6Y4BVNiURvTazWMAD4quzvQPoygMilCHMrBKStsMcke
         BAlJVfiyUDmbCNFHg/jpOEdVIP2gVBbmkqdkQUlIb/GnxCn6xS0CvednHqtaufMxHHsw
         l7EA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tgKT7IPE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u23-20020a170906109700b009e3b1971a2asor1996832eju.5.2023.11.14.07.42.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 07:42:56 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tgKT7IPE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699976576; x=1700581376; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gCFoXhGCZFhwzHOt1ECCBxHdb8kGrjYPklFidAhJw58=;
        b=tgKT7IPEDrHg1DMSIytVC/K9LVv1MASn+QYzLvWiLM14uPItiOmfOulz9jUvi9hIWF
         naLIMjHezIxbjaBl0LXCop4sYfFPHAtm6GJz9c+XfcYiSClOARfzz9DbZb/qKgom59MN
         XLTPpHlXMqRAbyfYQhy+MKGEc5Utocg4qDpCRQQ1phjXjhdHC57UjiyVBxEo1oNEyEgD
         Gyv91IFbP4z3AhtiDY6iySQbjUN6INw7g8E5XKhNQPJ7Zqux9oAr23qgotZqofx3KjtY
         /Bwt55TlN1F5GLEHZezoBweuSWXtNVe8JJOxzAgEoWCeh8duM6yzESytgvfUjl9yktiI
         85ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699976576; x=1700581376;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gCFoXhGCZFhwzHOt1ECCBxHdb8kGrjYPklFidAhJw58=;
        b=In6TvRZzvEUJTbqSjdb8JM2A/mQ2SZ1a5bEJ4H8jVHAEt1EyeB8MNOzKr/H5t9N2ei
         DEhQQVcIn3w16nA5De253Zg8nV4w5LUy+n0mTPU7IryHbqknV3DyL5iP9KokCCkDBC2Y
         lK46rZmnTzZtsy1TPGxgUXCNm+FajPDEmrsdEzbW/dhg827pLdBfYbWOb6uMemkROYcL
         ze4RlsWq8Pu51koDbmmRWAtz7XBVEKoirAspPEM8ABZtTG+4NDx6TuQkv0fV4bncXhry
         WFIcXsifw0lkLJ5BTQ+vmHYMlVjSzl170gC6NW0qWDC0XGFduT9YwZa3hU45XG/XGBih
         120g==
X-Gm-Message-State: AOJu0YxwHHBLIOjm1dM2YNQthGylfNq2A6YJI159Ha4YfZ1LNJmdPMgl
	6HrlQXSaU40Fr8LrX7rsyXkKsCIz
X-Google-Smtp-Source: AGHT+IHp79TSN3T1f0iR/8hTGuWsFNTOnvRmliGhAL1mNCFX7w4yOvOUPmAnOLIhILS3nzzmhv8aFA==
X-Received: by 2002:a17:906:1919:b0:9e4:121c:b9fd with SMTP id a25-20020a170906191900b009e4121cb9fdmr7690326eje.12.1699976576191;
        Tue, 14 Nov 2023 07:42:56 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id dx5-20020a170906a84500b0099bd1a78ef5sm5691278ejb.74.2023.11.14.07.42.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 07:42:55 -0800 (PST)
Message-ID: <e298292d-fc40-44ca-9de2-1b159519836b@linaro.org>
Date: Tue, 14 Nov 2023 16:42:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 v2 01/19] tests/avocado: Add 'guest:xen' tag to
 tests running Xen guest
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, David Woodhouse
 <dwmw@amazon.co.uk>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paul Durrant <paul@xen.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>, kvm@vger.kernel.org,
 Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-2-philmd@linaro.org>
 <94D9484A-917D-4970-98DE-35B84BEDA1DC@infradead.org>
 <407f32ee-e489-4c05-9c3d-fa6c29bb1d99@linaro.org>
 <074BCACF-C8D0-440A-A805-CDB0DB21C416@infradead.org>
 <04917b57-d778-41a2-b320-c8c0afbe9ffb@linaro.org>
 <37D11113-662D-49FD-B1F1-757217EAFEEA@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <37D11113-662D-49FD-B1F1-757217EAFEEA@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: MLigugPECYlq

On 14/11/23 16:19, David Woodhouse wrote:
> On 14 November 2023 10:13:14 GMT-05:00, "Philippe Mathieu-Daudé" <philmd@linaro.org> wrote:
>> On 14/11/23 16:08, David Woodhouse wrote:
>>> On 14 November 2023 10:00:09 GMT-05:00, "Philippe Mathieu-Daudé" <philmd@linaro.org> wrote:
>>>> On 14/11/23 15:50, David Woodhouse wrote:
>>>>> On 14 November 2023 09:37:57 GMT-05:00, "Philippe Mathieu-Daudé" <philmd@linaro.org> wrote:
>>>>>> Add a tag to run all Xen-specific tests using:
>>>>>>
>>>>>>     $ make check-avocado AVOCADO_TAGS='guest:xen'
>>>>>>
>>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>>> ---
>>>>>> tests/avocado/boot_xen.py      | 3 +++
>>>>>> tests/avocado/kvm_xen_guest.py | 1 +
>>>>>> 2 files changed, 4 insertions(+)
>>>>>
>>>>> Those two are very different. One runs on Xen, the other on KVM. Do we want to use the same tag for both?
>>>>
>>>> My understanding is,
>>>> - boot_xen.py runs Xen on TCG
>>>> - kvm_xen_guest.py runs Xen on KVM
>>>> so both runs Xen guests.
>>>
>>> Does boot_xen.py actually boot *Xen*? And presumably at least one Xen guest *within* Xen?
>>
>> I'll let Alex confirm, but yes, I expect Xen guest within Xen guest within TCG. So the tags "accel:tcg" (already present) and "guest:xen".
>>
>>> kvm_xen_guest.py boots a "Xen guest" under KVM directly without any real Xen being present. It's *emulating* Xen.
>>
>> Yes, so the tag "guest:xen" is correct.
>>
>>> They do both run Xen guests (or at least guests which use Xen hypercalls and *think* they're running under Xen). But is that the important classification for lumping them together?
>>
>> The idea of AVOCADO_TAGS is to restrict testing to what you want to cover. So here this allow running 'anything that can run Xen guest'
>> in a single command, for example it is handy on my macOS aarch64 host.
> 
> Ok, that makes sense then. Thanks for your patience.

No problem, I'll add a better description in v3.

> Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>

Thanks!
