Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp548193lfb;
        Wed, 13 May 2020 09:42:40 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ+VowfcbutnC6xx8kWY2A8bGi5OA0BPBC1SzAY4y2fYPkFM9A+nM2ncwda02avuKRXXbK1
X-Received: by 2002:ac8:4cdc:: with SMTP id l28mr15968807qtv.213.1589388160185;
        Wed, 13 May 2020 09:42:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589388160; cv=none;
        d=google.com; s=arc-20160816;
        b=D4ruRMImBOWGpWA5SI7awA2djmFSvzio+oX9KKoxAmzA0Ch3Gt5K7uRELpeJTwBVoV
         5FRp1s0GWK1lDAgGrQoC+ck5CdUZZzq0SiaRTMugA9w86YHTAUNw6D7DhVpc6ENdXZW1
         Y16n+DjgM0T2lRjm63IiKc/NgYLv0C973Wuc5Gk0ZMU17TGDMUed1rIfJoAZAYdrXGcZ
         RF6Xx5F/2MxiFJx8BhJ3dNe1DFvi2TsWJEE3LVbXGP7vYk2r42cN2K971lRPEayuNtyV
         zpO4sj/ONnrmOOU/IbausmeZS6nCmof++/0wWJZ+xg1NgTCHE4UHkXpvAd5VIh2+dhZf
         Gp+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=OBr73iEUiGBjQ1e5GgJBBBBNVpZDgpmLr3OzsvI20hs=;
        b=aWPN2u4a3XL/Yh+QG8KhucybXXz1PHCF91Yl01Bhjysj+Yf/gOuyw0vEseZKreSnjJ
         36Yoj6LZJN4fJjJv2yG56nk2Iu6pN1X2tTRDcUS4kt68LVd4jNjwfLOiSknzqeiK9ZnD
         BZrlBCeYV3ckckwsC+F7TgJQcOBUV2Tf6zgXlbqG7V0nZZlT7wj+tUry2xc4GgrKt6Mv
         coVxozw1Z7weBO1ANL3OMNMmEnVGZ7Ppwk+Fcg2w42SsjHoR8naDjuqXYD+9jSqlptur
         gATvVSMCJaKe5ZHEkNTPsebejJHZnl+YYJLICvREN/37cOLTL4EGT4ihPezWYyVE3s4Z
         WxIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nh4HWzrW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3si6485qkm.92.2020.05.13.09.42.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 May 2020 09:42:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nh4HWzrW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYuSt-0002HW-Jg
	for alex.bennee@linaro.org; Wed, 13 May 2020 12:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYuPn-0006EW-RA
 for qemu-arm@nongnu.org; Wed, 13 May 2020 12:39:27 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:40579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYuPm-0004R5-Jk
 for qemu-arm@nongnu.org; Wed, 13 May 2020 12:39:27 -0400
Received: by mail-pl1-x643.google.com with SMTP id t16so49333plo.7
 for <qemu-arm@nongnu.org>; Wed, 13 May 2020 09:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=OBr73iEUiGBjQ1e5GgJBBBBNVpZDgpmLr3OzsvI20hs=;
 b=nh4HWzrWGbUi24HGXNc9SNrFWhpIYNsNunHEOqJAC0Ht68X+yyWkIYo25Gh48R7IfB
 hA50FEk8uVdOsGT17njo9MbfeB+037mrtU9bhOhOvL7bsbVuwHgWOtV8NMbvJuJGIldK
 PZG7AntHGhvnp5trCUFKCK0JIMFvYnKhetHgK+Oxot7q/oXSEofbkuqr2zPKjwL7PuNx
 AtnP/iJQiqrmdm5HhWqDAU6IVdmXn1Ce7oced/Shv+8S/AjSFL+X3nkiOUxtyljxq6lE
 jVEyaimkEgmm7Pwcp+FWdWqbCodEHktgnbT/JjX3+TyhG2m1pDfr21RAsF0xWjLzyXW2
 ZAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OBr73iEUiGBjQ1e5GgJBBBBNVpZDgpmLr3OzsvI20hs=;
 b=c5jSUyg8h5FI1NIuFpHXB95ZPdAlgrXnkf1rrpvP2fpLJmsHXER9fT0If6I4WIJffw
 NKuBThAQ5Imm20uKt3if7XGs3NnyM55SzJeGKZpSj2HNs0ZmZtPzt/PXdqUi+U+BSsth
 cWL9LDC/zFdbudKMiFzREfoVNlhhCUVPoZxCLn72Pbwg7YVE8pt9XI/S1wrOdbbj3/BA
 rOw6WBtTSSOLyz3PLOyu10MlgNCgrVIdSsw3nnxCiRWClTSr/uzq6xC7YLFoawdgFM3y
 uYTFQuWK/RjPU20hNhFErNXQG12WR6fAVGPYFHrc9RgFlIGaEvfGfXzc/7ozglMMWgus
 64eg==
X-Gm-Message-State: AOAM532L1upwr5y31xQRH8llutNFO9OEdu4ESB+EqZtGSrX2T9EvI/Mi
 vdHXzRo8jzSzGQlRFEmA+R2eqg==
X-Received: by 2002:a17:902:b40b:: with SMTP id
 x11mr76691plr.174.1589387965042; 
 Wed, 13 May 2020 09:39:25 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id n69sm15530604pjc.8.2020.05.13.09.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2020 09:39:24 -0700 (PDT)
Subject: Re: [PATCH v2 01/17] target/arm: Convert Neon 3-reg-same
 VQRDMLAH/VQRDMLSH to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200512163904.10918-1-peter.maydell@linaro.org>
 <20200512163904.10918-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <caa8fd30-f392-4e8f-029c-c9c66db8efd6@linaro.org>
Date: Wed, 13 May 2020 09:39:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200512163904.10918-2-peter.maydell@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-TUID: 9ADf6x+2tnWx

On 5/12/20 9:38 AM, Peter Maydell wrote:
> Convert the Neon VQRDMLAH and VQRDMLSH insns in the 3-reg-same group
> to decodetree.  These don't use do_3same() because they want to
> operate on VFP double registers, whose offsets are different from the
> neon_reg_offset() calculations do_3same does.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v1->v2: use do_3same() rather than custom do_vqrdlmah() function
> ---
>  target/arm/neon-dp.decode       |  3 +++
>  target/arm/translate-neon.inc.c | 15 +++++++++++++++
>  target/arm/translate.c          | 14 ++------------
>  3 files changed, 20 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
