Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038A5FF8875
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 10:43:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIOrB-0007Mv-Pr; Thu, 30 Apr 2026 06:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIOrA-0007Lb-1k
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 06:42:56 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIOr7-0004z6-Db
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 06:42:55 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-6501418152cso662002d50.0
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 03:42:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777545772; cv=none;
 d=google.com; s=arc-20240605;
 b=FDBXwR2vciThBZw4YFjtUI18kPRDyj0OqU3u87VT75WfnTbjFAGXI+t2UaLnSCmwM/
 e0MD72Zl3GEsxpYkaV2wJexiwt2snE4ITaRVwCI4aK7pGzGTTkf+Qt1UCLwdujPrWdYb
 WRdKLL+/MDKEW0AoA/UJKp8eaCuxApg44hFzfWd0gXNyqiSmEjjc9SHNtTuRNJ3mZzCT
 YwZN0SfIfgBKN1Yg96pcoUcSSazq3sIvNLojyipTn5midUzrI0LADKXmfKUS0T8aYf69
 GbvLJjtEEZVWiAJRxv6UeBuofDGaDWcVYQqhPwApI7RsRxheXsDGB2WjThJA34lwz9j2
 vYlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=2g0y1nWNZc+AxGadVPMcazKrF3IG5aUDZC2BcCua7G8=;
 fh=8Kt0J7rK4Bt2ryn0RuN9gbVo61ys5R3foI3I0pJUcv4=;
 b=BqRBABB3BAx2rEfO7jLZJeqp71x//smFtMOsuRmD/ZjnkTfPgVDowdt++PM/E+2iPa
 7AZboOBGq1mkAcLKBLAqIYymuMVTNagW5W+xdsLyIyhZFjfpWDzmHpvzHx/T8xyVsIvj
 ZzrBblw0tBcDRoRksk+VCJzN27OpNOEJffxRQvpVlZ6wtIwFX7b36ETAmN3G7hl/vcPn
 AUR5K2BYrT7MoXD5AGLOJBXLhifSWxqXfTqIAapGC+HN2L4MTxffMxTHKC5qQlgGXeAI
 x2tsfLl++HtPTJDjpCSGdwCMC3dnXCmCaFvPp0NEk1f8ElFpcXmZTxlndBU/HZ6VL6ZM
 xfjQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777545772; x=1778150572; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2g0y1nWNZc+AxGadVPMcazKrF3IG5aUDZC2BcCua7G8=;
 b=u2CXR4cBppGDhrV2A68ihgDWzSPPtclXe/tzhEm/X9Cbw74n7Q2A5MLTB3GXN7eEZV
 kShllx9KuR5JPMGhAuq73WQsvacYgCY5JJRsVcl+LH75KMuMMkrsZ0ZvS6dSp9ZWURTJ
 H2Hdx/nViUZp3vFShu//T71zWpWjOp8cUhkH4maciR5+s1lOwKLSzq+ehR4La3PiwcrC
 vYpJXtiUI8LjvcRwcDVU5dMo1wwm1Bryf4faJXbLBjSdAdI15e4VFTdpD+kMYqXgPBQv
 vltiKxr1vbeBPAyZ9s+BWdiNQVBAK0Nwqj1mzJ8pjlMnGKPHS/SCzWaQ7xMmWC3bx38x
 5Z1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777545772; x=1778150572;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2g0y1nWNZc+AxGadVPMcazKrF3IG5aUDZC2BcCua7G8=;
 b=QwH5mwo29ATHpjmRKccHBcpX1eAvv/wsUnjojh29kwz3cdbShPV4kGuD+qDy3bKmk0
 s2na3cRSh28sI4e3cI6ntSrh9/UpwR7WHwuYeCtJZ0DMNW+Wh0bCPWRZ3hmZq8cLkZuq
 EsxqAwrHwCATF4d13iPh3IN/NohI/6Gfdg1pSOuDBrBSmPZMsc2SjAncyElXDfeHAjQi
 lg1+7kL6ZM50LctFHhK3rm+33usbdtSbzhW2Y37CEJq5Gc+eQF7znQQXMZVZBVk3Kmuk
 FtAzPLmIqDZpgRIQjEBjVY6CRzedtvohErznMRv05cKhUkuM5+t3f8FjZsnJPpcdynRh
 RFPA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/AtyZo4CUUJ6RL8jgYqI5NZXZkVuT/1uImSbStiH7GhmNYEGbdLWNAmWG7V+A147qFbBoQLe3o6g==@nongnu.org
