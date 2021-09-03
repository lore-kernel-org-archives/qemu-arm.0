Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1319137lfb;
        Fri, 3 Sep 2021 06:59:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzz7pm0FOYYVHOk17f+21240RBTWmbTQsY4fa7DVJHjiggo/7toezKCo3U7JYsip0LZRly/
X-Received: by 2002:a92:690d:: with SMTP id e13mr2681980ilc.284.1630677567592;
        Fri, 03 Sep 2021 06:59:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630677567; cv=none;
        d=google.com; s=arc-20160816;
        b=UtfX732jAmi52bg2h7UyjU9T14tEja0ivrB70HGKSKJu40r1WGn0DE/Hq+tlKx8x8l
         U8SPKUHxf0lfejEq7V+1KzZTwaohSUHznRU8ICxZs4kesSYP4HllO3EjYvpQwTDmC9/T
         PrmEX//c0vOkMinwNy2+QsUvlezlp4kGpyiUJCrH5NKDRFqh+7h5w/cJZWhzplGZB889
         TTvT8EWBQATySAMRtgtjB6DbfBxNZm5mtTxrZVZbR5rr2ftuTolM+ADfcbp/e0xFlLmK
         g4DavulSmoKKFRmwimlLjRrcjhO8kGTZK+sOkRhhY/Sgx18q6lzyQvOrFW+aT3eJsdTM
         fKqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=2KilYY3J3jAgU+PmqXopJjh9EbNqIk+XQGS5d5EmP48=;
        b=UamrH4HqH6VjG9eGnBH3D5upSsJ6FbvEx2CLQVwf7CeDT9XaLwIPAHdABgS9ddtTME
         nV3Lld+Gq+pBS1b8HNACjYwfluPbx5qlvT9u+VDQ1h11Nkbi2IZAcY9PlsJlCwvqLWI3
         mT+N+iASOSQPyBBQNwe2LzbtLSOXeKr5JwAbnLIYDkNBM6NRBsjfjK1XCFs1xx5dfGDd
         f5jqlMxwWQi8ilHrjm47yWWdauBUqpxmVMX6evOFWxIhbhuSYjVcL+ahyhk7RYxYB+b8
         h5+jSkGw1yhD7OEBE8+Pc+Q0EE113La+dTWIPd1lDShy/8pSNsBaqDScsKL8c349/nIl
         fguw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Kw6tA/mY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m21si6527165jaj.19.2021.09.03.06.59.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 06:59:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Kw6tA/mY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mM9j4-0002Fi-Ui
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 09:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mM9ik-0002CK-C4
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 09:59:06 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:41870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mM9ii-0006E9-Gx
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 09:59:06 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 u15-20020a05600c19cf00b002f6445b8f55so3677559wmq.0
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 06:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=2KilYY3J3jAgU+PmqXopJjh9EbNqIk+XQGS5d5EmP48=;
 b=Kw6tA/mY4JsJ5Oq9KdZj02XS6FLBhl3rJY8ToyCwDFIMvFmrKMZ0tNdFgQsp4diRLi
 VKww8r9dobdkOYAj+Vua2Vvuhj8OhRStTWcAARD/gtnNSNLqI1DGIGBC8fOMFLG6Oq+p
 avFV0f01f8xgpW/yYx5hj/pW+7HJrGJcGO/ZcRqeOn/6S0GwnWeX59EZYXgUVX6Sb9I9
 SdHWJJFInKWYGBYxJv7an0smFNNfsZn9nNIrWG8GA18Ov4Jh3NRTikd486RkwnlaLjB2
 UiSI1GjBdodJ9ahfZnWP4A85a52FuBnShak5fD5qkoGzRjpc07geSTabzzYOsYouojkt
 Ehyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2KilYY3J3jAgU+PmqXopJjh9EbNqIk+XQGS5d5EmP48=;
 b=f6q4e4sqWROM31O1bAa2mCaUQJvcUgxPbr1aShrTCv3zCo7wbbvOn9tzV/xCSGkIDz
 EiurcGPik1RtZ54lm3SugrL8AePY12HS9gDTIBhj7rWuhpOSv71MsmkZUgeltWjgMsWt
 OxZGr5WeYG6POvVaGpxc3S0svHyl0+9hV0Nwe4smKqC/RuultANhUfkPoKy0+6n/Rj+R
 IhxQ1LjaRPgO8ghN46BaNLfTvF8KBKMggJp7yR3MSZwqUvCIrH1gyJggZSkMCoOCk5Ts
 QMyrUDmb7ATPzL6CXBWvnmuySQmIJI8/ogM+Moqnzd1+PHTNG+ZZ5E7y+zTpcf0YQkzS
 /qNg==
X-Gm-Message-State: AOAM533sGzjErm+201AuPJ669Pry2artW3GWY6tfEemUldp4sffJPCWe
 8277wyfJjwS4tTqtEEURHQ0C/w==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr546033wmc.150.1630677543045; 
 Fri, 03 Sep 2021 06:59:03 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id v5sm4651064wrw.44.2021.09.03.06.59.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 06:59:02 -0700 (PDT)
Subject: Re: [PATCH 2/4] target/arm: Optimize MVE logic ops
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5dfd50a0-6df7-6f0f-292f-de18395d7cc1@linaro.org>
Date: Fri, 3 Sep 2021 15:58:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902150910.15748-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
X-TUID: C0ZjBfHdOtAf

On 9/2/21 5:09 PM, Peter Maydell wrote:
> When not predicating, implement the MVE bitwise logical insns
> directly using TCG vector operations.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-mve.c | 41 ++++++++++++++++++++++++--------------
>   1 file changed, 26 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
