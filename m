Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3844323njb;
        Tue, 10 Dec 2024 22:30:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7eEgZZVBu6ttBEhjRZCVE/7tfKjZRh+6b/1dLQbYBekzigYAShUWQsGUWyOgTfYGXe7mr
X-Received: by 2002:a05:622a:59cb:b0:467:714e:a528 with SMTP id d75a77b69052e-467893c7c70mr40191681cf.55.1733898637353;
        Tue, 10 Dec 2024 22:30:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733898637; cv=none;
        d=google.com; s=arc-20240605;
        b=BvQ2s+0pND/NbOSpEdyt5K08w/2EmOMoqU1TF3AGc2cWifMzXssWqMtCapbKBhh/8T
         kZkUCI0udFVwFloDH1fMEl6+LBCwx8fGQilg33msBOkr/KULloyRY/AhQMFWQkEgwukc
         MXoP1jYkLias7RLeuKQ/A7Hhge/2TE6HPpDaxETyU7f+LNlB09tfwjBs3A6z1pwbxI2d
         kz6qnTKnyiHsDeLB3BaeE268npdoJVYQXOausYeAdt2gd/iMv4pXN0SdwVp4aGvzngih
         Ko9IlOtrkXml4RKcNuGAwTVfhL6nQvDlFLNI7g9AISfMxZL8uRVJB/67Rz1Qmpfy/SDK
         OBEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=r5GSAKFbBBSBcZksOXr57jnCAJgAtBFnJGf6Qimeg6o=;
        fh=PyRPp6p7Zb4yzib6tbXvkfdudwkdHT8PPxsBOu3pTV0=;
        b=l3ZtJwVDCNaInL6tVHXTRxnJI/FiFYzggw5P0hZ5vJ6Xj/1a5cAuhJHdSFf67y9iU/
         xkm9Gkukk+734iylsvHcYOnY+YF4QOGr14uaVmkzi2rqVKmmFBolG8BcpvX3KGPCkdHw
         /eYz8dASXoZwlWfNao032/A9mERWhdb9M1GO/doLwYC7wALjf6d3656V+v58rQ2E6hjA
         QH+c35hx0v10cCr7faX/p8k2wgoIT22DPcuxnFJmfglsg22RbtP8zdaFCkYFfqoAxGoD
         cQHPOYm5JFFQM9LukCWqlGujXTjFNCU4xJOM3d56RzI1tE+rpgBY/1Jw1WOCaK+NWjmX
         oITQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TCV3+m9L;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-46784fc1c9dsi27447111cf.550.2024.12.10.22.30.37
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 22:30:37 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TCV3+m9L;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733898637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=r5GSAKFbBBSBcZksOXr57jnCAJgAtBFnJGf6Qimeg6o=;
	b=TCV3+m9L6suMXNSRZeszduMhsBv5APrWUwdJh351F4u9Lh+gg5m0jhHihDNmHsCLFJLTta
	GkrMm1Bz1i0aTaDgXxV6v34mZj7ilcjgxYXofL+NUi/lCAuyJ1LknHmiYCxRm9JdkX4RgT
	Kzx2GZrZ0bh8TNLUo4dyKQbqLBnZ4hI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-jaoxJiBnO3GmbPkdpBNl2g-1; Wed, 11 Dec 2024 01:30:35 -0500
X-MC-Unique: jaoxJiBnO3GmbPkdpBNl2g-1
X-Mimecast-MFC-AGG-ID: jaoxJiBnO3GmbPkdpBNl2g
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-aa691c09772so256644466b.1
        for <alex.bennee@linaro.org>; Tue, 10 Dec 2024 22:30:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733898635; x=1734503435;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5GSAKFbBBSBcZksOXr57jnCAJgAtBFnJGf6Qimeg6o=;
        b=Umf1HnUDeiFvPwNESxbIafr+jHRVSUuUFDokXQJZa3k1Bf4Z9XjpETgYUQi0Ta6m1y
         8y534qJZqw6zHYjoDZykwpFYNsyKwqFJxSQBZ8eAweA1/vVD8jl0Uy0QdB6YZLxjMQmr
         7aYS0fKOS6vPOUWR5tmAdeJdlTChXwhrXHbKKp9xlzlVQ2yarAviQkp75PIlfO5HvZLx
         q1W8h0rawuddMINBbhVOLy4+PmgRsK05kWzSeokNyizDef/FpCfMGWwqQO3VnG03VzoP
         TA4DXfxO0CMXTJrleWQxtWwnVubqMYAVOO0aASXtHQrPm1yGeouBdf152E8YTc2F19x1
         ne/w==
