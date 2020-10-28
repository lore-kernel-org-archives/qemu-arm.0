Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp806056lfa;
        Wed, 28 Oct 2020 12:45:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfie1f48mdI4C7euoVenn1lTq81CsqkeJaxY9zBJeMTwzGoc7IJRPfNqwZNCzVtmMuzeDG
X-Received: by 2002:ae9:f448:: with SMTP id z8mr434865qkl.319.1603914353883;
        Wed, 28 Oct 2020 12:45:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603914353; cv=none;
        d=google.com; s=arc-20160816;
        b=jdlkTXcNphZTwmaWBGcGOcp5jEDv9LLXwEna3aVt4qah5U1SOBGiVAgnB4PzWYwdRQ
         MAJMhG+0o32lKu8ziGFWU1GmwhWGBWzc3MyBwxTJKmH6APiU3azNe5KZWf21GedpK9iQ
         Utga+zM74lPlY4QC9wgKRex4Z12LwPx0Y5I8dGf8Bw62cWpygj5oHvKTkm8uSJXzcqxY
         pQWLw5xd+vETZ0mIM82+4z9Rqku2zS3dhhyj4FliCyYeUaCfweEotu7q08qmRPkzqA5r
         L+vB8JGJHzj081mlqwGuTqLTjET2eHBzZqiKheGhz+ZYX1Ne8Fuaf/OumalNCvBMTUHx
         u8gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=1d0RVG3YXsnKZPA9wev/GPL4PK/tbtjR6IyxwDUDTUo=;
        b=LNp5vj9d5Bbe268AZ/F1FcNq4yWKQh2wnA2ST6CKypJk0ZB/tVITiXGc5yks+4xZ2X
         NXA3BnYp4kBg0pE2bzImDIqeCaS5rMrqXbuqG+H376PTIt8LTA6urgkeYZgpAlPcv111
         u1g9SksNBnvbk9u6YD1Y+uXE1RY+CkTSzu+l3YjewOE9j3KAl3esWs8kOHVlxRxENhct
         nHP/bRb0aSGLW7bod32E/9BapGofgQ+euD41S1N1zWfCZ/3guycrV8HOVXOMFuYeDOyW
         PYlwL56xwYPYC5JIEimM+p8+oTylmlAvw4p+8szCCbC+09ft/ahdKrXbqOLCnhhLiWyN
         6cRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vaL15Eo0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k17si298283qkk.41.2020.10.28.12.45.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 12:45:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vaL15Eo0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kXrOL-0000mh-99
	for alex.bennee@linaro.org; Wed, 28 Oct 2020 15:45:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kXrO9-0000mS-Q8; Wed, 28 Oct 2020 15:45:41 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:40358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kXrO7-0003Nq-Oy; Wed, 28 Oct 2020 15:45:41 -0400
Received: by mail-ej1-x642.google.com with SMTP id z5so588266ejw.7;
 Wed, 28 Oct 2020 12:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1d0RVG3YXsnKZPA9wev/GPL4PK/tbtjR6IyxwDUDTUo=;
 b=vaL15Eo0GdwhFau6oJALBie0lhwEagGlJrns1tpjTPT48kr0lr5YTrEzOCDZugK3Sj
 CQfPJRSAStOOmWzh4WW0zMZvEb30MRYGnqIMim2gGGMjFECsNnCVBRG66jbg2XkRWmMv
 Ng4UUZM64cC5p5sDt4lF20IKakkU3BHPELA7cOTP5Y0/Q7raix+2UdBcDr4gNv5cdswt
 dIloASbq1BIdwrycVkhEEPyo4BQZDkFNzv5tcUEyMsFL2J6dDuOfC5uvFtFO73jX2Cng
 zERhSGR4E3gyD/2reiDgG53gZ+NXcPJ3AIM/5SAM/dWjZDoUhYgy1woUVm7j5FGntGdt
 cgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1d0RVG3YXsnKZPA9wev/GPL4PK/tbtjR6IyxwDUDTUo=;
 b=dN9adRoQL3PAPoZVFuM1BzGtZUxBJnzC6uxcw3MfhlfeNxtorrhG5p/ZTOk/MhVMag
 xWr9lYLACzGiHqRuHH29bt8aL6TRCVBZ0MbmYWN6SchFjmdg5kfx6NswRpkIlnfrZBuS
 7ch4xxFN3nNOZd6civ5x0MiMVVuZ3rqEDj/owc1j6pPqCP6VS14sP0L4M0uMe47BoBp8
 ZxJe9MJ+5V3juVPvYm7LY/zoOy30d6CzCaxISqhJLWluwOCKFLMTIIX50AnR13PYL2b0
 eETiygWQi0uV+yN/+b6oNPFQ6mfYt3l53BiNHNYLafB/7SgdhrCzd/tOy/aWfmJyf2Sg
 HJpw==
X-Gm-Message-State: AOAM532VMg0VABgwtb90zvSTO4+Xj5qM9jCOYub8wa4EST9xaXpal5LO
 Rntbbvll9bhrMSJ4cCcZnQk=
X-Received: by 2002:a17:906:abcf:: with SMTP id
 kq15mr701217ejb.208.1603914336874; 
 Wed, 28 Oct 2020 12:45:36 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id q9sm275623ejd.66.2020.10.28.12.45.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2020 12:45:36 -0700 (PDT)
Subject: Re: [PATCH 1/2] target/arm: Fix float16 pairwise Neon ops on
 big-endian hosts
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201028191712.4910-1-peter.maydell@linaro.org>
 <20201028191712.4910-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9d6d53ba-8513-4d40-ae44-43a4a2f33332@amsat.org>
Date: Wed, 28 Oct 2020 20:45:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201028191712.4910-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.921,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QMl2vTAIBjih

On 10/28/20 8:17 PM, Peter Maydell wrote:
> In the neon_padd/pmax/pmin helpers for float16, a cut-and-paste error
> meant we were using the H4() address swizzler macro rather than the
> H2() which is required for 2-byte data.  This had no effect on
> little-endian hosts but meant we put the result data into the
> destination Dreg in the wrong order on big-endian hosts.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/vec_helper.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
