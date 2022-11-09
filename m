Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp620163ejx;
        Wed, 9 Nov 2022 14:37:45 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6I8tmRFQcXZwc1LVd9x918j6Z3778RZdaaDv6nqSKSbVXBoDWKfpPRREoTYGLawBJbSeX8
X-Received: by 2002:a05:622a:5d1:b0:3a5:3818:a067 with SMTP id d17-20020a05622a05d100b003a53818a067mr37106272qtb.574.1668033465145;
        Wed, 09 Nov 2022 14:37:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668033465; cv=none;
        d=google.com; s=arc-20160816;
        b=Yl3dhytRbLkuDEOelyGv4Xc0TJqs0h7HPhLFj4L02jnB2O12Ue3cMZOfPVeujjOGaj
         X+lwlLM3fM5MzbessxgfvEUfUWGi+GvV/+wruuBAcPzGdpdCO3wAy/Kxu/NSW5IG67a/
         ORN1nusEzaEhAOFXOkvqu4yvdN9ltDG7/O1aPcwIEoaDeCp24z3lMdolrCuTyGA/gxwE
         54B4jP6ISpCCRUR3cRa1EI919zlEZTkgM/FMxtOkCpEnB/WzIso2Rz0nTZXL+VoImjmS
         BU+tQd+vr/wisk52S5QgBGjtBgCud6Lo/otPtYeC2wPf2IgEIs+3lMvPXrpUvY0+O5Za
         5i9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=HCoLr7NCFiPKbkTu4iOMvr8B58fb3/FLRNsP219OTJM=;
        b=n1H+VsYgAZWMiOlj7OnAFWaLoN+HSRNyWL4M4RDfFySqg2Z2TeI/rbwUgyDIxfvyEr
         IlDATaLlQ78pmPJoEqdtWSmBe6Dp8UFivaag4uaOMT7ljsBWJoCyQZQ/24EPApjkDkJQ
         45NzZwuCK6TbPrp/JgmjIZYbWAZ1BAPykkYD48L8ZHuQ2YMQ0hq5pzg3k3PcZxOoNZ4l
         +pKVoVusajH/0YvoE0jlFamgQelp4uWKu1McYdPVEo/XWXjdvpok9J9gq1ad1jF/rl6c
         lPYDbSsb2pN3rwii99BTRwmbXC0hb8DfTpjZExzr6+qpe3DRPxWfe/+CqV2oHknU4TZj
         omQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W5yR2FAL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16-20020ac87dd0000000b0038fa59d02a2si10154427qte.782.2022.11.09.14.37.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Nov 2022 14:37:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W5yR2FAL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1osthS-00047x-Rl; Wed, 09 Nov 2022 17:37:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osthR-00047b-1E
 for qemu-arm@nongnu.org; Wed, 09 Nov 2022 17:37:37 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osthP-0000vB-IG
 for qemu-arm@nongnu.org; Wed, 09 Nov 2022 17:37:36 -0500
Received: by mail-wr1-x432.google.com with SMTP id bs21so28011875wrb.4
 for <qemu-arm@nongnu.org>; Wed, 09 Nov 2022 14:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HCoLr7NCFiPKbkTu4iOMvr8B58fb3/FLRNsP219OTJM=;
 b=W5yR2FALrFkhIU8Vgk8xuIvJT6tfORTs9SgrV6MSCubV85CWJqfl57wQoAMwi1PvcB
 eP/SCCKi9yYDxA6U+yxqXhwR5iJLmloZyQwket5w50BR9Rs74mVOKOnRgZY4iWxNali0
 hjPZ6sbmLwA9SfiMCI+EBsH23Ag+anbepC2dFGgaYEprzNTV/JYGXNDzMoW9riW4R/AZ
 7mn2AGAwNY763wG6ueGPM9Lx/ty1qfOeKmYfpcA3XwW+dhrFdacvwkYk8JkihaVfFmak
 c74YuXPBg2/dd/+oGXjoX5h/csA38NdAJZ6ZYB7cCeQWp/MiCDNMgSV5Y2FhTOPBj5K5
 +3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HCoLr7NCFiPKbkTu4iOMvr8B58fb3/FLRNsP219OTJM=;
 b=zEcv2i/whcsr+bQAPwwrXvPnJkh1qrDfsaV6THLzM6935s2sDADK1IESPTpr9SvebH
 JuCCvnmfEHenoCdh0J0iDhwSW/bbT9ikT2cUN3N2PjEW4xSjhtuS7F9LV3DTYrhwQ14J
 b8mbNE7xi0PcFA32IHegwz46VxVQXl3y64Y5K3GFS+8Vk3Zl78HrlNY3/oL5fz8MHv3E
 A9vhcWn8/PKE4Q6xdOchlRxianvrSMURM64BcpYMNLaz42vKJEMd7DX4nwonJVr0RhT9
 7S1Orc/QaLJHTIga8+DESZ4HR0cGTFcanbvTGFZW+KqAI2ThkZ3Gqnd9Wyj5fynrjuuQ
 qjgg==
X-Gm-Message-State: ACrzQf3r9dzOYTf6+PK0K0G/aJ+G0PbwPlzRHLXwk102vHtTNWSQ3MhI
 sJEjNFxH9N3BMRiNIWCflTnP0Q==
X-Received: by 2002:a5d:4b45:0:b0:236:501f:7a41 with SMTP id
 w5-20020a5d4b45000000b00236501f7a41mr40211655wrs.516.1668033453896; 
 Wed, 09 Nov 2022 14:37:33 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a1c741a000000b003cf71b1f66csm2843224wmc.0.2022.11.09.14.37.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 14:37:33 -0800 (PST)
Message-ID: <63113413-5177-87d6-310b-5a48866d3558@linaro.org>
Date: Wed, 9 Nov 2022 23:37:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH for-8.0 1/9] hw/arm: Convert TYPE_ARM_SMMU to 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221109161444.3397405-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: O2NI+zTQugx3

On 9/11/22 17:14, Peter Maydell wrote:
> Convert the TYPE_ARM_SMMU device to 3-phase reset.  The legacy method
> doesn't do anything that's invalid in the hold phase, so the
> conversion is simple and not a behaviour change.
> 
> Note that we must convert this base class before we can convert the
> TYPE_ARM_SMMUV3 subclass -- transitional support in Resettable
> handles "chain to parent class reset" when the base class is 3-phase
> and the subclass is still using legacy reset, but not the other way
> around.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/smmu-common.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

