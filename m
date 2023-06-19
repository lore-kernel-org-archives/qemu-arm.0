Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2743531ejt;
        Mon, 19 Jun 2023 04:02:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6YWMjCB/GnXj6Nv/WzCQbEbLiOxGsTk4rntOnUCf07uhREkMB0ucgMh87rM7pSlYHYaTXB
X-Received: by 2002:ac8:5896:0:b0:3fd:dab5:9430 with SMTP id t22-20020ac85896000000b003fddab59430mr11561670qta.16.1687172559531;
        Mon, 19 Jun 2023 04:02:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687172559; cv=none;
        d=google.com; s=arc-20160816;
        b=IULhufOcA9qoPe62GTIsfcu1d9+oscmDCG+GNdQVjtDWZt9NZtbUHqWHsphmKAayhH
         rH4p+5+IMrifFQiKlfXhjlhhd7z7/G2fjKiYwhuwn3piGA6e2WOk+urT3/6loBbGSYWm
         Qk47Lj8RVjslJXk6JDfUUw7R1c7aP30w4SOSn+bSrFav6HQ6e+e85fkzipOQinrn+dtn
         AG1hi8nsgd7t4YgHp5bHEmJbH34h7jX7Bu3Z9zX+c8zGtei1IzazlXT2HdZHu4n0eDY3
         uxTtZP68PcKG7lABcW6WOTGqQV8pvKbP2AUwWs9UtHYu++lPs/z1HBHn+1vGCmOWFAue
         VYOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:cc:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=aHDFyT4fTF9Lg5aVv9U95/zQqx/SA0z0JTebZOYRDyg=;
        b=mZp0uo6BA6V9zPZ/RW96oRnlrgEIs3v2NcXCHnjPDVNHtKPPqyTG7H4yBrQJgS0SoP
         Vb8qKDIugbFlK8seamFQWFoNP02L/9nTXW1qWM6nFjllRdn46uNdUw9GxEFIa3aqRlbE
         3HjemA9FS6IB+Przt7AiZztZA1n8bUQYUQ6xvDyd0dwpWvAzMyJwy98nfOLcgSc/LpAt
         XvG0AqN9m84Ea2Y45b1oDk7afigcnlqOjmCpb6lsXwWD0642BIBDf2yLKVcK4Pl4Lf68
         hQ6Kp8Jy1C6oFS8CvxEqM51KqgvEB5z0tFd4pDNNwd416z15T/qWiCn4kCh2TQwPkMO0
         hGRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ldof9g37;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a21-20020a05622a02d500b003e4ce105af5si13377567qtx.534.2023.06.19.04.02.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 04:02:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ldof9g37;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBCeT-0000cz-Rq; Mon, 19 Jun 2023 07:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBCdx-0000X4-96
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 07:02:06 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBCdr-0000MW-N3
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 07:01:54 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9875c2d949eso388482766b.0
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 04:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687172506; x=1689764506;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aHDFyT4fTF9Lg5aVv9U95/zQqx/SA0z0JTebZOYRDyg=;
 b=ldof9g37iPZihP1/eH5hKbsR1ZVraLQljbgwjH4JP4FyqjcNRLzVHLi4HuoeuhqF5j
 FHaVc4CSyvx+EGQnRyhgAGRbe7h2vZKrOJiyUYkrvp0kft9grzkN33evNHc2xGmSRNWx
 smkCBy7Mks+neZ1GLVUDNr9VenREv5/B+QJ9J7LxJzYvfy3v8lH+5D1utJOP5Nq9vbqK
 eFosReNnNb9+jImVR1/j+Ata0DL54y9UvCfbWviqRyj3yFj5hIZAqRwRLaaoS9EupTZq
 hILVNdEa4j9CRhivAVmM+cMFO8+1PzU/WZUh6u+XwMozEXN38Gjfg8f04UCKgwSAjh2a
 5AJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687172506; x=1689764506;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aHDFyT4fTF9Lg5aVv9U95/zQqx/SA0z0JTebZOYRDyg=;
 b=E/fT5k5lxMjJZWV2YiVweoXH2Zd49WcemwiWC8vs9kdzP7HKdB1pkibmzN/a9D2oDO
 7C0fx7P/ppGrFju4caR8W9uHDBwOIFZJDG+U4OeEYrE3Rrfic1YHA4DBd0dZ6kNjfO1X
 3c8G+m6wsFe1RfiLe+aLJXKfyWDhCrOxnDmKOMwsdPCOE6SGDhH7MxJdvPVjzyGYcAxb
 5bTYAB6gQz0mAB5bxbX6ZRmWrKda0P6gSk0+lOePWDS45IK7uU7zdS45+pyNz5vdfNlD
 q/WPJC9/1Cpw6lanQ07CcotKVPeaXX0X407PdzYCh5Cu7pBs/dHrtisRIHuhbOsCvhaM
 wh3w==
