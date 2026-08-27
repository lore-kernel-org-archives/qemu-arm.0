Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF17C61DB9
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 04:32:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzRmx-0005Hc-60; Thu, 27 Aug 2026 00:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzRmw-0005HN-Bg
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 00:32:30 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzRmt-0002lV-MR
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 00:32:29 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-38e42560ebcso1691202a91.1
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 21:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787805146; x=1788409946; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=VKO34dmITIydInhjpUNQQ+4qHnJ1xyey+i3SuLs/zMg=;
 b=HvpfFruPLZg4hkirTkZoDotzLXUg6L4yCeCkfJdRuYGUzv7zlqR/UEUMmyyEIa/+a/
 RR3eXENxfusaux7DbxhkUI0481NAX9rucPMoOx9wKrj5KTycI6gPFHYzDg/pLTT/fsOA
 zL7dUKqW3YON0/c5Wx3aO5pUuk9e+Gxqkcyy8x46L+rFEbFh6REel7sdNkn1cKlS2TyO
 kGFuITWA3oSRdvOXvBPHYwg2cyhiFuzyqFG+bg9t4W96A+abivCLmU/bFQHa8dOXJcoU
 flkLHa1sX4tS1viddEnQTT0BGzkLYcOFhrhgy1ohRmwTHTJBCees1pM49Arf/lTjcyAb
 lBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787805146; x=1788409946;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VKO34dmITIydInhjpUNQQ+4qHnJ1xyey+i3SuLs/zMg=;
 b=oFtReRYeTXn7KDo7gV+nkuDaW+HIvzZaBX03G4MrwEDBIGGk+dkKxnxvslrT8HgTSr
 xVftaTly9CsFV//v8G6dfDU/Ma78zfYfMHNmhkh42AEouJyUMK+vSMhur0rHbg9hQJjQ
 HGc2ZOhEO6Fmih7smFD34US1l+YXe91iIX4JwvlP8q7wjkLD/gc7er07TSSsewONgfAO
 +77SZnIxwaQJYXMHEP/d3jF9nhW2tjo8ac+66JGMbrSbBL4y2EsxRBDnJJp6n6rD97Hy
 NgtIyIpuNHHj+X3tvXdX9dw9WUbGJEPisl6Vf65OB4dPPa4s1loxkV1i8UxpGNcs+m64
 e56w==
X-Forwarded-Encrypted: i=1;
 AHgh+RpJnK5ZRONsIVUQmD1F4EAfVi30J9iYBjUfes0XKTY9u8i1EGSRog1+Yo6HxcxiLv3g7zCW0ED/2Q==@nongnu.org
X-Gm-Message-State: AFuF++nMqFlKOxWCjwkPVEEfE8QuUlCKkQ8Q69iwNiprx++1TytqRPtI
 /ZwdP1gcpUg8djHIGzb/wqxUuBndcMi/TJoyNwElPK29WVjpxnx42YXk4/0uhwurGwY=
X-Gm-Gg: AR+sD11txpuD89AmMArL2UIKc8wejIXs4bxaGMpcVaM9oWrRhFV5ghGuPN+oxd01UcT
 i361Qe8O5/PnB01OuywinChEFjP4U0CIEtIFrOnOOyp4lEyrLAFbTt68iRsbta/W7DjwpF2XD2S
 lfN5WTNerYS7cmvZI45J/cktX/RRFdM6HXbSpgFUXcxo9m0wbZv+Q6ka81g7bUYOtNQkWwmRaCb
 XvlVVpsRkJ/PVvghzFVUd37HZDhVGpuDhNgIvIvZTmD3qoe9tiv6x/cW02CN9j7A2DeMqFSI2M/
 Y9iOhP0STbdrA/XSbQ8vHDcOuLd2UBpfePbrylf+ABPWW/9EwyC6+66fHDsEIeWE99dQdJQZXVY
 qHuJ1ovPUI9aQqmEIaRK9djale5bp4VQi0+NB7h22uyiaasoIBJSbkLF6gLbiAsTQAKTMyDIzDk
 uchWV5O+uCiM/npJF7eNqRgKv69HchX+UidAAhTpewleN6omrG/twF9XRdMsRCTeLY2NnjCFncK
 t1lJYJM+7Nn+VfOSkAlWRHwL7GZ
X-Received: by 2002:a17:90b:5543:b0:396:41d1:cbc7 with SMTP id
 98e67ed59e1d1-3966d13eb75mr25876574a91.3.1787805145822; 
 Wed, 26 Aug 2026 21:32:25 -0700 (PDT)
Received: from [192.168.0.4] (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3967059c288sm1915648a91.0.2026.08.26.21.32.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 21:32:25 -0700 (PDT)
Message-ID: <5e5138ba-2368-4b85-9415-af8f42965c3c@linaro.org>
Date: Wed, 26 Aug 2026 21:32:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] util/cpuinfo-aarch64: Fix build with older glibc headers
To: Tao Tang <tangtao1634@phytium.com.cn>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>
References: <20260826163753.459661-1-tangtao1634@phytium.com.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260826163753.459661-1-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 8/26/26 09:37, Tao Tang wrote:
> Commit 761bfe07b2c9 ("util/cpuinfo-aarch64: Detect FEAT_CSSC")
> started using HWCAP2_CSSC unconditionally. This macro was added to
> glibc's AArch64 bits/hwcap.h during the glibc 2.38 development cycle,
> so AArch64 hosts with older headers fail to build.
>
> Follow the existing HWCAP2_BTI handling and define HWCAP2_CSSC to
> zero when it is not provided by system headers. Such environments
> simply do not use FEAT_CSSC host optimizations.
>
> This has been tested on an Ubuntu 22.04 aarch64 host with glibc 2.35.
>
> Fixes: 761bfe07b2c9 ("util/cpuinfo-aarch64: Detect FEAT_CSSC")
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>   util/cpuinfo-aarch64.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/util/cpuinfo-aarch64.c b/util/cpuinfo-aarch64.c
> index 4ce6deb7c82..e3446762149 100644
> --- a/util/cpuinfo-aarch64.c
> +++ b/util/cpuinfo-aarch64.c
> @@ -16,6 +16,9 @@
>   # ifndef HWCAP2_BTI
>   #  define HWCAP2_BTI 0  /* added in glibc 2.32 */
>   # endif
> +# ifndef HWCAP2_CSSC
> +#  define HWCAP2_CSSC 0  /* added in glibc 2.38 */
> +# endif
>   #endif
>   #ifdef CONFIG_ELF_AUX_INFO
>   #include <sys/auxv.h>

Queued, thanks.

r~