X-Gm-Message-State: AOJu0YyFlI9NVG7FwjJzF4mOa+szSNql8FgYuiHWbWMXJOei/kgwyjuZ
 L9NIDtWyyO8TvkuzIbo9nXLCwYzWvfp+BvJm0iJCemBCGXGf7CgmNpjh+z4aULtYkREMxJwEIAm
 L5OPnYOFw+1jMPjpf2AfknuxlKRn1OtkSE8YOm1mUeQ==
X-Gm-Gg: AeBDiet+Xc2VqpLRoz6Lr1dqGQqzm0JKb2zmsNuoGUtUElk8wEzXjtTWAypcVjN0xzt
 QxlaJohHKxBly2Fw/j+vEoXyfZePfmfDfHRksNQfbdXI+hQBzonzZq0xAde9axk5Q4CZ6OON/gU
 0qOdLsCRfbP5fXvofDmZthD+29vOIRBbM8mc3fg2oiaULdNpXbWfRdQkuiR2Zk7Ny7wKU/SMLl1
 2B96nmJ8EG++x752khPAqILRrUiUIfdInFjdQNNI7j3LfNBGXwUZOo+KY1ZiUQiKEne8x4AeRE/
 Coe8W8sPA2UR8sk5ZiEHHupuyud5RYpfQcigDAeXIK34O8pwRDiD4Dg0CJKQK67GitO/4q5AYG1
 pjP70e8ZM75DU
X-Received: by 2002:a53:d104:0:b0:64e:d610:71cf with SMTP id
 956f58d0204a3-65c18fce8afmr1242841d50.58.1777545771829; Thu, 30 Apr 2026
 03:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260308203516.160103-1-shentey@gmail.com>
In-Reply-To: <20260308203516.160103-1-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Apr 2026 11:42:40 +0100
X-Gm-Features: AVHnY4JM2dYns_HE7ObRADh3zyxX8nLpEzAfCcCKftBVuoCubM6J_aRvFr41S54
Message-ID: <CAFEAcA8DbrVdRQK4Cy8gqU__FXYsTa0nZERqrd4he0Y1WRW7uA@mail.gmail.com>
Subject: Re: [PATCH 0/5] Trivial cleanup
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, 
 qemu-arm@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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

On Sun, 8 Mar 2026 at 20:35, Bernhard Beschow <shentey@gmail.com> wrote:
>
> This series contains some low-hanging fruit fixes I came up with when
> investigating Rust for QEMU, especially QOM object lifecycle vs. the Drop trait.
>
> I noticed that no finalize methods were called in Rust sysbus devices when QEMU
> quits, and neither are its C variants. What is probably missing in the first
> place is a
>
>   object_unref(object_get_root());
>
> at the end of qemu_cleanup() in runstate.c (see TODO there). Adding it before
> this series won't clean up machines since their refcount won't reach zero. With
> this series applied this additional line will cause various issues when quitting
> QEMU, allowing the problem to be investigated. Fixing it is beyond the scope of
> this series (and my time budget).
>
> Testing done:
> * `make check`
> * Run imx8mp-evk with a Buildroot image
>
> Bernhard Beschow (5):
>   hw/arm/fsl-imx8mp: Do not create redundant unimplemented devices
>   hw/arm/fsl-imx8mp: Fix parent of ocram memory region
>   hw/arm/imx8mp-evk: Fix reference count of SoC object
>   system/vl: Fix reference count of machine object
>   Revert "sysbus: add irq_routing_notifier"

Hi; I've applied patches 1, 2, 3 and 5 to target-arm.next, since
they're all either arm-specific or the obviously-OK patch that
deletes the unused connect_irq_notifier method.

Patch 4 (the system/vl one) I am not applying, because it hasn't been
reviewed and I don't know enough to know if it's correct or not.
(My guess is that it is correct.) You might want to repost
it as a standalone patch to try to get it a bit more attention.

thanks
-- PMM

