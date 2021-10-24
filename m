Received: by 2002:ac2:5bdb:0:0:0:0:0 with SMTP id u27csp520292lfn;
        Sun, 24 Oct 2021 14:26:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxf0IUszZ5TFCuVFs/8cnA3N6/TXULNI2w8Zhh0M96/ukJIhhIwnyTmp1Oeyvdzq8pfiQHY
X-Received: by 2002:a9d:ea9:: with SMTP id 38mr10886939otj.144.1635110773645;
        Sun, 24 Oct 2021 14:26:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635110773; cv=none;
        d=google.com; s=arc-20160816;
        b=hioAywFpb4YeatMGBw8j2npw/XLZdZj6neqi34wrgk4B8x+DQRLtT5XLy4ckiMkHCO
         Iu1GEgDEP9Fyv9CRzyb4Txs41RWmle2kn8saLcty/tYhCsGww9gyBl2xC1abOuSoQYSm
         nHi13PJSPWoC0e95EB7za0FuPKiV2ezOyAoJ5ofkNcYYvEY8UXEKfGVYaiazwO4QZrZY
         8KkN9ZOnnnUKhqqOa0MKee/h/9M21tFWtab7ReLoorsfexi3wpelACJNuMlOJps+ovxP
         F9RGhtaF67xyyHXLR2ShdiU+XCCax1Nz/UeYaEm82u6woi0aK/YcpEdHeZihnYnW2fTn
         fyHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=/HQEWIkO2t2OKXKffE+rBwst6Keq42Rj29tAkylSb9I=;
        b=PsrETa5y+CJ9TO3+q3YuqqrRrRAIysTwxl6l93NAAyLX8+//ffogfMxz1c65iUvEf1
         il28pIF2dxjD9uV+xha2rBrZwOUQWIOFjMJRFf8SCV9NrnNHnJOJ5t04WZIL3g4TfAUT
         VUZStAtUfGeCmakNj0AE/TlBblDSFESQLtz3sfsJoTN0Vna+mGwMMVxFinV8WZi6/XmA
         XrnzJccwvIYpD+6HuCOtUPTUctW3sN/O7/p2icdC129WkJAthxEcqjvghjqkq79owREh
         OYy1blAJJ2a4h9XJmuv3yR2GxcP3Bh3z2opE/d14Wcws0XxeSIEBYYXRGkudcRhZho0b
         NhqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="egi/jMCx";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l37si22085981otv.208.2021.10.24.14.26.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 Oct 2021 14:26:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="egi/jMCx";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mel0O-0002vk-TI
	for alex.bennee@linaro.org; Sun, 24 Oct 2021 17:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mel0E-0002tL-Sh
 for qemu-arm@nongnu.org; Sun, 24 Oct 2021 17:26:02 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:50942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mel07-0004Z1-Bg
 for qemu-arm@nongnu.org; Sun, 24 Oct 2021 17:26:02 -0400
Received: by mail-pj1-x102a.google.com with SMTP id gn3so6789484pjb.0
 for <qemu-arm@nongnu.org>; Sun, 24 Oct 2021 14:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/HQEWIkO2t2OKXKffE+rBwst6Keq42Rj29tAkylSb9I=;
 b=egi/jMCxJywR2IR4VHmMgW6HEPVFarv8YUjFYVld0Ym6nJ1BD0BpaWmXwOp+1KyS3r
 r1W6WZoy7gpal2WgFzqTDxLccFJAkuavph4uY3ccew80GY/0qYdzNh3GWlZrkyLDTvmw
 tPvwQmUR2C8wIfq0SnmqcFDghfKBb361S91y4cG9Z6UuFZCFhWQqBuKWAlnBaCqYUE1d
 6oaC6aUXg1m4leXxyujIlWjxJb19OUIcdm7R7bV8hdcIA1jVffLX9Is4GjiFUzVpF/8w
 AZPfzzVhn4z7bjFhCNWCpIQaWEtA3cK6Pu5sVXgKgDpqJtE/+42NkI6KsfM9Lx4O32cb
 nBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/HQEWIkO2t2OKXKffE+rBwst6Keq42Rj29tAkylSb9I=;
 b=Y9YWZpnEiWr/uPrLkatgR3KTIoY8zG/RvHR7KWudt5GnZJ0BpWX4oi9bo/QcF7pksq
 l7JwGP/Nh9ipX3xJ4ME8/nqqM2JqWByd/s7eEzaN6QYgNzPsPzx2T1q5cNJn1ZFvtX6O
 2IPmfVXwBLdgO0ur1ahsZxFq3//5/K5TYs2/O7r2m3nJkrvxfVxQjUAz6NSPZC/Wimzo
 MLQCqOC/03ns6Xa9PFoGfz2zUWGtliKDu4ZVHRll2j1CuLI8f/7P/Xo/lhU1/IXE6QJe
 GTw0pnJ0gbq/NgdI9yP2wjPJBhufQ5UZQH2bfIovVVfWIDgd88JkOhRA+r+Y+JL7NELN
 DbuA==
X-Gm-Message-State: AOAM531O6UzGEZjLxMsHjtNxhBLNwAFQvUJxN0ehmUeYG2AFno+Z3kf9
 9CbrdJuFvU/tF9Wso71NUu9fug==
X-Received: by 2002:a17:902:d34c:b0:140:54ff:a1f7 with SMTP id
 l12-20020a170902d34c00b0014054ffa1f7mr2179108plk.17.1635110753705; 
 Sun, 24 Oct 2021 14:25:53 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id j1sm3508162pgb.5.2021.10.24.14.25.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 14:25:53 -0700 (PDT)
Subject: Re: [PATCH 3/4] target/ppc: Use tcg_constant_tl() in gen_op_cmp()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211024161619.325903-1-f4bug@amsat.org>
 <20211024161619.325903-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fed49f95-8b3a-c275-9345-08e4f713c98c@linaro.org>
Date: Sun, 24 Oct 2021 14:25:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211024161619.325903-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-3.33, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N05VgV49pQmA

On 10/24/21 9:16 AM, Philippe Mathieu-Daudé wrote:
> Avoid using a TCG temporary by moving the compared values
> to the constant pool.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/ppc/translate.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
