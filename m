Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EA7CCD183
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Oct 2025 13:36:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8Ij2-0005X3-6A; Mon, 13 Oct 2025 09:36:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v8Ij0-0005We-GM
 for qemu-arm@nongnu.org; Mon, 13 Oct 2025 09:36:30 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v8Iiy-0006PT-NL
 for qemu-arm@nongnu.org; Mon, 13 Oct 2025 09:36:30 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-72e565bf2f0so44015377b3.3
 for <qemu-arm@nongnu.org>; Mon, 13 Oct 2025 06:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760362587; x=1760967387; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sFzIbSNWSlokoLsVJ01E0TJJ/rLPCd+u6AXIbjzCbQA=;
 b=F1026YWdiJyOY+30budCDo8FRzHdmkkMsplUpjEB8T1lX1AWQPjqPXYpwD84nmlg3Q
 0RSavUz8tzwZw/ebADHAfNww4K6uufFotwApOu0mrOW+OVYHsv5Sw2VDbLQGq9H+xpdr
 R6mQpVul/flhG2fyYNXMIILwY+o2JbqcEDSbIla/W6Cz01i3pKTLDN+aOvCxr7K92xlX
 EO1D1sZCOJBFlfvRhMR+ZfhJ2X/5/7L1ldHHUkyr6VXaEAbe5o4ZD7LE+IYtLem+aCzC
 uSM4wUoaSqeQKL5gd1FMgzKxNRa2yLfouY/E6UCvZnbagQ7GhcfP+NwU9y5Qra5+SBYf
 lQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760362587; x=1760967387;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sFzIbSNWSlokoLsVJ01E0TJJ/rLPCd+u6AXIbjzCbQA=;
 b=Hef1Kzja8UG2+6TX80BngTn5B3DGz7UrmG/2IC57XIXDeQzsSlJVL/BRWV3+MlbP5J
 uyMcYkXe4YtERnmV6dXZ+YruyWxlqIOqT7aKXApsJkdNdUbJsrHmDJ1VEcB/dyA8TCSb
 QiAC5aNc480LSFHhFICd+lrFUq57yd3cHs2V6h00jw5TxzYAz0gngnnhSAcU5z7tl1pQ
 LF8HASHeyw++C2A8kZ13pZByAeQqXOD7jCNk6VYCzG3yvCNdFv0isXgozkWZ7UB7yD+n
 0/DMipKIyOBrm6KtvitQC93zxIoqI2Fvf01UjQoFEpXWZeD/h8gb4y5RA0wjjmI0gsez
 XJKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ7IdnLt51fhE34BIRObmykZkVi4cI7i78mAdRjEJ0GVDwAZe7eOt84NQfqDlUycQ8x+ArsiOO8w==@nongnu.org
X-Gm-Message-State: AOJu0YyBSv4hWUqUHtkTpQz1f6T7lO8cxI+BzwnKse7VIK6EPsYi1YKU
 UO27k5RL4pRmriCP2lzl3LWp3k2LzwaMrQieq5vQLO6BiLW8Ugc/hn6wWQLUDGKn15aAQru49t5
 pwUAwGCqHjXzA0oi9oaVdObmgZjJcMZmZ3FXdadQlW/kOMwrB2Bkh
X-Gm-Gg: ASbGncvoZLAaavuazKjs6KLQl8ECgD6OBq/VlU4fJJj7BO9uS5/xdz9mHhQsUY+5PY9
 Ijs5UBSflkgWFTbUbnnvOi9BmJ8ZGGm2ttedXulA50JKrMz2KEkteQvFAsNw5dXz4V7gMbi2AtZ
 uWSytbPMs25rRyHfd9zP8q4W/OYHpLhdBliWTvwuQvlS4SHEno0TJ8OlX+7GcflgBfNlWJJGJrD
 rGjwLehJ50Gw4FMfhlat+dxKHeUcOz+9wd0nid3NJW9Ti2whEBY
X-Google-Smtp-Source: AGHT+IGa9KGFD9GkIWACxfuhDx/PeAo3vh7rSF8pBHErx60Ml+nka4BiwT1sChLHUXO0zg9jSZOwE4UkCKGF7dKIJtM=
X-Received: by 2002:a05:690e:158e:10b0:63c:f5a6:f2ee with SMTP id
 956f58d0204a3-63cf5a70b20mr6347293d50.64.1760362587269; Mon, 13 Oct 2025
 06:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20251010201917.685716-1-richard.henderson@linaro.org>
 <20251010201917.685716-6-richard.henderson@linaro.org>
In-Reply-To: <20251010201917.685716-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Oct 2025 14:36:15 +0100
X-Gm-Features: AS18NWDL0G-598jTRuTEmRcvpFsH7N3uXzZdtB6mjxBNZRaIS_UC1oo9aVGswSU
Message-ID: <CAFEAcA_WdDpndTFOADR61Wgc87LVuOcEjn2y8UgNrfHORaUh2Q@mail.gmail.com>
Subject: Re: [PATCH 5/7] target/arm: Use el local indexing mair_el
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Fri, 10 Oct 2025 at 21:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We already have regime_el() computed to a local.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 54c45fc9fe..5fcf104272 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2319,7 +2319,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>
>          /* Index into MAIR registers for cache attributes */
>          attrindx = extract32(attrs, 2, 3);
> -        mair = env->cp15.mair_el[regime_el(mmu_idx)];
> +        mair = env->cp15.mair_el[el];
>          result->cacheattrs.is_s2_format = false;
>          result->cacheattrs.attrs = extract64(mair, attrindx * 8, 8);
>
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

