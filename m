Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp813157ejx;
        Wed, 9 Nov 2022 21:42:25 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6GMcjRRweqsmHfN8H3wWtcEAsENYZFyUUEZ6b+dIiejAAyq9HkoeN6tjrdojDxUc+WFCao
X-Received: by 2002:ac8:48d7:0:b0:3a5:3ec4:7a31 with SMTP id l23-20020ac848d7000000b003a53ec47a31mr36870139qtr.375.1668058945316;
        Wed, 09 Nov 2022 21:42:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668058945; cv=none;
        d=google.com; s=arc-20160816;
        b=mah6tRP8idx2p/LdR2vdLwi0gqBD7pdnugsS1wwPRVOS1PvZih80usjHj8zwC2QYni
         e7E5UsnwvEDFS+iQAgQPqJiBGxi8NDZBJwhk3ngX4lA6pi0NM4QJXePEudPOhALS7iwY
         4eBqXnSnFKTI00sZn+WywXoB0Oxtw8blP3Y951l585RnubxSkaJrWlP86L0maRY6mU1W
         lCv5+0+vihZiDZBAw/JAsluEhpp9PPyz7lPl+6O1ZMe36kgKOfPgZJd2KSBP6pkW3NxI
         iB23PErUje2Jq/SN5RcYg6EFcIcLbYFvcPptyErOI+YLksggfNbKFUXWPlixWPmwEp+7
         /1Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=fuxbTPvtL2sntyBOEOkBLOWRJnJr1VVluAEm8zejlb4=;
        b=cyQtp04LkiRZu/KzzFcdtOTMu1ASH3127Xetyt+iFYbvqHEHKJ8Y3uoyWqmERbkW6J
         1XMJIr5PSYHhFjsToMgZXTv7/5zbp0HvSF/eicAgoOtqvU0wmdCv1DRsAykXo/7JUGr0
         R0nqOfeqT0NK+KRhrSOt6H8Xm2Ld5qu5NsTtrI/LPuy3jG5Y6TKFN/p8aeIa7KQ+iVJO
         tDwCLemL00SXuCfsXdC7LAPyIVJPXNyOrf8czjUOG7uOwMOQoEipqc/yzV/RtQAYGjAH
         Di+ozTQRE/ELbHblAJYpJARXnqXanq+hB7zgB3g7ZqI5Qci9IkMDBkf9o0Ooc8CA9/BO
         mjGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J7aE4yNa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h20-20020ac85154000000b0039cd5f08384si9552983qtn.103.2022.11.09.21.42.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Nov 2022 21:42:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J7aE4yNa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ot0KO-00017I-Qj; Thu, 10 Nov 2022 00:42:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0KG-00015L-Ik
 for qemu-arm@nongnu.org; Thu, 10 Nov 2022 00:42:10 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0KD-0004JX-3P
 for qemu-arm@nongnu.org; Thu, 10 Nov 2022 00:42:06 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 r61-20020a17090a43c300b00212f4e9cccdso3844830pjg.5
 for <qemu-arm@nongnu.org>; Wed, 09 Nov 2022 21:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fuxbTPvtL2sntyBOEOkBLOWRJnJr1VVluAEm8zejlb4=;
 b=J7aE4yNau9K0a1f/y2YpStjvyAWJTs9AGxSbGudfF+3P9FZ0BSqWlCdon5YZQIU8B4
 RcuyPJteBEVsCYtj0ITo6y6eIL6YHEsc2qeTRup0uFDbVUpsAl0fmGofACdpqsMNn8oV
 exr2lTw6yYGjn3D6IbXjh7kLHCZWpGicZvAF1YLju2sXebMAttmn2UDNthDCeK9WhrRS
 mbbZendV9QyET3O72N95M8fFNUVwD6W+yQQxq04dj2UBzhQZlo3uP9zzS7t4Fs6xm5gq
 P69jSh2KHSxDZi+h762SPlE0+u8WR7qSDmj1LfNmkGD/q/kXt4wqw7q9mBecsI6cXRDV
 gtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fuxbTPvtL2sntyBOEOkBLOWRJnJr1VVluAEm8zejlb4=;
 b=yNlHG+kaggUKdOuOExwUFvbSnnURgnxN1mj2TTXxFMZ+tU9eLJH1rav9t+SxvUjIqn
 wwzYao8+Sevj6F6xh/aifDidCJttS0Xa0QWBGK5vjyDJey7hXxLyOo9WSUdIeUeC6A4d
 J8i/YG6i7Vv3r6yU07nDmXni4EwK5B5ttdJbE1PvvSg2GTYLgl83L00n5S3fA5JnVBoH
 438mS3e/bsZkBEVuoEFo5y1kQP5EvAd8ZhdFc31OWcMm0azRXl0WQq/Lflnl3HG+lDYx
 ZNlkP0gl6Rop6IaLCKdjWaiRjKAxHvli/aq3vkjOQJWtmO7o/40Yc71l2Rh/xsldbkwR
 wh/A==
X-Gm-Message-State: ACrzQf06yfZ2BedKmAgDvFXxcGuLakoJRSfUp84ikAMu4Tyrp3ZGZ+h7
 sFq2jyu44UN/uAVKWRbRwgUBqw==
X-Received: by 2002:a17:90a:3e85:b0:213:36b6:fa16 with SMTP id
 k5-20020a17090a3e8500b0021336b6fa16mr63823171pjc.56.1668058923796; 
 Wed, 09 Nov 2022 21:42:03 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca?
 (2001-44b8-2176-c800-cc47-10aa-3fa4-e6ca.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a170902dacf00b00179e1f08634sm10182458plx.222.2022.11.09.21.42.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 21:42:03 -0800 (PST)
Message-ID: <2a7de80e-5bf2-0054-c9fc-9d89b923346e@linaro.org>
Date: Thu, 10 Nov 2022 16:41:58 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH for-8.0 3/9] hw/intc: Convert TYPE_ARM_GIC_COMMON to
 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221109161444.3397405-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: JSz1T1Io883l

On 11/10/22 03:14, Peter Maydell wrote:
> Convert the TYPE_ARM_GIC_COMMON device to 3-phase reset.  This is a
> simple no-behaviour-change conversion.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gic_common.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
