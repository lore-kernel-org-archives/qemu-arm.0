Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2567170ejm;
        Tue, 18 Apr 2023 07:42:50 -0700 (PDT)
X-Google-Smtp-Source: AKy350agzn/aBPp2uuUuWz6DjLg9JFJYUuasMHjYrNM05O2CDl6fsqBYSibHhg/Vhkl3bYSpKXGS
X-Received: by 2002:a05:6214:20af:b0:56b:f28a:ee2d with SMTP id 15-20020a05621420af00b0056bf28aee2dmr17040591qvd.5.1681828970537;
        Tue, 18 Apr 2023 07:42:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681828970; cv=none;
        d=google.com; s=arc-20160816;
        b=Ua6qgn7dIhrAbcMqnTe1wbWB22owF2Li+2CROv610a7Y2Gtq6uDfVhcKnzmAH8Oynf
         DIc+nxHxQrWgHe98Lm4zfgQhjUXrDMyT/0OjiNzK/GTCNbcpcg13sVhACoSks07PHEah
         X6LQCicNvLLnfPBfKZp2yXbj1/xdyYf329OA8OqF2m4fk3G5QHCOcPlZWQViB5Gjj7ya
         k2P5yx9LG4pwLmkSV0CXAaXs+yULM4ltpWWkcp2wlFGRfAVDe59CK4ajjaP9SjxW2p1F
         l8mZWbI8UVjfZL85m4Z0aq74kQ6tQu58szw3bU6fOqAAVMe8GDqo5U3wrTCetsZcvG7u
         1Nmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:subject:from:references:cc:to:content-language
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=6gZlrvCOZuxtUgy42BvdprVfeY/UDtXoIaArs8m5OEA=;
        b=AxShu87/pCuO4JwaRsvPH9GBSpcOSEJDDFZ2ecoAfLCMh1J1ZPP7yP00xSrThKXYJS
         7ufhksheQXn/tTgnAQw6y/Wf0VzF+gWf5woQ5HZ8dLQd2kiejK90IkYdYZmROqbuM8OC
         7gdYiDefi2lMpygvR0oIBYA9HMrKCVjTx2o0Sw5UmbNCsu1eQtDMTTPrurXyE7geFtmq
         Ellp29osoV7niG/cIBexUh9QrKh4tQThfJduedcR0WFGwOqq3bui0dwoKL1oXFRHWceE
         lU06YWnglZkoavyj9uNEU9xwHkITnl5+Rr+aeaTBt8SJ3dVf+pEb8CN8FLQ87ICytrM3
         WCSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20221208 header.b=fh8TZm8p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g9-20020a0562141cc900b005ef466174a2si7258336qvd.345.2023.04.18.07.42.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Apr 2023 07:42:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20221208 header.b=fh8TZm8p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pomXX-0004zJ-Jz; Tue, 18 Apr 2023 10:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pomXW-0004ye-0X; Tue, 18 Apr 2023 10:42:38 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pomXR-0006qu-AN; Tue, 18 Apr 2023 10:42:35 -0400
