Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2736977ejt;
        Mon, 19 Jun 2023 03:43:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4ikWDsHniZrxjtifs5Y+lu0a4JCTw4tTQFST+Plf0NmmAOHaQXI0dD5Jl++siFKSK1FZvP
X-Received: by 2002:ac8:5888:0:b0:3fb:26e5:24fe with SMTP id t8-20020ac85888000000b003fb26e524femr12580207qta.25.1687171419140;
        Mon, 19 Jun 2023 03:43:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687171419; cv=none;
        d=google.com; s=arc-20160816;
        b=vyDcFyJEhVExXQh7SbSlhAgCngn1lMc551HmTnnZWgmYvVFAuh7KmTp74wQJ/eBZj4
         2vfXn+Ee+RXsv9r0puXhD9Wt09nwFs8qwQb2a9cFv6hE4UZ8n2frc02cmzSRx0u4lp2W
         aM58iXLgSV8dPuUA53VAonCQYPudGa+8JzfNdShis8PQnEzYG8ktIcDxN98qUYtNyuYa
         mnUoJYDiDXiE4UaOJUJTKt6SE3uhR9we657Us/jDm201C1Ge+5kwN+6KNnkjWKGjFhiq
         MNvw+b8Je2V664nGkykPFj7OCrJHLxA2DTnpE6sS6Xl5WE4fvfiGBVUkrJLjkRcjuigQ
         JhPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=5l4ohaSyf61v7E4vEv5iL4Sdh8KtOCyaAQ/pnwCKEf8=;
        b=wi/7MjNhCzTZ5IlfMknsyRfTzbkg1Ta5t4zKqd7dfUs9VEAdbBP7mpjTMa6Hj1AnuI
         w1L4T26qgwDphZ55XPe8v1b+K+SBkYNZH3L0+cH6v25tkrM1CXqjmehgptxj+gpsKpxt
         eIh5gI81KZFy0fO5b6LweFgm/7Q+yF+x4hZAGk+87ZJ3EBtiDn8r4EIPgTsO3xQcleLG
         KGhUrWJuxtIgabOFG1FJ/EsVcNublFvvMXQIWyysseOXsxGIpFCBzVss4GWQ+hie6vDU
         OARys/Sk/ykjWbd1l27FIqIFonYEwnyYSC1BFp0zPhsAqdbfWx/1yIWk4DKeEkGBQtRL
         Ee5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AfdZv7yh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9-20020ac85709000000b003f956866864si13552334qtw.197.2023.06.19.03.43.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 03:43:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AfdZv7yh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBCM6-0001DT-Hc; Mon, 19 Jun 2023 06:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBCM3-0001Bh-Uj
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 06:43:28 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBCM1-00047x-46
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 06:43:27 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3113675d582so942448f8f.3
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 03:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687171403; x=1689763403;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5l4ohaSyf61v7E4vEv5iL4Sdh8KtOCyaAQ/pnwCKEf8=;
 b=AfdZv7yh0tr1JZSFa8n3s63KGPIiriBQGKE+TGQEflip4MBcqEM/FiV5X7CEr1kO/c
 X96FYfPRZJHYSgk/GqW49YnfP9UT90XL0DKJgK+MnRInwQMVPgi1m00/QvoS/FjZZZBv
 CfhquEYeX5awuFv6VcEyTyHVmXkoPvLhsdKoz8lQP1O0uWZ+H07U9UZQhX/09DqAyJCc
 Vaj5LPtcbazdlNj6xY5WCbK+Sr8xOhv6qiaXJ0Q37/ybzHrjvxODjSDxZj/fWbD1fuh3
 vsadL47dIy0X66OeJTjR9r5dmomaGTTGFA8WDnGXFDc8fMyBgCamY81WlXwwX1e4aBRv
 zoew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687171403; x=1689763403;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5l4ohaSyf61v7E4vEv5iL4Sdh8KtOCyaAQ/pnwCKEf8=;
 b=GSrCXAC1wGu5EDqdVMTdiFbtpCxqF/Snuxl7UWNR0GXPYRQVMN0nqXcraoY1e52P91
 UoY7j1GhvzVxkLnZTCcb0x+z/vUS0avWs1tHoiPwbJjKfwkOK/8ss0PIGM7qv1LFm4mK
 GExHxC5w+x2wYfYxsv8xp+r3t4uOFrzp3oBU6JpZ7NHYNzndZ89m4piMBjyKryd80dKM
 hBk6T7w1X1Hlu5aMPLz4hndYGUTR6MSusgIlt7aHN5J/AfgmIPrrgaWNwlQwqgLCz2vl
 VzwcHIWHy1S+UX4lWCJ3G8q9IHZ40zLi5gcpxhBLXHniF8Uuo3ba9kxUhlDEFIFXf/yh
 94Dg==
X-Gm-Message-State: AC+VfDxDqSCJN3QVPnFOr3Lkl/2nu+h9e6pFjDmykX9R+JTRUA2Tk+V9
 IyKZT0Dlf0ucEA6RUNyNHvzrdg==
X-Received: by 2002:a5d:6884:0:b0:311:1101:abb7 with SMTP id
 h4-20020a5d6884000000b003111101abb7mr5148051wru.65.1687171403395; 
 Mon, 19 Jun 2023 03:43:23 -0700 (PDT)
Received: from [192.168.69.115] (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 k6-20020adff5c6000000b0031122bd3c82sm8687253wrp.17.2023.06.19.03.43.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 03:43:22 -0700 (PDT)
Message-ID: <1e32947f-7498-9db3-1912-dd3847f4aa0a@linaro.org>
Date: Mon, 19 Jun 2023 12:43:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 07/38] target/i386: Use aesenc_SB_SR_AK
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230609022401.684157-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: yqxoHgrcE9cj

On 9/6/23 04:23, Richard Henderson wrote:
> This implements the AESENCLAST instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/ops_sse.h | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)


>   void glue(helper_aesenclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
>   {
> -    int i;
> -    Reg st = *v;
> -    Reg rk = *s;
> +    for (int i = 0; i < SHIFT; i++) {
> +        AESState *ad = (AESState *)&d->ZMM_X(i);
> +        AESState *st = (AESState *)&v->ZMM_X(i);
> +        AESState *rk = (AESState *)&s->ZMM_X(i);
>   
> -    for (i = 0; i < 8 << SHIFT; i++) {
> -        d->B(i) = rk.B(i) ^ (AES_sbox[st.B(AES_shifts[i & 15] + (i & ~15))]);
> +        aesenc_SB_SR_AK(ad, st, rk, false);

Why not use aesenc_SB_SR_AK_gen(ad, st, rk)?

Regardless:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>       }
>   }
>   

