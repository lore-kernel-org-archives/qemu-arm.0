Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp1364848ejb;
        Sun, 23 Jul 2023 08:50:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGlCuYxwCga+6L0pDEHrTCnANHVucsskWyDFArtoTJdlDrxey6x2kF/sF4lo+FAIywHw8BG
X-Received: by 2002:a37:ad17:0:b0:767:35bc:540a with SMTP id f23-20020a37ad17000000b0076735bc540amr5224613qkm.17.1690127458792;
        Sun, 23 Jul 2023 08:50:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690127458; cv=none;
        d=google.com; s=arc-20160816;
        b=RdOAMZN6+gjiVM3HoEHzvIE435Mgng2tTRlQwfig17y7Vhe/OPrfZBj0jREUguAeL5
         5+gSdiHYcHJagfJoMMrpZg2zLvez5S2BiwO29NKau7JGLJjitcaLIvjXaPBYk8mw1927
         uVyikA+ctq0kLEFyr7qHe+S0Cle3JhZqeRip/nVZMfQM+PnUkbSyb824BUYQFEjJHfbN
         6Fsfp/tZsvXOAr1oN2KOC1bG3frMufVpN5WRT0ToGr9/K3mzbvQSMGWS4IUeD345z9Un
         /DD4qI1pXjPVF3OO7+4uiKqgTbRALaFziewjL+rAWD3PyNnYkwLbiDg37Vn3fDR8P77e
         2rCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=k252XPH4PZA8/tNLIs5R1Pmualb7PIAO7yTHlkQMoS8=;
        fh=7ELSr/5sFo7qZWUWozFMp+B9CMHRnMDW7I5B4MPhJxE=;
        b=vxjyB5777hJwn61dcqlOqdM9hjzofP2wlwMD/pvllt89GhCENdB8K25BW42Oa3FdgX
         J7rqCiz88DO2t5HKib8NMhWEMdil24+WyLW3uiU9p0rnRkeNH44ukZKMr78pK9eIDAOi
         xxIlDR+l/A9lluNqvr9lhXtUxgwry+IXaHZ8EnXo02tx8mCIs+hdOXiEE4qrHCE4Yto/
         Ueq9/XsSWLaLppIGSH07ncb0VW4i26wKwl4vEYEDdX3FZoBEsRvapHu1nI/WW0ZtysNS
         9Um6y3p4BTYqN/YsU8w43ClPMfoOQVFdxpybei1yY9JYIQzYAwvrRCxScDZnY/cC/ZBS
         ABXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C9llMhHI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qt3-20020a05620a8a0300b0076811c991e6si2176654qkn.334.2023.07.23.08.50.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Jul 2023 08:50:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C9llMhHI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qNbMF-0001EY-L0; Sun, 23 Jul 2023 11:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qNbME-0001E3-7r
 for qemu-arm@nongnu.org; Sun, 23 Jul 2023 11:50:54 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qNbMC-000813-SK
 for qemu-arm@nongnu.org; Sun, 23 Jul 2023 11:50:54 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3143b72c5ffso3098577f8f.3
 for <qemu-arm@nongnu.org>; Sun, 23 Jul 2023 08:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690127451; x=1690732251;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k252XPH4PZA8/tNLIs5R1Pmualb7PIAO7yTHlkQMoS8=;
 b=C9llMhHI1f/Ag4mVnZt0uoYyc7yP58+rt5AZY1ulATaULIfM1v//kZ6ue9//cV3udw
 xxZYARpVYXzTJD/YKJBdNW1bDGLm3uwzrrLRqH9kah7eY95pWBqiT11l57/1D11BKTxs
 RofGsDM0yuU58LFLiwqdWa8FF51wqzMkCvaF5MSoS3aEnd8tkEUD+ZVyP/lKFgGtaDma
 dbVO6dyJoLIG9XpiOu2idkujIN0febhF9TbEIf92o/T3XHGNRJePERUrxFeQBP3w9ZQz
 U4g03nc1OHKvSArFAZT0kPjGbSkNApqNv9YNqTo05BU+lNozwvv1gOb70s6DgKCKnSgh
 cMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690127451; x=1690732251;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k252XPH4PZA8/tNLIs5R1Pmualb7PIAO7yTHlkQMoS8=;
 b=ghI8NiEJkO3IeEe/6uuHoZTOJTMz4AAAdla3AIzCg7TnqbF/DA1KufOC8gd4NwG/rJ
 jV/jssNVTzQBL9JoF7nwNbkeDUPGzhD7EP6YqT4ViqDVKEreJ7clN6TgUEWpijgnvQDd
 3f2/gr+owH8XuZ+Z5CwMw5IOHbK9y5xeWIXK+kGGgwvH2EEfm6PuWtH+vmUP8UflG3Im
 uWugby+bQWTSqvNB4c2dBdB/gHORzYT4Rr3tAERqBpyjoVDkcVx8e7n3lrxHUEo5r7cJ
 3KgujGJVC+frrTloTjV3eCuBXdeSmX1qz+Km203C2TfBCBsAAX7xVPfA77liaut3qQJz
 l4dQ==
X-Gm-Message-State: ABy/qLaxPUZ+t9CAnKxHjHM9eYvHar6ginkykQm7XJSNaL9VtwDTgwUJ
 evhZtMP7SYDbHX/nVVdYK6GvTs/vOF04KnY7WVLTnw==
X-Received: by 2002:a5d:5112:0:b0:313:e8bf:a6f with SMTP id
 s18-20020a5d5112000000b00313e8bf0a6fmr6016725wrt.23.1690127451261; 
 Sun, 23 Jul 2023 08:50:51 -0700 (PDT)
Received: from [172.20.15.116]
 (179.181-106-213.static.virginmediabusiness.co.uk. [213.106.181.179])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a5d5712000000b0030c4d8930b1sm9957280wrv.91.2023.07.23.08.50.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jul 2023 08:50:51 -0700 (PDT)
Message-ID: <9e869fd2-94c6-54f4-f4b7-2bc700a49daf@linaro.org>
Date: Sun, 23 Jul 2023 16:50:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 11/14] target/arm/ptw: Set attributes correctly for MMU
 disabled data accesses
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230714154648.327466-1-peter.maydell@linaro.org>
 <20230714154648.327466-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230714154648.327466-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: zjSXjxVwFeQh

On 7/14/23 16:46, Peter Maydell wrote:
> When the MMU is disabled, data accesses should be Device nGnRnE,
> Outer Shareable, Untagged.  We handle the other cases from
> AArch64.S1DisabledOutput() correctly but missed this one.
> Device nGnRnE is memattr == 0, so the only part we were missing
> was that shareability should be set to 2 for both insn fetches
> and data accesses.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/ptw.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
