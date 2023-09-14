Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp626772ejb;
        Thu, 14 Sep 2023 09:07:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzy6WDo8dn3RA+cwiP2KvPHp5EvnFYAr8G9YM2wfJkTwSA4XuNSio+1Wk9zJoZ5DV1I8+b
X-Received: by 2002:a2e:88d8:0:b0:2bc:e2fb:4c8b with SMTP id a24-20020a2e88d8000000b002bce2fb4c8bmr5712365ljk.38.1694707672184;
        Thu, 14 Sep 2023 09:07:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694707672; cv=none;
        d=google.com; s=arc-20160816;
        b=zaxguCKEtZGiWWZwAl1LB622Ev4wbrwh0P6B9fNaGgurEkXMUB8/UIKZJ9T/Z6Mas0
         +J7EYB4reOTjU7rALvadQxih4+Z16CLmdcSlFP/eMGTBQMdJ7wkMPRhxSeP91l4V2dXO
         wh4muBP8E88uy03KdtJ+f8kc58KdAJAEgCywQXzJwmdgJjSAVQLHw1PjcBAWOMhkEvB3
         me402kNxRVM4iA9dOZuGtrwl5swpn5HZd6PcySGaJrJ/hs+4NcCwMYCoBGHq90Gm94vS
         ZH+GyJAZWjD5lb/up/WyWTaiodC/q9GzQxcwvUIuZh2snzPXRJ+3v8aeSgz+ldvKAvyn
         s09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Az8ZxPLm0rmkC1LTrowXFJYbH4Umkg0WKL0/WVd4X9A=;
        fh=VWwRjF1mPJFQ+Gjn4Pw3tyjgI+BVToY363u4XklkreM=;
        b=gWS3WLYCrcHpzPN53GST1MpPeehKo1W2dOa4d9+eWrToCklUz2pWWLJ8F98k1zRuas
         6/MtDZPaycFZ+tggYwRxN0lFiGl8RvMcIhV83X5FOCytU20SfqMHZIjmJvi7x8mFzxJX
         6QbxtoToEr3uu+gJZL0Ubr0h5m5sCmZ7Y2iM484OSsnOIbP/3t1jA1/sj5II5SGbtFqZ
         bhCnv0BkvEyUozVJCG3arfqIurn/1pLgDCl3kK/6ibb8akcup0fHg21QxvCtpUaMI0uk
         4yRerjTUU8/d1Fv0UzUm52CP5I1n7vavu4aNWzG5H0EGmFOWu6vhaf4zOI7Zkas6GoIU
         ugWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Z1G/2pfb";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d9-20020a1709067f0900b00997dbbda750si1522872ejr.839.2023.09.14.09.07.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 09:07:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Z1G/2pfb";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694707671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Az8ZxPLm0rmkC1LTrowXFJYbH4Umkg0WKL0/WVd4X9A=;
	b=Z1G/2pfbQl83KkUPMtJtxntIVSfChXIFDwHZ98uhqDkQkBnRgCMB8hna7CpiIhf+0BFkgW
	iWDE30G1Kt5Gahm+wr+K4DfC8JslMkxgWTG3s3sKiLZqX0wcXjGbuxuT1K6YVeoa5+Yns8
	m4hDu68sniSYueeTSFfMTrj9tARt5qY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-t5eK04kJNoKgySE3YZ4S1w-1; Thu, 14 Sep 2023 12:07:47 -0400
X-MC-Unique: t5eK04kJNoKgySE3YZ4S1w-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-31aef28315eso748660f8f.2
        for <alex.bennee@linaro.org>; Thu, 14 Sep 2023 09:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694707666; x=1695312466;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Az8ZxPLm0rmkC1LTrowXFJYbH4Umkg0WKL0/WVd4X9A=;
        b=X6uUlryHX/hbTgTfE7+vbML5SIB0jE9RUcwd+puX59Ue8ZoUSWlLlkAwMceaAfZ7SQ
         zubbw/uCSnl8pC35kNK/9ECjh29sa5Yuw7UbvZQH+EjLHw+ptJZYqPdpUkqLNuC6lc5h
         bsssIYIfKhtNTGxXo44T6mpqOPfX5seCO2vUX5uq5IP+gNjwPr/pA7uypZzj2LLq03JF
         8G9yi/8CnjroQhyzhBBxx3BDxXUR9g6U7U2y4US85kEt1sFy58NWGcEzy/f/nC8hQJGw
         gSmWJ4QPYlrUvVm4tuvMXeWTkZAypy0uaw9mVMEb8Olb7u/jg6ywQ2/ZMGToj9VFz9gA
         eFpQ==
X-Gm-Message-State: AOJu0YwMYy6IwNEhOBREMz0ow4N+qCdfvpxO+zwJ76rsIY+EIvFfZW12
	r6qbmKqFg/SNn5HrKuHtwcaURAWCBgOaHgStKYIeFnuHe5U4UXBkEEKM1QMtxA2ijw4dMvFy2Jx
	WnDnteLl+EifIjr0sbk/oGNMsDy9gdl1zlBZPRxzF8bAj+VAws81j+AbFE1bmab00oR+poZcTgw
	I=
X-Received: by 2002:a5d:680c:0:b0:31a:ed75:75d9 with SMTP id w12-20020a5d680c000000b0031aed7575d9mr4997334wru.16.1694707666681;
        Thu, 14 Sep 2023 09:07:46 -0700 (PDT)
X-Received: by 2002:a5d:680c:0:b0:31a:ed75:75d9 with SMTP id w12-20020a5d680c000000b0031aed7575d9mr4997301wru.16.1694707666310;
        Thu, 14 Sep 2023 09:07:46 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-179-28.web.vodafone.de. [109.43.179.28])
        by smtp.gmail.com with ESMTPSA id r4-20020adfdc84000000b0031753073abcsm2117881wrj.36.2023.09.14.09.07.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 09:07:45 -0700 (PDT)
Message-ID: <9b8cad7b-8daf-caf5-2c4b-b465abee191f@redhat.com>
Date: Thu, 14 Sep 2023 18:07:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/9] gitlab: fix typo/spelling in comments
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20230914155422.426639-1-alex.bennee@linaro.org>
 <20230914155422.426639-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230914155422.426639-3-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: psaQNGKqb6e6

On 14/09/2023 17.54, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/base.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
> index 188a770799..ef173a34e6 100644
> --- a/.gitlab-ci.d/base.yml
> +++ b/.gitlab-ci.d/base.yml
> @@ -68,7 +68,7 @@ variables:
>   
>       #############################################################
>       # Stage 2: fine tune execution of jobs in specific scenarios
> -    # where the catch all logic is inapprorpaite
> +    # where the catch all logic is inappropriate
>       #############################################################
>   
>       # Optional jobs should not be run unless manually triggered

Reviewed-by: Thomas Huth <thuth@redhat.com>
