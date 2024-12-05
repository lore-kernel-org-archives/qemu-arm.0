Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp266487njb;
        Thu, 5 Dec 2024 08:48:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXBdBFeIvZRdUbrWIoyDGmehK/wI81a7nsgNhGNv7Su/gAFgZT6gEHJnKbDs5sVj1btW+g7gu6SgbMRtg==@linaro.org
X-Google-Smtp-Source: AGHT+IGeYGVcV26x7kq/wtxiW9pjIX400tAk7vgAoyhYxQSPehdE2pBjD/BjgCrN4717nrMIO/bH
X-Received: by 2002:a05:620a:4512:b0:7b1:5424:e998 with SMTP id af79cd13be357-7b6a5d77d02mr1405008085a.22.1733417287767;
        Thu, 05 Dec 2024 08:48:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733417287; cv=none;
        d=google.com; s=arc-20240605;
        b=J/GyWM6avnmTypEgAHQhQ/67FFSsywn1eUc/+1Zv9Ms5zqM6UJUtN2xKwfmWf4z41o
         ewOUXF12aoz0DwhW45/nBApjjctY4njz7C4xD8xFM4YVnmJ3SaKdljX63VWBnNxELBfT
         rAvns/20yG9NizSf39cSkQH3MlFxrbsqzufKqnb9Mw4PCnz+ZgemfyqQAr/y8gkfbOqF
         I981rSIUb9reyOf0MiKRvCCG0p3PgUmskRxDmtjesMuPJdJcMGROoPSnMqlmJHVzz6bU
         O5YaXRvpg7dM577R061t+9mNh0wQ87UuqJPqq9GLy8g8mdmf/NnhC1KL624l1eAvuigF
         QaYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=vKoZnZtieEW2hN260R2q1BP0rtYxvl3swlzNxzYrLeQ=;
        fh=Dlb8v9PnX55RDgssAbIo11po9wntpou25jtYcGkhcog=;
        b=AW8lB7FRh7ZCxgQ61QwN4JTQOokcLg41O1YGzVRqL4VPONw6iVbuosyc8c5FcwUUEN
         t3+mK8Vic4KI4zakTSnJn1zOWGtPftwyH5XgRn5CJPwvm9snpLSvXdlaq0mcz/f7fx7O
         dkd0hEUFtF+HLuWJyVUzGb+FJMxLrAROSMDwOlFuy+vVtpnpxBG44irlj6pBNf7iPkWz
         abSeQEtJvAYU7meo+hqMoA9oeAMspHNsPSrZEGr9C/wHulziydYCQ4JLbSi69a0QNm8T
         no6vFpAGb0pt+0faE6Q0iD7ex6UaiT0Qo4Pry0fCtZIcs2Pz4zLbYHkDQI0iM1aJi6wm
         PT2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GsjuUaCG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5a466e6si113183685a.17.2024.12.05.08.48.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 08:48:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GsjuUaCG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJF11-0006Dw-M7; Thu, 05 Dec 2024 11:47:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJF0y-0006BO-BB
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 11:47:44 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJF0w-0001Ad-NP
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 11:47:44 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5d0bd12374cso1364114a12.3
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2024 08:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733417261; x=1734022061; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vKoZnZtieEW2hN260R2q1BP0rtYxvl3swlzNxzYrLeQ=;
 b=GsjuUaCGtYIZiyJpVzl/4bfuGelkA546RJGfpNpZ+gX2fBGNJ7fNAv6F4tca7Q4r5c
 Rpxt+cO06YG6RUrXqpGU7ZVlGkFjz8sfBWdl3AtWDz4ekNC4nfeQf4nq7ol81WHNj85c
 aGQcJtj0qUk/JpeRqmeBGsXj+uMpANOdUJqZH07kTpz7u83ACtK1hzbUmeUqO6zXViX7
 42FUxz2qtiLJaXMNHCyIZkNKt3gkOqXAp3DPhGIybuhDaljPlCGudd4mSwUSwQQbBBnH
 iT7+myplFjVV9AKaKWmXSGLXpUalobW0wXJfLrJ+1Xm2S10L+t+r8yfngXBdwljL9LKv
 ESDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733417261; x=1734022061;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vKoZnZtieEW2hN260R2q1BP0rtYxvl3swlzNxzYrLeQ=;
 b=OYLk/HiZ82NAurf0U3PwYpHO/coDjrVjpXWsmdJKmoKCrQC9ubYoexHszbdaKZpWPN
 nqXDGRxi4Pno8b4+rnu7JjIPAxPSqLQENDJRRWOuf+HPDgZnEMTTWS1C8J3UDe9EaQEI
 Xszb9KVmCp/lLJDMyHt+G/7bhretPRaRzcLD5LtowuI9S2VdNOfYXMQCR/96IbZSZtFy
 oEcBOZNhNcofXNLcpxeHaT/VmNkpSwAK5R8LxF4S7trryS81lksn8r+FlujcKXuMkpCu
 +mJYHdAEr4W+AFU7GojUQ1cDy74gRsS54E5GN+hUsuLyCFiySiye+kZ0wZb+aS9BI8OT
 A1TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy9SU7CaLbTefZ3sF2NBNg7Bky+HFg79OwGDjgZOaMOV2oRoxatjdvRuwTjsiWibQqrKXgqba8GQ==@nongnu.org
