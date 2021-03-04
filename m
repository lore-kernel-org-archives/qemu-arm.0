Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5854464lfg;
        Wed, 3 Mar 2021 18:01:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy47AtON+JJ1RqYMP9GN15NRWPykj6c4mZmjzPKOet7teMKAt2nIqFLX66rHGDWujny/GRr
X-Received: by 2002:aca:f5d4:: with SMTP id t203mr1415939oih.132.1614823313478;
        Wed, 03 Mar 2021 18:01:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614823313; cv=none;
        d=google.com; s=arc-20160816;
        b=eBfXRrRV1U02OZZh/Dvd5mK41b7Dyns4kiYC7TBHnkF40RjY5HCMC2CVD1hxbgJZbQ
         jRYhG4wbf9oCqKmy74Rrt9zan+kmoT2WOurnOVvJCnLaAQPL055A2LL9tj8HcMyXuxl1
         iu3lMn3+dPXm1RTOUBFK0lXLAz5ZEsxpkEaEUfbRVe4Nc+PcKwvuAyMDrkCOT6Jo5xgA
         I6vjkHEb1f4FDcQJrCpKP/0aUThY5jJBcsH4nsdbl4VkehxGI74D/bB3upRHjo6fP5IM
         rKUPAWZ6/6Qru/lS/3PhA8eAyAOqDr0LajHcHXp/+Z3sNvYbkXraeOdDgUo6SnPD2sw6
         HbMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=YO0QtM/0DfLNQFg+ef16B4+fbBIxtq201AO9nj2bxd4=;
        b=SobyfXFtq029F8pd2XOIKBOL1rHZreS47JcHMzXgoD0pOT/Geg/w4Z29tEnrmiPpNN
         r7oJ9DpWoghTfSALaeiqAUqFUKb0KhyLJSQ2sMmBglq0/x/0Wdv88ksDzRQPcVdKacGv
         y3MHshZYP0v/LyYpDt2ImqHQLB2xMbi1fgzkbL3p5QS5niSIYMegAsf6j0sow8FUHkQp
         FPg7xuOq14qeBh9dPeMj9XPo2/Os6Zr9WDIrvXkS/W6TAZUMwJfveleorB/FbynYWal6
         MEqlXgkSkRU5KtpRTegr+GqA1NGI7+03OJZe2RIl4tKhj4hn1909WOBpvrGNpZyjL6Lm
         iTQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=at1SDy5o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r17si18958068otq.261.2021.03.03.18.01.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 18:01:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=at1SDy5o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHdJI-0001TK-O7
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 21:01:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHdIr-0001Sr-AZ
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 21:01:25 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:43365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHdIo-0002TY-NR
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 21:01:25 -0500
Received: by mail-pf1-x435.google.com with SMTP id q204so16673121pfq.10
 for <qemu-arm@nongnu.org>; Wed, 03 Mar 2021 18:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YO0QtM/0DfLNQFg+ef16B4+fbBIxtq201AO9nj2bxd4=;
 b=at1SDy5of4SfGtowEbzAnZSx9K5WOI7yC4ZJK2FPQXIpS4cZ9hPoqdn97v8/taP5AL
 QrkReRIz/pdeLpHa5EsJPXFKD2NAwvh5Myd14cqMd5UAAufi/c334ZKLgJ+QB7wWNiIu
 Vw5H8dwJp023goGZjZpRoottbtyf5T74FGVOfpRagm0dCtm0JeVvJ1VquojxlGbX2+G0
 VhNj3Fv4StHci7qR+z/pfbFUtXIkd9W6/iicgXdg/+KISB+RBL0nrG5e/G/JldHKuXr+
 w6pM1/Wo1djyQB0iRKKOp4FdP7n0drIaHQ7lCIE6YuzSrqx5KF/5cGWrDbNEvlRMsdeo
 BRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YO0QtM/0DfLNQFg+ef16B4+fbBIxtq201AO9nj2bxd4=;
 b=KB0YNyxmdyk43mJ/qNahXC6XmBT0W+Ydm8sD69a3IrI7xU4enFLr2cUwYr1mPMyInx
 /ex0+Dzd4ubGSWHUESA8Rqr8DaBodWCrRgDpr7R8lYiBP7c1OhjXthlyEBEpqCb3Nt3W
 scGLO15NRyttjd7gK1bCoNehy6tEc4l39Neo/9pS55TrMSMVyyr3vk672utQWaA1DdI+
 SAFMA4XqApyBnXhUuRxUa2tGM3+nHTIcWIq+Xl0hOdwNeL6P9ImHKsRFO4P6H3W1bcGs
 cso7hfZsyTHFK90VkjNldklvooxLVPRQZ+uDREaZ9yLrqa7KIGfO64eP0uE6hTCIk3vD
 Z+oA==
X-Gm-Message-State: AOAM531A7i+2P7ynUe6tCg2+Gkjdy/SupuYmd3DbR5Z3bZ3dFZ2lwCCv
 2UkdGfvi4sXEb0C+cVUM/zh1GQ==
X-Received: by 2002:a62:5344:0:b029:1df:c7d:3c3e with SMTP id
 h65-20020a6253440000b02901df0c7d3c3emr1637408pfb.11.1614823281175; 
 Wed, 03 Mar 2021 18:01:21 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id y63sm18409404pfy.68.2021.03.03.18.01.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 18:01:20 -0800 (PST)
Subject: Re: [PATCH v2 08/24] hw/arm/mps2-tz: Condition IRQ splitting on
 number of CPUs, not board type
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <343647f5-8b2e-6e98-944c-d6cb47f668ac@linaro.org>
Date: Wed, 3 Mar 2021 18:01:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: ydcGvNo0A+xu

On 2/15/21 3:51 AM, Peter Maydell wrote:
> In the mps2-tz board code, we handle devices whose interrupt lines
> must be wired to all CPUs by creating IRQ splitter devices for the
> AN521, because it has 2 CPUs, but wiring the device IRQ directly to
> the SSE/IoTKit input for the AN505, which has only 1 CPU.
> 
> We can avoid making an explicit check on the board type constant by
> instead creating and using the IRQ splitters for any board with more
> than 1 CPU.  This avoids having to add extra cases to the
> conditionals every time we add new boards.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

