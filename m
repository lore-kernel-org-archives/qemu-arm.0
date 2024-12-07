Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1710412njb;
        Sat, 7 Dec 2024 13:57:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX7Nxl73yIIZ3k2h+CQHTq1PMGMHfTFKy5/GNzIcsVv5aWszFVbPYtFYpu6if3W/G4AN5La2uE1NSZADQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGdt5YrzmUyvXb9dxfwOodLiMwO0TUnt7HeNq++gGDtHUQ6mrgLRSayaoV/5XBv6VgybmXq
X-Received: by 2002:a05:620a:6018:b0:7b1:1a1e:3013 with SMTP id af79cd13be357-7b6bcac191fmr946650485a.8.1733608650233;
        Sat, 07 Dec 2024 13:57:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733608650; cv=none;
        d=google.com; s=arc-20240605;
        b=WMERJy1qLvjQEpCnBUrugkAMvRfQBa4gSWzliwBVmJ07DFrtrLsItcTiD3bVq0bCWf
         oqxsHanZGwZ+OEHmNbwybcledDZ3TY9ZgQz5xZU6Dzl37Uy4LBFHOQ6FHAPFuM5ukGx5
         rdGxzmLuGZXjXI0TkCCMFkRSUT4stjo/DoQiBegSyLj2GfJ4FWyeE90Aqp2TStaP/qua
         jUCgoJ+z+YD/ola1epzqA1OIMI5iWSJppuVOIPlC6AYTNSJQPU7+JXB7NWuagPIysQ3r
         VN867BpnK0Q7Hj6khDcKPxuh+MYrOnPSjbgiqIJpexHFWmmioQZNXurwSS8B+zOZixqD
         zfVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8HnQYRVJBjl/B1ZbZhLv6NEZbB6lt/Wz1EdDXsNs0Uo=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=Ek0RMetNEwGDzxr6fJQbE+q+OjDsJiDFtMvLdJKUiXm/T/VpNz09JdpyP/8GMZC3ye
         QKgAwucv+xeTnOLQI5Vx5pnEML0oi2QdO9DiPrE/1z1YkVqOymdJj1PKuGfAsy1s5meh
         8KwjwAkBtqtYr6cs2F2Jj6u1VWUJHZ7vCXhXsboUvW4zao2VtZsXus6yr7ou5I1p2Hg4
         0seZzHyu1VXw0zPrvdB2y8HiotvRsW/hb/kngXReWHSdlrZ6Jp/ED18oRGQr3btF2qGl
         0XIKYtDpYybVIoPzIdj8GYMu9AbpkdJcuqz11gs0bkjHyRrPaajRkDnBBSOpeykd6Uq/
         RVMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lB3EajJ9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5a853cfsi681693885a.249.2024.12.07.13.57.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Dec 2024 13:57:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lB3EajJ9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tK2nR-0001b6-39; Sat, 07 Dec 2024 16:57:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tK2nO-0001aM-UB
 for qemu-arm@nongnu.org; Sat, 07 Dec 2024 16:57:02 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tK2nM-0005uV-H7
 for qemu-arm@nongnu.org; Sat, 07 Dec 2024 16:57:02 -0500
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3ea427001c5so1866621b6e.3
 for <qemu-arm@nongnu.org>; Sat, 07 Dec 2024 13:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733608618; x=1734213418; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8HnQYRVJBjl/B1ZbZhLv6NEZbB6lt/Wz1EdDXsNs0Uo=;
 b=lB3EajJ9pXNIcj9m8XaANDE+GAaTVuK2MxaxnIogzU5FDVjKaQrosVT/aR7eCiYQEx
 pnKelMJ1czHpnmz1gYXspqf56WwzYewLhjnr34uYNSHUJskwkTARUN6oY2fR2bVPAZhE
 ZXl24XtOW1VfyB5pC4TgfTbSghniIIqWCTNFuFDx5y1fRMGdoV4MdsImFIl9Yifix7bA
 kxh6JfSa0ztXBnbtpFUJEOlrx3Ke8g7ZkfpESzqBVDCA0y/qwIkuXppYfQoeO0N06Vga
 zJCeGeIa3Opw9HH6lk+WYtYGgU3pOQNZXDY0F4zeQQemDf+kVg48UsmyIWFKUoKkp5Wp
 ktcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733608618; x=1734213418;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8HnQYRVJBjl/B1ZbZhLv6NEZbB6lt/Wz1EdDXsNs0Uo=;
 b=j4/zQS3+xGMGjcB5CqTLfzQM+MFLWeR6MgM8BbbDis9X+K6B+ICwhn06ppL9hYw34e
 MUwivBF5cghnJIRtN/kzfE77wfPh7M21vhCi+AoWOXMaBb4ztaLDIAmwsThfJGYmbjkN
 w+fF+zl5kNH7RIPUBl3m7+dB6pPT9KvFqmAIJfXOlmnI1REb91SrdyG47r4uCq71w5Wb
 X9fSL4w10l9MQXCBd+Fp0EqPhKsdMHV7NDts2FXoX8OzEIJxE5TjkMrRMs4O8RzKDZQ5
 eC0o5/aOiM7IB3HnNCO015TtvRxwyXBJfqPjidbd20FkfGMkmyLnjNnQW3Ln23PcR94n
 ClCA==
