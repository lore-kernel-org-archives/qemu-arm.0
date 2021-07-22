Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp78707lfc;
        Thu, 22 Jul 2021 13:03:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0VSfNvcfl3uI1NF/fr2qqWthtumrSLvdnSfzSjTzzgIcstNElTlqqQFI2L4ASHfTrObQh
X-Received: by 2002:a25:aa09:: with SMTP id s9mr1632491ybi.165.1626984195290;
        Thu, 22 Jul 2021 13:03:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626984195; cv=none;
        d=google.com; s=arc-20160816;
        b=dWFIuDr7bWDkPIcIAS8abLtgTyDTH1hyM3piDFTajFBrbC+bvmQ+tWoOzpA/XsW3CZ
         XU3ga6q0Gxpmp3PzZ69ziZhh4YHquo30s4jGHPC6FonaAvPuhdGULF1l94jSMpv6swZl
         oyFjHtBzWidB+D00f5y3B2a6ICA8W/4GYmtP6P7viLvPsawRzO61YSKxGCOE74kgzNH9
         IqgjB50BrC1y5RX87xzg/KD862xelywncgq4x5BViBchjxnwTmA7Oq/UGd0cStiuSPUu
         //bjTm3EhCtqwCbo1fdTGXoT13FWdEqDfNlcTGSsChgOJT8smXMbRpDY31pfR4K9DKao
         6VTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=MPb+UZPPToxxk24vH6DkoyxFhS0dCO5Qv5JFT6QuOzE=;
        b=e+LQ36BpeyM1RO1mB2cFE/iR0iSb0WnTCxYZQLncXe2AtDQ9IrEUD7mEpekLgMcTES
         7n1mxGWkKu8rGqGbiIuwudhSxNGlZbOeG+5ETyjYbJAUbbD3u4fJyQlWfoIkPf9eM456
         Lwo2JwgOdPes2bksrwLCA4TV+WLFXNilNiWZET/wVAi7/oCjL04pYV0P1nTF0nLaS+Vs
         7zBgqgmBQcB8q11bpZ1SeVDohaW+sbA8d2ArZ3gsyN6MY4FaEWPLU27IaflAcSMEhUlP
         1zKRzATYf5ee1dkaFpSluStWxw2kAf8u91G7NOXJvvmu0GuyTn3mJtzDGJM2E/oNx2Ib
         KJZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J6Z9x6uO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o7si15694141ybu.11.2021.07.22.13.03.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Jul 2021 13:03:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J6Z9x6uO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6euY-0007Bg-Lr
	for alex.bennee@linaro.org; Thu, 22 Jul 2021 16:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6euO-000786-Ie
 for qemu-arm@nongnu.org; Thu, 22 Jul 2021 16:03:04 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:35618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6euM-0005Kl-Rt
 for qemu-arm@nongnu.org; Thu, 22 Jul 2021 16:03:04 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 pf12-20020a17090b1d8cb0290175c085e7a5so5884208pjb.0
 for <qemu-arm@nongnu.org>; Thu, 22 Jul 2021 13:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MPb+UZPPToxxk24vH6DkoyxFhS0dCO5Qv5JFT6QuOzE=;
 b=J6Z9x6uO9CuAU4r1sU0AYyIf40Xhn3gYhryyzmOf8p5sLZkI4VojDcLZbIwST5Zst5
 Fs/U/WU1fsdXAIyFpkvwZP8epvJpcGdK8Zx8ZD4NsbwU9sFMVPE1WBquWhmMecBEhTEa
 Gb9FqkE4atj18t+FvDcv/9ErFIKAxjJe7GhjEBU/bZnMp7vMWqFuj/h8s0aAhB66W/bo
 EYRJu4i2BIqQpiAnZLlT4ARBXAcyhlWvn5g1m6+T9XGVBbSMHR0GB1Ms5rjy26xp/NyI
 pV1Pjh7G3AoCCGpm96mN4hoeR1XVLTHFGr0/r2RTxRo0TjVQ/fAgS2sE0iY91RlwFzSq
 ak9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MPb+UZPPToxxk24vH6DkoyxFhS0dCO5Qv5JFT6QuOzE=;
 b=HpD/wfikn93NGMt8iCETts9xnur4OkqSJHgsaGaPlt7MmaGSXr0AuL4rCi/DoyKpad
 vlIxcn9+WM7tWnthv9NVlQK8cCW4D41yTOGRh/tlZopzOY2Ph3NTGPcYE1wRHOaNnCho
 SHVLhjHoO0ArYYJ90eNOoQLIIuzwLfVkqRFaLv9kDVNAP0B0uCjdLHNTlPokR0AFVyZQ
 zqwngWsYLn/2vuAz8RmurSuf6ecikQSVnp7MLJ9vyXz+Q2kHxu11nqGS3Mr/uSYXPSAQ
 3jpJ+jA5QW+uqk2wzsJFj7FBBgogPKRHd7H3pUeH0BxI2jEwVKBW/aSaKTfhtwyMrXEC
 XCFA==
X-Gm-Message-State: AOAM533qh/s3Fz61WNyr39kowzybqJivuscUmfXVIeDYKH9F2vs++m/8
 C9jBHpGkZKweZa2qqcZbnIEKiQ==
X-Received: by 2002:a63:470b:: with SMTP id u11mr1598798pga.340.1626984180999; 
 Thu, 22 Jul 2021 13:03:00 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id 202sm34128517pfy.198.2021.07.22.13.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 13:03:00 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: Don't list Andrzej Zaborowski for various
 components
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210722180951.29802-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <56d144c3-303c-318b-5622-919b220cc63e@linaro.org>
Date: Thu, 22 Jul 2021 10:02:57 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210722180951.29802-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.203,
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
Cc: Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hXyRrdz9/KHO

On 7/22/21 8:09 AM, Peter Maydell wrote:
> Andrzej Zaborowski is listed as an "Odd Fixes" maintainer for the
> nSeries, Palm and PXA2XX boards, as well as the "Maintained" status
> Arm 32-bit TCG backend.
> 
> Andrzej's last email to qemu-devel was back in 2017, and the email
> before that was all the way back in 2013.  We don't really need to
> fill his email up with CCs on QEMU patches any more...
> 
> Remove Andrzej from the various boards sections (leaving them still
> Odd Fixes with me as the backup patch reviewer).  Add Richard
> Henderson as the maintainer for the Arm TCG backend, since removing
> Andrzej would otherwise leave that section with no M: line at all.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Andrzej: if you're reading this, thanks for all the work you did
> on QEMU back in the day; and if you do want to still be CCd on
> patches let me know and I'll happily drop this MAINTAINERS update.
> 
> Richard: are you happy with (a) being listed for Arm TCG and
> (b) it being "Maintained" status?

Yep.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
