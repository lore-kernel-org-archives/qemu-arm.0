Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp196388njm;
        Fri, 28 Jun 2024 08:37:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVm31ITFMNJVmJWdJjdI6VGxdxMGa6hFa6o6UiWyXwD2/E8rpYcsW1LB3tIIbgfmzkUpl26nxk0FrGCYbz5DK5K8v82J6fi
X-Google-Smtp-Source: AGHT+IHm6S3e9/FHIKiVtK8MeIdbj3/ZAFzVn942VixpRnC8hqJxYU11JH8CzQKNzG+UTapK9D4B
X-Received: by 2002:a05:620a:45a2:b0:79d:694e:2ee0 with SMTP id af79cd13be357-79d694e32dbmr346791985a.32.1719589058027;
        Fri, 28 Jun 2024 08:37:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719589058; cv=none;
        d=google.com; s=arc-20160816;
        b=IYxnyprhzcwgjX1o+fMZpqBYQINJ2gSSVSlU6BfSMK9qWC6Wj1v/1gDAdQRiwu60Z6
         mMukWmLHwVD2SeRsZM+LzIfVX5ylS7cJpIddhyGYetvdpUO3KINbI7n8AOBZCPyO7mlA
         RX72iqKPnpiXFApNOwmVFmybBf46ftz13h8pcfXFZbjMJCMp4DlH88HVhgDJYP4KS11d
         IdGltOY5SjJLus5DEFcYqYsoU1I3LXa88iae37ag7gr/WbMcUb1/l9vuOcY5XyDx6+ZM
         ALLo28rHu4wDnUHnkcsm9e9+4wLgBQg1oUCixeY1H7B38UcRabY/PKQkKrvwynczf/xt
         hemg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=tg3evtMHreUWC/hLtIETtK1YBLYxxHqH7Qa/1i0yT2Q=;
        fh=jLlDBZ92wBUmB9kFmvpenfrf8Cj647BXtakBGExhdH4=;
        b=QpZMx3D9dVkfORJepI9YeTQXGsEja5xBXZory0bMcl+V8qFeZBr9Y5DA4GNAv7nsux
         IpR7YFg/jDq/Cj/i5pstM3DO8B216VjmNytC3o15Y+iuqbWqNtWfjBK4Fb6QYHGOP5Iu
         HlfRq2y3tz8zEk2R6YjRr9e2+OwWLRbadjsBToEAXtdzYmrHVzLPP+XTyEwY4pC/85tQ
         QYQA1WXML25c92Ms5vsDRIMim1XkGcFw1hAPdMs0QuoAVNdoIKHWaOwvbYzBf4L+5XPS
         4y5MWiBcveczA0AaSdRzo+8WPEMWBkG8e6Wsple7yiNR/R+Kkk63ICZlyxYndDNq9cs+
         8GhQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aPyRJrPm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d6926088esi202648685a.18.2024.06.28.08.37.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2024 08:37:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aPyRJrPm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sNDfE-0003fd-Bw; Fri, 28 Jun 2024 11:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sNDfD-0003fI-Ql
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 11:37:27 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sNDfC-0006sO-56
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 11:37:27 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-70673c32118so543573b3a.3
 for <qemu-arm@nongnu.org>; Fri, 28 Jun 2024 08:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719589044; x=1720193844; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tg3evtMHreUWC/hLtIETtK1YBLYxxHqH7Qa/1i0yT2Q=;
 b=aPyRJrPmreBRudTSoNUmIyuD7pJj5p00qiM21TqEK9jS/by4y39dv55NNMZVVwTOmd
 ywR0gdifiht7/bhLsp3MiuusfEPNuklOy3xACO8tWpswUe4C4VzXbKc2CjS55G2mfDSg
 oZRNzn1auWKeiflt32oKJ6/3Y9JP5ycCBHs01a6ixpRgAY49n3dqZvbEP2rhIP0DlzL4
 l2tmPfDISMU50mhpxN3cZ7Q/m0Fh46kRMrL/9u9oxbOCc0YRplHe8cF1z4A4qrTmnhVO
 bAlP5cFMvBUbJFktg1W2jxbhWxEkOXZfsh4C9aHNQ21DolYpYidf2dQS9cgmA53Ji7rJ
 t6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719589044; x=1720193844;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tg3evtMHreUWC/hLtIETtK1YBLYxxHqH7Qa/1i0yT2Q=;
 b=Ble3BuZlEQQkf1slgDckBbpOO64MedA6NMmtneKxBQoL4TKROJATXPZf060lZXWm7/
 BrxnHTdYWVq0KZMH9IOYf7ovWl5ZSL97CgiVpqDZa+EiIQc+pD4fENqaZATFiicll953
 nxZ2o6143UO2sx1QdhZ4UYK84JXKg1JxruptKAdIwzzBXytxaHXt212Wh3j15HwKuBTF
 498NYTYY94fWPu75eGgI6mAM3bS2AA388qnIgSV2h2S0J9l0HA74stJ0FdG/0+lxNEvx
 CgX2drmh/PXuArC/hiV1xchssj9Jmsfj0+UYAm3EVUs9XtNj67CV7KbT7bORVjAQwfNy
 /sUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfqzKITvOymgl/0yxZ9LKIDeK/AdEIG/ggv0/1la5pU3+f6iX8uIotavznspLIUi+w/3q5PDpPCBOfKqKj4i9+OeEF
