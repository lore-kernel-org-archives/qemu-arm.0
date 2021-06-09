Received: by 2002:a0c:aa83:0:0:0:0:0 with SMTP id f3csp1018905qvb;
        Wed, 9 Jun 2021 11:09:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDq3t9oFnz+NVnJVWe+nBnI8SRkYcsT4VeEFNo/yz2WI1wIEneepSsmsF1ITofUpCRQvdh
X-Received: by 2002:a7b:c052:: with SMTP id u18mr11358908wmc.105.1623262187806;
        Wed, 09 Jun 2021 11:09:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623262187; cv=none;
        d=google.com; s=arc-20160816;
        b=qefRlP2E+huwn4eO+o2FCdYgTWI8b0B0thohAW26A2cUBh4Qo2lfOezZFfjEyRrJ8F
         N+OdWT0HReNC/8j0u0OVMb+60HEqkyt2Ad0z4+6m6tjfSWtd77JpXIF5X/UbSiJABYUn
         Zj5XEUtOYU5mZzV0GEDon6aDPtXRXBGgq8yEjHSzcu47oZGjDq6bQc4hM/UcjFhK6j9m
         rXEfW6AmG0ihDTNzgCzM8ALvl3vZ4ZO1GtMxbEzqesx02baTArjIBfbJWVIBGth7XDMk
         q0ZJZTYChVYT6ybnGVJCVO+1vqZMIBskQpRJ7jN7farb0UftFUGMrQcFq8HzIEWbNoOc
         iQbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=jzOda2IDinVsnGYfzE23GuU6qvPkGDloM8jg7FlaQ80=;
        b=MRVi8MaW3oI+Ng16T0azyrTVv8kxq6z7JlOiqB17ZczGEebt2Z/i3AB01OSenIQYGC
         5EAokO94Si/2uZk5y4zMdM/djVn0n1+THtMrW3cYdki/yIo7sd94FFvXkeL/cUDb3gfE
         7qkOtrxUzXX/6aMb3zbbb9VrE7qyPh2NsgqZrlqpvsbeyaqMI1K+7BqnMvJF9aODVn7S
         vpUw6E3szjyGdlPlaKqnB5OwGwDaaH64dXYSiYKLwZtoiz+tG7EOubhPoHxohPFo1OX/
         lvJM8LT6q1RG5sg6t30i7SLp99e2pxU+aw+A3PfVK5hEXWvmyb24jTFbyIE6FVsaEcga
         1MeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FWahmwf2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l124si7795680wml.125.2021.06.09.11.09.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Jun 2021 11:09:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FWahmwf2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lr2eA-0002zW-TR
	for alex.bennee@linaro.org; Wed, 09 Jun 2021 14:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr2cs-0001r0-DU
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:08:26 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:41480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr2cq-0001KK-OK
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:08:26 -0400
Received: by mail-pl1-x62f.google.com with SMTP id e1so1600975plh.8
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 11:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=jzOda2IDinVsnGYfzE23GuU6qvPkGDloM8jg7FlaQ80=;
 b=FWahmwf2ImFuLuIZX/CIXepdcWr9YBPmRR6L2hCzXwHi7mWembmAjb02WtZTnONIr4
 QU2A81Dbhox84sH+Ac4wjHcy+PUApbUT2jBMqbNYAwwuEirLSRe6hYHoig5ILFkqw7gh
 gijr8dCqluppU8qtl4raO/De2210dQcKqojU/EmpEEHFEUAg0eCr9KSlvWzKx7g7ajsO
 /5VCgK4dHgTktGRvMGsTea5QYaIYadTFTdzKqmKtA3yrGUHs3qInbBdmVV5KoV9PgO7H
 6h639EWzPMqyQEeSrBq+w35QAW5EL6RsVCpWJmpsqEu0QhJeMJVxBcX0l3M3VE8iIAiY
 WuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jzOda2IDinVsnGYfzE23GuU6qvPkGDloM8jg7FlaQ80=;
 b=O8nZcazPs+wAoyOpZqip7wqt2XIpqghrhlGNZk02yx1sJA0hWOUpbjUbI+HqetG409
 AcWkaaaH8ExCFtW9SihtSRr4q9UwRwqV8nb3a3OZjjFMcVQvKmF4NY01soXNYtutNdR6
 idiJPrMvzbNLkSQpZ5NITiZZMncthliaOB7BkmHbSiSkHYSYHyyeYhSkXdCltKJAWBMt
 sSuAL+wKdugk5UYZ0vvLVZkrUEKvqCxBYLEAcwv1P+V+iZ6dOigD9GDEMitOKoV1jizv
 2nBEpGBDGbh0Vnqq0XphUCSIg/+DMhNkamNWhqA2wMCHsU5UkPwqL6IPWFFVJrz9P2zo
 ME/g==
X-Gm-Message-State: AOAM532j+L+jU6jfwlHAwWKKOZH8jYfpcKMa/26Q/UdktsSmDuYh8ann
 JzK9XypU/XmSv1dYH0u1HEYbai6ATwnaiQ==
X-Received: by 2002:a17:90a:7349:: with SMTP id
 j9mr808947pjs.234.1623262099157; 
 Wed, 09 Jun 2021 11:08:19 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 o1sm306773pjf.56.2021.06.09.11.08.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 11:08:18 -0700 (PDT)
Subject: Re: [PATCH 36/55] target/arm: Implement MVE VBRSR
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-37-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ee491519-c57c-60d0-7721-275f98c99c89@linaro.org>
Date: Wed, 9 Jun 2021 11:08:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-37-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +FMAoodEntVN

On 6/7/21 9:58 AM, Peter Maydell wrote:
> Implement the MVE VBRSR insn, which reverses a specified
> number of bits in each element, setting the rest to zero.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  4 ++++
>   target/arm/mve.decode      |  1 +
>   target/arm/mve_helper.c    | 43 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c |  1 +
>   4 files changed, 49 insertions(+)

What an interesting operation combination.  I wonder what dsp loop kernel it 
goes with...

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
