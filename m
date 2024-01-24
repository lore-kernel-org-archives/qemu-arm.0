Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp602322ejq;
        Wed, 24 Jan 2024 15:16:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpWov3ylANzLHUl1KyJNN3x2iE+2QeknXCZfYAzNcvrnvXjj5YsZGYgEzvP+64UFjSmYcC
X-Received: by 2002:a05:6214:5297:b0:686:3eb3:a3a1 with SMTP id kj23-20020a056214529700b006863eb3a3a1mr23996qvb.106.1706138166597;
        Wed, 24 Jan 2024 15:16:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706138166; cv=none;
        d=google.com; s=arc-20160816;
        b=ue5hPl5AUiynL8Y2M2eqOIN865uaG6Xhr+DlO8N1kRn7DrQhjrCYKad6ser7juRQKf
         M5NlPm2ivX6ZFpzpy+6wrAwL9spZ1Qxb4sC8K0HFyx8U6r01hzQNsMB11ppeg2ZCt/0H
         eRqjswhuDlF6pEgNqL1DIQQvezW4Zj+qi9mKZSq8xwucKKCXKdFzJUbB/rlu3LWUSHjV
         uH6cqU9V6yVScst2xlhmfwDWHkUNtJnDXHCUY1LKxPUF9NWAv/bsE6FzXioLhVgM8AIG
         dWUs13SK9X0TaMnOSWEli8BHmTyLmdjkdZcnDakNdvE93FHeqfRbm9/EYDbADHxnS20J
         CWoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ZEvcfSc9zNHla6Blo1/aB39jbaSk7ePfsxr0fAp1UyY=;
        fh=tvSoKfKG0C5+rZg70buX4YLSasjjtzKPCVsIOCyBYc8=;
        b=K27cjH61cq8+/GCi+ueru4rNUR3CBdoJCH6/1YlOEYFgiR8liWAepjQsXTMMWLOOj/
         I39MuE/TekNBUZ92YfmcjDUN5UiNMxdgJTK/nn37/c5nkUD6qoHZfATPIiXJz5cCVroW
         x3bosVrIbtHPm9BC7WR74a7HupciqUG+57NIgoCIL6EVxoJOdqetsKCbZKMcRTIEB85L
         ohJKEYpGrYhLfLvfQFNGN32aqckokr4QS+TtcVhkX8zi45gNx4o+sK7Vn1exiudA8ApY
         NU8Hkz1rn7a1lRivHjx6gAgmlXKZpNeKGI8/U91/s/Ilxi8eY8NN+T6mE3+vbGBcGEVY
         xvrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ie/4lTQr";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h20-20020a0cab14000000b00681903304d1si11327849qvb.185.2024.01.24.15.16.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 15:16:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ie/4lTQr";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rSmTB-00014D-S3; Wed, 24 Jan 2024 18:15:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rSmT4-00012s-Sv
 for qemu-devel@nongnu.org; Wed, 24 Jan 2024 18:15:40 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rSmT2-00051z-Dq
 for qemu-devel@nongnu.org; Wed, 24 Jan 2024 18:15:38 -0500
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-5cfd95130c6so1706140a12.1
 for <qemu-devel@nongnu.org>; Wed, 24 Jan 2024 15:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706138135; x=1706742935; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZEvcfSc9zNHla6Blo1/aB39jbaSk7ePfsxr0fAp1UyY=;
 b=Ie/4lTQr6ZzJEF7qs8wfq9qYRJlglvU5td3iSo7ZOAeIdyM5aEV+hGc/dzIXnyoLZp
 WQj8CEw5+4a5xxs8Nmw3gtF4Z9V4QWJjElBmYxWCr//hZvYd4e4ZliGeeys4ccY8c548
 MH3cJDiPa6m7WkBA5tJNPjLGfHTIZKxf+rgkIy8mPlOFbbSazoSiMUhjLqsLijrNXhu6
 BemmdXd38tGl1QE2wiLcykvXDsMDuDDteQN+11Z+cHSKENhfvWcWAgitHqPNvbZ6vt8g
 Wn8KgdynUJf/bTjqu+LzbKSnpZNb5iQsfJEuEnRJplUHX2F+t8Se21UTwQrK0mzLEctM
 awJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706138135; x=1706742935;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZEvcfSc9zNHla6Blo1/aB39jbaSk7ePfsxr0fAp1UyY=;
 b=Wp7ffVzqJD8ZwXVADS6pHAkGb+CtakjjsrKCgeGns8rbz1Ln5zJVGnWYAztxOsqB/g
 Wm2nVEbeNstzvXUDSHEN1pdUOPBzbQXm8p1xhGNjmmb/78/vT84ozzNT8lXf4RqvnKpG
 RVzPwWSrcP0HQBsQVGnMWV0JBx5ONE3NX/6sno7wRRAFd/EfK6rMUxgZ+uzu8Hf7qZvf
 hRgByDmsUOcAyMzGeN0AsYEbjiu/QWxSfGmnhcgUqFVyeT1SMf2xUc3Wu/im7E6qv51o
 qPvPZUHBVhp1rd9baOCrfEhFjEqgvWfXDbKeWdojS3/aPfzFuDKt3sjRehI2kVcMIuJU
 p5Fg==
