Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp312726njb;
        Thu, 27 Feb 2025 07:45:35 -0800 (PST)
X-Received: by 2002:a05:6a20:9e4a:b0:1ee:d317:4411 with SMTP id adf61e73a8af0-1f0fb429740mr22729431637.0.1740671135425;
        Thu, 27 Feb 2025 07:45:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740671135; cv=none;
        d=google.com; s=arc-20240605;
        b=JhrtDxoBifJPZsW4eo/IhnjW/VKzI/UOi9Bghv8Tu1L2Llf28C5NhsAy0/nvwq3lcI
         Gu7YaRPXcvADdxNvm7/BsLPGWRc1lryOD4nt8yTIMrzTbJf74pOpa622qYrNYQ5hqQfD
         prS+Ne6kJ1HdIpukOisINyQl8HlkbqK/9VvM++iiTPp2ku4mtM4FGgzBzvqpIO1+ryXe
         dofA1UoqfOlcS1LnYLYDA9U0fVKfdcvMMGl9pRXNM18ZBmsF7aOoeMtoOvmtLW7sL2dQ
         sLrH1EcF68x/MhsdtuCq923Par04vfVCGMapS2gxWB2/sBaq7i5XRy5mCmYfb4EcbIN1
         67qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=kJ8rK0FFD6iEbjuP1Yv2J4L4iSn5M9Hv9g172C7QGlI=;
        fh=yloooj7WQ37Gm85nNDMkKFmIGwKWKnVT8qyqXTwAq1Q=;
        b=lFyKFT50BPiPl9LSjRjwubvE6KekOeLJk8aZn27Wgdv2hJeeaI+xBkpVT7RzfjPclC
         YbmuXzAES9MjIjzliToHy1NWYOPGhcqDM9fHqK76ICXjDxgnsUPQKenNC7QekMeWxlO1
         J9el1hyl1kEziL3CfggHrlZJ483ay6nZrb83uqRQVFj0wgDdS4q8/0IfERVEQFMSgLUv
         Uo2bJ830sy8N0JRQUCNZyNFr7BOgrRVsVIOAZuNIZgQrF97a1H5yar/0gduRKgFOHc4I
         f1JvJ3XYfzF0GSseHGkKadOe5P/tyK2rPsp4V7DuT5UGz4mh0UvP2TvFQnYRymNF5skg
         nd6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="Qr/rxHrc";
       spf=pass (google.com: domain of dbarboza@ventanamicro.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=dbarboza@ventanamicro.com;
       dara=neutral header.i=@linaro.org
Return-Path: <dbarboza@ventanamicro.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-734a001e5b5sor1310175b3a.5.2025.02.27.07.45.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Feb 2025 07:45:35 -0800 (PST)
Received-SPF: pass (google.com: domain of dbarboza@ventanamicro.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="Qr/rxHrc";
       spf=pass (google.com: domain of dbarboza@ventanamicro.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=dbarboza@ventanamicro.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740671134; x=1741275934; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kJ8rK0FFD6iEbjuP1Yv2J4L4iSn5M9Hv9g172C7QGlI=;
        b=Qr/rxHrc9J2y1ITLPCksO5leGtb+DE+3Wb15oG1CJW8nWYVJtmCgb8TymJSZf25amu
         bv8U/2ZQy47zjR6B71syLuoku9HkTqC//YfjCLV9AB5zMdP1YcSEzdHVbGKQYl48UC5g
         4zzM+qohghSxZtl23p61iZitCGh9BjOOYY3fYdidJKRF86t1WIYOon31lN7MKNuFdISk
         AgotmCRRB6BdUpD3pkwtmOe1LFL4TFZJP9UHzl52qRU92LBCgIqygBReZrvArHYE4S5g
         C0pMatD0JOXIFtoMxj82wNDVe03GNdkDU1L8V8JRzomLJ2yZPDsm9++N38Mf41Bd0nX+
         zrsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740671134; x=1741275934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kJ8rK0FFD6iEbjuP1Yv2J4L4iSn5M9Hv9g172C7QGlI=;
        b=WuQ45yY7gz2rH4i6nVmWFCUFyJi8aIcgmFKecRce+yX5N/Md3ULFL/TwTe/Yw+sZbL
         2IXI5S/h8ZUSZfQLRgzdnGIBRBvKFS5gikDzllbuRvofvChYNuxV3xXk7WJuSWx6+egM
         u8P8LxAfi2Qf7O5rop4RRTxtluosVZP6FmejMaXiSc9eFzSOkbevqWQf1UOyTvFaYRiA
         qzKsv1fODDPDyp/uyQxcrpW6QFv5HITldFpl7kd/Suvt7fb1655q/ubnS7aX6cvEUYSb
         T1a/0bWyQYuy+RmhmmP1uLogqWDwdyLy7Wzfgtz5dhalrUY3gDQoH1bzKC6CKAlbSXfG
         I0fg==
X-Gm-Message-State: AOJu0Yy/f37CM8YLGM/9sY4n+X/rMVIeIBOa7hMtci1+jrPhr8bZN/OQ
	/A6f7F5tnMDX8g/qlO4P8XvbfAOU0aHt3ay4jygatcf0zzlELCR3tWRGua/iaoyC1/SWcR1z3RM
	/
X-Gm-Gg: ASbGncuO5DmVde/XF1FgpjLGZJgZKVXSm7eSmde+JyY3Oik0ykfaVTI7eg9iSkodXlK
	pcg4TTnKVegH9Mzq/6a7F3LuKyIZlJOQAOJcZ/GTIAWlesOcNzM8WOYePnAarnPHCygR670krFy
	v9tt27by8TuvWEn1en4AA+jOrey4eH8jYAvKYofXaaaROOjmqyma7X93uZgBSKB761rHznIv7Se
	ddc+m5t8iZ8mTpkbrSt0C4O8Tj+zzqNr/yOS7P66jai3vp0dIJ5rlW2ZnI72wR902dLE2WCXUKW
	7bkhOQ/k7nx6LOGJp5ulRRdA21xW0WRyl/rAVU4RcA==
X-Google-Smtp-Source: AGHT+IHFXIBpNBlGID65V8Gr7B4vd0ksr4mJHJ2zXHzdeQkUaKcamY4ln8eA3BPha/IgegU/x6wV1A==
X-Received: by 2002:a05:6a21:6b0f:b0:1f0:e708:56e2 with SMTP id adf61e73a8af0-1f0fc24b3fcmr20780042637.22.1740671134486;
        Thu, 27 Feb 2025 07:45:34 -0800 (PST)
Return-Path: <dbarboza@ventanamicro.com>
Received: from [192.168.68.110] ([177.170.227.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de1f7a6sm1583674a12.30.2025.02.27.07.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 07:45:33 -0800 (PST)
Message-ID: <a069dbfb-c0bf-417d-9925-e419c071eb4c@ventanamicro.com>
Date: Thu, 27 Feb 2025 12:45:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/25] MAINTAINERS: remove widely sanctioned entities
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Eduardo Habkost <eduardo@habkost.net>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Riku Voipio <riku.voipio@iki.fi>, Warner Losh <imp@bsdimp.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20250226140343.3907080-1-alex.bennee@linaro.org>
 <20250226140343.3907080-26-alex.bennee@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250226140343.3907080-26-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: HzN7lHRLN0rB

Hi,

A bit offtopic: we just received patches from Syntacore [1]. Syntacore
does not appear in the US sanction list website, but in a Google search
I found out that Syntacore was acquired by Yadro in 2019, i.e. Yadro is
its parent organization. And Yadro has been sanctioned.

Does anybody know the rule in this case? If a parent company is sanctioned
does that cascade to all its subsidiaries? I have no idea whether we can engage
with these patches or not.


Thanks,

Daniel


[1] https://lore.kernel.org/qemu-riscv/20250227144200.69270-1-saveliy.motov@syntacore.com/



On 2/26/25 11:03 AM, Alex Bennée wrote:
> The following organisations appear on the US sanctions list:
> 
>    Yadro: https://sanctionssearch.ofac.treas.gov/Details.aspx?id=41125
>    ISPRAS: https://sanctionssearch.ofac.treas.gov/Details.aspx?id=50890
> 
> As a result maintainers interacting with such entities would face
> legal risk in a number of jurisdictions. To reduce the risk of
> inadvertent non-compliance remove entries from these organisations
> from the MAINTAINERS file.
> 
> Mark the pcf8574 system as orphaned until someone volunteers to step
> up as a maintainer. Add myself as a second reviewer to record/replay
> so I can help with what odd fixes I can.
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20250221161443.2321327-1-alex.bennee@linaro.org>
> ---
>   MAINTAINERS | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1911949526..9cdfe19115 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2529,8 +2529,7 @@ F: hw/i2c/i2c_mux_pca954x.c
>   F: include/hw/i2c/i2c_mux_pca954x.h
>   
>   pcf8574
> -M: Dmitrii Sharikhin <d.sharikhin@yadro.com>
> -S: Maintained
> +S: Orphaned
>   F: hw/gpio/pcf8574.c
>   F: include/gpio/pcf8574.h
>   
> @@ -3627,10 +3626,10 @@ F: net/filter-mirror.c
>   F: tests/qtest/test-filter*
>   
>   Record/replay
> -M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
>   R: Paolo Bonzini <pbonzini@redhat.com>
> +R: Alex Bennée <alex.bennee@linaro.org>
>   W: https://wiki.qemu.org/Features/record-replay
> -S: Supported
> +S: Odd Fixes
>   F: replay/*
>   F: block/blkreplay.c
>   F: net/filter-replay.c
