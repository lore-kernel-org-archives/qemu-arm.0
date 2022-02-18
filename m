Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp880753lfq;
        Fri, 18 Feb 2022 09:36:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxeOicX+6mGgzccwvIYj6zgjoPJGHoyhXV1QIzyRoJgoMZkNfkJ+wH3JphmXrqej8/afl6V
X-Received: by 2002:a81:5f85:0:b0:2d6:941d:4912 with SMTP id t127-20020a815f85000000b002d6941d4912mr8390270ywb.430.1645205797335;
        Fri, 18 Feb 2022 09:36:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645205797; cv=none;
        d=google.com; s=arc-20160816;
        b=MHFSFES7YEpBOTS8SjPJcn0r322vuOL6szrbuqZbuvFOfeXcOtavvtaNbza0Mpt973
         P14qESzCLST7149bRvJHNwhxwUM0gNYnb3RNQVyuwhh68uvjkEnCVDzLHlpRr0djue9x
         1qKY8SlSK/trsYOxh3Gq2f5LKi/b8XbAb2o+yDPW8SB3QDQ/ulEhEkWVq4jHAXOHUiwK
         sjylLrytn97/YCYn+Lwe2FKUEHur97Ls9bXFAAbGUQ7CQgSLa2aFZK9hlTTd60fXbGJI
         LNDySg9ahjaMEiV+5Q8TA0GTi6vETQmZq5T7nppMLjz5hak599Ht6h1pD2vnT2Zp0Q/M
         XAVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=BCrCh2lhmV+WVnUPXT+ce73rTawNEzcWj7AoriX1g+g=;
        b=enIIMTjZuCbyNrZ9VTVE+b2fZ2L1juBuHGkT2qXIAawtu+RDdFD7l6crwTyLB1sZAA
         dski+Zl1rd+lK0s9dD+sVzTbmRFmC0Drca+OxeEStsYOrFVwQoJaeqfUhK9nlmmdvK/Y
         5yjDdYA5HTCyKXAA4z92FTt13+WTZLqnFk1h1p34OXdaYvNamRWTBMPjfPlZikJQ69dI
         ddTGS+HzwkQs4ztlclE0+w9mKllDPGjeHVGDgcyJzxyjovb3Dk6d/kQPaF7rXKNMYA3F
         wgn932XG1elzcBjQl+xeINoN+1q6/tGSdKmKvjHEy/Q8XdiRn20AYQuCl5qIuFFlVEQy
         K2aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=OhWhRCSO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5si33254473ywm.113.2022.02.18.09.36.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Feb 2022 09:36:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=OhWhRCSO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:48208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nL7BM-0001Vo-Mo
	for alex.bennee@linaro.org; Fri, 18 Feb 2022 12:36:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nL7BE-0001RY-SF; Fri, 18 Feb 2022 12:36:28 -0500
Received: from [2607:f8b0:4864:20::1036] (port=55189
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nL7BD-0006TM-1e; Fri, 18 Feb 2022 12:36:28 -0500
Received: by mail-pj1-x1036.google.com with SMTP id b8so9178742pjb.4;
 Fri, 18 Feb 2022 09:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BCrCh2lhmV+WVnUPXT+ce73rTawNEzcWj7AoriX1g+g=;
 b=OhWhRCSOgIAJ07x2S3MMvTB1elJz2xYO4gCvH77r5gRS0AoZX0a07UcYpAsoM3LhNb
 IAPNDuJcXC2IWGnPDUz1OILp8FbB1AFdwrOQgR/Rd+jth/O/VsBgRCfTCu8BA/NLnLnj
 zmwjfVPqOTPU0MtiwfzK93XmnZPN6acUWmSfrgGEP0AZcJrkvQGauva9m5PXYoE4Hb1e
 +UueV/gWP5ENkjdoE4Su2HLERP80zt+lQOPZLJQT3k2O6V6rCK5iErzOYUL+2Jg+OLZd
 E64ZfJuhDAhLbS6cHmDtP27BpNYPwrMe+j3Wa6DAHzgpcuFn8oKZHtDNIuBURsCWbOPE
 Zd5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BCrCh2lhmV+WVnUPXT+ce73rTawNEzcWj7AoriX1g+g=;
 b=A7vET6VmwhjYPzjOlNMRRJW0IrxNXp7VnsYLg+mtQ14egxqddaOxR8Uw6NIJNjBCrN
 mzwnLTKlPuWlBffE99DmB/SwAFuBUwE6+ZvAN5up7B2zeDIfW4TmUOt85TlI9zJj0loZ
 CSfk7q+sEkGTJUpPDH5024Md20xzqq0clFONB7Xtjf+ZiBzGXOwoaARvbyVmeLWGpQPg
 MAkqJK5Rybsi3AA/Zq19RTmNahqD5pKijjPTvE++zWa/poMqoR00wTB9KfR8ZGLkZtF2
 T9Rsr+UCn4rroaBp06LHBRhzknTAfxPJODrz1Dh5UTAHit8GOxk+oje+nmNWkqvfbz4P
 yUww==
X-Gm-Message-State: AOAM532kwaLA1MeGqGP99SJbcW2PJE3ghoA2BjnwwvV1JaXlGOC6WcRo
 Nh6WycH3YqfZ92lbvCCqnxo=
X-Received: by 2002:a17:903:244b:b0:14d:927d:10c8 with SMTP id
 l11-20020a170903244b00b0014d927d10c8mr8394408pls.51.1645205785282; 
 Fri, 18 Feb 2022 09:36:25 -0800 (PST)
Received: from [192.168.209.175] (65.red-88-28-24.dynamicip.rima-tde.net.
 [88.28.24.65])
 by smtp.gmail.com with ESMTPSA id 16sm3854343pfl.99.2022.02.18.09.36.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 09:36:24 -0800 (PST)
Message-ID: <8fb8e784-76fa-5320-1146-f0b30b68ce06@amsat.org>
Date: Fri, 18 Feb 2022 18:36:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v3] arm: Remove swift-bmc machine
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20220217103141.385345-1-joel@jms.id.au>
In-Reply-To: <20220217103141.385345-1-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>
X-TUID: t7DPCOm91IoL

On 17/2/22 11:31, Joel Stanley wrote:
> It was scheduled for removal in 7.0.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> --
> v2: also remove from docs/about/deprecated.rst
> v3: remove strap define, add note to removed-features.rst
> ---
>   docs/about/deprecated.rst       |  7 ----
>   docs/about/removed-features.rst |  5 +++
>   docs/system/arm/aspeed.rst      |  1 -
>   hw/arm/aspeed.c                 | 64 ---------------------------------
>   4 files changed, 5 insertions(+), 72 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
