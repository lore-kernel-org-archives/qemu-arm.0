Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3CBCDB479
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 14:59:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wclYC-0001iE-P3; Thu, 25 Jun 2026 10:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wclY6-0001eG-Mn
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 10:59:26 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wclY5-0003y4-2G
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 10:59:26 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-6647c26a4a3so1510449d50.1
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 07:59:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782399564; cv=none;
 d=google.com; s=arc-20260327;
 b=OBv/Tqji1MjJq+3D2gAw6XPPv+Fr+AQS3/EPS93IhbK7lThjDATPNPj5t26pELkF+l
 kvvt1RctmWEflbYIKSLmoqX1NPdWeyaEOskdSz+yi7QxvcAifSG2HSrpPhY3pQv6rAWQ
 iIp5sW7BQR5CK/GfXc0cLvyRVbgOrVGlaZ0HzgeTHCZch/+76R841kAcZbNNLmT/hKxW
 IEFU7a+Lmpy5cmjMJCQ/Wh/4ygnExzS8ejspab6qqCmRlbppShVVPJprMJyqi0klyGpu
 c344CCVH41vu0QTWwQaMA50SskUefWiC62sDDdn1V9xToCmn5YO+V3IKKeEiuNa3r0iD
 dhTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=HzdtMgVwHzlp/WK8F9dbK0OiTLbLnYpCESvD8iz7rCw=;
 fh=HJHDFGVH+3zlZOOgMC3dO5e/RlpZt5SZ/grr9hCr0nw=;
 b=qGYLt9nkWnMjc4KZc/DqLrB69S9mQypMs2/ShjWFxMBI/31k1geeeex17o6LptomFi
 NxvnhD9Q+Xzs0KumcOLX/qwNauPee3xLMVDqPTRz+5UcJQd2x11w5/e31K0G0JHQqPJR
 XTm/8Q1mlBUnaKZsWe7Tj6EoaNVum+d2shaNL9sDIMgYGL5V3ibbnW7p+K6rcc7k86gX
 DHpnb5uYHYlJRnvlEqVQK01Pw0Yty6ZNMNC2/sNKTKwXxecOD4hHYDSsOnOdgOQQMCGL
 oy+jc3Q00gOm7oADJ8nbhGccdJf9QR1cY7tG/mlUWW8I381LSOiNJ11cNdoaluCjb5lF
 OO9w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782399564; x=1783004364; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HzdtMgVwHzlp/WK8F9dbK0OiTLbLnYpCESvD8iz7rCw=;
 b=SU754vQmGoh0iy53qcCGbBJXZPf4vMfYtIeUVK829/ZQzzw4/JTRFAiP1ljbj1IHTo
 UHThxp1pXlmj3wWTAUlkxQFEit83CKfcxhmSkvle+NaPKQq0Vb32Eq/V5obL/ScQFgUr
 WegUWiB6Z5eoCyDhUFVz2j0elSy8ptsnD3gOTdplNaERLQjVV4r5HLuWr/T5Ry7RoVcr
 4LfIC+rL8lGN1tmTkLkdDd8GugORtnl5QlyHdAJnbREki2F7LWhrZLaqbiD8YelA+tWR
 anowsumTkJx4T5WVhsLWbeSIhFjhZ57PwMSUl3iK6uLTOo4Jq2AYZ2HU8rKekPYMFU3p
 unug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782399564; x=1783004364;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HzdtMgVwHzlp/WK8F9dbK0OiTLbLnYpCESvD8iz7rCw=;
 b=WJWPw/2QhVkBGcDYwlu+zNaEJ6tTFwtde4+6WVLYmmKoTEDBTEXh/tCdVOd2wAAhLW
 qNKYXRV3iAr0nTvznNkYtSTwzCJACZdKcYGVZLUAReUw0v+KRV7v4VyvXHKCbrr6NWy7
 kXanOBjGGCBomWDTU+dackj8dfCZc9QmHWjui71tc7RSagA6N01IFJeZO2GMK9y7tF3l
 sKbe4dIhWg5OKYUa/oD6OOBHO5aES4fvDP7xPEwLMz2yszSbHH7zOA/Qvjzo7ZGTzxgm
 8lfH5HbuVwDNCcFvImSonc+4Q0v8svTr/BdI49TJa+tnLFj9573EHjItc5P6r8uSSgy4
 ahtQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpZXUF9KAzq35tJg9wD8CkyYDJt95iAm2BLEOAU3LMau2W3PQ1Qyb6X1pNTdLT59eMneSxp5+iREg==@nongnu.org
X-Gm-Message-State: AOJu0YyYHjhHLe8GhyR02lEC50LQ/ZJ4Er3k6wUSq3p74j4ay8+c7VgD
 fBIu8bvBZl0rUKDdilxN1N3VynEntgH1i1InT4xGZWklwcyxlgMHj5F0JfOJtA0xHkHji8+B8cS
 IqS61TTBhxGmVkdrMflGUKl/LE0H+6wc0GnCF6xQ/WQ==
X-Gm-Gg: AfdE7ck73yD6VuHeZcKRjrvSHMcdj6Ex3OWcaEVZBB9XvhpRjRr9hoTLEZhuNjcVBPN
 1T7L+0M2MiK3Y79lWd8FOT20IZE0XP9GZCqmA5wAX0nWlgshPxVPnh67tb8MPlDI/zuyATS+EfA
 JuyB3dEF0E2CwVlO43wjPEgyh1lMu+VXpqZ528iodxRrmDouLtntDLPf2Ds1iBGX7T3oNlCYHN+
 J436K+2RFTaQbRBkgKLHsyXEf2iWTloG5pW3Ih8HFDb/WE/G0juOPK40/6/mFDLB/kIpK4Hlf84
 7GaWtCFPsM4BMaFa8J1ROj2dMAgLhiWbmA36bc3IRA4cfy9qozGZOvT07p6Lz8q9sco=
X-Received: by 2002:a05:690e:4386:b0:662:8a91:f034 with SMTP id
 956f58d0204a3-66487d83b10mr1656826d50.38.1782399563852; Thu, 25 Jun 2026
 07:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260623170354.43981-1-163wangjack@gmail.com>
 <20260623170354.43981-3-163wangjack@gmail.com>
In-Reply-To: <20260623170354.43981-3-163wangjack@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2026 15:59:12 +0100
X-Gm-Features: AVVi8CcAN68-jUD6W6jP4xsWl5dBErSXJVYSI8N79sP_1tddjMvjBV9yVsO1IIY
Message-ID: <CAFEAcA-XeUSW5h9ATR196uTMXVr6OXtfgXjpCFNv5p3yArtcUw@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/misc/imx25_ccm: Replace DPRINTF with trace events
To: jack wang <163wangjack@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 "open list:i.MX25 PDK" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Tue, 23 Jun 2026 at 18:04, jack wang <163wangjack@gmail.com> wrote:
>
> ---
>  hw/misc/imx25_ccm.c  | 34 ++++++++++------------------------
>  hw/misc/trace-events |  9 +++++++++
>  2 files changed, 19 insertions(+), 24 deletions(-)

This patch and patch 3 are missing your Signed-off-by:
line; we can't take them without it.


> -    DPRINTF("reg[%s] <= 0x%" PRIx32 "\n", imx25_ccm_reg_name(offset >> 2),
> -            (uint32_t)value);
> +    trace_imx25_ccm_write(imx25_ccm_reg_name(offset >> 2), (uint32_t)value);

You can drop the uint32_t cast here. We needed it with DPRINTF
because that's a variadic function. But the trace version
is a normal function and because the argument's type there
is uint32_t C will do the conversion for us automatically.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

