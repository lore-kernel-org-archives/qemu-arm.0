Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1158397dyc;
        Fri, 4 Jul 2025 05:01:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUV2G+aEf3VZmodFO81RRfTGvTNK8c2z1gyGk+uZ9sjZKI8oayKMJvbFNiDkd+3qXeXk8d3K62xmc2/Wg==@linaro.org
X-Google-Smtp-Source: AGHT+IHUCX0dQLQWwiDzvQv1W82Z55iTzTVDlxeUCv28INtESPb+F23UXk5424GzWvLiiWVd++4h
X-Received: by 2002:a05:620a:6781:b0:7d4:4e61:4673 with SMTP id af79cd13be357-7d5ddb33354mr210419685a.6.1751630517935;
        Fri, 04 Jul 2025 05:01:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751630517; cv=none;
        d=google.com; s=arc-20240605;
        b=T7fgWAiwNfwbkiajo2TyG2KyCuG0x47gZWTSlmJbVHDkfGs0S5IeAEdL+CUFPkoIQ5
         TsEHw5qOJm2Z8FJ5Yvk5HRf87S8CivSHo7GlmCtxxkBkr+KpzSxt/ymKB21sUDAkba+F
         2r3ptx8/CP+HbIxRgQKv5gEve3yBCqBw0K7IbEU//AC0deRJWtC5gau6NRHCR2Mhs8eS
         +xXwapahldj0v4bLofbE16GXeX07HdcRRQE4WSN1dnBI7s+COBa5ICJXzxjR4bIXB7Qu
         9AsTDQbEtUcJh2Brucx2/g/B/6a5bLfXAVGxjsw/M6N89jTKEP+NkhuriGadybrEBezE
         DsDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=g7em2cNXKnXUibtFakubNMgOKSsBTiBM0K9HagMSvwI=;
        fh=tcUZ8rcWm39qCEbmuAg1czgdb8O+tlnSed6kqKbBR4c=;
        b=j/07z8G8/U/T/OUZzeP2DlWt2XSGXYnzYTF+Gb1OmdXE7PVLRfvfbVqvNCOHsi0qFf
         UZ/gmLb/cm/Smyiqxgh/J9wSSDc8a8CmWNX3u50cLG+SzcoNZRfa65wTdmAeuTUS0ffr
         GG5WLPDHq/dTPpyLZpfHTT2YcOJ87np3CX0PFuw/EaBAkiMUBP/IJ6oMwjuIK16tYKGr
         am8MaDDxA/azQt5hb5lUbKkHeeoCwzbE/U0D+Mf9aVSNuKj88NRT6aS3D1acepIwHb4U
         YKenIVD/vr36+5UZeb/FNt1xG8tg7vBF8Gyv9Jl0SrAt6ldWFXXII1r9pO9vNactUPth
         7H+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TQsgriX6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5dbef6303si203229485a.567.2025.07.04.05.01.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 05:01:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TQsgriX6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXf6i-0004GB-O4; Fri, 04 Jul 2025 08:01:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXf6c-0004FJ-DN
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 08:01:28 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXf6V-0002PD-DU
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 08:01:25 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-70e5e6ab7b8so8154817b3.1
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 05:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751630476; x=1752235276; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=g7em2cNXKnXUibtFakubNMgOKSsBTiBM0K9HagMSvwI=;
 b=TQsgriX6dHEohyXn+4V8fecGJYoyr0mntB70xWtQz5ef9nm2CPcLifmyRhY0tJ55fs
 G9oi7+qk8da9qr6Y1euFqERxdx3qMxKB0eWjqY5Y6HgKOq2UGJ/ZTxDYn4tHREpaexWe
 dmbhXixDUnph7YXPy+XvNXNf9L4QNLvLbTaGijU03alCW1AokY6PZDnBqK0OmMVD5e3g
 ZQr62+xR2ioRRCYU8fmSvEdMjCLn/2UEc5tPxlBYr+TtAkyXb8Qa0FUM+7MSMArK+Gmg
 LlKAtuxYHsuV6jBDItgYzraCNPUgOtMG2qkroN2T1J9bqXUNlSEIZZ6CYqs+7QA8g6Y2
 BFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751630476; x=1752235276;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g7em2cNXKnXUibtFakubNMgOKSsBTiBM0K9HagMSvwI=;
 b=M4zKs0GMt+Wcz+NZL96qKwGswgWFE7FAmyIFe0pid1BxdKrOXAB3jfkBBBUcAy63aX
 3h1jD/EC3PkFALRqfseVHEKRmsX1Lc6U25xaq8K9HGKTrBd0niPJwhe8jFRERl9PzaiY
 OYfEe/Se6RQzjG15Ajvs1A3NcAF2kHsVB6U1c2Np+SeuqXAHaNlDAHvyVFzvVnh+tKd8
 BrRIZ5ppuBBb8zrGXujGCZyh08rjs47HgoPztU2SM+DQvKhOsH/CbKuPTotF6M/q6jf6
 1zWTlUV6jPxjzErS1eb8LOJVNseTL2kXNXdNkVRg11MQQCQB7AFF3EeWj61+nNP2W34g
 7o7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqhwQqbfEbyIOgG7byHtJuzCVjB+su/4nQtJC0OOpRDCDqZrZ/bDYb9+mdc2IsTNY7SBM4J/+TVQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzrb+tjjS9b/PdGqY4+EjSYvatIte9i3FVy3j1DvNvV1kSWY1t/
 Yi+JeEZOq3OLejrLvXfWZoKVeWClhzlghrVgT0oi/9g/lsB2Qap06qC5mRE813LARByah413vD4
 vPSwVzNw5k+9k0/iNJKfzmQV2AmER3/Pt4ZF8jJ0uSw==
