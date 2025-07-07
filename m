Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp2662548dyc;
        Mon, 7 Jul 2025 02:54:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVFD5Av2bTtq1DFTNl8lt3xJkJmuGTD6e5xcsQ0qjkpnHzsilp4Dg+XUVz71aeWfxAkkpvHDPGQf99MGA==@linaro.org
X-Google-Smtp-Source: AGHT+IEtjzfXd99jawWgO3/uOTZ6GYBAyJhPoQuE9BULTm5snR/6Fh/2IIKZXaS7GjL0ZanGOgDq
X-Received: by 2002:a05:620a:4510:b0:7d3:9288:5c1a with SMTP id af79cd13be357-7d5dcd25288mr1856457185a.46.1751882083108;
        Mon, 07 Jul 2025 02:54:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751882083; cv=none;
        d=google.com; s=arc-20240605;
        b=RouKr2+zFBdCjSMxrU2lan8BvSAggzz4UuUgor5NVBU9ujhnwGKJ4pT5QC794k5mad
         tAopn1IHV1yJwT23kGFbLOeVCIonf35vcTtd6hrBYrgUzFmqPDpPzEGZHTr/+IriDzX3
         izBV7fHO/T+I5n9eArqcN9dweUwCK2AmtoJbCxn1clfbapqfkD0JFrsRK+pnntzP0cFg
         jcdtqOoNSSqCsNtAp+aww5KVnJNZVOYGbRShtZxuIpGe2s7K0jLAlAfw/qZcbD4DBo98
         3fdwjMdTldRXmGU+H5unUEgYOZjb5Osa4f6DeMRvW6fLFIczu3imT9RmIuQRy00/cmaI
         4ggQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=NnvM2dIpOH02lrnDpPaCpdjsI5HScEB3WhvLdCaXmG0=;
        fh=PU5uLZXwzUs1XqqDhtM/xEbT8taCInWQujKgjaEbUIE=;
        b=bcnbMBJRoCpA0xTohEkiFeab3kOE6KVNndZn93fGtReUEouAEG8q0iPldyojs60sk+
         FwFLGQFXyWRmoazMDQ2SoDR5pYvADR+OfzxcwUX61njcsi0Yzb9cZURPpxbwG2P/jqVr
         JWcHd4e9ye0IJmy0PhTo+WFTYk2nfGHM5vz6yv2PazYM75TNZgxkJHE1vp59Ogxfx/B5
         f52GQYK24pBmI1/WmMK/0063Dc7Gq9p0S/88drRf6auTLI+8TU974bd1JYnjofzXbka6
         XiswZkRabgupE1ACn747CyRnxPreaT+456ymIrc2X5TQZ6Y46qxf7mBGU118t1wZEJcO
         Pgiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kHXD1TgV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5dbded3besi734432485a.161.2025.07.07.02.54.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jul 2025 02:54:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kHXD1TgV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uYiXr-00053j-MF; Mon, 07 Jul 2025 05:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uYiXq-00052x-Me
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 05:53:54 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uYiXo-0001Iz-SI
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 05:53:54 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-e85e06a7f63so2395033276.1
 for <qemu-arm@nongnu.org>; Mon, 07 Jul 2025 02:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751882030; x=1752486830; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NnvM2dIpOH02lrnDpPaCpdjsI5HScEB3WhvLdCaXmG0=;
 b=kHXD1TgVpW/LE0Jg/HKoDjyiTE7KaPbL71VX6xW8v2oHCuQh7ApAD4iLjZfKvYREdn
 aKnF8h0S2SitKeL3GhvxKsq+0otFLplkOwonwA6umfCWIyrcsP/dlj27/+hu2op4qp2J
 gJuHQ/S17o90CGBTL5LFA3kl5mGRF5CCl+jClWxZ6C4ldPjR0fGoOIndKeKZpueVIgPx
 Dxt9b7E52aaCjAT6FasKgvsHihU6q7Dn1yON/RH7Sd26AQF5Cr3K32Y+GDOf6zrJr1QL
 27nxuxsotDFoFZBbcPkiAWUwolfbdX+cBo1QkbLYGiYQb+UERJuEF7mC+VMmKjeLrdpe
 fdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751882030; x=1752486830;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NnvM2dIpOH02lrnDpPaCpdjsI5HScEB3WhvLdCaXmG0=;
 b=HwsAVZLLbxAYPcLtDZBmPq+DAYFgHhiM4tegIzW2JFMNHR1EBIdikmAhOSRH7QbwG+
 hSCiEBAqIpNkOklAP8+ekOqCE7y8LEDNKcaUsoFzBaMtQdOJxeC1nQqR4FzS9snoLJVL
 Eir4OKo14E23fz+g7lAaXiTxjq9VM1kGl4XgemMkCRwDUBpGoRLE88Ohhfbs8pBLuIJL
 epTYfnKol/8iz/9FS3MdHAfIxKITYV5mxGlCD7yK5lZxd16uhjvjiNjRmgO8JLwrqdpt
 mEAQ62TXIqcSGmsq+YktNUSMYqdSDlI8duIUjgVe3O55qJxbqJVL4lWvfDxGFRxtPp/6
 8HOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn4xF/LAo+qtwlf1Uc1/P+skyfac0vSXzDtMp0bMn3ky6H6Ovm2OA+MbCjHwr7PkAgWtKrA336Ng==@nongnu.org
