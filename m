Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4464039lfb;
        Tue, 7 Sep 2021 00:28:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEveA5HBuwAndqgmUK93nXZVfl1MVxuWT2q4yYzzPfK3oPW3f7dLmSfGvwg+XHhmNSSxC3
X-Received: by 2002:ac8:5f85:: with SMTP id j5mr14405652qta.332.1630999720947;
        Tue, 07 Sep 2021 00:28:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630999720; cv=none;
        d=google.com; s=arc-20160816;
        b=PPQQu+qsWxzTkfjPPPbZq8VhCEJAZLsBV67M0man8iWZ1Y6V29HPFfjjI/NSomYmcL
         mtSi/YrXTlsFbtZNx6ZWbZRPKOskp32veXeWoYtmjwYdxsl770tY0mLuHxjnc0ubeKOJ
         wn/9/4L/MufWtfCFHFpyHltfjxhbUaYUnOEl3lsYHwtEnMH/HrCP7pLMJDIo0++dn3V1
         sp4qvr9CiaNTwLa9D4d7iqMeWIAS35n11d5+NKihoRZ7w8aQOX3qMRlsQHkSMboV4Ij7
         bQ9uvhd1+52KDQqWagJrLTbz6RDwu24BfkcT5vXKlzWOJW0u398J5eQOnyuJudlkamxM
         oOFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=2kyYpb+GFG30Ej5TiseJixR5BoYsIMdO/A10ehgDP9M=;
        b=e6USmPQMSe+4fYkrFTmtSl6SFRGAnBuOEakMaBIx1vOnUQvcEvBecvZW7N+6dny27D
         /dp3wYUX8JqzYB3OFeEx/o9DcKMWGsKw3hheyUhbb/WqjwwoVy5EG0rVO6wBVkjhNIov
         AeqBhkhYpfxPs3+BU6rPsGb2mU0tAUw9/tcNSJFi8K6z9vQ/7ei+adCS2G9AjycnlbHJ
         L5/p3o2gCtLLnPN9nmBGNXg85SHWQ4D1+4HxneU7K59vr4bu120sG82Vg+CwPJZ0bDJT
         msRRR/jVEf9h9qOQKPlYfyCpqwC5XwFO66WfQvJBQcd+WyifI4LyFZispjsnJTy217xG
         FQ5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=MbKKzvlp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3si5949519qtw.368.2021.09.07.00.28.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Sep 2021 00:28:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=MbKKzvlp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNVX6-0004WB-2Y
	for alex.bennee@linaro.org; Tue, 07 Sep 2021 03:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mNVWt-0004Vo-Cb; Tue, 07 Sep 2021 03:28:27 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:45829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mNVWr-0000lp-LX; Tue, 07 Sep 2021 03:28:27 -0400
Received: by mail-wr1-x429.google.com with SMTP id n5so12933989wro.12;
 Tue, 07 Sep 2021 00:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2kyYpb+GFG30Ej5TiseJixR5BoYsIMdO/A10ehgDP9M=;
 b=MbKKzvlpZgVYWritkmnMvf65AbEMiM8dvecdgvIz3dsuSs1kvhxCPQVBQuP8mhkx+p
 qcP871T8dc5/UUhTUVjtUbi1VTzR2AoVn5fS+QNWn/3XAkTzktykGTzLrZa+qHRlhxXY
 vhcvNwjaEvPGyHZOyb18fQN3/FjPzIJa2sR1469KQJDeD2LVzlHgdpP5J+TxIEHcmTWD
 Edvf61S8ETDjGufZ6Jgo718x4kPPjGXnpHOe7dvPu9sjjfzYAOz9X+HGpzr/Vu5mY1Qd
 NaQggZbKXqIRlR7P1CH8ECB8Tq55qACquf7yMMY+5iz3iljBIvzG0OfpBXtUkIN6gwms
 d/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2kyYpb+GFG30Ej5TiseJixR5BoYsIMdO/A10ehgDP9M=;
 b=PmZgqVEB2gsnvlw/3VTmS9zmvb0ycN++icKHlrdorb4v+rvIkglggXi2snHxHzN8zG
 sDUZIaFirIH+P1ue79fWtzvs4KuVerKPT41oLIAKe8dnCecWOYIfOJqIxYLLNxAX1ebj
 SSL4LcMHmp/3UHhQ8qP73I37yj4vEVfTHQ4X2/SyezYuM+A4JJzuTVdIjfM39vQdnNIO
 xes6CDbs9Ynf35fSfpO4LrV2zCeyk3JMrRsPNXtE5luubylqMdoK+xHoPYCJ7b/I142H
 pRXXti0u4RH1LyvDeun6refkbWPR84rIdXoZS8o833FcZ8OU3ADvvuZzUtEtwKKzqG3c
 TKjw==
X-Gm-Message-State: AOAM5305KjqIsfkYaKnMvP1e58eEN+PkdCR51bu74nmZX9SObkPD3dma
 XtRZ1cz5ZVJME3nLxc9N+HfTr+Z0FaU=
X-Received: by 2002:a5d:54c3:: with SMTP id x3mr17162958wrv.208.1630999703383; 
 Tue, 07 Sep 2021 00:28:23 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id c2sm10064028wrs.60.2021.09.07.00.28.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 00:28:22 -0700 (PDT)
Subject: Re: [PATCH 04/10] aspeed/smc: Drop AspeedSMCController structure
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>
References: <20210907065822.1152443-1-clg@kaod.org>
 <20210907065822.1152443-5-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9bf0225d-89c1-3d56-a77a-e90df3f3784a@amsat.org>
Date: Tue, 7 Sep 2021 09:28:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210907065822.1152443-5-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.332,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IeiqRpd9qW8+

On 9/7/21 8:58 AM, Cédric Le Goater wrote:
> The characteristics of the Aspeed controllers are described in a
> AspeedSMCController structure which is redundant with the
> AspeedSMCClass. Move all attributes under the class and adapt the code
> to use class attributes instead.
> 
> This is a large change but it is functionally equivalent.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  include/hw/ssi/aspeed_smc.h |  64 ++-
>  hw/arm/aspeed_ast2600.c     |   4 +-
>  hw/arm/aspeed_soc.c         |   4 +-
>  hw/ssi/aspeed_smc.c         | 859 ++++++++++++++++++++----------------
>  4 files changed, 510 insertions(+), 421 deletions(-)

Overall LGTM, I might do a more detailed pass later.
