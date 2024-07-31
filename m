Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp102436njb;
        Tue, 30 Jul 2024 18:43:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWZTOdlVAleEGdNrW2maS2v7x0SFJ8O05oQkSgtd5GYM05PaMZWNw94+OMhwNoQ+It/CnNP7uGSuDQ/ohKAnmExI68wahbX
X-Google-Smtp-Source: AGHT+IHbzOq1WJ1c8+nQTyh7eFHW/pTLxxO9l2d8mrVVF4jGLhezS4y48609+ahtHQ8s93jgu6hi
X-Received: by 2002:a05:6902:161a:b0:e0b:587e:31ef with SMTP id 3f1490d57ef6-e0b587e349emr15899244276.45.1722390220858;
        Tue, 30 Jul 2024 18:43:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722390220; cv=none;
        d=google.com; s=arc-20160816;
        b=waklpvYDkLul/ZvKnVN2VxvFCMe5/B+yHzI4yaYvx2FWnOvfQeOM7BUBFOYmsUY6XL
         LrgEvyh4vZ2oMjYCcHkruJzZIDANvMIDRIgP2KZe/nVtrCOHkrhrrl9yTbwpMUbBAl8A
         5wjvXLgzaBLUjLNJpUNJdiJOmgprqBbUN+dxziXbfVXzWNro2F480D8WHmz+UZWED/SU
         Pp7UUfq7jxptmuxGc6DWujfFtoy477FEP3izrwtQ2I5ICa0JqwIAsWzJdgFtxf8/9EYZ
         Ul5pqK4zj2+FuFK59RDYMdsyOon5NPSrzJqXHzikn2ciLbRxsDi9eZ8gqP8l3FH0gMJr
         jQAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=lLwu2gkiCoWTaWrY0d/KXhMgiZTSQZ/koPCoUhxmO8E=;
        fh=FtPG+AcUHvDEyC2WuE8GTw0p23XKA0gbpv/5b8/NhJQ=;
        b=xYXKrMD3NHXVy+wFylJJDkD7FClZIzM30i+a7CHCZ1OLm9WHa4oDMNz+DPGELsIeGQ
         TFs9BndcG0o0HAVrPeDsDiL77X8jgmwQ97TKkpe6ZY/lNM/gdGw3U1QBdpNjeiNRwXzx
         PBeZl185qmfvZovvTjqnhtJUo78WQ4YMmdLpf5yaftYJzCBEFiz6HtsZSM8WueVG0sDu
         0EIP68f+r0o/22HCSfs+xwnOBBL1p3yugmGRCs5wq/eNgXqx6fxtbMfNxTOnpV1sBHwT
         GKWIQMl1vqSZ+50u+t5yONzhAh0uaxHeA3OEeq3YH3IKHbbYTRvO5mhi2d/laRW4Unoz
         lLUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nIVqICRB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe813783csi136610231cf.129.2024.07.30.18.43.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 18:43:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nIVqICRB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sYyNA-0006e0-2D; Tue, 30 Jul 2024 21:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sYyN8-0006cf-Rb
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 21:43:22 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sYyN7-0008KV-Av
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 21:43:22 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1fd78c165eeso44453685ad.2
 for <qemu-arm@nongnu.org>; Tue, 30 Jul 2024 18:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722390200; x=1722995000; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lLwu2gkiCoWTaWrY0d/KXhMgiZTSQZ/koPCoUhxmO8E=;
 b=nIVqICRBdWc4gUQkt8U5qdjgCkc8remnvmIniqAQHuWbVNjLldFYwEvPiRNdFzMdwB
 agAzOuTVsh9RJR8HEXMjJQ4WsbQKhqB9QQNJFSzDYPkgFx4rQjNx+L3tU5GSuH1M78QZ
 PUWZmJO+x1r1UDr4VjYtzt435Eqz50aV66U+cL/IzT2lUl4Eldzh7T6TtI4gsdAUYr13
 3Lw79vsQ+adMEoks2WAAhx9kmghfLjjXg7Yi3cHSWhWdAw/CGY2tWbQGzMEpuh9EqBn4
 L/tTBw8lYYn6fvwAyzMZoU1n1cn2vksG7DTeWFmEziQhZWEufLbVYCEPstoAvfBIcg2t
 tCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722390200; x=1722995000;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lLwu2gkiCoWTaWrY0d/KXhMgiZTSQZ/koPCoUhxmO8E=;
 b=HBx6I0m64OJyrG0e2kVfLjLzxmn6yWXAGtbQ7TQD+hdCLPeoutMJeec+Vq2DaqFtDw
 sUZyY4f46pjmBTUVHC4qEUw8wFal2inaPuVe5W5d+Hyns1bsBD5kmUko1RF0ANthBDcH
 8IgJG4PeQcRH5x8cftAVjxb9PCukJ+q+gn0yS4r46bCKLsb7oblbxa89WBlDQY7XC0Ey
 V7kY2SSsqlt9Ksuak+LDaJ6Y2ggMVTtVD710a9Xldxup02PKYsD9ekH+1KmWhFhn5gxT
 n/7bT84EOpvxsUqX6LtMmuLjTC3/gzri7UZYewPud4KEPJJ/KXrxEjfWUMFssb+XvKpu
 b32g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHnjyB8wwEuipmegY7uAC1QRA+c9/ISBlqIYf+iNh90K95nWaPlw+IL/QUu3aNpN1UxRit6Vq/l+ru8oudZ7AnaEGN
