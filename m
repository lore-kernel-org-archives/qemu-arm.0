Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1439129ejm;
        Fri, 21 Apr 2023 15:09:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZXL5iXlrI/TT4q5z1VALIJMNUL2oPuhy18ljaGaXoc6yfkzubSJrP+rW7MX15fu7H+q9Vv
X-Received: by 2002:ad4:5d6c:0:b0:5f1:6892:7435 with SMTP id fn12-20020ad45d6c000000b005f168927435mr12450979qvb.23.1682114944257;
        Fri, 21 Apr 2023 15:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682114944; cv=none;
        d=google.com; s=arc-20160816;
        b=XEInOyBGAuZQe/aTjcaFfPPV/mGm5MIl+0CTmhGFZZqga/6ellTfLixW3zjONjN3oT
         p5ENw2Lu82TQiTeUZyN8Y/fMEpe4JKlBwL2W5ANAW/+IISgfqqSCNTvBnJZ/pg3nFcYD
         LT4slJD6i+WEl2g9GjFdjNOBxIyyuxyc07I+4WHjb8PSkae0t+ZLiRTLpA+MciosnYXv
         5gY2W5m7ftFIr78ypPtrXWBTEDlJrmPUORDudsiViJ90oZoLCbVeJ2S9at59xB6Slke3
         SgTUxPmW36tPEAKpRCvHgFG88R8/Vc98PejN22F3rVX2MU6kFOgaJNoj7FQK/8QtA//3
         bSaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=z+XQpv6RjHESwgJHmX6WCcNUotdPTD51pqluNuau6os=;
        b=SWpJWpR4/NanIVLCpwl+W4BoyF8GlOEJGzNSAVJyVtvDfh5+2F7C7q+LEwuIZ9/aCI
         jUNZfVxsjUiAXnTnBwdqX/7DUx95W1eUxDT63ROg7nTfOZPlQyYOXWrt7sNm7bf4oCTE
         d9zB/3uKsC3BEugUgW9Pc1xtKf3SQe5Au8H1AknjhV0l8OVPw98R7MbIc3vkOsNgTqQq
         Im/Kkvz9Ob0KBqJYs3h9eQk63YTiJm+D6396BsWJVIC59qYn5I9R4GjDeNuHzaFBcSz0
         L+wYENpa3r/50egiFd18jakgxw8IOIOITmx1MVnoQxaSQIGR3plsZLPt2wzW7U8m03da
         GIpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=quIDhl7Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fn14-20020ad45d6e000000b005ef6a8e45cdsi3899115qvb.510.2023.04.21.15.09.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Apr 2023 15:09:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=quIDhl7Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppyvp-0002vz-L7; Fri, 21 Apr 2023 18:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyvj-0002v7-4X
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:08:35 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyve-0000zH-Fy
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:08:32 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f1763eea08so23301655e9.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 15:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682114908; x=1684706908;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z+XQpv6RjHESwgJHmX6WCcNUotdPTD51pqluNuau6os=;
 b=quIDhl7Z2Yd7iqsGQ92jbAUL4HQmMWqnFlvawHBTg0ioIXiX4FoVkcMkhY1GOxgbJv
 3ZDDLPiYw+/0fPIVURRwP9KSFHXgIcLzVqAppLVVWIAbMte2XBGdP/FiPcXbbIYLnyQT
 jeJReRPkRCnOO+Aw5X5fPq6E4cy008GqjE4RdfH6AA+QvK9IXcR2NoHdaWDTULCOrT+d
 KmHGn5w773La3j1echNVskSHQchwQY3e40Fcmc9sVf2bChsbFIlWez0V1CBvkfMCAP0T
 iUKjHPN2H6eG1/ABoUnBphyuJ/nix60IJNly0IJUbUJ9FZL92yi7EOI4T1F5AHUjR4Si
 bWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682114908; x=1684706908;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z+XQpv6RjHESwgJHmX6WCcNUotdPTD51pqluNuau6os=;
 b=WNroC0u2Ju3ASsvGid520yI4HytgXLNP3HQPgBfnc50PWI8Vi/xxTXJv0Ur2tB+pJe
 g8QxSY7k0hZluyE2Y5y1hUxm0wFhNPMeaRA3oyNYRK5HiJ07kAXa0bxHNUX+160hJdh4
 jIqWuBh34XQs5Rju7NvFG9vnUEiNP+IRBqsBCvNYiWg6GFw7rMQQH+vkuPddVGVjHYPZ
 HSqv0EXqGeYaBt/GIl5L00Tn8fJ7378d2rSgs8ZiCVoa/Gj9Hpnt4LLq/0hmvBwh4SCL
 TyilBAa+pLVhU+AQ4FFZX0hPh/QXOgSgZza48SHpzE04pV1PKCGwniuaiT/yWcrJsYQR
 gr2Q==
X-Gm-Message-State: AAQBX9ckWDipBvoK9t0/eTYHIHDQuZ76BFwCTUWTL/DciQCDYFAvGyeb
 32ypQJ227Mgsmzi2TneBjWIZHg==
X-Received: by 2002:a5d:4042:0:b0:2f4:6fe5:b07e with SMTP id
 w2-20020a5d4042000000b002f46fe5b07emr5202804wrp.40.1682114908572; 
 Fri, 21 Apr 2023 15:08:28 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 c7-20020a5d4cc7000000b002fa5a73bf9bsm5226091wrt.89.2023.04.21.15.08.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:08:28 -0700 (PDT)
Message-ID: <96b80825-cc36-6893-9386-eaa71feb1538@linaro.org>
Date: Sat, 22 Apr 2023 00:08:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 02/54] tcg: Replace tcg_abort with g_assert_not_reached
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Vh/anLNAuYHg

On 11/4/23 03:04, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg.h            |  6 ------
>   target/i386/tcg/translate.c  | 20 ++++++++++----------
>   target/s390x/tcg/translate.c |  4 ++--
>   tcg/optimize.c               | 10 ++++------
>   tcg/tcg.c                    |  8 ++++----
>   tcg/aarch64/tcg-target.c.inc |  4 ++--
>   tcg/arm/tcg-target.c.inc     |  2 +-
>   tcg/i386/tcg-target.c.inc    | 14 +++++++-------
>   tcg/mips/tcg-target.c.inc    | 14 +++++++-------
>   tcg/ppc/tcg-target.c.inc     |  8 ++++----
>   tcg/s390x/tcg-target.c.inc   |  8 ++++----
>   tcg/sparc64/tcg-target.c.inc |  2 +-
>   tcg/tci/tcg-target.c.inc     |  2 +-
>   13 files changed, 47 insertions(+), 55 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

