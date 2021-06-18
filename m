Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp1715283lff;
        Fri, 18 Jun 2021 09:24:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJws3SojL1+BDd5ZFVCTZeGNC1+JiijdD6LjktjyAvl5dOjBzifaaIF9F1oTOAJNwzOj53v5
X-Received: by 2002:a05:600c:3b8e:: with SMTP id n14mr2394394wms.122.1624033456333;
        Fri, 18 Jun 2021 09:24:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624033456; cv=none;
        d=google.com; s=arc-20160816;
        b=B+aBMD1Xyg2nNEEgYsAVrJjezOw2cuiyEoM7bT4oXDig5yztY5j2vx/4egayxjJ5rL
         TKkinFKugFucpx7wDJZAkpjfFx1IkttGXAvRN8cIjqxqq6hU3DqvxRjnTYfj+mv/dE9G
         DmGgoxmRC3Z84KZ6AMUEje8HOX/lBQVaALmnuUd1li/+zAVrZvoCRN2vpRem51vP3VpO
         iNiaYKv5sbI8NryaMm0/Qozjgy3oTITEVnirIaLvEk82Ci9tmZBHZepLNGGz+ZGJl8Cu
         u/EdQ/ntKJ091I15M8Av/2zYtALvR/uQxSec6rNpzmKJREGOKqHUtLsn31Y+L5kT7sGz
         q9Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=kqxZVhRCut8KjPpPX6+r7e1BX4UG3cef/g/Yi+njN+M=;
        b=PGcu94p72NW2G2Wa6rn1CxpgKwY9XGv1lFwecy68LPpOIXqF9iqG/7QwwBN+4LcsWz
         czokAqji9Sge/Xi86XlaYf0UJRsEws254rDoYvwO2fC8t0Gtlm3sdo/95A5WyC8V/7mO
         Uto8AvJt67EMipCIFv4Z+3bPLGqoAiM9SRNiZCgZ9H+wOthPoIq0z6/be77tzqd1GSEj
         UXGUVnccdQa9btJDpKrfV3XEzXwwl3SmiAQXfcX7S8Q2ONM3yM0KFaKjXN9Ql8qiHUaM
         MDaRkfqh69HGTZzSu55HIEXhOX0jnAfcVlXZ0jOZwTL4tL/R3uTQxpnb0ALHdXnueaMO
         NCHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s1lF78ED;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m19si12814415wml.125.2021.06.18.09.24.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Jun 2021 09:24:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s1lF78ED;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1luHHz-0004CM-Er
	for alex.bennee@linaro.org; Fri, 18 Jun 2021 12:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luHHp-0004C3-OO
 for qemu-arm@nongnu.org; Fri, 18 Jun 2021 12:24:05 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:35765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luHHm-0002T0-AK
 for qemu-arm@nongnu.org; Fri, 18 Jun 2021 12:24:05 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 pf4-20020a17090b1d84b029016f6699c3f2so1047852pjb.0
 for <qemu-arm@nongnu.org>; Fri, 18 Jun 2021 09:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=kqxZVhRCut8KjPpPX6+r7e1BX4UG3cef/g/Yi+njN+M=;
 b=s1lF78EDKZHuCrUfDSRvLmicYONDOWOVsn/I23/FntKphOINvEGziO9lh/zG4eNaHM
 sdc7gKTh4/NkNIQwVckjm2L+eTnoi28Kvj1x8eXRA/X2MPVW2Mo42PFZ+6rfQUvT2WaV
 eolmnJPbL5eV5M9Xu58uQX3mTGfMgFE4SukMJ4w3ifMVm3oRNmtZ3dM0336drKXZztVs
 O2yhQw6FsoNL0Qpb5krjbzeEiwuk5k3OB6r2nzwiEpXtjq7djeHszjQgqNEZA+4kE+7W
 CJlD/Ule1W7gqvR4hKVonMt7jqqhMpI0wM9f/oGS96jV6eNG5qLKLay2UoTGXhLdrmB+
 dg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kqxZVhRCut8KjPpPX6+r7e1BX4UG3cef/g/Yi+njN+M=;
 b=GG2w3oAxrniiNMGs29i1+Aq6DZEHytHmV1KbNx4e+UcSpIaxWDKPOjo9a//jiTtuDN
 gEgWaD6fKnGHTsQ6YlmGPT37kRVsVCRHFT7unrbxB9hhq6EyNS2wXvzxAwAQPVfZzdOE
 iCb395dURnjOZBhQ+V7ueTFLQK5NEW0BSKD42qsBktoIjvWRnygWPNtPI0+ColhajoKx
 dkL49lzJaWZ4/czNoyg8OX+Nh0mJ00XwyztAyxs56y98iILDUSAp48kPnUA8yloioQYz
 jO7Nm+AVplgHVivLCTcDokcnuaM8710DD5y93WWMiNAbc8V1TJfBOYixFPIh/V+U1Idi
 1rLA==
X-Gm-Message-State: AOAM532nVPBaJvOb3Sj0h/EeGsIHxAQXCb8U053gB3wJnRGY/GlmBChm
 jWfuLqeN1fhc0We1yS3Og1ECFg==
X-Received: by 2002:a17:902:be10:b029:109:7460:cc41 with SMTP id
 r16-20020a170902be10b02901097460cc41mr5463055pls.4.1624033440923; 
 Fri, 18 Jun 2021 09:24:00 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u9sm9415332pgp.90.2021.06.18.09.24.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 09:24:00 -0700 (PDT)
Subject: Re: [PATCH 6/7] target/arm: Split vfp_access_check() into A and M
 versions
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210618141019.10671-1-peter.maydell@linaro.org>
 <20210618141019.10671-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <af54bb16-d390-0402-2c6f-4eba6b1ace65@linaro.org>
Date: Fri, 18 Jun 2021 09:23:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210618141019.10671-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
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
X-TUID: FzBOQJjhi/+s

On 6/18/21 7:10 AM, Peter Maydell wrote:
> vfp_access_check and its helper routine full_vfp_access_check() has
> gradually grown and is now an awkward mix of A-profile only and
> M-profile only pieces.  Refactor it into an A-profile only and an
> M-profile only version, taking advantage of the fact that now the
> only direct call to full_vfp_access_check() is in A-profile-only
> code.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-vfp.c | 79 +++++++++++++++++++++++---------------
>   1 file changed, 48 insertions(+), 31 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
