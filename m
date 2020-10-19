Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4005546lfa;
        Mon, 19 Oct 2020 09:13:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyD6c+evFdbHRU18QO48dde00Jy0reP7H0AcfCkVDJwebi8oI4tpBSln/le2JdJJ89yjB2u
X-Received: by 2002:a25:cbc7:: with SMTP id b190mr604913ybg.288.1603123979932;
        Mon, 19 Oct 2020 09:12:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603123979; cv=none;
        d=google.com; s=arc-20160816;
        b=MRjhhLb5k/TrYwUAentPbRBBcLKVashwYcVvbYxX23DFxeWWWmnkDwN/lS1whbD4Vs
         JB+8Weg+S3JVttUGWeTvOEYYjP7SPc2uSPKlIgWNkvEFkN1Md0gks+bZIgBoviDmyR1j
         SIiJe5Ejgw2l69hZ3MT5GFVLMoRYqT5Y71XfRyABy5MbuRzJ0vr+FFm+JGuAZnlPTR98
         ybvNS/fjBmquFEyvYvR9FGo7o2rPISN5S+Wl91X7QfLg134P4OIkmHhROG2foBXz66dz
         qhilph56i25UU+ZN7jhA0tYay+gvcU45WWwSB83JXbAyI8NZr26NwKA2xl3fGCHTinRe
         CHLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=vWWfInR+InkSN5sSTc39Bjp/6w7xCgQse7gaM1O3SL8=;
        b=om6Vp+c1r21Drz0lTq8DGxaz7aEf9aUfIVMecQhEVWk6EkvBj7lopGWf92ch9Cou+h
         WDnzIGa6+CI8+LyN0zXAOK2hJljtICboL4IgB6vKzK6wREts5S9G1x6x5D3zJrgnTsYP
         u2lqNaikLLu45CxKdMTHQ16H8hVuD1WGiGuIb/RMMmcF+3D4x9Kw6tpQcU31D4Dk3maK
         Zh/kcmfW29n0D1hiLpD/k8e40MMaCkSbLxxt29ov+wNvxnMRK/UERfmGQJ4BcNvqnQRV
         AMWOd+pNa9lt9DNBkJZlwgGPjV+j9kIEJj2uyfU6QZ1evHGdtstzFzK7FubLVctgJcdO
         /Fpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Uu8oweKM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t9si464932ybt.157.2020.10.19.09.12.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 09:12:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Uu8oweKM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUXmN-0001lm-7G
	for alex.bennee@linaro.org; Mon, 19 Oct 2020 12:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kUXlF-0001io-De
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 12:11:49 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:33792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kUXlC-0002fu-Ix
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 12:11:49 -0400
Received: by mail-pg1-x543.google.com with SMTP id t14so248923pgg.1
 for <qemu-devel@nongnu.org>; Mon, 19 Oct 2020 09:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=vWWfInR+InkSN5sSTc39Bjp/6w7xCgQse7gaM1O3SL8=;
 b=Uu8oweKM+6OKL1nf+NLU7q+YDR/zcM5dsPfJxhe9t0GzArpxe0tQc+TxV+uXjEVMwb
 r0MJLpykBCC3YZHgxxcaEkTQ96c5PRwL2sH2gxPW0VP9CYiNY/sCYu/J81t0Wcz9Pfak
 yRGCvDbpAWrdHwd66Q+yx1U2PPFUNmKPd8/GVSXZZJ+6IMgY3iCayGkG9Y5aTseqZW+L
 lcUqmtkJaaVljXMtA6ySTYsHZSNvoQ5vFe64K+CnSSkoBWqYliAOwyG/HlKlNmC6rgGz
 x3pwergW6QYpRI8Vt2Q5rXO+zZdfNaFUgCZRtueHVCX1bPiWwuYwPNXnbWbAoMpYD4NE
 Oc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vWWfInR+InkSN5sSTc39Bjp/6w7xCgQse7gaM1O3SL8=;
 b=DRq+IgIXqQYPEV0NDdM2wWeQSGmEFP1sW2AQZX2abSa1Cpg5lZSlhf26E/JilktcIS
 raQFWFXzRbxgTVLr2DtW03vlMsnHQk+mhziwteo3Ip6R7/vAm7H+xNn8Cr0bOTcD/VVp
 rUhmHDb4U0Ic6KmgLmI5SrxKewSPi3e6o1i7oWYMZ5pTzuO+IXUvGEfwn2G0IcglBMjv
 6nyYHPlnw60BPsC8b79BYaZ2EOQ+ujmh0xA++1buZa84t4RCc0dDIazOx+KN3XEwglvi
 VIoxVrTXhT/iZFP6x+iBH3QJ0KclCcdzqlF4jf7/CKRin0Wx/UqyheE1RaoK24h0kak8
 +zgA==
X-Gm-Message-State: AOAM530xDKQ/nyn+dmiMs+qTk3KBKuGdwkhIUBWpLVK11kpze/iTFbaz
 kdFh4rLOw+eyHVJBBswycsYYHyXA3yEXMQ==
X-Received: by 2002:a62:1749:0:b029:156:3399:a7f6 with SMTP id
 70-20020a6217490000b02901563399a7f6mr251226pfx.79.1603123904568; 
 Mon, 19 Oct 2020 09:11:44 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id a18sm30461pjs.27.2020.10.19.09.11.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 09:11:43 -0700 (PDT)
Subject: Re: [PATCH v2 02/10] target/arm: Implement v8.1M NOCP handling
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201019151301.2046-1-peter.maydell@linaro.org>
 <20201019151301.2046-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <037b3fbf-45e3-eec6-dcf3-76344405b8f6@linaro.org>
Date: Mon, 19 Oct 2020 09:11:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201019151301.2046-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +hL6XLzifWMs

On 10/19/20 8:12 AM, Peter Maydell wrote:
> From v8.1M, disabled-coprocessor handling changes slightly:
>  * coprocessors 8, 9, 14 and 15 are also governed by the
>    cp10 enable bit, like cp11
>  * an extra range of instruction patterns is considered
>    to be inside the coprocessor space
> 
> We previously marked these up with TODO comments; implement the
> correct behaviour.
> 
> Unfortunately there is no ID register field which indicates this
> behaviour.  We could in theory test an unrelated ID register which
> indicates guaranteed-to-be-in-v8.1M behaviour like ID_ISAR0.CmpBranch
>> = 3 (low-overhead-loops), but it seems better to simply define a new
> ARM_FEATURE_V8_1M feature flag and use it for this and other
> new-in-v8.1M behaviour that isn't identifiable from the ID registers.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h               |  1 +
>  target/arm/m-nocp.decode       | 10 ++++++----
>  target/arm/translate-vfp.c.inc | 17 +++++++++++++++--
>  3 files changed, 22 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

