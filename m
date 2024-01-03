Received: by 2002:a17:906:cc9:b0:a28:7ef3:d049 with SMTP id l9csp632893ejh;
        Wed, 3 Jan 2024 09:47:25 -0800 (PST)
X-Received: by 2002:a05:600c:1c1a:b0:40c:269c:518f with SMTP id j26-20020a05600c1c1a00b0040c269c518fmr698957wms.115.1704304043286;
        Wed, 03 Jan 2024 09:47:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704304043; cv=none;
        d=google.com; s=arc-20160816;
        b=Hqbgl9MAm4VoJGxhRV47nFCUWgrMLoBGH60VJk4nTqKOQOtVdudCKmme4XRSeOGSjB
         YZiRCIKCh+FplzO/YdyiKzqZbM/QsQprjkA5SedNiCbo9AKTnXMJaVNGr7efUryzoFty
         iXp3FDTy9LzjT7gVByKUhedt1Agc0yZDUsYx2sC1EHUxn8IV8tPCRL106ADLe21QGQYp
         XsU3li7caVbxbXZ9OZiGmrbDzHnHgeAnUh8v+iroeMaqJBUYXgUfA8I4LpyCXP+LnhBF
         58V2/yJ2c56K+QbTeuHkMSDwRNRuz4zLmEPjRTnXCtuMvSF3dy7w0CvBCzHXv2bBzcCb
         w9Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=aZn5H3BibQIjCm6XCuZSPBoWZOto2pSlAUY4r4Wn5U8=;
        fh=JleVenhY0GMfmNwouuIH4nFj7DrXP4BS+eKknaf/j0c=;
        b=xxd33J7m5J3Jysq+RgabFgFMWHd3LlAZazqQlPCawH9efiR0wPQylRUakiVCHC9fFV
         obvj2H1Z9VQp6YcC5OB2oLot7HCfT5LRck+o2EnVJvmIR0GfeahpN7P1Q/tJaDARHKoy
         sYkBEFi9sS6M53ekDzOVZdRxeWbwkj8F7BJbh96M29CcsciNWY3Ff7raUZ3aqO0Zu9Rb
         TOilulmMXx4Uw4R5EwwUuL0+3eTxYeJKkCszokFWtPU2t3IXwzIxwfuDz5gf0CAfvHPl
         WYs2d7ANmHeOycAZ3BJySq5ih/tmotZ1XjyKL1o4DDoOL6GVT9pjGzXHUjm8cN8R9w+r
         iuiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bxSvwzcf;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l29-20020a05600c1d1d00b0040d90f651b9sor437589wms.1.2024.01.03.09.47.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 03 Jan 2024 09:47:23 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bxSvwzcf;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704304042; x=1704908842; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aZn5H3BibQIjCm6XCuZSPBoWZOto2pSlAUY4r4Wn5U8=;
        b=bxSvwzcf6kkWDCM52KSqXYti05cQb9NgIGMouKtj7/lZUPEpLHq59n23WGOKRWt99P
         hPJhY6CjIEI+K2ge2u5hAokhvz/wbQzE4mkhrePHlOM82xHS/CPbyw7gfsSXad+fwuLQ
         ULkWP2UeU4RCpQ1TFhTVD2E57y3CJj5z4mL/KKPwGaNK4tsV9xnrcdznaPxg80kiF50a
         zqL8/vBc/9gHSt7cjpUK4nApkYqMDPmrJl8a8qOOP3Y2TcHiLP9oRSa8hDnx/kIsvXFp
         Z3k9iZDVEI7RD0DJ7lJBVYCSr/WwAon5uHIPtJHLbolUmsMcXEyg+cnrC4shua6rU2Or
         ZxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704304042; x=1704908842;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aZn5H3BibQIjCm6XCuZSPBoWZOto2pSlAUY4r4Wn5U8=;
        b=N9eZ/zOzDF0MFEQZWKxAcJX3OBCqYMBXCEmvplgZj5ixvF2sy4cSjeKEu50sJsqx2k
         oKkQjZAj1u5arKHnULN3ABO40by1avyrHHjT1Zx2viqJWjSQZxQLjvQwFOYucbcjKKXj
         EtmhTYAnIFgCLBXcuejlJkocXb/rsXdac3T9158eOE23AjmUc50Ky6t7t0Op5T33XzHV
         wgSai4AlE4Cboki7dzw/DBwhaKnmKhXBudbZJBxjr1VMSPk5EW0XKUAJQ/m9xX9FiHLc
         XkRo07epvzNMWOOTWHXW8nHAgsB7KGoxuSSyUuNLGLTqdYHsBUkmEfXRn5gUIMhiRukS
         h/UA==
X-Gm-Message-State: AOJu0YxyEm2toKUgueuExxjnCSarDmav8UGIhrF0OPjzSfRCbSwAwGBn
	/wcRd8exl5Fc8Txyg9y/MZzTxVGQaGxiuuGOJsQ3EilXkM0A9w==
X-Google-Smtp-Source: AGHT+IEWSmwKYOBNA3zud+Rn8MIOuM7s/OmpOblX5Yr8XMRSMzRdlO4xFHDFR+JcT+JP+VwaTeY4Dw==
X-Received: by 2002:a05:600c:4b27:b0:40d:81bd:9d12 with SMTP id i39-20020a05600c4b2700b0040d81bd9d12mr743994wmp.147.1704304042639;
        Wed, 03 Jan 2024 09:47:22 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (tre93-h02-176-184-7-144.dsl.sta.abo.bbox.fr. [176.184.7.144])
        by smtp.gmail.com with ESMTPSA id t16-20020a05600c199000b0040d5fcaefcesm2946862wmq.19.2024.01.03.09.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jan 2024 09:47:21 -0800 (PST)
Message-ID: <f0fb7562-9af1-4448-b33a-ededd8072aef@linaro.org>
Date: Wed, 3 Jan 2024 18:47:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 39/43] contrib/plugins: fix imatch
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, David Woodhouse <dwmw2@infradead.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, John Snow <jsnow@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
 <20240103173349.398526-40-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240103173349.398526-40-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 5OIVWN0gtIIY

On 3/1/24 18:33, Alex Bennée wrote:
> We can't directly save the ephemeral imatch from argv as that memory
> will get recycled.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   contrib/plugins/execlog.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
> index 82dc2f584e2..f262e5555eb 100644
> --- a/contrib/plugins/execlog.c
> +++ b/contrib/plugins/execlog.c
> @@ -199,7 +199,7 @@ static void parse_insn_match(char *match)

Could 'match' become const?

>       if (!imatches) {
>           imatches = g_ptr_array_new();
>       }
> -    g_ptr_array_add(imatches, match);
> +    g_ptr_array_add(imatches, g_strdup(match));
>   }
>   
>   static void parse_vaddr_match(char *match)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
