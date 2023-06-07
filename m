Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp65564ejb;
        Wed, 7 Jun 2023 00:24:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7EBt+ZuRrbLJPsbcwPsJR/dFp5rTufPeZzkwJqMm37gF3wP1PaUBB/2wYpmEivaKuX6G1d
X-Received: by 2002:a05:6214:f61:b0:62b:53e9:a7d8 with SMTP id iy1-20020a0562140f6100b0062b53e9a7d8mr2236327qvb.20.1686122648766;
        Wed, 07 Jun 2023 00:24:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686122648; cv=none;
        d=google.com; s=arc-20160816;
        b=FB98UtQtnTLFlbdfGzF7PrVVGneyvK3gzwBlerixU0SNX3ZKv3J+2ivqEYn5zLPfeu
         E3m1OpAItp/Nr9Knk7p5xBdFezMxdm+lDa6HSKZMbL4FntWu91j6/MHAZ2Y+gCdmGau0
         //JrWlvFUsZ5iHn4xpCPOtWDz1EqgNy800wfNHaSHrpN2DSo8xXVGjX2Xxqb/HCUgX9E
         cW7RuBbSuYIzzkUgz80VpVxE+RdtPOIONHhpyKIEf2TgFH34qz56iqqylWRJmSHoXr5o
         4tMRmrCqkZsVMsOo6CPDNP8w3nXariHON4tfpgcSh7ZO0bh/NJ9JN+AKPL2GDE7X3D7W
         Aqqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vcgjJVsyGlNrjst9h+5Fzb1rLEr8bjfmPrEYNiDCbDo=;
        b=AuUXVB7c8VdnGMVw9b25y+OxvB/n1VkcQroV//yJiR8Qt64tKSj8xO7wdxZtV/eZ3v
         Z1qDrlIalot6rxSaBOKD7Xjth4EvZPsLiUlEBQJyIte2tPTqssogyIqk1LJD+o/jOB6t
         fLolRf49Abuwe5kWYvlBepT8tcI5h5VEUDclLj8HWn9AiyO3kP4NEDNcj9WgMccxgrbM
         O/xqvng4XBtscdOmpoklBIqSszgLp9jBFHZ0lO36z2GKBjLScirHepZ8//V6DXlbBey+
         kiHPfR+ay3uVHFbx48waS0yos+spxbwtLZ30ZN5M2VS2dbHz0zydquhT07RApRal78FZ
         vNng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NWR1E+BQ;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id t25-20020a05622a181900b003f0a4a28477si7265882qtc.79.2023.06.07.00.24.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 00:24:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NWR1E+BQ;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686122648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vcgjJVsyGlNrjst9h+5Fzb1rLEr8bjfmPrEYNiDCbDo=;
	b=NWR1E+BQ9TKbJKR/JYpgz1MTEghrrqgoJV+Oz00w83aHQkPBRD9m7YgPU2VXk/K4y4+5hM
	q9MdA5sDwnwQHpRqLTDRha8PPCVkHFQVPloeaT7slb3kzQz1Fdu1WslInIZiTNqJYvrsm8
	+qdFZdwfeSEmbVAYwPRytfqpH/KZxZo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-Td3kDiAeNA6hbCsz4EHoPg-1; Wed, 07 Jun 2023 03:24:07 -0400
X-MC-Unique: Td3kDiAeNA6hbCsz4EHoPg-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3f7e835ce65so9271655e9.3
        for <alex.bennee@linaro.org>; Wed, 07 Jun 2023 00:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686122646; x=1688714646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vcgjJVsyGlNrjst9h+5Fzb1rLEr8bjfmPrEYNiDCbDo=;
        b=bwdrLl5YOn8uNg1s9PNU0Vb2qze/dW7gw2q81sXE9nSk1hVH278L/fQif1ZqaBna8C
         8iSl1HIawNoLi/UDZ1HL/NNZZ8nkPm6ICDG1rKsjX2OqxcuBNh9wDPugnztlCguJ0dm7
         7XOQactSf8yjIXrxHg8N/UMqIMssBffNanmVG/HEv/qrcdsJDW+rAbVx1WgAi5/QGCcA
         9p08udkFt5s60G79wpuzKbm9e8GqFzj6/mo6HtfEJQPneI+SCUq5sftllVDQVSvVnU33
         vAeJo/EeQpa4uq9Vm/KwaNYBkDGGDF0co4evJlxBihtEnGWAfJIDCl202sJnsZ8QIt1I
         B+dw==
X-Gm-Message-State: AC+VfDyA6sercCuPO1UhAzAS1THjFw2dQSlChZsvvqeQ2PYZfdU7rrn+
	FoEAJXK18R3/UtaPpJvWrB/wt4rXcFI4r/jmfTxvZIV9//aqmyanFLeigjfxU9zC7zRwsM/lPj9
	NnLnVoNVMlNpcf6ec5zdFhPk+
X-Received: by 2002:a05:600c:2947:b0:3f7:371a:ec8d with SMTP id n7-20020a05600c294700b003f7371aec8dmr3697635wmd.26.1686122646087;
        Wed, 07 Jun 2023 00:24:06 -0700 (PDT)
X-Received: by 2002:a05:600c:2947:b0:3f7:371a:ec8d with SMTP id n7-20020a05600c294700b003f7371aec8dmr3697621wmd.26.1686122645777;
        Wed, 07 Jun 2023 00:24:05 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.5] (ip-109-42-114-92.web.vodafone.de. [109.42.114.92])
        by smtp.gmail.com with ESMTPSA id f4-20020a1c6a04000000b003f7e62d38d4sm1113146wmc.25.2023.06.07.00.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 00:24:05 -0700 (PDT)
Message-ID: <9d2bb62f-d7c4-b3b7-7c12-f572467c7911@redhat.com>
Date: Wed, 7 Jun 2023 09:24:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] gitlab: Add cross-arm64-kvm-only
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org
References: <20230606224609.208550-1-richard.henderson@linaro.org>
 <20230606224609.208550-3-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230606224609.208550-3-richard.henderson@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: L5cnwy2ol+f+

On 07/06/2023 00.46, Richard Henderson wrote:
> We are not currently running a --disable-tcg test for arm64,
> like we are for mips, ppc and s390x.  We have a job for the
> native aarch64 runner, but it is not run by default and it
> is not helpful for normal developer testing without access
> to qemu's private runner.
> 
> Use --without-default-features to eliminate most tests.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   .gitlab-ci.d/crossbuilds.yml | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 61b8ac86ee..1e0e6c7f2c 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -29,6 +29,14 @@ cross-arm64-user:
>     variables:
>       IMAGE: debian-arm64-cross
>   
> +cross-arm64-kvm-only:
> +  extends: .cross_accel_build_job
> +  needs:
> +    job: arm64-debian-cross-container
> +  variables:
> +    IMAGE: debian-arm64-cross
> +    EXTRA_CONFIGURE_OPTS: --disable-tcg --without-default-features
> +
>   cross-i386-user:
>     extends:
>       - .cross_user_build_job

Reviewed-by: Thomas Huth <thuth@redhat.com>
