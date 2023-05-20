Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp265396ejq;
        Fri, 19 May 2023 21:21:47 -0700 (PDT)
X-Received: by 2002:a5d:4e87:0:b0:30a:3ae0:f455 with SMTP id e7-20020a5d4e87000000b0030a3ae0f455mr133501wru.2.1684556507372;
        Fri, 19 May 2023 21:21:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684556507; cv=none;
        d=google.com; s=arc-20160816;
        b=vxX0g0lWZTrYFwj8FpJNL1wQYgn0dAovri7BIMdB4TShVKjINhh43OjFWzAiuRWFMy
         O107zeMqqUL2tRm2Jls03fO3GyinLVEq8O1ft7xSe1MTyn/R9NIL1T8XwHEZe3qHhf75
         NbKGKBTvlDyVPCmgorECNVOXQvCxlGXx/pIWF/QpePOelAIl8rQJOGIxBNLON3nVsiXr
         npPmfaHLot9SeF5Ar7NW9G5uCU/dhoSlowhlMIRYxlLSDWB6N76zf52p+LZCG6cXXbYK
         0/n5Cx0UllN3R0RVF4/T8EmrfhmofSJ0JZC7KeNb3Mm9CIWuWNbGNlHHlH+mej7s4Exn
         MqVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9L++UuYY0EHz3yiv5WPTM6cAEkrR/f/dIGRBMDbQPJ0=;
        b=kv/2GwD+eyNIJzKJrRiIa6Hw6wpMmnqG7wY/2UdlY5vdv1BfQnEM0GzUBDH7TulBlQ
         kn+riQBrHDnC/R0d2Ga08fRVCnHxAlAjyy8uJvGDZ7terKm2OD+JZ+9evYCAbx+ZJuHn
         WKuyDvKdYeUgeIfaaeNc/XjUdxXbRa9Gom0+1bSrX78vyEd0CL8xseM0EDlb7ExpduwE
         Yy9OSjpk/QcYx0eW4nyWwwFf/yeroH3hYFrde0cxgnKVg25UCe8C4tXZqAKpWiErQsZk
         MAeUvRBbesqHZ0KN7RqCsjJND/T81ht0AxRtxTASwdtyp+6dA2g4neyEdb3GLUc7IKdT
         cOKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MgUHVozj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h10-20020a05600016ca00b003062eabd2desor1072490wrf.0.2023.05.19.21.21.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 May 2023 21:21:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MgUHVozj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684556507; x=1687148507;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9L++UuYY0EHz3yiv5WPTM6cAEkrR/f/dIGRBMDbQPJ0=;
        b=MgUHVozj2HliXcmx47Bw9aO6dQMuf1CdJ27HE2wCF3rO4qOAQmU/vkzzu0w2pYgDX9
         qhvjTfcaXinlWEMG3nOPGYlC2eZcQanBeAWvIV/RebOKJGkeE3Rpk1O5fTo1IP7mIwQC
         +rj2sx/j2yKfqS73kcFLFyICKV+/96yOowpaub+LXsGkDUG3c45VboCu4kkUn5HttSlY
         08oN/HM3tDSByoj7oxr7A7FQ+bRdHLL2aBhA90B77OIV2EliyE7fmqxd9tuJgR98ECIf
         /OJiY6Jcr1QTkrEl4cSGo+IaxRMlnp5OTlKgf/Jo94IbToukkNnVwizFhDUuBKCE7T9t
         qubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684556507; x=1687148507;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9L++UuYY0EHz3yiv5WPTM6cAEkrR/f/dIGRBMDbQPJ0=;
        b=QLyZe1O4cmgfRYBtYGgkGvGZ78tdsIN876tlvzAGr0JUpwcze3LkGyM3k1OpTIb4Mo
         exZbq33MWWbIh6TGou0Ii08BZ1Fq1i0TPRQcnSzyNPnHXqjE35OGP1YolIdI/2VAStFu
         yMD3Djs2GqINThRon57M3I+fxQsaYEDlkc2QXfBS/dqZIEGmJvSKcSBKdcX1qHJi4QU1
         JKZ19+lm71p2krAYgapENkVHwaYFt668KuzN2WAQ5cpq4YcZYIgpGFo4UY3aSmxg/stS
         l4u3ULm4C8/XV8HlvgXFZmDyl4kdqxTZUVMYot3euLcBe6T9SiCUSyr6mWR9AS/z9/kt
         ZY4A==
