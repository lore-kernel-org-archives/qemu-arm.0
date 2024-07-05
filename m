Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp1344043njb;
        Fri, 5 Jul 2024 09:49:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXE/7RttUsb2K7XsfNllfb7EKIF9oh+ff3lYwAossKwarVXfiXVLTIb0mtvxs9IhdaCB7HPqaalgo6WOfpYwDiniYgMCIbm
X-Google-Smtp-Source: AGHT+IHNtS7Skdx41rCG5KZ1wNmPX9suK/YE5cJjUOEW8vNUQH9mk+Cl94s+SktbjusPgLQEWPSS
X-Received: by 2002:a05:620a:4007:b0:79d:9a20:7c03 with SMTP id af79cd13be357-79eef3a1521mr856609685a.10.1720198187180;
        Fri, 05 Jul 2024 09:49:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720198187; cv=none;
        d=google.com; s=arc-20160816;
        b=ce1n4O1zCzg7NHsOSe7ch+Wa3OyUtSB0TFLDGqewCJbqQtfxDSUQ68yu86ZVXJDiUE
         BY8fuKniUYT0geP6Ky3wxQtKSL1h+DZus6q/+FpghFTxBhs6NIYIXeG3l+yk6v6dXmU4
         PSiWqgwGOnnMg5JslPpu5/HLUiWMdg/qAl5DlNDz4txOq7Mw1iPKRFeZASKX296h0AOI
         +TMcP+YieNLETGnrg02TnnPj8bX+uFJHE+/IVbqe20jJawW2y0SYr2nFJBxMwTz7y9ky
         l5EMgoqrKlG0LWx0kUx+uiETInUdvo+btVwvKBATrBv/q1e2LE4qZrOMW0ospNGZ9D0m
         Envw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=AYsXIKIkwIjpOTAAE8c7mT0odQOrM5AARoaFfzVTp9c=;
        fh=XRzkPps0xC+CbSup3c5F/2cV/1FZxnhEU4a3DG+zcpM=;
        b=JBSFt/pjJUNk4ewuJLZra4xHVntjH2Msk4/6PUuFjMgpTOpTljevY52pAStS0CMpHn
         L9syl+bqDQnB3sV7Lr3oySW/EsrZH8ss3BC1o4m/fr/zG1q7JO6FxntH3/4OOV/x4lVm
         jKSYhY/fzPXkEDkkRFmKel+CMPpHhu6BQTEojASeWdz2h/1ezgOgonmKuLF/QPRMv96T
         mcOBGHvIqc5+X7WAZaYTwGibhHhC8ezqYes8+D1HZtHkEEUdVMHVcOuYSSiBUXoww8sC
         89LS90/KK/HZBk7KG/dV56jk2yAYfe0kFXSZi0GeCq8BBg3m+zYS9vmG0vVcI1EtMbmG
         PLiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="G3ILkWK/";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-79d692f08dfsi1864407285a.234.2024.07.05.09.49.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 09:49:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="G3ILkWK/";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720198186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AYsXIKIkwIjpOTAAE8c7mT0odQOrM5AARoaFfzVTp9c=;
	b=G3ILkWK/A1MvyKvCUaPk7kbtCt9Bnf1nw95+oJnw4uwXgQo3ByH6gLAwtr85RMP7ewYebx
	TVosVfj7AyuovV4zIHifzORX3oZjsL5cs45Y4Zg+axYz/lfCay5sdJYndgc7M6zcq8R9yo
	3Z7+MPzje+nIyh9F1HdDk9TQTIcUgts=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-dNIQwrP-OpCcwnZCX4gDEw-1; Fri, 05 Jul 2024 12:49:45 -0400
