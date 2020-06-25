Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1466562lfm;
        Thu, 25 Jun 2020 09:34:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4vxNKEuDILK4nEsJJ7iERKD+/Q/v6nF4tybkG+K6ZYX+mx2PrKMRvRoeVRJNxCeqg+8tC
X-Received: by 2002:a25:cf82:: with SMTP id f124mr54218110ybg.441.1593102881302;
        Thu, 25 Jun 2020 09:34:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593102881; cv=none;
        d=google.com; s=arc-20160816;
        b=y6gA8nl0oBbYV30B3PNejPiBM14UxeaCay1WCtla5CBf9tbvBgt4IsmFxrLPezw6CC
         64RD2cbABtOnFWvkDhGhOpl8Gz5NR+5JW4tYcjuFWdA9n9ecCWfVI6MmsOPKz06AFl1F
         1pZz/5M4uNSYwN8V9fKp+bo9H8uS1Tl/dr5dLt92kVQbQq0yo2u4SVjoSvrGWIDcNWU4
         hqhKvNSdj/8bTE0aA5GtCdhVdsj+GkU6GCVJJKlOD0WsOTmSfIL11UV+d+BSLeNsNX/Q
         9T6ktBStnqNOZ1k6+ONai8cgn1S4I6F8BG8qqE27amHZ+gmKEFNycKeloXX5b/6ghmDi
         9COg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N17bkuZkabA2O6KzEXbzZaK6naHQPhGk75E/r9X9ghU=;
        b=lLFnWHX9MWeEEpd62hxBUVYQRekveTHxEk/hSA+a0B8qvTfyMZJMIhGWy3bVsEWmZY
         ojBWw7N8TeD6Xi6xczjNV4heAOn49gxe4dlj4uqTj6yR5qUKiOw0MGZsF8XkPWh79fgl
         oQitFKCZ0iexQ3eFEWTKSvmfHy+vERjeYEfUlKuMIhAF/9mXy8xnwIhMq+qJ5DP8/yAw
         piBSLZFkNtIMlBbnxejkyfmeZsKkDZ1+An64afIz4v1E94JbaWt5Fw7EI0nsfMP3QpBD
         n1r+gxDfhIe3T33ZDKTrwL9aZohQ0Rs7Gz7eukay2zFa/wYTTYbGzPvPRzEV1r7OBEwk
         ikJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TxUCPC7S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9si1161181ybm.286.2020.06.25.09.34.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 09:34:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TxUCPC7S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joUpk-00016u-Mk
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 12:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joUpV-0000sc-Rf
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 12:34:25 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:39334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joUpT-0004Pw-Ux
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 12:34:25 -0400
Received: by mail-ot1-x341.google.com with SMTP id 18so5838437otv.6
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 09:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N17bkuZkabA2O6KzEXbzZaK6naHQPhGk75E/r9X9ghU=;
 b=TxUCPC7SI2zT7j/+q9e8XPx4cp9kwzS5YzXCQr0Hhe2iCD+BP5tfbiAegxYKA4wlUb
 zaimaY+50VtiSGtLWD7R+1yjGl1V98tCBBXiJBfH7J/IqX8MzEt4J/KKJwpn6RBjc/tx
 1H6G2ub6CB/oTW3qP+dFLpgmvliS+r/akgG8ch4m5T2Yznx6cjituFNJlJ2/xyyOo72M
 HQfrbHmY6kU4MMhcpx0E3sx3F0N3CYDjm9EBm7GJgZPjluofNz2jz4svWilPkKAlT11z
 kG8nZaqBoibHYyIMvVfogPxi4vVohh4R/TzHl8PHMbVjcp0L9gJj+XakbugodbCYTn2m
 Uf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N17bkuZkabA2O6KzEXbzZaK6naHQPhGk75E/r9X9ghU=;
 b=Nhkie6GHmm02zGYnkQJL80NKB0JXE5uxVg+p7d9sMa6y5edBeLVD1WuOhnB7FlcrKH
 r12vOhP3N7oJ/iRg2yH0qrPVt0rDlT9cTNWRCZ4eG+oZ01+3B6nzHLjHycJ7emZYz1Kw
 dH56jfba9Notxhs+It0w5zXynDUH+uQ0nMWLyxv6xlYzR+uILko3l/bffJcxK9kDXhOA
 /k1NdM6TowfMNMAI22OwXqk71HqAJHs+y9IIEvIrazk1Cge+97SwLQYjTybhnIXt/vMw
 h69svYM0pj/EBNvzJOMxlsZSyaamnORmBWIfuolSV5DtnkGltEiAvZOW9Ib3QWEm+uze
 01fA==
X-Gm-Message-State: AOAM531UMHvtCna4CILI/g8YmIK3eWsSiQtd9y0yHrLIGv3srI5T4hWc
 Spj63svxHfQ6X+j91wXtEf50jTqchZnvYQtWn7v2lg==
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr26318361otn.221.1593102862427; 
 Thu, 25 Jun 2020 09:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200605041733.415188-1-richard.henderson@linaro.org>
 <20200605041733.415188-7-richard.henderson@linaro.org>
In-Reply-To: <20200605041733.415188-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 17:34:11 +0100
Message-ID: <CAFEAcA_ca4vAxB-2qfsXVUNPUdyFTJQtcBdkegn4ub8SOiR2TA@mail.gmail.com>
Subject: Re: [PATCH v2 06/17] linux-user: Do not use guest_addr_valid for
 h2g_valid
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J1crpucNlORr

On Fri, 5 Jun 2020 at 05:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is the only use of guest_addr_valid that does not begin
> with a guest address, but a host address being transformed to
> a guest address.
>
> We will shortly adjust guest_addr_valid to handle guest memory
> tags, and the host address should not be subjected to that.
>
> Move h2g_valid adjacent to the other h2g macros.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu_ldst.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
> index c14a48f65e..3930362e20 100644
> --- a/include/exec/cpu_ldst.h
> +++ b/include/exec/cpu_ldst.h
> @@ -77,15 +77,16 @@ typedef uint64_t abi_ptr;
>  #else
>  #define guest_addr_valid(x) ((x) <= GUEST_ADDR_MAX)
>  #endif
> -#define h2g_valid(x) guest_addr_valid((unsigned long)(x) - guest_base)
>
>  static inline int guest_range_valid(unsigned long start, unsigned long len)
>  {
>      return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
>  }
>
> +#define h2g_valid(x)  ((uintptr_t)(x) - guest_base <= GUEST_ADDR_MAX)

The old implementation returns true for
HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS
(because there's a different definition of guest_addr_valid() there)
but this one does a range check even in that case.

> +
>  #define h2g_nocheck(x) ({ \
> -    unsigned long __ret = (unsigned long)(x) - guest_base; \
> +    uintptr_t __ret = (uintptr_t)(x) - guest_base; \
>      (abi_ptr)__ret; \
>  })

Why the type change? This seems unrelated.

thanks
-- PMM
