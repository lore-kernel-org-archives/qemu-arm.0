Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1541338lfc;
        Thu, 11 Jun 2020 08:42:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrapRU1l7nApvZxYGORLxVJpr/ZUfVrFUc3bHYLpK6hieaWXIGyRkuR4yFjUUKDRvmhr4m
X-Received: by 2002:a25:2f4f:: with SMTP id v76mr15536065ybv.7.1591890120552;
        Thu, 11 Jun 2020 08:42:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591890120; cv=none;
        d=google.com; s=arc-20160816;
        b=jtHcOZIKzZHlxxaa/+nDk7ZRNxoSFL4abqoBj/zobV/p+zlzW1fmavTWdAjPbLiWBs
         kygRD4/c2BD9PRqnYr/Cg4t8G6+fd/Pzal/aWTJYQxZmybn3nF2Uj2J4GWu1APR1lN1I
         wwP7sYoJcFkL5A3YW5uNjhetmSpH3V+oMQziwZt6UmUpKXQl3+ICC9kCWOCPU+V2eh5z
         BQRdBgndi7Yb0r8NqLL3D3wFv9sogZlLdjfhCzfgzq3i0K7HP2cEkTlm8oAjdyWLGe8a
         Yh4cnWt0p15cX7Sh4JeB0lxTLMzpHHjTZVxem8J+8ZV7LaqwAvUpDyaaIlY9A1uF4v45
         yBqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=taWCnuUGc3aBjWxN8/zwY/zGugn1tYn2OOhu/tU0z0M=;
        b=NDW4kX6J6Z2hGPlGSzZ9sToDrnG2lYdr3kI2dWVcwXiDSM02zvmFEnjz0Z5aR5C+SA
         nmArBljDKuNCBO288noJ19qRGLFzvmd7bb7A9RxktqleQComo3coxS0uc0Z8CB0lfycd
         e7FMaxb4ATrShOs8oLNqE89dPX/nMTOIvnYTalWyKQAUVaPMe3qcM1qQoRnSQXiNVR+b
         KP/uc+uX4uudHuJqUREprJ1+mvIW2H14Lpy4KLRQZ4Fs7WdCIHDuc7EZNAbfi0TOzfa4
         oAoOuINxYCRgh4MGCe6+1AEDTVwxU9sMtAcJFrFom6JK3ThU8t6RjZ5z1767jIut6bct
         mpWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a6ywLGvF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 81si2662787ybc.41.2020.06.11.08.42.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 08:42:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a6ywLGvF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjPL5-0006Ar-Uo
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 11:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jjPKt-00068J-Fs
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 11:41:49 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:35817)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jjPKr-000251-Ds
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 11:41:46 -0400
Received: by mail-pj1-x1043.google.com with SMTP id i4so2530212pjd.0
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2020 08:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=taWCnuUGc3aBjWxN8/zwY/zGugn1tYn2OOhu/tU0z0M=;
 b=a6ywLGvFJR36HkUvHnxlGz6GiKxo03UcolEy3izkAdH8/Eob2aE9Mq77D55Sq2QxqO
 NOIDuiAvOLv+2MldKGoyIVhhu4o0fcy24ZNhxGbCk6R8b68Vmx7jTB66vDmq/M61Eel7
 inePlf5zJXumvB8jL3ASuCVK9X4eWVqz1ARKPV0HUVagoVMowd3Cf6WLqliF7pvST/Yb
 sI+XveP1EfEGuqeAyE4Ll+cElCK/yZVH/ErqjiN1IRUu+1PUydjsyfaSIErV+4hgAsN7
 oqkirSB3swx2VsswroIKSgJK0UZt/XJG0jA4Vp1qVzIU2u9DDdEuLqlTZGTJ1Ok3lhRO
 tq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=taWCnuUGc3aBjWxN8/zwY/zGugn1tYn2OOhu/tU0z0M=;
 b=BXizlj9V83bc7qu7RsFIq2PsD91u5daDZRO8b0vcRSGWRH4pIsTC0LkpGj1vpPi+uh
 Prw8OvI5WqPm5gsR4Cb/lkXSpPC2IUVBYxzlZNpRuZ3fvB2Rhn+oPEWiIzYnOno5uNZY
 3vLAF8yIdwC8lEjOo4ZQnL2tKJKM4nfmHLVTzcLVaP4SjhvqM9uURg1/x7HJxYB6GQGC
 t/MbgWRjGw8A02plW5odVIXbzU77gxs3Eslip/SjNGxiOXQhf4e4TjVQPBxbKRGwvky3
 EEx8F0KWE8y0fU6Br5zVlTJwXGtai+GbD/E+WlAxjJzIoMDcGi9zNQA1wU+c4NudQELQ
 pVdg==
X-Gm-Message-State: AOAM530n+kDMhFJeShZBIZMBNriKKqv4BVKShHVv/DlbBvxN5QZ2WX+2
 pulGhtmAjldX7y0nr3zRKXaIew==
X-Received: by 2002:a17:90a:e007:: with SMTP id
 u7mr8760344pjy.208.1591890096198; 
 Thu, 11 Jun 2020 08:41:36 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id c2sm3537979pfi.71.2020.06.11.08.41.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2020 08:41:35 -0700 (PDT)
Subject: Re: [PATCH 01/10] target/arm: Add 'static' and 'const' annotations to
 VSHLL function arrays
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200611144529.8873-1-peter.maydell@linaro.org>
 <20200611144529.8873-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4f4808c3-c33d-55a3-6f80-6168c64979ae@linaro.org>
Date: Thu, 11 Jun 2020 08:41:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611144529.8873-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f/trphU8HfzJ

On 6/11/20 7:45 AM, Peter Maydell wrote:
> Mark the arrays of function pointers in trans_VSHLL_S_2sh() and
> trans_VSHLL_U_2sh() as both 'static' and 'const'.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
