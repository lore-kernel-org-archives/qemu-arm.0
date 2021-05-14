Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp55225lfg;
        Thu, 13 May 2021 21:17:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrnfMOljbZm99jtLEMtdF9n8Ityqo/lYR3FOzZzoDvjw76ponRJnVVx9o11cAPPjJ7ffLM
X-Received: by 2002:a25:d9d1:: with SMTP id q200mr59524347ybg.356.1620965838517;
        Thu, 13 May 2021 21:17:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620965838; cv=none;
        d=google.com; s=arc-20160816;
        b=WHszngEnDBCShFp+xRinljzHQPC1q5CThoa6SPXyTlTpBMaSEWR5bcOjFy9T8bHL6T
         fsDzPmgYMWUIigTR6JssR+MGpirwx0v0OQwMJM7NGETlQrK+ezODdVSdt6RkxJosmCdH
         90zHbVdOqmLAfTnZ+vPfhvR0DE2NuFL9LOp9Gs4PtXr9M+i6lfjImWeTZdb5FF1f4MIm
         n928T6sdcuxs9f0Kh8vcno5Vz8i2GHmDNaV+WZYie38+8nBmPKvatLosiwFALYRdSutY
         ULdx9u9NbzViQ+HrGWX1/BRMGMxTBg3McsC1tXkUxQWjCGJFhAwlzwfMqverQZ5/zbhJ
         6DBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Ow2TPLpQaGi6HCtIyGujI1lTz32LG2X9sy1YBULdqto=;
        b=wq/60+4T5HrHTp7Qp6UONGg/hq8amuNFmMmSpUjqVQl9dSWoihK2MEEPOSA+qIQOCa
         d090uWcud9pKuVmKEgANk8smatxVF6RUicJ2APVZ7Y7SA1CnvXhAuBE2QXW2eLNhpXXk
         WXIpJB5Vnf0PIKRafzdZfD1O8lj4heSZRtckIbXn9NP3C7tQRoeOcuf73tnGcZYrQssI
         EGExVL/Ffcw/1zu0JdRqNpRNoXRBEGAww9S6yVhxK6MmJ4V6v+HyDr3XglunQUW114Je
         RTTOZsa2rUv2NOePVqP2fBNJpIPzzevxKG4skLJK6eHPGMDlmIg0R6hg8ntvYb6ShboW
         qZow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mhynes93;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l14si4660127ybp.185.2021.05.13.21.17.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 21:17:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mhynes93;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhPGH-0001yl-UG
	for alex.bennee@linaro.org; Fri, 14 May 2021 00:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhPG7-0001uo-Vh
 for qemu-arm@nongnu.org; Fri, 14 May 2021 00:17:07 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:46779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhPG6-00044I-2q
 for qemu-arm@nongnu.org; Fri, 14 May 2021 00:17:07 -0400
Received: by mail-qk1-x72a.google.com with SMTP id 76so27645314qkn.13
 for <qemu-arm@nongnu.org>; Thu, 13 May 2021 21:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ow2TPLpQaGi6HCtIyGujI1lTz32LG2X9sy1YBULdqto=;
 b=mhynes93EX+ZUf1QRQdyenDtARXirwLoQq65McuoiWDHeT5XLz5kjo94eGrFRT2FLd
 C4m/iOl0ox/sT1CcsEB+v6/NM2iP8LWKhQaSRwpHgDUiN8mYPV/Czk+SPYq6vhJ2slNH
 F2XP1tkwUjEa8Zvvj5s5D3pq9RrufkXgQNA3VFhTnyWZXNXd0mADENt5F5ASthJPp3Cm
 KoPsguKGRJoVN1/kIdcTbeohGT81Z2D2LVvAljUtGHIj1f9f37Cabo0RHFzuroLfVKbP
 4JCKKoSrfcOS1GE5zBxflYKP7SNQqd73bomgZhXmuEUCB+bHJ8ltB8ll6orfqWdw30Ud
 pIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ow2TPLpQaGi6HCtIyGujI1lTz32LG2X9sy1YBULdqto=;
 b=ZuzHWFwdFzLACGjrmfV1n2mTbK2/tuH2QVcnn+N2+k6OZIMWO+Wo8rXsHc1wrkQxEY
 Dl3DY+cOyjXLmwxXP3WRbS0saqntBqSMRXdvoX1K0emRtY3/n/LsZCRwEhOH7U5w4WOd
 kRiC0Nl19dxANTdPNquBmumqmxTevrUVcw44t7NabT/PZmjezgk5IbAjXbEedtiTbRjf
 psj807nJBraT4KbA2fegl4NNqw1NZLBky3eW8jYEZR3+eraY4JYDEDbKDf72HD9eDqBt
 yqxGsrlo7JBDKrDhNRt3gsIqQ5rzcgp7zyY5MEUONF6y+hWSoO/FrlUunoTBqY42n+L0
 KH9g==
X-Gm-Message-State: AOAM532XCG//kK1HDc2ET7e/P/YxT3IGqSSKghgl+gJaZAhLLduX3AOY
 5LeKADIA6CDP0ce3+sNOmgZbcyWg+UeYLnlxr0k=
X-Received: by 2002:a05:620a:12b0:: with SMTP id
 x16mr40612728qki.451.1620965824996; 
 Thu, 13 May 2021 21:17:04 -0700 (PDT)
Received: from [192.168.183.155] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id d19sm3529582qtd.29.2021.05.13.21.17.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 21:17:04 -0700 (PDT)
Subject: Re: [PATCH v9 1/3] target/arm: Add support for FEAT_TLBIRANGE
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
References: <20210512182337.18563-1-rebecca@nuviainc.com>
 <20210512182337.18563-2-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a8dc1616-329e-534d-53bf-2ab9aefde678@linaro.org>
Date: Thu, 13 May 2021 23:17:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512182337.18563-2-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AgaJO7y8wY3q

On 5/12/21 1:23 PM, Rebecca Cran wrote:
> ARMv8.4 adds the mandatory FEAT_TLBIRANGE. It provides TLBI
> maintenance instructions that apply to a range of input addresses.
> 
> Signed-off-by: Rebecca Cran<rebecca@nuviainc.com>
> ---
>   target/arm/cpu.h    |   5 +
>   target/arm/helper.c | 281 ++++++++++++++++++++
>   2 files changed, 286 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