X-Gm-Message-State: AC+VfDzJ1yWiglYtkgIjvthyR3/xDPyjVwxC5NHEBX6aja2q+c/xi5EJ
	Lmm0aQcPM1SZdI/yDycflxivmvjEpMrRg7il79jc0A==
X-Google-Smtp-Source: ACHHUZ7d+24cJuxOFc7Ji5UC8rjIJbY6foTS2BZ9yiP3evsOuGWp9Lff+ac9OGyUAWFvktlQfUWauQ==
X-Received: by 2002:adf:f64f:0:b0:2f8:33bd:a170 with SMTP id x15-20020adff64f000000b002f833bda170mr5907688wrp.32.1684556506756;
        Fri, 19 May 2023 21:21:46 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (mau49-h01-176-184-41-228.dsl.sta.abo.bbox.fr. [176.184.41.228])
        by smtp.gmail.com with ESMTPSA id z14-20020a7bc7ce000000b003f4b6bcbd8bsm956536wmk.31.2023.05.19.21.21.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 21:21:46 -0700 (PDT)
Message-ID: <381a8c29-66ae-c998-6d18-0fdff7995139@linaro.org>
Date: Sat, 20 May 2023 06:21:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 2/8] plugins: fix memory leak while parsing options
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>
Cc: Yanan Wang <wangyanan55@huawei.com>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Marco Liebel <mliebel@qti.qualcomm.com>,
 Mark Burton <mburton@qti.qualcomm.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20230519170454.2353945-1-alex.bennee@linaro.org>
 <20230519170454.2353945-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230519170454.2353945-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: spKz3S2VPiuf

On 19/5/23 19:04, Alex Bennée wrote:
> It was hard to track down this leak as it was an internal allocation
> by glib and the backtraces did not give much away. The autofree was
> freeing the allocation with g_free() but not taking care of the
> individual strings. They should have been freed with g_strfreev()
> instead.
> 
> Searching the glib source code for the correct string free function
> led to:
> 
>    G_DEFINE_AUTO_CLEANUP_FREE_FUNC(GStrv, g_strfreev, NULL)
> 
> and indeed if you read to the bottom of the documentation page you
> will find:
> 
>    typedef gchar** GStrv;
> 
>    A typedef alias for gchar**. This is mostly useful when used together with g_auto().

So possibly glib could improve by declaring g_strsplit()
(and co) returning a GStrv instead of a gchar** type?

> So fix up all the g_autofree g_strsplit case that smugly thought they
> had de-allocation covered.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   contrib/plugins/cache.c     | 2 +-
>   contrib/plugins/drcov.c     | 2 +-
>   contrib/plugins/execlog.c   | 2 +-
>   contrib/plugins/hotblocks.c | 2 +-
>   contrib/plugins/hotpages.c  | 2 +-
>   contrib/plugins/howvec.c    | 2 +-
>   contrib/plugins/hwprofile.c | 2 +-
>   contrib/plugins/lockstep.c  | 2 +-
>   tests/plugin/bb.c           | 2 +-
>   tests/plugin/insn.c         | 2 +-
>   tests/plugin/mem.c          | 2 +-
>   tests/plugin/syscall.c      | 2 +-
>   12 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
> index 2e25184a7f..5036213f1b 100644
> --- a/contrib/plugins/cache.c
> +++ b/contrib/plugins/cache.c
> @@ -772,7 +772,7 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
>   
>       for (i = 0; i < argc; i++) {
>           char *opt = argv[i];
> -        g_autofree char **tokens = g_strsplit(opt, "=", 2);
> +        g_auto(GStrv) tokens = g_strsplit(opt, "=", 2);

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
