Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1048321lfm;
        Fri, 19 Jun 2020 16:46:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJPkfR3d/prMiNNxuF7zo72gaDVRwKYeJi2g0a63kMTMVlIWKT1WhpGGi6+t5ZLKfol/VK
X-Received: by 2002:a25:bb0d:: with SMTP id z13mr9738023ybg.417.1592610406995;
        Fri, 19 Jun 2020 16:46:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592610406; cv=none;
        d=google.com; s=arc-20160816;
        b=XDg1CZR+otx3oUqa4odRHDU/vEkp3h2CYlPhgJhQJJbNWs9HwZ8ed4b2m1lorccDWq
         pcl+Ysa2CILm+LmC3HjqK7wifEyUFH47KDYnJb3rq43AQ9h2+J47+rquMG9ZEeGm1ldP
         dWgNzE6/f4RlDj6w+qUpDkFa0//UOh+Gq7V25WHOgnhCLFwoiBlfQ7IWF4KBtEvbnGMb
         QPr1Ytmgko9pGQvlXVHaaKJPjLDD325psGZr/+vYHPJvf9bqF9Q7HGIBBHL+td/Ji3D2
         19Z+RxIwFMBxm8v8yjqIxpcFeWhz4ZI0PBNL3JKtOfKMC9htFvcu4ewHYVnBBrumZT87
         lOfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=patXfXvHSAhs4OxUEourPY4HPPp/uRhGUONW69Dqhp4=;
        b=zvbNB1JuIWO50n3ikc+BHi24Pn26TuW9GKE2Ef3c3LO2MO+Y5/Xa3wAvZ52lLp9hug
         BZnMEQEe7TQg6Npm43MusjqGm7LEs+ZmUUR+7CLkyQRx0xYw1vNl1R+rNqRVj13X80kO
         buK6dnd+7hthOGTXOikw/rGVo4tg9nQvCxo4X/LyWWASdX6I8tYWuCD9AzJrkaJmhNCs
         /eX7pF5CG2frprIaOsEsLnC088FOnA9M8wpHBVEU5oYo9+bIjR2YPOqqYj8CXutE2uEQ
         zDIZOoVAllLfa8uE7q0zijHQ08b5MUD+RL4Weet00v7H9MGFjeBOTOwjtVh3mwJuzXzP
         c3GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WW+w5RjZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m66si6405042ybm.313.2020.06.19.16.46.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 16:46:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WW+w5RjZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmQic-0002Jg-CI
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 19:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmQiS-0002J6-4N
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 19:46:36 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:42658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmQiQ-0002nr-CF
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 19:46:35 -0400
Received: by mail-pl1-x643.google.com with SMTP id k6so4577860pll.9
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 16:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=patXfXvHSAhs4OxUEourPY4HPPp/uRhGUONW69Dqhp4=;
 b=WW+w5RjZkeGRuC1coSjBBgv7+fdjOz3W1o2IrEsfbogvXQR1JwQElbmNwka6PLBFCh
 mcl1Wj41UaJDCIkx6akkF/jUZ3Grbt2fYckMs3YW2cJOlTllcMZ3NQrKUjlPpSpculBC
 ia2ZCFXQRCY02HwXkil3+aqgwCyDNea0l4jOzCefDqiIfto/+Is5HYWIJs325KgMILr4
 zQYtEN0yoIR2x2d3WEIjuY+SchfCnCJSD3/C4Rcm7k5MzjW0Zm2G7zUJZUGo940vh99A
 SGPaHEnjU+JlbRMHrA55niVaK1XztaFBajBL8K4s4KwMQ/fT+LVtaQflAXg1x9T0eny6
 WdKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=patXfXvHSAhs4OxUEourPY4HPPp/uRhGUONW69Dqhp4=;
 b=WMSEg7Jj8kctskyHNs745E2EWgJmDFS3bMF9RYc5AEU4/JNd4tRdPfRdLvByVUOQFO
 m0bEBh84eBGItrN9hmsPANZGviKKHhSwvuswAOWKERsVwOnpiwD09J0X+m7b3eYPHfZ7
 zgJklEQQBHoiHrMuJpGo3TwpcsLD+taajNR8DW3AaJKJgyw7739cm2/jAcioLe9lpO3A
 ruy4NIZOU5Lg5kpgVYBn4cL827b6+PrVXpORR4aGAMn2dudEVCpqgs3W7YEaslET1TS6
 QJEn+Sol5U4YC+7kU4CBnOfhnxuCWUzXVJLoU7gLL5umMyQoQiMEZOmoaNfbWcNRyGZE
 8PXg==
X-Gm-Message-State: AOAM530shbfsVx3nVuKvH0aug0bRwsLcTisGJY0bx5CDEaR6eFvRwEYq
 btekT0staBbJ0HubfkhK3eyEJa4mf6E=
X-Received: by 2002:a17:90a:336b:: with SMTP id
 m98mr5854357pjb.38.1592610393216; 
 Fri, 19 Jun 2020 16:46:33 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id j130sm6911972pfd.94.2020.06.19.16.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 16:46:32 -0700 (PDT)
Subject: Re: [PATCH 16/21] target/arm: Convert Neon 2-reg-misc
 fp-compare-with-zero insns to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200616170844.13318-1-peter.maydell@linaro.org>
 <20200616170844.13318-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <96abc864-e978-4a88-3be4-cfe6c94510db@linaro.org>
Date: Fri, 19 Jun 2020 16:46:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616170844.13318-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
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
X-TUID: gx9ZWt10EQdE

On 6/16/20 10:08 AM, Peter Maydell wrote:
> Convert the fp-compare-with-zero insns in the Neon 2-reg-misc group to
> decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       |  6 ++++
>  target/arm/translate-neon.inc.c | 28 ++++++++++++++++++
>  target/arm/translate.c          | 50 ++++-----------------------------
>  3 files changed, 39 insertions(+), 45 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

