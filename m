Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1250361ejc;
        Mon, 13 Nov 2023 03:03:53 -0800 (PST)
X-Received: by 2002:a05:6512:15a2:b0:507:9ff6:75b6 with SMTP id bp34-20020a05651215a200b005079ff675b6mr5950290lfb.50.1699873433629;
        Mon, 13 Nov 2023 03:03:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699873433; cv=none;
        d=google.com; s=arc-20160816;
        b=LMOM/SCMljXoyFyXpZ9Cjq2FzPXsC6M5uv24621bysmUpYKbiH3//dgYtbfT2g2OCT
         x40jj8ckPU234M5tIPOZCb9gDzgpXqo4eMHzKO1bsAvOHDpfgtROBDNN807MzZgfhCaJ
         /LzpwIWVkaGA+7HjgeDvzlK0Cpr9o1P16XnQmqGkFRTbBrso9B4I+8urrqKfKHI+Wf+U
         J6s2pYxHZ4BLMCx7wfcOzlDeAeDQ9m6nurbNpdxKDQlVYg2RTOUbZuh7xRSrFsjWfkjx
         0EKKYQgLcSNEPV2zfoJdNm9eFYMcU9VULMoKkY4297NJAAVuzpf9YNcxUAnqs6kCU3Ds
         1iig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=QKp+xYb/ek79oav1SQxQszAVvb+w9y9wc6rs4s4TIV0=;
        fh=dex3qNzObdPYGIcX4ATRfXt7TTGZkQvCR5VPSOyrVXk=;
        b=Y/g8baWhmAu1bI2CF9xZbmnuDNsnj7byAeryew2go0nL3OFhxl25zpRaUT1YPispMP
         Cn3PriU2ldzMnkFwDIRp3QBaUXqbSqCuhQfhs+PVjLJ2UFoYK45lTn6m7wqXsjp9oREC
         Sm0fnK7v5gq4QYw9gz6fs5zZet4ThYU9gTTJ2UkazLyAAtCFAFFH+0ChkbbU5tD6utfu
         A8DrjViEwq8Z61f9+hIbiSsC0qu/1jxKNanraIznXLMow0eh5YokVS4dJS6mZQOEpADB
         kMDWNANVgF/Z8kzjwQM7edRWd2tK6SkvboAh4pexMp6HxBLrBdrGosmv+PJd38sHI/Jl
         QkZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kbMx3TbW;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id dc9-20020a170906c7c900b009ba0a38f2b1sor1037313ejb.20.2023.11.13.03.03.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Nov 2023 03:03:53 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kbMx3TbW;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699873433; x=1700478233; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QKp+xYb/ek79oav1SQxQszAVvb+w9y9wc6rs4s4TIV0=;
        b=kbMx3TbWP5UDEEMwDJcM8CUzwivukIXalMYELaUoY5NTL+9DzdAIfZP++eswynUcSo
         a/Yj6gb0jz0AcegcjJB0BvcRWCB6qXkrAaSfxLsnDOkidZhFRaZ4bZc9cl3SK4yQoe+E
         hqksBxKu9EZOrGySK+d82/EzoLgL3fEK3JNVS0n8dwkn8aqmyjdoG4xThGT9GNDHfrsu
         YSap8+xhVqwenVBMadV0Q7qHDZb5gJc+xffZdq/JB4UTrcH3V3wHOJB5gDVBo1t6LYnD
         y4/K4nnqtMn6JGhGMdAjt6yhrgOoki0lGvY91555qBFeNCCeI7mWtAnFz2vOqFYIk9G7
         T5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699873433; x=1700478233;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QKp+xYb/ek79oav1SQxQszAVvb+w9y9wc6rs4s4TIV0=;
        b=w1oG/pzdArOkNfEj11oxeoxEQlm575AZbWA/2mOEsLzhZK5sphNjN82/AlP+UXLu7m
         mkCX4a+3WYBhDWOXL/nilrDj6mfDEEFYtvCrkcgOQIJ9uhZN7mZeOCbkdlJ5E7jhxspV
         /21pOLVjgw3FAVdwGGVqwPMiQwF4dcSA9uIgL4xUXKNEqneis91U1DfwaYjF5x4QKNW6
         i8xiK0xkN13cbPk0j98U5hmmDCb7Rhq59AG7itth5h1dlA/0ATln/00vCZ8QoZLN1GxE
         yCMSxXohfwgzuYAkCOuOxbuOfugOh6M5/i/IYMYEla1ErXLt0PH5CQ0DqcLd9HUrVyFA
         1R2A==
X-Gm-Message-State: AOJu0YxZ/9KDNgQAbD3e037SpDGvATi7MlSXNuaPNBH5L/gagV1DH0Wk
	dO5V69Arpe1bSBvFodQJWE/cAQjTyYcvSuZjql3B2A==
X-Google-Smtp-Source: AGHT+IEcpVk/ZJKH5fUHjDdlkXBWtXHg+h8SVusuB7e0Qp2gye6Uj+gs62g2kIJC5D/Yp5I7FMSxeA==
X-Received: by 2002:a17:907:20e5:b0:9e6:3570:bc0d with SMTP id rh5-20020a17090720e500b009e63570bc0dmr4636729ejb.59.1699873432995;
        Mon, 13 Nov 2023 03:03:52 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.164.221.204])
        by smtp.gmail.com with ESMTPSA id dx9-20020a170906a84900b009c3828fec06sm3838073ejb.81.2023.11.13.03.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 03:03:52 -0800 (PST)
Message-ID: <4d71476c-7de2-4e35-bb7c-d687578ce91e@linaro.org>
Date: Mon, 13 Nov 2023 12:03:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/36] plugins: update lockstep to use g_memdup2
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
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
 <bsd@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Laurent Vivier <lvivier@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Riku Voipio <riku.voipio@iki.fi>
References: <20230627160943.2956928-1-alex.bennee@linaro.org>
 <20230627160943.2956928-20-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20230627160943.2956928-20-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 6S01oC/2zZz8

Hi Alex,

On 27/6/23 18:09, Alex Bennée wrote:
> The old g_memdup is deprecated, use the replacement.
> 
> Message-Id: <20230623122100.1640995-21-alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   contrib/plugins/lockstep.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
> index e36f0b9562..3614c3564c 100644
> --- a/contrib/plugins/lockstep.c
> +++ b/contrib/plugins/lockstep.c
> @@ -130,7 +130,7 @@ static void report_divergance(ExecState *us, ExecState *them)
>           }
>       }
>       divergence_log = g_slist_prepend(divergence_log,
> -                                     g_memdup(&divrec, sizeof(divrec)));
> +                                     g_memdup2(&divrec, sizeof(divrec)));

Actually I missed g_memdup2() is GLib >= 2.68. For QEMU codebase we
define it in include/glib-compat.h, but contrib/ files don't include
that.

So on Ubuntu 20.04 LTS we get:

contrib/plugins/lockstep.c:133:38: error: implicit declaration of 
function 'g_memdup2' is invalid in C99 
[-Werror,-Wimplicit-function-declaration]
   133 |                                      g_memdup2(&divrec, 
sizeof(divrec)));
       |                                      ^~~~~~~~~
       |                                      g_memdup

>   
>       /* Output short log entry of going out of sync... */
>       if (verbose || divrec.distance == 1 || diverged) {
