Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp42450lfq;
        Wed, 23 Feb 2022 02:58:55 -0800 (PST)
X-Received: by 2002:a63:f555:0:b0:373:9ad0:ca08 with SMTP id e21-20020a63f555000000b003739ad0ca08mr22993278pgk.315.1645613935300;
        Wed, 23 Feb 2022 02:58:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645613935; cv=none;
        d=google.com; s=arc-20160816;
        b=GPvqumUHxtxGIHfTbgJM+w+Zs9+IOoCzpkVVUluEACeJ9aC1q6bnGHaMxtlu1K+dTA
         Quq9Cga1ZfUKp0WL/x2E8s+iJbv2G/JqNbgJJVZIB/PmZ3nnl7dQxcwHoJxk6k6n+pvk
         QyCUxzU1+rplIjuGh2RwY4nvoEYDQG0uSDPDEzmXkjoJO7DHHQhyrOwMYUyeZI6nhXf0
         EyHtSD0WO58uB3v+uM38RrqBn8oH8DEJPN0XqdIzzLHJfxkGeJEhhPCoRdl82RkCX2mf
         6VmryFlU1tQA4qxfsU3/LzVCx95zgDLTsZB0aA/l7QMUPUdSRBzdcOkcm2utyGursIyI
         EUDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=RF9tMSi8dUbOvYs7dCX+h+xm+nS0CrCpDv3JUV2tefA=;
        b=XTTnSNbYRCPZdRcHGvCNIWKIyhu+7oB2aGCNhmZYcLI5MY0Xiy86Sfs52nZjaOaV5D
         KmVz0eDmVBeG4mXeSTQPXo4lyRm2a1bFZgCXXalXKbMx0Z+/mLbNgwrt82dkmJYyUZYC
         U3BNZcobRhyjFkR5ZFv87qvUItyubdFgA5wM35PcDYble1APAIZVDtWyXzupYM8fro9V
         jusWYc28FW/sAno+ngMccG5KAQMirfymOafwQopWKmcap8mtwzcZU32Bjlm1eyp/sKzJ
         blRkPJL/UZ15oRufPCS9p8cME1F3rUFTKf7nMStnV5ycV5JiJnjF9YR6CtOAx/BtPZFD
         5WAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZrZg0Rh8;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k2sor2463218pff.11.2022.02.23.02.58.55
        (Google Transport Security);
        Wed, 23 Feb 2022 02:58:55 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZrZg0Rh8;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=RF9tMSi8dUbOvYs7dCX+h+xm+nS0CrCpDv3JUV2tefA=;
        b=ZrZg0Rh86TycEXXEplog83YFmjr/NNf/6386xU5qgP/7xCOnRHuHdYeThFJnc+XeE0
         OFxpKeb7taJUksViH1OCrUAKgSPRoIqyy525Qi6QM0LpuMbteMm8Wu+JEFSL53QEasde
         SLyqAkJCGvSUg/lQjvpfsQR7I6nuGnz6AQ/ZDmfDPhOh/SzaFiKx189jpUX8wMS3T+OC
         0JoSR9jfOE3iOWDkhLqiYar1OQMc0KMXKuLhRMrchhVStSK35s0zSoMKkirsiuKwmbDc
         lZbGjrCI5UoYDXsrEJMh8GCiPKMZezqK3waiZFaKrUi5HwwAKQaS38oPsRAKgBTq/1KP
         1NTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RF9tMSi8dUbOvYs7dCX+h+xm+nS0CrCpDv3JUV2tefA=;
        b=pPtnuVV8WLrrNrlsYG+bUJmVGo+N2uKvJSxq4Xq5ewSnNYRKLsDkhDRTyAtVypvvnc
         o0HoLj+IoaqjCQoqkTbgpBnA1JDvfzcDu8Pmt8FzrESI08zdMkGjPbGjpLd7dwXBc+TP
         T78TXTpbtxEZ+PM4TphWFvJ638xcHMEfGTPJeg8IV3Qo+VH34GE6w9Kar+tJeAWk9Mq6
         FcAF1RmLsfGbrmgGIC0/Ha2FaICk6m0iwPUxOwIAPSVCQ/jZH0oNNacciri+0t+AJZm9
         0D6amXoDvSjFtKX2p0bnwSW7w9GtN8Em9618FTyf919Y8yLdde7Nk6Ml252KgKZmrqjJ
         32rA==
X-Gm-Message-State: AOAM531Sd9mo2b6WxXIyIZg4An5TVe4gAkP3SIpO1gyI735zJMiM7iib
	jqXJjtoFzpbJXqHSpNQ6uGLg3KPvbjE=
X-Google-Smtp-Source: ABdhPJzlzKEMECvZ0NAIqiM5dWiJufBFH5suGqloUnvkafiU19mz0d5SFojYxhcVHmT4VEbT+m2bLg==
X-Received: by 2002:a05:6a00:1312:b0:4e1:58c4:ddfd with SMTP id j18-20020a056a00131200b004e158c4ddfdmr29158330pfu.65.1645613934569;
        Wed, 23 Feb 2022 02:58:54 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net. [83.50.68.71])
        by smtp.gmail.com with ESMTPSA id d8sm20275183pfl.163.2022.02.23.02.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 02:58:54 -0800 (PST)
