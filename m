Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp621963lfm;
        Fri, 19 Jun 2020 07:06:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhZTw/GJINqyWwhdolcTN72nXD0QaMZ5qLcqczgLgm6CAz/KQMmGUZssb4zGdqMgVpdgS1
X-Received: by 2002:a25:cc48:: with SMTP id l69mr6087587ybf.366.1592575604542;
        Fri, 19 Jun 2020 07:06:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592575604; cv=none;
        d=google.com; s=arc-20160816;
        b=FXIDso/hy5OjpsffnRh77Yr3D9xu/F8GAXXpXZ1UbyFhuZrMkVLftZ3FzqDwrEnlmo
         EB7mDCCtOWOiB4HsnTO8Hq4H5ZJ1q9r3Df11/X4o1FigpiPl4D7trn2BYSx5ALDBOUcL
         CUKYFKtH3YWbroIWgW61Ct6OPnL9QQkPdQAS94Mwectfb9FZ3IfjvEUxoMJuREzopvzF
         0FY15T9gh/oU4Xmuvh7BXdftXtJf0+IzX2Oyaderq+BIoQVKXzI/3+4Xe7rj6KBTeabV
         rGL3qEV3wGfEzrlejhOusAiqVNjguDC//JIfM5+ynpXoRHjRqYAbID4vwj8ETcebH/y2
         AvGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2SzBrzToShRpvHBIvFFlJnjD3x916pBIuMBxO4NPHu8=;
        b=ap2eHn4Kwd2vJZ+P/nsY7g9pUFH9bkNV+N2XgaDA51N2knbqzsXrS3lxZLUeUspPAJ
         0R3JXjFyM11/v+DkcosyRkJ6Uu7yCUaVnLsDdwKAa1Zzv61WmeYFsOlu+Lk155Qf5MJX
         ie2u2VQlfN9zP59DcAGlPM1w2KRxaN/QDnaovp90oWjoGnT7wLT5MqypI+Hh8JuYNpC1
         HtxEgLoLi9+WwiraeJzvc3SHddI3NXbYZcNrDJdzElPw+D45mukHJTjNr2R3O6KXyZyf
         RVKXmYEIeuAEHU73rDXL1w5tfOq18fRA64F8l+0ROXHkTew/QYCHgXEiQtA6N2johGzN
         Hj7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xDPEwQKo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r7si6059073ybd.373.2020.06.19.07.06.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 07:06:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xDPEwQKo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmHfH-000517-Sk
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 10:06:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmHf7-0004xr-D9
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 10:06:33 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:44513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmHf5-0003PZ-PB
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 10:06:33 -0400
Received: by mail-ot1-x342.google.com with SMTP id e5so7334900ote.11
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 07:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2SzBrzToShRpvHBIvFFlJnjD3x916pBIuMBxO4NPHu8=;
 b=xDPEwQKoYnuv1LB1z/iyvmCp7zgIlY+ETb+vUjzNfe9TDQmr9Y8cmLUqKORTi66CWo
 D5QakHKoqiA5PHmAhdKfiBpjrruMh8EVFLvX3verS53vqXVX6tA39ZEHW5G/8ph1HQqE
 v8byCPSd24KyVnu3T2fMzffmEZvVITn2aSdEnD7yQq0Su99I/QyBP3P0tD4gq/z/59+M
 Gh09DcUMzs8NLwVIndee9ozGSVyzynwjR8xPKkj+trCKGJwWLuTILHjdHr95VsPbXIVE
 D2Jx7G1NIjXBBlIpvZPEMnB/PeDaIqD3p+Wj6L/di1hYZE8SJ+mZ1yD56TpfMiwlSs2o
 lXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2SzBrzToShRpvHBIvFFlJnjD3x916pBIuMBxO4NPHu8=;
 b=TvkJRZMPlwmKYYpo6SqEO97+hhcyDIbn6o8htDvaxpSnlyZBNpduWHqRpeTcqLsNfS
 mzZF8LRYb02kPTUOpw6FnIVdwPo3IIgD0Xnjg9IFQWc0We6smQAzivt1JMBsAeC12yuI
 HSjJoRma6oBWOrt6kvoqMMatdxntW6ImeygFNtl4mJKifkMNNK6J3B1ebbbuqLrez+aL
 3Qih/wimEIPKGmW5Jd9+wTOHPrmdtZbxxJnaaT9E4J/yKgDssSdbqNQQbAww3f8EeFVf
 v20zvUJ0Mp+ohaBcWaXr4T9dYTy5MrcPNwvHdzzntZueHuFQ5fYd8jEb7olhl+s+ejT5
 X4pg==
X-Gm-Message-State: AOAM532oqcq3EGTdz8moxptP9OB1gNUGR4iETbOKxiGHX3ytrJTwk9hD
 5XLq5ZldGgB/g1NmnPb4lP2gsmA8bGtU9frRB2BSSg==
X-Received: by 2002:a05:6830:8d:: with SMTP id
 a13mr3101855oto.91.1592575590525; 
 Fri, 19 Jun 2020 07:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-32-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2020 15:06:19 +0100
Message-ID: <CAFEAcA8870uLGsGW+A5_QC4PPFnwMfywyvF5KV4yCkqbT6==Qw@mail.gmail.com>
Subject: Re: [PATCH v7 31/42] target/arm: Add mte helpers for sve scalar + int
 loads
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8xkGk1w8s6Gg

On Wed, 3 Jun 2020 at 02:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Because the elements are sequential, we can eliminate many tests all
> at once when the tag hits TCMA, or if the page(s) are not Tagged.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> +static inline QEMU_ALWAYS_INLINE
> +void sve_cont_ldst_mte_check_int(SVEContLdSt *info, CPUARMState *env,
> +                                 uint64_t *vg, target_ulong addr, int esize,
> +                                 int msize, uint32_t mtedesc, uintptr_t ra,
> +                                 mte_check_fn *check)
> +{
> +    intptr_t mem_off, reg_off, reg_last;
> +
> +    /* Process the page only if MemAttr == Tagged. */
> +    if (info->page[0].attrs.target_tlb_bit1) {

It's a bit odd to use this bit here when you don't define what
it is until patch 40. (Similarly for the next few patches.)

thanks
-- PMM
