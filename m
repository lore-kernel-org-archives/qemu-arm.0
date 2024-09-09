Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1012292njb;
        Mon, 9 Sep 2024 10:52:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVNNbjR9aeWBd0RDh2HAMLSgt9U4Yg3CDRdUVn+QukHlsYCEydsCSHKT2I1FA23QVnxaRO7p1xf1Pz5pw==@linaro.org
X-Google-Smtp-Source: AGHT+IFeujLXCSv2sIO6I2qCwg7Q23LwDRHQriF+HV4OxjYIs01r7zAU7yHtX5OScErOMdUYYbhz
X-Received: by 2002:a05:622a:1887:b0:458:26ef:6c with SMTP id d75a77b69052e-45826ef080emr87165071cf.13.1725904335829;
        Mon, 09 Sep 2024 10:52:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725904335; cv=none;
        d=google.com; s=arc-20240605;
        b=KNxSgnbbQUcGjM6R7f9f3ARn0udaOwqp9eJk/fFRGzaHUEjdNRkpQvGz01FriRiJz+
         PkkWTuSA1w+TJmE4HhUMW3H+x4VNwyjFX3l6dChhD9YbWjPYhcwGB/y64IMzpeQTSFPJ
         InH8InMo4dt3HRkh3eaU1Oi2icC7Ki8tpZhBDyaeWF8k7ZonlkP3RNWvparTja1PlY2H
         0dGJxtX05vohsogXqeRj/HouYJmMwfwsI1BfXrdwY9go0zy7B8K7+BHZavGsQMq1uzYF
         XCyjCvHgGcHF/qN/gklp1ADiA1gujOlf0NG5MVmQlSp0kzuYqoiOFjyot7W9RBBaBIdN
         FiPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=valE2ooTflmcoTlMFRDa9BC5mo6aZUfVEoFZJsfXN5c=;
        fh=5b58MMyG8VfzJdB4weDyQKibWCd3gWrPpAr+CJiL8nw=;
        b=EmFGtZCX4Ng6T5baDKwTGBEuV4dtjTLgI1pCdLIZAZnojOQCaqKnZWbq5aUcwDbqgD
         j3jjShYoFwC0Ls3StStFFGJ3vpOnbmYNLPXrOVqbfyzpet1aboXKnlRvrN+U4SKTbGI9
         w+26V6vVavJ9Iazrw1Fr0PULCdjdkRAqlmgsm8e6OknwWcfUEcnUKeA5COL3q4aLuS70
         2lErfvsNK9OiJNeruzyJ8ckG0CHiEGqDGOlASQpfKKtOmblNeJ4WSUa4cJnATyMO/WWt
         UZ2z+m2Ebd4i7+Q/0hQSQSVKRFjQfmmVOcIVE9t062YPS8fbYObbhnmyCU1bBMHK8Uyp
         kAGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sYgDzmRx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45822e62d00si59003061cf.122.2024.09.09.10.52.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 10:52:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sYgDzmRx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sniYb-0005C9-U1; Mon, 09 Sep 2024 13:52:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sniYX-0004uK-Mq
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 13:52:07 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sniYS-0008RX-Cd
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 13:52:05 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8d24f98215so302353966b.1
 for <qemu-arm@nongnu.org>; Mon, 09 Sep 2024 10:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725904319; x=1726509119; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=valE2ooTflmcoTlMFRDa9BC5mo6aZUfVEoFZJsfXN5c=;
 b=sYgDzmRxNrGzxD2/NSMfK6lzsw43UhKWzIDpjp8euEXIDu7Y6jkAYR6mdimW8dnCfr
 iYEL/vQ81GZBPuHlzNRrqpXzS4KvYtLhMEViu0H+mvL3KsYhllXAzfujfDLREsG4nNqL
 slxfq/ySN2vTXg46wz7Wg81ON2Y1Nsfvgwa3CmQe+dgPKjZ9VNhEFVQ/wx6GVDhs7K0/
 Xn/enFEcnp0nJdwoUQiLQGbFwgR1c1O5HiVSODHQTszP9o35CHIno2uLEdkSKzOcgGwh
 nJvz5pZrwarZ02PxLz+N0c+na01GDZMkoILSQsHhJEBNePkX+QIMcuDVDUg7WcaOcjP6
 fHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725904319; x=1726509119;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=valE2ooTflmcoTlMFRDa9BC5mo6aZUfVEoFZJsfXN5c=;
 b=gq2zwkVoOzXHG7u8+dm9Lgvele2HXDcfc6XWFTsF9mXu//XblFmWgvsrvwpSDDTYMs
 5PqIs0O4ZLRcVtKOpQSYkeFUmCwGHoCBWWaCmRWQvgkqp8f1bsi2Rf8cHlbDoBcqxbWy
 O7G44N2tcvB+FDPeVyoGvDSrpgbEya7feJUo5S4KZtub+bLjW+Onk8jq5dMgPWKidShq
 2VKvD0ATGDRIptvHrAeQbJOyK+wVm2cv5Rth9dvhlL4KsZ3EPFvaT2W7roCA+p56FkcK
 zI0DtDKqsTPAv2BhPuc0lPt/w7S/LF6nAdNmHTfOeEl4k6UZ8I9ysQzi8LeyHfiuXdFe
 n9gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYDFFRj4Qx7MnSxfS/tJFUNenK3rSStgX9HFKNkyB/1BHajWzU7SbVmHdylE+rhDOyQQuFFqxLHw==@nongnu.org
X-Gm-Message-State: AOJu0YwP5gJKB802khkKhE/8WkYZQk5bcOJXCw2z4T9LJXHCgI7fkmO8
 B7x6RzRwfG+M+bmgStwF4KOXFtfFm0DuGvarghMAlwGKhfdTgR4/j6MUtyHInUQ=
X-Received: by 2002:a17:907:6d0b:b0:a8d:25d3:65e4 with SMTP id
 a640c23a62f3a-a8d25d3ef49mr607626366b.36.1725904318491; 
 Mon, 09 Sep 2024 10:51:58 -0700 (PDT)
Received: from [192.168.69.100] (nsg93-h02-176-184-54-166.dsl.sta.abo.bbox.fr.
 [176.184.54.166]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c74286sm370505866b.123.2024.09.09.10.51.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 10:51:58 -0700 (PDT)
Message-ID: <671feaa9-06cc-414c-a8d9-c8275a304e98@linaro.org>
Date: Mon, 9 Sep 2024 19:51:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 37/53] hw/arm: Remove omap2.c
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-38-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240903160751.4100218-38-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +SFmUxtGcZMU

On 3/9/24 18:07, Peter Maydell wrote:
> The users of the OMAP2 SoC emulation have been removed, so we can
> delete omap2.c.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/arm/omap.h |    8 -
>   hw/arm/omap2.c        | 2715 -----------------------------------------
>   hw/arm/meson.build    |    1 -
>   3 files changed, 2724 deletions(-)
>   delete mode 100644 hw/arm/omap2.c

Yay!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
