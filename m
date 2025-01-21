Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp63521njc;
        Tue, 21 Jan 2025 04:52:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVZspEO4zCKtph0tOv/SOyWCzsBsseaDOL+IyLra1jQbwdEzEahcEKRZryc2k5wbw5C2ya
X-Received: by 2002:ac8:598e:0:b0:466:b29a:9b10 with SMTP id d75a77b69052e-46e12b96638mr224074541cf.42.1737463941045;
        Tue, 21 Jan 2025 04:52:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737463941; cv=none;
        d=google.com; s=arc-20240605;
        b=FQ1auG4VdZu4aGFj9/vEqDwVxA8cvbWZWe6MvKWLx5twLoMB62PdQwHCn7RxA9UDvJ
         CPlnH0MwIdPEQG4FmVpvDN8rfiO5qiqVNRz54n+XYF+8zw5wWLUMRS6mpgSfe0G8KCl+
         xnT48eB/gUGkfXWax6GBFf4/xnqLqyAg2AvHO1TK3btItV0Yyk25w4OVKVbWr8BvQ1Wl
         eR/8wClDya3/oPF6nuEtt/MqPLV5eyUIE19nyReSQdbMaVPpJMCP7aGNwKsiZCHq5SeV
         SYYKub+/0/oZZg7de2Lsp4QjjVFMGYqeRLJS/WPiwlkfdMhbHEQHZykZR1j3l8T5t+NK
         7Rvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=z35EzCDbc+CQYTWls//bFZ6X+OXu42ZALVtSrwU0u+M=;
        fh=5B8tmyE385SKMg6VrB8C5HJ0dzZfresjjDtdKrzf170=;
        b=DysCgB3ONKNGih3dvRos9ZR7mWiNE/5jwIBabc5SVtu80gzqv6yU/sxWjInrNYGtl3
         ordRLG5n+uCyTDZpGrewWXbwNWpIw6itgkKZrpIvbl/xk24t/9IjpgMUp7MJNa9TgNt1
         yvr7UVeOhGgWTK7kc8IH3Ipfx1Om5TeTgWFIqN3xf/24eR1nd6C6NW9R8d5lLPo9OeHg
         qKuh4nQ+Ht6cjTy5+3JnpITzAt0JyouyTIi3stfJQVvYV66JgnBfoXuvk4+Dk+t1gHAu
         wLU75G85DxoVeFE1VQ88Z83kc7Vb9foIY59dQAbzNDeoOkAyjHGLl01utTFJa5BJaT12
         /cvQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GEmWWhvn;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-46e1048b4easi119061171cf.514.2025.01.21.04.52.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 04:52:21 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GEmWWhvn;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737463940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=z35EzCDbc+CQYTWls//bFZ6X+OXu42ZALVtSrwU0u+M=;
	b=GEmWWhvnBmjSiZBcb2kDdsxugcLKg6USv8hNATmQ4RxvLFELx0NsnVmyPKJE3FSAGTVlUz
	fpw+Ta5Fp3MBT+MkiF4uVyvUQ0AKFPUICqYnTJdwo8XTF4ldMxGbqAEGxSuN8cGTry0nkA
	oArTRM9MLDvpHPehdEpqeeYhFKHgyao=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-z9cgatoOPrWcJn4SvWmz2Q-1; Tue, 21 Jan 2025 07:52:19 -0500
X-MC-Unique: z9cgatoOPrWcJn4SvWmz2Q-1
X-Mimecast-MFC-AGG-ID: z9cgatoOPrWcJn4SvWmz2Q
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d8f14fc179so159806746d6.2
        for <alex.bennee@linaro.org>; Tue, 21 Jan 2025 04:52:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737463939; x=1738068739;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z35EzCDbc+CQYTWls//bFZ6X+OXu42ZALVtSrwU0u+M=;
        b=qAa+zA4WftP1mdFAO9HpZayZ9G1L3K0bk7HGmFNiixTrtyQIsysj8ruLfIxOuvgi67
         NQTaYvAw6jpzohzeCIuBeQkCXmeiHHmwREwYahJb1uXMj/l4S2thWWjGE0FPXIJd82JW
         arELLDJZ4MVp70Pe+m6ZCoPkfo7+uQaO6eEW49LFhWU+r6NcsLNnolBcOwgo5Qpkj31u
         6vJ3xv9HRFFQI/ofbspvfiH4F81dNQGVc+Oh7KN5frYFWNDpUQnrBFckM3Vrb8YEVuck
         unnY1XXGqpQGRnYU2cnlLogZCSL8k3Fv9V5Mchxj1kSM0JVmCKMpvtp0XZPpg7rSbM72
         EXaA==
