Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4974252lfb;
        Tue, 27 Apr 2021 10:07:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3ZHAFzb9mtDASgU66pq8SUK3TYF5P7vINPwvxySosR1lIiJYHKsJk9bhxa8qRU7TcPEWV
X-Received: by 2002:a05:6602:140c:: with SMTP id t12mr19223458iov.169.1619543277159;
        Tue, 27 Apr 2021 10:07:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619543277; cv=none;
        d=google.com; s=arc-20160816;
        b=D1wziDNLRf5MU1r0wd1Sy3IgAkFN7Pylp/7Nq2WDVtv7TmRwOssQ1enZFFW89B1+hl
         Ozjab5yGk/HzY+QFdDk5pV4535vo41QoGS+xp8QeDVG7V6nJtJdVp8P2uyWNr+po+orJ
         I0KcGMjjVjkQDRe7ok/dX1WBdhBNk3prywjCqZTVwon5eyGu8E1cBAN0ogPSOgzmIuWJ
         wzZ7WU53sfNiC3+PE12hq/7iMCxENWII/Tkp1HJybV/t6WOIYtcsgJTqr3XxHSVXFrOG
         yOgqifwBSHN2PJJ6ZRs4LxHJPvhfRSWOmhdHby3jNGYypGJRfceb6eU56nMJ4EqEF7ob
         eQSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=zzmyKW1k0ayANrIw7lzrief/gCdwmp8lceTL0V6I3gU=;
        b=Ua/HXtg8vu4MqAjjIit/5k79KOp2P0kIh4m/BYNoW5Ad9AxGmtQPZiiTaeeUosLGjy
         8i6jO3BLeEYnWHFx44cV+c4Pwzra1sQszlw1fcxAT7+4f1g9uNnjLdbfRQtDOGde2TWI
         BEqFJX2qkhKc67njJErs7+2hpcfmyf9Hg8uudh0Fovec13rKLchqetLJDH/O8uX+9x2G
         SRyURLnsQCFhBFhEQWuJZh5J0DmJgstWxTZoO+RndbN/A6zJ3oBJ0tacM6hTV8H63S0g
         uk6vsHeF4r1C19uO3A85yuQupOZ+HraWG+IbWI7PBk9AvlNX6OCx2TU6tdj6iC97+K8Z
         //UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LJwpaZcJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y9si374678iot.80.2021.04.27.10.07.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 10:07:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LJwpaZcJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbRBk-0000lW-Gh
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 13:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbRAV-0000Q0-Os
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 13:06:39 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:42918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbRAS-0004gc-Q3
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 13:06:39 -0400
Received: by mail-pl1-x62a.google.com with SMTP id v13so17649840ple.9
 for <qemu-arm@nongnu.org>; Tue, 27 Apr 2021 10:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=zzmyKW1k0ayANrIw7lzrief/gCdwmp8lceTL0V6I3gU=;
 b=LJwpaZcJx2O34HrlGgzB4SA0qRzAzdzP6q1b+rsRbb6uk86NNxeLrZyG/kECLfAQDo
 ekI/Q8tWON3RLGR6Z+qI2NjWpGHVPPCr/DwYHnGsEVbsMqqWjCAEd0dzG8nezYirS6dK
 spmbIglGbAeon0DpH4FvhoV9qMMntTw8OUS6aC1LEllSK8uJNogu93uYOOnch0hVEKyI
 MGUnSPIr44wIu3eiw/AecgnH2Vfk5wbp5KAaJeOyxBmxFA/R4c/S5y1LfXv/Kep4VeNn
 I3kGhqJnxnyot7F2hkJI2Tua/toTckBizFGK+gY0w2EPMVi+Nzs/l4IGKEBGLbGUQNNY
 xxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zzmyKW1k0ayANrIw7lzrief/gCdwmp8lceTL0V6I3gU=;
 b=juhlWX6+FCPOoDijv6JVPGD2HbWOIrj5siOY6Iq7y//ST+Kup6XTRfHp28Uudl80rx
 tGCT2Kj3DebU7ulzclAELs7lanD/kiGO6ET/w/X751fyooyPvO5TqVzL6v6AyUpH+3nH
 D/ZIKpsG3jnNU8IbpR3AITprauJRrO3i/eN7jiIZegmibXRXawKJAvlffG9Wc6APQkQh
 pkvLpHniIagb5woAECMKk5BOC8qWCy4cr764R0PF7WyP9IjTCfJexeWdRE7qNKuH2GCS
 oy3dS58GJVSZeR3wKsTMlUTR3A8m22LapYruBkM9zGTcxeXDEC0fM+dz4Azd27NbChxT
 C2Aw==
X-Gm-Message-State: AOAM532TtvH/dEoteFKFnY3W3+17Q8OIA6RP8PaQNOKEGc244cVQEgn6
 963Wq9a3c9AaTUhI7NnZBLtrqw==
X-Received: by 2002:a17:902:6b05:b029:e9:2810:7e59 with SMTP id
 o5-20020a1709026b05b02900e928107e59mr26007466plk.76.1619543195157; 
 Tue, 27 Apr 2021 10:06:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id j12sm3595507pfc.17.2021.04.27.10.06.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 10:06:34 -0700 (PDT)
Subject: Re: [PATCH 08/13] target/arm: Make translate-vfp.c.inc its own
 compilation unit
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <afcda2a6-f0ac-c654-ee92-701810f522f9@linaro.org>
Date: Tue, 27 Apr 2021 10:06:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: iuliv42kvJim

On 4/13/21 9:07 AM, Peter Maydell wrote:
> Switch translate-vfp.c.inc from being #included into translate.c
> to being its own compilation unit.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-a32.h                          |  2 ++
>   target/arm/{translate-vfp.c.inc => translate-vfp.c} | 12 +++++++-----
>   target/arm/translate.c                              |  3 +--
>   target/arm/meson.build                              |  5 +++--
>   4 files changed, 13 insertions(+), 9 deletions(-)
>   rename target/arm/{translate-vfp.c.inc => translate-vfp.c} (99%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
