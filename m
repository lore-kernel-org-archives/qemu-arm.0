Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1639215ejx;
        Tue, 27 Jun 2023 14:06:24 -0700 (PDT)
X-Received: by 2002:a2e:9d4a:0:b0:2b4:65ef:3af5 with SMTP id y10-20020a2e9d4a000000b002b465ef3af5mr22805053ljj.30.1687899984438;
        Tue, 27 Jun 2023 14:06:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687899984; cv=none;
        d=google.com; s=arc-20160816;
        b=F4Kvy3wmZyoUC4u+K9dPO70+TYF4lRStq2r2PSptCtr+OWKeoIiHzq3i2ox2HX014E
         Al4xemPaNcEdeIYlxqygtprEglWXRgSwBu3S6ZPpr1ltyhOriqaEcfB6poJcbkwIyfF2
         07jU3YsTwLlxAnUeIy2eC10NIvQ7K3tmbH/kJazlybhZAu7jeGTzRbKTf4s4Efos6FWH
         5erx2Jk9a9p2VcpUr4jbjP+TgR5q96+lDPOZA1yRZ0ZvwNCMx5pp6wGRZUXAx0IJ3did
         Bo1XB3Eg9tuXtgUWvH6pG2pWjmwV7ClbCWbXNardCnJt4wzrLJa4sQnPzXBfJUdweVK3
         HwNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=s+mxbvopcN8GhtyLQyosyHXduhB/LupAIEMRtR9S99Q=;
        fh=Tti5iY6tdwKQ6vxlTSmZ6v2Y0jcLETgPWS1w/ieRBfE=;
        b=y0bJRfMjUFYAfpaWEzTkI3EVdLfIBFcjgFHbmXtmH/aGrXOCe3jGPga2qwtA+Et7o+
         GLeOr3XVs33C9Ykf7eCJmFBwbOtSKokO/q/GJzL7wrpjqZWnwTlJnK8DTcbZCieHCKoY
         OrFXXIDT+LQeNXHk7Oqaecn9JlHo3fmawnHrzzuAfPhtHDHRBNslPjctVNIbUSGyg/n5
         ygTLH329Qhf0uXdSQwMKUMVTfYYNZJKMJ1qFoU7D2DluPGenciOZ4ffNsuo3EfFwUO/G
         wKpj0F74buGmwMhHcruopgrqLFPuK/+4P2v9WGmk4cV4ocxS0vbL1WBDeF9WlnaK+AvN
         oyuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kGS7onlO;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g28-20020a2eb5dc000000b002b46f6b5feesor2527986ljn.7.2023.06.27.14.06.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 27 Jun 2023 14:06:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kGS7onlO;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687899983; x=1690491983;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s+mxbvopcN8GhtyLQyosyHXduhB/LupAIEMRtR9S99Q=;
        b=kGS7onlOB4geoA/XdBFX+p9ywgVLF+Ya/yS6AYbiWQ3Xgp6uN1THRCrVkIka9JD4mp
         b70qbTp/o2pi4aEyOgieWX9iRjSyOlECI194uURJy+fl81Y9zly2XBy6RuPQ5ijBYg5c
         M8UKlf3+EhUjg94e4WBLY3oQ3HlUp0uGVTYhkI3G9pAYEN3rFjQCH+nJU91vcMRRKd7C
         7MWmwJa7GuX1EnyuPL1JvXFwZe3sWCfoQfGJu2MHkIFYh2BwwQSw9+YocBrLlXr7h9aP
         wlRm4/lpfie9khCsw78VqX2lMDrU8smc3KCzHfaFCKz4U467lYZF8WjIhKw2lhBTNkWg
         feOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687899983; x=1690491983;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s+mxbvopcN8GhtyLQyosyHXduhB/LupAIEMRtR9S99Q=;
        b=YwFwvVw7xZ2rU9GxO1P2RQcSoJq4WDdM8ktBX9QHGO8S90d0N2Ziaw3yLPGdCvPzhM
         Y7VanrHDbgTpzjHeZjULyttUu2LgBBR+f3MgcyWbc+Qx5OSh/r0E6zhsFj7VECdiQjJr
         Zq1qj5xgIQS7WdsCwI7zGhD83nNfuZz2ljy9hABwYZpBLlG+NfYCyuTxUClaC8E/2kwK
         vzF7ucwDn+S+YKKOAyvuDEpLU4miZniuimw+efz2LxB69LSzxXRbvzFdHR2Hr3pgc7k2
         cV+yJHsI/rm+LuGWG5A8oEja6MPDGcUUxowMVAGPKDGvKA9vClXS6y8DyzeF/ryhdy/M
         sZWg==
X-Gm-Message-State: AC+VfDxlOS9h8yiOaNWcz+a4T/y2ptSvFR9wbNr1rDWuE+k+qA7aHQZu
	EHBL26uZu7295NkMp6UUoAbwPlwtcZEijmdS0gPjMA==
X-Google-Smtp-Source: ACHHUZ4f1qVZ7/fRnZpaOeLsDQGLZvHLPTnJxTFvEeLT0DrtxXdqmDDvsfFz2vgB/xxlaYc+bToM2Q==
X-Received: by 2002:a05:651c:90:b0:2b6:b672:5924 with SMTP id 16-20020a05651c009000b002b6b6725924mr1623810ljq.5.1687899983545;
        Tue, 27 Jun 2023 14:06:23 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.199.204])
        by smtp.gmail.com with ESMTPSA id ce23-20020a170906b25700b009920f18a5f0sm1266693ejb.185.2023.06.27.14.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 14:06:22 -0700 (PDT)
Message-ID: <cafa811a-0212-36c3-4f93-b4937c7617c4@linaro.org>
Date: Tue, 27 Jun 2023 23:06:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 16/36] tests/avocado: update firmware to enable
 sbsa-ref/max
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
 <20230627160943.2956928-17-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230627160943.2956928-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: lliDJUH92faC

On 27/6/23 18:09, Alex Bennée wrote:
> From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> 
> Update prebuilt firmware images to have TF-A with FEAT_FGT support
> enabled. This allowed us to enable test for "max" cpu in sbsa-ref
> machine.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> Message-Id: <20230530152240.79160-1-marcin.juszkiewicz@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v3
>    - re-enable for CI
> ---
>   tests/avocado/machine_aarch64_sbsaref.py | 23 ++++++++++-------------
>   1 file changed, 10 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
