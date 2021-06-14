Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2332635lff;
        Mon, 14 Jun 2021 14:28:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1MN/JFpnBS+kxHv+v3ETeLnPPcHYsplctZlmI5AzkcTW1iCnR0xPXBxOawfAtDJL1f1u7
X-Received: by 2002:ac5:c9b5:: with SMTP id f21mr1224889vkm.23.1623706088848;
        Mon, 14 Jun 2021 14:28:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623706088; cv=none;
        d=google.com; s=arc-20160816;
        b=ykUPdoyrmmbUwMRxQfNF5CFDhPd65aU/T9RnVEBrUSphQDF+IbGUa3Lh5MFcfxbog8
         6VkYxdziixOHUBOPaxFJ0azXM7XRMlzGbzH1XsznW+1XrGgmeIW8S1bvnR3e2Uil80GN
         ICAt1fSzj7OF17ntlOy/D1hriICxLgWhVn5BLyeHNeLIcsF14aveYWlfX/y5snm7BdXW
         AM3uFy9OBlYVH89dkwU5y34UXxV7YK2zjGw55auw0/4pXrz9iQLItE4oOfzrse0UDjtz
         nNpDS3YSQSWbVCNRBtmDPnQ5N2GmLrl19U34QMWa7RbAPtJFH6UYx8tAFsLd4yh/FhxP
         lCNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ItioTNZWw4TuKZ+hUu8tcKTes/xkFWKgxxVBN7Wn868=;
        b=DnyDv5ShnU5CV3TT3bkv/unHkNtg64LhUP08iiksFDEgOHieHHb6F9x1sJwqPhbKeN
         MppKroOZqf4aDdbQkZo4gH0N1vNbqKZVsCfLxOcWhYoSafdHZvEJv0pgLhTvTSLVGGZU
         y4TJTC0bu/l0ApfTWxLrQz+SStEaNzdVLt0MQEDh9rXh5338mnplUb7YuE6fZLPdvEpK
         tFspM3+3CpMlchP1fQkL9BvrS/sUqjvSTx1DgY8NRD5ti6Itmj3C7i/6P4p8gBwDA+Qo
         4zy0v2g0SGrFscTj+012sCmxgAVnNhp3zxje91n7yJIKNvgQnyOgORTVl3iqZCF4oiZG
         K/FA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iUbmkBvy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k15si615257vsh.373.2021.06.14.14.28.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 14:28:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iUbmkBvy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsu7s-0001P1-5M
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 17:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsu7h-0001OM-RR
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 17:27:57 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:34752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsu7f-0002R6-88
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 17:27:57 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso617987pjx.1
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 14:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ItioTNZWw4TuKZ+hUu8tcKTes/xkFWKgxxVBN7Wn868=;
 b=iUbmkBvyN985s6dPb4NyeZKJMZKo8VZB6J5b31+IR8UvTND9X2Necy17TeUZZjq7jE
 MpfgUxwTUGbjDeku97osxlKtWc/qvrSRUEc3U/97quJT+49GBN9qS5QFjvFYN9CQ4wqv
 kQuqyg5vD0+BXKy9ARScN+KBLx/XTfChHcUAQY9ypU1kcCHwt8Q7L54/Rcy6kj6RvI0O
 oIFsunXEsMNfOBm30hq6n74kNLj7yHO4V0mkMN2feR4kkse1EwVePfVcGpCHgVl2zZpL
 Y4w5t0QIpVr+MA+J1MyMCFNlw1YKrH2Putglk2V7vm7TA/xF3gOwMqHLV0OomhGzD7Ht
 qnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ItioTNZWw4TuKZ+hUu8tcKTes/xkFWKgxxVBN7Wn868=;
 b=GdKijh7bjvn7JflTvUOf/iUVK7eBa2+Wdordtwx8rScYFA8Hhghaqa1JU518JiAMwg
 aZhjRHt3C0MWUsSyTVU7/iZIt8KD2EY3Ktk5AEJMahXQaGWaSPT2Ay9pflxIdOQs/GOE
 jSf3hitqWB2yGG/V9N+Dv1ABxG9Ldjp8ajZQ4RbspKSgZcJAbzbAwRfnmZxdI0PSRKK4
 mm8LbVDoqr+BW6ZoinC3jjnIIg9DGMTPoXeFoxBU7aYMbguJLqrMGx9tLBA6bRnx+TyH
 JwPKrs1+VwYvUJNlI4NeKtIVwfuQorMSIQ1ABkf5eEp33DbBkddtLWa6W/qRM96u4bII
 GkCA==
X-Gm-Message-State: AOAM532nWepogSOMt+sYQvQxYb2yyvHgtsH/Ubd8W61Crx6mLdea+B6O
 mWbRmKDEO0eIRqCu+n8UySIfEw==
X-Received: by 2002:a17:90a:a395:: with SMTP id
 x21mr21008375pjp.63.1623706073485; 
 Mon, 14 Jun 2021 14:27:53 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 w206sm13232799pff.1.2021.06.14.14.27.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 14:27:53 -0700 (PDT)
Subject: Re: [PATCH v2 34/57] target/arm: Implement MVE VRMLALDAVH, VRMLSLDAVH
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210614151007.4545-1-peter.maydell@linaro.org>
 <20210614151007.4545-35-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <05de7822-ba91-d77e-5686-e247c7452a47@linaro.org>
Date: Mon, 14 Jun 2021 14:27:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614151007.4545-35-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
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
X-TUID: wlhUMOYHPejs

On 6/14/21 8:09 AM, Peter Maydell wrote:
> Implement the MVE VRMLALDAVH and VRMLSLDAVH insns, which accumulate
> the results of a rounded multiply of pairs of elements into a 72-bit
> accumulator, returning the top 64 bits in a pair of general purpose
> registers.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  8 ++++++++
>   target/arm/mve.decode      |  7 +++++++
>   target/arm/mve_helper.c    | 37 +++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c | 24 ++++++++++++++++++++++++
>   4 files changed, 76 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
