Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2438CD4851
	for <qemu-arm@archiver.kernel.org>; Thu, 14 May 2026 12:04:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNUnb-0007K3-Hj; Thu, 14 May 2026 08:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNUnY-0007HA-Lv
 for qemu-arm@nongnu.org; Thu, 14 May 2026 08:04:17 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNUnX-00020x-98
 for qemu-arm@nongnu.org; Thu, 14 May 2026 08:04:16 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-65c37eafcbeso9310048d50.1
 for <qemu-arm@nongnu.org>; Thu, 14 May 2026 05:04:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778760254; cv=none;
 d=google.com; s=arc-20240605;
 b=VJhMmiT3c//SU++QOZLIqUr4asdFpCTgRRcXeeIR6Rm4cJnQhBMIhG6q7yoke1wSux
 G2OZjj6C3JhIjRjQlcghhc5E7ghTAyOMA0rD/R1pJWjVpvOK7FljruRajx4Z+6c3pF3C
 CV1d9qHFjDU+l8h58xqB2tORBG1geozguHt+2D0bUibyA/TvYSGlzqg965Pyd1jUw/Gc
 uuxQe9aRUP+6ZvPYuTgyzQ3azrH4jMLACxg8mIxelIl8n96e8hypQ90XhQDDhgEEN8XT
 3nHzm8ytZMpMH6WxzP2xmBlo6yZvxJ49ByY41tfip5T/Pjf/ag+mfMDChI/R8RxOacrY
 AFiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=kjhUwzMrVgD5GhEbpOQmXeKw6TXzwDB+Jv40ww+PuNM=;
 fh=wQ6rlhRV8vUYOgKUdONSvGbNNPLMzjaRBbtBK8UTiXM=;
 b=Cdgtjl6TqYxIh0duGQ467UAOoQ1r50DQf+Zi4T4JJYRd54zQo3IFb+GERUfxqp/V1C
 xfxwt2DgOylAk8v2f8H9KHkTwFmB/ZZFOjQemAeDnHBXe//UAiNS34ffTqecIhh94WM5
 qH7znFSXh+36eCz9P18KXWkWWhPeBRoNgjxR9zR79L1w/n8/F6Tp3cAlKOWXFBPwEt2D
 QEJ7m7g2vZ024RRfsGfKteAV8az7dwmiL9TXv9iRkSeGtu93Ok57136EOOllyyCj0dLq
 i6WQ88e/LIAfbj9+wdEr69LfWvMSw4iIXqUEbs3jOBBRAJ8P2GcHghq+7iExQuG8PuJN
 0FOw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778760254; x=1779365054; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kjhUwzMrVgD5GhEbpOQmXeKw6TXzwDB+Jv40ww+PuNM=;
 b=XH8YC60baITOec9mf83iErVFEsMLvUD8SDm/Z+qn/up+wf7EzH+2ZFS85kRd3KXP3S
 8cAvIq0c8DEBkoU7wtouEoK8mXduLj1KtjwhmCIXfujVwxCahcn3DhxvNSSDlC8tMaDM
 2WMAKrOVr/ESpMFlZrUmTlKFcMO8CaH9Se8PH1u5Ohe22Md43BrrB5lo6nXGpfDO0rod
 LpWKjAZqRu+UwMC7+vcFxCkW19TSE3HGKGbP0EYkGEarb31Gef9pGJoCz2yMYr9eW0XC
 pYF1/PPoW0Jc75P/+rdFYMFsA1xdc+rJYecLqhc+uGOZOfBvAa4wgK/yXRIMq2SvIJig
 9z1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778760254; x=1779365054;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kjhUwzMrVgD5GhEbpOQmXeKw6TXzwDB+Jv40ww+PuNM=;
 b=e/EgMjBphDzEXTzG9FVQKOB14vktvGodFMeIGhuROm18OkB0FULUmyfqIbjVbNljaB
 9/sNPh2yO/UaB7Ln1UAEYnpKNJBSD/+SuDPajSw+FatKg3ddmwIwL7cRi7bnSZy+ANmx
 j1k0Si0ObpTyq4Jlrs3BWqYhaSSxT6bZzaok/1zQnwkSwDNKO2udLo6ssn40DERt+a6O
 GpQOM3k84E6e9P7/rg9BA/SUcxKK65b5VPGR73R7R5FHvqJDEPsqZV+bLnhVbTB8yd+V
 1grKWYcta9pEm+w4xxhING/yEOpfJB+GE2VQGCQX3A5POpgiWUy73+ugH2FvFyBF9L/e
 nPSw==
