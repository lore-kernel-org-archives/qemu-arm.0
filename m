Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp5363413ejq;
        Sat, 13 May 2023 04:26:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4zsC+yo9LSqqKY0CSO/3HIHpjFnwmD5fZPBAbMlfgOQnUnAs0uvlkgkWeQ4ZDLtOyw4GdM
X-Received: by 2002:ac8:5c4f:0:b0:3f4:eff6:65c with SMTP id j15-20020ac85c4f000000b003f4eff6065cmr14056867qtj.4.1683977193432;
        Sat, 13 May 2023 04:26:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683977193; cv=none;
        d=google.com; s=arc-20160816;
        b=RMUOsy4jwiLAs+nh18xSUAaqnUyNox7RYHlUQb25Ec4HvGore8IU3j0xhxlXvDb1X3
         wcIoS0FxsEnGf+vVjGxvq8jzjfhH6AEwzxmZcbnjxCVydXm+0wolLmZ6N1ropJm+SUni
         fPkfhNQntjEGnFAL3C/pz2z4oDF1Fi/TKhIB1Uer1FSSNQRlI3oqSVu5BNHj/bnH18Wx
         m115OBZmzv7SC1NRDpz8qj7KkN5++b074k778A3NvamsPmWuXxNdYEwDlpEOvKAPG9E7
         6dhZ7jXLP0Py8yTKvHDusNjtJ55+AVGzHmOhEqaG7MyJC8ytWRPs6cJo+4NtsS7V+CiB
         Aq0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Y8E8C+yE5MHCFBvwa5cWNm7L553/azPboyO3J+hpsDg=;
        b=uWBe018M0RxHLhyrHAUS2H7pMZeZuEqOesHeUT6UCq69W81mwO3JcSCPYQBeJC02qk
         zZ9+ONssc3X+CfqdUf1nVbV+MPa0ldlGOZwUi4jB+qlHJCQp9xYkiPaKV+KbsPdLEybN
         UwyPBKEcWt/bOKKpCb6zUlaNMYQlAS5ZrNYA3feLOBKSB5mnrWFx5PTwCNkNopjh2k2W
         XsWvvznxsorBfb/vnoC41dx9Dv65PjX7NyrChZL0zgGbS7tdHuCzdpsGRmeO1K7NElL3
         cJCyElKl/+0m5SHAeERGUUBaB8lBccB2EFnXVF4+w1QNf8GpF3XPFh2zecpqtd7IG17u
         KLZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iQHV0e2n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9-20020ac85a09000000b003ef480e33e3si6749739qta.497.2023.05.13.04.26.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 May 2023 04:26:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iQHV0e2n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pxnOA-0000Wl-ML; Sat, 13 May 2023 07:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxnO6-0000Vq-97
 for qemu-arm@nongnu.org; Sat, 13 May 2023 07:26:10 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxnO4-0005Nn-Om
 for qemu-arm@nongnu.org; Sat, 13 May 2023 07:26:10 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-50bc1612940so19665235a12.2
 for <qemu-arm@nongnu.org>; Sat, 13 May 2023 04:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683977167; x=1686569167;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y8E8C+yE5MHCFBvwa5cWNm7L553/azPboyO3J+hpsDg=;
 b=iQHV0e2nIhR9+XpyWmhzWAPWkKwLluPb/tXEEmfsV0Va8F7ybqLeXRHfsSmlsAIwru
 V9ILt4Zt339H6T89mRJzn/Q3GRfoXYkFvjYDVphUuWh041y9wEM96WCKHlFlThnV+Qzq
 UQ6pkCmBEkgI3dktg29L0GZqO5+byPRqFnb30amxbCxBvSmEQq2eKZXP0Y1CrIj9o57/
 zZFXKHEhgxRbzPhTc9vSB9/2c8+/GVUJ5uZ2u4CORMc3aoMwJXv9/K/VNGCr9cYPPAkU
 ll/GEUYJUP62KQuWzK6l6Q1nyhFnYuU2HBUDrgx+0RWrYh5eC4asCFh21rZAm0ZfgR98
 o/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683977167; x=1686569167;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y8E8C+yE5MHCFBvwa5cWNm7L553/azPboyO3J+hpsDg=;
 b=fEFW7cPaJHzv1q8T78dYwNnBKheAL/VKPpbFSNUK3syI+OAp0lz2U22XXWnfFcbjcI
 ML3goj9+/sbO+xyV+YlCOBg9SgWZOQko+gjTlVZqovVAwkkkjBhveU8KyYj1NaYgy8EZ
 q2o8kOzObT5yPOhxeasD18dGTAz3ld1l5MdNm+2Lqo0XSmiPLBO5sEk33ZYJDw/cuj1w
 13+/L1vnfZc0bysraK/jJE/1twvyiWXJtEDxNXOoDO6WHFgqxXjAnNM3/DWlBP0l86Wq
 XMVfKtXRLBB5xj1NRscINHGJ3WCxsy77h4UaL8xQlRxgZavLyiNC8i5wg4JO8SYLsJTG
 sIFQ==
X-Gm-Message-State: AC+VfDxlSiVtaZbrKPTvtgVq/2LJTAPNbG4bYdQ4rivt60vb6clxVja+
 niZE4uUdMxRWU9IfMTDaH2i4ng==
X-Received: by 2002:a05:6402:128c:b0:50b:c72a:2b1b with SMTP id
 w12-20020a056402128c00b0050bc72a2b1bmr21061153edv.19.1683977167054; 
 Sat, 13 May 2023 04:26:07 -0700 (PDT)
Received: from [192.168.190.227] ([109.144.17.21])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a50fb0e000000b0050bc6d0e880sm4694825edq.61.2023.05.13.04.26.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 04:26:06 -0700 (PDT)
Message-ID: <8d26d18a-139b-a32f-a9ce-12a14232de29@linaro.org>
Date: Sat, 13 May 2023 12:26:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 17/20] target/arm: Convert BR, BLR, RET to decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
 <20230512144106.3608981-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230512144106.3608981-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.923,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 7jrIPSaYljM0

On 5/12/23 15:41, Peter Maydell wrote:
> Convert the simple (non-pointer-auth) BR, BLR and RET insns
> to decodetree.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/a64.decode      |  5 ++++
>   target/arm/tcg/translate-a64.c | 55 ++++++++++++++++++++++++++++++----
>   2 files changed, 54 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
