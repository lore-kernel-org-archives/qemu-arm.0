Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708F9E9A02C
	for <qemu-arm@archiver.kernel.org>; Wed, 18 Feb 2026 19:02:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vsmoA-0001yy-Hc; Wed, 18 Feb 2026 14:01:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vsmo9-0001yd-6l
 for qemu-arm@nongnu.org; Wed, 18 Feb 2026 14:01:57 -0500
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vsmo7-0005xt-6p
 for qemu-arm@nongnu.org; Wed, 18 Feb 2026 14:01:56 -0500
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-64ae5f0777dso65570d50.3
 for <qemu-arm@nongnu.org>; Wed, 18 Feb 2026 11:01:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771441313; cv=none;
 d=google.com; s=arc-20240605;
 b=ZXsduNS3saEGMAY8tBmBPDI4rmcMJPQ87W4HxQ/k9wDivhDtS5jzCFlnZeWePEqxve
 CdY6RtAPG8LbeMTvqqDW0TwkSUVBRgF61lJeQ0VbXBPgESIiH1fqTfREexh2zlpKwoj3
 9yxOMJ1+jddhNsucIiz+WcYXd1HDyJZUBwu/T5hst2Gmw7CpdgWtiQRcznxkJMDqNMTM
 K79APeuoszFJwTv+mdYITl5b8xz5tmEptezHxHMH3veZ7fm6cmJngGx2ZCb8X7ygZNFF
 m7y/YpDcwQLnCZVrus9Z7fGYz17u3nb/1Wj+MXD+/y8H5ICy53GYSqgRaPkGkqGLwpuv
 Dc8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=iRQW58jUjd7vqT9HNmwPUqH/1MRqYRFTjLXvnPOklEI=;
 fh=8iW1RA/l3Gun7bj7oTbwGEj5gHhv7OPoLnLwE3q+Thk=;
 b=A9COdQtSC0LjOBV2Jet/n1rKneuDMoKDmL3IKEKEiCoBH1aA7yb4+aKS1SZy/X7yb7
 M7rGYAO/kM4WSCKjOCElGUFkvnOe+ing5WAs4XoYicd9W6OlKbwtyD7/fW1NjFr4rbdA
 60E9GoQcLcVhmHB1PeGMPOfwhUkl0b6Kx8D/ear01c18Yj5iHSgfBfwU0lABG0wQbj9V
 OX0hMRVriEu97nqjyhvxDyXSDdvUNuGIYF2D+ZygIIysVZTnL9kicYn2eM9OrQZvxerS
 gu5QKAum/VDfB1OnjP9XidrAi/DiBa+Alx5cssNUQWwWz5Mi2MGfXrGkFiEYTslG9k+v
 T+wQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771441313; x=1772046113; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iRQW58jUjd7vqT9HNmwPUqH/1MRqYRFTjLXvnPOklEI=;
 b=UeR4HWmIBx7hvWZ52Q23m2ApLRk3WpNt9aPl2OgZAIqpXMHIG6DCEEVI7rrZCf9lPc
 1OBHwfLO2OryjEb6CqvpaU+5G0Fd5ioC9BUn6vOP2qr8yObqhN1RGErWjSZdK/QY5fze
 NcC6I60Bwd2pf1i1NHi/k2iHMEEmk5mFFiP+I11EzwdSIu4U4I+rZYLUhRtmOFVe5Fqj
 2fuTSpT8v8a4KWPSVQyc7xJpUxT3ymgmy7SltEiqYZDJIPFAJkL8HP8pHClX9yDHHvDL
 iKGNttUn+itA2clAO5Y2d+IPGOTlNnjnQ8N6iMRzkwBU/Brt/hPflmp+6Tgo404vSnxh
 w9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771441313; x=1772046113;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iRQW58jUjd7vqT9HNmwPUqH/1MRqYRFTjLXvnPOklEI=;
 b=xPQz5xxy4/qpB+jU/JAZLwPOL04su04eRNxAgLk3mmCckt713hRekWusR81lh3EO4+
 6XFOf9ziFuFT65+M8diTtypVdVuCBoMbXs9DZ4FJFAt4yeEk/hlbkKe3PPUpI9N5j/UF
 XA/SmS62etGE7OyNpNG8o67aq1CEWrNsCzqQ7YjZOBz7tDQ6p8/NsfmW5qu2sGRicyKm
 OUOcmHCTK0ZEa4j+6wkPRsYLj//IviWNA+9pU44iXgi12/4y/MrxNOMOHphP8ZTXYvbN
 aY02kxaNdoe42VOw161WHgeWOonJR2yl8WaTT107FK6T77N+HkvLjFK/Ay0B8gKVz3gN
 x5pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6YUCMHP6atD19yZmGD4/0075CnkZsQYeC3/QA3cqTRoOG2IZ+frlwXv7MwDLTbAszcCTr5QbBPQ==@nongnu.org
