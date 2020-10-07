Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp170317lfq;
        Wed, 7 Oct 2020 00:27:25 -0700 (PDT)
X-Received: by 2002:a5d:608f:: with SMTP id w15mr1891616wrt.244.1602055645158;
        Wed, 07 Oct 2020 00:27:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602055645; cv=none;
        d=google.com; s=arc-20160816;
        b=neSj7PhcqrJ6msD5K9iuznPE/nKQvkYgKb4HbLgimywVK72qyxrFbk4OUYFiZ6RaWP
         HW5YAmzjQCbi2kRpUNgZr4LuEu+A0OGYObV/opAUIBYFefVD3axocPKUK76kKrvZS7pL
         Y3gsdOhZ1pW+VV2/OMe/LamCC3PkQ5OlldTGyOfhXDMd4voqk3B/XggrhCVQclt1p0aG
         0WSpEDFS7WCGaQxzccui6umgokgNy4uWAS19eExVIWBw2RqLm8MCfjduSRPQJWBJzVXq
         QImUHsa4ilaHLqawfS859wxStWAciVQSVikF9PzqvJUls3q7mh7HkRizSJv4g6MEnz/W
         uceQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=bE1RgvN+vCiXUMiZyF71Xr2ku5CW0sV51rQc+GqF9Zo=;
        b=i1Fq6ouaALhkSpjDG1Mrb3DA/mpiVphInWjyEzQCBkqPGUaiw5c9YuOI72Cm82/wte
         MFkZ0KjImflRObJrqaG0DRPMVBpOoPqtEJQ+zd2IyNIJNa81hIusZTiNK7fJIhmwKpRx
         WrcjLZm51fqFsBBuVg8FgdzDvCjUbZpRYZR9AqPBQyKHpi1nQhn0H/LmOg8UoEuyVEda
         8UOZJnPeo2wOSoSR9yv8GRlqRQ9dzkWnSCi5ELuGQ60BIq36KHOBvF6SkD7FGf1hkMBX
         16HfQZ4f0l52GrucFSxbc7Z0FF7IBB2q1QuAOMYcA9P3p0L7hwQLPTRcqCqn8W0cjVle
         1NAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Mg9O7Afa;
       spf=pass (google.com: domain of 74cmonty@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=74cmonty@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <74cmonty@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n2sor531625wrg.52.2020.10.07.00.27.25
        (Google Transport Security);
        Wed, 07 Oct 2020 00:27:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of 74cmonty@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Mg9O7Afa;
       spf=pass (google.com: domain of 74cmonty@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=74cmonty@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=bE1RgvN+vCiXUMiZyF71Xr2ku5CW0sV51rQc+GqF9Zo=;
        b=Mg9O7AfaRl3fWFWqqFbU/lH9jqnrjR8dDizwqJQgxS++XbYAWA9y8eG4M2PtescmAA
         /YHgXT5fKSR7x1V/+L/OukPCj8r78c5EZ8ffdxepgpOoA4MauEdzsXRmp7Fi7Qk0S0tq
         dodtnzv92l8ab+c00MIiHW53i+HP5y3YP9sPwKSYZ9WaaLgnfpPkkNImSU920g3eYxV+
         AHRZgQid8/V+dZZMfslWRLXgTuP3T5tiOhDd9KAH89QdgTXkcCz/RHsSFyPpcbUX4ymJ
         FsI1kvNZ80IN5P4TiOEdCSCjbFiirl88HOvBiJdHK2+ev5MYyWL8HLVNmi9FamsYIhnk
         PJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=bE1RgvN+vCiXUMiZyF71Xr2ku5CW0sV51rQc+GqF9Zo=;
        b=IavnktYCoRjx7IK91wD9PZQi8v31/IkR8LXQ272g4sJf7hfRy5aPgH7okhsKBYsLun
         5hvXXXCkrSskpGqglL5IV2I242H4sYeXgEKAfR8pQZZ60kqJGEZ4TEYtwd3mRU907X2c
         /htO86Z+/UAmHCYJ75t5ouRERqE/oCAQtFwU0FQPiLtszaoQ7I7uzC+4sY2oLxQKtYCP
         S08S2jf/+aVKTpzDgdeLlCtqjGbZQalYcCww+3ntKS5B4uQWNMWsPBVqOEAwOj6BUtWB
         C1WK2ad3clSqtMdXw/p9cb1LmtB0cXJZ3f8A3iMKUR5YZOOSNTEEsweiyZwKhpFPF33D
         q9tw==
X-Gm-Message-State: AOAM532COgMzoJLSTePixlNROhMDtNmXS8XV+GqecNDj+sY82QleytG+
	dPOvlza5nqW6kTu3AYuHVPc9Qw0TifI2Iw==
X-Google-Smtp-Source: ABdhPJxs8NEv/1vn/pHlGUR5ks2Hut8s/LF2DWILyAmf2ec8dGExHsVfRw7S4U+e3lTcEXYafRYWGw==
X-Received: by 2002:a5d:518b:: with SMTP id k11mr1813510wrv.369.1602055644820;
        Wed, 07 Oct 2020 00:27:24 -0700 (PDT)
Return-Path: <74cmonty@gmail.com>
Received: from [192.168.1.71] (b2b-94-79-184-225.unitymedia.biz. [94.79.184.225])
        by smtp.gmail.com with ESMTPSA id q4sm1564351wru.65.2020.10.07.00.27.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2020 00:27:24 -0700 (PDT)
Subject: Re: Emulate Rpi with QEMU fails
To: Paul Zimmerman <pauldzim@gmail.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <47dbcad4-3121-b1c3-06fa-abec7c353fb6@gmail.com>
 <87sgatanti.fsf@linaro.org>
 <CAFEAcA_ZMLV3DZ_R_SHvPLdEf=i-xpspD5itBmfYeqyMhgtLWQ@mail.gmail.com>
 <875z7p3t9e.fsf@linaro.org> <e43be86d-1847-199f-4cbd-2e3bd124d70a@gmail.com>
 <CADBGO794+ZPD=B=dFuA7SC96g3GDJXF1A8j=VP6MeiSw1Sf4oQ@mail.gmail.com>
 <d8d79b4c-aeb4-4f07-7110-91d8d1afd701@gmail.com> <87362r3cbt.fsf@linaro.org>
 <61c49583-c548-a8b2-7106-59011196f430@gmail.com>
 <CADBGO7-BaTH3MBZa6Dbv2+uxKNbv3ztwQ=iu_FCgrcrKBUzCPw@mail.gmail.com>
From: Thomas Schneider <74cmonty@gmail.com>
Message-ID: <4da67d13-a774-f62e-ad89-de062cbe81da@gmail.com>
Date: Wed, 7 Oct 2020 09:27:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CADBGO7-BaTH3MBZa6Dbv2+uxKNbv3ztwQ=iu_FCgrcrKBUzCPw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Dm45MkAAaV1y

Hi,

I already considered the host CPU power.
However I have this 
<https://ark.intel.com/content/www/us/en/ark/products/33924/intel-core-2-quad-processor-q9550-12m-cache-2-83-ghz-1333-mhz-fsb.html> 
CPU
Intel Core 2 Quad Q9550 2,83 GHz
and assumed this should be powerful enough for RPi emulation.

But maybe my assumption was too optimistic.


Am 07.10.2020 um 08:50 schrieb Paul Zimmerman:
> On Tue, Oct 6, 2020 at 11:28 PM Thomas <74cmonty@gmail.com> wrote:
>> Hello!
>>
>> Many thanks for your support.
>>
>> I managed to get emulated RPi starting.
>>
>> However there's one question I want to ask:
>> How can I accelerate the startup sequence?
>> I mean booting the emulated RPi takes more than 3 minutes.
>>
>> Regards
>> Thomas
> Get a faster computer? ;)
>
> On my Intel i7 desktop it takes about 40 seconds to boot to the login:
> prompt on the serial console, and about 1 min 8 seconds before the
> GUI is up. On my 5 year old laptop it's probably twice that. I don't know
> of any way to make it go faster.
>
> - Paul
>
>> Am 06.10.20 um 11:58 schrieb Alex Bennée:
>>> Thomas Schneider <74cmonty@gmail.com> writes:
>>>
>>>> Hello Paul,
>>>>
>>>> many thanks for sharing this info.
>>>>
>>>> Can you confirm that the emulated RPi with your command will use
>>>> "internal QEMU" network, means the client cannot be accessed from any
>>>> other device in LAN?
>>> The support for user-mode and TAP networking is orthogonal to the
>>> emulated device. However if you only want a few ports it's quite easy to
>>> use port forwarding, e.g:
>>>
>>>    -netdev user,id=unet,hostfwd=tcp::2222-:22
>>>
>>> which forwards 2222 to port 22 on the device. I have an alias in
>>> .ssh/config for accessing my QEMU devices.
>>>
>>>> If yes, what is required to setup a TAP connected to host's network
>>>> bridge?
>>> I'll defer to others for this but generally when I want proper bridged
>>> networking for a VM I use virt-manager/libvirt to configure it because
>>> it can be quite fiddly to do by hand.
>>>