X-Gm-Message-State: AOJu0YwHDCfSGgVbt8n1rQinBwPe5M057FTs5Y2h+8J4fcgygmjEWPlM
	OmZ1gESnvPWWR4YyASV+GgiBrBvY9VzXvHUkCRlhCjcdVtI4/7r8ydjdU2FLf4MTa1kgQkLicI5
	lfoWdAi+QtMl22Rguo+ZUH1adyqgs56nh9kn3a+hv1EUB6G/WnXFNrxm4dvYgqJn6dFhmnpBUvZ
	aQSzi2cd9KHD6RtJN1CdlLqXGfKNWf8ibt0w==
X-Gm-Gg: ASbGncsWyyKynbRjm9qpRtqSgHpuQYVH+SYHtS8m0S3+3zHrpQ3TdU9rAudSroYkI+K
	ULlcbtatqnPQ3mwz3v4D1jL4xuUDcIenfpX70qizZoetbyycZyx0jtGZPHlWD+2HKY/L8Le7Pmc
	D3U6Bf3SWXKNQwk6KOINbgztkybF1Xr+6EzRAugilaBG1tlXfMT377E09uVKMldSsCzf5PbpQY3
	nTMXWHjoH67iMJFfI4sUDBlVfARtjeWnBX07ixMNO6lqpUajrXzvZAD0wfvISw/v8k2Y4E/BzsL
	bDeiM6XgX8ZQr4kYOJAkv36xSw==
X-Received: by 2002:a05:6214:23ce:b0:6d9:3016:d10d with SMTP id 6a1803df08f44-6e1b2230a18mr298634036d6.42.1737463939104;
        Tue, 21 Jan 2025 04:52:19 -0800 (PST)
X-Received: by 2002:a05:6214:23ce:b0:6d9:3016:d10d with SMTP id 6a1803df08f44-6e1b2230a18mr298633656d6.42.1737463938753;
        Tue, 21 Jan 2025 04:52:18 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-48-103.web.vodafone.de. [109.42.48.103])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afcd66c2sm50828556d6.75.2025.01.21.04.52.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 04:52:18 -0800 (PST)
Message-ID: <503fe36f-c0ce-42d7-a08d-21c46b495ab0@redhat.com>
Date: Tue, 21 Jan 2025 13:52:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] tests/qtest: don't step clock at start of npcm7xx
 periodic IRQ test
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20250120210212.3890255-1-alex.bennee@linaro.org>
 <20250120210212.3890255-4-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250120210212.3890255-4-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hN1v2ntPDUKJnPpRK9TMk2FuuzQn77wYg202VvM7VCw_1737463939
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: GgnLS/QKnAo2

On 20/01/2025 22.02, Alex Bennée wrote:
> Until there are timers enabled the semantics of clock_step_next() will
> fail. Since d524441a36 (system/qtest: properly feedback results of
> clock_[step|set]) we will signal a FAIL if time doesn't advance.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/qtest/npcm7xx_timer-test.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/tests/qtest/npcm7xx_timer-test.c b/tests/qtest/npcm7xx_timer-test.c
> index 58f58c2f71..43711049ca 100644
> --- a/tests/qtest/npcm7xx_timer-test.c
> +++ b/tests/qtest/npcm7xx_timer-test.c
> @@ -465,7 +465,6 @@ static void test_periodic_interrupt(gconstpointer test_data)
>       int i;
>   
>       tim_reset(td);
> -    clock_step_next();
>   
>       tim_write_ticr(td, count);
>       tim_write_tcsr(td, CEN | IE | MODE_PERIODIC | PRESCALE(ps));

Reviewed-by: Thomas Huth <thuth@redhat.com>