X-Gm-Message-State: AOJu0YzJTSoOlAK7sFEyHTP3UuaHmCGaN97Rv73UnklWdoQ+bwXVc4fE
 1kIxqdlf3Hhjl3rSkcNvWD/4N9EZjROYeNpGAhqPJabx4zidpdVtJIjjA7En83w=
X-Received: by 2002:a17:902:d489:b0:1fc:6a81:c590 with SMTP id
 d9443c01a7336-1ff0482bea8mr170684255ad.27.1722390199553; 
 Tue, 30 Jul 2024 18:43:19 -0700 (PDT)
Received: from ?IPV6:2403:580a:f89b:0:7406:659b:9ac8:69bb?
 (2403-580a-f89b-0-7406-659b-9ac8-69bb.ip6.aussiebb.net.
 [2403:580a:f89b:0:7406:659b:9ac8:69bb])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fed7fa468bsm108968505ad.255.2024.07.30.18.43.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 18:43:19 -0700 (PDT)
Message-ID: <f546e8f8-f688-4915-860e-b72e85aa9b62@linaro.org>
Date: Wed, 31 Jul 2024 11:43:13 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] target/arm: Prepare bfdotadd() callers for FEAT_EBF
 support
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240730160306.2959745-1-peter.maydell@linaro.org>
 <20240730160306.2959745-7-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240730160306.2959745-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
X-TUID: FWOrdtSa/ft+

On 7/31/24 02:03, Peter Maydell wrote:
> We use bfdotadd() in four callsites for various helper functions. Currently
> this all assumes that we have the FPCR.EBF=0 semantics. For FPCR.EBF=1
> we will need to:
>   * call a different routine to bfdotadd() because we need to do a
>     fused multiply-add rather than separate multiply and add steps
>   * use a different float_status that honours the FPCR rounding mode
>     and denormal-flushing fields
>   * pass in an extra float_status that has been set up to perform
>     round-to-odd rounding
> 
> To prepare for this, refactor all the callsites so that instead of
>     for (...) {
>         x = bfdotadd(...);
>     }
> 
> they are:
>     float_status fpst, fpst_odd;
>     if (is_ebf(env, &fpst, &fpst_odd)) {
>         for (...) {
>             x = bfdotadd_ebf(..., &fpst, &fpst_odd);
>         }
>     } else {
>         for (...) {
>             x = bfdotadd(..., &fpst);
>         }
>     }
> 
> For the moment the is_ebf() function always returns false, sets up
> fpst for EBF=0 semantics and never sets up fpst_odd; bfdotadd_ebf()
> will assert if called. We'll fill in the handling for EBF=1 in the
> next commit.
> 
> This change should be a zero-behaviour-change refactor.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/vec_internal.h |  37 ++++++++-
>   target/arm/tcg/sme_helper.c   |  74 ++++++++++++------
>   target/arm/tcg/vec_helper.c   | 141 +++++++++++++++++++++++++---------
>   3 files changed, 192 insertions(+), 60 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