X-Gm-Message-State: AOJu0YwEyln4BFKdLYbxs+G30YKunrT0eHE9lTSgOok16pAeA+pFpKdp
 hK0aEM5URh1Tb34Gru7firofC17lxPkBdfymoT66mrCFP8casZuC1LBA1yTsrio=
X-Received: by 2002:a17:90a:c691:b0:28c:8478:f4aa with SMTP id
 n17-20020a17090ac69100b0028c8478f4aamr78233pjt.66.1706138134844; 
 Wed, 24 Jan 2024 15:15:34 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:5fcf:9e3:2e58:9c7?
 (2001-44b8-2176-c800-5fcf-09e3-2e58-09c7.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:5fcf:9e3:2e58:9c7])
 by smtp.gmail.com with ESMTPSA id
 ei20-20020a17090ae55400b0028feef0f956sm192121pjb.17.2024.01.24.15.15.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 15:15:34 -0800 (PST)
Message-ID: <dd1b61d7-267f-4f78-90cf-e25468747b08@linaro.org>
Date: Thu, 25 Jan 2024 09:15:28 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] hw/arm/aspeed: Init CPU defaults in a common helper
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
References: <20240123224842.18485-1-philmd@linaro.org>
 <20240123224842.18485-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240123224842.18485-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /aiMGdH8R55D

On 1/24/24 08:48, Philippe Mathieu-Daudé wrote:
> Rework aspeed_soc_num_cpus() as a new init_cpus_defaults()
> helper to reduce code duplication.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/aspeed.c | 71 +++++++++++++++++++------------------------------
>   1 file changed, 28 insertions(+), 43 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 5b01a4dd28..636a6269aa 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1141,10 +1141,14 @@ static void aspeed_machine_class_props_init(ObjectClass *oc)
>                                             "Change the SPI Flash model");
>   }
>   
> -static int aspeed_soc_num_cpus(const char *soc_name)
> +static void aspeed_machine_class_init_cpus_defaults(MachineClass *mc)
>   {
> -   AspeedSoCClass *sc = ASPEED_SOC_CLASS(object_class_by_name(soc_name));
> -   return sc->num_cpus;
> +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(mc);
> +    AspeedSoCClass *sc = ASPEED_SOC_CLASS(object_class_by_name(amc->soc_name));
> +
> +    mc->default_cpus = mc->min_cpus
> +                     = mc->max_cpus
> +                     = sc->num_cpus;

Not keen on that layout.  If you don't want to repeat sc->num_cpus, maybe just pull out

   int n = sc->num_cpus;

at the top.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
