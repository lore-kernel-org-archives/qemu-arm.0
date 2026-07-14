Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D005CC44508
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Jul 2026 15:50:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjfPD-0000YG-4x; Tue, 14 Jul 2026 11:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wjfPB-0000Xl-BJ
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 11:50:45 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wjfP9-0000zf-5d
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 11:50:45 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09e5so1093376f8f.1
 for <qemu-arm@nongnu.org>; Tue, 14 Jul 2026 08:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784044241; x=1784649041; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=xU9T+E/CR6vOuPVwdM0D0NZW0cVuxQ9pv7viz+s2n30=;
 b=wCZvpK3zhUUABPiSDl6wYhFV07dS1ixjjt6r0UuHwZKS9GFEhSE6xvIhvz4Xg8vpXf
 o/ubT2BGr6Dyjm4z0X7XVy6oCWZRHWuxK6NTS4n9BDoAXFNxUSUFx0MEBSspSfgzSfvQ
 lVyFxvJm9Aal3gBzZH3wSaQrfxEoxkfv0RDZmp9IbE3OzLsTIMluMInO1ZQnKXprirHE
 C7NRESoFwOQ0PPb6kb82I9sS7hL+NehXUUGXddsH/Yql+6AJHYywJ6AOkOjf+AZYYsMs
 f8kBSaYbp9wW5+xb6c/NwLtRc5Rl505WGisC6J3M0s24Gnex9ujofbvAX4U50GFvFwLc
 gxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784044241; x=1784649041;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xU9T+E/CR6vOuPVwdM0D0NZW0cVuxQ9pv7viz+s2n30=;
 b=EZl4qFXPHwyGZHhvk5h06Ry+gV3gqfXaOClB2+Oofh3EFGak/jGbLmryH5oiG1s3nB
 9D+OPh1W5oUqtVpWPWal+sgJkY6RD3dOp8K5uR/kpRthipWDSEZqNbFoTsrOVlbMgAl8
 8BsuPxGKdDTUADGCj6tYlrVewHU0mSQO3eYVZIuhV4YtXro7JPF1aY+j/uUdfXSeBcQb
 7fSWccJzcreB08dkfT2teOWCc8IQYgExo5kxSusWh0CfwMJ2CPWBdCzU0DNCodIJyqgC
 7YWJzsli4uiBeG9SE3Nz3OO7PcNexlj8DBfkrj64QHHPMpnxqZ/VhKX2a9+l/IUOmbyg
 wWqQ==
X-Gm-Message-State: AOJu0YzlmyrYdtbbjtIkvS3RHf1C3aAOgKBwKT4/VNU6GCQc3B1cYg2B
 qvMU4hiFM/HR9pQYnjN+5sCauDRVzKOcFVUnK0oEwcCJ63au25KGWcL0tARJoJy7fQc=
X-Gm-Gg: AfdE7cnyNSbn/ZadBQHg5462fESaa3ubXYqfcXlJmUwqzyBcm0h/b33v7pZS2f8aR1Z
 R4YaDoTWYv87jeePWRyEk0IhGuQSmNyFfhOiV+s3jbauytIJ4NA7692ESIqXt22oNuHNZEVAZJg
 jcWBETq+XDhznCvbIAFQXARPgA57U7dRLvn6nUAcR1zbzb0ej6B91ufug/EYoU4nDyg5hvFX9RO
 oHA7lxLjiomp/9tElzyRjLG7RNWZxLXklnE+6zyeOM3+LWTOBTl40X1LXmnO9zqurfFzxeBUCij
 WsPDWE6dWQoyh3p+k0dc8P7EWJyDtww3wrxXsXEKjQH2IXBSX69d1UGHae9lmTWAEar+/U0K0ZR
 LCWFIkIbJly8Gu4ijemulrF1o6ZEJ41Fk2+oXfcWt1hveae/jFSWkrnSVnT9a1Kq0O8WHtPz9yQ
 +4ynDwWg/2RvIbfw==
X-Received: by 2002:a05:6000:240a:b0:46e:483c:2262 with SMTP id
 ffacd0b85a97d-47f2dcdecc8mr17464413f8f.14.1784044240934; 
 Tue, 14 Jul 2026 08:50:40 -0700 (PDT)
Received: from linaro.org ([2a10:d582:31e:0:c8e:44fa:aef8:4850])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f4635a63esm9581180f8f.9.2026.07.14.08.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 08:50:40 -0700 (PDT)
Date: Tue, 14 Jul 2026 16:50:39 +0100
From: Jim MacArthur <jim.macarthur@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 4/9] hw/dma/omap_dma: Be more careful about overflow in
 transfer setup
Message-ID: <alZaz6DQe4oMCvDn@linaro.org>
References: <20260710105907.2570621-1-peter.maydell@linaro.org>
 <20260710105907.2570621-5-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710105907.2570621-5-peter.maydell@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wr1-x431.google.com
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

On Fri, Jul 10, 2026 at 11:59:02AM +0100, Peter Maydell wrote:
> In omap_dma_transfer_setup(), the maximum number of elements we can
> transfer is 0xffff * 0xffff == 0xfffe0001 (because the max frame
> count and max elements per frame are both 65535).  However, we store
> total element counts in 'int' variables, and use INT_MAX as a "bigger
> than any valid value" sentinel, and when performing arithmetic with
> the total count of transferred elements we are not careful about
> avoiding overflows. Fix these:
> 
>  - use uint32_t rather than int for the local variables tracking
>    various element and frame counts
>  - use UINT_MAX as our sentinel
>  - calculate new packet, element and frame counter values using
>    arithmetic on a local uint32_t, rather than doing it in-place
>    on local variables that are only 'int' because the actual
>    counter registers are 16 bits
>  - use 64-bit arithmetic when calculating how much to advance the
>    source and dest pointers and the total dma->bytes transferred
> 
> Note that since soc_dma_ch_s::bytes is only 'int' this can still
> overflow; we'll fix that in a subsequent patch.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

LGTM, thanks Peter.

Reviewed-by: Jim MacArthur <jim.macarthur@linaro.org>


