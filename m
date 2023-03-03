Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp946489ejc;
        Fri, 3 Mar 2023 03:22:17 -0800 (PST)
X-Google-Smtp-Source: AK7set89Bvat7xqEz1oTdjbe6+HL1cdiFssT9AZjgtKkfAbmhm23MrTnY9no3QyQk7tAXJzMqOjg
X-Received: by 2002:a05:622a:1806:b0:3be:36c7:a15c with SMTP id t6-20020a05622a180600b003be36c7a15cmr2225445qtc.49.1677842537284;
        Fri, 03 Mar 2023 03:22:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677842537; cv=none;
        d=google.com; s=arc-20160816;
        b=cD+bfXfuWVekkOdMFhBcbftRWwQ2y79gV+taCOy8GxzmT0aodRGPwS3iTVdbqrZR7J
         A5ukDotesZhXB0VVvzCvIs1hQIU08yMdog7GNaFny2mOR4+8qCoSzno+uHWD4t5pOh2Y
         iESmkSX4qEX2yZCPxVrM/oy9v3EU0iSipEbt2L9tiBUfmiFuMLhelK9hxljWbVQWXoFN
         BOJ2a4yc1pTG6DL1rEocNTFLCUm4kP43bKhdwpUwR01iMU1tPBcXooAGabmHxP47gf7R
         A9sHflv+nH/KstO9uXKI/hjI27Tmznuse6GKK70lajjdLFMuB4vWm2AFbj8WebCGoyh9
         06Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:subject:from
         :references:cc:to:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=n8X5aQaOrBWXpjTROsAMx9ppByyxH1Rsy+EUt4R2/2I=;
        b=np/cOHiv88tBCBjYUn59b+2mSJZEnWKzUC9mQpE2m1uugJM9Virb7dkFgmlYDwtqZf
         XMI6KrAO0uMhl+CRo5MDvmYiw8HPJy6s5U7QdX6LQ28QvYOpjXZo+lJZW4NURQEzk6Yn
         CUb3OtHrBfckNMWr/i2Ca/wzAJJedaTZ1MrfUawom+H/5TLyLbk9v+MJFdl8tb8FNWgb
         AxmoH9BbeaM9eoOkOF0G22wC8PATgRgXgAi/I3n56r8nni0X4vfwG8W8/bDNdGT3Hv9L
         fxJvP/mAW/qg0JubXHVnqIzcxZk9dnIEy/4LzwMApaVPZ7uufkjLqVEgLeS2UvllyYVn
         PAUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KaOyuFRJ;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id b75-20020ae9eb4e000000b0073b65d10881si1477870qkg.4.2023.03.03.03.22.17
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 03:22:17 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KaOyuFRJ;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677842536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n8X5aQaOrBWXpjTROsAMx9ppByyxH1Rsy+EUt4R2/2I=;
	b=KaOyuFRJxe3Dd8G/VxaLdMwGZq2XvodNFCXkkPvdcdJl5/t0+MVImb5CF3ffNARSuVqgwT
	9Bx/wedUb8FJaYTsdejgVBUOpGnN0nYV9weMwjfGb3GxbTjNWJmIkxB+p5PIZKVlZdlsAS
	ZluOAVINW+WIZLhQH/dm9+o5LvLtvkk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-xN4lhAR1Px-DOkoCHz_UKw-1; Fri, 03 Mar 2023 06:22:15 -0500
X-MC-Unique: xN4lhAR1Px-DOkoCHz_UKw-1
Received: by mail-wm1-f71.google.com with SMTP id l16-20020a05600c1d1000b003e77552705cso854622wms.7
        for <alex.bennee@linaro.org>; Fri, 03 Mar 2023 03:22:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n8X5aQaOrBWXpjTROsAMx9ppByyxH1Rsy+EUt4R2/2I=;
        b=uMyvoYObRJ1qVB1M2eveVG86dAUjL30X7nQAkqkWs4dE4xKGxtJ4kbIk6XKAueziJ4
         0Mqf3DsuUKILR5D9zuplP6Dj51Xzn249a4uEopcijFbbelt4C4jlsPapZa0Fnzu5TzzC
         MaqovMYukC62GApDmcPuC40pXuOUoq5I598BcD4Ex1TRep2gdlLqNAZfIldJGA7FvDje
         OkYP61fYx5bOID9IjDcSSgHyt2rGM5W/ZSF3hMyoAtNpuXGIDqFJKGXucl7Vm8wpnAge
         TCYRAYgfoxNn0WwtWYcKWVDjvZZy5daYszQCHBJlSP/6MgQDyu1fj2gcH8f530yBAKB6
         qh9Q==
X-Gm-Message-State: AO0yUKWUpp3ddjRKN+TED4ikgLq2RtKFZNbgUKqbFiyvLniAgBCi2FCl
	yDi0w3pAMlHidFaQjGS38gRk1i9yK9hCDAOZwxgEfmz5e3yNhbYuYhN9CKi6mM+fV+eDSzIhU0u
	zpQPl0AbGVIaSwxsH
X-Received: by 2002:a05:600c:3b07:b0:3ea:ea3e:2d36 with SMTP id m7-20020a05600c3b0700b003eaea3e2d36mr1407150wms.24.1677842534868;
        Fri, 03 Mar 2023 03:22:14 -0800 (PST)
X-Received: by 2002:a05:600c:3b07:b0:3ea:ea3e:2d36 with SMTP id m7-20020a05600c3b0700b003eaea3e2d36mr1407120wms.24.1677842534612;
        Fri, 03 Mar 2023 03:22:14 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-176-203.web.vodafone.de. [109.43.176.203])
        by smtp.gmail.com with ESMTPSA id p16-20020a05600c359000b003e209b45f6bsm6595277wmq.29.2023.03.03.03.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 03:22:14 -0800 (PST)
Message-ID: <2c7f837f-c156-8525-005f-f47d50591a85@redhat.com>
Date: Fri, 3 Mar 2023 12:22:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Helge Deller <deller@gmx.de>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
 <4bed38c3-ab4f-cd32-05a4-afa090ad8b9a@linaro.org>
 <6c1f0d05-924e-854e-0175-5e345945e086@redhat.com>
 <89fd1c916b6c8094ea1a7a52396b3f91025c75c1.camel@physik.fu-berlin.de>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 0/6] Deprecate support for 32-bit x86 and arm hosts
In-Reply-To: <89fd1c916b6c8094ea1a7a52396b3f91025c75c1.camel@physik.fu-berlin.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: IVufBulFjNJf

On 03/03/2023 12.09, John Paul Adrian Glaubitz wrote:
> Hello!
> 
> On Fri, 2023-03-03 at 10:48 +0100, Thomas Huth wrote:
>> x86 ==> deprecate both, user and system emulation support on
>>           32-bit hosts
>> arm ==> deprecate only system emulation on 32-bit hosts.
> 
> I would recommend against dropping support for 32-bit hosts for qemu-user
> as there are some cases where the emulation of 32-bit user code on 64-bit
> hosts does not work properly [1].
> 
> Adrian
> 
>> [1] https://sourceware.org/bugzilla/show_bug.cgi?id=23960

The ticket is very long and hard to read, but ... oh my, does that mean you 
need to compile qemu-user in 32-bit mode on a 64-bit x86 host to properly 
run 32-bit binaries from other architectures? ... uh, that's ugly ... and 
sounds like bug in QEMU's user mode emulation ... and what if you're running 
a distro (or different 64-bit host architecutre) that does not support 
32-bit userspace libraries anymore? Then you're lost?

  Thomas
