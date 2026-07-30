Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54808C55160
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Jul 2026 12:29:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpPsp-0005u6-N0; Thu, 30 Jul 2026 08:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpPsj-0005pd-K6
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 08:29:02 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpPsi-0001uL-5q
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 08:29:01 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-81e6f2ee60bso10475287b3.1
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2026 05:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785414537; cv=none;
 d=google.com; s=arc-20260327;
 b=s5sTNsvBdBPi+djvXhcoLzRmg4aYV87NVb4AVUtOVtYwf1sF9mIz4aDzQiHrqww6Zy
 aLLmVoQjBs0UwLwMO0o+4q3VDnAVtiN/t1Gj+ZT4NkD39YN/fMSMniWGC+0SFM3T/QMv
 U4au2g8zshyr2RzPc1zQis9iQKBA9oPnTZL/+pKCZXYZkC9AiB6qtuzLCr+iCS0nGfER
 +VecY3/z4Z9B/A5R19yeSeKa1Eq6YHy4uEvgu32k7tan+N/aZ61CD9oA80pUJ/144Bt+
 na9MZzbasXXM3E68i6ve6eUxBsH9ybPeXAc3xMhanMOnE2fkKHueb161F4PYE4+jS8/U
 Y5wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=QZvCRAOYx7Jmy32zGIW5M7L3b+vFulkwPEDTw/NPeRo=;
 fh=MY+RTGlDZBw1hjx9sCas5mVeVTtr+VfM/WJHDpsZ79Q=;
 b=krhVM8+s2ddY4yjqwKJ8O3aLNHyOoTbwI4VmwQq+g4xZD2lX4QO1wydfqgP/vtVwYo
 wDgTARaUQhwu+mXLXuP/wakNY36U2/ZqHLXy4LMRpL9Q86E4Ejirzej1lyVNLwK1zyyf
 PIqo3C9KN72eATlD3FLcsYggA0ZXPaJs5aysTNomM+HvTiP9JNAZSTsgdhoTsPwtW3Vo
 4w5Qap2cN8yA7Kf0wTKgqALtg4ujRrpHSc6glRMH7XMfMdskwIX++WrywnTVZBojW1JQ
 /6kj1J5t927sAP6hQ8S00JWpNe8nNOJ864c1EA+/HITIHYP8vSR1bppg0+JxA0CW5Y/X
 +xxg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785414537; x=1786019337; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=QZvCRAOYx7Jmy32zGIW5M7L3b+vFulkwPEDTw/NPeRo=;
 b=OyFYPhYSlVM2esDCg9knRHEq/dEmHPywU3X0IHOQdYwqODdLUp/wzE3+0MOQmBqqjQ
 lleKrWk52HvL0d6oUKcw2NpCy1a9wUHTlgNog/H+FkeXPxrnIeqR/iC/mLH6MX4ANV8K
 uP+YfHmvjzmOj/Yhv1u7JlYfFAY98GfZQkF9AmTh+FTobFw11AUhGBSGAujAKKHV5Deu
 KJbxAlPDakd0CvhqGuoo3+hOrtytNRsuoxGsMASSShlUHm9AJB+47SwS7hIZ34Oyy8Dt
 7OpTZX88LPUTdblKPqGOgw5aItOmqF+/nFzASopUqMGEiAXOfWK0CvYTGKNqlL0TNgfr
 r/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785414537; x=1786019337;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=QZvCRAOYx7Jmy32zGIW5M7L3b+vFulkwPEDTw/NPeRo=;
 b=JF1GnmNs3wUBWfF23JDU5ebuDMKXPdgLXtMz0qX75K2FtUH6JJvvYFuzV7+wvSHZih
 7mDg+lF5g6P9fcutJIL7r1n6nEiLyRbJBRHde84ZLmli9F2e5g3Kl7JlEz50JQbQj2/M
 DdsiC3UV6O82Xv2B9PlqeNJ2AXCDUrk4YrOX6Q4MwJx1T3ctIp8iCWvUEmmBuAIlQDXi
 BlL+/j8s/G+Cua4PjomFX1/9rIziVabwV/rmjEgCacaZESZvKh8LPi0uOi3LaoLO9gnI
 CJMVPOepWyRWiw3fvjff2euN3gcELWWU9uw32wfzQTk4F9LcRGkNbJPgmeAkg24vJufZ
 KSgA==
