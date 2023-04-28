Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1003105ejm;
        Fri, 28 Apr 2023 03:33:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7gBuE5OdWcuQI7jLPTiha7QdggI/VKfJRRUeQ80hnBDZx2WQnDkCYSZLxryY5UCcEnKoWA
X-Received: by 2002:a17:907:8a16:b0:94e:6504:d134 with SMTP id sc22-20020a1709078a1600b0094e6504d134mr4869586ejc.42.1682678008746;
        Fri, 28 Apr 2023 03:33:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682678008; cv=none;
        d=google.com; s=arc-20160816;
        b=G9gBdY264u4VRvitowlve3cGdgQw7mwVBsZwuNDMiUGnFksVOeAb/s/CGsQj8Eefqf
         1edn32kl68t66pE7XL5kTlPV1a3ocwPryYKp1ClSpbgwIlMT6o4cFOS8MvKZBlaLPa74
         fWiMJ1oY1O1H88M+D4ww5AmiJRALkguNJwwSi57RYPLdOUVI8t2wX0Hq1GWmQJSBw8X3
         0hUmbkHW2ze8ZRsF8xN1/EpY1ywXRHhoMTwfPmz6hcUD2aUAlwTeU7hHJFociUYBJuLl
         keY4ljRg20vV1YLBpom0No3pxmn4yogUGdteL4MBEH1QojtrbjK+Kvc7J0wb8AOmDqVe
         qs2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZnDIFtFQaJSKCtnZqx4SVloyy7MovU14Ud/EgQU8mK8=;
        b=uVfQFW1HUkURY2F+o5IwDGx98t4ojiU87kPKdla89ABnA1261YsIY5Pw40ucTQGocd
         P0hdzim5vliYAoAHxNcZKZtulU0eg1CVwnbGDP54NHdmE7LaWXcDyuH8GRRTypD1wz8s
         zvtUd7hfKHA5ImZyW5xfFfkiWbgRdGFam8PANwDvkbdz2YBKXMIY2/JPFUHeMPhXWrij
         Ob4mhvFBeq4zYJ2JOAQKXlWf0dvWqoToUQDh5hn/6Rhh3+7ZbXXB99SqO/gVjq6B8u6V
         flPyjlL5Q7eyMGKD3o1b3JtN2lL2BrkmkmhRCofM1677xVxOVSHqfyPTM19JEoaB44is
         BTwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UtpKUBbT;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id sz11-20020a1709078b0b00b009604c1d64c1si2524213ejc.163.2023.04.28.03.33.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 03:33:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UtpKUBbT;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682678007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZnDIFtFQaJSKCtnZqx4SVloyy7MovU14Ud/EgQU8mK8=;
	b=UtpKUBbTKe/S2xZWNrGRYep5zMiG8puUdMIUjNYDWys4RsPQvpBn3kevjrfOgYpP5L07D/
	DYmJ+muCLKKMHSrFtj0akh1gmCRcQUreUh1+GE9B5oCjwuOW0Ty2SwUTVW30uLZAj45U9m
	DRddljYTgVfk/e04yve0gCsxAGl0Z60=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-G9dOcwCuPwCG9BX0gN2XsA-1; Fri, 28 Apr 2023 06:33:26 -0400
X-MC-Unique: G9dOcwCuPwCG9BX0gN2XsA-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-2f6632b85fcso3095467f8f.1
        for <alex.bennee@linaro.org>; Fri, 28 Apr 2023 03:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682678005; x=1685270005;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnDIFtFQaJSKCtnZqx4SVloyy7MovU14Ud/EgQU8mK8=;
        b=LCh0YHOvqFcyY7MDc/zSmZm/IN8h9w8ROVEYc7/armQ0MFROOM91f87K46wuedOvkk
         Yawtd4AuIIc1r1q4dt/4wJD0SE3w2KtN/qFzXuQ4yw1Y5qoU/gc5Q9M1QfxHYWI+lb91
         DADB/ykUv9eUZUcTcS7UpzxIBgyAKeGcacBS8iNTRBq8sE5oUAlTfPPzXPH7uZtGviJx
         8i9OkbEHkFJ9e0vHarI0cIYMkaEvl4eKE28OvTpeKtoeyaGYuN5HL4aPhU7eI9D65k3M
         C7MyLDbtT2b2EolJ7H0SXmT8ScEsp0mux5bPJ9y7IQoaXTN294g85SFT2nxIHmSfbR1j
         auHQ==
X-Gm-Message-State: AC+VfDxFhGQc4K3i6te1FQorWCx6EjXCaOJnqvEVRkM4KiT44ge2jmpT
	0fCjXNmEBU6FheAaeq2aOScE3kNNL+tVCrX3SMrEBgGSuyM7ehl2Bec9EbxGONEiNnwpD/JW6d3
	nLtGfpZkbixpP1lORuV9grKZkZsdKOkIJZ1YZG8sNDLOOcdAzW11ieH7NNkHU0OLZWHl0wEcB
X-Received: by 2002:adf:e68f:0:b0:2fb:6277:54a with SMTP id r15-20020adfe68f000000b002fb6277054amr3830292wrm.51.1682678005093;
        Fri, 28 Apr 2023 03:33:25 -0700 (PDT)
X-Received: by 2002:adf:e68f:0:b0:2fb:6277:54a with SMTP id r15-20020adfe68f000000b002fb6277054amr3830260wrm.51.1682678004640;
        Fri, 28 Apr 2023 03:33:24 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.8.102] (tmo-098-235.customers.d1-online.com. [80.187.98.235])
        by smtp.gmail.com with ESMTPSA id s12-20020a7bc38c000000b003f1739a0116sm23770866wmj.33.2023.04.28.03.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 03:33:23 -0700 (PDT)
Message-ID: <e61e3522-2cd4-9e81-e74b-2932a53b8da0@redhat.com>
Date: Fri, 28 Apr 2023 12:33:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PULL 03/18] tests/avocado: Add set of boot tests on SBSA-ref
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: richard.henderson@linaro.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:SBSA-REF" <qemu-arm@nongnu.org>
References: <20230427154510.1791273-1-alex.bennee@linaro.org>
 <20230427154510.1791273-4-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230427154510.1791273-4-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ftVVe74kNj5j

On 27/04/2023 17.44, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> This change adds set of boot tests on SBSA-ref machine:
> 
> 1. boot firmware up to the EDK2 banner
> 2. boot Alpine Linux
> 
> Prebuilt flash volumes are included, built using upstream documentation.
> 
> To unify tests for AArch64/virt and AArch64/sbsa-ref we boot
> the same Alpine Linux image on both.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Message-Id: <20230323082813.971535-1-marcin.juszkiewicz@linaro.org>
> Reviewed-by: Leif Lindholm <quic_llindhol@quicinc.com>
> Message-Id: <20230328171426.14258-1-philmd@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20230424092249.58552-4-alex.bennee@linaro.org>
...
> +    def test_sbsaref_edk2_firmware(self):
> +        """
> +        :avocado: tags=cpu:cortex-a57
> +        """

This is failing for me in the gitlab-CI:

  https://gitlab.com/thuth/qemu/-/jobs/4196177756#L489

Could you please have a look?

  Thanks,
   Thomas