X-Gm-Message-State: AOJu0Yxj8EIpClJeJf0BubbI+AYX0XVnlZULkfsmYw5QuKEnJNWjvD8n
 sunz4ZPROixJBSH954BRrOhCYKsrhGuNVe2M6n6dYEaNKjImd8dnPASAcjEoWD8kXNrllQI26N+
 s47+PsZI8r0rFvt8dHaCCz9G58O+2gWKQa+Q8EBbo0g==
X-Gm-Gg: ASbGnctmEF4Nk50QNhG3Xgc4mXD7NV71hu9qclQsPF8xUJiRHXMb8E4VMSMos7rxWig
 d/Bbhdr087dyk3tRM4426YvMC/Mwjg1IzjsSZLUsMDbV/Ac+5u/vrxiQdJzoQz9+jfeLnULVlRi
 BaliotcLAazbZ6J7QUjG2YyRVvYf/TuxvDeAj4Hq1P6NyT
X-Received: by 2002:a05:690c:680c:b0:6f7:ae31:fdf with SMTP id
 00721157ae682-71668c503e1mr166105957b3.12.1751882030581; Mon, 07 Jul 2025
 02:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250702163115.251445-1-eric.auger@redhat.com>
 <20250702163115.251445-5-eric.auger@redhat.com>
 <CAFEAcA9hhdwHNrBfEqO4GD6kSb3Efcw-Rztq=CqvcOGMG3+z6A@mail.gmail.com>
 <9c78f7c0-88ce-4c4d-b6c0-5b77b4d83367@redhat.com>
In-Reply-To: <9c78f7c0-88ce-4c4d-b6c0-5b77b4d83367@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Jul 2025 10:53:38 +0100
X-Gm-Features: Ac12FXxTdtPiPch3Ue0HkrUBbDR5O4vyx7eZpsdiJzkqQ5Be_UJpp0Yj0gb20UM
Message-ID: <CAFEAcA-qh5zPUY6q-TH3T8CCrD2KEfXNDrZbVzr2H-HX5n7sSw@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] hw/arm/virt: Allow virt extensions with KVM
To: eric.auger@redhat.com
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 miguel.luis@oracle.com, richard.henderson@linaro.org, maz@kernel.org, 
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com, 
 hi@alyssa.is
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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
X-TUID: jTj8MeJ56HIM

On Mon, 7 Jul 2025 at 10:30, Eric Auger <eric.auger@redhat.com> wrote:
>
> Hi Peter, Marc,
>
> On 7/4/25 2:22 PM, Peter Maydell wrote:
> > I suppose the system registers probably generally Just Work
> > via the sysreg GET/SET_ONE_REG API, but won't the in-kernel
> > GICv3 have extra state that we need to migrate in
> > hw/intc/arm_gicv3_kvm.c ?
> Do you see some specific registers/resources that would need attention?

All the EL2-only-accessible GIC registers: ICH_AP*R<n>_EL2,
ICH_EISR_EL2, ICH_ELRSR_EL2, ICH_HCR_EL2, ICH_LR<n>_EL2,
etc etc.

These all need to be exposed via KVM_DEV_ARM_VGIC_GRP_CPU_SYSREG
and hw/intc/arm_gicv3_kvm.c needs code to be able to save and
restore them into the GIC data structures (and we need to make
sure the kernel isn't accidentally exposing them as CPU registers
via the GET/SET_ONE_REG API, I think, in whatever way we do
that for the existing EL1 GIC cpuif registers).

I don't see any of the EL2 sysregs listed in the kernel's
gic_v3_icc_reg_descs[], which looks like it's what drives
the handling of KVM_DEV_ARM_VGIC_GRP_CPU_SYSREG.

I'm ok with just putting in a migration blocker for the moment,
especially if this needs kernel-side changes.

thanks
-- PMM
