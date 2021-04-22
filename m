Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp941690lfb;
        Wed, 21 Apr 2021 18:44:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJww89zAPFWm249ouqO2YugUIxlsPV3bBzwNHpC9Zzt6F97pdc10L1l+zgY8CA6j7nYIDpjH
X-Received: by 2002:a6b:ea10:: with SMTP id m16mr691852ioc.124.1619055845472;
        Wed, 21 Apr 2021 18:44:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619055845; cv=none;
        d=google.com; s=arc-20160816;
        b=uXo8OtqLTfIQCEMUM0IeckYkPKaaTYLtNH6uueQkGMHNCboaPgZiedX1lKVMy35e+F
         vLG+Jbq7YZmdFosmOD1ctIPy1l4U7rfBlz7i3PgAARtb7FpgCnaaLzNiQTOshoFtyLVt
         8uO4c919reyk3+7OZQPRrW/acAwmum56FONsrDcOiAQf8EzHpUSG4coydCWIK39D4jMX
         wvMwaXqvGCkp92y2JTBJXNB/ZCHy3dABQZKsqABjyUvCNTy5yI5HSmJ4FIPIDj/rH+t5
         r84oJ94aLQHjG0/wb520x+2swbJnbDXDXb7K7VIc7EbIbskkfVTJNCLpruT5AB6xnNTo
         n7OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=XUJyQC09XBS77p06soDGfu+6ECNMzMdA1KbznqQXjOM=;
        b=ZigS7UZVKYsCt8gfUpKdtzMzFSX1wwkrNGMGqCOblfqs0HLi36drTxwbI+5eDsgRN2
         poZL9kLWu+6DfQV0agGZhSepzdwjgUrkr/KqvoCSkP9zgMcjHdvI7yjvbKMxrIt5ANY+
         X3/OdLhRB5fNGbe01QZAhwNvKIiUZeHdR7tZnjh2BnMj+iwN2lFrKrdp47ygVUYPfVep
         jjiBE4xHZ0PKLEiidTMlYzPgOl9xXgpk+eujbH8c3BUxoLNBfnfXJI9jYva4YeLri9uo
         yn+lCxSWf7CbFvDKdzR94YqXOuR6DWY2vaSVhU/AyHU7jpWCPBPWd8VmCnQ2dKusw7Tc
         FQoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VN0ktxat;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m1si1236484ilh.96.2021.04.21.18.44.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Apr 2021 18:44:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VN0ktxat;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZONw-0001Wj-RC
	for alex.bennee@linaro.org; Wed, 21 Apr 2021 21:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZONn-0001Tr-Dd
 for qemu-arm@nongnu.org; Wed, 21 Apr 2021 21:43:55 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:55138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZONl-0005R7-NC
 for qemu-arm@nongnu.org; Wed, 21 Apr 2021 21:43:55 -0400
Received: by mail-pj1-x1036.google.com with SMTP id cu16so18444738pjb.4
 for <qemu-arm@nongnu.org>; Wed, 21 Apr 2021 18:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XUJyQC09XBS77p06soDGfu+6ECNMzMdA1KbznqQXjOM=;
 b=VN0ktxat2f4nWng7EyXYDwpnc6vf8d0dBa52kx5vB9R6hu/lRA8A7ToHGEuG5Rq15D
 /UJpLyZXGAtyjhz5uaGrJKFo8GQThVGfJumfVz1PDT7pvQX+pbdeLqjsfP/58MNOFwod
 /lBa6yB1QDEs9AO9q7tmtwMJaSYPjjWYJY3jgTgxjCzmvzGgWw53QcdPBe7N28TzctNZ
 TTYMNUJq+vX8M6zZN+AgEDKh5opkW7DWDgk3RnANJ/bVxlX6W2V7YeO4WNKITsPX6mZD
 4+pBNVye/H5tiLXvaC/fKz50flgcTF8rEdc0NfCk9T51fqKuRMkYDNeQZFssafX2fkfN
 itEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XUJyQC09XBS77p06soDGfu+6ECNMzMdA1KbznqQXjOM=;
 b=NHfr5M81Ii5WvWqzLRblds6S7XSvTz++/2tAsn4ZWH+NLJ38hXw7wWrQsXuMgeAEQ3
 CE4dt56RKMpxm2AMmIXSmhn/Dl956VqZTkuw5+1yH8Ak3Aq6JO0b3QU75AZehk2T2U90
 CHnFQ3syPe9I5UqfpAqdsrwaKp3WrNHDqY8l/zAFeAKel6iwsCp1sovzEtphm2yvPAEH
 VXjdUZddf7Dw9yeAPIIThyxwgjbmIEqGrBj8GTdQg4PHsCqidqA0THrYVUQcFXUnmdUx
 14RxJY7/XsZ+r16nt7Ct9ev7DN8rawSSP60oHMr1AnfToCgHtBEsTCYoMesAOZVQOTuT
 68SQ==
