Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1094260ejx;
        Wed, 30 Nov 2022 02:34:27 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4JSuKG6bZxHdFc+Ba0JN+BPxIPIyH1rWOVF5fzZaqXV6bkonQignqZeQOEA6/jmG7YsQqW
X-Received: by 2002:a05:6214:28c:b0:4c7:69b:5e20 with SMTP id l12-20020a056214028c00b004c7069b5e20mr10264834qvv.59.1669804467507;
        Wed, 30 Nov 2022 02:34:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669804467; cv=none;
        d=google.com; s=arc-20160816;
        b=R9ubu3jugZK2JNwecNXHymibsq0CSuRvDCQkv0ywB3FK9ZFatSdaE+nxrzOzszE8C2
         4jgsIyJu6VYhRv9Sj7NSq9K9iDPUu0s8MzAzIWnl2watms55Kzu6A8odWM/S/xZl63Fq
         KOYxJrzgHc3Zrfto0MO3PDBPkANpjVAzM7WQx+qBvaMEaDm7A9FFLsxDJaFfh9jBeCNS
         ceTE2Nrv9m515nnLlI8Z56TnU6dkEUsX8pzV+rZIlyGmQI0cA2Y7PATCt9gJfyIxauGF
         hTQfhppQoRqXq2F1SFgIkJ2YCDYg4TSwKsHzUdsbA3HUsyLFBQA7WAPaVQlUpeLsv7Ul
         GDxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=MBItDnDBYwieEMCoUclWJhcJ5T4qms5qJ5S0BUrno+4=;
        b=Cqu16683jvjlngfb7+04oUCtLQvveeG404/HXq8cdYPtUaPVlAwu6SogE6gIdDY1eQ
         mJSo12jTroNUiaWtgfsfmY7gZi7lR5XIPcTFWaJIIdUaJEYUmek0bu5LKKw9vNB+MNFU
         lVSCFc/qdmyOGy03L6n2Q869puk/5+w8jDtwr5vVSHwltMYW0NisNVVEurjD6DEdEmvG
         /g4zXOuW6SXwZZWRqY6h+gZoRP/2YURpt0pMTteWrC0ym/DhqeV5RPU8HXHzo536L1P/
         d91IYhltB959md4TzQ7I6/jShZJBDdSpg6i7tfQjNjiJqXAZNe8dhA0iuZpweVv6M05e
         +IXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EoFFw3lp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18-20020ac87112000000b0039ccb19fd6bsi575207qto.33.2022.11.30.02.34.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Nov 2022 02:34:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EoFFw3lp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p0KPd-0003c5-31; Wed, 30 Nov 2022 05:33:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KP6-0003U8-CW
 for qemu-arm@nongnu.org; Wed, 30 Nov 2022 05:33:24 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KOn-0003C8-04
 for qemu-arm@nongnu.org; Wed, 30 Nov 2022 05:33:14 -0500
Received: by mail-wm1-x329.google.com with SMTP id v7so12879005wmn.0
 for <qemu-arm@nongnu.org>; Wed, 30 Nov 2022 02:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MBItDnDBYwieEMCoUclWJhcJ5T4qms5qJ5S0BUrno+4=;
 b=EoFFw3lps9zsAQB16dsTXqq7RR2jXhH7aCmZAaoAjVF8b8NdqWdZ8DnVyAN4ts8Lc5
 8xUpIRI4DRCS/wE5iX+YD1aqzSv5Utm2aGk9E3jql3kz8QApDv7sq2N/7E7niv2IHrko
 wB71qDv2gUIolDxNlJOFHog3/VHQzNoywCejZcFvM3yQ02RWi19n0rYdil0DnnPPQptT
 XKt1a16mA9l5L9zqO5mAgSfTjcPW8v7tR252UxxiXe2y29+rBUKked0plrweYWcNak7e
 0OfBBLfTHPm3xZnwKskC5v0dRLLkDzKnreZ9EygkxtUKp7gSUAcPGApE1o+2VKKdakEa
 Fu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MBItDnDBYwieEMCoUclWJhcJ5T4qms5qJ5S0BUrno+4=;
 b=lAPzb82wQPega/scVUJoOTZ5wDiZaipiyovhRd8Y7WIvReSqEEA/4lgi+ixl22r/8+
 BcM3JtyR4LQHZUYZKnB2ftaS2s+XvLbCGB6Yy/CBXUXx8uqk53HRk2vU7eSEeR/aLdLq
 RB1Eak49ZsH98rNEpOcrRHpoktU6SOm0R3Y053rpmfypGKYCs6emIiVR8vSMuXnzlzP6
 1IJclDjQTIxG4nGu7UIFQbgHykrqtPp8Bk6l6G/79UWWAut4j7Gf8YZs8gVvP7sJsOmM
 CVs77DopraBbAfvn2EZILy7AjqS1jj8CAOQWtahceTAvbbWo37J00QVgNWkDlZIIkZJ3
 QJ/Q==
X-Gm-Message-State: ANoB5pli52QOwL96eE53699Fi8A5ZFlZGgVuPruR0vfKbyC+nFvTwkSQ
 prP4QIYB4OhzEscS0V8S8N34wg==
X-Received: by 2002:a1c:7715:0:b0:3cf:d18d:3bfe with SMTP id
 t21-20020a1c7715000000b003cfd18d3bfemr46939414wmi.203.1669804383013; 
 Wed, 30 Nov 2022 02:33:03 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j11-20020a05600c190b00b003b47e75b401sm5660232wmq.37.2022.11.30.02.33.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:33:02 -0800 (PST)
Message-ID: <6069b769-ecce-8f00-2337-e5c997f766c3@linaro.org>
Date: Wed, 30 Nov 2022 11:33:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 8/9] hw/intc: Convert TYPE_ARM_GICV3_ITS to
 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-9-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221109161444.3397405-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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
X-TUID: e1aVHGVoEE2u

On 9/11/22 17:14, Peter Maydell wrote:
> Convert the TYPE_ARM_GICV3_ITS device to 3-phase reset.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

