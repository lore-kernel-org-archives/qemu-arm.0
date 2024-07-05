Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp1082271njb;
        Fri, 5 Jul 2024 01:49:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJUwNnYwnoVrxlO+kloEriob9vKzujPhkwUREzjR7pdZbeRExYMWA/f3RAmFrXVMD0Gg4u
X-Received: by 2002:ac8:7c49:0:b0:440:6ccb:e6d5 with SMTP id d75a77b69052e-447cbf627e5mr50123921cf.51.1720169395543;
        Fri, 05 Jul 2024 01:49:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720169395; cv=none;
        d=google.com; s=arc-20160816;
        b=OLjEUJ2/2xMpEMRuFUEBsAXtwCVlX91baWTP6oVUsnx1w2TpElun5DDfNLzhWKy2XR
         4zaJvExb5FRYBh7qCZStZ9GCXu/QZqbtHB7dZl/gGv5b+ukY5Jq94sNJCNs6eQrFyrcP
         cE/iXQAx71bMq/DCQiAUuLH04ZdND4KJjdAnZaaWm0HtwVBAmYJKlB6hMc+St9iQeT30
         3BzPc3RzP9I4bUhqQCsgrQXxZuMhCrlIw4aKZPrxOI1+kqohJVO+k2PLjyHTSlPE533h
         0PB3nSNs9QuaUH/1KJ4su8rOXfvACQ0uliCh8ZowriC4wCEN+Uw5T6M2DRT4A1yyoKtd
         jfGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=Cq/LcjCoVNIWAkM0BEIHWSnVUYNh3T87zEFophLl86M=;
        fh=mnOs2RJLMoKnAc7ly+Yvvn+LhLNvC0330PC9KFQ0HqE=;
        b=qClPyP0U4Iq4CarERc2fF9Mdpw1Z6H8sBMZ9grR7V0Sk/kxD9OySybN9TRVRpeyj+/
         ThWc/6ueqDk3f4+Tm0OPoMoJj1dY5Xo5k5NYh3zOfv5S1zzWd6ifqRn+nx90pZHeayqd
         zQhWD0oPYvs0HNFiN+cLz+xtKipKuP+vYIngUH6urG+Ozt9JYvPQbNLKp4hRgzPLPfgv
         7m0il0KGhZnuA2DgxlJMEFTsdeXDoTX39dk7FGP/6dsB9p7g/Nz3SNZnPd/1tsKqhIDD
         xZDpr2KQD2C/oVKHL2D1MLIA4FOxMj6WFWrxC4gGObAbGJqhQT4cJ1cwAXilbFyunX/J
         SViQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XyFmCzqO;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-44651485f40si167565381cf.367.2024.07.05.01.49.55
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 01:49:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XyFmCzqO;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720169395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Cq/LcjCoVNIWAkM0BEIHWSnVUYNh3T87zEFophLl86M=;
	b=XyFmCzqOuI1OfD6itymTVrUSO6Fjr58IoCfRzl0Ax4DiUh8rub4gEdLRfKSpCIt8GKuDc5
	RJHNRQ0mbh+msWeWToy3Uer+GjO2RFc1TyvfNr5U/lwbX5aOWPas2+7yoQaRklXdAfBwmg
	rtR6w4p0h0aqACs9WTCgJjgxTBvi+fA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-q1W5tvBlPCW7ow3nzVJXLg-1; Fri, 05 Jul 2024 04:49:53 -0400
X-MC-Unique: q1W5tvBlPCW7ow3nzVJXLg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-36793373454so1003173f8f.1
        for <alex.bennee@linaro.org>; Fri, 05 Jul 2024 01:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720169392; x=1720774192;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cq/LcjCoVNIWAkM0BEIHWSnVUYNh3T87zEFophLl86M=;
        b=DBtLRTtmay5dA2Wq7Xafj7DUXfeVSE+61tz895ShzNNoWXqAi+cOQkkBuARrGEG6QD
         LOIP8rKvT4ALuTb4IYB5dVkzIJOBPnekcHOAMamzuUW/6WDOoLtzTtgbO91aiG3qa9Rc
         h/SugzUENIw4VU4Ye12kkU1gIGoTWjvQnLRgt+wma6eN4HI1aVTOeSaIcE7jfizavIYB
         qLaZfUNzD23QuA++JvPvI7C8hk2UlNZK/9E6lElFAmKTaDjZg+yoO/z8NHJr39niNRHv
         atA9345OyPgiMpo/ZDqbBiO715B+I2wdxLkAbo998qtQAdt3tbxSW9BZ+wR//LVUU+uo
         Nipg==
X-Gm-Message-State: AOJu0YwwVbjbkB4WhrmBS99bMpuQoVGRvuv3XYsBfSqHBVr3Vsu/Czna
	kF2IFFkHD8T2mMSK46jVwwhDkagtbYwGJpsEr9Q6DmBwWg2jCxeSo4k3vFXOvM36MFZTpWRt69z
	lWRLt9xDFNMSOTKhihvsDsbb/rriUkgI5/WCOQkHmNnqy9DAfYVkNDHfgGVwTWmNxWIGM7A2Y2w
	Z0pxmaIUl62RpAfD+Fm8I5rDfHzMX3Dq8oOA==
X-Received: by 2002:a05:6000:b85:b0:35f:fa0:cf82 with SMTP id ffacd0b85a97d-3679dd73dc8mr2674666f8f.68.1720169392762;
        Fri, 05 Jul 2024 01:49:52 -0700 (PDT)
X-Received: by 2002:a05:6000:b85:b0:35f:fa0:cf82 with SMTP id ffacd0b85a97d-3679dd73dc8mr2674635f8f.68.1720169392313;
        Fri, 05 Jul 2024 01:49:52 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.4] (ip-109-42-179-211.web.vodafone.de. [109.42.179.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3678a648dd3sm8347393f8f.89.2024.07.05.01.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 01:49:51 -0700 (PDT)
Message-ID: <c000cb60-ee26-40cd-9b2d-459c9200a675@redhat.com>
Date: Fri, 5 Jul 2024 10:49:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/40] gitlab: don't bother with KVM for TCI builds
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
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
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240705084047.857176-21-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 7aAdp9RlGTHS

On 05/07/2024 10.40, Alex Bennée wrote:
> In fact any other accelerator would be pointless as the point is to
> exercise the TCI accelerator anyway.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/buildtest.yml   | 2 +-
>   .gitlab-ci.d/crossbuilds.yml | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

