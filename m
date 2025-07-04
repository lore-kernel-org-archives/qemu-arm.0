Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1235819dyc;
        Fri, 4 Jul 2025 07:04:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVcolscw38t57iSdSnzVybBTo2dZc3aF1ayux/4jJIi/avG0Bcl0d3y89xJ4ab4C5lrqE4EQMBEe2ejuw==@linaro.org
X-Google-Smtp-Source: AGHT+IGDy5BF/edUXXlQBPclfVGJC/OPibCOEPm+38a1WW9vo29dhOCFVoJN/rPX1Z5DNX9xcMIK
X-Received: by 2002:a05:620a:198d:b0:7d4:5b68:2646 with SMTP id af79cd13be357-7d5ddbff5femr345982285a.57.1751637857105;
        Fri, 04 Jul 2025 07:04:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751637857; cv=none;
        d=google.com; s=arc-20240605;
        b=c021j53PsrXgKSiGbk3E5/2aMfB3lEu52HPVeW9bRSUM+7yExGILW3mmQaiOj+DBiU
         GNTB7unQMaYydkN5FcX9WH7GZ81aEbhQHaXKfxWfVp9rgrueDY1WnhZvWUc5tzalgivU
         fb83E/GGD7yd0KpN3r+HQZi9NU0+xVH9bmNdw8iWJATPKdxVal+inXhoBNIDOijanyKv
         Om9hlYZfDpVF+JdSexibUIKN1J32un03OkOp7/NRS/mEGgTa5QTnmWztp3/lXEzdElEv
         AW7MZa0bsCtqRHTPz6udjOxlAK0ONXlDZkOfMh2AqJQEvDOd72NtnnQpver2SF/lL751
         DgUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=fEOguAl/E9+enpXT7inQRZjrSGrT4GgdC/exifKAu0U=;
        fh=yr7ZH14Dfff2QKCi1wyYScrNocEz2cR3jTP4BgZqvNc=;
        b=TATYNW8AKgmrcrf5WjSJs6Pen3P+Edq6iSTd6/8VKnv1X8NsSC8sD5db9uaArqoXYv
         iEq72wgSVhX+PijNuVpMkx0zrwkOvLhUJRKduBM6yrt8C9zAfm7ky2+W4dgQH3jl23k2
         fPyREJ/iLoW5KE9fCeF0XYawYURLTyhA4LgkBneBC+Gs9TXOYVJio0ZzRNhXpYe00Hk8
         oEpwqNYAA9zu0wQSNF9imxdNyw9GC37pQ3lvBQIqrnzBZgDN9Cc4RzLIFRkx600Y7DQ3
         pldqJSzdfkbXepcdHfInWLRPpEWKEAwrTSIivssW4KgoNgYVXPodAWiIKhfi2W4ASG9S
         CNUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D5fXRZzo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5e36d40d9si23672285a.40.2025.07.04.07.04.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:04:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D5fXRZzo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXh17-0004R7-5l; Fri, 04 Jul 2025 10:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXh0e-0004Kw-L6
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:03:36 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXh0b-0000cE-PT
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:03:24 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-e7387d4a336so789490276.2
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751637799; x=1752242599; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fEOguAl/E9+enpXT7inQRZjrSGrT4GgdC/exifKAu0U=;
 b=D5fXRZzocUswboZFHsgTHWBtYvMHFRdQhW9O1UZ7xY90yiXVtehLoYtakHRgG8kym+
 8GyqordsCSjnmiFGrWa+aO1oihB2AiVSjP4xggIPRpmflW5QEywLKTzCO0SXc5AKVk3F
 OQY5uueggfpAjZJJxdJqmZ1Ctoq6tlDDuY36l9Z2dlVQb/d19x1RPsfr2M24ary1m0UK
 pIxPiNOGPKPCK0iNl6JdewWjm3mWnPq7Tg7P+WL2WmyjfXw5J8fkmuT5MCuxO7IneRFs
 waBXfSXAx7tXeLYaJlW0WgzR5NCxGsx7S6D+gRY23/uPS8jQ8/Nuje0P5HAbNsaw1ATU
 KCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751637799; x=1752242599;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fEOguAl/E9+enpXT7inQRZjrSGrT4GgdC/exifKAu0U=;
 b=kVroPoJ+dazpTb1Q+Z7fT8jJVt2hyGqfRQMQaClnDnrtl/PDtpPF61g12DT8NrTMy3
 bFZdxyJVPC8XgL7sfc86iRHK1WYrCZgWrzx2x/zZFnjfa6GeXpL/4Yh0Zzr30xUNQmSz
 U7Ap57l7Vwd8nbM+dbLyZPK4ZNOup5o7jz3YeDTsDD0QtqD/qbWEwYvfD9Lj3nzOVURv
 Bu6OKUJ3YScvuF4FlPwqcbJdug03cv59trbpzfyLocNY0xoIYHjU2oK89speepJpspXF
 kRsYq1C2n/gzPC692PWfC+TNv98Rts8u/9DRHa7yExY6bCz3ykEktJq774ig0wTM72LS
 m66Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAYe9h96MI/Ynn4BYq4ND42Jnrjs2K4M5f8KVqYvEPCyoa/ydc0AqcyGhufI10i2V/ESSDQQQJgw==@nongnu.org
