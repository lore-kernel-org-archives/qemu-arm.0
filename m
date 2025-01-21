Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp6458175njn;
        Mon, 20 Jan 2025 21:13:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJfdpY4Wf1Hm50aI+aG4attPAQF/NfuY5+lvIU7gWYsEsTLA/mtbl5tQo19deuGqhjIxcM
X-Received: by 2002:a05:620a:4252:b0:7b6:de8e:da3e with SMTP id af79cd13be357-7be6320be40mr2179897185a.29.1737436394198;
        Mon, 20 Jan 2025 21:13:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737436394; cv=none;
        d=google.com; s=arc-20240605;
        b=bS0tgOcH6LGZSGkPnsWEjp8Oe26Nmi9IAwKa6yA+/XtMeXz406GITJryD3pJzSSiY8
         vbTYkUF3yIFtj3ercGiFmIcH9Km8QbrSu1GqF9FAXctGWF2D6Yc3RNBb+zNrLrZ+xbrE
         LKmdPU5tZAHCE3SfS/qz86YIcnrpiQwB8gR3OkPbMWKi6B7ZQGcgwo0PURa8j9UWbNtj
         rnqv0ZGmPSKzlODzL3sR7Z87+yobQpJo+AD7Pndr7DFznXSwlXx/Ek2PMtMbrcAOHwxT
         Cj9THGy/8uVRxzvmVaXrN7hUfWPWOkdaaLl57qv48ggFiS1DmImmx3AEz5WcwipmUBVh
         cmsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=tKC+SeEpf7IiVik/xx0QVRCDFJzXzDGXbp/OCRGsgnc=;
        fh=i/cErnWL9rYpzNo1oQkTpKRGHy1msIqC1i4m6bd3DLo=;
        b=ggmAA976u/UWINyOj2eQi9VY7VCrkiwCxQeDWNXmrH7CVsgxOpmyYsC5zxU61h3hg7
         hSxICXA0nGsZb7shuVF/xkZf8TJXhSy1tv9cKBK0VQbxEuEkFXMiH02eWSOhvyAF9Pk3
         hj9yFQ4fDVWB1FuGqH4ioJ4T2YEoEacgKDBVspL89grXIXtttNNecOx3kBfTdVgtUxJt
         iu5mT4UjWzrTBe3QGXaGD/UWilOhbCyPxFpdlGQ4zxgbJxjPXBtB2C/ggDLFNbcoBWQb
         SdxsBVBq0/2nmwNPtc5NuV/LbH/vZGo/pXiKATspkVTTA6yK4BEfXALqgjRZuAiiNOPp
         /4LA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JXDU977t;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7be61477780si1190107185a.150.2025.01.20.21.13.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 21:13:14 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JXDU977t;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737436393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tKC+SeEpf7IiVik/xx0QVRCDFJzXzDGXbp/OCRGsgnc=;
	b=JXDU977tD7bGQbyn1NLhUg9eNLqsf35tOgs0I70BrXyAKzddLfOH4Rtcq0i/8e0HsnVlO1
	Fi4A1gTagOkn2q8VqVaD4irSZqORPQbjsnsQAAuthTrBu5YEEZXRIVEGWPhTQpp9NKwaCn
	GuyohYOko/gtuc+lDVJDNxG+AwbDOrA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-iTuKiyrXNBS36t8ur3SM1A-1; Tue, 21 Jan 2025 00:13:12 -0500
X-MC-Unique: iTuKiyrXNBS36t8ur3SM1A-1
X-Mimecast-MFC-AGG-ID: iTuKiyrXNBS36t8ur3SM1A
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-385d80576abso3629811f8f.3
        for <alex.bennee@linaro.org>; Mon, 20 Jan 2025 21:13:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737436391; x=1738041191;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKC+SeEpf7IiVik/xx0QVRCDFJzXzDGXbp/OCRGsgnc=;
        b=OlzTKfTRAPyqkqtsaglal2otvv7t68Pf4q8tfQD0OYB8qOtt6xaUAw9/5P1SnZ5yzR
         qF8DeS1z2jLttzgLPEa6eA7NSKSyp9MEFuQNmFLqMf8e+xcimKIyKmsMzJF3ULzAcg/s
         gwJzwLiS0yUp3BlDOM2pXgNdE9I9XyEgzOTwO9/8q6NU8Ooolzk0ICtakVgqQEqg2qa8
         aQHYYJP+I0sA3r9u7aSjhcEDcuXcdSTyiRazPo2gi9GUu0QVJzLa8qSdnutjJy2Pc4M5
         nQ4LdCtHp1S/4Df15eSX+LIoCwCa9GsJR5Dut9l8Wl4MCQu+MxsQTYeAYfAlGLQLjM/G
         AAcg==
