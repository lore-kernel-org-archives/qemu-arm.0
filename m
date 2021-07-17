Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp2482561lfc;
        Sat, 17 Jul 2021 13:46:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJze/wbb5aR4olyqh2oODEE/LJLmew3cWxhNloYZMVxh7VYe3yir/xDzFzZBBxAABP+Xuum6
X-Received: by 2002:ac8:7a98:: with SMTP id x24mr15565945qtr.42.1626554804963;
        Sat, 17 Jul 2021 13:46:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626554804; cv=none;
        d=google.com; s=arc-20160816;
        b=Gy5JB/sBaScOYnrI1T3Ps3bm/m8VFHPLa4Xnphb+0NtNUipTA8kgzyJB+alA/qcUt0
         wLP5KQLMNmmhRCQ0hGTdRTbx0VrEoRlYF3Ih6nGqqKqwA5AcsEXCUf1cS78mUi5U/+m0
         TeBJdSW+E8qywKjedobrVb7xdjrJ/CiAN6yIeHlpVjkkW2nrsmaOA1GH/KjSc3C/hcby
         xLdW2rC2ESCmf9AEWnN4wGNVYfxQxdxjILeLlMfYfpFEllSTpWWKqX+8uR4fnsktDTWP
         g6nc1qHu6jFHx83OvZB8OljhXfOMtYnWJBD3BZfcdJacYmvznYznRcC1Tj3JLdrvrFAD
         jMbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Ts5KKB9S+JUJhRxBPmx0LpjkBZ16A2xn/7gldoNiXDw=;
        b=wvRH+3PX4yryCbTN/bn6ORpqcINkQCiwZV9V57lRYFM1IFDT9GHj0mdFrB1IeBlczV
         ojnFmnOktxOVVAtn728didJtSOzUV0ENsP0GKxK4opCO6FokTQHT1W8rZih6crPPi7sw
         ET3oHcL3R/Uy/NbW+FfUIEsKjXQSVvn1fJJxV2tzQJwy7tXowGaEVHGXWhY+UqRzZpWS
         V72ZC71TgEpV6Y73Sf1MlkOBrtZ1p7ix1vsv914/hdzKmOQkSokI8FKIdBimsaEM2bPj
         +7RyyifgpXfDcnnAgi2JZ4UyTMYM4Rnf25U4/S6IHLFE6tpitLQSPC29kHtR9yrs4KJE
         oURg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TtZAbmUd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4si11956728qtj.192.2021.07.17.13.46.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Jul 2021 13:46:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TtZAbmUd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m4rCu-00017c-6q
	for alex.bennee@linaro.org; Sat, 17 Jul 2021 16:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4rCh-0000zV-Pr
 for qemu-arm@nongnu.org; Sat, 17 Jul 2021 16:46:32 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:46770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4rCf-00078U-9j
 for qemu-arm@nongnu.org; Sat, 17 Jul 2021 16:46:31 -0400
Received: by mail-pl1-x62b.google.com with SMTP id c15so7388018pls.13
 for <qemu-arm@nongnu.org>; Sat, 17 Jul 2021 13:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Ts5KKB9S+JUJhRxBPmx0LpjkBZ16A2xn/7gldoNiXDw=;
 b=TtZAbmUdKBqXXPeMC46qUJmydyas+3ZafDER5EWEtylKVVPu/rP6S9I8f92wmOmVk1
 vKeEHjAV21aW4L06hbhk8ba/U05fqjS9QnbExzlvunkY4+E/D6ruz97PhvVRk36kfmBK
 BPWlosVLawF7VgKg4AIOFWxT7iWxnTNRcs1SW6oLhXmogJwLHr8OTCrqtORQZ8Vb9LbQ
 d55CE33JPkhVMyhRp0lJrqxrr60aEeNtHjAXIsP6YkG3wiJuvEhgi+41YjiV9HmSLkX8
 iZtVE+MlYOcPgyhV/BkylQiWBQ0zuWCrdRGg//+UUXveYKpPpm/ZDBPIfhA6vWa/Udf+
 ++eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ts5KKB9S+JUJhRxBPmx0LpjkBZ16A2xn/7gldoNiXDw=;
 b=qIU1kKBETtwyBFKLgJLN1l8HSXFiclrehwHoeacWSgHnMrzQclwNBtc8MUqry47Psx
 EAV2Kojplo7CYq3kYpGU/vAOUIUd5OFVCyFUwOHdkHnPnpf9YtG6VllyLSWs7wRd7J95
 CBlPNWdtqvKpiiEeP9XEeYONfJnG4vK6hcJgyr9BCLzoyuCa4V1vntPdEMRwz3nH3Ezd
 1VSBQzaY8DUUTPuwzXqtsmDQnXpU3+wnBlb7vxe/C38ieUYWvt4vjZBipiI3sSWua8D2
 HrNsg0Hnt7J0ex9wEoroE3M97ACXI05f6jhyoFSrqu/Uli5P2461ie2GrSLKS4k0kIJP
 itaw==
X-Gm-Message-State: AOAM530nlJtT+To4oFedUd6l/PC0BGYyrUdlWuYDvpO8/s/Tk3YoZYbr
 euE1g+OkBCmTSaXOs+l6mvti9Q==
X-Received: by 2002:a17:90a:a390:: with SMTP id
 x16mr4505067pjp.148.1626554787788; 
 Sat, 17 Jul 2021 13:46:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id w14sm17159787pgo.75.2021.07.17.13.46.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jul 2021 13:46:27 -0700 (PDT)
Subject: Re: [PATCH for-6.2 20/34] target/arm: Implement MVE integer min/max
 across vector
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-21-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b38a6e37-084b-57c1-dc91-867e9308629b@linaro.org>
Date: Sat, 17 Jul 2021 13:46:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
X-TUID: jAXChKj8cec6

On 7/13/21 6:37 AM, Peter Maydell wrote:
> +/* Max and min of absolute values */
> +static int64_t do_maxa(int64_t n, int64_t m)
> +{
> +    if (n < 0) {
> +        n = -n;
> +    }
> +    if (m < 0) {
> +        m = -m;
> +    }
> +    return MAX(n, m);
> +}

This doesn't look quite right.  The n operand is extracted unsigned, and only the m 
operand is subjected to ABS.


r~
