Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp5690134lfa;
        Wed, 9 Jun 2021 12:43:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcx2c2S6fMTU37gWdAbFNVPbd3R3W3rL9DtqbMVRmOEY9tLhF8P1JVRVquJ4WElMKckj66
X-Received: by 2002:aca:dc45:: with SMTP id t66mr872353oig.4.1623267800089;
        Wed, 09 Jun 2021 12:43:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623267800; cv=none;
        d=google.com; s=arc-20160816;
        b=RIWF6bzbRf9U/BP86cFxdbDQhfdObnS2P2aDl2PcjrIjX61qmV9OPpYk+1I8klfaSV
         K1N+4Toq8zGqYCn5SpayO0F1jb2MjkxgpCMjLCQOk3GxGEHVYzy5JqVUNoZmglvi720H
         HQ6LyEUPB/QxpM3DFNk6oC/XOyuweecGmi0pG0a7TuaypmmvzYyxQD5LYIzZ0w/07Sfw
         Gj/841mCUThlhQ3JdKdP/5wPBRuQJV9XEbUILmD/KRz0lWwVJ5lIYOrn+EcUduC7s7Um
         0ZHlsPRwjCIHc+nx0R0WWqA1W7AlaCv3HaBpwpmjsl4TQMNv+RStXRbwKN7XwFKK3hZG
         EixQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ZZkThZKG7Pw2qTggayKugxE4qKXM96GOTMZoOCt/+aE=;
        b=lxRlCF5tjq8rrQYR4W4gpHYnCTDKzjGK+hMc06BU4a2iIL4R4JhU5Im2xsHGBslVfv
         yjwWWISoX0176mnPD6EXvMpbOAKF4N1za48xRhk1FB2E+FXANzy9JveWqwOqPhPVAofZ
         xpvtB1dJVC6ldLiHJo3U+AP3MVfBQqFzsyhAWqMCf8edlon/402J/gwitVU1nx8vI8Rz
         DbGOaphQLAJ3whR9IdgEw19VUXnB8EbUYg6+OsB5HQH+CU/+i/3DefSZA5D6IV3hAhId
         MaF9sH7whV2cd2rsw8xQVfRmT8R/FUW93AL3dpp0oPKCvPDDIbp3UN+mH8K3aQrb3RSc
         zHMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XnByP3R2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n203si876590oih.267.2021.06.09.12.43.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Jun 2021 12:43:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XnByP3R2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lr46h-0000TH-AL
	for alex.bennee@linaro.org; Wed, 09 Jun 2021 15:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr46Z-0000SD-UT
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 15:43:11 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:36364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr46V-0004VB-D8
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 15:43:11 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 27so20503095pgy.3
 for <qemu-arm@nongnu.org>; Wed, 09 Jun 2021 12:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ZZkThZKG7Pw2qTggayKugxE4qKXM96GOTMZoOCt/+aE=;
 b=XnByP3R2XQ4BQdeaBI5xe0EbxW24HO1NpErk34/gbEQWVJNJ/L6CgP2k2+3U4riy9G
 4zNBV0kHIDCqBRNjgWavsDa+rou7W4ksnV+aPekvIgOXa+iFFB41q75bCLVKMfXuKgY0
 BxaLXzKigayF6TspBfSYVJ1jLJCrfben/lMRVepk/RFsvlGFe91mC6RUbx8Rkjgm5MJS
 Ab6gx13FbT1EQfIl6vR5l4w1cY7h3Ryo27jK1wdDi5jAv6VmiAu8Y12aToiRoCwPXNTQ
 K3/9ZwX6sf42sLZPlYRCzRzlDn9rz56nlYdrCIaoOjrS4Kdir0M4zzoWQPfedVoLq1rn
 fc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZZkThZKG7Pw2qTggayKugxE4qKXM96GOTMZoOCt/+aE=;
 b=CsULL9Wb7SSDJ/qVuRAbip4VlEdsQf6F6Sn6zudek23k4zbWn8hEewI8StaGfbGI2j
 9T0NQDyXNrIWC7uqp1EZGbI1IefZtvfls90Ni4vou+5x+vqu7YsV8QHM16ATrq/74Pf6
 LISdQ5gCMn7aKTnx+BzIFCtAzz4MLXerfhtt+r0a2wViqkicfVr33XUC/nwtFyFZ00lM
 cjiDERLdCJo+GyJ0HYwk1h1Mw16S8ceNaZEIe6jA073tx5af2HYoBx3OMTbfPizFPBxD
 NwRUOfYoj6lbjhfh6nsvoRU0tBaIBS0/YxbNG7sMm4MyRzKQTNGyMTV1VdZ3mckxFU+p
 iLHw==
X-Gm-Message-State: AOAM531KJBunMHZ+pokLaKFHuCb69RAT+1HraKOKiSJIXcZ+4dvfImOS
 ZWj0Pe90l+cBA3etB1LVjMhSTg==
X-Received: by 2002:a63:2dc2:: with SMTP id t185mr1259508pgt.285.1623267784882; 
 Wed, 09 Jun 2021 12:43:04 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 a65sm324677pfb.177.2021.06.09.12.43.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 12:43:04 -0700 (PDT)
Subject: Re: [PATCH 46/55] target/arm: Implement MVE VRSHL
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-47-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <19c37642-13c4-117e-02f5-02342a0f6eaa@linaro.org>
Date: Wed, 9 Jun 2021 12:43:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-47-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
X-TUID: xiqhLQqLWOP2

On 6/7/21 9:58 AM, Peter Maydell wrote:
> Implement the MVE VRSHL insn (vector form).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  8 ++++++++
>   target/arm/mve.decode      |  3 +++
>   target/arm/mve_helper.c    | 36 ++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c |  2 ++
>   4 files changed, 49 insertions(+)

Similarly use vec_internal.h.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
