Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3700065lfm;
        Mon, 24 May 2021 09:25:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzU0W5ks5RLgyE9crtgvTIdAHAKow8WdjQJWRCPsCpafz4h/T/epaVFCM81HASrcnmsUN85
X-Received: by 2002:ab0:2690:: with SMTP id t16mr23638103uao.9.1621873503506;
        Mon, 24 May 2021 09:25:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621873503; cv=none;
        d=google.com; s=arc-20160816;
        b=p25SSVoTxuLfDnS+FDzVSP1XsQxHkFVecuLursHlI1dnWZStcy3rwcTVXCoMwH5j/+
         kj/Fk16NJBIT4VGGqSateQONLA2w/GTu02fnRsMsfFz/RcPjUGljZJUXttn0Z6cL4uTB
         NQWnA7GJQEierh1bLq6uaK+FUn1OGUXUJEFMA5i9bhwXLoMnpVxkYIzzn6cm8mVMGrFP
         1RLLdabJPZUqLvVMnxIHIlDOsPtmSC8Swmf84xvzmfjspGlKtCAKHb4vf7rSbpKfEY1F
         muJ5yYs/u5m6yM2kcD2evrMh5oTsAbOGRLcshSbWgzdAgRdOO+UkL06QbtLPIL75U6WI
         B1aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Ktzs5cumnsK9N5nDGlFql+ypBat+qBxvmGxMJ4SUhBg=;
        b=OUEVBK9o2Ty1a5ssWRHB+qc0CXqDjHMyOaVlq8UeDSRCgY4x5K4Hqe/SvU9nU97OeI
         yWV0kLEgLC+/pPupWrwQ4p36aX1AJW/lPzWuLYOb72BLeLrFA4wvVOalFPvOzAAY+j+8
         c+uCbrnxbWh0TUT14bZQSDx32iDJkOZmlgAdsw1kJuYWUHHYGdX8csvj6G87L0pkjKEu
         hqL/3EqWrIB5fPfEo3iQRRKkBY5oQNwj7cyi7/CdxTwB5UjcVQocKjPUlPpiPlp2gcJt
         wjUthuHzeorq0/u3VzrxfY2mRa42kZaCq6BkaGXha+Ehq6A8/xe8o3hu2xxFJi4PrThP
         vAuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fRkFL9Bz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7si241851vkg.3.2021.05.24.09.25.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 09:25:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fRkFL9Bz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llDO2-0003CV-MD
	for alex.bennee@linaro.org; Mon, 24 May 2021 12:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llDNl-0003AK-OT
 for qemu-arm@nongnu.org; Mon, 24 May 2021 12:24:49 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:43814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llDNa-0007AK-LC
 for qemu-arm@nongnu.org; Mon, 24 May 2021 12:24:41 -0400
Received: by mail-pg1-x533.google.com with SMTP id e22so4726416pgv.10
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 09:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Ktzs5cumnsK9N5nDGlFql+ypBat+qBxvmGxMJ4SUhBg=;
 b=fRkFL9Bz+K5RgYfNnSG+v5h5r08GUdGHMU+SD1nBeexJITDpJkRxdszj5orXY8oBtd
 I1/eKGDdM+9NQLummAXEITTJ09kM3KQMtkuVM6Nax9LXBUz7RZVZoasyrXuVzFBFHBBk
 ci2wRcmXpDwBPKfBKxM+RHcHmDb/wF2i3WYLNDy1aLMjsC1wdndmXy1EBd0Gs7io03m4
 1ZzYe4GlJQfs8145B1EQ4GhnQ340Q8VcQ35y+7QI/xMvfgZ7mk6ksO+p6PbjqAEsC0Eb
 h8AfyY6QMeeihaP1Qc8yY4FoEMzzBdBwpoz/16QTepaXcKoAyDD7Us+pRUgxTaEpze9g
 eqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ktzs5cumnsK9N5nDGlFql+ypBat+qBxvmGxMJ4SUhBg=;
 b=g3hYj6M8XVgFHZrQbx2kO/eRoG49tDc8/PtKJ2UgA9hJSPL66EPE7gCWyQOoV7gqdK
 c0XwTBghZ39/c7VCxZ49qeRZtRnp7uJ7QvbKxv+mvTHL2y+F1PdTfldUEc4ZqZC7fDtV
 ivmVh8Yutp0Kj9aGx1PAJAfjtQHd0PD/dSbRjQapYzhheNOQp0cYLX1OA4tgwMw/BXJO
 fek/8XJjcXNhaS1Bvd458YqU0QBB0BQrWlWuA00pmpyjd3SI53dyCRl+PPDr/fr4rgE0
 sy/hskDpX6/JvdkUjS9V8JpuBaACG1NbEK5WN5GockRAgiVkR5TzzL4EmD3rBO28/+5B
 OTaA==
X-Gm-Message-State: AOAM532lQ5r3fzGrrlaTkVuFJYgTpB+9D+yS7ri7B6loyMi3XzPposVm
 8jP0vSkTyx47L0jEOVplakNVUg==
X-Received: by 2002:aa7:8201:0:b029:27b:9b59:8676 with SMTP id
 k1-20020aa782010000b029027b9b598676mr24922941pfi.47.1621873472898; 
 Mon, 24 May 2021 09:24:32 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 13sm11641459pfz.91.2021.05.24.09.24.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 09:24:32 -0700 (PDT)
Subject: Re: [PATCH 3/9] target/arm: Move fpsp/fpdp isar check into callers of
 do_vfp_2op_sp/dp
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210520152840.24453-1-peter.maydell@linaro.org>
 <20210520152840.24453-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d0a6128e-cbd9-79e8-9062-c20fc901d328@linaro.org>
Date: Mon, 24 May 2021 09:24:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520152840.24453-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
X-TUID: iixQVncaWAJp

On 5/20/21 8:28 AM, Peter Maydell wrote:
> The do_vfp_2op_sp() and do_vfp_2op_dp() functions currently check
> whether floating point is supported via the aa32_fpdp_v2 and
> aa32_fpsp_v2 isar checks.  For v8.1M MVE support, the VMOV_reg trans
> functions (but not any of the others) need to update this to also
> allow the insn if MVE is implemented.  Move the check out of the do_
> function and into its callsites (which are all implemented via the
> DO_VFP_2OP macro), so we have a place to change the check for the
> VMOV insns.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-vfp.c | 37 +++++++++++++++++++------------------
>   1 file changed, 19 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