X-Gm-Message-State: AOJu0YwMSbRWCNhhF8EZKHxnQo5AlaeuoKTmoLrMKxswxjzfQ97z/8AT
 CrkBEIjjgLtAsYsNzc0bIM+x2sHd3ZtCT6FD1aQWV42SVWe7ktbzVixfjReRaDI/x2UGWGOZGlc
 7iDFuM6fi2RD69ioieIPSIzypfl04xPz/lLV+0XDPVw==
X-Gm-Gg: AZuq6aJJd5AAH5qx2d/4Y874cHMOZuoL/yBUNjZbI33WwBUz8GID0JFqgoJUcah5W0s
 rQ2OjGgi+IWEQ8lXelA7VHBwnKSgz+1fQMhhgwxquRbRxri5yzhEP98zq5PPEPD1ccR/iyMwxnV
 xeWVV1kLa2VhEn3ubNji9Z/xxObrIJ7BzoSQWfvgNtMwVW5CR5FntVX/MqUJkINFDGHiTPh2RvS
 M7KHt9FVY9poDOrhRZqiz/p6UmbUjNcKQ//Qcv9zDq0qknfApUji0VrItLOWUcF1Ryp7RT3iKvb
 9KcpntZvisLd6HcaWL9cBxFd7b/1SEDjFRHPYOAYejz8/9Op8uhXuftAUjPLQW5Y4MZN0wzkQzL
 OZw==
X-Received: by 2002:a05:690e:128b:b0:63f:b4d8:1f32 with SMTP id
 956f58d0204a3-64c55572233mr1785674d50.20.1771441311307; Wed, 18 Feb 2026
 11:01:51 -0800 (PST)
MIME-Version: 1.0
References: <20260211122759.125094-1-mbawa@redhat.com>
In-Reply-To: <20260211122759.125094-1-mbawa@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 Feb 2026 19:01:38 +0000
X-Gm-Features: AZwV_Qh5_c586UujLxy3iUnKdj9MHyuEGviGeKU4tVsmoNrMoXW92DIAY7ZL_SE
Message-ID: <CAFEAcA_+eqfTy+7U9igTscue5SMURm3C9yUXvdFTon+ZgSJfAA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Add virtio-transports property
To: Mohammadfaiz Bawa <mbawa@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org, 
 philmd@linaro.org, cohuck@redhat.com, eric.auger@redhat.com, 
 sebott@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Wed, 11 Feb 2026 at 12:28, Mohammadfaiz Bawa <mbawa@redhat.com> wrote:
>
> Windows ARM64 guests detect virtio-mmio devices declared in ACPI
> tables even when no backend is attached. This causes "Unknown
> devices" (ACPI\LNRO0005) to appear in Device Manager.
>
> Until Windows fixes that by supporting, adding a new machine
> property 'virtio-transports' to control the number of
> virtio-mmio transports instantiated. The default remains
> NUM_VIRTIO_TRANSPORTS (32) for backward compatibility.
> Setting it to 0 allows users to disable virtio-mmio entirely.
>
> Usage: -machine virt,virtio-transports=0
>
> Signed-off-by: Mohammadfaiz Bawa <mbawa@redhat.com>

Applied to target-arm.next, thanks -- but please could you check
up with the ACPI spec about whether it says anything about what
to report for empty transports? If it says we should or if it's
just vague we should probably match the x86 microvm behaviour
of not showing empty transports, since they can never be
hotplugged after startup. (This might need to be tied to
a machine-version, not sure.) Maybe we should also not report
them in the dtb?

thanks
-- PMM

