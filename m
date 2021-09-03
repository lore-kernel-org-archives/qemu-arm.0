Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1322436lfb;
        Fri, 3 Sep 2021 07:02:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrUKH8XuOd2vt33zMGudMyIyqZ9cgA0FexNs+RwP2goZwhSHJ2MOCNvAxd+y1ME4Gt2E2O
X-Received: by 2002:a05:600c:3542:: with SMTP id i2mr548863wmq.170.1630677748125;
        Fri, 03 Sep 2021 07:02:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630677748; cv=none;
        d=google.com; s=arc-20160816;
        b=tMfEBUeK576xJS5WQYb+uMACEFSpOSyqyYTf6II8/3HhRRmtFCO7DHs9XnbwjdV9GL
         XQqjgNdlBnZrzzpW7GiWtzN1mg3ALLvT+EgivWJYgIwjevDFyiNVkZVrD7Cedfi/7bCJ
         ivLDF7XflJfQiyWVL4y607Lla9rWoRXNaSDikGbhwg50BZiUvH/JASfSVthPboPh55Sz
         Yaac8GHC7kxyFfzlXu/RZbNjMOUjGmZFlvOU/Xx8HAYeWZRs/YCx9b7oRRt9kKMAY80I
         h/B5rg3B5w4W9ZtI+SFlNS2F7vxwmvtHcl1rXUiU/wb3izffY6/+BP5N2dD3IqGxuE6z
         Jv3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=0YHsIeQBNfTspHsS60tynElfn/DxUFuqDQKkZn1YRZk=;
        b=T3l8rjjU10vD5ZOuiEzV4jBLqqOKV3wrJDObKcfG/77my2FPBFppotWEdY5brJCuEx
         ylOaXb+g3F/oZrgmRibil6IUP9MS7wmG7avfWS0UOFFdhadX+94rIKaNAHjNlVhFKlzo
         JKMRUELb5eonOophxBMpxUNQeRpza6Lfe/ZoeHTt6+2SL0eFxvo2t6GwjMhuEq2n5z5B
         ohMDS6+tLJs6ZEGnkmLy0aD+1DUhjy8Oy/LqxxctD84GicU1SdZmqw7DkCAWv/Mjugh5
         GZZh9MLiRhD95ydHC8JbWjI4Jy+8W5sem3ns4B0JPTlWtC6iiDB6ICu4jiFueNNcXFVx
         pHGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="z00klYt/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 11si5173300wmg.110.2021.09.03.07.02.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 07:02:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="z00klYt/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mM9ly-0005lW-TB
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 10:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mM9kG-0004DL-TC
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 10:00:44 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mM9kE-0007Id-DL
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 10:00:40 -0400
Received: by mail-wr1-x430.google.com with SMTP id t15so8398059wrg.7
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 07:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=0YHsIeQBNfTspHsS60tynElfn/DxUFuqDQKkZn1YRZk=;
 b=z00klYt/3eVSSMe9vwYnewKuuf0QGtV0PQHn5C0R6P9xEZIX5HQAGQHpYGhGrwJWai
 tFGLxfjuiqRAtsTQJ+gbAEfbv8ConWndlCgGhIxAa+2Wgg0/LQsmXweT2bgtLejKEP7O
 qJlbymmsKTCkAaL0CZ4WtxoH/ax4d6wIL7HVMWDEHmU1G++Z0+vgO6o4HzIxnCb0N61w
 ufozKe+B53Neef1QuGQMHf+I3bqwsei2LXvbyH9oFrJbohh5DMDDdi3Vr+1+Iq9LV6U0
 1B6AJgoCrx0VRqkD5QNj1xLiNQ4rdzQGZb58na1GJINNzAZOppY9rIkOvqdqSXXLSLCs
 eepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0YHsIeQBNfTspHsS60tynElfn/DxUFuqDQKkZn1YRZk=;
 b=tMMKsINbLTZdFyc2cI3zGZbksXxkaloV3Y+qm4uPbyjTtDKAKwPZMkt2CAToLuWDcM
 mq1INewZ2aLocON4/aEA1fIJdBVgDtj1CSHCM9uVfIvDWhgssmNlpdM+RBHprkmZEfSe
 Bom1VbQxBwM0iYR3eEnaYl5WDxcEWleNdeCpmzZLwoG3SgEreoAs7cuSAPYlU8t3m575
 e9v53KjADFDhxYVS+SKjAjKLO2kE3xGePydyKv78jcMdaTI+4W46JnmLvrQXXDSMeW7t
 cVAbKM4usv4Tf6/nkXwISRd03oX2+r7HamS+oHU/i2CFVh7P5T5ifqg5en7Dmt5yqUOk
 HKBQ==
X-Gm-Message-State: AOAM530wurxAAD1lmWSqvE3abb7WMpFLF60qybBXb3ssUYmMIyk/+oh+
 8YxdYqqoJDRnnBpDVeM3hB0HYQ==
X-Received: by 2002:adf:c109:: with SMTP id r9mr4303008wre.184.1630677636757; 
 Fri, 03 Sep 2021 07:00:36 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id g11sm4789497wrx.30.2021.09.03.07.00.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 07:00:36 -0700 (PDT)
Subject: Re: [PATCH 4/4] target/arm: Optimize MVE VNEG, VABS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c2fa411b-5fec-3cf4-16b5-94c9b3b082e1@linaro.org>
Date: Fri, 3 Sep 2021 16:00:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902150910.15748-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
X-TUID: K/2UnmisidRe

On 9/2/21 5:09 PM, Peter Maydell wrote:
> Optimize the MVE VNEG and VABS insns by using TCG
> vector ops when possible.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-mve.c | 32 ++++++++++++++++++++++----------
>   1 file changed, 22 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
