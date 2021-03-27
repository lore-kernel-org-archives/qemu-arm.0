Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2404213lfg;
        Sat, 27 Mar 2021 11:37:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3g5YCo4N/ivCn8vl2Owee9hei87IZ3JqSC/iqlvQYoUVu5ckqTB1eV+II3akvWm22UA1t
X-Received: by 2002:a6b:5b0a:: with SMTP id v10mr14892210ioh.37.1616870271144;
        Sat, 27 Mar 2021 11:37:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616870271; cv=none;
        d=google.com; s=arc-20160816;
        b=p/JSpOS1yqzm7avlUpZeLMFSmNcvIOvJ6FL2r2NeddDN/xdThO4/pDRdvO+KaZp6lF
         PLmSU2K8OX+NRZvulFqen57x6WFcacZMRQS+JjyGfJR6OEOdUd/hKOMKeCd8ms7Pi0bF
         btu4VKuLnIr9PRWMUDBqnjQqZGaRbyraaixvqxucK9O+ByhfzcjNf4Ns8Omjaa4BdJtK
         E+ViTrJ5kpcCC7UG5Jde0Kgs9M0jCwY77A20dGymZfjV5Hwp3zNcIsQRGsUxGZ726MQ1
         Eusipprgo6nNNnYsA8LFV39pkq2MqtjbkLvQvxYLAJmjLq+EWgAR9H9OEE0JH6S9WO2U
         IQ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=QxNO4XDvkT9FMi+UP4pSAZyqhg7ONEmD8dffWxx44Os=;
        b=x/YZ6tkP6m2DGG5cLCAmGkO+B78YP+ggCPbjahAra5yW7Iv36w76v9X3K/6ei0TbFO
         flINDMQLc+r/Q5UifbrIGOjwCSAag1QV8Q19pnF9gWcqb5Fc8dF8mSW+wNBIlYxgIqTy
         CViH8xTaXS/UcsS3+dgfhUfgRIKy4NrOsFkpCpoTqK2cCFYAiiranU4UhuSeQiUqmt46
         ZkOlbMoXOB+pP0s9RJ5d3OsQt1W6bebOmb6o+l/SOP2kR7GnZZkfBMEffYMMUE5KRuLT
         nP48nHzgrUwOuXxIg/bIbHXUbhrfceyFAF5rKWkHceh3ju2xoGmBdzwQwhyCcENAthbg
         4xAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qsybwEII;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s16si9649783ilq.21.2021.03.27.11.37.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 27 Mar 2021 11:37:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qsybwEII;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:47350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lQDok-0007hn-Cw
	for alex.bennee@linaro.org; Sat, 27 Mar 2021 14:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lQDoD-0007fz-6e; Sat, 27 Mar 2021 14:37:18 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lQDo5-0006NE-9R; Sat, 27 Mar 2021 14:37:14 -0400
Received: by mail-wr1-x42c.google.com with SMTP id x16so8759168wrn.4;
 Sat, 27 Mar 2021 11:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QxNO4XDvkT9FMi+UP4pSAZyqhg7ONEmD8dffWxx44Os=;
 b=qsybwEIIGMudad86HfngMyud+3zjsSVubmpSz+96TZfAS/BXE4+0I0SYss82dpkBwE
 ERHuJ2uHG8FJ1+wQhgXdky9R/XwF9z8Eh8LrXmLy6SIUDX6gfujG9NmyAxpbgkO6vN03
 FJzVDNw3nzyZWgMtijwb8F8Lujsj1ZOi9ion1iuvSSMKU6tvjvcGP0VIym1u681cJs8e
 rM7LtU0au0Q1La2IiBGNgKUIvh3pVfsBD0XyYpddTWVx1+ReDmQt7Znh/KkZlCgfClDk
 73recon9vIfjXGeKxvnSOiVrURWBUqDDwxPtzZsAHrbEEY88HAC9hlCjQ6Hss919Azax
 bXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QxNO4XDvkT9FMi+UP4pSAZyqhg7ONEmD8dffWxx44Os=;
 b=PtoUQ7aE6xwBjbEsEa94j7dRr+eEqObJ7Z17UUpYVxlzDEzyjJHn9FItPKXTf3cJ3Z
 Wx6iQFhetWt8P3emUgmKj3mviE9d5ILpLrJEuN0m/Os5HffSTp7PyeowSmaz17Cmglk8
 CQ+yiQ0QNbeEZXodwYz/wcq7Vut2LCDWb4t6alnmK/uNd0LAKblxC3KK6LlLGpyGNqZB
 8BPkUdJIPnsbm6stQ3iQrpRF/VDBFy7GFx+5IysWGJPX65RO+KJKd2By4imDQb1203bK
 kMWa7JznxUmZok5uTqYK4ffqSsy91bsDwuire89Qsqvoem/5OhAtTr2KsczWjvL8XEUd
 KN7g==
X-Gm-Message-State: AOAM532rA44Z6L9umFkuQhHkZ+IqJeFHkcraKDDNf5ZQbKGhUeOZIOJh
 2KHokGACOC032T+ug4E9oYK3zWqTHHxtBw==
X-Received: by 2002:adf:b30f:: with SMTP id j15mr20677270wrd.132.1616870226743; 
 Sat, 27 Mar 2021 11:37:06 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id c131sm17876991wma.37.2021.03.27.11.37.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Mar 2021 11:37:06 -0700 (PDT)
Subject: Re: [PATCH] hw: Do not include hw/sysbus.h if it is not necessary
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210327082804.2259480-1-thuth@redhat.com>
 <f9c5e949-1790-31ae-54c7-ccfdc3c16ae9@amsat.org>
 <f20613c8-2a01-68b8-e4da-0387e0f63e1b@redhat.com>
 <39afc328-73bc-2168-52a7-44914a87a799@amsat.org>
Message-ID: <b6e70ae9-cfbf-62e9-86f0-5cd98384d976@amsat.org>
Date: Sat, 27 Mar 2021 19:37:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <39afc328-73bc-2168-52a7-44914a87a799@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WKbh+uAQFt4I

On 3/27/21 7:35 PM, Philippe Mathieu-Daudé wrote:
> On 3/27/21 7:19 PM, Thomas Huth wrote:
>> On 27/03/2021 15.54, Philippe Mathieu-Daudé wrote:
>>> Hi Thomas,
>>>

>>> 6 more candidates?
>>
>> No, since those use TYPE_SYS_BUS_DEVICE and thus require hw/sysbus.h.
> 
> Ah indeed, this line matches your patch changes:
> 
> $ git grep -l '#include "hw/sysbus.h"' hw \
>    | xargs git grep -L sysbus_ \
>    | xargs git grep -L 'SysBusDevice\s\+\w' \
>    | xargs grep -L SYS_BUS_DEVICE

I missed the 'git' while copy/pasting, I meant:

     | xargs git grep -L SYS_BUS_DEVICE

> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
