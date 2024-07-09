Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3373149njb;
        Tue, 9 Jul 2024 08:46:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVC+vC+luVyGzr7IyD2DzmTSvnulMdWfARnRddodNwIMY6cv9j04e2K/mBbobNZa/IOTMQwiZNwQvFKwshffqrEW8QohJ2R
X-Google-Smtp-Source: AGHT+IGSfk6nHgNZx9zJMBoz9vWjCZTc0pNqRzOVGOHlx3cUnsMOzDCf00Ar+3/IYT+pKgjCU2yF
X-Received: by 2002:a05:6122:8cf:b0:4ef:6d02:f4a with SMTP id 71dfb90a1353d-4f33f339d60mr3696340e0c.13.1720540010567;
        Tue, 09 Jul 2024 08:46:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720540010; cv=none;
        d=google.com; s=arc-20160816;
        b=vWTyq3MFiRKnMtCpH9KWg39VkGU4CefCoacvkRIS9f/dkxuAxP/V/xXfxDWVDHFx1S
         sbeUzTN/FPvXe/ZPOUg6z9PiYwMXRlQnD0REmxrkRHlNDAiFdUNk7yNdiHm+upuZVKhD
         vXpi22WJop8i7cDomKmFrCiaOB+uTjkdL34VcLQUGezM432fKvqENX2vrWFBImjVLYO/
         j3RwOjBlVYHDrTKVORDi8yTBukC4caE7LTHnkoWUk9C5NrXKCxUuorHWaMiLEkDk0oqb
         6Dfwa2ilBP7iAwoDcHv6OFDur+SxUIFEdie1hxkVVrWIYGSy351LNVIUZnnpXXZusn4i
         Ck6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=9JD0Dbr7T3ZUz9lt7nR+lfIlFQr6E0Gj/yU3KGxEYB0=;
        fh=4UxsrK7Mco0qt7bvjnPggQMokaKOKuMyUEtZk34LOiE=;
        b=SnWMtOnPz3yEYgEMQ+XMPbilIZTdfaL0ypwppbgi2B+IDRGZxlyuudY5MmbyGRqCPN
         eI0j5l+gQox9JOhdB+puP4EmlezU5DXd52cRBAzsaw9VebSqGRlUiyBif0kTSR8mcARW
         7l6ok+JgwDVWchGD6IhQUFN44jV3/nwTikcOtJdYI9hlBieTIuX+dkC/7Nh0Mb1FQySH
         iAFQyTA0FggEineJXdUXNBNqPmEiUSEAjHbQo8Xbfx8FR8/jdqNimPQgrLqSRqMnJxRU
         R+4OTugwG76KUg2HAw+7iRQr1NrwZZf52vEoaYxAhMs8BN7KrmYf45mRz4OdZu5cPhGC
         pr1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QmkBcCaK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9baa85asi24081881cf.298.2024.07.09.08.46.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 08:46:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QmkBcCaK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRD2n-0001AC-58; Tue, 09 Jul 2024 11:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRD2i-0000mN-88
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 11:46:16 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRD2g-0002Ob-9T
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 11:46:11 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-70af3d9169bso3330050b3a.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 08:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720539968; x=1721144768; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9JD0Dbr7T3ZUz9lt7nR+lfIlFQr6E0Gj/yU3KGxEYB0=;
 b=QmkBcCaKZ7skYU0nN0GGDfGiwnAdt8Vqr/N+36GDZk/nfem6dP/U+lcuD7oNsVA/RS
 XHPl+o6axKUvM4bpWR9zkgIy+QF4E5GzLJYqMi8L+hHboMYdUzhvEIiOXquUCiVph4mw
 yYS7b6wjwmNc/xFb+mMreSgH6pyDymV2UkI7B9Z4AaVdub7/M0KENwfAfS1tTaBkmvnM
 z7BTX+2rYeowY72OB2mbITopGcf2xW79XA3mmb84QAD50mygHoeS56MK967+dpds1CQl
 oL1l/6WUIJrMsAGBrE/00X2XngL0aRRRo9fo9kaXciBM1aVreZebKiiPe94wneaq6UVS
 d3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720539968; x=1721144768;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9JD0Dbr7T3ZUz9lt7nR+lfIlFQr6E0Gj/yU3KGxEYB0=;
 b=mvmBnrc0AZH6bMlRZY+jj2P/Bz+1HHHVL1Olpg+/J0T6jtJjRiFxQaRTfiMcvpd2Y2
 BRROmLXjkKQZAnr5CbGZLOwdGFyLuIbIOsIBqmz+3NMC6ds3wHHCYZ6TyLQqDNyzPtRq
 qQfRWxmkvkLjvKPhDxpCEhVvF5SLcLnxf1Y8WBkdbs4ANvAH8d4Me4M1jM/FRMS9bNAw
 96AEdsgkXD099SFUeoaoDApFaDTCGGxiRJou0rt9IKkbq5L+f3smxMKOEVsKbc+2MQdp
 ND9/ByiLL/PpsjrJrhoX7tuToEco6ihl4m57qAV5e0y9iOXrHwN+1nPKq13Z+9nYlcD/
 YJfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjNn8TpHmTlwKTaZhEm9C7UMAtJ8m08s9TcwSVGT+bODcnFI5TpZu1RJhbEsC/gzYb0z4gRhzQ7/i7cbjFunTYW/BA
X-Gm-Message-State: AOJu0YyQr+yh8olxip018uumcirjUTfcpph+t7mJ7rbG/aqBfR7Fo5VE
 lFzep+jNWS1wFbYu8Dl+MmjGRQ5kwdFk4N4iOWToy4IAZkCqMu/QYA6loXhbDHk=
X-Received: by 2002:a05:6a00:4650:b0:706:34d2:62bc with SMTP id
 d2e1a72fcca58-70b435709d9mr3391749b3a.18.1720539961482; 
 Tue, 09 Jul 2024 08:46:01 -0700 (PDT)
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b4397ed2esm2035874b3a.149.2024.07.09.08.46.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 08:46:01 -0700 (PDT)
Message-ID: <b1edf94a-5003-4075-a92b-87a802e748ab@linaro.org>
Date: Tue, 9 Jul 2024 08:45:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/arm: Fix handling of LDAPR/STLR with negative
 offset
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240709134504.3500007-1-peter.maydell@linaro.org>
 <20240709134504.3500007-2-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240709134504.3500007-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: bZwcwwT4OhBa

On 7/9/24 06:45, Peter Maydell wrote:
> When we converted the LDAPR/STLR instructions to decodetree we
> accidentally introduced a regression where the offset is negative.
> The 9-bit immediate field is signed, and the old hand decoder
> correctly used sextract32() to get it out of the insn word,
> but the ldapr_stlr_i pattern in the decode file used"imm:9"
> instead of"imm:s9", so it treated the field as unsigned.
> 
> Fix the pattern to treat the field as a signed immediate.
> 
> Cc:qemu-stable@nongnu.org
> Fixes: 2521b6073b7 ("target/arm: Convert LDAPR/STLR (imm) to decodetree")
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/2419
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/a64.decode | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
