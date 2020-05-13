Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp557395lfb;
        Wed, 13 May 2020 09:56:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlP/1sgs1G8oZMwCWTMHzuQ4bSgNF+RO8ThXjK0nmrY6EJfZsJJfWMaTyu9cIK7484YZdO
X-Received: by 2002:a37:7302:: with SMTP id o2mr631811qkc.474.1589388980934;
        Wed, 13 May 2020 09:56:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589388980; cv=none;
        d=google.com; s=arc-20160816;
        b=Dl1fPeFCkxtHI4xdc73GT4bu+X5R7xeZChi/82FHy2ks0uRt8ACLSb9ntRBM5HwZZo
         cv3CCqj+154rNSVfpAeYlkkaF3ySUcKAIJfoEGKP+GlGjYjCOHk86yoqUfWWvjlZYH9h
         xeTfDIPRdeIEbUwX8gEp24PngabuHgsopA++uOIzpu9ldYQJKLaTStFoo56stpfXABVW
         H/TFcqMBwAXInNcaEteVQ9WUfmoTJUwM9KoTOBYrLIXkat5tXtn4bqAvUi8NQoz4Q4qS
         qget5SXZCplvsLLF3gpHZoj9FggNkOMkVLUmgykwjmmm5xmdIEMri5RUFELWd/CJnA1v
         NgRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=bcqeH5QwNT88kDHw25bchRVnVdP4xarT+DvNx3L4FJY=;
        b=f3oOuc3MPV2XL15ZpEpgD6IsXdoIzb99fVs0XX88ZVexYkAh4KXBwHGzw+PvD7Rauo
         aaqgEWztnDy55BhAieIfsfa9vOrsjYicPcsZxiThYOHuff/jZZ5A8gIGGiw/HpMG/TNG
         qH5JwfFn6KLi9qowarML13szO3asXiRvbf67nI2TnnEXyABZfHinROxjgZ2oXa/Tmolo
         5Ezg1fmARvagBE17ckHUGcJT8hEFBeyJ5G3XKUp6wMTq21r238ZvHLZ6Mjv63HF8hHmc
         stnxcJW7MojflW2+f+H/xrXrK5qK8HQFbyvaP5SLfQ6+VI85Ax//sZGM3oP77qSpVS+G
         S4cA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wcsY3MTR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j12si52185qvu.89.2020.05.13.09.56.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 May 2020 09:56:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wcsY3MTR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYug8-0004SR-B4
	for alex.bennee@linaro.org; Wed, 13 May 2020 12:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYuff-00048g-ED
 for qemu-arm@nongnu.org; Wed, 13 May 2020 12:55:53 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:39369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYufe-00089J-1M
 for qemu-arm@nongnu.org; Wed, 13 May 2020 12:55:50 -0400
Received: by mail-pj1-x1043.google.com with SMTP id e6so11241154pjt.4
 for <qemu-arm@nongnu.org>; Wed, 13 May 2020 09:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=bcqeH5QwNT88kDHw25bchRVnVdP4xarT+DvNx3L4FJY=;
 b=wcsY3MTR8k3WSd0YAZyE21KSfAvDFZAc0VDWF3pBPn82ffXWeV2FoNbUTPMRINp+89
 Ef9VDtzykFHTrdHgZCN1J6vfaoryWc9sNbJDNm1D8a02QysOPeFqqe3AFjg3lskedgte
 EIaeDtK1q+KO/xQdNL0pUyhYkujybErgeMU9CdJgrbSSj6G4go5jXoQ2ul94diEJHAou
 D28uNZtq5/VlOKI2fOIItIa0QuMJND65rDX5dIxRWfHkwk3IuuBK5d7MCxOtTIGUh09S
 a4qMKKe6vbIIbXtq36PVJyKLfIFn0INIs1R1qXVpu6cLZnBcM/WkCyHtFtLu9fO50/H8
 3b4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bcqeH5QwNT88kDHw25bchRVnVdP4xarT+DvNx3L4FJY=;
 b=dwZr0zmQHClBiZ3SCu0unE4G7e4/YHT7DnZ1UvtMELogoXdE9HxWOlBbgjlUvkjXPd
 Zm5ah8MAOOSm8s7ejvpZ+v8x66uL9UZjHa77ZrUWiMJNLgpmTA9rAlEJGvrgu6DXUdc0
 b0XAfXBVvsh2la6uGPWT0gzhs0dAdSr3fN3jhFWrhGEeg927Hist5ZKiZxHuuFhM8MNy
 NjDQKl0c4CVRsDyH0oFfBi+pCEXgjzwe7kawfj53xjrO779eYuyoVUKX4y4voCdU5OwD
 hyqgIGlVR0XOOY96fG0VBWJ+dhbSF0J7AxQ7wY6m8a39xQUqjK7sHwyfMWOhUdkoeo6k
 ry3w==
X-Gm-Message-State: AGi0PuYnGyLujQdeUWeHCTSj+987SroqJg0pTB63WZJaWAdnqTz0qNHf
 jtNacoGGBFWVmSeCUcmQ01OXug==
X-Received: by 2002:a17:90a:6f22:: with SMTP id
 d31mr33336092pjk.14.1589388948498; 
 Wed, 13 May 2020 09:55:48 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id t21sm202249pgu.39.2020.05.13.09.55.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2020 09:55:47 -0700 (PDT)
Subject: Re: [PATCH v2 07/17] target/arm: Convert Neon VQSHL, VRSHL, VQRSHL
 3-reg-same insns to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200512163904.10918-1-peter.maydell@linaro.org>
 <20200512163904.10918-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a2050bf0-ea3a-9e5c-09a5-f5578fdcc69d@linaro.org>
Date: Wed, 13 May 2020 09:55:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200512163904.10918-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
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
X-TUID: VEdu13aDV7dR

On 5/12/20 9:38 AM, Peter Maydell wrote:
> Convert the VQSHL, VRSHL and VQRSHL insns in the 3-reg-same
> group to decodetree. We have already implemented the size==0b11
> case of these insns; this commit handles the remaining sizes.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       | 47 +++++++++++++++++++++++----------
>  target/arm/translate-neon.inc.c | 43 ++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 22 +++------------
>  3 files changed, 79 insertions(+), 33 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I think I'll come back and clean up this split 64/32-bit decode, as well as
converting to pointer-to-qc, but this works for now.


r~
