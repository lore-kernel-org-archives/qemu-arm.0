Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5298696njc;
        Fri, 22 Nov 2024 03:02:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/pUrGoL38r9rCSeiHaLSWW1mz4wkJntK2nxRoBNJ0IuTDaMyOc6itewrqXwUMVgj2XBit
X-Received: by 2002:a05:6214:29c1:b0:6d4:f77:613c with SMTP id 6a1803df08f44-6d450e989f6mr43781036d6.25.1732273339588;
        Fri, 22 Nov 2024 03:02:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732273339; cv=none;
        d=google.com; s=arc-20240605;
        b=G+j9qXclZ/bmeqi0hZWzE2rsMeQ9BMEHYHEhqvYggv8T/dPNPC04kZnJWV2WeealPd
         8GJmrayyYw1QJESIO/X4rInB3qBqz1w56pWFZvoN70G668mY5GZHZ6g19MpXOlwz6gDN
         9j0l30qhMKYj6XHLxMACFTVv8X0SO/IO4YN4M1M1X0NuWUJwTKaR3nAfzTlknGm7DKOR
         cpOMcUOadAxHwpQD9/7vVQkgA9NNn0kzJ5aiFYcqoYg0QqmxQJcRmV0aA1Wtm/09TnBD
         eaLJ5gKsLXoSJ9DJukaDY2lweq+xX4QWuFNh28aj6+1osqOW0oMt3QDrVGy6ToV7eq8I
         RzDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=YM7YcrAr8qbqtddo5psPw3i9urjC4GQ1Z6kigTjsXOg=;
        fh=wyrMqsRQzp9wn+9ic3ETyfTwhE/ffyQObIHI5bvyAZ4=;
        b=Qbj6MbXATTa5ImownCpkZReZqvtkUQL4YVWEeH2Ydpw+QYoeqoFTTpHSmCJDj4udC7
         w48Ncezhdca7fxNVY4kIarRIuCuSoSP/aJJY0/pDHbHegM/fx/Z3crZcfG1ugz8qE+Jy
         b+iq+DJF9B/uXiWUdeAWDBtVkgpGojSDCRjmy7TFHXlvN6QI+sEgwpILZ6biMsNj56lm
         BMKl6LyNO/Sb1hMsOGioW8+D7yMBkp1Bn+knRZNKqMLcnkyNcOjdLKAnnjlgiMG8lwpn
         7dD7IvRX88rSV/CWv3QaA3nnrNxUk2j/gk2ZJFrbTDXWKB/GyfcDjFpAXaTOVtqSDTp5
         TZMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QiKQjpXD;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d451a9977esi18229566d6.129.2024.11.22.03.02.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 03:02:19 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QiKQjpXD;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732273339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YM7YcrAr8qbqtddo5psPw3i9urjC4GQ1Z6kigTjsXOg=;
	b=QiKQjpXDID7Yy23iHydD4b9VhQrvMrsOu6bCXAMvxfAQTa9/uW4uh7SJ+N+1kTc9bMQT1N
	RBTvsNcTMYN12JDYV6qDY9l11tMAHq9fP+xMJxEmBW6Unp/p4bOlSPMNGOg/BLHrs5agH+
	49BOc09eyQwjbYtVYglRvS+Dr3B1Sp8=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-Vy8pFPFoPEaTNJx6q_Ekeg-1; Fri, 22 Nov 2024 06:02:18 -0500
X-MC-Unique: Vy8pFPFoPEaTNJx6q_Ekeg-1
X-Mimecast-MFC-AGG-ID: Vy8pFPFoPEaTNJx6q_Ekeg
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-53dd6caa49bso319491e87.1
        for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 03:02:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732273336; x=1732878136;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YM7YcrAr8qbqtddo5psPw3i9urjC4GQ1Z6kigTjsXOg=;
        b=gMiuhheVb+M549oKu9brQP830BLwGsIq+SOwg/Yl7OQY5SxrYIjKkOKdSgi08L1g0w
         e9DDsKqxIQ4W5Drlylq/kz4y4lii5RNP+fkvN5Qq3ukeRHeDs4aEJTNoqy2VVrulqsEI
         GdE4HW5Gh9JpHvt5md+jEH6FV8oMPwuyks8ARnUvfs3lwPjtLqrlXZOuIbrmVDdGMOOW
         L/snEG1j08uH+zP+1HosaR/W57dVsxuRSVRB6IHwoNzAI8Egx4vY1kEmuDPhLFkAFDW4
         L8M5xpHkxsy6LtHddpCtg0uewe4naAXbRwspDNTmIRyluGal2vvFFPvwgqegIPC2Jh5y
         m+gg==
X-Gm-Message-State: AOJu0YzzZPbBcQuTs2TB3TPaGLDW68RJQwpOpmU9iloz6dGXzQn1DLb8
	7egupZxqNUk79NZ6/tD17oG5z5IF3XHiRYW8WOAbun6s4AfN55pRQBsyqDp70gE7uEIEs/BAEsB
	7pT88ryK0L+NjUADafG//wMkqB4enlgGQsE4SoHaVglD4aTc9Tifd4pB8a7EWL371hLwmAGRuXF
	8WoEPCY9rpR6njwXmiFrznhJ4WHG1+fCSyUe/O
X-Gm-Gg: ASbGnctgThU7JL+JNoSMytje4cictUuJ+3VONHq5Pie96cwTgfJ2dH1QmrQClVy/ZBB
	9UpCGXOvKLzcqZbrj7ya+aEoM/0NK4R99/XECyizBrMeQzw6yH5nH9EVCnoboMJVB+ukgfNFEHQ
	DZ0gD2C94LKIMrjX33edhXE4Yp8hfzWXf0Z+TAbd2Xn5YVZEuZ4JCFMUHZJJNa+nPleKQJvEBzu
	0Wd1RFvC2bXoYXsTo5ySZ/aKp7N2ZUevYEJ2nlqSmM3EHiYr33YlQGFBMK8Nyoh6tFefepLW20=
X-Received: by 2002:a05:6512:3996:b0:539:8d67:1b1b with SMTP id 2adb3069b0e04-53dd389d818mr792086e87.26.1732273336438;
        Fri, 22 Nov 2024 03:02:16 -0800 (PST)
X-Received: by 2002:a05:6512:3996:b0:539:8d67:1b1b with SMTP id 2adb3069b0e04-53dd389d818mr792024e87.26.1732273335929;
        Fri, 22 Nov 2024 03:02:15 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.206] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fb271ffsm2071321f8f.53.2024.11.22.03.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 03:02:15 -0800 (PST)
Message-ID: <53996cf0-0646-48e0-a32f-5cb9035bdf73@redhat.com>
Date: Fri, 22 Nov 2024 12:02:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 31/39] tests/functional: update the riscv64 tuxrun tests
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-s390x@nongnu.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anders Roxell <anders.roxell@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
 <20241121165806.476008-32-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241121165806.476008-32-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8ogmnJRcNkM12W3l4L8TwXdKanBxINQdxEUIr-gvslU_1732273336
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ySc/wSC1f/l0

On 21/11/2024 17.57, Alex Bennée wrote:
> Now there are new upto date images available we should update to them.
> Note we re-use the riscv32 kernel and rootfs for test_riscv64_rv32.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> ---
>   tests/functional/test_riscv64_tuxrun.py | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