X-Gm-Message-State: AOJu0Yzo5FXiKyvBtsNVUMYRowHRNKo1WzidePUNeFAYL3yKcQZApQVy
 zzP6jiweBFfQr7Vdn0QRO2wlvmSSUtb8JhzD0euZ1tita+tyDSkfROjHzmwoSYAl50JfNXxgnh8
 M/JH1k9IwdZppfOrYvcoSq2HCOhD3L63AXMAnadwIlA==
X-Gm-Gg: AR+sD11SGrkREiI6DqrkFGxBcznOrI/e36wLxEoZ4bhAIk5TU0ZIdk8ZK3KZhi9lmII
 Vua6YcqdrONWzZGQbfJR2RDkhhoZxMcq/h5O5LQF1fEwdEVcr0SHRTOX+Omyv9Ya0+vwV+Ds1+8
 KQwSCKaneqEWv2hhUBlpsGobbQUE8gaMK4sWeE0N1lWbMZVpou7ho/tIKh6GB4bf59dbrFxip0S
 3MRgRapWoSVMfjO03U02/kE64lqzKHMzotlUWaYJGYYJF+2scqyhzNPS+5cmEOe5hHj7jzXDi5u
 XC4/q8YAr05Nsh5DqpwgA0eb0t5TIOKffDaDIiBNXiadz4LCTMONFPQ0onudhH79FsVndiLRhC4
 oI/dx0mvIwKEmECAoS8oLd9VQY4wo
X-Received: by 2002:a05:690c:3:b0:7dc:3d2b:2e94 with SMTP id
 00721157ae682-81fc17225b0mr1160337b3.13.1785414537543; Thu, 30 Jul 2026
 05:28:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260729231325.3808993-1-titusr@google.com>
 <20260729231325.3808993-2-titusr@google.com>
In-Reply-To: <20260729231325.3808993-2-titusr@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jul 2026 13:28:45 +0100
X-Gm-Features: AUfX_mwI_IS-Mn2a8oByyTgSM13U4AxSHNIP4pfwReWSWAIpdNuxLntZ6e99kio
Message-ID: <CAFEAcA9Omor0pJ5LTyYbk-41W9b707P9t1zATPto3M=a7j1Pyw@mail.gmail.com>
Subject: Re: [PATCH 1/8] osdep: add DIV_ROUND_CLOSEST
To: Titus Rwantare <titusr@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 imaginos32@gmail.com, wuhaotsh@google.com, philmd@mailo.com, 
 fanjason@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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

On Thu, 30 Jul 2026 at 00:13, Titus Rwantare <titusr@google.com> wrote:
>
> This is taken from linux/include/uapi/linux/const.h to match the driver
> behaviour when reading sensor values.
>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>  include/qemu/osdep.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index 1ec5b42230..08f87c9d61 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -522,6 +522,19 @@ void QEMU_ERROR("code path is reachable")
>  #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>  #endif
>
> +#ifndef DIV_ROUND_CLOSEST
> +#define DIV_ROUND_CLOSEST(n, d) \
> +({ \
> +    typeof(n) __n = n; \
> +    typeof(d) __d = d; \
> +    (((typeof(n))-1) > 0 || \
> +     ((typeof(d))-1) > 0 || \
> +     (((__n) > 0) == ((__d) > 0))) ? \
> +        (((__n) + ((__d) / 2)) / (__d)) : \
> +        (((__n) - ((__d) / 2)) / (__d)); \
> +})
> +#endif

This is still missing the documentation comment that the kernel's
version has. (We could also mention in that comment that this is
from the kernel and so GPL-2-only.)

-- PMM