X-Gm-Message-State: AOJu0Yw+EyyLlLIuJA04BCb1k3tMPkoZtAMlpU2RIeuLy316Vevh00ID
 U5EWs/LLYfUen83lqDpQkW7j7YBl07tFkLH59Nh0Z2tQut24XxaBnjDnYWlZvP4gNbpy6Zpad1P
 jyuwaY7w/bSbpxLYSk4Y4jqXc0F0prOihJfmdDKFceQ==
X-Gm-Gg: ASbGnct/OMLnkPuGJ49UT35VjbHUYZDrDhj0jnA2ahOVkg0X9csHB24ZXyfb9uDkwnX
 UTt/B2s1NtS/9Xk9vHDzudiASXpQZBd6EySwVzM3UPobVEP4ZltD6CDrubf4r5QBHPs5IhER1r6
 dfHp6Pv3XlrCbuZYvNCTadKuFASEhC7252KtiAJDlXHTZ0
X-Received: by 2002:a05:690c:692:b0:70e:2c7f:2ee7 with SMTP id
 00721157ae682-71668bf27b3mr33452547b3.12.1751637798735; Fri, 04 Jul 2025
 07:03:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250702163115.251445-1-eric.auger@redhat.com>
 <20250702163115.251445-2-eric.auger@redhat.com>
 <CAFEAcA88pUf6tpn7_o-khYjRP6T1NwCuaZKREkC3wmd_YUKEiQ@mail.gmail.com>
 <86zfdk9i98.wl-maz@kernel.org>
In-Reply-To: <86zfdk9i98.wl-maz@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jul 2025 15:03:06 +0100
X-Gm-Features: Ac12FXwkS6O-indDBiOlHX3su1HKo9gysc05zwEokHnxb9jIGMJYHKt2dZWRcv0
Message-ID: <CAFEAcA9Z5bSgsYvHMwDEbw7e-1V_Yi62X8r2pH_LRHQfVonJVg@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] hw/arm: Allow setting KVM vGIC maintenance IRQ
To: Marc Zyngier <maz@kernel.org>
Cc: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, miguel.luis@oracle.com, richard.henderson@linaro.org, 
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com, 
 hi@alyssa.is
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
X-TUID: VuN2iiFbUO46

On Fri, 4 Jul 2025 at 14:51, Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 04 Jul 2025 13:01:05 +0100,
> Peter Maydell <peter.maydell@linaro.org> wrote:
> > https://www.kernel.org/doc/Documentation/virt/kvm/devices/arm-vgic-v3.rst
> > says
> >
> > # KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ
> > # Attributes:
> > #
> > #    The attr field of kvm_device_attr encodes the following values:
> > #
> > #      bits:     | 31   ....    5 | 4  ....  0 |
> > #      values:   |      RES0      |   vINTID   |
> > #
> > #    The vINTID specifies which interrupt is generated when the vGIC
> > #    must generate a maintenance interrupt. This must be a PPI.
> >
> > but this code sets kvmattr.addr to 0 and kvmaddr.addr to
> > the address of a uint32_t with the vINTID in it.
> >
> > Looking at the kernel code in vgic_v3_attr_regs_access() it
> > looks like maybe the kernel docs are wrong, but I'm not sure.
>
> I think this is a pretty bad case of one person implementing
> something, and another (me) hoping (but not checking) it would be
> implemented in a particular way. Oh well.
>
> Would the following match your expectations (and the code)?
>
> diff --git a/Documentation/virt/kvm/devices/arm-vgic-v3.rst b/Documentation/virt/kvm/devices/arm-vgic-v3.rst
> index e860498b1e359..4843c91052786 100644
> --- a/Documentation/virt/kvm/devices/arm-vgic-v3.rst
> +++ b/Documentation/virt/kvm/devices/arm-vgic-v3.rst
> @@ -299,7 +299,7 @@ Groups:
>    KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ
>     Attributes:
>
> -    The attr field of kvm_device_attr encodes the following values:
> +    The attribute data pointed to by kvm_device_attr.addr is a __u32 value::

I think it's maybe better to explicitly say "Attributes: ignored"
or "Attributes: none" or similar. Otherwise it looks like the text
is describing attr, because it follows the "Attributes:" subheader.
(Though we don't do this for KVM_DEV_ARM_VGIC_GRP_NR_IRQS either,
which also ignores attrs and reads/writes a value pointed to by
addr.)

>
>        bits:     | 31   ....    5 | 4  ....  0 |
>        values:   |      RES0      |   vINTID   |

Is the kvmattr.attr field mandatorily 0, or does the kernel
ignore it? (I think the answer is "ignored".)

Side note, we seem to allow this attribute to be read via
get_attr for gicv2, even though has_attr denies it exists there,
because the get code is in vgic_get_common_attr(). set_attr
is in the gicv3-only vgic_v3_attr_regs_access().

-- PMM
