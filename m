Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1092442ejx;
        Wed, 30 Nov 2022 02:31:22 -0800 (PST)
X-Google-Smtp-Source: AA0mqf52ZFixCC1nkb8EbZBi5SnRV+FqVE70icyeoSD1ral9wARTffeiDA5mar4/pRcl2UFmvv0x
X-Received: by 2002:ac8:5e95:0:b0:3a5:50c6:bdc6 with SMTP id r21-20020ac85e95000000b003a550c6bdc6mr38292970qtx.370.1669804282607;
        Wed, 30 Nov 2022 02:31:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669804282; cv=none;
        d=google.com; s=arc-20160816;
        b=aC5uHctsVB/KgQsG6HsVLeZSfhMPfQmRB7M5A9g6i4RQZOZIDQe9km+rBNJejkd2oq
         EY0+Khwzol/4oaJ4szTk2QkbLLorKQkFZwjCSjIS3sCBYp5cdLQ+LWFYkBESzNkLCpPe
         jPqxg72kqflZYLKJYLXx8vz08iyPCGb6mUZgmIkfmVkbSQWtlYs/MPsf+8cErPhSFi58
         BqblEQXnN31qdZ3SY6F4jYlsngwgAPZ5X4FVqs0spwCCTMBfkXs5KWTni78Vyjnl+Sao
         SC5su0w/0wxbkpXAV7RRXq5+qfXaXC7uHFtjDHHk7seEImOW9rXixzcWycq/RpwIleOX
         hC0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=JYsG/bwtKGZpLZhhcofbQLdp2CkQltBoFuzl257a+wg=;
        b=nkRXgxuQeA55nMllb1XkXgm4iUaFHd+qx54ZbLB17leZkXFKSjXnNV0B19ca0KgR1E
         GVvgLSoK5/Cv/b30/2Q0TY8PsibDaD//MtJ5gbZqX0+BeiqLm3zpWNdPhtoyUX13Z3Ym
         QsOKKibDGa+DyxYPheKSndBhXOP4vj5IqwpKSgoO4A0Z2OMZMJquKwNu9hZkdZY2H1po
         UIYZM6DiwFM1CSipUwcban1NWIO8Z6hO2uyJZHW4G+pnaO/SyYh/8BVRr3pS6zv1+2Xr
         ip1yRQP0yaIQ67GihuM6DMn0iQsSbbNwnHedC63oFpIsNEenVuFjfii98S9/lVyguqTn
         T0dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IUbRXtW8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d10-20020a0cc68a000000b004c6adf76c02si457629qvj.370.2022.11.30.02.31.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Nov 2022 02:31:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IUbRXtW8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p0KMw-0001md-Ih; Wed, 30 Nov 2022 05:31:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KMi-0001kw-5R
 for qemu-arm@nongnu.org; Wed, 30 Nov 2022 05:31:03 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KMe-0002su-Bs
 for qemu-arm@nongnu.org; Wed, 30 Nov 2022 05:30:55 -0500
Received: by mail-wm1-x336.google.com with SMTP id o30so12865022wms.2
 for <qemu-arm@nongnu.org>; Wed, 30 Nov 2022 02:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JYsG/bwtKGZpLZhhcofbQLdp2CkQltBoFuzl257a+wg=;
 b=IUbRXtW8PwF0RWeD3SAG8XblrVUrppfrYImUVgxhuU3GG5CYTdIJHfv8IDey6/B6ub
 dl/YU/AU7VtPL0y6g5YjDP11913TpQXvLLimpUzZzZ8P4kFUj7YYvbRwHt+GNBapx9+b
 xXxVDBgmktNK6fIJDE5aFgxPwSXOqn9r/ICctpW3zb5d2j/eVbRhU8/4f3hevXjHAMbD
 81HyWz6d3P5t3Ty3nxjrpFsoQgg3XN0eDJsS9XIZfGBP8KKddaR96p3D0vebuJVKR13D
 54/O3TlH8J+lChUZ8t8mYPAIMRF4Sx0TaXhGkyw1sGgXMoltDrvNTdXTamMEuImSrtWe
 6bpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JYsG/bwtKGZpLZhhcofbQLdp2CkQltBoFuzl257a+wg=;
 b=EauWL+yqqIB/AiWLyL3oDX8icyPtoyG/gSGri1PKc1nZGKdC4nPIzuo1R/6FoHi0lt
 aCLRa6QOVLRE8FuRV9zcXaRgChCCvyDudy4wKhnYo+tYAcCcuOW9Gjv7DAT53gUALogP
 ALQalsRdntXQwK90tNPJ+Mxoo0CAdLuxX7jGa8ygghsO+rjTRNwylf5B/YlWRtbvg8dv
 069gQDNHrGY/nNxibWaQtsgUi3SVD0BMtgNutfxqctZvEUgGeU+u8ftnLcM3OtJoLkxZ
 /LEJ587qazIGFrb0V42JF0FeRy7jbKH012eCtvuDF4RMdbVIWzPKZIV4OHHJk5GxkxBn
 X/Qw==
X-Gm-Message-State: ANoB5pkZDpnGjp2T5ApwY3+61mDpNuJ60pDjJdSgeqZKsRUOwGUZhrvY
 AoDVN2ZtjqqN3uOZXy1kZPFufw==
X-Received: by 2002:a05:600c:1e04:b0:3d0:bda:f20 with SMTP id
 ay4-20020a05600c1e0400b003d00bda0f20mr39745633wmb.105.1669804249741; 
 Wed, 30 Nov 2022 02:30:49 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m14-20020a5d624e000000b00241dd5de644sm1078939wrv.97.2022.11.30.02.30.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:30:49 -0800 (PST)
Message-ID: <8957a4ea-0871-b2d8-59f7-66573d484c39@linaro.org>
Date: Wed, 30 Nov 2022 11:30:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 5/9] hw/intc: Convert TYPE_ARM_GICV3_COMMON to
 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221109161444.3397405-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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
X-TUID: cV0Nkv+HV7Kz

On 9/11/22 17:14, Peter Maydell wrote:
> Convert the TYPE_ARM_GICV3_COMMON parent class to 3-phase reset.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_common.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


