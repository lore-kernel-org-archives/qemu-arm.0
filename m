Received: by 2002:a17:906:cc9:b0:a28:7ef3:d049 with SMTP id l9csp629426ejh;
        Wed, 3 Jan 2024 09:40:36 -0800 (PST)
X-Received: by 2002:a05:600c:5187:b0:40d:8892:f4f2 with SMTP id fa7-20020a05600c518700b0040d8892f4f2mr2549612wmb.175.1704303636863;
        Wed, 03 Jan 2024 09:40:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704303636; cv=none;
        d=google.com; s=arc-20160816;
        b=DhT2qVy6KHOVOpd5u9ojWVKTorkamvw8U/Na4EKpUraBhU9PmQW4NXLPRIPvZ00nG/
         /e+sniR888LA2IGWiYfmsaFC4tgfqey+ZpsQYCUvOYegA2xQ2IfmlbiXL7jcMx7kBS2K
         HzY4/Re9nXckQdmKhef8mPwEBmxyQ6PUlYHJ00iXBGvSD+lmJTnM1BxMvBMa+6Ll6tFo
         CyTN7MczMds0kT02HaRnYT8umKlvproh63nicZJJmIS4GhypaoTggiwpbQtVr5VWZMeL
         Bw61IeDQwsGSo1ncdUdunRk+t8YJLUQrzrOGtx3V/ubN6RyIq0QkTvQuTedL4OFrEvXt
         M2Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=dIHFlhhFim1PtGeG0Zm6sx8pmWIRl7Sld9fdmoYExt4=;
        fh=lmF7TvmYTprrEpgzLmwYMLYuqR3G5I5vHAJUBycJxq0=;
        b=NIaIbowaBhE5yKCOU/1U6+cGJZo9e15IRnDiNAPif5+JiTjNEnAzFR4WQP6AP0NT7d
         JAFAcY7GRFNN9urmbDHe0UU6SeoCFidsFvZ8FYtKFimCBfd8iw1bzqdNTSxGQypuX3Zt
         8fy1rpEwtU6KicmYrkxrNmUUDse/n9RK+t6dtWfRozw8zwfhdjZp8IA5wFxudSeC5nF+
         F+pjnJpn3UIxHosIppc4M8+MgN/bEEtCGbm2P4A/WEIgMaYXeMPbx7Gecz6K9+YWQDzh
         0qU/EOHlb8KgBEcE919yOCl7D9Lmrpwj7oe6Tdub8yKTQYW7kEmLT9BlEiC/evTP1cxS
         BO9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VFokYROJ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 9-20020a05600c240900b0040d5ab899cbsor5733911wmp.11.2024.01.03.09.40.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 03 Jan 2024 09:40:36 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VFokYROJ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704303636; x=1704908436; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dIHFlhhFim1PtGeG0Zm6sx8pmWIRl7Sld9fdmoYExt4=;
        b=VFokYROJPyT7+yktOFKxiVbMgqIIUPdRKJSQZscy/g271aBWIg4ms4WMvQH4H0Q4no
         YAy2g3qTGSg1+eIx0nx4+qwDAALzAnACiCT7Jvj4WphZhG3Gd+p9O4JY9iFhQi0dCsJ7
         WmUA/eZfvP+hWkWljoPFxmE5qI/zXtIxm7lZzeE8Zj1saOBWdXGsyYl4o2z467z0Uxw9
         Klx8iq51X06gTxwYQpUML9yaKL1Ry1kBtVGsRiztvnWaRcb00u/A/Ck9vnll5QwC7uvu
         TpBzIPoaV/yeK/gW8u1Zpb8pd9/IsjXGY5dQsBOAfJAAOfcXssb86wPuy3eObzIcIa+m
         Jtvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704303636; x=1704908436;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dIHFlhhFim1PtGeG0Zm6sx8pmWIRl7Sld9fdmoYExt4=;
        b=O2ZgSmyv6NotnytlDUrO+f3ScCDFT1od35FchyLCoDcQ+TQ+U0pYL6BLyfJXGWtLCV
         PMmAIji2x7txFuS4kmWYOWCMVuL1IUeN7nEjfP6ORMOzJroakgOq1bWl7mWQUgGjJmgB
         9qn/LN3H0plNSYeBbtrRQTUH2MuwQZTxHFqUP72MGbC4LEHWZpz7HBvGS1n0qhx8+iQH
         LedFKZDO6tdeCqaypZ0DnEc3RMDZwo09c/f5URRmdOYUU074BspY4OnbzZ4LYd0tl9AI
         ePBM2Il1uDW3aJhL5/3885WK/I4x5GmaTYthYqNbqK4iUQ088O+9wr/pMtzQ/PNyq4EM
         NA5A==
X-Gm-Message-State: AOJu0YzthaUKCpWWwTLzlXDjQ7VLr8gRg1qJyPJhFMFfqJ/jOnu19PWb
	T7mHIOLLukLFybcRWUc6qm9SlJC/V2LGn71y864r6c4dYlu1nQ==
X-Google-Smtp-Source: AGHT+IHw8JLMQzv6qvy0MGZez2fPXn9kO2VaZ99bo/3mKuKZa50Y5vQTqY/gwP/E+CV4Edxm+vZCgA==
X-Received: by 2002:a05:600c:2284:b0:40d:88b8:1bda with SMTP id 4-20020a05600c228400b0040d88b81bdamr2621257wmf.116.1704303636291;
        Wed, 03 Jan 2024 09:40:36 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (tre93-h02-176-184-7-144.dsl.sta.abo.bbox.fr. [176.184.7.144])
        by smtp.gmail.com with ESMTPSA id k39-20020a05600c1ca700b0040d8af75e19sm2963165wms.24.2024.01.03.09.40.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jan 2024 09:40:35 -0800 (PST)
Message-ID: <084d127e-1d77-4c45-b8e9-fe3d867e7755@linaro.org>
Date: Wed, 3 Jan 2024 18:40:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/43] qtest: bump npcm7xx_pwn-test timeout to 5
 minutes
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
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
 <20240103173349.398526-9-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240103173349.398526-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: eMIPJ2fcRSyN

On 3/1/24 18:33, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> The npcm7xx_pwn-test takes 3 & 1/2 minutes in a --enable-debug build.
> Bumping to 5 minutes will give more headroom.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Message-ID: <20230717182859.707658-5-berrange@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20231215070357.10888-5-thuth@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/qtest/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 000ac54b7d6..84cec0a847d 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -1,7 +1,7 @@
>   slow_qtests = {
>     'bios-tables-test' : 120,
>     'migration-test' : 480,
> -  'npcm7xx_pwm-test': 150,
> +  'npcm7xx_pwm-test': 300,

The tests seem parallelizable, maybe this file could be split?

>     'qom-test' : 900,
>     'test-hmp' : 120,
>   }
