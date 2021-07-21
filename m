Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp6142104lfc;
        Wed, 21 Jul 2021 14:46:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx24KFXfShOE+Gw4xiFUaEYKIxPMl2tcR+qACHhtdcIYgOWKLEJFM010puAfgWO1Q/7jLMl
X-Received: by 2002:a25:68ce:: with SMTP id d197mr48452501ybc.317.1626903963883;
        Wed, 21 Jul 2021 14:46:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626903963; cv=none;
        d=google.com; s=arc-20160816;
        b=sKYTYvc2wDQLAEwEBK12QJ1XcP+0aBt/InveKEh+bEwzjc4AjukKPWf+hkCfBqd+CT
         1mG6lY0AwvIwLQP5DQLTxUQQvKn7Rtft6nuPRWLtzH/IIqtRdI8VjP1HLQ8e6FnWw1Rw
         uC5f5GwvMW54wq5Fc3hSenaz2vx7eMUPd7RaPHdAheLT7OfwhwaYZcjzAhJyklkyoxsc
         8O9ZksR4+syGuz3kUACOhVn3HbisM2MT1nzfGgt4692QtOC6cWIDmUwtrr8zA7SatOea
         I5HSv2Np1WJTFRVhgQtU9szrET4WcoYtBtVuqJKdtep5nvE9VaZCXxNMVSzIbfABKAuS
         lqTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=buq7FDD3KZ43gB2YDId8Ok5h3xwtgLW8DgxP/2wy9bs=;
        b=J4J27+PUCLn4xXC9i7a25racwI8CKXZ7+hHFYZHLz+UaF9Hx3hIRg5r2qWrQywWyhW
         H9QQ1T6d8IgWnB7vvurJgo9yJM6dojpYKDBACH0M13OFxdK4lTpyhlSCYRCsvTTG2YUe
         KNcV2gva4m/0LWLeLJ1SnTftycFJ3Yd2eat+hgiqXPZ7DtZqHg3nsgShcfeRRb4G09mj
         4uckmvQ/GoPPYoE4TQwpYK9w8RtuetjZwWahSi/6ktlCjC+aeroQAfFCJJSN7/DBC9Y4
         4PhgoNgq4zswJEUGQymxfHkrGziFK25BdBQBc7Yj+siY0AWBG07rKpSdc6Asvcsg0isP
         hiIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zvdyr0nf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r11si27684477ybb.372.2021.07.21.14.46.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Jul 2021 14:46:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zvdyr0nf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6K2V-0006f6-4U
	for alex.bennee@linaro.org; Wed, 21 Jul 2021 17:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6K1i-0006bF-HX
 for qemu-arm@nongnu.org; Wed, 21 Jul 2021 17:45:14 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:43708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6K1f-0001bj-Bg
 for qemu-arm@nongnu.org; Wed, 21 Jul 2021 17:45:14 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 x13-20020a17090a46cdb0290175cf22899cso2614663pjg.2
 for <qemu-arm@nongnu.org>; Wed, 21 Jul 2021 14:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=buq7FDD3KZ43gB2YDId8Ok5h3xwtgLW8DgxP/2wy9bs=;
 b=Zvdyr0nf7L0It1wiRd1+FjBEoocmNcbpg05n0QoQYqb4fAHuXEHegVefKWZDDpP137
 3IE4pmuDtBvAVqm8/Euoq9hfVOFfcGtWwet3eaY1/++MjziQqg+vyEK7RrhicZz3ncoV
 2i2ls9EJV5j2+D/MVi2UUeVkXD26YnO/g0yqlS3KKDXGxDRfEAlAzhJ73VMn6kqEwO06
 22ohp/gREa8bSkLS4px6TEMvzPRVDgMIb1lGzMl4P7YMEkZNh4HqLsLzdvR3iBChZCsC
 vjygUX46W816hqa5/vzGXuUqB2gk8Nbqs3ej1LiE5q/Bv+OklG2JSQnn6l1Dmoe2ayL6
 vaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=buq7FDD3KZ43gB2YDId8Ok5h3xwtgLW8DgxP/2wy9bs=;
 b=K865qiMQnT3xNspMyGGOl8Y73NdrgX1asVHAZTbfIVhq3WO+CEFqX8FsVbXwlQIIEq
 40Re+nawZuSWYS8a0xClJMzTEtv1t+ZPJU96PHh6VhmuCcHWC690zjLAdSYwiImWKL5P
 bjRh0dBk1ZoyraCkGzLsKMyvNh+kUbQfsii0+IaOOATn+XCn8Rd9OzKaEChoO+PxxPjn
 t5Xgi4CSZkJX3u5WsujGr5daijc9tt7NyVjm+0I+KkjbBCsQQRDvktxL/ebriC4MvBCN
 OAvoPKeU5Puq88OjtfvcTgjeqcwbPWa4GlKMqt7cpBvWrRK/wYviFOxTuN+6e2fIY+kK
 QiMw==
X-Gm-Message-State: AOAM5327xKHqFv3HGW7cP/chw9zv+C1QbvlYSk1WwcfB8vWsSD/wAgCG
 yL2Ccf9Q3G2FQw8TQ74nn9N8rw==
X-Received: by 2002:a62:b414:0:b029:317:52d:7fd5 with SMTP id
 h20-20020a62b4140000b0290317052d7fd5mr38719290pfn.30.1626903907213; 
 Wed, 21 Jul 2021 14:45:07 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id k8sm31688977pgr.91.2021.07.21.14.45.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 14:45:06 -0700 (PDT)
Subject: Re: [PATCH for-6.2 22/34] target/arm: Implement MVE narrowing moves
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-23-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1d43270a-47cf-cfba-676f-e90958216ae9@linaro.org>
Date: Wed, 21 Jul 2021 11:45:03 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-23-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.117,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0zW0ac4kugKV

On 7/13/21 3:37 AM, Peter Maydell wrote:
> Implement the MVE narrowing move insns VMOVN, VQMOVN and VQMOVUN.
> These take a double-width input, narrow it (possibly saturating) and
> store the result to either the top or bottom half of the output
> element.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 20 ++++++++++
>   target/arm/mve.decode      | 12 ++++++
>   target/arm/mve_helper.c    | 78 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c | 22 +++++++++++
>   4 files changed, 132 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
