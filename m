Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430BAFAD3E7
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 03:13:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFkUp-0005c4-0i; Wed, 22 Apr 2026 23:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wFkUn-0005bl-WF
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 23:12:54 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wFkUm-0008TQ-JI
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 23:12:53 -0400
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-50fbd79350dso20143721cf.3
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 20:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776913971; x=1777518771; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=A7rftyhxoXaZarufYHH/mlZY2wop184s51SIlAQ4vRM=;
 b=ndE0VzJD60refkAH6yBOVZ2p+Evi6TAJ7I6ByDkKKk7KWP0jZ3kd9qf3Zsec3teIJ+
 zYIFzvqi2R+0FB3ncBK9h+Rno7bL3k+bJp/sTny58ZVDE0RSpQupvITGgrl8yHUaUuUz
 0XzE66KaaMdm+Fq9MMZdjwWgzR1ptXvSEbCIFaeqOkwywusUWbi9THTBNScXZ6G3amzH
 RyT1eE40bRvC/R4GaJvyhjgC1cYU53B34P6wF9Oot/zWl1ZqmD/OoJltqPQtY2e5O6Nl
 VVx+wSguLalPSOZTxLzzg4JdsZRn/4oveCnyb4wt7kgOINbPEAksGQ2/KvtdAZtcePL1
 kO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776913971; x=1777518771;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A7rftyhxoXaZarufYHH/mlZY2wop184s51SIlAQ4vRM=;
 b=TQZtIMpCP31+Prx1AtZD31ty0mbTF5TO/y86QvHXx/aRGHaIRaq2fkA8nN8d757ZQt
 LAws94Ft0ZTI1LHHftsQgghQwerlT8pNqGctiqeKHy4v2ModLsD+cMpBDJDfotUSDmVz
 emBfxi8lJmBECMW5tY+JgyYrzTfMK6bvaBaa9SdSqb7P/5+Z+CyiqyQ5y8gzMzUtk88y
 DyS8JmfDhotCWYaHIsBzSgXs1j4j+B/6fa+y+z7eiaE24/dF/Mb9qanJB5Ift2/VIVzj
 u9Vd+AdKlGgBuF3VMptF5YxNe+MhUgfBelWq6yR4rzihbMBooykPp+kN8KNH6qO3U788
 0bbw==
X-Forwarded-Encrypted: i=1;
 AFNElJ++KWDrbr1rjkYB7JoX1P5FX4n6vNlfWoj/3IyukIZtYlhDKN8fwDtz0UFAh77NxjyQdPnmf228lw==@nongnu.org
X-Gm-Message-State: AOJu0Yy5D0s+491FC8E20iuBt0U3NYcym5LBztDm6cU+OZvA5P0lBHKo
 fEzhaa9P7D0jmrnLj/ak+n98rzYtVYZ3TIKvhtwEPIwTquTeH/28QLd9AmXnB7G4ovc=
X-Gm-Gg: AeBDietpeRvVs49AYFd4dexzvNBWYdwTb36YSmFbDQ2WKEJY93pw/TCswp0NH8TA+Z7
 4INBGm5ddK/NHDVkHevbtreAu/qbS9ROGOypmlnCDt2wIdAquURm0kKS+seWSGxoLjkzDlrmLyz
 mf9h4/DJLO/4nrqO2eSl564v22AhxLFx4/kH6IMZL1L+ugi7hxWyPnqHz+E/Rx1v99RLlh8XVvN
 hYg3yKx9oyJB6spK2E0e31NOIu9REtSKnpxDme0PbuUfKmls3btnYW1uEOTouez+6hOL7M8yU3w
 +x3BcxldgnSWdJCy4r/bRaE1Xz831G1+l9fmV9VyrMjTZY4bCaThgSHT4TfBzDgktwpHx2mCo2g
 6Mo0p/9WTELRc6+u3LFXK6yP1yyYQrKo8Qiylk6Ks7duFJDgzbpRzMwXVEQB3Uc27AxivBNaXnU
 yigG+lytdYbOtTxN/csVcFI+6mJ6cxPI56VwfSGthq9ni6K9zegqpkwjQVsPTaXHHZigjsUfKR0
 kbDlKjudF1JyNsxePTO28oqVJmO
X-Received: by 2002:a05:622a:258d:b0:50f:bb54:d3d2 with SMTP id
 d75a77b69052e-50fbb54daefmr128285041cf.51.1776913971316; 
 Wed, 22 Apr 2026 20:12:51 -0700 (PDT)
Received: from [10.72.56.227] ([172.59.184.224])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50fbe22130fsm45155541cf.15.2026.04.22.20.12.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 20:12:50 -0700 (PDT)
Message-ID: <44df274b-6179-4e63-aee4-1e29ad5f4b23@linaro.org>
Date: Thu, 23 Apr 2026 13:12:43 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] target/arm: Implement translate_for_debug
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260417173105.1648172-1-peter.maydell@linaro.org>
 <20260417173105.1648172-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260417173105.1648172-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
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

On 4/18/26 03:31, Peter Maydell wrote:
> @@ -3935,25 +3936,30 @@ static hwaddr arm_cpu_get_phys_addr(CPUARMState *env, vaddr addr,
>       GetPhysAddrResult res = {};
>       ARMMMUFaultInfo fi = {};
>       bool ret = get_phys_addr_gpc(env, &ptw, addr, MMU_DATA_LOAD, 0, &res, &fi);
> -    *attrs = res.f.attrs;
>   
> -    if (ret) {
> -        return -1;
> +    if (!ret) {
> +        /* translation succeeded */
> +        result->physaddr = res.f.phys_addr;
> +        result->attrs = res.f.attrs;
> +        result->lg_page_size = res.f.lg_page_size;
>       }
> -    return res.f.phys_addr;
> +    return ret;
>   }

Inverted return value.
This would be obvious with s/ret/fault/.


r~

