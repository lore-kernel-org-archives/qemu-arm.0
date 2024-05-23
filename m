Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1019416ejb;
        Thu, 23 May 2024 05:20:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUs/unarrd+cL2nXsevyS6GvfBOHCq84iytH1AlTpDRaxmoRRCezUTBxqRpapE24FUIAaN1fTqzdOhZNnaAkVmxjnbuip0o
X-Google-Smtp-Source: AGHT+IFxZ3TvepmprBnVh3nYzaNvd0bdwv05BpgcgXpH+BHVV60RsWAQWSJ9dFOm0MG6OK0e3zka
X-Received: by 2002:a05:6102:2084:b0:47f:3557:84f9 with SMTP id ada2fe7eead31-4890a3c6078mr3422125137.35.1716466801245;
        Thu, 23 May 2024 05:20:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716466801; cv=none;
        d=google.com; s=arc-20160816;
        b=MSdjcgwYPpG90zhcS2o8QL16At2R3dMUOeWKrwUqv/zB/0OQhiPFGumQmFtTuSpfLK
         JZRoDfhcVa/kJcoZz0a+/bDCEf/daG+atWEnBZgZ1h571vbp5BuwfjaWVpH5Rfw3OWGM
         mZb8/op/PtSWZNK2So8yz8yTXqlZDXjfzmNj04orfrN7qqeWkdv+e78kDR/a0nxv0xIx
         pc7Lo/1yS8HH9O+zDAdIUKRkI+7/E4d0VdDEGzF/dG2UpZr9brbU4Rv6e12O5nRz1xgN
         MiZWACC8oNC1vKVAtjv0uKRwT1vpCO5SXKFy7I+Pc1N064ZNX1nzgRv6Vcn9irjUntpW
         z+Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1+cVf4rDxeh57dwtYlokQVa3htFdPuopK6yJ45QAiM0=;
        fh=muosvbEQlZlPjxf/HzJ7h3wAhlPPGPqMFWP7LhqxGI4=;
        b=xhA6BvLtCdeSg+Lh70kro3xNEwHvKbPBERQxZ+dLH2wOM+7QQmGnFoSA2K/Yz7Z4Lv
         8rz7/YWB3UzkLRrVstgPTCWHWshvC1XPIBnnwVsQuiUrejbkwTQRR9bjGZR3T5mb96nI
         gAaHwZEJ+8WdA7dAlYiHCb12vEIQP5DBTNglfs6QBzyj5Gx/+vgCrQS+5NXEq7uF0exd
         ceTtdYOfL72BwZ33mkkD9MizyjWelwsvu858HwPoyzFFsNWFk7fjWOgrIvpa0+yqraM7
         c5PpiL4kkHFJeeRvVrb6Lw1cYeqsIugPzrgBRR1IIQeDRAvGyjLTPP7iHrgLI0n6B2iU
         xaow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZecZI86U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4806cc91c22si5446624137.627.2024.05.23.05.20.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 05:20:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZecZI86U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sA7QF-0005HX-S2; Thu, 23 May 2024 08:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA7QE-0005HG-SN
 for qemu-arm@nongnu.org; Thu, 23 May 2024 08:19:50 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA7QD-0005eX-5I
 for qemu-arm@nongnu.org; Thu, 23 May 2024 08:19:50 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-57847c08e0cso860411a12.1
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 05:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716466786; x=1717071586; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1+cVf4rDxeh57dwtYlokQVa3htFdPuopK6yJ45QAiM0=;
 b=ZecZI86UDdcSfJKLWB2RLLVz8FvpCL9oFCTK5yEnC8Sd4HjZFw48/Ok9Aydz+flTPC
 gCOQWzFJOrPQ8dRtk+YWo5iVCMY4rNGLdPSUkh4GU/Z++LzHYycx33gvyY8TjW5T53tE
 H6wujQcxnVA221kiBd+bKrQUOUxRKTaeN0hg9hgkKugNM0aZsv0F9DmEnpFq58o3w93Y
 KzdaDvHa8nZgXLBxRlC24PyuSRkQTK5LUQarK3RfGpaetugc4gbMTKyXPscS5G+WBKg5
 5VBNwRPx12UbmSHWfdL7PiRuRxnVnl2tkzfF32AGO5y7MflS8zlRu7+TUMRw63EG9H5e
 8CHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716466786; x=1717071586;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1+cVf4rDxeh57dwtYlokQVa3htFdPuopK6yJ45QAiM0=;
 b=vbzP4NIj7UPItKRRE3ixaajiHCrjF6vzZoQDlkU1TMDVY5EjrCBAhZVUG44LbTzLuC
 uvmlV2n7UJF2VLOeLRgpKw+vrvdTqThPM1Q0yjEaIIeEzOaa8K2/3Y6iYsnxABPNXRRB
 Z788TdCsXjmFV64hKP7fU0JT8oCPwhNGIk75NeUmEtNyluIk9IzN7/svYsTDZFLTqKuO
 J3ANxHWc57bCZ2/UFeJsnpc+fbhi+q61R4u9sIxh6EiihcbkRYwFskfCwAfc2pYd9Am5
 ynH3++sVHvIQJJBY6oRh4T/v9Ywa01mhlyM6tn10QhqvzQmQZSNxCu4lMzGclBDKBk/b
 KZbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNCwJY14HNG4RWLIa4SPrr8iTRjzUjvltVyAQDNks6KunqjPqm7FCySyFLzF04P4JXuTh2JViwffDnZhMSnQajyj4E
X-Gm-Message-State: AOJu0YwQk8saytnZPN6Sy3DRq57mLSGjiewNSO1hFt/86KsKKCuxtDMD
 U3ySYSys+Bz/YT/sqF4/8NP4AF2zmhiAZvkVPO3LY0m1QwqzLHkDi/HDu5x8f6i/2Y11DRKCRp2
 m5ejeSFPAqh5j3LulqA/+juMwMLkDNYOxGxn4IQ==
X-Received: by 2002:a50:cd43:0:b0:574:f83d:b282 with SMTP id
 4fb4d7f45d1cf-57843c4337cmr1767985a12.2.1716466786385; Thu, 23 May 2024
 05:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-21-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2024 13:19:35 +0100
Message-ID: <CAFEAcA9k=K9H+eqCU15N+FaWQZWJFMZPQX1mD7azqeiYDzMzpQ@mail.gmail.com>
Subject: Re: [PATCH 20/57] target/arm: Convert FRECPS, FRSQRTS to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: iFU0VJhzAGgp

On Mon, 6 May 2024 at 02:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These are the last instructions within handle_3same_float
> and disas_simd_scalar_three_reg_same_fp16 so remove them.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/a64.decode      |  12 ++
>  target/arm/tcg/translate-a64.c | 293 ++++-----------------------------
>  2 files changed, 46 insertions(+), 259 deletions(-)
>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
