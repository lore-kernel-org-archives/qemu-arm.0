Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3737935lfm;
        Mon, 24 May 2021 10:13:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzA5u16WcBK4ErNycd2BuzL98jFQ8CsMmSvF2IhRVlkrTXqv25EMgb2kduEJdFZsTodpAtM
X-Received: by 2002:a05:6102:b06:: with SMTP id b6mr21408585vst.21.1621876433769;
        Mon, 24 May 2021 10:13:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621876433; cv=none;
        d=google.com; s=arc-20160816;
        b=1DNBKp8Npe8EwoyXyPTKH7D3jCeUHQ34WlyrGocvBUfB6G1oKplMW09WLLJsZtyn77
         QKvweUUXEeq0M1kjIosVSplw7Bq4lANgsDLfU1w5P2F97EPJaoUQXBbJEpony9Vttdnh
         m0zte9fGcCnqmRn1DL9CXW8c8Dph06nuwHbmpMrdMQMm4ZLMmnPIChVkane3kug/aIqt
         iqTj2UiFeUlAJd3Apg1K/FvQuyPGrmcZpvK8cZ4zy9vGkY9QJqKDSzXgmyGcxBiA3Kqa
         wi+11x0PWvRQMabWzADdUR2pwKiq0sQNrpk2uENmxfU6P5v+6nLZU4+WECHHCUNVNVR+
         oaxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=/BE8GQotuAxCnJErtLEhLKYlIw/wJ3YwlSBiOkiCd80=;
        b=W2r9dxq5CQW24OD8arZkj2lagTarmpRMVlLHbK9bTktVDJQsXUp/LxYgAc85oj28E6
         LwYiF1nbNK900f0tfulEwnVjKFHu5YTxteNZaBvvmzZh41aDKaXQtRPawFfqJD8NWzRB
         GeY6rgPon4U6/G8W1ZO0/lq816dw8wWrXWja4/HZZTu4EsjOy7PXD3/mcKaTg9FR4XcW
         0tYRHxmhZ81m/Z1FUjKtwIQ5nfFYu/iqfgEAL8oOqpCAUxCiELMG7WMnweqcwdEmS+6+
         pTiU7YjbOpKy+pogpMjmESvQPefLfVIRhtMKSCKyjVKDDA7UXhE9W/rJUfw3o5NDrcMI
         JxYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DqQFty9m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e10si2696032vsj.374.2021.05.24.10.13.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 10:13:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DqQFty9m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llE9H-0000IB-JZ
	for alex.bennee@linaro.org; Mon, 24 May 2021 13:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llDso-0003Al-Bo
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:56:50 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:43992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llDsl-0001Lx-QX
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:56:50 -0400
Received: by mail-pg1-x533.google.com with SMTP id e22so4792226pgv.10
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=/BE8GQotuAxCnJErtLEhLKYlIw/wJ3YwlSBiOkiCd80=;
 b=DqQFty9mvMsmbOLfnJXat/Lyo3kqBXHgAxMQkbMwsXFLsT4E6uSGqJHJDQ1DwZ15rD
 soCWZb190NLJOvdMJcKDX1xA3JCRkZnAkkB0D3QKFdz3Z062gDrvyzvrEibkLy2CvU8K
 /aSQIkg+qYONp9KYWnngPmf/l0re9R1YY8BbDZpnjYLA7GpGkmgHfnvCV+IaPNe09R5s
 HJxtI2QfaLDNFJaxsnjRooxiwsZMTPm/zuWRvnaL6NR2T6A3YBpzp4fPsPulidAG3KGR
 4B6bFBb6MuvulqIBtLlswBYNXxjuMU/R/M3kX9MnLj2BseZwL2cyUYI0ZZnlHFP2t6x1
 pITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/BE8GQotuAxCnJErtLEhLKYlIw/wJ3YwlSBiOkiCd80=;
 b=oAbam2znSa6ikskeq1o8Adai5GGMEtXP04QDcZkmgQYIcka/traa0rtVzWz2RYTsnL
 K7PD1VF1MhfqQEflPLcU6vJqxue40s7oNLwJtcgCTJp2BRBd8qeZf+QMOyLL5dfTVd0N
 KbiWRxVTrtROpZ++YBSJ9bvfgnto3fRVtVBdniUat8KVW39ONMs5UnJOdo8J5HQSz+vV
 nuOz4F8PKPqg6h272sMiIqbFSDuSd1hcfThogKjHdfEgGAjUz+z6A0UpwXHenNUHnvwS
 QqJdQiC8/+WlPNRbpA2p70Z5st1WuilWYT1EY29kX2yZOWBtc/0qI5KwE9A4hMWN6ZeJ
 lVew==
X-Gm-Message-State: AOAM531qnnPAh763/2XxQtC0pGyUq9qRbBjAkFpR36gRW08zlWMp7ZDW
 r4XZPNq/q6IttYc9zQGG2eLJw3OHIxs1ug==
X-Received: by 2002:a63:5b0e:: with SMTP id p14mr14168704pgb.110.1621875406211; 
 Mon, 24 May 2021 09:56:46 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 ci2sm10555008pjb.56.2021.05.24.09.56.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 09:56:45 -0700 (PDT)
Subject: Re: [PATCH 7/9] target/arm: Make FPSCR.LTPSIZE writable for MVE
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210520152840.24453-1-peter.maydell@linaro.org>
 <20210520152840.24453-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <23a65549-1a53-c5c3-18c3-9e3f2355ce3b@linaro.org>
Date: Mon, 24 May 2021 09:56:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520152840.24453-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
X-TUID: hFRWsd+JoYn+

On 5/20/21 8:28 AM, Peter Maydell wrote:
> The M-profile FPSCR has an LTPSIZE field, but if MVE is not
> implemented it is read-only and always reads as 4; this is how QEMU
> currently handles it.
> 
> Make the field writable when MVE is implemented.
> 
> We can safely add the field to the MVE migration struct because
> currently no CPUs enable MVE and so the migration struct is never
> used.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h        | 3 ++-
>   target/arm/machine.c    | 1 +
>   target/arm/vfp_helper.c | 9 ++++++---
>   3 files changed, 9 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
