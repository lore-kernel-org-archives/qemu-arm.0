Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4158806lfg;
        Mon, 28 Jun 2021 09:38:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTJ/Xl8fX+gCnYCQvT2kwaOBflUtWaSWS8GkfbLETpQBFNKKKKOVGZUUtEocK3hOBaJxjI
X-Received: by 2002:a25:ea53:: with SMTP id o19mr32810314ybe.2.1624898337282;
        Mon, 28 Jun 2021 09:38:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624898337; cv=none;
        d=google.com; s=arc-20160816;
        b=OWkOPlk9Z+TbLB6yWImuBFI7ihYzLM08x8gw5BZ/W6WF4GWoie0B1k2ktX/7FrIIYH
         b4UIp5tyyVKfs4s7OwQANCE++70GzE4pTpozSvo8LgaLTIo53kJpUR0NQlzQp4YzKOjZ
         Pb+fb6gtpYGKV1Nmg52EoyxvZeXzCMs0HnfM7asc5bmyGcijkmDba8qFXrCvHTcs0Aog
         2lIBepDzqDed3wCQF/YqRyTE6YoNhqQoJ6Wp/jSiaviSU890MfAFnfOvlWQiJv8xacsU
         R9wZdgWUZLNX4OUSjSyFuJZ1f/c4zoLYbrZUM9gWGEaVItTHVZbRlwRsssTe5WbUmDWE
         jFiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=KE5PJeeyuuG8tznZZ9h+amhiuozpu9/0956X0sEepQs=;
        b=W5yTb78yJyogyOlS3utL8V5lL92SN75GEAiHHAR0EyaDetOPjRZHzU4kRAJavKoR3N
         WfRQQN5UO8RkAStQdV0f4o03LBrkK9BIzWVtJl79nUcglKbGVOj1ZBjKr/Nu7PEFOtfT
         Jq0YonaqjCMCKYea4xFZvrfSmCYqlmv4j6F+jYj4QX903+f1P6iWd2YGqJUdX5FWuLP1
         YtTqccNA35TwEpC0baCLyOd7grvjH79GMf+ev1L4dOy6+EmNASCtTEDhL/a+EUqp8l4T
         4a0EaCkp6GYyCD8UZjbLsAP6/CBhD/avd70K2SDbWhW6sIwJui5UpM3jtNlI5eGS03ZT
         hY0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="oLqPTYl/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6si15818704ybr.367.2021.06.28.09.38.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 09:38:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="oLqPTYl/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxuHg-0001qf-M7
	for alex.bennee@linaro.org; Mon, 28 Jun 2021 12:38:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxuHY-0001pf-9R
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 12:38:48 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:56037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxuHV-0003eh-HK
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 12:38:48 -0400
Received: by mail-pj1-x1030.google.com with SMTP id l11so10497408pji.5
 for <qemu-arm@nongnu.org>; Mon, 28 Jun 2021 09:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=KE5PJeeyuuG8tznZZ9h+amhiuozpu9/0956X0sEepQs=;
 b=oLqPTYl/dPw0ILNlEXWSwOyenfOst0jQ1goOhosQ2FcI0Ouy1CS5lGKjqvUaZxPlfb
 Jj9XBfrEWZHpC9WoTBZq66sR+5OFjj6RlFfQclLKJgqjoETAgMnjrnCBUhGE0zWaq4BX
 /8vkp0UuCj0h/V5PkkVnUnZJ4YhMVFovOQFx6+F6dge5eNFYf/tQk7V6JII6NsN8jXmg
 BB7uSsg/9QUt3FKWQIgZfiip65Iz2UsArAvhVbim70mZu1vjuU+gRnqHIhWoPFNhJOtC
 c+0JgeZ1jBeydYb/s0hmF2bJpujDLmsXksLTw7am8HjvbL423JSE82+S6Y/uyLi/NNcX
 w2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KE5PJeeyuuG8tznZZ9h+amhiuozpu9/0956X0sEepQs=;
 b=pC1/IZgK+FJrPIGyd05RnMMHTs1OL7L5ziGeRHkZX39GE0+7vK23dk5W/T2teRDTRb
 Se+BLkZ+DJHu6qrLkW4rkVqMD/3HCq4DMlf8coQbYhwcioUl0XJJmhDUJKZZCxtZ468b
 wwMfKU9JzBtlD/P763gcjtkiwiEQv1l4AUROLMR7Rf6vQP6PdotkTqT1S8KX3g0Xu1sW
 INst23ZS58TTzskyI43OOfjl4HqzxZYMGRguzIY/4K49QrTg0fRGeO0Hl4rWkodj3S12
 70BaomSt1u/VHQcAblmmsatL44b+Qy7d8CM36uNt6COBRba/GVfsKv6D0EkpihsVnsWs
 BEOg==
X-Gm-Message-State: AOAM530taWBjR+UjU7F6S6aKCsVv/sVYpldHCi0dV/iTpoehAe0xkUIc
 1BB7sN/OpuxQtOeHJo1jRUibxw==
X-Received: by 2002:a17:90a:a395:: with SMTP id
 x21mr28703572pjp.63.1624898323166; 
 Mon, 28 Jun 2021 09:38:43 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z22sm15458228pfa.157.2021.06.28.09.38.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 09:38:42 -0700 (PDT)
Subject: Re: [PATCH 12/18] target/arm: Implement MVE saturating narrowing
 shifts
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bc18500b-1663-25fa-d5b2-49929b033819@linaro.org>
Date: Mon, 28 Jun 2021 09:38:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oOMUGmu4lXx2

On 6/28/21 6:58 AM, Peter Maydell wrote:
> Implement the MVE saturating shift-right-and-narrow insns
> VQSHRN, VQSHRUN, VQRSHRN and VQRSHRUN.
> 
> do_srshr() is borrowed from sve_helper.c.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  30 +++++++++++
>   target/arm/mve.decode      |  28 ++++++++++
>   target/arm/mve_helper.c    | 104 +++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c |  12 +++++
>   4 files changed, 174 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
