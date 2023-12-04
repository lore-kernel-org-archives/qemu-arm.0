Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2532245ejb;
        Sun, 3 Dec 2023 23:54:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJ81Tocera6YjHCwfThOk0Dy1pLfuhIXG9l4qgY7/gYkYLRdouXeLeZVAb16uSbMJQ1Vwk
X-Received: by 2002:a25:db10:0:b0:db7:dad0:60d6 with SMTP id g16-20020a25db10000000b00db7dad060d6mr2538301ybf.99.1701676498455;
        Sun, 03 Dec 2023 23:54:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701676498; cv=none;
        d=google.com; s=arc-20160816;
        b=LYco28eAbZd25oik9CuO+elfKEqzAlNsfqX/0bXy4SsFbWjB77sQHa/+0yaENwFiCi
         1pSRfftWytmpdttJC/G3VSK+U/XBqns9JojQ8w+fcFRpH+2RiWUtDKEtpuWCgVDGiZNs
         aJDqgVgzsmX8oW7K7jIQ2evicf5YDZd9AFzqxo/8+TpnX6jxAtaB5Z2enWrwlwNQHxaI
         RBmEMcAOkoRtNZ23gcao7EG2eFKWrh3wM2k6BJfwWPb3LSyKztG3A0oo8FfcZOSqxHR+
         X2oz5k9c/yaZ3nArkCM1STLqtOvOBjX4VLqfiYk2Qer7stPQP8hva78WLCJC67IHe2Hr
         /Bvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=GCRXfmYgkrhKZOWfw+rvH+faW2OOy0BP6ONvlipBmEw=;
        fh=eYWu+2L1sZ/PeY+tWrpR4bRLlHXsp6bESfVGPC4rzvU=;
        b=WpjIKGKo7fy3kLhmlJiy1bPeYS1vJ22PqCqisosvGZ7H4jZa/0lBkzgTn3hg9F9Glr
         DA24HpwSKTHKZewE7v1H0CuW98apQ/yD1MrkzpJyE5JHdGBIQkLLA9k/jXKcD813pB35
         9xPyoijaIoGQN0FTjeszjiD8ZojxOR26OOTS2K1Utm/DHg55zXWI3F3fefq7NFLg2ngK
         moVp9OpImCMex4ZtGZabD8oihyHtKeI2vTg8VKZ+VNbIsFfoYWZ3qh//rzH80G6VnT/W
         dEcu2DRThhGmrKMTwp9CodYOPxQMLZ9Q/GCTbPsbtBP+vGeq5YYatLeKFiYnavCoX5cD
         75+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="GfyX/Yzx";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id k135-20020a25248d000000b00db51f6b8001si3797851ybk.509.2023.12.03.23.54.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 23:54:58 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="GfyX/Yzx";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701676497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GCRXfmYgkrhKZOWfw+rvH+faW2OOy0BP6ONvlipBmEw=;
	b=GfyX/Yzx7YWNZfwP1eAJc1Wmtb5/3sL5LGyQYQP1/8ZIkMpW4UQMLhKjIt2sezcSd4CUk/
	CttDDI7nrFb1cagWc0PaF8b1ELR59kxBnEaDjPgS5e7OFguzVNdUno3NY2gldBqo+heL6i
	GECIekCZICDbT96HX7JMMAzhLkgZgbM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-DmZWeZC5M8-UN4naFEjNuA-1; Mon, 04 Dec 2023 02:54:56 -0500
X-MC-Unique: DmZWeZC5M8-UN4naFEjNuA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-407d3e55927so35774165e9.1
        for <alex.bennee@linaro.org>; Sun, 03 Dec 2023 23:54:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701676495; x=1702281295;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GCRXfmYgkrhKZOWfw+rvH+faW2OOy0BP6ONvlipBmEw=;
        b=mky+zi/CwUBopmEQNCsbACkIkYKhh71zl4w9M+HyycAcip618qxM8n9MyElPNNJ0tE
         fCRFjBVs2mm5+7ZBj4/hJEbduUL5dF+RniVR+I+Wc6ue5D+ZZqzOXMJGsMsV+U3jtcuP
         vXnQrLqrxo7TujscbPmcn7N/XgO77r8CqjqGfXE8nmyfKgTAVh0yNnLY1oVrws05sVjb
         9Hb6IlkBuByV2+lRuAJS9ke/x6BSZybH6bglqteVvQyt+tOP2+ndedvyoN13IfoYemcb
         or1LnJEKJIWp5riNSS0/laGkqUK+uAQ0pxamw7ywgHsIBPzsqqH38EiHtjMnW+9QYGNE
         H7hw==
X-Gm-Message-State: AOJu0Yz/EpZkZJKoYY0qjFsk2A4ZsvL7ebyA0JoZjYO6u74khckPAUQv
	1x68ajM8/XuKPLjX53w0fHU5qs2slvlaq1vP5GNiC7SWng2Dbl63AWCgWj7MxlxME+pCuZD1HKR
	/EpUIUwnO2LHLTGbqaw28qo9JEYYaMuTmFH54I7S40YOukps2r2gvYhl281Aqg6TcPB32xD3u
X-Received: by 2002:a05:600c:5d5:b0:40b:5e1d:8399 with SMTP id p21-20020a05600c05d500b0040b5e1d8399mr2363619wmd.45.1701676495682;
        Sun, 03 Dec 2023 23:54:55 -0800 (PST)
X-Received: by 2002:a05:600c:5d5:b0:40b:5e1d:8399 with SMTP id p21-20020a05600c05d500b0040b5e1d8399mr2363592wmd.45.1701676495345;
        Sun, 03 Dec 2023 23:54:55 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.6] (ip-109-43-178-85.web.vodafone.de. [109.43.178.85])
        by smtp.gmail.com with ESMTPSA id r11-20020a5d498b000000b0033339da02f9sm5918442wrq.110.2023.12.03.23.54.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Dec 2023 23:54:54 -0800 (PST)
Message-ID: <a9b7f414-5229-4dc6-9d32-b95d36cdbaf7@redhat.com>
Date: Mon, 4 Dec 2023 08:54:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] gitlab: build the correct microblaze target
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Beraldo Leal <bleal@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-arm@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Eric Auger <eric.auger@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Cleber Rosa <crosa@redhat.com>,
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
References: <20231201093633.2551497-1-alex.bennee@linaro.org>
 <20231201093633.2551497-7-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231201093633.2551497-7-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: wu0pmnG1jg0+

On 01/12/2023 10.36, Alex Bennée wrote:
> We inadvertently built the LE target for BE tests.
> 
> Fixes: 78ebc00b06 (gitlab: shuffle some targets and reduce avocado noise)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/buildtest.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 7f9af83b10..62b5379a5e 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -41,7 +41,7 @@ build-system-ubuntu:
>     variables:
>       IMAGE: ubuntu2204
>       CONFIGURE_ARGS: --enable-docs
> -    TARGETS: alpha-softmmu microblazeel-softmmu mips64el-softmmu
> +    TARGETS: alpha-softmmu microblaze-softmmu mips64el-softmmu
>       MAKE_CHECK_ARGS: check-build
>   
>   check-system-ubuntu:

We've got microblazeel-softmmu here and microblaze-softmmu in the 
build-system-fedora job. So please don't change the ubuntu job here, 
otherwise we're building the same target twice instead.

  Thomas
