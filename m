Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp5615090lfa;
        Wed, 9 Jun 2021 10:59:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLtVaFjpiVAPdfV2wocWEYUOQTIVnRY+WTw+zXjmvrovUNwl2c7w4cCHQMfWqk1jZ7ToZD
X-Received: by 2002:a0c:fa91:: with SMTP id o17mr1015010qvn.59.1623261555525;
        Wed, 09 Jun 2021 10:59:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623261555; cv=none;
        d=google.com; s=arc-20160816;
        b=A99pCAya2pCu7h1B5apOf3k+e72wK6P4UewCWnsWZ+6FOvhv7v42AZvYecjIwsuBkL
         afJy4XVU/5MmjVzluf7CQDNzuDMfq9LWrKsBazCL3FRp0z/UcFbAL7XTaOTZiIqPRNdO
         u+HSkZQeRsi40M/xG2BxBZiuW1k3OfcxQz81VCKRcn901D1R1gIxEsJiw7q8T1XFSvF7
         7R0kaHpOE7msX2GU/ZJ+p+J5KRWUv4A9SqnBbxyZk4ztjl5kUJwJI72nO+tYj/IUboXg
         tGGA+F/sZ5KSNEdsdraRKqBylO3zbeRtJgmJMN1K1cMKWQzELl3vLwTF8WbTOoBmUOYV
         yDNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=7R43pihCNbO1Ja78DuYtPcsCdjbL2zqkvfu80mAU7OM=;
        b=CP5jtt5dUxGHldADtnAGWFYY6Gmw8iZ0ghymNldK2coCJ17kHEgHdYgHG4ve6+coGj
         D/mQl+rX7P5gTHfmUK/MY6nIK7sz3yBYTP8EyBmBbOBS3r+zez8N3DFQDTLtVEjGWZqp
         Tn5441iqXmYrVjVVD2ufFPPdeF6bpqHlKOBAZanMVC4bcJiD53pFVfRtzWYzlhvGb/mg
         Ip2Id0xV4pJauuT4KRd0Feji9u6X2JJ1jGr7Fes2HkLxiL+fs1Ii/ds70fbwUviW04k6
         vzEIq0TJwd1N1JM/v4LoKtHDvEUCAnxoBudJ4tUwTqKu5x4myYUaLfeFhGu1pvRPPtcc
         5Rbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IXEHw9S/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp12si348990qvb.177.2021.06.09.10.59.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Jun 2021 10:59:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IXEHw9S/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lr2Ty-0003gC-P1
	for alex.bennee@linaro.org; Wed, 09 Jun 2021 13:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr2Tp-0003fD-E1
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 13:59:05 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:35476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr2Tn-0003w9-S9
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 13:59:05 -0400
Received: by mail-pl1-x62a.google.com with SMTP id x19so5864886pln.2
 for <qemu-arm@nongnu.org>; Wed, 09 Jun 2021 10:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=7R43pihCNbO1Ja78DuYtPcsCdjbL2zqkvfu80mAU7OM=;
 b=IXEHw9S/iCy+u8I1i9dEK/K3YacFlTtK13VfuRBd2zSrSBqF+VqF7qnGE7dkzc/DHT
 SVN0Uki9BZNC3BswZYKmr53ub3eXk294ouB0GiTBTBW5K1h1ZZ9v65CDuIToaqPCAyps
 v+hNdlta5UW3a9Izqvfu+W2LqtyU0rFHM4zwh0W5WgqZ+DdKyfWwsoXG/xwy14O6kDw6
 HdKsCUvG2jNxBp7a99wbcO9BYBofN9XV4zpXpZRKuKvcJf39XWGdj/vxaoRF0hCK6WYH
 ++IADOOOCko/C0c3ML1yGc86bsPYtaZjEpmJ4HBHTMtoB2cp0RzMRKD1vkX01tYx1hfE
 WvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7R43pihCNbO1Ja78DuYtPcsCdjbL2zqkvfu80mAU7OM=;
 b=nYfOYNMbGJEGPqi6lMHqibx+dZtRl8GX/H/9jE4uqAjJg7r2vPFPt0jbM0Jpqubqxq
 Rj0cyOKxLFntTkznew0pj4xNpuzL5ikveDg+5G2LS1auUISKo6PpKL9WrSd634NiZ1is
 shG3KjNgfGSOIK6MoD6wS/N2uT2JTYMzvwUdvaBIA+6J1L/pGX+Xgxvy7H8gU2n/MF/J
 HPcHxBVUGxEVZ4pzaHiTMYDSzeVV/HrBv7YzbEw4hgOVAj1QXoC9CFcq3sjLEH0vzjCj
 Oe7m7WGIQeFmckm9d9tEA2IZsZyvZkeE7KRnCBObrxCwk67NbJ9YMa7hYgu1QE3ATWgl
 E9mg==
X-Gm-Message-State: AOAM531ah59TPrHg4GFWMeB/mhCc0vLYbr4HD1GdqjbEx0ChUHNmUdjj
 wu6TNDhV72mNrRw/4eHmNo7P5Q==
X-Received: by 2002:a17:902:e04f:b029:eb:66b0:6d08 with SMTP id
 x15-20020a170902e04fb02900eb66b06d08mr720741plx.50.1623261542077; 
 Wed, 09 Jun 2021 10:59:02 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 b20sm402557pgm.30.2021.06.09.10.59.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 10:59:01 -0700 (PDT)
Subject: Re: [PATCH 33/55] target/arm: Implement MVE VADD (scalar)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-34-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7ba48400-fcb8-3501-7781-1021067ba06a@linaro.org>
Date: Wed, 9 Jun 2021 10:58:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-34-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J16g5sOOzJy9

On 6/7/21 9:57 AM, Peter Maydell wrote:
> Implement the scalar form of the MVE VADD insn. This takes the
> scalar operand from a general purpose register.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  4 ++++
>   target/arm/mve.decode      |  7 ++++++
>   target/arm/mve_helper.c    | 25 +++++++++++++++++++
>   target/arm/translate-mve.c | 49 ++++++++++++++++++++++++++++++++++++++
>   4 files changed, 85 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +        MVEGenTwoOpScalarFn *fns[] = {                          \

static const, which I will quit mentioning.


r~
