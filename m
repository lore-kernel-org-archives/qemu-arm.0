Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6561927lfg;
        Thu, 4 Mar 2021 12:35:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxO90042BdKUg2DLx32hQgAITM1DA4YD6w0t4yzyFi0K5Dk1IRdcVXTQ4f8SUvKJDRuwOA+
X-Received: by 2002:a4a:db78:: with SMTP id o24mr4800524ood.69.1614890154794;
        Thu, 04 Mar 2021 12:35:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614890154; cv=none;
        d=google.com; s=arc-20160816;
        b=sM+pxc4uA8wNJJW0yYKTzrhzeJEyCseG1LXm9OxePMkaAdOzXtQBslLjig4PMVj5qS
         ddlSsz3U4kikLgly5D7TzywNSqMzVtNQwgSIjec758UNIY5eK/A0zMhqGOZze7ZIOvAy
         ud4IcuNO54pYZN8NMq9g7S8x3xJ/j3nOvnUOFXXAbaRzDqEJj9RpqagQrWzwcfqM9DZ3
         nbYYGf+tYrDrFeyR/P+yxSZWnMkXkCHeR2elYvjiWKu6CsCdz57AlzkLQ29hQ4tCEzuF
         1Ae+yU3y10AmQr688rpN/67+Glk95J3lNNGAPWnGK5Z0uVMgCZqlN/ATbNNHXqyXoph8
         CUTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=tqiyCCSXJTi9XTmvXT5zK+KH4HC4pHq6jcN12S5RbLg=;
        b=c84yElFvVcFThLbWdGE8ppLPZ8SxOuQpfENgUJNg0ciWkucoAOztIOsR3M6XWEiaZy
         gsiojKN3VgVEPdVIFC/c/6wnswtcPYGihpbYTjHc7qDp19ybVc0uJ3KALwBT5qo8bdUd
         ri9T6HZlTSGzgJejgI/sou5rY0CjACc8wmJGFYsreJcsSqCizHbZqnR7Vx0pKduGhkGB
         BInp6okl7dKUTsPda/ezcgmRg0YZTJ5elYd2TOZG0y5R5yvP8K+V6gsCntN0wVyTQgYK
         i1QkEHbT3ELX5C0Q7oEsndYTe849j2ScDNOUDtXivgj3vlI0WvGy4sdT0Up/Yd5Z8n5v
         s26w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SnPDdOAF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w10si518085oic.82.2021.03.04.12.35.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 12:35:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SnPDdOAF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHuhO-0000bw-2B
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 15:35:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuXJ-0000sW-Un
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:25:29 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:45883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuXI-0000im-A4
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:25:29 -0500
Received: by mail-pl1-x62b.google.com with SMTP id u18so10626280plc.12
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 12:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=tqiyCCSXJTi9XTmvXT5zK+KH4HC4pHq6jcN12S5RbLg=;
 b=SnPDdOAFU3U4ozb0l0uA0bjyCKV8UKz9Tx8wbsWL+2eFSjI9WPd2UXzuskEJ2dEewO
 4VWKiPH7Z8A1E4jb3Du6AgTs4u8Mms+FnoIFoNnxK/rj4utZImmhA7V7Yjqhii9worT5
 FeBR2/EFcjICYBHD+XPtMvcRQ335vGeQdp2cNvXGHAsdAlbKDkMZIkHzvQUO21K/9tA3
 ijhA8vcaoCXHYOs+iBXE4ZT/Lzt0bmejrVsE8AIFeZCKMwsJYtRLLQjDZt3MQiX4B6fX
 50its6S4nw0K9fxwl0l1Q7+lLA+WrWPayCIPse9/t0kiW3ttsxDHjzM5uZoh7+KVhGDQ
 t4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tqiyCCSXJTi9XTmvXT5zK+KH4HC4pHq6jcN12S5RbLg=;
 b=Kt2muLj5J25iyBtPftQdhzkDbPBU9ByiOkl9cvK/dTg5sLG77GvKXAWnUdck9QCUYY
 WipTWFUc2mChMrJ/5YCyXNMC+v/bZQ6c2iRqM300UdYMUkhk161RN1dCjjALpysH/mTH
 mf9VSgTyw4XhqjMcL+PUy5NGu8QCtYyEiooZCD72h+x1QZKffHts+qv21trenGxDQ0/n
 lSceM82zFDII1g8p4WRq3YzE41TGdC13MuyiAzZd94iYtQwopTVdDZn5v4XjKCFpHZz2
 B4+xpbxm2rcESd4enrHAcE9goOTC0kxYIS5Nf8NET4JA+7fBHQQ3MaI+fCobHd5Oft9O
 cuSw==
X-Gm-Message-State: AOAM531t8F33zQs7jxL63xjpcdmcRR3A5LFYxsmxzGE67UqtJtqYX+8n
 6GrhPdiEvFbXoDq5UW1Wdsao+G9m2CyvGw==
X-Received: by 2002:a17:902:d114:b029:e4:87c7:39f5 with SMTP id
 w20-20020a170902d114b02900e487c739f5mr5550402plw.72.1614889527025; 
 Thu, 04 Mar 2021 12:25:27 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id mw13sm112877pjb.42.2021.03.04.12.25.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:25:26 -0800 (PST)
Subject: Re: [PATCH 30/44] hw/arm/armsse: Add missing SSE-200 SYS_PPU
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-31-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <70aca95a-b0fa-e071-6a6d-82805c9e8248@linaro.org>
Date: Thu, 4 Mar 2021 12:25:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-31-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mS+k/9KHYlHL

On 2/19/21 6:46 AM, Peter Maydell wrote:
> We forgot to implement a TYPE_UNIMPLEMENTED_DEVICE stub
> for the SYS_PPU in the SSE-200, which is at 0x50022000.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
