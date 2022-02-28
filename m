Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp1545077lfq;
        Sun, 27 Feb 2022 22:11:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyByWoq08jsHBhvEyyWV1qYrUCf0lUT+96T366BbW2kVwOtzu15x1mDv4F7MT2s4XlX4lfA
X-Received: by 2002:a17:906:6547:b0:6bd:e2ad:8c82 with SMTP id u7-20020a170906654700b006bde2ad8c82mr14012582ejn.693.1646028702074;
        Sun, 27 Feb 2022 22:11:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646028702; cv=none;
        d=google.com; s=arc-20160816;
        b=D4V0OwD2ttMGxoZuYW9waQrF+ZxpEPmR+JutjTgYdqItcemiLHvHINKDcBeaLQHEM6
         uIEd6l1ISOCuTJHCF1tRswcVUJVga4pog/aC+cxILsE7MTdYxzTFAx8iFD0HxRCuTi+D
         cp7UCoAJPDNh3nUz9WQ/JD1PPtSKVnFECwRvkhTXExjJ9K+j7B22/ovU2GuMLWJfRbXu
         0EP9/duOcM+/544ER8BeseIf+s5NNogNWirKzhOETX8YYZ5BDd9P3f6AtbkBQ1qNIkFx
         O9NA1h7A7lv4RNy2XdUiUluoc5BJQpXiRmDSRZrAq+5AHlQpOBi1yI3Hi/uglr0tNvFi
         zcbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=3CrqjBb/AS7k7kucE06zFyEYWzakbbY7PUPAwap9wHA=;
        b=cesPlShwkgrlF1m/Wdnt5TdMqgCl7Z5a5KOMAiA5/CXgikHQs8KIPa9IYmrAZgYnhG
         TJmdHTqvFpzCA6RRz401MvtyAIkB/9Wx2e5BnTAQrAKD7hPPtfc6cJcOoelG0fUdwi2C
         xCzIM5RrTLzgJY459A0Pscc27RJ7PK6Bdrpydri+LtPbJKDuHNf5nJkRbuyHwlvsPeuc
         N04XaSn0m9qXhX6TCwjnODeoUzPYCkswWGxC7Glgi8nhAOdBY+yPng8nO+56mIlbdCRq
         Q5664/0wkK7D1r2ckVUv4+TfZ9Lj1qJJwnckAXJaJY+yxXRES758JqaoVmzNmN0+OabZ
         o6xA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h+XsQ7hZ;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id hd38-20020a17090796a600b006cf5489da60si6050386ejc.36.2022.02.27.22.11.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Feb 2022 22:11:42 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h+XsQ7hZ;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646028701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3CrqjBb/AS7k7kucE06zFyEYWzakbbY7PUPAwap9wHA=;
	b=h+XsQ7hZMLLtikyUWxoCbuVOCQRSHS+L7P2kRQXHySrvaI4958NYEomwiBKEESa634+5PK
	RdL7xqY5MMgDYlShAVAnHOEBZCOPTlakadVfbHTXt6Uass+mUA6EPyO6sG349XaEYngZC5
	xpruTEel+XS2lybXje7QM+5C3mHlGPQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-zfPq0shoM3a23avjwXe9vQ-1; Mon, 28 Feb 2022 01:11:39 -0500
X-MC-Unique: zfPq0shoM3a23avjwXe9vQ-1
Received: by mail-ej1-f72.google.com with SMTP id hq34-20020a1709073f2200b006d677c94909so1529371ejc.8
        for <alex.bennee@linaro.org>; Sun, 27 Feb 2022 22:11:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3CrqjBb/AS7k7kucE06zFyEYWzakbbY7PUPAwap9wHA=;
        b=IPruCWMDWLtIrPgyFPfuem/XH5xut9KlEgaYmg+AnBaneRPj7UtsJZKyy2i9W7TzJA
         C6TfO8IeJVB/4npHs43ZWYCD3r2HAj4unvS2+S0JoXxsPcpPOIMW7JKiVQr3W19gWVYf
         sOLR4g/tXIi67BNxvrE40NzQifBNljoo9J8EVMQnCo/dM0qvCclzq3nqcfCLWwb/BvOB
         uu5Bs7OXaN2u6VU1lBUNJVi8+vssGIFnfTxJPIZ3EPeLB/0IbUnEUXojlZvV1lGIP6Qb
         YCYJiG/0k5Chl1HV444UsjZaQEfPfNmRidVmdkgnpDlOpdJCgb3AJGOAf5CiL02z0ht2
         B4vg==
X-Gm-Message-State: AOAM533VnvkqDzImyVzxGArRFGYVG6zn1cnHhXKD8K/rTF0BNuo7u3Ye
	T5BDL7GTLSFBe9n9FoByO4FGfierkZXZXAYL32Gd5zB34aSG8/2oTMw6jkFfWny77q7FdeEI2Gi
	o9iu2bNxIhdzcJaZc
X-Received: by 2002:a17:907:369:b0:6cf:d106:acae with SMTP id rs9-20020a170907036900b006cfd106acaemr13829186ejb.456.1646028698288;
        Sun, 27 Feb 2022 22:11:38 -0800 (PST)
X-Received: by 2002:a17:907:369:b0:6cf:d106:acae with SMTP id rs9-20020a170907036900b006cfd106acaemr13829159ejb.456.1646028698026;
        Sun, 27 Feb 2022 22:11:38 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.8.104] (tmo-069-218.customers.d1-online.com. [80.187.69.218])
        by smtp.gmail.com with ESMTPSA id j8-20020aa7c348000000b0040decce18bcsm5425569edr.98.2022.02.27.22.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Feb 2022 22:11:37 -0800 (PST)
Message-ID: <c7bf77e1-f803-3a99-c381-87a6cabb9a70@redhat.com>
Date: Mon, 28 Feb 2022 07:11:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/9] Avocado: bump to version 95.0
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Halil Pasic <pasic@linux.ibm.com>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Fabien Chouteau <chouteau@adacore.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 David Gibson <david@gibson.dropbear.id.au>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Eric Farman <farman@linux.ibm.com>
References: <20220225210156.2032055-1-crosa@redhat.com>
 <20220225210156.2032055-5-crosa@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220225210156.2032055-5-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Pyve2hMDwg/u

On 25/02/2022 22.01, Cleber Rosa wrote:
> Even though there have been a number of improvements (and some pretty
> deep internal changes) since Avocado 88.1, only one change should
> affect "make check-avocado".
> 
> With the nrunner architecture, test execution happens in parallel by
> default.  But, tests may fail due to insufficient timeouts or similar
> reasons when run under systems with limited or shared resources.  To
> avoid breakages, especially on CI, let's keep the serial execution
> until proven that it won't impact the CI jobs.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/Makefile.include | 1 +
>   tests/requirements.txt | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index e7153c8e91..676aa0d944 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -135,6 +135,7 @@ check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>               $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
>   			--filter-by-tags-include-empty-key) \
>               $(AVOCADO_CMDLINE_TAGS) \
> +            --nrunner-max-parallel-tasks=1 \

Could you maybe change it so that it uses the "-jX" setting from "make" 
instead? ... that way the users could decide whether they want to run the 
tests in parallel or not.

I think you could get that value from the MAKEFLAGS env variable, see 
tests/check-block.sh :

JOBS=$(echo "$MAKEFLAGS" | sed -n 's/\(^\|.* \)-j\([0-9]\+\)\( .*\|$\)/-j \2/p')


  Thomas
