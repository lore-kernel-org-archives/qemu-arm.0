Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp2904692ejc;
        Mon, 14 Aug 2023 00:59:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGz4a3EZZAwz161HJwcxTEIkm2vNUQt7cAtql6XZR9reBa4mfP8npXKThKamK30S/qAdxM5
X-Received: by 2002:a0c:ca92:0:b0:636:afa1:3448 with SMTP id a18-20020a0cca92000000b00636afa13448mr8114342qvk.13.1691999956692;
        Mon, 14 Aug 2023 00:59:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691999956; cv=none;
        d=google.com; s=arc-20160816;
        b=jBFnYI6NgJynONJOiqNMXL3oBTBk+YrB9gzOW1x+rD/KgYqwU3Lgrs/36bn2FeFEnL
         AyesxwtX6smYEvGgktwopVld4mMSg/FPC6OYi9MnPXg7a3b6XymMf/bH7WeyfkIch+rq
         HpAWyZUzdSRYkz8Kgs8m6O1GLVs5gk64v5dThb/oDGytbZMmn+0u5o0WYktF/iA+2hX7
         8G6jAc3/s1hfwLchY8k7LuOwovwktQTHcVWk+nGtu46mkGXa90GaDiFlnsWYRKUJskdP
         O6eRXs+P2UI+D6Fi6tOSUKt4LX3F4G+9nOeN+afnwLJddd+Y82u7vnMfyasUkFU6/96r
         OOUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=j6t9KFibenm2vigzkYJ6LK8kiAtL5HjAZ2G+nYUDeAI=;
        fh=dZxqR4ED3waUSuKsKRDY5kotIieBuuAyHOv/1XQ8jmo=;
        b=uXHy+kP11SVS05NsxP+qIxMvMXVG3k3F3D1LdrRGxcJUlqF7lMaGJlwMB4Pu+0x9wM
         3kjtkCe/TTxlVFhFlG2dMgW3tKofTp8e4WeTtXipPYnI5sEBvblUWlmDRvaLFesH4Pvh
         DDbaMwr9cy8QDNIEKj60I9jKo9s6Mtb/bWEytYHigr3twO2xxos2Q/17XqczIhx6wxcf
         Fs9y5E9Cmipvi4W8Qb5rLVGb8XHMuzklJhk/nAINiOIKGv4LX282prYhd4RQE2vjyYk5
         QmgM4MqFc4lFT8fFgH5CP3a4SFPkYEGiWoBsVRCgeP46JZcje7uTAICKHttulw2DRwhe
         gZkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OeeG0ZdN;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id p14-20020a0ccb8e000000b0064729b85376si140023qvk.131.2023.08.14.00.59.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 00:59:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OeeG0ZdN;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691999956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j6t9KFibenm2vigzkYJ6LK8kiAtL5HjAZ2G+nYUDeAI=;
	b=OeeG0ZdNzkJGIfkwMohZ+H4Tdw+AM2PP0k6a6B3gEUuJAKh2vt/y0FBG5SuNcsnpObrhIa
	zc6FXN4Bn3w3mJd3yQa+YvR1EsfdymCLBve94lhlGkefN7UUgzn4JfCUzfCIZU59OaShLZ
	THCt1DqiQmmxXS6FWZrxcYGmMVFzp5o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-DXFKwT2nO7-WNGeZdjhpLg-1; Mon, 14 Aug 2023 03:59:12 -0400
X-MC-Unique: DXFKwT2nO7-WNGeZdjhpLg-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3196e92c3f6so523577f8f.1
        for <alex.bennee@linaro.org>; Mon, 14 Aug 2023 00:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691999951; x=1692604751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j6t9KFibenm2vigzkYJ6LK8kiAtL5HjAZ2G+nYUDeAI=;
        b=M80meZQbmqZuCufB9Civq96UdrFx/dXvj7l/DMUlbJXJRzaxBAln/dXZMNx+jd3yCP
         Y+0vszoGIeuy5lBDsf5zr7PQR6h/xrdgiYE/0JkG1gSssEFfQLBGX/TfKQINPScXyK6j
         cKAlxM6b/9EkcnFbxtdgszuxiN0ojjmYz2lGbtaFNzxbslPyfGkfLtDDei6TU2c3M0R2
         UksQboUE1jp59v66+YPYel+WaZzsoE1ocApfoZKUH80DYPBfuuCh0sdoTrdZyz82TMUY
         HQZHd8Qy4zTJuNhJouiQkqA7bLtFt6vJazS00xxzusfPv4Tkvi2e4DX34WLK2HBdzzbj
         /Bfw==
X-Gm-Message-State: AOJu0YzaAdcSu7r1ogL1RecmeSowsJ86etQFOOIZTjiBE3a/BIveMfzr
	gGHnXuzVCQGIIK2tqxtHK6y2mfQPP9GiLdSrnOzIntj6bUvdaMEg4zBj0oheEOktQFfov/oU5Ik
	+Asbuojb/xLgpdRSPklE5Cl568rpsNvH4OPLrPZ/uFHb8RtL4huyLgtZTJiaeyMBMPggNxXcF
X-Received: by 2002:adf:e80a:0:b0:319:789f:fcda with SMTP id o10-20020adfe80a000000b00319789ffcdamr1217207wrm.9.1691999951604;
        Mon, 14 Aug 2023 00:59:11 -0700 (PDT)
X-Received: by 2002:adf:e80a:0:b0:319:789f:fcda with SMTP id o10-20020adfe80a000000b00319789ffcdamr1217185wrm.9.1691999951233;
        Mon, 14 Aug 2023 00:59:11 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.8.105] (dynamic-046-114-244-033.46.114.pool.telefonica.de. [46.114.244.33])
        by smtp.gmail.com with ESMTPSA id y14-20020adff6ce000000b00317e9f8f194sm13619021wrp.34.2023.08.14.00.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 00:59:10 -0700 (PDT)
Message-ID: <2b541550-162f-cd97-1836-72cf64951415@redhat.com>
Date: Mon, 14 Aug 2023 09:59:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/8] tests/docker: cleanup non-verbose output
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Yonggang Luo
 <luoyonggang@gmail.com>, Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230810153640.1879717-1-alex.bennee@linaro.org>
 <20230810153640.1879717-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230810153640.1879717-3-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: iRTUxjwYjCPp

On 10/08/2023 17.36, Alex Bennée wrote:
> Even with --quiet docker will spam the sha256 to the console. Avoid
> this by redirecting stdout. While we are at it fix the name we echo
> which was broken during 0b1a649047 (tests/docker: use direct RUNC call
> to build containers).
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/docker/Makefile.include | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index 142e8605ee..dfabafab92 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -46,9 +46,9 @@ docker-image-%: $(DOCKER_FILES_DIR)/%.docker
>   		--build-arg BUILDKIT_INLINE_CACHE=1 	\
>   		$(if $(NOUSER),,			\
>   			--build-arg USER=$(USER)	\
> -			--build-arg UID=$(UID))	\
> -		-t qemu/$* - < $<, 			\
> -		"BUILD", $1)
> +			--build-arg UID=$(UID))		\
> +		-t qemu/$* - < $< $(if $V,,> /dev/null),\
> +		"BUILD", $*)

Reviewed-by: Thomas Huth <thuth@redhat.com>
