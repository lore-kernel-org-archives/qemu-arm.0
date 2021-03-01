Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3202609lfg;
        Sun, 28 Feb 2021 18:58:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwN9MTWmBzlE6xS1e/1DvTMAZjQtR0ll8NzEpYJsAf41ubemVrbPnhyciFQWBNl8varFT88
X-Received: by 2002:a05:6e02:1351:: with SMTP id k17mr11891836ilr.204.1614567522035;
        Sun, 28 Feb 2021 18:58:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614567522; cv=none;
        d=google.com; s=arc-20160816;
        b=qFne6VOdFIttDkhgzSbl0fJIRvcy6UD+u2MUg7Gq13d/TAHh25UTeEQynmnwxDVChj
         OThSPRiDJW1Q3FxHW29TuTW0Rs3lTxFM+wr2YqYhubYGGQbc9+5MQ+utQwg/FXa5M2xc
         cnCxxNDNt00OnnGwDyyeA1byU6QzeVhpi6G5OU0BsQvkTsVzdVB/OeV0GfS/2g88MOki
         aTROs5OzUKqbuU2wxwq0j7/2oqv4T+ku2XgZKA0buSXvvzI1p0nC2lkLTWfyE6M+vDgT
         oNO+002Cd1N/PllittXBVKfbGRLY8g8h9642cwiMAQWVO9K6CAJ1/8/HSiEI34zf5qcz
         jsEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=kigezuw/F7NkpHDCq9bpNuoxlo9Bbv+Ehe6b92SAjjw=;
        b=X4yTjvn9ZE/Vi7jh1d3HY27WHbyVcCfDG7+xqoII2k4cLR2jKUA0dDx6NYy0d6gIpa
         b2dcwiQfRMcSmyBoMQpnhLnLcMYMa5hxy6KnJKOCkBng4Tj2TZf5N52Ge8JxBL4dbHQ9
         EAZGmU99O5COeumhpH8nMa5OWarDQyCMe4U8zJChZAAlRGRSk1s8EHuWJGcWzbLjbe1X
         kuM1zLVYuxQo7+MvVhJjj0uqYAR4KYbsXWeI25t8c6XpQQTALAfeEac1LzFsCiIXfGw8
         DBbHlI7zTUFPbynijVwrMP6qf2ToC2lEa5tly4tws7aO6qlmW7QZOWnRzbsqAcJ/MLAQ
         LiSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pZ3xZry1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q206si13211453jaq.36.2021.02.28.18.58.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Feb 2021 18:58:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pZ3xZry1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGYld-0000JI-Ch
	for alex.bennee@linaro.org; Sun, 28 Feb 2021 21:58:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGYl3-0008Uu-Uo
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 21:58:05 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:46165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGYl2-0008WM-9r
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 21:58:05 -0500
Received: by mail-pl1-x62c.google.com with SMTP id u11so8963291plg.13
 for <qemu-arm@nongnu.org>; Sun, 28 Feb 2021 18:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kigezuw/F7NkpHDCq9bpNuoxlo9Bbv+Ehe6b92SAjjw=;
 b=pZ3xZry1O4F2UIhKp1R1a4F4yI/z5G5/jOLzIFbrm3hJ0L/h+4eexp2qZK+3vvtnfK
 gPtGksOdXmaZS3SZPLaE8W18K3eq8XNQk+kEwDBLW1tgap2UXGvaAbZY49qt2pgECnmD
 +9e0qoCMkBPZVSmWgqwQ5TtovJUUXA0a7yZGIZxl7K/ijpAVAH+dzEBTSB0S3Q0dpCB9
 LJgThXrqlgX4DDl//a9Z4VKtvE1O/G2iTmp0InC1+wvOa1F1zZtTlgzuK/40v4ngTXKd
 eK83OYwWv4wCh55Sizs5ZIXKBtzBdCiPxTM3PM9hM4jStvc4YL2dZO0K1+nrNKSEP0IG
 TeSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kigezuw/F7NkpHDCq9bpNuoxlo9Bbv+Ehe6b92SAjjw=;
 b=izTy49Q++neNlokDEBc/QowHF1Xyci3GhmXtSu0qi3/wvfpJt0yJ2N2hiPpeI7Ibx0
 gFpmvkPxDeqhIXYwdTHSglAGy2gz5y5rkWgam9zG/D4WfrozCYIoqemke3i5DcHY9bpg
 T7E/l1HFnDqBsIhRhXrcoAfREYF6S94DtJW3DnZZiLyVquJhrapDeoL27DX+eSZZRgUY
 ZH3jdv1m7/UMTy4hpi74BAmKlLiH0W9KqCaNc2NVeMPqKTlyEOC1uP5Kdft5j/P/IHbJ
 6aFOtJ148KTwzViJUrplKVOk96qFwkB7D1KNFrSbwdhyThTjji1mqRYTX5+lr1CT59qW
 kVOA==
X-Gm-Message-State: AOAM533jqz5Llxm0SK1d/VkGTwUOlnAcFfFHaSrnBHSnzTbx63CRy+cq
 2T2PZuC6xFMIG4fnxOlLcBUP6Q==
X-Received: by 2002:a17:902:bd97:b029:e4:b5f2:ef02 with SMTP id
 q23-20020a170902bd97b02900e4b5f2ef02mr1902753pls.68.1614567482983; 
 Sun, 28 Feb 2021 18:58:02 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id y12sm1329640pgs.71.2021.02.28.18.58.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 18:58:02 -0800 (PST)
Subject: Re: [PATCH v2 04/24] hw/arm/mps2-tz: Make the OSCCLK settings be
 configurable per-board
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6d88dfb4-5d94-eedd-cf13-16c3a2469046@linaro.org>
Date: Sun, 28 Feb 2021 18:58:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PjbEl9DkI1uf

On 2/15/21 3:51 AM, Peter Maydell wrote:
> +    uint32_t len_oscclk;
...
> +    int i;
...
> +    for (i = 0; i < mmc->len_oscclk; i++) {

Shouldn't mix types.  I'm surprised you didn't see a warning.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
