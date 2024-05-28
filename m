Received: by 2002:a17:906:ca8a:b0:a63:3083:985b with SMTP id js10csp307935ejb;
        Mon, 27 May 2024 23:48:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxQr/ZRw/qNkNRFBugOWCjjXaAJsjqEwpC6EO2+POnEpNDp+pt1dFpXg5ewAhFqAts7eAI
X-Received: by 2002:a05:620a:72b5:b0:792:d298:7d68 with SMTP id af79cd13be357-794ab083f0cmr1201920485a.23.1716878925478;
        Mon, 27 May 2024 23:48:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716878925; cv=none;
        d=google.com; s=arc-20160816;
        b=uVNiUCO1m3wwbKGYVBk2UMyAXNNKUtdZgoqci//P9jJy4lMIxinCFPAx0IlLCBVZjh
         lIhEFdD2cluXmE9rNBJgtWqF8HSXjJMYLoPow0ussIwj5mkCqvhg87UZxqASZtU8iJGo
         cmT5NWEaZVHPJbHkMepkBHcXFS0nmwTEYVF2gPrFezxDbO0G2zpKgafGEq/J6PTfdknz
         f3Hakb7u4Uo7uq3408Lv69PL4k/9YIK10JdeSfaOAqeoMofxd61KD1ABgLd4IM4yo4pU
         9TjRXgpN4AGuSJqaaTAQrKZsB2BVtEKaGyH8T/0LJBwyCnPrScqqqCifxg3cH1BzeQVV
         0Mcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=OUudq/bNpbLZZfwleUaRyTCx+BeeWwxLVUrh5W24O2Y=;
        fh=gGcVA5X7letqRIE6Ctru5irj0sr93cabC9fdYGNdecg=;
        b=pjDCOyxXL51Do1nOW0iBQhzcQLQCWMt7Cb1lxoC0Cr+vNxcg59Mlokvlgde7gaapA+
         1enxhOTbSt/1aYbjzZ/qTvEZsRJL4l90bRC5JJduLOHCkq9+1BE6Br10W3uTXijmim2c
         aZAkVbATiibiNxxQv2bPi3lv+ZYb5+kUeDyGSJg8zBxA2LAes3OL4KJBRSmsOn7wBnQS
         k3LYzewkDEr104ICB1PZBqG16GiYU9Tc2Y2c0MHATxkYkwvde9GynVEhaUWqweFiiexV
         YPzE2/uj15kdOahhXQThlmaMQAAk6FJhG/5JFwyDIataZP6nNGCM39G2V3Dr0GTs4cM2
         L+jQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZZ6S4TGJ;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18eb064si97441331cf.748.2024.05.27.23.48.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 23:48:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZZ6S4TGJ;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716878925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OUudq/bNpbLZZfwleUaRyTCx+BeeWwxLVUrh5W24O2Y=;
	b=ZZ6S4TGJoZamWrT8BJ8rLsM7kBJb63Vmk4qB9RuiJJavlz3tLQNEjAwAhIXZxUCDBVhNd3
	xnKRccsLaQ2Ms5B4t+VoW5SSYTHbyg7EFkCuVmRdOZs/4rz1gYV9WfRFSW7ZWfo3LaNsK8
	uJaVcGgl5cyK18AGJ7KkXIItbhHXwHo=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-ojp3He3qOcCUL4SU-IfAhQ-1; Tue, 28 May 2024 02:48:39 -0400
X-MC-Unique: ojp3He3qOcCUL4SU-IfAhQ-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-529a8d2c85cso370479e87.2
        for <alex.bennee@linaro.org>; Mon, 27 May 2024 23:48:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716878918; x=1717483718;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OUudq/bNpbLZZfwleUaRyTCx+BeeWwxLVUrh5W24O2Y=;
        b=pqY4GUJEfRw+rzpksYTpKtgAyjo1HmwimSiZ7VHIlTsuK68WC+vwF4C4nFzCRSveg3
         VohJFLdqoE1Qt+KDQw5poLb+WtGdqU2Y6s1uMFJ73/3JcRBvFvCZYsHHSK9RL8yWRUM5
         inURr06TTsQg18Qi1cn1QNBPBCcit7OZELoWqjPpVypPaFx+X/YSupbO/J7atEJngzij
         QBejZfgjhrczsbZIVkSeGPs7ui8Rx1tEwo44FMrcVxNDbGESa9xWXl9K1FFpq/NzDd7T
         viI/PGYgh1lfggQaj1VOV62ryGBGH7brHwDf2+AVdaJ5qJ3rdZuFz1NyzxhexembZOB2
         d+PQ==
X-Gm-Message-State: AOJu0Yw6zaDbVafbhgXBZndkWNSx8imxkrjJOn1AoauKNF9YbEPiq+/r
	yZjmEW2oi2IGQN7RbEDdQX9GPgTC8XDnWn0esyWJhmEEjHFZWhki4I9wtkT49T/xE3QfZTGDeXX
	uFZA55Lm81l8+xSmTNZ8de/xfpQ9cUpR0HdNlA+dnR63iGeXQB9YdMizTAxYLAnwUGtsi+psT4w
	CGJIQVFoa9xnNfQvX0bfJxBqfuJzxuUGPLxQ==
X-Received: by 2002:a19:760f:0:b0:520:36ea:9375 with SMTP id 2adb3069b0e04-5296736ba45mr8289954e87.43.1716878918298;
        Mon, 27 May 2024 23:48:38 -0700 (PDT)
X-Received: by 2002:a19:760f:0:b0:520:36ea:9375 with SMTP id 2adb3069b0e04-5296736ba45mr8289926e87.43.1716878917821;
        Mon, 27 May 2024 23:48:37 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.4] (ip-109-43-179-186.web.vodafone.de. [109.43.179.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c9377d8sm576665266b.55.2024.05.27.23.48.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 23:48:37 -0700 (PDT)
Message-ID: <8939523c-ce4f-490a-86b4-21c0ba753d4a@redhat.com>
Date: Tue, 28 May 2024 08:48:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] tests/vm: update centos.aarch64 image to 9
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Beraldo Leal <bleal@redhat.com>,
 qemu-s390x@nongnu.org, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Joel Stanley <joel@jms.id.au>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>, Cleber Rosa <crosa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20240521125314.1255403-1-alex.bennee@linaro.org>
 <20240521125314.1255403-4-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240521125314.1255403-4-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: fB6KbYd/n+ko

On 21/05/2024 14.53, Alex Bennée wrote:
> As Centos Stream 8 goes out of support we need to update. To do this
> powertools is replaced by crb and we don't over specify the python3 we
> want.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/vm/centos.aarch64 | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
