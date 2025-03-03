Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2650465njb;
        Mon, 3 Mar 2025 06:31:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVnBywmCPaHoS5FdUTv/636UVgIqgxySbTw9gGlkgbFSu4NC6n8RZro6lPF+I6yO/1jQziTn9J1nc7Jlw==@linaro.org
X-Google-Smtp-Source: AGHT+IEpMijZkvJ5beYIyERsaVzwwMs1sU9R+rqwILMVkI930mEDEGFONSU9stN3+Rkm1D10ZRBa
X-Received: by 2002:a05:6102:32d2:b0:4c1:9acb:a572 with SMTP id ada2fe7eead31-4c19acba6d4mr1757591137.21.1741012311488;
        Mon, 03 Mar 2025 06:31:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741012311; cv=none;
        d=google.com; s=arc-20240605;
        b=iU4JRgvfAbIPC/a5UWFuOtQuiViWWZ2DBYuoWUIlYi2WJSuv2E1tndgWOtYsD5YjKH
         vK7VZje7QW3lNoXGNSRVIjYVhBTUDobR8kPS8BfzphOJl8uiHIJQA3K0rpPelVmu14IR
         pKQ6o8BbZdRD7HfUk4KcDks3ULcwHhnJ2298xnHZLuHJ8guWetnbDcFbG9MC4OUxnooZ
         jVNcMgzvyhkpLMJQRcrz4EKoe3o2cLVF3qO0teXkysV9Pffq3nWV3Y4UUpGCqDBVO/Pc
         qwER6lo21oSpUZitSYPuGBE82OXwFQA00biD1PMabbpvvuBehXm1EFUXASviRUkTl/C3
         0xng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4WWGlZgIPr0lgPhg6+eCF/xpe4T/85rWPCF6kQZ17yQ=;
        fh=qNXBIlB+91SLtXnnNYxTGY4Ta9ZLQ+Tgz8L1svGLDvI=;
        b=T8PWD88x5rZaNUEJNx3/0cfjFzFo2U7iBMEBCRZU1XAS6eHDbDkJo0ThsxGVP4KUbA
         YJyDkUqfUSEd/80AQDhxZZPCi/VsciG1pP58zCMj+YGz/e6Sv7DcXe46xKpwXbwwOzob
         86Q6B7Kb6/7Ba5Jv6OQHsMyRabwUxv+zRlBwc7FIzy4p31gqdLlemmV9fdMHaZP3fCVU
         cNoz2RNCTIZ/pFUms33v+wMKGt/BK/1jEnutoSHusug8HudFAq52/B4I429wXQh2TYiX
         l9TjmJmduizG67r7mrHm6oS/GxgCfQbP3C9FZ8IsfU6AsYjKvhP8clfoAYpJwVwnGXOz
         ZBEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GQXulXWV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-86b3dc172e5si1451329241.43.2025.03.03.06.31.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 06:31:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GQXulXWV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tp6pQ-0004KM-Oa; Mon, 03 Mar 2025 09:31:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tp6p8-0004C8-Ok
 for qemu-devel@nongnu.org; Mon, 03 Mar 2025 09:31:15 -0500
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tp6p6-0002Mg-Ej
 for qemu-devel@nongnu.org; Mon, 03 Mar 2025 09:31:14 -0500
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-6fd3b6a6a24so29824577b3.3
 for <qemu-devel@nongnu.org>; Mon, 03 Mar 2025 06:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741012271; x=1741617071; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4WWGlZgIPr0lgPhg6+eCF/xpe4T/85rWPCF6kQZ17yQ=;
 b=GQXulXWV7Z5x85BFb0wee/uzhyrofROSS3SUTcg783lKGkWMEPnJHgdzRPtIlZ+Zh8
 9ReBAwuyB/3aacoRpfG/YSbnuDlIxfl6JE7MzPvtmaoItBuAsKf9Eiw+R4pca8uUA712
 Ff7Mts9hvq2tqDHfo+jLoXlHdkjZ75qM3fyrrjFhTXwAOJEbnpirjvABR7sAJFSCmO2y
 n79aU6FsdsdNrZ5lqeJ0TXoYaZld30S+DmxtFQFYcwMSIKhKZc+bLsaK3rSx/ubKQgRt
 xf2zmTpkjgy+mdFNBfNId8N8MKvBpKptShW+TmB0mfxgsOPiE4dHjwkKPjFIEzYfl7wp
 tnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741012271; x=1741617071;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4WWGlZgIPr0lgPhg6+eCF/xpe4T/85rWPCF6kQZ17yQ=;
 b=dTO3BQgHYJTbiHqvUfIBcwVjQJopKOgaKuW/FTlB+0nqilUIIJzm/SDEnOoEo7IQlI
 6gekZvoD51CIJj34k+JzsQ0YDTSYM2h662NzR2UYEu3PzNdQo0d6eK5g9JD+JxKpcwts
 cU+6mjmfI+UZgRGf9QJZYSMca/25dRx80m19rcb1JCkug6XvJswlhQbeq5oWVYv0O1Pq
 0QJoDFOm/SU+r2ddkQljkXziQZqXAeeEyY0uE+/uuKpg4EC55jgXYThm2WeWeAcLdIFo
 Fw2OqchosJ6ZZGLx4gFb8HJzJlgzVQswQYWhiEDWtkv4V3amMBFPY0HIYFmyYYgDLqvg
 5+Kw==
X-Gm-Message-State: AOJu0Yy7gIzx2iIm94SU6plb7EaPl/eOWTeo+/wCe9TDUSCoCuPG+0/e
 MBwR9xEGmpVqC82BEKs9LViC9czNnElB2iC366htJ8x2nt20p8wItPvSOuoA0hA+rNVjjlFEbPo
 WNtH8SwnZvCfP03qQBskkPeHJVf74U9T7Jz/q3w==