X-Gm-Message-State: AOJu0YwgUUQ3Y3Kb70X0uuKlaDVb9HwzmcHSoCQs6ybZJ/Vgs5sp4qkJ
	7iOOBrrdCg20vlTGpFwmkeAsbDKaoDfAoJ9fE7gIPVzte0HPfkn1deu+euL4dOQEKGbzVVANP+l
	uZ9J7IFEneK2A5hGxIS7yg8E+ETDHdVQesh48etXKSW6xhsh+gitnoqDvRrNTWFwGAebdZuugBk
	vluy33FglvCse3GP/E0XwIJ9xfXnI9U1zEyQ==
X-Gm-Gg: ASbGncvAM/kMp0O20MIxBAZnXTMXERZmP2q+ieR/pvSDyFFsRyNzEcrAEJu1XwQGmbX
	1QzRWUy54gXYHaDgm7njDcxSJVEGavEb9ZPnlF7PZNTw685Y+5pX8+p6G3snt7up1+qvw7sVzY1
	uWyZvLVvq4+MwGLaihvbxMX76xJXwkYkUU9EG+FKTKkYzY/QL9k/WYgtkQwysG3hTCaVsPO5n1v
	IU2J3J5+W8s0TY0VwThNEAle89NMNuz3vmcnbn89hWy7Kn2/KL9EJzPh1A0+fniSrXOimGz9ey6
	2uBtmPgsgZx9YAyx+IU/vw9HYg==
X-Received: by 2002:a5d:59a3:0:b0:382:4b9a:f51f with SMTP id ffacd0b85a97d-38bf57bd650mr14251320f8f.47.1737436390805;
        Mon, 20 Jan 2025 21:13:10 -0800 (PST)
X-Received: by 2002:a5d:59a3:0:b0:382:4b9a:f51f with SMTP id ffacd0b85a97d-38bf57bd650mr14251301f8f.47.1737436390458;
        Mon, 20 Jan 2025 21:13:10 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-48-103.web.vodafone.de. [109.42.48.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3275562sm12520214f8f.66.2025.01.20.21.13.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 21:13:10 -0800 (PST)
Message-ID: <e7769309-6339-435b-ad30-e56c18679892@redhat.com>
Date: Tue, 21 Jan 2025 06:13:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] tests/qtest: don't attempt to clock_step while
 waiting for virtio ISR
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20250120210212.3890255-1-alex.bennee@linaro.org>
 <20250120210212.3890255-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250120210212.3890255-3-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y_QmsoiHv8kWBKGn3y_ytp5ldP4PzyLb-qVqPLoN-70_1737436391
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: HhADPwdFhyBx

On 20/01/2025 22.02, Alex Bennée wrote:
> This replicates the changes from 92cb8f8bf6 (tests/qtest: remove
> clock_steps from virtio tests) as there are no timers in the virtio
> code. We still busy wait and timeout though.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/qtest/libqos/virtio-pci-modern.c | 6 ++----
>   tests/qtest/libqos/virtio-pci.c        | 6 ++----
>   2 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/qtest/libqos/virtio-pci-modern.c b/tests/qtest/libqos/virtio-pci-modern.c
> index 18d118866f..f6e3e32891 100644
> --- a/tests/qtest/libqos/virtio-pci-modern.c
> +++ b/tests/qtest/libqos/virtio-pci-modern.c
> @@ -173,13 +173,11 @@ static bool get_config_isr_status(QVirtioDevice *d)
>   
>   static void wait_config_isr_status(QVirtioDevice *d, gint64 timeout_us)
>   {
> -    QVirtioPCIDevice *dev = container_of(d, QVirtioPCIDevice, vdev);
>       gint64 start_time = g_get_monotonic_time();
>   
> -    do {
> +    while (!get_config_isr_status(d)) {
>           g_assert(g_get_monotonic_time() - start_time <= timeout_us);
> -        qtest_clock_step(dev->pdev->bus->qts, 100);
> -    } while (!get_config_isr_status(d));
> +    } 

Trailing white space in above line?

Apart from that nit:
Reviewed-by: Thomas Huth <thuth@redhat.com>