X-Gm-Message-State: AOJu0YzTzYKOK8ZfgkpmBN0PyGYv+acuC9imZ5kcPxovLc+g4vfYnoT+
 rvifs6Ata/r7IEU2eo9f67jlcOPrxMC8j+zgE2Fn8R/u/53AZ1q0xJGiaRcrr/o=
X-Received: by 2002:a05:6a20:158e:b0:1bc:e978:8bf2 with SMTP id
 adf61e73a8af0-1bcf7eae9f3mr19144860637.23.1719589044032; 
 Fri, 28 Jun 2024 08:37:24 -0700 (PDT)
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac10e392asm16765105ad.78.2024.06.28.08.37.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jun 2024 08:37:23 -0700 (PDT)
Message-ID: <61656f78-4f96-4212-b37e-3c77c937a3ea@linaro.org>
Date: Fri, 28 Jun 2024 08:37:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] target/arm: Make vfp_get_fpscr() call vfp_get_{fpcr, 
 fpsr}
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240628142347.1283015-1-peter.maydell@linaro.org>
 <20240628142347.1283015-3-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240628142347.1283015-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
X-TUID: 44DGezOq0uuJ

On 6/28/24 07:23, Peter Maydell wrote:
> In AArch32, the floating point control and status bits are all in a
> single register, FPSCR.  In AArch64, these were split into separate
> FPCR and FPSR registers, but the bit layouts remained the same, with
> no overlaps, so that you could construct an FPSCR value by ORing FPCR
> and FPSR, or equivalently could produce FPSR and FPCR by masking an
> FPSCR value.  For QEMU's implementation, we opted to use masking to
> produce FPSR and FPCR, because we started with an AArch32
> implementation of FPSCR.
> 
> The addition of the (AArch64-only) FEAT_AFP adds new bits to the FPCR
> which overlap with some bits in the FPSR.  This means we'll no longer
> be able to consider the FPSCR-encoded value as the primary one, but
> instead need to treat FPSR/FPCR as the primary encoding and construct
> the FPSCR from those.  (This remains possible because the FEAT_AFP
> bits in FPCR don't appear in the FPSCR.)
> 
> As the first step in this refactoring, make vfp_get_fpscr() call
> vfp_get_fpcr() and vfp_get_fpsr(), instead of the other way around.
> 
> Note that vfp_get_fpcsr_from_host() returns only bits in the FPSR
> (for the cumulative fp exception bits), so we can simply rename
> it without needing to add a new function for getting FPCR bits.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h        | 24 +++++++++++++++---------
>   target/arm/vfp_helper.c | 34 ++++++++++++++++++++++------------
>   2 files changed, 37 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
