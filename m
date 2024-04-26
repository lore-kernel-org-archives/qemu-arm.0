Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp488812ejb;
        Fri, 26 Apr 2024 08:49:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExr05uNCZuggRsRzopBnLOW0A0758JPuEFvWNxOiHlc8OOzmz8pOmIITFAYcdQxi2Jdpn8
X-Received: by 2002:a05:622a:189a:b0:43a:1c0f:3455 with SMTP id v26-20020a05622a189a00b0043a1c0f3455mr3347602qtc.48.1714146555920;
        Fri, 26 Apr 2024 08:49:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714146555; cv=none;
        d=google.com; s=arc-20160816;
        b=T05pImHMwe3+GThWbDxclUfusdznEy6ySASlbs/Gmr8wzsaL6oqv4DGxe7pWeqhl/0
         jZe9VR8X76FSLEU46QaqqPF+T03VI6QweVjiNoKZPbeVaQ5ZJ/BuYXJIZdIdtgKS0aRS
         yGRl54gOKpCZl4GuErxJu31nQheS5sqAS7L8IF9qb4lanj3pxr/BrSI0PRq5Unqg2mLl
         NfneYmW/JZRcFehV5/aCLXz6cP3zLxiP56hMBTCBKqBlVO81lds7+OXBS+lyC33ROlqI
         FJcd2GRSM2oNaYThNz9ASvlKPfxEsDIhihYcclwwvlJBwO4LzwGZ5WQmUQHIEIVajexe
         YuTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=I85afPf8naK0SoR0hGy3wV07d4GZZMzV8GvhiAp+CUk=;
        fh=xCaHNNCN3Z15JqMJFlGDE60pgXroAFZ1570Y/qreWBM=;
        b=dPuXTjhoTkHWDQG1iS7ePTxeUA2HanR8ECWx+TzcUwpZv1tlgHmHxacWczpTy1VbTK
         lKBc8C+FxGWu1FirQt2wrjvuSpDUQO3uF5QN8+v+S8261NWvB2nRs73r/PrI7gusRcsh
         MVfD3RQ1g/t8AIQHzNGkWwm17fMe32ymP8SbKGcrEKS5tJnvCYvDP++X+Fs/Sffy6A5A
         9r6yEbSw20fjd4M32Z8QE57criBRhrne2kpn85VvsFJ0jNfYfag1AbyvyzXPpXSksK7q
         Yz37kR/Fswc5oi7FhKegLMtH0DyGv84mOQ2KHbLEIo+kKwl6JuI58F7KC21EMUZBVt+n
         M1qg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NRyL7Z2v;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d11-20020a05622a15cb00b004395cfaae06si16508268qty.118.2024.04.26.08.49.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 08:49:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NRyL7Z2v;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714146555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=I85afPf8naK0SoR0hGy3wV07d4GZZMzV8GvhiAp+CUk=;
	b=NRyL7Z2v2zI7PHCkXnuyQ2oeEn/MCdBJGW29PAQnzygEeN9rI1qLvm8eSYuBRCQ1JBDz4Y
	gq09LgVcTi3R6JnAQhYC/uU6gykbe+u6eQtdglDu80nilVhXRVP3d7DZSngMveZOLN+SRi
	EJjLEYUZetLRwdfTgLH83qEJ7QjTty0=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-4NmTph6nMwqjLdQFoqupdQ-1; Fri, 26 Apr 2024 11:49:13 -0400
X-MC-Unique: 4NmTph6nMwqjLdQFoqupdQ-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2d883dab079so21347051fa.3
        for <alex.bennee@linaro.org>; Fri, 26 Apr 2024 08:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714146552; x=1714751352;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I85afPf8naK0SoR0hGy3wV07d4GZZMzV8GvhiAp+CUk=;
        b=rp8Eh3oVBh8qItPGgxtF3DLbKu1nDVqmxQEzvijJpbhXYHvv77SpHlDkS0XSm1UA1k
         pCN7d/ZYloAQ09wQfQa7DcWYXoLnTF2frZaGAcrLu0opAhG40pqXM7haM107PMetdRie
         imkfNzozxbwK2O15W+x681Nkf8dIjWouW0DkHynnVRKUNh5K9YZ9+Ai3XfnsWk72HswI
         X3VwalwZ9aDE/q38L8MrXDEcW9iTwlncaBSCeRpaedQI3OXL+8PMuKEs3Upv6nvZnw3j
         npZLE7jMlSggBi+tgJplimpvMUMa19ftgcePAFu5AUNDXk4td5pRjKtSGtXY8R3nF1+m
         HmrQ==
X-Gm-Message-State: AOJu0Yze6+jUrUDUBIyRC3AHAytvtuWIGb0PjsyIYVaQKsFkyMQ/8AFH
	OwcO1b98gG+VMbOPWCdFE+xIlYai5wiiQcv46M0ns3aU6sR5PtGo7TTMnwO8OtUxcd30e9QL+IN
	VAmDEXQHtgpuQL0G1l7xqO8z5VhXrKT4t1XAauaiSvTJ2FmEMkgYOKiM8icJcNbJq6QvxFCwaus
	v3PjKNL5WGRumpysJZYhwCu5HMzJMeujqrnQ==
X-Received: by 2002:ac2:528b:0:b0:51a:be0c:b235 with SMTP id q11-20020ac2528b000000b0051abe0cb235mr2444366lfm.64.1714146551824;
        Fri, 26 Apr 2024 08:49:11 -0700 (PDT)
X-Received: by 2002:ac2:528b:0:b0:51a:be0c:b235 with SMTP id q11-20020ac2528b000000b0051abe0cb235mr2444332lfm.64.1714146551432;
        Fri, 26 Apr 2024 08:49:11 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.9] (ip-109-43-179-20.web.vodafone.de. [109.43.179.20])
        by smtp.gmail.com with ESMTPSA id g1-20020aa7c841000000b0056e718795f8sm10115385edt.36.2024.04.26.08.49.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Apr 2024 08:49:11 -0700 (PDT)
Message-ID: <c7fd6065-cd64-4c92-bcd3-397411d1d52b@redhat.com>
Date: Fri, 26 Apr 2024 17:49:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] gitlab: remove stale s390x-all-linux-static conf
 hacks
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Joel Stanley <joel@jms.id.au>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Markus Armbruster <armbru@redhat.com>
References: <20240426153938.1707723-1-alex.bennee@linaro.org>
 <20240426153938.1707723-4-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240426153938.1707723-4-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: O1fhiww600Pc

On 26/04/2024 17.39, Alex Bennée wrote:
> The libssh bug references 18.04 which we are no longer running. We
> don't need to disable glusterfs because a linux-user build shouldn't
> be trying to link to it anyway.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/custom-runners/ubuntu-22.04-s390x.yml | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

