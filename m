Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3711882lfb;
        Mon, 13 Sep 2021 07:12:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyA97cBQ5Jjaoqg0ClgEUxj6exRRimHGduzrIhu/Z2iQMpuaV1MVFImWRoGtua6vBbBP2nb
X-Received: by 2002:a7b:c142:: with SMTP id z2mr11699857wmi.10.1631542377018;
        Mon, 13 Sep 2021 07:12:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631542377; cv=none;
        d=google.com; s=arc-20160816;
        b=HIUrfXeGFPtRxpgcCtfuE82ppazwmN/QfHFFoShdXLJKKjV0kyIRqvqQ88CQHK64C9
         zElrkUAUILKAPRZ9O47rtMWlGUFbXvXpKtCBNp1ZdE8frldrt5E98nHt+C6X615p4FRk
         IvwcKkPmQd0+ylWNoG3BjUtwuwkMEZOyZ/ioduuDW0dbCLbLznsZjEHJupjJ4TKqtVKn
         Sq/bJSucWOJ9ZGmAX+h6UhVNR8fXzdiEKOT9xkz9qnS58CdwuCZsGVpxd6Lvz11qsXnk
         Dxz7flVilpbPqbPV8FzNjdpndgsO6+tV42J15QS2ZweoxwFdxtBu3WVySy8dQpqH8wdC
         N4rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=oBGlz/XZ0g2AF1bkdUcJt8PrhgnflsQV7r4zoJ62DjU=;
        b=yMTzP1iVGecOMpzItodNLDwJiK2SNW1RWKQP/+4/c3Xv4DTO7xJHpsMAj/pporud17
         queXX04eSJBqMieskL7hCNqV1Hm6DlW3+GVozpzt+jujLcggCA4ccA31Qwv28J6jM2c4
         3JRu+5Kii5zBb/isqGxoeBaaH7gkHyWIYvPY1FGKJWR87I7hzwnhybk7quUopKiy4XOS
         R7KepS3orOjpCjWfrI/ENPykxVBlbK9EcxtnVaXun3JwJXg8x9rjj2f3JHtR48w4zJBa
         yG8ySVNvdLJ86qHMELTQiPonchqcMkK/RjlbwV5Qu2cmDa4ZRdO7hWMioZn2SnOHbcyp
         dOoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yh+ChAK/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3si7302829wrb.293.2021.09.13.07.12.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 07:12:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yh+ChAK/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPmhc-0004JK-4k
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 10:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPmBG-0006mZ-J8
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 09:39:30 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:44967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPmBD-0001rW-Ln
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 09:39:30 -0400
Received: by mail-pg1-x530.google.com with SMTP id s11so9463165pgr.11
 for <qemu-arm@nongnu.org>; Mon, 13 Sep 2021 06:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oBGlz/XZ0g2AF1bkdUcJt8PrhgnflsQV7r4zoJ62DjU=;
 b=yh+ChAK/xrRnDjFYFlhYJYCMkWF5W+aP40hWjz4YyILltCFEa5PMeDYEAgiGF+ist6
 Hcad8QLq3iOt9/pg0hpUeH96/UUqqhIK4s1Iu2sHlNV7EMD7tc9YDM65IYltbw+/j+x1
 1R467BMwGBwRPx2zxzxR8iDCJU1GvrXjypcv3bkKmyU99Bi8gFfZCIxaikOMd8koxR25
 JPwaVRo1rLcNB4krGkZ8XsI289yheY69pTy9hmwXm1D9CNeWon4UZ6LbCXDqN5ReF+lG
 j+ghtuNSBF3W5J71MOB3naYJjcxQAy8wysKR+GZ2h4l5PynqeHCfntkk8/RqZJpoE4qD
 4X1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oBGlz/XZ0g2AF1bkdUcJt8PrhgnflsQV7r4zoJ62DjU=;
 b=bBsZ8VOtiv0oVjSNseSMC+cTYBjR8oq1yxWMOvWdib45zZV4ytE5bUrzVKglvIxIEf
 /tHh+Wj/84rjMDmnyaNfhUnOoPqwc/fcecpEWL5Pz44NMbMhIM6T7W4mQJX6YjTOgMW+
 Awj6xQb2tzMDftLCHY+cRnUB1bnNMQr4nRwy164pYuUj6QEXLUXn/oH+JTLx3E/FAWNY
 m3EBT8dLD1eaPkXgx2Fmz2IOJJCS53EeKSr6qVQAGjYRdb54HSAsUuSWVm8BEaST1OCB
 NiX8ORY4ftkFIYKWhh4CVJZlf8U83ivvMxbO4AbXaD08oy3noqDsazS0Yd0UDuuc9aVW
 Xp3w==
X-Gm-Message-State: AOAM532CGyNDFgG0qsJKnlimKzj0TYQ/bzqfcstUictURiw97R0Sso4p
 ZK7JFv4HIsA8B83cJhJhyMVdpg==
X-Received: by 2002:a63:f513:: with SMTP id w19mr11000300pgh.231.1631540366015; 
 Mon, 13 Sep 2021 06:39:26 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q2sm7074502pjo.27.2021.09.13.06.39.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 06:39:25 -0700 (PDT)
Subject: Re: [PATCH v2 02/12] target/arm: Enforce that FPDSCR.LTPSIZE is 4 on
 inbound migration
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210913095440.13462-1-peter.maydell@linaro.org>
 <20210913095440.13462-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cec80a41-9cd5-46f2-3fe5-9d1d74d5883e@linaro.org>
Date: Mon, 13 Sep 2021 06:39:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913095440.13462-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pJ87bESNZwGt

On 9/13/21 2:54 AM, Peter Maydell wrote:
> Architecturally, for an M-profile CPU with the LOB feature the
> LTPSIZE field in FPDSCR is always constant 4.  QEMU's implementation
> enforces this everywhere, except that we don't check that it is true
> in incoming migration data.
> 
> We're going to add come in gen_update_fp_context() which relies on

"code"

> the "always 4" property.  Since this is TCG-only, we don't actually
> need to be robust to bogus incoming migration data, and the effect of
> it being wrong would be wrong code generation rather than a QEMU
> crash; but if it did ever happen somehow it would be very difficult
> to track down the cause.  Add a check so that we fail the inbound
> migration if the FPDSCR.LTPSIZE value is incorrect.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
