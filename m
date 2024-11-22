Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5275293njc;
        Fri, 22 Nov 2024 02:09:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmD723ZqLdRdSqJO0PsJ+HXia3WovzWgKdhaLmVI8ddt57rX0y0G+qUU4AoGO505JO3ML4
X-Received: by 2002:a05:620a:801a:b0:7a9:a9be:2fc4 with SMTP id af79cd13be357-7b51442328emr450020585a.29.1732270158819;
        Fri, 22 Nov 2024 02:09:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732270158; cv=none;
        d=google.com; s=arc-20240605;
        b=J9rDrtCvBsciEdj/sJnKq+N2fVFuYoKQPYha7vCDcamvqPyITHPRKrSrOcEtTYMwVh
         fcg57pGWj9GjrACIA08V0zYgJqITZsH+tMYfSKunHC914IKmAQt563XGxXJjY7OKgRGt
         Dt8IijVT/OqTARLOJw6M3SmAx14XrPzT7BTzUAHG6ZC+60XFxkKh8zJKFAubX2D0+TPK
         PHEOlOmBKjnX+/vS3/LXQYOVctItw72k/CbC0QmCCBWFZGt3RkkWYnF/ycB8x0M1vRJb
         hz23t8e1O6liF+pxAX1R7ViTvUyPx/+e8Zm4p8z36t8dG5HwyVJkEYJYlVw2dFJKYfU4
         eIhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=6kHddsQx8oufaYkPJRlAqgHi525eMKsmijnHN8eVHcU=;
        fh=wyrMqsRQzp9wn+9ic3ETyfTwhE/ffyQObIHI5bvyAZ4=;
        b=EB9LOYv/ep13M2nYF3y/fNnKi+hb38yGkpE+RGwPVA0jlurXa0tBM0BdVZ4MtRxR2A
         80einV+FBdTemdwB7VxkBc3WPN9+OxQd90nHy75hhNBzHIlIoak5MecXa8Dbi2ndIp7d
         vy3Uwx9PfGucqYawZz8gOQcpgd4c6k1XJ2ZqcY2lN4grNMuq8n9blp1nnbmrwn2AJZfN
         BXmZY6KntBi2Ju0sd1UupDcmplJZw9WIajiQHG8Vo3HyjYFXKTIAT9md/Ed6WnISbJQQ
         VTaqzIaKRHkgpHlohrl+oiktYIt37gdrkx4cBVYBysEM+DXnWhHhTBScwpFKTBQjT4am
         tYsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TxCsVAQD;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b514041702si179466185a.233.2024.11.22.02.09.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 02:09:18 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TxCsVAQD;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732270158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6kHddsQx8oufaYkPJRlAqgHi525eMKsmijnHN8eVHcU=;
	b=TxCsVAQDaen8YqSFPE1CoDUixcQdyBffIjpWKalCBQtSg+2ogUQpBJg+w31QFTXQkK6tY9
	1kIeS1Uv8gtlB2rn4UNqgEmLvuD5bUNmmyAdO8j1PpDEDP6eZ/2JcdzbQUHpNi/yeLo/9x
	X4dRpzVmwfkMnEMT40YOPYH75AJqgeg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-1QndjL7cMv-79IxRfl2B4w-1; Fri, 22 Nov 2024 05:09:17 -0500
X-MC-Unique: 1QndjL7cMv-79IxRfl2B4w-1
X-Mimecast-MFC-AGG-ID: 1QndjL7cMv-79IxRfl2B4w
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4314c6ca114so13323305e9.1
        for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 02:09:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732270156; x=1732874956;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6kHddsQx8oufaYkPJRlAqgHi525eMKsmijnHN8eVHcU=;
        b=sRtIdoCD3PS1p4bQ1fb+1htveXZH+0oEwv8Klag4BLrw3qMUb0mbIRjcApL8Q/QDmF
         7O6lYUm/iitmrumPK3uZu0ZdKX1Nq/BzkDWBha0zYfj8v/PF9TXGGCS+QsyK2Npq16di
         69IdN7AGodUY3hLO9HPFX0hk3xB2KaWb/d9Nhdeq+OoZNEeKcyQAUBo4h7Es5hg9UxTw
         DDCWaNt/XgThlw0/Nimm/qLNzV499bQ2cM3fVrKgkHJcdPtTDzHhaFaWvYy9v98BZMdy
         tj+oeIsZYF/6FhuQeGWkli4nEFb6074vwZ2S900bENzhAbJqgcBTRBRuomIF/hxiJwPF
         wKtQ==
X-Gm-Message-State: AOJu0Yxm5zSPppNHztwiqvTwPoQWc1IPHmFVgPFPMoBhJf7O07Ew8zsr
	W99iIKwC4XCRac9zty0tUJvLUDPzCWpHzrfIeTeCUFtbQ0Qi2COH6K6p4+v/6uzQh9odW88iMvd
	52/5Q+GmdRWrkW89ihCf/+Hfuot7YvFVT4e2Fn63kdncGtMb1ZpN707JTOYVLjHpyNfsv40mXuE
	SJSsbq+WkW7ZQpHbtHTcoxnTPEjyzVqgeCjA==
X-Gm-Gg: ASbGncseKoArjuqU5tgBDpNCYNQmehw3Pw22pr2zox8uM695wrPrcivoT6B/9UPW7L+
	1YggI6ae2AReRnEfv1shphLnRStgp4DqHRjvWKVsTvS4eMO888b5Sz4N+xWzGpECc1AmsG3t4eN
	0KBWVxcZpbQb1bpflgil0WQIPBqjGlTdc4U+eQNTRi4eelFg0Zf7g5F2I+cr+/aQwH2xIwHr18X
	j41VqMRXE/6sH4p/Bfqwj5RlrOtPGQ89YULQjs4RFJKFcljBaeXZHyZDqFzKLC7ZuS/ipC74T8=
X-Received: by 2002:a05:600c:a01:b0:42c:b9c7:f54b with SMTP id 5b1f17b1804b1-433ce427070mr20591475e9.16.1732270156255;
        Fri, 22 Nov 2024 02:09:16 -0800 (PST)
X-Received: by 2002:a05:600c:a01:b0:42c:b9c7:f54b with SMTP id 5b1f17b1804b1-433ce427070mr20590665e9.16.1732270155510;
        Fri, 22 Nov 2024 02:09:15 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.206] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b45bdb61sm85280225e9.16.2024.11.22.02.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 02:09:15 -0800 (PST)
Message-ID: <193e0a8a-dfb8-42c9-886c-ea4153ed985a@redhat.com>
Date: Fri, 22 Nov 2024 11:09:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/39] tests/functional: update the mips32el tuxrun tests
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
 <20241121165806.476008-26-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241121165806.476008-26-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6YIin4hsqCe-vJ57Onz6sXm3gaiHw5aJCgIEKqcBri0_1732270156
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: VtGSc/Ln2wi8

On 21/11/2024 17.57, Alex Bennée wrote:
> Now there are new upto date images available we should update to them.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> ---
>   tests/functional/test_mipsel_tuxrun.py | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
