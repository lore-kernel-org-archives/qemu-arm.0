Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp813629ejx;
        Wed, 9 Nov 2022 21:43:29 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6Fl6wHZAbEoiH7kSEs/5iNIGjxwD1fGtZW/IKCPllCVpVPTURZ6QfhRGkLude4Fe6z0Ofz
X-Received: by 2002:ac8:4756:0:b0:3a5:2705:ede0 with SMTP id k22-20020ac84756000000b003a52705ede0mr43627981qtp.319.1668059009419;
        Wed, 09 Nov 2022 21:43:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668059009; cv=none;
        d=google.com; s=arc-20160816;
        b=NO+x7NNqMYdIPhndYldlXH0tVo+rcTJRyvDh2YOigkq5AgUsO1jk33PGHZ9VQ9pU79
         1Qtx5Ou7GvDwgLOR52lEuhiIlO/iCPq+/9297x9Ux2G0OIPc3VJGOvgIX7FJBhgPEzGL
         PpFa3wsWlzMsVOT/KWq4dKRuTXzy6ENi327fCp53emSGVu37vFAR80pmGtMRPswhRGKi
         nTZVxsSwuO3S9gYbF61a1jfsK8ccFpiS0gRNi0at1fEIqgVgIguno5M3ChhZXQMeeVsW
         JAAGPgwQI3Q/nW0aC9cMI1F8YGK8DDjcrzThbYBd5Hi86gLN4iYmN+O8M6/QLvoQAkJI
         OOVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=kkkJRNB5iEj1u2/jWx07iZulRFainRFSjPdTa/xPYK4=;
        b=UZVN9EWBaK4CbmjY1rrahl8o/0Q9psSFrixDdQNWvMWi/rdkLE5KH4qg0tilfeOG4m
         h2YXrJIrjNnTwWNxtIP1EOmxNFCnnAdsBbvTEO3PCQYXZu3KH2oOwHuXLZYUUaY5rvVw
         r1AcKLKz6TeDMBq+s2RrudxLh6ApL1Hrut/Lwj17wS26vpp36iCxZWn668c5sdDCR/5n
         IH0EZFldPuVfNY0ZC1868vB0APQweGN4SNq4uwpHw7DGF7GL2Wg46B+pBQT43/9zd1NN
         +odyduTiHRnxfWEpDiKbrVjdP7qt9XfNxKXDoCM+SN/j0+8J4h6aFSCyDN1uEr7l91eT
         QVKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nl08b1Ac;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l62-20020a37bb41000000b006ce7d23c961si8946908qkf.393.2022.11.09.21.43.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Nov 2022 21:43:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nl08b1Ac;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot0LU-0003fs-SN; Thu, 10 Nov 2022 00:43:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0LT-0003bE-2I
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:43:23 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0LR-0004ce-IT
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:43:22 -0500
Received: by mail-pj1-x102e.google.com with SMTP id l6so812284pjj.0
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 21:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kkkJRNB5iEj1u2/jWx07iZulRFainRFSjPdTa/xPYK4=;
 b=nl08b1AcqbilxllXlUwNfl9yd0IXbqu1xXXN3FsfJSAXKgMJNc7RTtvE79981284iP
 nC2/J9gNGIl/GH73cQ3SNfD8EoozFtOeLjVkLkSDezY528iMPYBfRH+2C45fG9f2d1xH
 cvsaOUpLNvzdjcTxHZeh4mv0TsQ2FoR0nRPyswZvuoncGXs6NrX+N65otlxDACmcNDKc
 c4nbLQchMMq52Tauie23WMd4f3uo2/sfIycMopfRyPI8LYnIVk08v9PnL2ID1KKRUX3q
 9PptBxVX2gOhBRh0rnRD7saTOdAWyybmDsQYYeWDq6sNtIew8ENtCKpKlqhQzT4SdMly
 4kgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kkkJRNB5iEj1u2/jWx07iZulRFainRFSjPdTa/xPYK4=;
 b=itiPzmfQK5IhpcldEd8jEqLIN2GNt4wXupR3SW3zKmUbCg4IT9I7gvz4XikowdO72E
 dlJLPAeSq3DyKfJP3/Hy/AQaL0jmFBHOWK6l/44jNGjPxfFnkt2+dpVzs7jWSzNhAD2Z
 6xvTgFfqQ8zo66GSSo0mayPmTepznugB7b4D9Bgb1mGZ/x6Ai/L2/x7bjnBqDrChv1e6
 5WR731U1nremQIg5Yb4xkuC6+da12NPep8PQObnXpmzUcqac6RgY+PW6H7muZvTXzMkP
 MKZyFhLQ5fgFZ1ybieKOX5du3ENIV1rEXArnwQ6gFKUWWdJTyDAvivmWMFLI/HkGzD81
 ZA7A==
X-Gm-Message-State: ACrzQf3h+r9Jhl+oK1/yhztGmONgaRG1eh23XdNaKSytctvKUxZn166j
 6h0M2+TwMokyjcfop0WWWqtGo+TuBglBcR1a
X-Received: by 2002:a17:90b:1c87:b0:20a:e485:4e21 with SMTP id
 oo7-20020a17090b1c8700b0020ae4854e21mr65043787pjb.194.1668059000261; 
 Wed, 09 Nov 2022 21:43:20 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca?
 (2001-44b8-2176-c800-cc47-10aa-3fa4-e6ca.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a170903228100b00176ba091cd3sm10206946plh.196.2022.11.09.21.43.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 21:43:19 -0800 (PST)
Message-ID: <e0891fb6-d9df-3c73-5df1-57cad759b606@linaro.org>
Date: Thu, 10 Nov 2022 16:43:15 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH for-8.0 6/9] hw/intc: Convert TYPE_KVM_ARM_GICV3 to
 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221109161444.3397405-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: z90c815guOnC

On 11/10/22 03:14, Peter Maydell wrote:
> Convert the TYPE_KVM_ARM_GICV3 device to 3-phase reset.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_kvm.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