X-Gm-Message-State: AOJu0Yyno3iCy2A5W8WIBggW5v/CwDwzlDsxg7R2qAi9dZvUELQNKOqp
 EegXZ7UOYD680zsKV+zxB6f8bI3wjdeXifyRN4B2VHyF/ALCyk2os9R2HbyS664ytKeDho5tUQM
 ApUmLjol/
X-Gm-Gg: ASbGncsWj9ME2+eyI0h89n/gu9Oa50Gm+KLwRcKckS8XH/BgnI+rwsM33cyOopfABIZ
 +KvMt/5YUymXZGRgxWO+YrKyOnSlMrhGtbOIEt1+3XaMpkXOA5uoWcjdwFc54mqTQGPanAhMR2+
 ES/dlZoK4J2CNf+qctTyjOAD0hkQmQRggI0XeKWyMQdR5t5meUlk+iV8XJsKHDq10s00xt7Vb0E
 XHrswXDWy1drWa3uOk7kFojD8Tco6kgng5OwWCT5IZse9H0Sv1AXBvSfbPkA/qkc1degqMZN8fv
 52SRd6+dICUS3K73nW0rk/d6K0VP
X-Received: by 2002:a05:6808:d46:b0:3ea:63e2:1aa9 with SMTP id
 5614622812f47-3eb19c16946mr7477863b6e.7.1733608618669; 
 Sat, 07 Dec 2024 13:56:58 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-3eb076b8bfdsm1434600b6e.17.2024.12.07.13.56.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Dec 2024 13:56:57 -0800 (PST)
Message-ID: <79b8fdc6-bbae-4068-ab29-08e32cfcc058@linaro.org>
Date: Sat, 7 Dec 2024 15:56:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] target/arm: Introduce fpst alias for helper.h
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20241206031224.78525-1-richard.henderson@linaro.org>
 <20241206031224.78525-2-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20241206031224.78525-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
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
X-TUID: 3Juwtk/HXT3v

On 12/5/24 21:12, Richard Henderson wrote:
> This allows us to declare that the helper requires
> a float_status pointer and not a generic void pointer.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.h | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/target/arm/helper.h b/target/arm/helper.h
> index 9919b1367b..cb722c491b 100644
> --- a/target/arm/helper.h
> +++ b/target/arm/helper.h
> @@ -1,3 +1,7 @@
> +#define dh_alias_fpst ptr
> +#define dh_ctype_fpst float_status *
> +#define dh_typecode_fpst dh_typecode_ptr
> +
>   DEF_HELPER_FLAGS_1(sxtb16, TCG_CALL_NO_RWG_SE, i32, i32)
>   DEF_HELPER_FLAGS_1(uxtb16, TCG_CALL_NO_RWG_SE, i32, i32)
>   

This should go into include/exec/helper-head.h for use by all targets.


r~