X-Forwarded-Encrypted: i=1;
 AFNElJ89gl8YvSSoisbXwOKuoPDiYvdDATiUFnxA+yNxRqSfCJNhftm+656nb1QcQSE/gPtVv6akfbf5MA==@nongnu.org
X-Gm-Message-State: AOJu0YzJJxIpVP9tThOjaKeAvF8OWbxD8p8prVmVAS2zbxOM6A4GBiT7
 Huy2/YlmfqrlasG+KdwHMVokyuRKeMuHqzWLFHcTwimUjBJU8zFJTs1sr8aNs9yQBFkekjRlWw5
 Sk0lbhKiWbvnk6yEP/7wyKX7Ro3+63oSWFgWWxhJqlA==
X-Gm-Gg: Acq92OH9psI55EG7oxKi1jBndEcnSiVp0lQ4WwtGcJBbOhlsS47D0VM1CDX7F6VKEFc
 qRPjWhv6fb4VyWVlsx5c1Uot0zHx9vSTjNXQQ/I8J/4m50uGpqaqTWAKYGOVl+GkPV5hr/w0V1a
 FqE/F71R7WIonbXuplwJdKAfdruCPaIGEGJfV7Jtrq5yYayEqwBv2SkoDUzKuBd75U9iBA0uwM7
 T3glMh7tMWCk2FTGkIv1ui4iy7AV1JoTOC2oxgFAxaEc+9Yv2ShhYF8t1g57cAxb8vxTUaNsdxR
 MTlKorwSDA355VH60+SLVFWhjUeEzTdBCVVZ1f/OfIOemneXNlTd3o6E6+Sk5G2+GrxQ94J72n0
 dCA==
X-Received: by 2002:a53:b750:0:b0:65d:b6dd:69f3 with SMTP id
 956f58d0204a3-65df635cf7bmr5311259d50.36.1778760254126; Thu, 14 May 2026
 05:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260507234413.643512-1-richard.henderson@linaro.org>
 <CAFEAcA8oCde3+2gvLL4vvgu_MiUjvic_nbLweO1WF+nkNuzgtQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8oCde3+2gvLL4vvgu_MiUjvic_nbLweO1WF+nkNuzgtQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 May 2026 13:04:02 +0100
X-Gm-Features: AVHnY4LsKav_ramfjmNnBJDiMOK2ZAu1trJa7kuoWVyiMuob-pDdpSlAnhtv-K8
Message-ID: <CAFEAcA-6Bu8U1bDwpWq2fP_mb2q3-SPnAdhQ=v8gO35EA5PSfw@mail.gmail.com>
Subject: Re: [PATCH v4 00/60] target/arm: Implement FEAT_FP8
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Thu, 14 May 2026 at 09:46, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 8 May 2026 at 00:45, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Based-on: 20260507160959.449170-1-richard.henderson@linaro.org
> > ("[PATCH v3 00/11] fpu: Export some internals for targets")
> >
> > Changes for v4:
> >   - TF-A firmware update for FEAT_FPMR
> >   - Rewrite decode/encode of FP8 data types
> >   - Rewrite FEAT_FP8FMA helpers
> >   - Enable FEAT_FP8DOT{4,2}
> >   - Enable FEAT_FP8F{32,16}MM
> >
> > This completes the set of 8-bit floating point features.
>
> Do you have a git branch with a rebased version of these patches? I
> had a look at them, but as well as some mostly trivial rebase issues
> on current head-of-git I found that it doesn't compile, because
> this series wants fpu/ to export a parts64_scalbn() that returns
> a value, but the version of that function in fpu/ is static and
> returns void. Did some patch for fpu/ get lost ?

Ah, I found the scalbn patch that got dropped from the fpu pull,
which looks like it was the missing one.

-- PMM

