Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2705764ejb;
        Wed, 31 May 2023 01:48:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ584K+ryjHMH28uJzfz1Ab7nxmcYauaKeeNkrjxFDVWi7HVk41GFPKMFtb8/UnXZ9hRCK1M
X-Received: by 2002:a05:620a:440c:b0:75b:23a1:35f4 with SMTP id v12-20020a05620a440c00b0075b23a135f4mr6218556qkp.5.1685522904271;
        Wed, 31 May 2023 01:48:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685522904; cv=none;
        d=google.com; s=arc-20160816;
        b=IPXi4diUunilK9Wsyz1Z+DYYrnWeWxDn6B3eCZQ55j2Gu6c9zP3picc9rQkKjBcW3p
         nEQTSlZEAZ4zW+tc6WNEehKrHJsuQb+ksFXdykTkqOhNo8CBMbbPqdbVx8LNg9VsU0+Z
         ezZq4+7b2IaN1AYfa6XYSt6yJZnwlY9PWwy5Nx7diwvvRvreFb0sXfKe7Co9Yih9kJSW
         v5oj2GV+jom4dr7B2mbXP678YrpVykKWWHtvyXhBlQdOmFBngy3zwah10OTr6sm7dEUv
         EApFZQIfSwR7+WHrtQeLxaltB3gAAcnKPI06dSVOxyp+UZcGX1CIv2csmYk+WjpcOzdi
         ZtjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=ELxa1Fgrb2o8tlS9jStyeCQn79uD9sPrThyoAONHGe0=;
        b=GBLns1j3Y20t5/rL4lniYpTQo/AEL8mrt2IHLK7BD2lZcIpCodR1q8WAKH5fzvd6dw
         AM6j5hCm1At2ecZZYk7vHsLrAAVy6iscDYgZSUQwx5K1nu3cu9WhQapncbxirbAHxA3p
         3T31a8aqpSeN7PINb7N1Bu16fSciZYxK1eCcB94Mu4bEo0TNBfFL27xvwy/jT2iWLywi
         4VKb43p93/n1sa/Mo5CXXqyT9PISUWUZy0Eb9vsDZSqtZ9HAlgA+Dix6Xg4R4zsDhy3p
         o1fj8QeFqIlLUCU7FBxzOrfo5rnm9xwyjUdDJuwnnRQp8OBTHgwO+XmWtL4VgWw99mnG
         FdVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i14-20020a05620a144e00b0074679e5de80si7580317qkl.172.2023.05.31.01.48.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 01:48:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4HVC-00082e-EF; Wed, 31 May 2023 04:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=vahk=BU=kaod.org=clg@ozlabs.org>)
 id 1q4HUw-00081k-64; Wed, 31 May 2023 04:48:02 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=vahk=BU=kaod.org=clg@ozlabs.org>)
 id 1q4HUt-0006jZ-Ez; Wed, 31 May 2023 04:48:01 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QWNFQ1zZzz4x4L;
 Wed, 31 May 2023 18:47:54 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QWNFL2bnQz4x46;
 Wed, 31 May 2023 18:47:50 +1000 (AEST)
Message-ID: <34daee99-441c-4336-49d4-5e1a830c78ef@kaod.org>
Date: Wed, 31 May 2023 10:47:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 11/12] aspeed: Introduce a "uart" machine option
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Abhishek Singh Dagur <abhishek@drut.io>
References: <20230508075859.3326566-1-clg@kaod.org>
 <20230508075859.3326566-12-clg@kaod.org>
 <d0dedd1a-e2b7-5db9-d710-595e94b084a0@linaro.org>
 <aeb9f6a3-30e4-ce5d-c041-600a5097b27e@kaod.org>
 <ab96deaf-ca3f-fd28-254e-1797eb69b88d@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <ab96deaf-ca3f-fd28-254e-1797eb69b88d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=vahk=BU=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.09, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: 3wgXjaGyxiyj

>>>> +static void aspeed_set_uart(Object *obj, const char *value, Error **errp)
>>>> +{
>>>> +    AspeedMachineState *bmc = ASPEED_MACHINE(obj);
>>>> +    AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(bmc);
>>>> +    AspeedSoCClass *sc = ASPEED_SOC_CLASS(object_class_by_name(amc->soc_name));
>>>> +    int val;
>>>> +
>>>> +    if (sscanf(value, "uart%u", &val) != 1) {
>>>> +        error_setg(errp, "Bad value for \"uart\" property");
>>>
>>> Why are you asking for a string and not an index?
>>
>> because the literal name is what people find in the DT. See files
>> arch/arm/boot/dts/aspeed-bmc-* under Linux.
> 
> OK. After looking at this file, I suppose people would expect
> a "bmc-console" property name:
> 
>    -M ast2500-evb,bmc-console=uart3
> 

yes. This is better naming for the user. I will keep the internal
'uart_chosen' though.

Thanks,

C.
