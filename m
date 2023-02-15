Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp389346ejb;
        Wed, 15 Feb 2023 02:57:33 -0800 (PST)
X-Google-Smtp-Source: AK7set9Pcs4HJWIkz2Y1cTFjHJmID1+9I0r1Z2K9tZumvnV4g6OcmSONiQO0lT9kappnc/nzapnv
X-Received: by 2002:a05:622a:1749:b0:3b8:58d0:b4e4 with SMTP id l9-20020a05622a174900b003b858d0b4e4mr1925137qtk.33.1676458653043;
        Wed, 15 Feb 2023 02:57:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676458653; cv=none;
        d=google.com; s=arc-20160816;
        b=EiWqnPnohWujPmBgbnDHLuG0imUQPNTlHU2yxh1c2tIKfBThVMP61XmkIjkhGiJh7A
         x/izm+37Gr4SmZqZTfmrv2nPxlnfB9R9dfRv+z7DCu3e+NI3MTVuI7S+3s7juQ6vdyjg
         +CRDRqfwfCbdbgdbZSEKBJZ7GHzZ3iVuu5zoLEczA7Or8PrjGrhGSF4RfHtdFFqu5XwN
         fy8ozhxc4lAHy9mopAUYbrtX2OP/9eTOC767urPxyW0+zfA5hvhS/DCNxZASaVOsL5VG
         Hk5OQzk7ecSi2HkKgrQZD8nMkU/Hm35zwXNsiSomirf0eb1DmAf5zsX5JufRG9PKPsMP
         OqCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=mp4SqVNtqwXiIzu8dHycszP9EdUnkoJsxgr3HBIXYEA=;
        b=R1Kz1iBilNxAXO41qRf5fAdwrLCX8HXSdVZMXZPr/m3slK3eEc7OGvXWBnwL/p8DWm
         eq1z5dNmBFeYlHXxADxutmr+BQtFVB/HbPlDPkQspMIFiQeOfJcZVcIwik7pRrjjKaEw
         auPmL2iXHdEaC3648rfL93AxUq04gwMLwoKn0nPGflhMS85jeDqvNFOMb2PP1XzUldQ+
         pROuDfb1F2KztZbWbRDmxq7gu3W/x0rGy0VJuDIap7U9RxyNMcZXk1iNjSd50ENLXx+9
         HeFE54h0VQy3+9pIoJ+hAX3dn100M6oNRHmwHjC7weE5RSXfUrtJuqgQfO4rbNEU98i2
         EwqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S2LK789G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s10-20020a05622a018a00b003b6914d574dsi14016036qtw.157.2023.02.15.02.57.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 02:57:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S2LK789G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSFTI-0006BD-Ba; Wed, 15 Feb 2023 05:57:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFTA-00069p-4U
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 05:57:00 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFT6-0000FP-UZ
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 05:56:59 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 s13-20020a05600c45cd00b003ddca7a2bcbso1220747wmo.3
 for <qemu-arm@nongnu.org>; Wed, 15 Feb 2023 02:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mp4SqVNtqwXiIzu8dHycszP9EdUnkoJsxgr3HBIXYEA=;
 b=S2LK789GsSP0cKHzOEGy8+WLCn/Yl2EkhFofQQvaEeLvjFggvHL6vzsyCtBp31anIS
 evSuFDRaZOw8GQfwXfpQfxBU4oSv0X15eUkpkJ92sv+Vqtsn+KK4wx+/hZsUbrHlKf9l
 q3WDEHDn8LPfJ01i9ancrQxea75vDzZwz6p9fCLDI0qDrwmfs+RVxD0iAooCgZuUSxWg
 VFhaU5vXviJW5pdsRmSsvKaENuA1Ea87Hf3ppIouLvoFhKcnUwPzJZ3x55E0Yk7Z4emk
 dzrM7e9qjHJs7+vP1a99AQwb6Fr1TiA0mc4F5XFRxhcp3HlLzKD359RE9jdCYe0nwFSd
 b4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mp4SqVNtqwXiIzu8dHycszP9EdUnkoJsxgr3HBIXYEA=;
 b=6lkwTdrkpO0CBF3FiGcknHRTowVwuQlnOieA/jANuC2K3J1dEb/G8FlI4gWDhUcQHY
 iJh64EYrE18wZFooMjfDVh1S2TfKKiiEEs9PZzPJpvbsKBDjMfqFIeX3Av55ne26yAl3
 CAqv22PluIOWDu3iFg8VblKBwbACRcOpRT1OmCgpdj4+lHFngXj2I2HZeNlAzOW7M9bk
 YUYAesdJana5HfRnunAsiEWJY3JBVoRPHMGS8Fe+r5L8j8ZzDpJL8tJdf9YBxC8Zh/ee
 QxV0WReg/FcnQm41nSl3E63t/+B/pWZbTnO8trY5uyetAhxSziw3yd6+5lgqoL1XDZ12
 /N/g==
X-Gm-Message-State: AO0yUKUoVbCClUd96lR9BpjZh4r4YIAP6cJIJ2WxNpXHQUEd7C+Fwk/U
 by1S9NToO1QYkLwy8y1gXh9DZA==
X-Received: by 2002:a05:600c:4b1b:b0:3df:fbd5:690 with SMTP id
 i27-20020a05600c4b1b00b003dffbd50690mr1468227wmp.17.1676458609360; 
 Wed, 15 Feb 2023 02:56:49 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l9-20020a05600c4f0900b003e001afa274sm2001284wmq.2.2023.02.15.02.56.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 02:56:49 -0800 (PST)
Message-ID: <2a87b119-4782-ce91-5174-f7b18019b3fc@linaro.org>
Date: Wed, 15 Feb 2023 11:56:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 5/8] aspeed/smc: Replace SysBus IRQs with GPIO lines
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230214171830.681594-1-clg@kaod.org>
 <20230214171830.681594-6-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230214171830.681594-6-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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
X-TUID: hkkhmvkkYNWL

On 14/2/23 18:18, Cédric Le Goater wrote:
> It's cleaner and removes the curious '+ 1' required to skip the DMA
> IRQ line of the controller.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/arm/aspeed.c     | 2 +-
>   hw/ssi/aspeed_smc.c | 5 +----
>   2 files changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

