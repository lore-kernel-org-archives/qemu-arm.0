Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2958152lfg;
        Tue, 9 Mar 2021 08:24:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmGZ/j0QIjYLs5/gFUO5FzgI02bfxcrxZBGbu5xFYNxj9XiC8d3WqiZrC0TCXo0Mywa+75
X-Received: by 2002:a05:6e02:1608:: with SMTP id t8mr25398515ilu.79.1615307082737;
        Tue, 09 Mar 2021 08:24:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615307082; cv=none;
        d=google.com; s=arc-20160816;
        b=TGSwg82sLVaaEMxuDYH0RbobGL4Au6WMnD6VtefoidrvSJRqGxzVk9iRjYRNOWbmCN
         ZL/cse9OFJ3PoAGRHSUQM3AATYj9jFz9ihXK0MlSHutSpjtRu6AfNRLspAxS3ZyV6uD5
         3QxxwANDhWBzmX7bYXZO3ewKH3Xk75nCH0JN88jGCnHWctpvmluPxtjGcAXN50hL4ZNt
         c22N0dTtAjE7uThRyhzRuv+WsMZjY2L6fDRUH8BWvDYE9leICdx162J1n7WIzK+yIo8i
         BzTLoJBDj4I+KMFTSeSRo/VuS2tgUzkz9fX6bm8tZM1sMZDqI7CnGbcJEYLu7WRtl9cU
         u6hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=sN+hwOSWWku2IDqj62zGmsVyOXYhK0ebtTufLl6atlU=;
        b=DEf+gNB2PrOXQq0hpm34PhTZtdnuV8j5R/3GvVeb3jjjq2rnUXAxUhJGcoznmosPOI
         bkn1WekvmuCEXd6DxQ2BjuU9pd0wl6ROgBgYSIzc343nEQOe/t9yHXQLC1QrE+FK9Gza
         Np9qnaKE4kiEsLA3iId45XNfQijGf1VfIV1oWXQz+MVhVZ14qVAGRn5PSzhzNnlS+RB0
         l0kTdQ6qQFNyVNpa+U3JcQisxuazg5C3BxY6opzdfmIb17jTuhGAMcCSzjceanKt30Ly
         Asa1pJ76Id1sgw9pVfOIrIYrtWKXsjQfLxAYprrq0ogPIXvR7RnXYrjIYyriMEjo/7nZ
         zc6g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e6si16427882ilu.126.2021.03.09.08.24.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Mar 2021 08:24:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJfA2-00021D-0o
	for alex.bennee@linaro.org; Tue, 09 Mar 2021 11:24:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.dupaquis@trusted-objects.com>)
 id 1lJel8-000376-A7; Tue, 09 Mar 2021 10:58:58 -0500
Received: from mailex.trusted-objects.com ([149.202.244.204]:34559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <v.dupaquis@trusted-objects.com>)
 id 1lJel6-0003Pt-Hm; Tue, 09 Mar 2021 10:58:58 -0500
Received: from [192.170.0.219] (88.127.245.42) by S76918.EX76918.lan
 (2001:41d0:117:dd00::95ca:f4cc) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P521) id 15.1.2176.2; Tue, 9 Mar
 2021 16:58:41 +0100
Subject: Re: Malfunctionning qemu-system-arm ?
To: Liviu Ionescu <ilg@livius.net>
References: <20210211141515.8755-1-peter.maydell@linaro.org>
 <14af0670-caaf-caf1-0b90-fb10c7db13b0@trusted-objects.com>
 <e00943e0-b9a7-1688-b169-3650e8e4290e@trusted-objects.com>
 <FBA649E1-4EFB-4409-894E-C1A5AB086BF1@livius.net>
From: vincent Dupaquis <v.dupaquis@trusted-objects.com>
Message-ID: <943374ff-fc7f-b0bc-0b53-0e7487cdf810@trusted-objects.com>
Date: Tue, 9 Mar 2021 16:58:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <FBA649E1-4EFB-4409-894E-C1A5AB086BF1@livius.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: fr-FR
X-Originating-IP: [88.127.245.42]
X-ClientProxiedBy: S76918.EX76918.lan (2001:41d0:117:dd00::95ca:f4cc) To
 S76918.EX76918.lan (2001:41d0:117:dd00::95ca:f4cc)
Received-SPF: none client-ip=149.202.244.204;
 envelope-from=v.dupaquis@trusted-objects.com; helo=mailex.trusted-objects.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ep1C3TiqMgny

Liviu,

Thanks for the responses, I'll have a check on this.

The issue not testing with the HAL is that as most people use it, qemu 
on these platforms is a bit useless for emulation.

On the other hand, it would be more on ST to invest on making those 
emulations running ...

Best regards,

Vincent.

Le 09/03/2021 à 15:37, Liviu Ionescu a écrit :
>
>> On 15 Feb 2021, at 17:09, vincent Dupaquis <v.dupaquis@trusted-objects.com> wrote:
>>
>> ... stuck on the starting HAL_init() call.
> HAL requires, amongst other things, the clock registers, since it sets the PLLs for the desired frequencies.
>
> xPack QEMU Arm [1] implements these registers, and is able to properly run the HAL init code.
>
>
> Regards,
>
> Liviu
>
> [1] - https://xpack.github.io/qemu-arm/
>
-- 

*Vincent Dupaquis*
Software security & Cryptography expert
06 24 58 17 05
/Europarc de Pichaury Bâtiment B8 1330 rue Guillibert Gautier de la 
Lauzière 13290 Aix-en-Provence/

www.trusted-objects.com <http://www.trusted-objects.com>
