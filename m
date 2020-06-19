Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1037964lfm;
        Fri, 19 Jun 2020 16:28:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQtxyhuGLJlKw8YEZ/TqaIj2poiWfxkAE1bOCWrWaPeAk9tcJINdSXUK69MtzPLuEnfrB0
X-Received: by 2002:a25:c054:: with SMTP id c81mr9924090ybf.76.1592609315822;
        Fri, 19 Jun 2020 16:28:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592609315; cv=none;
        d=google.com; s=arc-20160816;
        b=ZcwqCaGwKe6VrqN0+1YtPlv7b4vZEoi+Jh/crKUnRiU4td8802RzOmqTCoU3d5XmSR
         ml7/+BTuJhWXxj3K9WWznuxYTsu3d6aMRO6sr5RL+K24s339q59fmRxxfzMsraLIQLdU
         uJzJHi2r99XNxFeOUTFDbZecRRg6UgW2L5qTbDGAcwluDkTON2/4mHA3D+S9hAvpxIST
         ifcuPXOOaeaYK/PLjIpV9N43v5ptDtvKbQd4OSGGp7Ho2lVe3f/YhTT6AFCZl66y6AN7
         oQuIs99pdRJV4zQfJsz7+qQ+suW+RhsrbUvNR+BtPXtNlkZUFfrdEhNLNw71+4gpLDEx
         z3IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=gbQm5eWleZFDOgpM096MfYeInZ2+1uK8ASU4vAz28qw=;
        b=mzwB5jok9rTTLXHGgaMEyiIb1cUVjDQoHeFSwWS2CdvSO2NO6Zncr+Cw5qp8y/uz9H
         U1YHtLo6KLQTngxxNUU8jCftL+rjhkSyrJwUIxUY4rJoQnGmL4+12dYX+zlljL9I6yQ0
         BATQN4fiIG4w0WudscZPjccsbO/D2eN0rBIa+M6BERgMoBH55W49qLuAoXIA58LuJVlm
         pn3Taie7RRG88v3kEgTSYCZWpIV81fGzAOuCdWI+XOgcqfQxm0dsUG9ZNKmquEdJIldJ
         B+czfN2iyG2+a4rlwrzeyinlgE3xOv+6Tum/TEdKarEaglaBCbpTINhxk0xc1F3xGC3t
         4Mug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r5gECndQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e1si6177991ybn.176.2020.06.19.16.28.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 16:28:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r5gECndQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmQR1-0002rX-71
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 19:28:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmQQt-0002rG-Dm
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 19:28:27 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:43357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmQQr-0008MR-N3
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 19:28:27 -0400
Received: by mail-pf1-x443.google.com with SMTP id j12so2905410pfn.10
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 16:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=gbQm5eWleZFDOgpM096MfYeInZ2+1uK8ASU4vAz28qw=;
 b=r5gECndQea4BnW1oWj0vT1D7qOC31GATadsIid5gX/Uhue8c4tKBiGTLS65RSkZfsd
 QKlWJoyvBc0ZeEk6rxtfGzVjhxSeQBCqgDP03NvWuJ5V8At/z0lMR/HFqGaUAHxgT7ob
 pHIqrvG+mwYTmDZqFbDYlT0GMppPDOGPxZsJDnGuKxit4UHJTfvLULSVao2oLKGlE9Dh
 EQDPTbj0acHNvqWGi/hT+t85qdWEYtkNceKFVValhjA2XNPAcNKSW3PlXmBNjCirXsjs
 gEA+TmasQs3glfl+6Y0gaNhg7HxeMrFBUrTZxY6kMNjZcbpT+2Y7ef4vDj4zsHQ7wyYM
 /hpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gbQm5eWleZFDOgpM096MfYeInZ2+1uK8ASU4vAz28qw=;
 b=D9PkoQmnqg1G/ekab3djSeRVlGu9UaHBAZXbqDSXwnYWzWkEsTiSX/XzI0ywAR9ISl
 sIIAXquaNv7AXIYPMVL9ErJBUHf0ErQ3hvlawF+bAYyKBLQZi1BnqyNg6097Yfy/NJMr
 GdbyCWxC/EV97GWGROpI1M6DvKB0qTKBmrNXEjDAjXRsGp4xkFrhMP3MpnmLNnUYuSQ5
 0yHThO/W/EIp/sEoXZUOOwNPJNlxdHTiMxDWER6YjdqARTRgOomclh8kowKe18PfcTeW
 KkW+0YN4zdDWTrlTq8piopI1/E1fFdAfa50INxA5Zi/7pW728julUCHFOr+sI2Tp49u+
 2tpA==
X-Gm-Message-State: AOAM532cIZisEIhmju3aGPBFEskHnOIfx7E2+Qthu56wzWwn8mS4ah5p
 LE3dd51dFJNXZAs/Ar/W/8oJAQ==
X-Received: by 2002:a63:6c49:: with SMTP id h70mr4821331pgc.150.1592609304152; 
 Fri, 19 Jun 2020 16:28:24 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id x2sm6957202pfr.186.2020.06.19.16.28.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 16:28:23 -0700 (PDT)
Subject: Re: [PATCH 09/21] target/arm: Rename NeonGenOneOpFn to
 NeonGenOne64OpFn
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200616170844.13318-1-peter.maydell@linaro.org>
 <20200616170844.13318-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b42edc59-7bd4-9f65-66f8-1cb718a8c722@linaro.org>
Date: Fri, 19 Jun 2020 16:28:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616170844.13318-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
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
X-TUID: cviV/PogxJFb

On 6/16/20 10:08 AM, Peter Maydell wrote:
> The NeonGenOneOpFn typedef breaks with the pattern of the other
> NeonGen*Fn typedefs, because it is a TCGv_i64 -> TCGv_i64 operation
> but it does not have '64' in its name. Rename it to NeonGenOne64OpFn,
> so that the old name is available for a TCGv_i32 -> TCGv_i32 operation
> (which we will need in a subsequent commit).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.h     | 2 +-
>  target/arm/translate-a64.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