X-Gm-Gg: ASbGnctyZ7A1PfauaWep8YlV/TpzM+iNYtJXj1sRkXPlm+G9zb7pIZHU23Yi/4AS/p0
 cJHwz/syhw3fBjKUBwkIs0fRvrdZtaDHyaPyRLr4sXf06ZChMnFT6EKNsMCONxxNe6/hIuRzLjH
 QN4s8Bu1zlpKAd+aR6WTYJWJ0pngOQC8TT+EYk6bm6sBkF
X-Received: by 2002:a05:690c:316:b0:710:ebdb:83d3 with SMTP id
 00721157ae682-71668bd1741mr29194787b3.8.1751630476316; Fri, 04 Jul 2025
 05:01:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250702163115.251445-1-eric.auger@redhat.com>
 <20250702163115.251445-2-eric.auger@redhat.com>
In-Reply-To: <20250702163115.251445-2-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jul 2025 13:01:05 +0100
X-Gm-Features: Ac12FXxU2qWCFEJnCsnQzqxfbOYtcDGtugAMlaUkVitxW20uhx4ehzd4LdKhauE
Message-ID: <CAFEAcA88pUf6tpn7_o-khYjRP6T1NwCuaZKREkC3wmd_YUKEiQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] hw/arm: Allow setting KVM vGIC maintenance IRQ
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 miguel.luis@oracle.com, richard.henderson@linaro.org, maz@kernel.org, 
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com, 
 hi@alyssa.is
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tEWC2aBzy5Nt

On Wed, 2 Jul 2025 at 17:31, Eric Auger <eric.auger@redhat.com> wrote:
>
> From: Haibo Xu <haibo.xu@linaro.org>
>
> Allow virt arm machine to set the interrupt ID for the KVM
> GIC maintenance interrupt.
>
> This setting must be done before the KVM_DEV_ARM_VGIC_CTRL_INIT
> hence the choice to perform the setting in the GICv3 realize
> instead of proceeding the same way as kvm_arm_pmu_set_irq().
>
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

> @@ -231,6 +231,7 @@ struct GICv3State {
>      uint32_t num_cpu;
>      uint32_t num_irq;
>      uint32_t revision;
> +    uint32_t maint_irq;
>      bool lpi_enable;
>      bool nmi_support;
>      bool security_extn;

> +    if (s->maint_irq) {
> +        int ret;
> +
> +        ret = kvm_device_check_attr(s->dev_fd,
> +                                    KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ, 0);
> +        if (!ret) {
> +            error_setg_errno(errp, errno,
> +                             "VGICv3 setting maintenance IRQ is not "
> +                             "supported by this host kernel");
> +            return;
> +        }
> +
> +        ret = kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ, 0,
> +                                &s->maint_irq, true, errp);

This doesn't seem to line up with what the kernel documents
for KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ:

https://www.kernel.org/doc/Documentation/virt/kvm/devices/arm-vgic-v3.rst
says

# KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ
# Attributes:
#
#    The attr field of kvm_device_attr encodes the following values:
#
#      bits:     | 31   ....    5 | 4  ....  0 |
#      values:   |      RES0      |   vINTID   |
#
#    The vINTID specifies which interrupt is generated when the vGIC
#    must generate a maintenance interrupt. This must be a PPI.

but this code sets kvmattr.addr to 0 and kvmaddr.addr to
the address of a uint32_t with the vINTID in it.

Looking at the kernel code in vgic_v3_attr_regs_access() it
looks like maybe the kernel docs are wrong, but I'm not sure.

thanks
-- PMM