X-Gm-Message-State: AC+VfDwhD92air/0Fu51kmJ+F6ffZvXmi+Yn5bJrsX9prbBWuDlbBkjf
 iRdGRswDwK7ZKJB7DXxJuuMzyA==
X-Received: by 2002:a17:906:14ca:b0:974:62bc:33d5 with SMTP id
 y10-20020a17090614ca00b0097462bc33d5mr7221935ejc.20.1687172506611; 
 Mon, 19 Jun 2023 04:01:46 -0700 (PDT)
Received: from [192.168.69.115] (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 k2-20020a170906158200b009870a805b3esm3658888ejd.224.2023.06.19.04.01.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 04:01:46 -0700 (PDT)
Message-ID: <80bafa6e-77d0-184d-4798-207d13ab435d@linaro.org>
Date: Mon, 19 Jun 2023 13:01:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: Emulation of 'System OFF' mode in ARM nRF51 SoCs
Content-Language: en-US
To: Chris Laplante <chris@laplante.io>, qemu-arm <qemu-arm@nongnu.org>
References: <j6_NJPGssQ1eBAedcPGs0eURXeMcehbzMcwJtaGvzN_FdUbQKyTP1cyEJWC759G72UNSVpX-QmQ4u6iJvZmt2c_vRO7rhryDQs9icVy5iEI=@laplante.io>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <j6_NJPGssQ1eBAedcPGs0eURXeMcehbzMcwJtaGvzN_FdUbQKyTP1cyEJWC759G72UNSVpX-QmQ4u6iJvZmt2c_vRO7rhryDQs9icVy5iEI=@laplante.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: GrQ3kH9srejD

Hi Chris,

On 14/6/23 04:27, Chris Laplante wrote:
> Hi all,
> 
> I am working on improving nRF51 emulation. Specifically I want to implement the special "System OFF" mode. System OFF is a power saving mode. In this mode, the system can only be woken up by a reset or a handful of peripherals (most notably, GPIO via high/low level detection on configured pins). System reset is triggered upon wakeup.
> 
> I've been digging into the QEMU mailing list and source code and have come to the conclusion that deep sleep and low power modes are not implemented. There seems to be support for turning off ARM CPU cores, e.g. as used by imx6_src.c. But that doesn't apply here because I only have one CPU.

What problem are you getting with a single CPU?
The "arm/arm-powerctl.h" API should work well.
If you scheduled a timer, I expect it to awake
your CPU on expiration. You can also use a QMP
command to toggle a GPIO and trigger an IRQ.

You can use the qtest API to test your code,
see some tests in tests/qtest/ using:
- qtest_set_irq_in()
- qtest_qom_set_bool() for GPIO

Regards,

Phil.

> So ultimately what I think I will try to implement is what the nRF51 reference manual calls "Emulated System OFF mode". From the reference manual:
> 
>      If the device is in debug interface mode, System OFF will be emulated to secure
>      that all required resources needed for debugging are available during System OFF...
>      Since the CPU is kept on in emulated System OFF mode, it is recommended
>      to add an infinite loop directly after entering System OFF, to prevent the CPU from
>      executing code that normally should not be executed.
> 
> Does anyone have any guidance on how to implement this? I don't particularly care about fidelity. As long as a GPIO level trigger can break the CPU out of the infinite loop (which the reference manual tells users to add) and jump into the reset vector, it will be good enough for my use. I don't really care about masking out other interrupt sources, for example.
> 
> Thanks,
> Chris
> 