Message-ID: <82382df1-4ff9-be5d-09a1-52874986545e@gmail.com>
Date: Wed, 23 Feb 2022 11:58:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa
 <cleber@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Laszlo Ersek <lersek@redhat.com>, Oleg Vasilev <me@svin.in>,
 Richard Henderson <richard.henderson@linaro.org>,
 Emilio Cota <cota@braap.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Idan Horowitz
 <idan.horowitz@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 Andrew Jones <drjones@redhat.com>
References: <874k4xbqvp.fsf@linaro.org> <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com>
 <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
 <CAFEAcA8ggE0HHXwLAu4vCA=kLwo4moN1CvTJbjph=OTmnfOONg@mail.gmail.com>
 <d26a877d-f3ad-6186-6a22-1e09f93a3fae@gmail.com>
 <20220223084836.yapqj35tiocjios4@sirius.home.kraxel.org>
 <87zgmhlwjw.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <87zgmhlwjw.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: jC3wTMuKzk8A

On 23/2/22 11:10, Alex Bennée wrote:
> 
> Gerd Hoffmann <kraxel@redhat.com> writes:
> 
>>    Hi,
>>
>>>>> If you want to boot a guest using EDK2, you should use the images
>>>>> build by your distribution (/usr/share/qemu/edk2-aarch64-code.fd),
>>>>> not these images.
>>
>>> Then we should add edk2-aarch64 and edk2-ovmf to lcitool, to have
>>> the distrib images in our generated Docker images.
>>>
>>> Cleber, you added this test in commit 6fd52d671d ("Acceptance test:
>>> add "boot_linux" tests"), can you have a look?
>>
>> Well, it's not *that* simple.  Names are not consistent across
>> distributions.  I think if we want go that route we have to inspect
>> the *.json files in /usr/share/qemu/firmware to find the correct
>> distro firmware images.
>>
>> Also note that at least fedora ships both verbose and non-verbose
>> images ...
>>
>>      kraxel@sirius ~# rpm -ql edk2-aarch64
>>      [ ... ]
>>      /usr/share/edk2/aarch64/QEMU_EFI-pflash.raw
>>      /usr/share/edk2/aarch64/QEMU_EFI-silent-pflash.raw
>>      /usr/share/edk2/aarch64/QEMU_EFI.fd
>>      /usr/share/edk2/aarch64/QEMU_EFI.silent.fd
>>      /usr/share/edk2/aarch64/QEMU_VARS.fd
>>      [ ... ]
>>      /usr/share/qemu/firmware/60-edk2-aarch64.json
>>      /usr/share/qemu/firmware/70-edk2-aarch64-verbose.json
>>
>> ... so maybe it is an option to use the distro images for the bios
>> tables test cases too.
> 
> Debian isn't quite so free with it's use of disk space although:
> 
>    10:09:19 [root@zen:~] # dpkg -L qemu-efi-aarch64
>    /.
>    /usr
>    /usr/share
>    /usr/share/AAVMF
>    /usr/share/AAVMF/AAVMF_CODE.fd
>    /usr/share/AAVMF/AAVMF_VARS.fd
>    /usr/share/doc
>    /usr/share/doc/qemu-efi-aarch64
>    /usr/share/doc/qemu-efi-aarch64/changelog.Debian.gz
>    /usr/share/doc/qemu-efi-aarch64/copyright
>    /usr/share/qemu
>    /usr/share/qemu/firmware
>    /usr/share/qemu/firmware/60-edk2-aarch64.json
>    /usr/share/qemu-efi-aarch64
>    /usr/share/qemu-efi-aarch64/QEMU_EFI.fd
>    10:09:25 [root@zen:~] # md5sum /usr/share/AAVMF/AAVMF_CODE.fd /usr/share/qemu-efi-aarch64/QEMU_EFI.fd
>    573b65b6e04981abb5b10afc8f30feea  /usr/share/AAVMF/AAVMF_CODE.fd
>    99812e842b6b40add0d8f7766e0aac9e  /usr/share/qemu-efi-aarch64/QEMU_EFI.fd
>    10:09:37 [root@zen:~] # ls -lh /usr/share/AAVMF/AAVMF_CODE.fd /usr/share/qemu-efi-aarch64/QEMU_EFI.fd
>    -rw-r--r-- 1 root root  64M Aug 18  2021 /usr/share/AAVMF/AAVMF_CODE.fd
>    -rw-r--r-- 1 root root 2.0M Aug 18  2021 /usr/share/qemu-efi-aarch64/QEMU_EFI.fd
> 
> I think the QEMU_EFI.fd is the firmware and AAVF_CODE is the same
> firmware but packaged in the "right" size of flash file.
> 
> However if we are to use the distro version (or at least favour it) do
> we need to start encoding searches through common paths?
> 
> I'm also sympathetic to Peter's point that distros might just end up packaging
> what we give them in pc-bios and we'll be back to square one. I'd favour
> pc-bios having both a edk2-aarch64-code.fd and a edk2-aarch64-code-debug.fd.

Distro have security teams with crypto knowledge who track CVE vulns
and integrate fixes, often embedding their own certificates in the
UEFI image. They certainly don't use that old/unsecure version
QEMU provides (edk2-stable202008, current is edk2-stable202111).
