Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74A0F99C6D
	for <qemu-arm@archiver.kernel.org>; Sat, 18 Apr 2026 00:15:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDtLA-0001sD-55; Fri, 17 Apr 2026 20:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wDtL9-0001rp-2H
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 20:15:15 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wDtL7-0007DQ-MM
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 20:15:14 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-35fb16e56efso838523a91.2
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2026 17:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776471312; x=1777076112; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ef3Y1vcO0G9MXunz1uI42GlsTDK2/kdBHcaH2ZJosvk=;
 b=gWkYc3k5kvEWGk9u3e6Q2GNzjEx87furqI5NeP16/NbejxJD1jUvf62MVSGkPdJHNM
 cOQrHZGf3ZaQg9Tb9BxZRh7REsxRc8F5qmdkSma4xUAo96lzVEpNU5lxrvhOcOSDW4gh
 hGhCgx+DCRj/MvBj9LH3QqsDy3RNEK7DIQgl2LApeDhaENg8MkCcVzH+UfQnhqq7POSH
 iYG8q95KhkWNlqsV7nQPUIhxkup2wG0J3rGSPLOyseLHDfSSNhipReMWF9sGz0RQZrc5
 xQYRCu14fgUcmb2glmq74+BDWMfrwRjIQ1d/VPY4YpLpjR7GNYJV7n/tEK/tknqQRnA8
 4MHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776471312; x=1777076112;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ef3Y1vcO0G9MXunz1uI42GlsTDK2/kdBHcaH2ZJosvk=;
 b=HkB1PUUpsOc4pXuM46VrfIGzHkie/UbId8ZeMALD5+arckXCUD1YOokUk02Xld7T/9
 jGJkB2DedoaxALRImeIzbxa6nWv8fbmwqxABHJ/yPb/L5Dk/f4rRIcs2LSpQI/8v9iak
 Ng0qW02grCz+0d0QTyekTfmcpZib4ALNiELMPass2drg9T3KtuxVKn+rQ0eAcYqx4oSP
 tFA/nC4VRmMVHvAS0EKwLviJRen4hmcdEIh0Zf9RWzzjrtSbLa0GsIpTCCDv4hpVx7iI
 ThhsMaSYCCSKuW2mdEyWfBKjRpM5H35qLr3JcyAXjkTdiEymGf0bskDkCisl9+QYkkIT
 ICnQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8frKxumkEeggcSjRHNe7iQyxq5M0MTZSxDoyWJVN6BCNk7LlUiHu5O0n2BtEqyKZ/CgyDZ+vgkbQ==@nongnu.org
X-Gm-Message-State: AOJu0YxAkEiWZ9PEHPU5PXC4TDpU6SPDIfMb7ij4kJNIBks52IoIX6GQ
 ovjtAumXRGonV1FwbEg/shBHptr0GgoBnuEwaZYbs9rgcHKBIxgIJ3ey9Yi6yuHhsSI=
X-Gm-Gg: AeBDieub2f+6L4DfETAZBkZ2mJSWMuh4SMiQD55rI+KV3tJ1A8LHHdAmDDzrpxKEyHW
 wjHtacvmvuChJtJpe0RsLnmCH5ovib5ixd4kS3FYY+G2LB/1O8sNcbpGCS/xTYvpT8ueBfFX4zU
 uIZpNxQ4eYR8a+acvGhn6gtkNBvuVSGlJhw+QEd4DqGZYzv0YDLkt/ttcVev8ZvH05+nLnKA//I
 d3UWH9HosZCaPb1Jg9acAnzfT8PkupX0ZUB/gxLqpRjGVWxpfChD1WuFHDcTb4TH6oTo7i9AP1J
 Fjg5znkWFuICtHziVitCOD6OKjzTaB0kLQojPTyHIzHBvUUhV1joj5aeEpfg6MYUYBidsoq5E2W
 dlTcvbvF8qh9Q7hbrpkdrpiNC+3qkJvsYlJrKLCDMRvCCYLzmABThunI7+SJU8t/TH3zPJRsvIw
 aDf/oZj/NFTUBOjojja8y0Hs45GOMy2rUFrS+kylObkm4o73HZiBmNALkfVIU6myxdmMa6SYdxw
 7F//pKJhbMpY20huqyeb1zPy3u2KzdywvrKiPOLBRIWGxuwfeDKppAPK0rKWUvMuw==
X-Received: by 2002:a17:90b:3d01:b0:35f:b75e:fff5 with SMTP id
 98e67ed59e1d1-3614048b7admr5679270a91.22.1776471311212; 
 Fri, 17 Apr 2026 17:15:11 -0700 (PDT)
Received: from ?IPV6:2401:d002:dc0f:2100:742f:8dfc:5be0:dc23?
 (bg30dhzyct7sk57q2zln.ip6.superloop.au.
 [2401:d002:dc0f:2100:742f:8dfc:5be0:dc23])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36141975515sm3097813a91.15.2026.04.17.17.15.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2026 17:15:10 -0700 (PDT)
Message-ID: <ecee1f9a-606f-4b03-ac79-e7ed1de4e481@linaro.org>
Date: Sat, 18 Apr 2026 10:15:05 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] tests/tcg/aarch64/system/rme_gdi.c: Very basic
 test of GDI
To: Jim MacArthur <jim.macarthur@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20260417-jmac-feat_rme_gdi-v2-0-7cf5131aeb60@linaro.org>
 <20260417-jmac-feat_rme_gdi-v2-4-7cf5131aeb60@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260417-jmac-feat_rme_gdi-v2-4-7cf5131aeb60@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 4/17/26 21:02, Jim MacArthur wrote:
> +    rmegdi_status = ((mmfr4 >> 28) & 0xF);
> +
> +    switch (rmegdi_status) {
> +    case 0:
> +        ml_printf("SKIP: GDI not implemented\n");
> +        return 0;
> +    case 1:
> +        /* GDI is implemented, so continue testing */
> +        break;
> +    default:
> +        ml_printf("FAIL: GDI status is %d, only values 0 and 1 are defined\n",
> +                  rmegdi_status);
> +        return 1;
> +    }

This goes against

   D24.1.3 Principles of the ID scheme for fields in ID registers

and will fail with the next update to this ID register field.


r~

