Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4951843lfb;
        Tue, 27 Apr 2021 09:41:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdTRoYHtHEEB15MrHyQRobKbusfMpYgveReTOuUy8VBNdGRZBEJYDINkIXAXQYnINTQ47R
X-Received: by 2002:a05:6402:3ce:: with SMTP id t14mr5511472edw.142.1619541696394;
        Tue, 27 Apr 2021 09:41:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619541696; cv=none;
        d=google.com; s=arc-20160816;
        b=ZpcKrfxbPR9gHFR9bQUA5xW+4W72le0HNdnKWhVx3MJuX/XRyG+H7a9Fp2k3dw7oo6
         vC0bbyRzykDrrWwMl3SuwzPkiPCu1J1TANFn/rMyfx932kSrgzpWTXQilhDOeFZ8zvt+
         f6SbeJWxrKo4BIQyarqAMPYkFnbA5S4X6Hu4/7lGcU25y6OGcbOVC+TbichY8rny1ETf
         1K/bhZD8ln1qEr2jXjPWB1ZK2Dlx3eVYZ48Hp2m66b5Sb3dgxEbp1B3/6o0A9Kuwyvpd
         O7kSPvepeobS3MVbKMe4/S2hXmQob+q2RIlsybml0jo48+WItCRaaXJsTpxCLOniFWxB
         AUmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=9qWkQEW+zRrgpJDzh76RLl6aQzYDiDDT2yAGtLCDL5Q=;
        b=lML1O/OWnFK7895LFWw4w4nYB+HG9Xy1sDLaoRJSJIB8HLRrr6MOc02L/He+YFFQdP
         muhwxJrAlmJqVlbeg3kEGyrYVj20DET5ayqdYmJQCT//8GuLJOm/obk6iJvggypAf4Pb
         oN2DTHSJnocUH8Uu3BkvsP5tSsdyv2j/CzPovHFB2zwBmf3fDB5H90sDu2vN4IOCwvTI
         Fiz12edHQDgG83yXh987jP8qJGsXtk4hVdU+j2Z1OtUdTA9ziyIG82Xj8oi5x3yVjqeR
         pMB5WftoJcT2mfFhM0Vp8b8A01P30Xt9TYc0tbYb0l9NrvUJIjMsReItUZ5B/v6lJixZ
         mUFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dqwnILH0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10si2848302edu.601.2021.04.27.09.41.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 09:41:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dqwnILH0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbQmF-00026f-AI
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 12:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbQlg-00026G-Qz
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 12:41:00 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:47002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbQlV-00045A-7A
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 12:41:00 -0400
Received: by mail-pg1-x530.google.com with SMTP id w20so3861869pge.13
 for <qemu-arm@nongnu.org>; Tue, 27 Apr 2021 09:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=9qWkQEW+zRrgpJDzh76RLl6aQzYDiDDT2yAGtLCDL5Q=;
 b=dqwnILH0vQH9uAH17h3iq3kn/YFRF/bd70TE/XLuymYPtQDRC7kx1K0bgyuGlt+xYZ
 pobtbxdLz7XuxuY2DB+TFV5jhUcCQJ8wzvr6nsaqUmfZbuyEpWKR29ErazCsSlYVLxao
 DtFlAI5WLdW0eAXn3zPl+zd5JsQrLs3mADJwdpDPlwF1dOM7yL016aN/Bxr/n9jfJ1GD
 PSLCAlTKlk97zCGObhJ0Haf5FiGqoNxGpNlZM/3IoSSyc0D+D3QiCxonaggIYlt9Z+gc
 /hX63ARkoF5QJNEE81GoBUJMqN/CTbT3IfFNuqflySCohrm8ZgfY6eZRl8fWUbAaAdy1
 W83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9qWkQEW+zRrgpJDzh76RLl6aQzYDiDDT2yAGtLCDL5Q=;
 b=qzfBbJp+y9WXbcTlvfmlI+TLPUuty03VmmmmwffGAMlGB7nQSgQF0uYxOmlmvll/rR
 boTXPpgHppI1Ge/IxHHjefV1vWSTRjBKRUr0WWvVJPEOFE1VEC6m1r5ohFwsuU2vZKWY
 8Jsbfwytcsj8ixCTV8m625bdfe/8qV6Gc0ncEysVZ7N0TtID6h0CoN7Y676pK7bwxi0h
 UnHYFKSlISLDx1RRE5chveHvu/neVmub1CIeAa3kPuV3c1mA1MQI5DCTysdYiEwFVMco
 msWpJ5Vl28/tIEZi9kC9Kw2WwA61HOICoFX6AUa6dxr2PXzRHmgXjkRT/eGcNILqI5pG
 bl8g==
X-Gm-Message-State: AOAM532/4gPqUA/Hc9oD5jQDRNGV3Miy2mT1zw6cRHBi1PiI7vRzN9kt
 cjm3/5u7exvxB8MMn8T9kNz62w==
X-Received: by 2002:a63:b94b:: with SMTP id v11mr2004719pgo.76.1619541644588; 
 Tue, 27 Apr 2021 09:40:44 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id f71sm3135310pfa.91.2021.04.27.09.40.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 09:40:44 -0700 (PDT)
Subject: Re: [PATCH 04/13] target/arm: Split m-nocp trans functions into their
 own file
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eb35dc47-1ff2-32e6-dc57-3dd69e085505@linaro.org>
Date: Tue, 27 Apr 2021 09:40:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
X-TUID: nfSoOzG1HfBz

On 4/13/21 9:07 AM, Peter Maydell wrote:
> Currently the trans functions for m-nocp.decode all live in
> translate-vfp.inc.c; move them out into their own translation unit,
> translate-m-nocp.c.
> 
> The trans_* functions here are pure code motion with no changes.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-a32.h     |   3 +
>   target/arm/translate-m-nocp.c  | 221 +++++++++++++++++++++++++++++++++
>   target/arm/translate.c         |   1 -
>   target/arm/translate-vfp.c.inc | 196 -----------------------------
>   target/arm/meson.build         |   3 +-
>   5 files changed, 226 insertions(+), 198 deletions(-)
>   create mode 100644 target/arm/translate-m-nocp.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
