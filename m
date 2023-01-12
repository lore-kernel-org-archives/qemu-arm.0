Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4756055ejc;
        Thu, 12 Jan 2023 04:54:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsj2XDTddVlbvOvn7Z81DZuMn2fjQy/dFcSznitw+ZL07lxkW+GOXiPARrV3hMo6iGllPjK
X-Received: by 2002:a05:6214:5785:b0:4c7:cf4:f424 with SMTP id lv5-20020a056214578500b004c70cf4f424mr127528028qvb.35.1673528060726;
        Thu, 12 Jan 2023 04:54:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673528060; cv=none;
        d=google.com; s=arc-20160816;
        b=Q1Er3N3a58udmkxmd6jfBytzyY6Fphe4PV6VipQAO7rto+8HJBM179KV1ahGutRA1j
         W2oPWwvIKqPopJXBhXlKje/uIQzQOJ5Dcc+q38AGGWUiwD29AKojVAKCNbLETZEbf+LL
         se9G4e2ivqcFwlVDhmVhP3cw3lfWx7bQ7XH7qpCK7ny3LHZbCWzS72w992iVLDW+TwpQ
         Cyg7IhXfxdFHZNBKe51WfFJiTNO3cZLd1sOCvN4PiyRmkpePsfNbgZhQYC1MuMZsoXtX
         7S25h4t2CeYWvay39e3Xp+Efpwthowb8rrWtpq26V1ptVN297eAT+rZmNKtu1NJwhMBG
         lRDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=s/hHhUzGA/RNf52UHfmHzkNBpR8Wdm5LS2lPjxjkQVI=;
        b=wRfYVANRrhX1Xm7gDOzUd0OtWGCp7IF7NtRs1jWXaoyFxyFzKxd2J6jKMpmWhbZmv+
         LMAJg1AvfTxh7iGKPZyM9HalaST6yDMO1LTrom5WJY5vM8JWUCCOhBfne2uNWLihvugC
         SxDiFwBP34KJrFX3d5PqOHfgU72NPYzHZFzigiIhMqac5aPVzrLaRRWh/phE8THx1f+m
         ZDTCzCWVXhRo2tIxbAEOAa68KWQNELj8RTsVYU7fht3va1PeQ4+5sd4xYkurTQLw8VHY
         1EcO8Xq6tMfInccgCaQ+Ivrwm4mcKCKVAMUo6cmUnHEiKzNx2cLwmsdg6yKr6ZXULBoe
         UiPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uqNDZKnA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTP id lt16-20020a056214571000b00531b56e9826si9707539qvb.45.2023.01.12.04.54.20
        for <alex.bennee@linaro.org>;
        Thu, 12 Jan 2023 04:54:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uqNDZKnA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFx3v-0001nO-Oa; Thu, 12 Jan 2023 07:52:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFx3n-0001kU-0g
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 07:52:04 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFx3j-00067H-RK
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 07:51:58 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so16508499wmb.2
 for <qemu-arm@nongnu.org>; Thu, 12 Jan 2023 04:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s/hHhUzGA/RNf52UHfmHzkNBpR8Wdm5LS2lPjxjkQVI=;
 b=uqNDZKnAIeLS1g74e9GRErsld2/fz1e4XV+tiIXrsqKZmNrKBGjeXaH2BVLjcOSowR
 uYw8qtpVOh8noi1bZcFdcnIFf8AlsoMwfsRBaMHfrr88O6+fJ558VTBp10rQ2h1j/RaC
 nowwHuUkxh2CzrqQSlv/i89JwiBKwsx81gp55CH0EHbW2TBjwSWNEZkNWZb7C2Ht0AhB
 trkxPvEPlrWibGul2fgDJRU8lA9iFXUXdW/0pSmGYH9f95GirsFvo1bETA5OIVJzFTDs
 nHEIUPUvCzuCv1aAjfXyZCgWEQRY3ECu5EOxgE17+QBots4J5J+k58lxYCpgPZEokpY7
 zXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s/hHhUzGA/RNf52UHfmHzkNBpR8Wdm5LS2lPjxjkQVI=;
 b=OLLPqSR19bzkBzoFiIkfdiAsEtTEQID9gA72hseWBc6IB6SB4jQ1uN+ktLaGHiGEyW
 3oReevwVGpno8MbuCBEvHjMBtzn1e1Os42PWQME454lyYMSvkzPR53jEYr5q1KfGzhrT
 iQrLgD66NmcFICR6GKtMHuoyrKexTxCQjWzi+7nXnbq+kSs09DBchdsFWl4Hwepq+V6q
 buYx1oPG0EKubqIN8ojr/Uw0Ja43Uuk/d+RAI/V0uw2gEpuWXyQ/Dngx/GpIfVv20E/M
 RPmj6ib9t94/HlLMknuzCzYkFDNvV2k2h1vmekx+Ml1uBhG15DufVAddceoVHMevrNCg
 xiJg==
X-Gm-Message-State: AFqh2krzclGJvYXQH0/SFa9D6LDcYyxUSMnCWToM+9sclPAfDfd5Ic+t
 /NrkFsuJatP6zZ/fvda2XwJUNg==
X-Received: by 2002:a05:600c:44c9:b0:3d1:f6b3:2ce3 with SMTP id
 f9-20020a05600c44c900b003d1f6b32ce3mr65786287wmo.35.1673527913467; 
 Thu, 12 Jan 2023 04:51:53 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f28-20020a05600c491c00b003d9bd56e9c1sm20338917wmp.11.2023.01.12.04.51.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 04:51:52 -0800 (PST)
Message-ID: <861b7552-efc2-1304-a5cb-82e0d8d3cdef@linaro.org>
Date: Thu, 12 Jan 2023 13:51:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 30/33] hw/isa/piix: Reuse PIIX3 base class' realize
 method in PIIX4
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20230109172347.1830-1-shentey@gmail.com>
 <20230109172347.1830-31-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109172347.1830-31-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: 0k6yrnWI1DJA

On 9/1/23 18:23, Bernhard Beschow wrote:
> Resolves duplicate code.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Message-Id: <20221022150508.26830-39-shentey@gmail.com>
> ---
>   hw/isa/piix.c | 65 +++++++--------------------------------------------
>   1 file changed, 9 insertions(+), 56 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