X-Gm-Gg: ASbGncvW/nYcYHskgfdNP/blOABfuritdHSlklh1ZhV5ihgX5ckiHwMZ3CEYEnXc2A+
 rDXfBfrA8ISK6P4WyLfusDvc/C5GBtsCO3RZGzxyPnF4Gw5JH8cOHOZFNZ7nd+MOS18Lihp4MrZ
 /1FGpgfxXH6lx4QcPLkUYnJWqlb8M=
X-Received: by 2002:a05:690c:368f:b0:6fb:24e1:2d03 with SMTP id
 00721157ae682-6fd49fb6054mr168020777b3.10.1741012270492; Mon, 03 Mar 2025
 06:31:10 -0800 (PST)
MIME-Version: 1.0
References: <20250225074133.6827-1-kuqin12@gmail.com>
 <20250225074133.6827-2-kuqin12@gmail.com>
In-Reply-To: <20250225074133.6827-2-kuqin12@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Mar 2025 14:30:59 +0000
X-Gm-Features: AQ5f1JpXVwpHZFSxG8_qCSgKDev0Udz5O-ll0NkcX1e358yZkueN3uGI8G1Qg3k
Message-ID: <CAFEAcA9QEftV3BRdqTTXMvttZUZ2pQHuFMF8uHEK0HX7BvOMyQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/arm/sbsa-ref: Adding TPM support for ARM SBSA-Ref
 machine
To: Kun Qin <kuqin12@gmail.com>
Cc: qemu-devel@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>, 
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Kun Qin <kuqin@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5FDa5j6TQy1w

On Tue, 25 Feb 2025 at 07:41, Kun Qin <kuqin12@gmail.com> wrote:
>
> From: Kun Qin <kuqin@microsoft.com>
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2625
>
> This change aims to add a TPM device for SBSA ref machine.
>
> The implementation adds a TPM create routine during machine
> initialization.
>
> The backend can be the same as the rest of TPM support, by using swtpm.

sbsa-ref is a standard reference platform, so my main
question here is: does the firmware and the rest of
the reference platform expect and correctly handle the
new device we're adding here ? Changes to the QEMU
model I would expect are typically done in concert with
changes to the software stack.

I think a new device also would merit at least a
bumping of the machine-version-minor number. Depending
on the behaviour of the software stack it might need
a major version bump.

This kind of thing is a question that hopefully
Radoslaw and/or Leif can help with. I'd like to see
review by one of them before I merge this patch.

I also have some more minor comments below on the
code changes.

> Signed-off-by: Kun Qin <kuqin12@gmail.com>

(minor commit message style thing: typically the
"Resolves:" line and similar "foo:" standard lines go
immediately above the "Signed-off-by:" line.)

> ---
>  hw/arm/sbsa-ref.c | 24 ++++++++++++++++++++++++

docs/system/arm/sbsa.rst also needs to be updated.

>  1 file changed, 24 insertions(+)
>
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index e720de306419..93eb3d1e363b 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -28,6 +28,8 @@
>  #include "system/numa.h"
>  #include "system/runstate.h"
>  #include "system/system.h"
> +#include "system/tpm.h"
> +#include "system/tpm_backend.h"
>  #include "exec/hwaddr.h"
>  #include "kvm_arm.h"
>  #include "hw/arm/boot.h"
> @@ -94,6 +96,7 @@ enum {
>      SBSA_SECURE_MEM,
>      SBSA_AHCI,
>      SBSA_XHCI,
> +    SBSA_TPM,
>  };
>
>  struct SBSAMachineState {
> @@ -132,6 +135,7 @@ static const MemMapEntry sbsa_ref_memmap[] = {
>      /* Space here reserved for more SMMUs */
>      [SBSA_AHCI] =               { 0x60100000, 0x00010000 },
>      [SBSA_XHCI] =               { 0x60110000, 0x00010000 },
> +    [SBSA_TPM] =                { 0x60120000, 0x00010000 },
>      /* Space here reserved for other devices */
>      [SBSA_PCIE_PIO] =           { 0x7fff0000, 0x00010000 },
>      /* 32-bit address PCIE MMIO space */
> @@ -629,6 +633,24 @@ static void create_smmu(const SBSAMachineState *sms, PCIBus *bus)
>      }
>  }
>
> +static void create_tpm(SBSAMachineState *sbsa, PCIBus *bus)

Why do you pass in a pointer to the PCI bus when this isn't
a PCI device? It looks like the 'bus' argument is unused.

> +{
> +    Error *errp = NULL;
> +    DeviceState *dev;
> +
> +    TPMBackend *be = qemu_find_tpm_be("tpm0");
> +    if (be == NULL) {
> +        error_report("Couldn't find tmp0 backend");
> +        return;
> +    }
> +
> +    dev = qdev_new(TYPE_TPM_TIS_SYSBUS);
> +    object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &errp);
> +    object_property_set_str(OBJECT(dev), "tpmdev", be->id, &errp);
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);

Why use &errp here twice and &error_fatal once? Passing in
an errp and then not doing anything with it is effectively
throwing away the error report. If you know that the function
you're calling can't in practice fail, you can use
&error_abort (which is like an assert() that the function
didn't fail). If the function might fail and you want to
print an error message and exit(1) then you can use &error_fatal.
If you want to pass the error status up to a calling function,
or do more complicated things in the failure case, you can
use an Error* variable. The comments in include/qapi/error.h
have an extended discussion with various standard usage
patterns.

In this case I think &error_fatal on all three lines is
probably what you want.

> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, sbsa_ref_memmap[SBSA_TPM].base);
> +}

thanks
-- PMM
