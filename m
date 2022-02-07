Received: by 2002:a05:6512:3e12:0:0:0:0 with SMTP id i18csp10279lfv;
        Mon, 7 Feb 2022 06:46:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxa9rZl2E/mPeIQ4247zSSsPKKLBONhhfY3cjcmQTmzZdKMTTjf1Oe0XudvohNppz8m4qHQ
X-Received: by 2002:a0d:d084:: with SMTP id s126mr105114ywd.284.1644245210236;
        Mon, 07 Feb 2022 06:46:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644245210; cv=none;
        d=google.com; s=arc-20160816;
        b=V90U4joaWsWaPm1UdMo1CUXd4hqnWi/yQoJaqGGooXd948QAc+VmdiWQ1cDqaRXtO7
         F9jBsZv6j5QXk7imIT9HImawM6sdG7cZMXxhfHXz+q3yGpQ1MhIxP/7phwsoCeS53ObX
         gt6HNR+AVz0WHzAfyK8RkPUbEPTG/FWkUb90SaeTb2lfZoLWUlYE2ACqkVHfgae7y7fq
         qvXheoz7YhkIETvXxJDLskaSR2cIYXREWXZBaNVvXMep8W/iLqEzByC/wk/SN4keGY8P
         mg3ylLPRUTISZ/4ig9AqGtV//ya+eQeZU+O9ShtT7OZB1oXb112zIGSS279azv2+RsBq
         9j8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:subject:user-agent:mime-version:date
         :message-id;
        bh=OjGNpQz1LnRVN4qb2EexnU9c6zto1RNY9d/5cqkIM+4=;
        b=i4VkCqrAbVeLtRSYFxUyqEk8Mnr2PRPfcU0HYAxlbTFVcnJNzp2KZfNxbqQKnde53s
         18dueAnAKffGBHSCoOfJYyMO5BzDihBz8GgpqWaO9orDxbCs382ibB6G7V6jm3DKJv7x
         kZNRoldZ4A6WWkqp+ECSoIVr/IN2p8hOKzppkdeXPymrmcbX3RbnbQPhLPYt7Uw9dNi2
         7FTGeA/fyvOIu6EpugB5++n9aqngUlX996Ww+khQWrgpylIUR11OngkY7TzP3x3ocLFl
         PfIlwBGKabktC3/N7wF1qZx16Ne9cCYRhS4LLfOutuv9rDV6PnCLZ3MTIMV0Mfxx6sDp
         4d1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d129si7485805ywf.282.2022.02.07.06.46.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Feb 2022 06:46:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nH5I1-0004M1-Jz
	for alex.bennee@linaro.org; Mon, 07 Feb 2022 09:46:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1nH51H-0001DR-Vw; Mon, 07 Feb 2022 09:29:32 -0500
Received: from mail.csgraf.de ([85.25.223.15]:33762 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1nH51G-0006ei-Br; Mon, 07 Feb 2022 09:29:31 -0500
Received: from [0.0.0.0] (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com
 [3.122.114.9]) by csgraf.de (Postfix) with ESMTPSA id 1B2CC6080F17;
 Mon,  7 Feb 2022 15:29:27 +0100 (CET)
Message-ID: <07b3893c-afdc-6077-9187-eea87c747200@csgraf.de>
Date: Mon, 7 Feb 2022 15:29:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 10/16] Revert "Revert "arm: tcg: Adhere to SMCCC 1.3
 section 5.2""
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-11-peter.maydell@linaro.org>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <20220127154639.2090164-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Yanan Wang <wangyanan55@huawei.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jmR76lwn2IMc


On 27.01.22 16:46, Peter Maydell wrote:
> Now that we have arranged for all the affected board models
> to not enable the PSCI emulation if they are running guest code
> at EL3, we can revert commit 4825eaae4fdd56fba0f, thus
> reinstating commit 9fcd15b9193e819b, without bringing back the
> regressions that caused us to revert it.
>
> For clarity, here is the original commit message of 9fcd15b9193e819b:
>
> The SMCCC 1.3 spec section 5.2 says
>
>    The Unknown SMC Function Identifier is a sign-extended value of (-1)
>    that is returned in the R0, W0 or X0 registers. An implementation must
>    return this error code when it receives:
>
>      * An SMC or HVC call with an unknown Function Identifier
>      * An SMC or HVC call for a removed Function Identifier
>      * An SMC64/HVC64 call from AArch32 state
>
> To comply with these statements, let's always return -1 when we encounter
> an unknown HVC or SMC call.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


Wouldn't it make more sense to apply the original patch again so that 
git blame points to the correct offender? ;)


Alex


