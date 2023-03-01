Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6938777ejc;
        Wed, 1 Mar 2023 05:06:41 -0800 (PST)
X-Google-Smtp-Source: AK7set/EDDb0bZg4w7l0IUHJ1qR7AxeZQvDtQhC6sXjgmlLpmTFq7dKGldhLijze++PlVVtieEAA
X-Received: by 2002:a05:622a:349:b0:3bd:11a5:c114 with SMTP id r9-20020a05622a034900b003bd11a5c114mr11336779qtw.63.1677676000903;
        Wed, 01 Mar 2023 05:06:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677676000; cv=none;
        d=google.com; s=arc-20160816;
        b=vd+jD5ZwBF1qsWG89As9XhmdIsQ0biP51sEjeK0Nsm1OCxNyhi6DJ9vRkRsXf+OPfr
         xbD/Gl0vFDYl3JzFeju0DD3bIFK63bDq4pHGr/i+VWxbxRTu6Sx4crS5KX0aJve47RUW
         33qqfZZ939yAHahH9GDGQL8KXKu+xb5k6y/00/0F7Sc0LMKT3IYu+zfbBBI3Tv9/f6/s
         puu5xNNI4BWJLQrdERCUHfh48AycIIW+bvV8OgFKYxC42fqPUi2IV3JoT2n3FTDlLGGa
         uweDEFu4R+2cxh5jKIWe5ANSOpIX4Jz2Hj1NwyrobQhOQDrnx8tCx7iqKAmKKyQyYpOp
         EdQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4azAcB8meYWKy1CT87t3qVCO3nvZ3/e9PmKCNrOdLuc=;
        b=RD8AbYNE9f+b+E986fa+/LPhRY/yOm+o8u6GXVtAo3tcgUXWkfSmK4SIIZ1lNa7emh
         E8BxWJ30yhbLwEToxm5Cr55zt7kWpYpUgXAgoeI6jDVKtPacKKaZLeAoyViNBGxnH9Ae
         jqQUZ+tCIMZzqmIOHIuqZ9SUZyOH51c9dP72VGd+y08jaPWwjZVaJebaQ8xwT7LuPbZ4
         3I9SbaXM8dOyux2DzqTxF8OhlFnKdL4i+xbTnIzm8ugEz3z/ITKpx6QOLkLTVvFhd8IV
         I8Xs5SKVpB0DO9clPxAwzo0W1vbohVjeocSTrz8QyGYqWoKZ9cbAz47mhZFmxA8rcF4W
         OsVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="WV7Tof5/";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id n196-20020a3740cd000000b0074242d3888fsi10456340qka.429.2023.03.01.05.06.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 05:06:40 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="WV7Tof5/";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677676000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4azAcB8meYWKy1CT87t3qVCO3nvZ3/e9PmKCNrOdLuc=;
	b=WV7Tof5/ne4GyqCmTFXhij19nbtPcyZPMD8+2nnylEWVA64rNDeg/j9vFb2UdJc5Gc+bIQ
	EYiNggYVS02lxI/n7yUH3Fn3lXbhgxfUmkITjU1ELu/UdU+Vb+rSrYoevKFLYbVc+PN96N
	R4hf+PT1oz4TFOHJdnvyjE1TkFGOviE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-623-B0DJR2yRP8qAB_XPBMzwKQ-1; Wed, 01 Mar 2023 08:06:39 -0500
X-MC-Unique: B0DJR2yRP8qAB_XPBMzwKQ-1
Received: by mail-wm1-f69.google.com with SMTP id m31-20020a05600c3b1f00b003e9de8c95easo4545247wms.2
        for <alex.bennee@linaro.org>; Wed, 01 Mar 2023 05:06:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4azAcB8meYWKy1CT87t3qVCO3nvZ3/e9PmKCNrOdLuc=;
        b=Vhda98i1m+XzUgjr2DzQgQp9xqa2elhQXfyjtY5hu1RTlLestu6jxrU42TxZqM30or
         Vsg83bY88Y+0Yu5mClgh9iDUOaOytdqfoa1agNYr1FFWh1QOpR3Y5CsZdAsNLvaBnLrR
         Rr8fhmeTolDJTRSSCTE1RBnERyOxwZ/jnN904iuH4AJTnxqEIJrBuccSPXpufBb58jzj
         qANCd1hXWyhBjzXkMC7TNPPpe3kyaKquPX7vL6Qokf3OLR6xoGcF8LiLSGLU/EJ0xv33
         DbV+8AO1V91EhF/a7YhwNJgWixdagcJDLOcy0jlG9fg29raeAVIGETNYKS2fKPgXGRox
         vqHQ==
X-Gm-Message-State: AO0yUKXlKQpUCSyKVLuwh2XP0UHA2E6t4dN7pDswqxqF2y05NGcA/98H
	1rE0kWDNYC+V2YYqri6urDnXXkdKGp2yCsn0neSuqhL4Z36tBNoXznx9JUElG2H//7PtIZ4FePS
	5d/N9pBgkhG1t0sj6
X-Received: by 2002:a05:600c:746:b0:3ea:e4bb:340c with SMTP id j6-20020a05600c074600b003eae4bb340cmr4913479wmn.18.1677675998239;
        Wed, 01 Mar 2023 05:06:38 -0800 (PST)
X-Received: by 2002:a05:600c:746:b0:3ea:e4bb:340c with SMTP id j6-20020a05600c074600b003eae4bb340cmr4913460wmn.18.1677675997932;
        Wed, 01 Mar 2023 05:06:37 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.8.101] (tmo-122-219.customers.d1-online.com. [80.187.122.219])
        by smtp.gmail.com with ESMTPSA id y7-20020a05600c364700b003e2096da239sm19390165wmq.7.2023.03.01.05.06.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 05:06:37 -0800 (PST)
Message-ID: <84e43a02-cecb-402c-1dbc-a4bbffcb1b66@redhat.com>
Date: Wed, 1 Mar 2023 14:06:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH RESEND v7 4/9] target/arm: move cpu_tcg to tcg/cpu32.c
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20230228192628.26140-1-farosas@suse.de>
 <20230228192628.26140-5-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230228192628.26140-5-farosas@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: X96uxn/Sqvth

On 28/02/2023 20.26, Fabiano Rosas wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> move the module containing cpu models definitions
> for 32bit TCG-only CPUs to tcg/ and rename it for clarity.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
...
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 1cb08138ad..1555b0bab8 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -506,9 +506,15 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>           QDict *resp;
>           char *error;
>   
> -        assert_error(qts, "cortex-a15",
> -            "We cannot guarantee the CPU type 'cortex-a15' works "
> -            "with KVM on this host", NULL);
> +        if (qtest_has_accel("tcg")) {
> +            assert_error(qts, "cortex-a15",
> +                         "We cannot guarantee the CPU type 'cortex-a15' works "
> +                         "with KVM on this host", NULL);
> +        } else {
> +            assert_error(qts, "cortex-a15",
> +                         "The CPU type 'cortex-a15' is not a "
> +                         "recognized ARM CPU type", NULL);
> +        }
>   
>           assert_has_feature_enabled(qts, "host", "aarch64");
>   

FWIW:
Acked-by: Thomas Huth <thuth@redhat.com>
