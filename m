Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp339991ejy;
        Thu, 29 Jun 2023 06:31:18 -0700 (PDT)
X-Received: by 2002:a7b:ce0f:0:b0:3fb:b4fc:be6f with SMTP id m15-20020a7bce0f000000b003fbb4fcbe6fmr2682998wmc.32.1688045477884;
        Thu, 29 Jun 2023 06:31:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688045477; cv=none;
        d=google.com; s=arc-20160816;
        b=oOITfjjHyIXgJR5J33uYhpQFwSOvAGtfvAFHBpL0WodXyuDaQBVZksHBfwNyP3NUs+
         G6MM/aRUhIfaMmVgcQ+DuPKz8QHvFCaP11jtEzGJcm0UeAzDgvuP1rBqYEz94j9Lf1Vr
         yPM+RWwRD44EPiNN2OKnVO67NPvNTblPguC6tyLNCNdNafhXhR5V3+9KEi302N5qQx1D
         pcNwASyT1s3LvsPAcguurYV6cQoPJe+d6mPqHpNTguB/3TQ+Zazt5jWUn/Ho4JKADKzi
         /9iZIBI8LZ2yg+oAQjXCdIcwwK3IVITV+PVyZ9Fw4Eyw7QBYqmF4rfsBxsZPAShlCPix
         8o7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vKK56Zz1+4wlfChjLQ9Meej950YkZnAmmv7yuTuGeTs=;
        fh=Tti5iY6tdwKQ6vxlTSmZ6v2Y0jcLETgPWS1w/ieRBfE=;
        b=ybowM4PiSIpyRNp1GXvLXIuiFtOx1oUgrEd5ALirllX4GsPaGbydnVa/IDk0XP/vSy
         XgBH/MN6jpeAQCYY6nFeflBFgzUeESjfN/Zl4QK4BFEUc6yE5JAN3OcIONPKoD4GqqQF
         BIJiivB/oyEDYgqLf7zfvOx4vKUfhgTSXeGu3qgjBi4zr8/lJP4oRC5p2Dg/Pu0cvo1p
         gdl1rvvR4+pAvlZ8QJUGjy8VPeDcGn14BpZrNA0rf3XkhFSXgYUeV4xbD6w16SmbrT8f
         ta1jZnWmEpygJDGbTWQirCt0a9eFO0baG0o318Rj2D2a1bOf4F6wnqOVpxmluVvT5skY
         526A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KebTocng;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f20-20020a1c6a14000000b003f8fd24e59dsor4674317wmc.1.2023.06.29.06.31.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 29 Jun 2023 06:31:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KebTocng;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688045477; x=1690637477;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vKK56Zz1+4wlfChjLQ9Meej950YkZnAmmv7yuTuGeTs=;
        b=KebTocng5CBuZRp2+fBb5CIIIJ0JH6nGO7oH0Cd4VNpZ9GJyeKnhSBVmKhSX4ugiTa
         iH8avXLSsvi1nvQbyV7+WL4DFr7JHeHgwSHJX/e5I7geT/P70mKSAU4PHWMrFx8a9sJv
         X4Sbl7Pimc/uafo1Z2N9VeAmv5bNM2j2aa4x/o5cNMbzdESGbV8rA4/d2Oh3EQVQyrnW
         5RGSvwKq/LqlhFl1+x8/HbtuSi8s3yCJUTP41cZTWuntsWbLICPnb16h/Y4RzhPDNnc4
         p6Jj3Q8x6iAup4E4FXaBDJB9q4a26p/k7cbzZb9ak/BAXcAcgfqLLyl4Ue27n9eUc7CX
         mypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688045477; x=1690637477;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vKK56Zz1+4wlfChjLQ9Meej950YkZnAmmv7yuTuGeTs=;
        b=ZkROJKO6fNYYw5HR5hiQmkQEt4vHqPs6D3fB5DBkkYwp9xcNkoymey/oKci1171BRe
         UszafcEVXH8alWH6gxEVGxMjho7ZijAEX+JtNTua20ioyHJmG6CYYETWnqx/1HoR+48w
         FnHUhWJUtgYR7y3BkFCXQznRGe6BN4E81q3r5K6a6OhTGE3r3F+ZmZx/XcpUFBpu9nhA
         KBWAiK5oYaHDuUl3NWpEC/EmFaMncuXDYKH/p+1pyjKzOEy9B1653/8byb8xcFaaVJw7
         xRib3yhPP6L8/0M8w7tEMuOitBaEdicqpdWY7m5fotWTryR3JP9/Dzce5gsp6UlJ+Eh/
         K7rQ==
X-Gm-Message-State: AC+VfDx+LSWZs2kECQi6Hw7HcpUcIT48b6+l7OPpD0oWKT6EtaUuzO9t
	iRUnnq9daaUqa6eg9WweoEdXA0rimSwzxv5cVtojOQ==
X-Google-Smtp-Source: ACHHUZ4CiUGEOLsPkvaP/hUsXKCUJxqGSPPAKcqPnaP17BgNmL7Pb594JaSbOLTPb25aFyYsypgLKA==
X-Received: by 2002:a1c:4b10:0:b0:3fb:7724:254b with SMTP id y16-20020a1c4b10000000b003fb7724254bmr7206485wma.9.1688045477280;
        Thu, 29 Jun 2023 06:31:17 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.176.166.242])
        by smtp.gmail.com with ESMTPSA id l17-20020a1c7911000000b003fbb9339b29sm1622400wme.42.2023.06.29.06.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 06:31:16 -0700 (PDT)
Message-ID: <969b58fe-5b4a-3106-eef3-96e39a9e72a9@linaro.org>
Date: Thu, 29 Jun 2023 15:31:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 20/36] docs/devel: add some front matter to the devel
 index
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Yanan Wang <wangyanan55@huawei.com>,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Xu <peterx@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Bandan Das
 <bsd@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Laurent Vivier <lvivier@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Riku Voipio <riku.voipio@iki.fi>
References: <20230627160943.2956928-1-alex.bennee@linaro.org>
 <20230627160943.2956928-21-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230627160943.2956928-21-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: l+peqnW03vJB

On 27/6/23 18:09, Alex Bennée wrote:
> Give an overview of the most useful bits of the devel documentation to
> read depending on what the developer wants to do.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20230623122100.1640995-22-alex.bennee@linaro.org>
> 
> ---
> v2
>    - removed excessive start
> ---
>   docs/devel/index-process.rst |  2 ++
>   docs/devel/index-tcg.rst     |  2 ++
>   docs/devel/index.rst         | 24 ++++++++++++++++++++++--
>   docs/devel/tcg.rst           |  2 ++
>   4 files changed, 28 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
