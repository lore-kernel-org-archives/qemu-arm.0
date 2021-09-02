Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp243630lfb;
        Thu, 2 Sep 2021 06:09:23 -0700 (PDT)
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr3046642wmh.140.1630588163062;
        Thu, 02 Sep 2021 06:09:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630588163; cv=none;
        d=google.com; s=arc-20160816;
        b=YahnjWfunUvNIZwapF6nKFwJ7y0KZ5saexQFNe8QHCXebrDVdluqF3qLFYQwUbFhvU
         qjULMZKthizhTW7hyavwF4po3k/x7zRZW0UQNX4TrudmsfWXFe2Is9WjNJXc9A6LLzM+
         tzXqXnSFU/6Zer3BwFVB1WO3qS67fqYySpLzceUqWM8Bro3WviZIUVdWMdBoHhEl0kPS
         WGHDl/NUUCx7hSpP29qzXJjCKr709ZV/95lCXnZfShpZNmKQN5St+7ra3HMlMS3urm7D
         1ESnz8nKw3kJYDlB29fIh/KN1CU/nRks/pTZRgYzmLO6kAT9LkxlxbQWXXPbMF+JmG5z
         WYDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=BumYjg4HruxpBMDsswz5KhY/vuqWINMWr2ZsWHfVXuI=;
        b=JCtxjmYCoYNe2Q8QJYQTSduPCm3ETrk0tPlE7lTkx3r2gp5BbLHDmOhD10ieo2Vj8Q
         /LWnmXvl5vqDVcSo7e8yPbNEvKwpfri4HpqEkSIegcsJIxnH7ASLgan/Sn9GdYr+zxpd
         z2dmY2diXB/r/ywzsP8xxB9mMASsCuqDaGITicx/dV9zTQqBpntE34RNFZr2jbNtpz8j
         suM9URu+XOJKZzt00OEYPBVoz1mIukMj9dhb/PEcbAYOgmLCdrFEuSmWs3Za4F0R/5dE
         gPUqd3SoPOv8hkkVt4i1EGGwgVaJPD52B55PYTd/kaZ+XW1lRmjP87xzY/9oBEMFn/Vo
         c6FA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XNzeVVZg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n5sor1120461wrf.60.2021.09.02.06.09.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 02 Sep 2021 06:09:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XNzeVVZg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BumYjg4HruxpBMDsswz5KhY/vuqWINMWr2ZsWHfVXuI=;
        b=XNzeVVZgMTwvaMW+hf4ZU151vXY/tds9syru115vJWY2H9xi7NvkSLiKaf12IA2hmz
         4Twf+2KjSav4TdlFitm4lyz20GrQtiikbfLSNIYfE+tALQeeymUgusxfeSVth6gQ3uX6
         S2/mAgq97r9x3T58N0MON1+gBwMJ95T3hJLwKW0v9kfgeYMkiDyBVBkCNZgt3ZDrL10V
         x+AQO8dZOJW4KNpgWEWmAkAmEqFTZQfRASG2II4Hc0vabX+EuGis/weTAS7UEXw6WjAn
         mjtM3K3OONcQPvFv6bO++KaTMt80vA00Zxrg9JxLRI505QmzbauyaXOT/enXybhA2Yea
         fEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BumYjg4HruxpBMDsswz5KhY/vuqWINMWr2ZsWHfVXuI=;
        b=ZfRbCTqzt7QUnWD6OKx0ib6BUkrEbOuuDaI8fk7MBHibmVMXkNvKeMz1ixYpHepOjn
         d1I4k8cJUk56wsLui4pVLoh/iz8KV4s0tJmIpLA0h9wLtj+qfnheim2+uCVVd6Zgu8Qp
         4FpFZDCxq7aGUwMvYcRpzjNajWAlyEctO6UjmKN1B/ecsSCnfARsKjJyDWV58YX34OPJ
         2jBx2wLRW3FRGDPup//fgJYiZEjxEfeF7arionhZiEsnorZVx4DO9+dSpTHMDFw68JNS
         f1pKk2HkPtSoy+PSafbfrtM5zTItfa6DoEUDuWiXTA7EipyIMO8otYT2Gi8uoy9jOwz4
         +qeA==
X-Gm-Message-State: AOAM531S8ja82iF5WZdNy8goErvc8srVPvWMVByiHo9bgsSfksfYT3hS
	fd2ikWOe58gATrSWobZCg+iuNpV9
X-Google-Smtp-Source: ABdhPJw2kJqBm+YJ0W8PQQ91PAyB8vki1xITesAqGqbwujN1Yeq9boGiJSOCtAjS1XUUOw3zXsCIQg==
X-Received: by 2002:adf:8027:: with SMTP id 36mr3675503wrk.109.1630588162694;
        Thu, 02 Sep 2021 06:09:22 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.8.107] (61.red-176-80-253.dynamicip.rima-tde.net. [176.80.253.61])
        by smtp.gmail.com with ESMTPSA id f17sm1669167wmf.4.2021.09.02.06.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Sep 2021 06:09:22 -0700 (PDT)
Subject: Re: [PATCH 10/29] tcg_funcs: Add tlb_flush to TCGModuleOps
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier
 <laurent@vivier.eu>, Peter Xu <peterx@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-riscv@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stafford Horne <shorne@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Greg Kurz <groug@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
 <20210831121545.2874233-11-kraxel@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fdfd7f35-fbec-84f7-ebbd-7790df20b1bd@linaro.org>
Date: Thu, 2 Sep 2021 15:09:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210831121545.2874233-11-kraxel@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: SU0/P//hz6ET

On 8/31/21 2:15 PM, Gerd Hoffmann wrote:
> diff --git a/target/i386/helper.c b/target/i386/helper.c
> index 533b29cb91b6..100add713c5d 100644
> --- a/target/i386/helper.c
> +++ b/target/i386/helper.c
> @@ -103,7 +103,7 @@ void x86_cpu_set_a20(X86CPU *cpu, int a20_state)
>   
>           /* when a20 is changed, all the MMU mappings are invalid, so
>              we must flush everything */
> -        tlb_flush(cs);
> +        tcg.tlb_flush(cs);

I think this is a mistake.

(1) If tcg module is not enabled, we should be able to make a direct call.

(2) A *proper* modularization would load the target/ stuff as a module as well, at which 
point this should be a call through the PLT, not an indirect call after a couple of 
indirect pointer loads.

So IMO we want to retain the direct function call syntax in all the uses.  I think you 
want to put wrapper functions doing the indirection somewhere -- possibly tcg-module.c.


r~