X-MC-Unique: dNIQwrP-OpCcwnZCX4gDEw-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6b5dacdc192so33627026d6.0
        for <alex.bennee@linaro.org>; Fri, 05 Jul 2024 09:49:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720198185; x=1720802985;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYsXIKIkwIjpOTAAE8c7mT0odQOrM5AARoaFfzVTp9c=;
        b=OURD3TC4JpTQPaPrczm+TMlOtmn5L4ydoRwjujSiOc8NaNzuOveMl7fTzv9tL4kAOG
         VvA5st3IjWOOn4rNO8NZYxBfM1x1VfVZmIFzxQgAapK72bc1IZOG5W/bUHx7j8Dl7d4f
         PjvL/fJHCgRZa1ZLq4f0TWMW/AqlokU5bcWeUeY3+RWHYImvgypcvN9e7kZcsxrv6VuP
         7EpJA3eKVhCDqQ7iQFnL+O57Daypko5zcF63FtryJbqyg6pvDJ3qxuTHiTOZMjQbRrey
         SrxThoX3IzKlRxI3u4tjlh+Xdf80XuTmdo0rsUwLzgjN+sLCvJoNOKQiJa4Wlb9QEmXd
         Pj+w==
X-Forwarded-Encrypted: i=1; AJvYcCXAjsFK34SekshBseho5iP3MlbdMN65kFgpyIWn72/7zslYtK+mCa0qsOSzxaLjN8wPWQhiwYRsTdeFisA9P/kIOeH7VZ33
X-Gm-Message-State: AOJu0YxkzYEJSOZw3W+M+loyg9DZU9NLPlVxds6i2Dy586P7fmTPfSI/
	W+cB8itYom8nDqn9mC3LbMzOaMQGG3zOk8WLv6ZbcHPsVuW01psH9crZJb7JLEpcOOXCpDY+43X
	YmDNIv9j6L3QmFTJpr4Fsj73QM/3+EQJ44nZUuoB9eHtuIFADC2SnkQ==
X-Received: by 2002:a05:6214:5097:b0:6b0:74cb:96d9 with SMTP id 6a1803df08f44-6b5ee6db1ccmr55522696d6.30.1720198185072;
        Fri, 05 Jul 2024 09:49:45 -0700 (PDT)
X-Received: by 2002:a05:6214:5097:b0:6b0:74cb:96d9 with SMTP id 6a1803df08f44-6b5ee6db1ccmr55522296d6.30.1720198184757;
        Fri, 05 Jul 2024 09:49:44 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.4] (ip-109-42-179-211.web.vodafone.de. [109.42.179.211])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b5f82080d3sm7191026d6.144.2024.07.05.09.49.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 09:49:44 -0700 (PDT)
Message-ID: <5d3be228-1dbb-4e4a-8e20-fb76e4c90134@redhat.com>
Date: Fri, 5 Jul 2024 18:49:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/40] gitlab: don't bother with KVM for TCI builds
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Aleksandar Rikalo <arikalo@gmail.com>,
 Mads Ynddal <mads@ynddal.dk>, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paul Burton <paulburton@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
References: <20240705084047.857176-1-alex.bennee@linaro.org>
 <20240705084047.857176-21-alex.bennee@linaro.org>
 <07195265-2a54-4396-9724-2a63c98e45fb@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <07195265-2a54-4396-9724-2a63c98e45fb@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 4ed1pGR9O413

On 05/07/2024 18.34, Philippe Mathieu-Daudé wrote:
> On 5/7/24 10:40, Alex Bennée wrote:
>> In fact any other accelerator would be pointless as the point is to
>> exercise the TCI accelerator anyway.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   .gitlab-ci.d/buildtest.yml   | 2 +-
>>   .gitlab-ci.d/crossbuilds.yml | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
>> index 425fc6479b..e3a0758bd9 100644
>> --- a/.gitlab-ci.d/buildtest.yml
>> +++ b/.gitlab-ci.d/buildtest.yml
>> @@ -635,7 +635,7 @@ build-tci:
>>       - TARGETS="aarch64 arm hppa m68k microblaze ppc64 s390x x86_64"
>>       - mkdir build
>>       - cd build
>> -    - ../configure --enable-tcg-interpreter --disable-docs --disable-gtk 
>> --disable-vnc
>> +    - ../configure --enable-tcg-interpreter --disable-kvm --disable-docs 
>> --disable-gtk --disable-vnc
> 
> Shouldn't we also disable the other accelerators for completeness?

No, this is a Linux machine, and there's only TCG and KVM available for 
Linux. No need to bother with the other accelerators here.

  Thomas