X-Gm-Message-State: AOJu0YyWhJp3OfgqEDCsYA+6bbRDZXx4x4jpO3pfHIad1tdqkDjOXFcG
 OLWPJ/DKMRm2bTwHLN7xFLOYIAT4D5afg5Iz1dRY2myGO4FEEg88YD6L/UHOXIKdsZ9LtMa5OSg
 nj/dzAKbzcCf3leukxV7qGAQq+iOKIsaL+GcfRs1o9mLIDeLo
X-Gm-Gg: ASbGnctRMuMTohJOHnDNVN4KPMJYJL2/Auyx9x5R5szKnzmu4mlNmXmwl3RgZ3s5x5w
 PBejGslkIDqJeaNMGn2DnXUSOYxi2LDuY
X-Received: by 2002:aa7:d455:0:b0:5d0:fb56:3f with SMTP id
 4fb4d7f45d1cf-5d10cb5649emr16758787a12.12.1733417261056; 
 Thu, 05 Dec 2024 08:47:41 -0800 (PST)
MIME-Version: 1.0
References: <20241126112212.64524-1-philmd@linaro.org>
 <20241126112212.64524-11-philmd@linaro.org>
In-Reply-To: <20241126112212.64524-11-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2024 16:47:30 +0000
Message-ID: <CAFEAcA8Wm7dq--481ZJMb+fN7MsR9FJuB6hqRC4fW7ZBE5KYXw@mail.gmail.com>
Subject: Re: [PATCH-for-10.0 v2 10/13] hw/pci-host/gpex: Expose
 'refuse-bar-at-addr-0' property
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, 
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-riscv@nongnu.org, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: FV0mFK4h8bWX

On Tue, 26 Nov 2024 at 11:23, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Expose the "refuse-bar-at-addr-0" property so machines
> using a GPEX host bridge can set this flag on the bus.
> While the default property is set to 'false', all caller
> set it to 'true' so there is no logical change so far.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  include/hw/pci-host/gpex.h | 1 +
>  hw/arm/sbsa-ref.c          | 2 ++
>  hw/arm/virt.c              | 2 ++
>  hw/i386/microvm.c          | 2 ++
>  hw/loongarch/virt.c        | 2 ++
>  hw/mips/loongson3_virt.c   | 2 ++
>  hw/openrisc/virt.c         | 2 ++
>  hw/pci-host/gpex.c         | 4 +++-
>  hw/riscv/virt.c            | 2 ++
>  hw/xen/xen-pvh-common.c    | 2 ++
>  hw/xtensa/virt.c           | 2 ++
>  11 files changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
> index dce883573ba..44c6463afb3 100644
> --- a/include/hw/pci-host/gpex.h
> +++ b/include/hw/pci-host/gpex.h
> @@ -64,6 +64,7 @@ struct GPEXHost {
>      int irq_num[GPEX_NUM_IRQS];
>
>      bool allow_unmapped_accesses;
> +    bool refuse_bar_at_addr_0;
>
>      struct GPEXConfig gpex_cfg;
>  };
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index e3195d54497..f6cf43cf0c9 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -647,6 +647,8 @@ static void create_pcie(SBSAMachineState *sms)
>      int i;
>
>      dev =3D qdev_new(TYPE_GPEX_HOST);
> +    object_property_set_bool(OBJECT(dev), "refuse-bar-at-addr-0",
> +                             true, &error_fatal);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>
>      /* Map ECAM space */
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 1a381e9a2bd..06affc3638b 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1510,6 +1510,8 @@ static void create_pcie(VirtMachineState *vms)
>      MachineClass *mc =3D MACHINE_GET_CLASS(ms);
>
>      dev =3D qdev_new(TYPE_GPEX_HOST);
> +    object_property_set_bool(OBJECT(dev), "refuse-bar-at-addr-0",
> +                             true, &error_fatal);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>
>      ecam_id =3D VIRT_ECAM_ID(vms->highmem_ecam);

These don't look right, because both virt and sbsa-ref
set mc->pci_allow_0_address =3D true. And in the next
patch you delete them again...

-- PMM