X-Gm-Message-State: AOJu0Yw7+aPecGrcp5D4XqlroM1myr3woheqkpKi1vKDyb0ugt69ltU5
	gohRIy2czB5py41Ip6KCdjIgnSLAXg4zcCe4720nMQRb78HrAv9X2VnMCfOBU9NIFKW7goR9Vht
	Wgq0Aqm7qZTR3U2UoAOV5pguoHd26u3cmYzfCZm3kQyspPquiGdyZm8SWxOw081Z74WzvIVMP+z
	k0szMupiKci7I3wr3hw5HbbqKJ64YidMwcpw==
X-Gm-Gg: ASbGncuIwQNmX8VIliCs431Hrf5wnaDg7FW+IVsKc6yysMFjFVelVq13dg72E9tM/Bu
	Ty4p6hcg18SiWpteOBbIDlacih9+N6tUUUmayqlx2hmpnhOSpp1naH23FygkzO2xax9k42YS+UW
	6d8V8nKjljYrR1JyteiB6onNVb3Snsb/+1wyPYtHZ50WWpJC4+sGhXnDHAsscutAHR8guZbXVzj
	9mkG9AOrj3YJozA4OEVhREw5y/5NJgAz7Rqpt9VeEcoWGvTPNpRxgYpY89RtvfJoueMDYbOgUub
	8BUdRQc=
X-Received: by 2002:a17:907:3a0f:b0:aa6:a732:212b with SMTP id a640c23a62f3a-aa6b13db76dmr135585866b.58.1733898634748;
        Tue, 10 Dec 2024 22:30:34 -0800 (PST)
X-Received: by 2002:a17:907:3a0f:b0:aa6:a732:212b with SMTP id a640c23a62f3a-aa6b13db76dmr135579966b.58.1733898634178;
        Tue, 10 Dec 2024 22:30:34 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.6] (ip-109-42-51-17.web.vodafone.de. [109.42.51.17])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa698e922dasm308819466b.84.2024.12.10.22.30.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 22:30:33 -0800 (PST)
Message-ID: <445d6cd9-effe-43aa-8450-d2c40fca51ea@redhat.com>
Date: Wed, 11 Dec 2024 07:30:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/20] util/qemu-timer: fix indentation
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-s390x@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Eric Farman
 <farman@linux.ibm.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Bernhard Beschow <shentey@gmail.com>,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Markus Armbruster <armbru@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20241210204349.723590-1-alex.bennee@linaro.org>
 <20241210204349.723590-17-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241210204349.723590-17-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AOWphhSPmW4xZ_LUstpIL1eaOAsJBe9NmjBqrTzp9U8_1733898635
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 5PeXS8NY4WY4

On 10/12/2024 21.43, Alex Bennée wrote:
> Purely cosmetic.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   util/qemu-timer.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/util/qemu-timer.c b/util/qemu-timer.c
> index ffe9a3c5c1..7b71655416 100644
> --- a/util/qemu-timer.c
> +++ b/util/qemu-timer.c
> @@ -680,7 +680,7 @@ int64_t qemu_clock_advance_virtual_time(int64_t dest)
>       aio_context = qemu_get_aio_context();
>   
>       deadline = qemu_clock_deadline_ns_all(QEMU_CLOCK_VIRTUAL,
> -                                                      QEMU_TIMER_ATTR_ALL);
> +                                          QEMU_TIMER_ATTR_ALL);
>       /*
>        * A deadline of < 0 indicates this timer is not enabled, so we
>        * won't get far trying to run it forward.

Reviewed-by: Thomas Huth <thuth@redhat.com>
