Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4941643lfb;
        Tue, 27 Apr 2021 09:29:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGoH3GOxvYvpzJ0vIo95PSrIbZjLu+LJpDE0za+v5eOdt6rg10RBKQFGz14vyfAQMItOAw
X-Received: by 2002:a92:a301:: with SMTP id a1mr18735063ili.41.1619540990787;
        Tue, 27 Apr 2021 09:29:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619540990; cv=none;
        d=google.com; s=arc-20160816;
        b=XDJxxm32qyq9cP1TDen51V94g6JG48kFS8yAcp3XjW7JlMOYl9WiO5keThX8W+CgEO
         SRsYcWj9O9vCwye+Rn2zfc6QmO+gZwCpdd18iVJdw8JnqAt1rBlJAkzf+l7JrFdkTiXP
         nre6lLWJ9fmmfVP/Ti1wKGPkvDPJm/VJAzqzIUH1guwsMxa0zyWdfmk9FXYRVPGe90sr
         LT9tppCXNuVkUO6y9sa/93khyH+eslSIYvd3qiGTNE//+WbTkprnBM1nuQypr1Mr/DTh
         7HIlAx3f+Veb6bj5prI+UG0BVVbqIzvn5Svi0O8uAHbiBV9joAqzqUMHv/SZkJWxPatZ
         iYKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=XyRJ4WH1gN00En8Vr6WYPxakoifvNj1+AqSyk4hj5Lw=;
        b=Rjov9UNjP0MFxr5+fP6C3ZPS/k9VVAr1FFMGusguuL+ZMNH859aYV0/+40ONNqEuYr
         p+4jWA3tTh/f8th8R7iSX9MBKL5KJfu3zvnjbRrftdLV6uMLHy0p/jqiZcyC6P0PWPzc
         HLvgH9dy4pbaJeAUzFMNvKKK05gs06B57wKxq9MZ7GRQLEMvQGqkF7TKCjrxwF15mlPx
         ORsyLPKK0qEpNwuhpNmO0q32qe/yIEg1jza9eS/xdukxCMEXFdvF+FZwoOQY4DrD6tV/
         QOWZz3SjUMsYBtOFsyywnH1pn78En1AB87Vb5afTtXkat/VxHnd2S/GsiRlyRqAzL3kK
         st1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HroC0mYE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w26si3720738jao.65.2021.04.27.09.29.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 09:29:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HroC0mYE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbQas-0005W4-4Q
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 12:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbQak-0005Vd-6Q
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 12:29:42 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:40658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbQai-0008S1-If
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 12:29:41 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 l10-20020a17090a850ab0290155b06f6267so1330353pjn.5
 for <qemu-arm@nongnu.org>; Tue, 27 Apr 2021 09:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=XyRJ4WH1gN00En8Vr6WYPxakoifvNj1+AqSyk4hj5Lw=;
 b=HroC0mYEDGfuP6KV2NLPPLYGWl3bBBE3zQYIVW7IJfOveYa4/EAiyf2VEhCOajimxm
 Kd/GD0Jdc2IYIx9QbvG6au9fAMhrDL1iU5LPuuON2XrKB4m/I3wlNukcMVx3Og7mqwhR
 PnfIS2BfBNaNMPOmkfVKBDCrCJgLDi3uqa23MKCQBxHB+a01nKgWs48tugpk7AV5baV1
 2+0fAi0drSeF7Fl1IpdTFLGnUduPbr8tvMUEXDMJ/5js+esul+7SC9oNqoo/VgGXPzwF
 63sFc7qBerKChVkTHLSt2zJcbm2M2lhWlD0pBIw0amtP8QRGc6ERI2d6GVnRLE6IUzwa
 2uXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XyRJ4WH1gN00En8Vr6WYPxakoifvNj1+AqSyk4hj5Lw=;
 b=iP4v7sCBuZmByWMvF1cpQsbCimwNnBF+s1nxQk9ej+au1DIkDFhkU0YIxr4WfJlk1S
 7i8tEH+2dtEjYwUUSjqkKI5htoHuoqC0tyjmd+QUBu4BpU5Hney2HiRSGilBgF2AkgEb
 VNjkB0G5yM2PCJOtXPjSkjcKpeg04mtbxkiqJTyqfglNBq8FChwy4ReLzgOohNT9WurO
 1Mvk5zcsKwc15L0kNFGHlYLhrPxdzDF1NEqG0HAILaEzKl0tFN7v2DNMpBW8o/4es+TE
 nkyNA2RbJrdp0uAngJaYWyggXlDylUEja/2InoOsbRHW5xw65kmimPnvd+lmYVp79jYr
 B4Fg==
X-Gm-Message-State: AOAM532h7lcxDZJBla/6vw+NJcYIxFVudY+8dFMBSXDP4WCYn1vI14hU
 1UrizF/kOg/78dcZFKCGbi7A5w==
X-Received: by 2002:a17:90a:4e81:: with SMTP id o1mr5586863pjh.7.1619540979131; 
 Tue, 27 Apr 2021 09:29:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id h2sm249214pgr.37.2021.04.27.09.29.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 09:29:38 -0700 (PDT)
Subject: Re: [PATCH 01/13] target/arm: Move constant expanders to translate.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <90313af1-fd89-584f-88ae-1b8c99a827fb@linaro.org>
Date: Tue, 27 Apr 2021 09:29:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-TUID: 8vDlsh7kOewJ

On 4/13/21 9:07 AM, Peter Maydell wrote:
> Some of the constant expanders defined in translate.c are generically
> useful and will be used by the separate C files for VFP and Neon once
> they are created; move the expander definitions to translate.h.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate.h | 24 ++++++++++++++++++++++++
>   target/arm/translate.c | 24 ------------------------
>   2 files changed, 24 insertions(+), 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