Received: by mail-pl1-x633.google.com with SMTP id p17so16783792pla.3;
 Tue, 18 Apr 2023 07:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681828951; x=1684420951;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6gZlrvCOZuxtUgy42BvdprVfeY/UDtXoIaArs8m5OEA=;
 b=fh8TZm8pqpxbbkfTwZcikly6LaH1DfL+BwNtRnDOH2p+ZL78Z9m/N8iaaN1NuqkWF4
 EvCofnPS4xXjoHFBUMOcjdXeTCE/oT2nIxTRNkrj3unvd4sWa4RKA5lj9wzaP5kzs4si
 YBjRKvYK2gYJ3zpxU9DOD9FB/3dhdogZIAq52PEHcOXNDczKireGofzKnoqr3AtWhhS0
 CM5avC8QZtiGFTv1Fh92FEWk0HKHrTn+2zhgOaX8/CiwMYWDsCZq8aFAp2hNFYMWy0Gl
 yTrL0Ek5fLyvZfLjX2o5pameIGLt+CJh4j0l4HsObYX/Ezx5qXkY+XveTzFOqOaNg1Zw
 nnqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681828951; x=1684420951;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6gZlrvCOZuxtUgy42BvdprVfeY/UDtXoIaArs8m5OEA=;
 b=T0WhhNAhXgvswh1W//f4w5JjZuueWQD3OsW3I78g4TBOJZq7Ydu7Qr5FFO7wbSTl6F
 RD0rSI9dvmccHndd3dJm7epgXUGBYiAOLYnvGV0ytnxvuJ1FMZ3DfvHPTvbZq9UJ0zh4
 SEeDS+ahceKFsWA9iwdC3A6dc3tE71yo541NsYV0KRavWt+rxZQ7Vh/NoJ3h7MB90tPm
 5/sicv00JphD+tssL2OQxW7tjuDw6Y/KSrwGTU398o7HjtMop5bzOPZVkUSPTnA+aZbB
 PYAdJxK15P7rUyBab8xgLSJBjluEznkeiX1PwsOksMnME6XN5coIaec+b+TUzkBeNQ4L
 f3oQ==
X-Gm-Message-State: AAQBX9fH0KyASnauln63AZwrEpRGD20v59+bpnK1P49JCsbXh9J7UKGS
 avE9SPmi39HJ+i1xPxNCjcM=
X-Received: by 2002:a05:6a20:430c:b0:f0:65fb:6cec with SMTP id
 h12-20020a056a20430c00b000f065fb6cecmr63518pzk.8.1681828950858; 
 Tue, 18 Apr 2023 07:42:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a63dc16000000b00502f4c62fd3sm8860807pgg.33.2023.04.18.07.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 07:42:30 -0700 (PDT)
Message-ID: <c24f50af-1dbb-6a1b-ca21-414039c10602@roeck-us.net>
Date: Tue, 18 Apr 2023 07:42:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230315145248.1639364-1-linux@roeck-us.net>
 <CAFEAcA-ZpQCS33L4MaQaR1S9MN24GgK+cH0vcuiz_7m+6dO4cw@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 0/5] Support both Ethernet interfaces on i.MX6UL and i.MX7
In-Reply-To: <CAFEAcA-ZpQCS33L4MaQaR1S9MN24GgK+cH0vcuiz_7m+6dO4cw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=groeck7@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.597,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JTOG6ajgUEW4

On 4/18/23 05:10, Peter Maydell wrote:
> On Wed, 15 Mar 2023 at 14:52, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> The SOC on i.MX6UL and i.MX7 has 2 Ethernet interfaces. The PHY on each may
>> be connected to separate MDIO busses, or both may be connected on the same
>> MDIO bus using different PHY addresses. Commit 461c51ad4275 ("Add a phy-num
>> property to the i.MX FEC emulator") added support for specifying PHY
>> addresses, but it did not provide support for linking the second PHY on
>> a given MDIO bus to the other Ethernet interface.
>>
>> To be able to support two PHY instances on a single MDIO bus, two properties
>> are needed: First, there needs to be a flag indicating if the MDIO bus on
>> a given Ethernet interface is connected. If not, attempts to read from this
>> bus must always return 0xffff. Implement this property as phy-connected.
>> Second, if the MDIO bus on an interface is active, it needs a link to the
>> consumer interface to be able to provide PHY access for it. Implement this
>> property as phy-consumer.
> 
> So I was having a look at this to see if it was reasonably easy to
> split out the PHY into its own device object, and I'm a bit confused.
> I know basically 0 about MDIO, but wikipedia says that MDIO buses
> have one master (the ethernet MAC) and potentially multiple PHYs.
> However it looks like this patchset has configurations where
> multiple MACs talk to the same MDIO bus. Am I confused about the
> patchset, about the hardware, or about what MDIO supports?
> 

It is quite similar to I2C, a serial interface with one master/controller
and a number of devices (PHYs) connected to it. There is a nice graphic
example at https://prodigytechno.com/mdio-management-data-input-output/.
Not sure I understand what is confusing about it. Can you explain ?

Thanks,
Guenter