X-Gm-Message-State: AOAM532Fny7mi4pLhB1DWC7WUkl6Suy/xCK0k7yNOHhTuuCukIijCL1H
 I9Y72jOugxyoq09b2K9p8IP3/Q==
X-Received: by 2002:a17:90a:6b84:: with SMTP id
 w4mr1196198pjj.134.1619055832344; 
 Wed, 21 Apr 2021 18:43:52 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id lk6sm3356553pjb.36.2021.04.21.18.43.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 18:43:51 -0700 (PDT)
Subject: Re: [PATCH v2 5/7] hw/arm/digic: Map flash using
 memory_region_add_subregion_aliased()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210419094329.1402767-1-f4bug@amsat.org>
 <20210419094329.1402767-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dec790d2-9fa7-169b-c2c7-2b8ab3ac187d@linaro.org>
Date: Wed, 21 Apr 2021 18:43:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210419094329.1402767-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 David Edmondson <david.edmondson@oracle.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NvN/IvFO0Ahc

On 4/19/21 2:43 AM, Philippe Mathieu-Daudé wrote:
> Instead of using a device specific feature for mapping the
> flash memory multiple times over a wider region, use the
> generic memory_region_add_subregion_aliased() helper.
> 
> There is no change in the memory layout.
> 
> * before:
> 
>    $ qemu-system-arm -M canon-a1100 -S -monitor stdio
>    QEMU 5.2.90 monitor - type 'help' for more information
>    (qemu) info mtree
>    address-space: memory
>      0000000000000000-ffffffffffffffff (prio 0, i/o): system
>        0000000000000000-0000000003ffffff (prio 0, ram): ram
>        00000000c0210000-00000000c02100ff (prio 0, i/o): digic-timer
>        00000000c0210100-00000000c02101ff (prio 0, i/o): digic-timer
>        00000000c0210200-00000000c02102ff (prio 0, i/o): digic-timer
>        00000000c0800000-00000000c0800017 (prio 0, i/o): digic-uart
>        00000000f8000000-00000000ffffffff (prio 0, i/o): pflash
>          00000000f8000000-00000000f83fffff (prio 0, romd): alias pflash-alias @pflash 0000000000000000-00000000003fffff
>          00000000f8400000-00000000f87fffff (prio 0, romd): alias pflash-alias @pflash 0000000000000000-00000000003fffff
>          00000000f8800000-00000000f8bfffff (prio 0, romd): alias pflash-alias @pflash 0000000000000000-00000000003fffff
>          ...
>          00000000ff400000-00000000ff7fffff (prio 0, romd): alias pflash-alias @pflash 0000000000000000-00000000003fffff
>          00000000ff800000-00000000ffbfffff (prio 0, romd): alias pflash-alias @pflash 0000000000000000-00000000003fffff
>          00000000ffc00000-00000000ffffffff (prio 0, romd): alias pflash-alias @pflash 0000000000000000-00000000003fffff
> 
> * after:
> 
>    (qemu) info mtree
>    address-space: memory
>      0000000000000000-ffffffffffffffff (prio 0, i/o): system
>        0000000000000000-0000000003ffffff (prio 0, ram): ram
>        00000000c0210000-00000000c02100ff (prio 0, i/o): digic-timer
>        00000000c0210100-00000000c02101ff (prio 0, i/o): digic-timer
>        00000000c0210200-00000000c02102ff (prio 0, i/o): digic-timer
>        00000000c0800000-00000000c0800017 (prio 0, i/o): digic-uart
>        00000000f8000000-00000000ffffffff (prio 0, i/o): masked pflash [span of 4 MiB]
>          00000000f8000000-00000000f83fffff (prio 0, romd): alias pflash [#0/32] @pflash 0000000000000000-00000000003fffff
>          00000000f8400000-00000000f87fffff (prio 0, romd): alias pflash [#1/32] @pflash 0000000000000000-00000000003fffff
>          00000000f8800000-00000000f8bfffff (prio 0, romd): alias pflash [#2/32] @pflash 0000000000000000-00000000003fffff
>          ...
>          00000000ff400000-00000000ff7fffff (prio 0, romd): alias pflash [#29/32] @pflash 0000000000000000-00000000003fffff
>          00000000ff800000-00000000ffbfffff (prio 0, romd): alias pflash [#30/32] @pflash 0000000000000000-00000000003fffff
>          00000000ffc00000-00000000ffffffff (prio 0, romd): alias pflash [#31/32] @pflash 0000000000000000-00000000003fffff
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/arm/digic_boards.c | 8 +++++---
>   hw/arm/Kconfig        | 1 +
>   2 files changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
