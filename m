Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp299741ejb;
        Thu, 2 Feb 2023 03:45:49 -0800 (PST)
X-Google-Smtp-Source: AK7set8e5Bw7ZmZEE0JCBy6aZs9CjawUm3vizIfzA1CLaYHJhAtBwPl3LZlAxNkVE+C6bg0cIAew
X-Received: by 2002:ac8:5bcb:0:b0:3b8:6cb0:8d28 with SMTP id b11-20020ac85bcb000000b003b86cb08d28mr11161529qtb.6.1675338349475;
        Thu, 02 Feb 2023 03:45:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675338349; cv=none;
        d=google.com; s=arc-20160816;
        b=GMdmBX2f/YxmtxskR4M8CVmQ9HygEQtuFetM3vNDjfZFe/kPWKjFZ8vASxhyY9RgW+
         VwgRNBlBDqGh+QoqAH0mI13W50NuHnhktLQglW6UTyV8mFtinpAlmHPFij9PPCKs6L3G
         zeyWbpdLXJu3x0/lT+y3dF7MeqGAwWX4gMOKWwjhkPeWtBukulN4bkiPXzfRTD27rlN3
         nOd7vwvPHo6upFDlbOA3nUMO0mMxZj8Gi7hTm89NTbgYYC3uf68kFOcNM4EdKOtVza7Y
         082prB8gAnYi4dSilqEsWTO29nnGUxjT2oWKT2NtsT0Bpe3ts7rdNnBE1/C3w6BpAZ1N
         JmBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=k0aMObOWow29Reu+FMBdklIqzz/SDZfvpzgCk6sCugU=;
        b=CWhcInS2FjsBNIEUFFvlsJFLW5yAjEmB7+OIZsBxzqxB4GOfryREJjpze96nGDJq2s
         HCK+eqoJ0IiI4F33HAYmC6XYHe5HAXlwiuPY22QHGSm+8RjhNBF4seVMzXkWzZmzEcGL
         kmCMcQWSn3WGBOUbmTYQgobHihJ9qWbwUAUOmxad2OkVwrAPYS+mCcacOcONiffMLaHf
         BzIS+pIghJUopO5dKfRwqta2UbWIx8lULLQ7VzDlFIo4LkI7SJU8WZo4ueQmP5e8rfPQ
         3YFUtfWsJcfAEFpXJ5/BHr81D3ySiqtSnrrHglPQ40Aa4/v4crPt3sz3ZJ8nV7btHz6P
         JFIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rvvVs0BX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f15-20020a05620a068f00b0071d69e5cb2esi7174109qkh.567.2023.02.02.03.45.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Feb 2023 03:45:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rvvVs0BX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNY21-0003er-EM; Thu, 02 Feb 2023 06:45:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNY20-0003eQ-Ft
 for qemu-arm@nongnu.org; Thu, 02 Feb 2023 06:45:32 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNY1y-000777-VJ
 for qemu-arm@nongnu.org; Thu, 02 Feb 2023 06:45:32 -0500
Received: by mail-pg1-x52b.google.com with SMTP id 7so1139706pga.1
 for <qemu-arm@nongnu.org>; Thu, 02 Feb 2023 03:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=k0aMObOWow29Reu+FMBdklIqzz/SDZfvpzgCk6sCugU=;
 b=rvvVs0BXu31xd6ZW6DE1/ewtc/KX6venFC9/bzbGxe5NeU9UMjAQoBbdCwilZE1Ufx
 PtD2+mBQvQ18iFYD+dSToKDFPpPkZdwk/abVcAzQ2lIDPf7WMT2ocAVW9zhldnHTp7Nf
 GRgocd2qBtdN9YsGX58rG0p1eNZK3Wzrw2RSF6eaGaO3JdzQjF1mWICSeyeNJzUX07sZ
 oL+3biLmSNDgW9/hasW67zmV3+XTdUEkrsffJ2ugslRWCcglAu6/qjKEQyo/a476HqHt
 42aW75bAaO48inVlQ1TR7yxurXy/jasOXrM3Wgj+tYINFStlSiwdw3HvtPEAFuCy+Lwe
 gHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k0aMObOWow29Reu+FMBdklIqzz/SDZfvpzgCk6sCugU=;
 b=bRmP0uqjUNxGnMRnjdOYiJ1sRn6CrVZgw/v0r7mYK0XQJJyQIEaL7ChqljpKEw8fvx
 xf5Aos3Eix4UaCUq1o9dCOxSSqftNPrxwprsI5SPIKcqLRxRBKWRihRTSsuRCkfYpo/i
 VwDYyCCgDc7aYQmxq8z1udnIuHKrk/8BkEXNqhyTy2kEahFd3duR9iQwA1m7oThJwd/P
 O2myVNjGTRIQ76yjjgSpMTYoFlTGVDSt9HxVdA9f25qLTmRMkw1A4sR63P2PzUJNMgiu
 G8SZx0rIJFUUxDbmK2r4Jq0guYqWcA+5HdCrhjdh3Ml3oTCs/wVEnT4pP7mTfaGjywCF
 O0jw==
X-Gm-Message-State: AO0yUKUNkMgwNN+Y4mcvDOygXYsl0wp/1smI5uXF69NqHiRHXuhTZqZl
 YZxee8z/9oyY7A4eVBP+KgZNKMQ+D/EN56Ooy51fbQ==
X-Received: by 2002:a63:ce03:0:b0:4cf:5317:8401 with SMTP id
 y3-20020a63ce03000000b004cf53178401mr955246pgf.120.1675338329359; Thu, 02 Feb
 2023 03:45:29 -0800 (PST)
MIME-Version: 1.0
References: <20230124232059.4017615-1-richard.henderson@linaro.org>
In-Reply-To: <20230124232059.4017615-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Feb 2023 11:45:18 +0000
Message-ID: <CAFEAcA-YvxTgein_EQ6QDtqhKie6to0G9+5ZM7K3s0c2LSDivg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Use TYPE_ARM_SMMUV3
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 60+WizoNx2sK

On Tue, 24 Jan 2023 at 23:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the macro instead of two explicit string literals.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/arm/sbsa-ref.c | 3 ++-
>  hw/arm/virt.c     | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)



Applied to target-arm.next, thanks.

-- PMM
