Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1627241ejb;
        Thu, 25 Apr 2024 12:26:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUPGcAJbM7R74LMKfv3BsJXvG4fzOmKfkkJanQqFFbIIlhmOoyoVLIcvwvNB+iD2yh4wDsyWDQStVb0hB1BCYMRcx/Qefsa
X-Google-Smtp-Source: AGHT+IHEg+1wXZzISoghhRTtpDHNx2z4Rf6CYn6exgcLqNW/IyaFQLjK/dcCQgx/3dU8T40PIUm7
X-Received: by 2002:a54:4088:0:b0:3c7:3b1d:bb59 with SMTP id i8-20020a544088000000b003c73b1dbb59mr681239oii.2.1714073172950;
        Thu, 25 Apr 2024 12:26:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714073172; cv=none;
        d=google.com; s=arc-20160816;
        b=NV+Xy4kHeJAsMjcV18vL2bpws9lxpZjsDuKpc4yUgbbRg2bh9VwmQ2UCSU3KRFboGh
         xdtfsFQ8xcQ2ls/6GnO9J8EYUsKsHk9aVfRknUNU4ompds3m0Vopq+T7KDybwkdggEaM
         gClj/knO1cV4BT616V+PIsnGbeNEI7eCr6McMRT0XOJcbmkeAkER1cvZtWUaFbNHcG28
         RbXlgXpEraupU9/AZyjIsKYC53eEh6LVGvIIZMxIpjkZOKpBNhKzzfM/J+fuvNrid/GL
         mBfqnPEc6EMRTzbHmf8Hf9s1Y+AQJ7p/DSLPDWR+arFOKhh63omEj2FuV3D337bb5BvX
         Uf+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=YcaSJzX+iXjH6svkMO7ZzO3LbPjWyD7bMilIn8eEuSI=;
        fh=Fm3RLetDYhqXFEmE9NIejt0WAsQ6I6cSIPGPg7PgLtQ=;
        b=Z/pmmWHfPXmSwEB7xtqGqKfotq654o2n4gJp2Y+Bzvbjgov1He0JsGpflAr7gWVklU
         oae+JUo0/uAs4GH5FN3LyvRjDcVwzvpohzJM4GC2Pez+WqI4+akWAVK+ahzES9szEjOv
         jN2tAVu+g7isZv/8gj0PeknEk25T9osx2DE8H3S19ujNvMB306oss0Nhyu0ZX77uRQWg
         q5jiONxD57h48/L+y+9mry1hCpmU8dWNtJYS/yUZWjyr80RxRbxSIBylerVH9leG5Kr9
         +L4gr8B4n2DZTF0I+SEfactLhYL4gHvxXbGrr1TtMPwujSDSabNxqIz8GCPmUd8Yy7Xw
         cZmg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dGbSpCJW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12-20020a05620a0e8c00b0078ef7fa9e96si17882861qkm.650.2024.04.25.12.26.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2024 12:26:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dGbSpCJW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s04jN-0000h4-GN; Thu, 25 Apr 2024 15:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s04jK-0000gc-CK
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 15:26:02 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s04jI-0004y6-AT
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 15:26:01 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5708d8beec6so1598912a12.0
 for <qemu-arm@nongnu.org>; Thu, 25 Apr 2024 12:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714073158; x=1714677958; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YcaSJzX+iXjH6svkMO7ZzO3LbPjWyD7bMilIn8eEuSI=;
 b=dGbSpCJWfjSoaysKUhNcoMgWqxPyMP2w40gUu6QTRlkNNapkLupG+fj+eI0M3Ek75g
 dB8GpluWSzwS2Xoq/KyUB42hVTxdr9d0t0bxYXEh6c+7EdWpFU/8bNUo6vFuiWp7Y9Rt
 BpKRKPnHIg0vF/4Yc7fsko2CVEDuGafQfImGLHx+i1mX6WgER+SLHI9wVHytvXXMYwIV
 8rFpKpTDGw69MhU2+14fVMt8gpR51i6AoLHVouqz/9wHBN6aAJQIY0xtrdj1zB0jrEGX
 AObGLnfcrEErP/7hyKVk8FGFjYa0CMkKaXLI/UCf5naZO9cJQdVWM641KmeJef6z1Hqe
 XnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714073158; x=1714677958;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YcaSJzX+iXjH6svkMO7ZzO3LbPjWyD7bMilIn8eEuSI=;
 b=rMOcUOHkAn1L/Sc4sXVFAchwdbqZ/RXZqw64afi6R+F3XiCqkmRQPTE3U4W8PQpm0e
 GxyLn7hBLrokfillvyCKBgzcjswsn0ryzha7rQesq3zHFhoZcXsuAJtiD3Qe+80/ZPi4
 IZf0d0GWXDgZquNX3fQLypzR88YBWNifHPyj9bTldNdrhri+weZOseQkzF0uCw0UoXQ0
 x6tcMjHElgd+wB4R5nDZg1WF5bGh+WuJXAyMI01Gfsb0HSFhJzhW0TIhSiqVJPSvgD4C
 zY3n1IOXfam5FPu7d3kDWjf/mVRtDNqh0RTHZNKMkgYKkNFxrx9rUDFRq7k/jdToRgP9
 r2sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/KxFuGizgpBkw87zzdX4ULxOvRmgB0QXbO25OSjurkVqrOv97sm9Ki13Qty1KJrS30deXR1WhEHunQCMOIZDKV4Li
X-Gm-Message-State: AOJu0Yzx/sBfFJMsp6L+48HL45sOO8mSyi802K3hMt4nZ8jNgR0JO75j
 1E3JgtfzMKsbUR7D4XjKSoKozsONqruvIOEa8xVGPuHBOKlJpAPeenUirCDNo8iLfTB8ddGPvtk
 V1zahAg6fqmsadEB5nXX6yzHgqXxCap4/+rdq1w==
X-Received: by 2002:a50:a455:0:b0:572:4efc:1b9c with SMTP id
 v21-20020a50a455000000b005724efc1b9cmr460940edb.11.1714073157706; Thu, 25 Apr
 2024 12:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240424181321.20844-1-adiupina@astralinux.ru>
 <CAFEAcA-=kk_TQVRLLQvH96DC-ffmDqd_hU5=z=Og8ntYGxPUeg@mail.gmail.com>
 <20240424181321.20844-2-adiupina@astralinux.ru>
In-Reply-To: <20240424181321.20844-2-adiupina@astralinux.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Apr 2024 20:25:46 +0100
Message-ID: <CAFEAcA-j2rrmU9r85DTghvOD7xr3sJfbCMb38=6UWU6n0WTPOQ@mail.gmail.com>
Subject: Re: [PATCH] fix bit fields extraction and prevent overflow
To: Alexandra Diupina <adiupina@astralinux.ru>
Cc: Alistair Francis <alistair@alistair23.me>, "Konrad,
 Frederic" <Frederic.Konrad@amd.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zBbpjBncMg4i

On Wed, 24 Apr 2024 at 19:13, Alexandra Diupina <adiupina@astralinux.ru> wrote:
>
> Add a type cast and use extract64() instead of extract32()
> to avoid integer overflow on addition. Fix bit fields
> extraction according to documentation.

The commit message here says we make the handling of the
address_extension fields match the documentation, and the
version of the fixes to this function in the patch
"[PATCH v2 RFC] fix host-endianness bug and prevent overflow"
did that, but here we seem to have gone back to not changing
the shift amounts.

We also need to extract all 16 bits of the address_extension
fields, not just 12, according to the datasheet.

thanks
-- PMM
