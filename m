Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp141536wrp;
        Tue, 3 Sep 2019 01:30:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxLcNETYOJY6jHCAO/nO8rvjjXgOwBFtRKQzXpde0S2dgvdxwoxM8CfCaqzt5XcVnukeyS5
X-Received: by 2002:a37:a7c5:: with SMTP id q188mr8412959qke.445.1567499418061;
        Tue, 03 Sep 2019 01:30:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567499418; cv=none;
        d=google.com; s=arc-20160816;
        b=LU3J5KShf5/QBIbDBaFqI3yscx2pUB5TBy8xxq3PZNpVJfVmj0AQb2tle73TfMlCUf
         B2FUOdZcTDovLJiqkoXAttpNx++by3vl9uAjviibmil4Zs6fLPpQi9nOb1wcpPnVN7zO
         iu/L3YcbcAG9Av6v810F0klrz5El/5uC+amO75QMcpx3Ay7M55F2iRLBKq5a2TgYINlP
         WQ7Hoss2oj9IRslsMYlwP0AFq8LSxxEwcVfrCyPhvJxe5AofuB0gjpNU51bc/SilWTf2
         MZYmc+EILLUdpyKg1mJDRJNIgfneKjzN+C5Pp5p4gdwWkLIKceUG+gsSVKnXRFXfeAic
         +wYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=35gUwPiCbqr3w52IQk5/eO65UJg93NKnZPYG1t/cNHw=;
        b=tNg614NxgBro3JGs1mTdoIRwuOWlcoZ1JqmWSA3Lgoq7ZE0cuxUccz67au80qxg8+X
         5696CouZR+/AIovQU/X4wzjsAEXDdAks1BmLZAaQgYVmNxTZUnEso4pi+U82nuOetbmD
         N02x/1fG/r6Hy21IpsIwCsmjg46KrxD0E1IufmXXYmBFBmsP7N17kePHOM+HZ8ai/rDN
         GfYNfX3cmPzaDAhcOHHmIN5WR0Q+bNwPV/BFETmN0Hr3zHzdNLtVL/MFzE338EeMYYtr
         PSKiYCPQv1VeojoG2D/tzBFoprkQALAOU59vo0XbggXydaOHLbZqUjEK8dGNCSdl+hik
         YrXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="o63xXl4/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q33si9897683qtf.126.2019.09.03.01.30.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2019 01:30:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="o63xXl4/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i54Ce-0001H1-QY
	for alex.bennee@linaro.org; Tue, 03 Sep 2019 04:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50888)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i54CN-0001DT-4B
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 04:30:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i54CL-00047l-O4
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 04:29:58 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:34092)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i54CL-00046S-HY
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 04:29:57 -0400
Received: by mail-oi1-x244.google.com with SMTP id g128so12168554oib.1
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2019 01:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=35gUwPiCbqr3w52IQk5/eO65UJg93NKnZPYG1t/cNHw=;
 b=o63xXl4/nuDpsRUyVXxke/qjYchpwqTar2e/MzJaTOCZXDlkEFe43v9YUNkE5mTKVh
 iv2FOLpX9QzBEDueh/bfyt7ccHF8AzxYf3hgsMiTMI5mDnjlhxcyGH65Jwb5qefv1TAs
 LVPxKeTyDyARAXHKwGszT86U0t2GZr0s7Hy4tZzn50MXX4dPA8Dpt14k11qBwr6FTkFm
 BkcINRvK7IDdvFKwyuOZhbQhlj2fSWu/P88FMnugF25/qvX2GaXqp3DS9y7RFTPMITMC
 rgSPD8webzUHgnQVJCsHVeiD6hgopUrDdyFbkjfMXI8FjQCvGkSdJGjVicBp3VWuI9UY
 FgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=35gUwPiCbqr3w52IQk5/eO65UJg93NKnZPYG1t/cNHw=;
 b=H0HfJLEpbDr/cf2Vnti5UPlTk1xcoW7JKH+1XM4WiJSbhy/YyZX9mP5A387ErMP8U0
 Wjl4zSpmuJn2zfi6g7ZmI74D2CamguY5WCixphsf0xDvOvEWH3LS7cbin7UEzIj11JdN
 5ErF9+19PHynEDi51eEm1v7BlhNnZGQTOqOeHUBhhJFAoARGha+q343JR+C8pUmToShS
 7Nubu+IfoXVAZnXO1r/wWXKDQt52Ct4jGrMNFOl7gZuZOEs6Qqpsac2PolFdhhm9xWSR
 qnvygcCqGd7uDL3C6xDFvs5e+t8T7E+HwCsKXwbOYER9Y18tSo88yg6+PFc5/3QYoL+Q
 4Clw==
X-Gm-Message-State: APjAAAVvTRnQAhjulpjNpREJTVMDkfd5r6Tx4XpmkjXKI53wUf9HEVux
 N+yqXn5C23i6M7eQ1KPB1T3vfEjOcJpRNP3ZPvQkCg==
X-Received: by 2002:aca:f54d:: with SMTP id t74mr13513879oih.170.1567499394582; 
 Tue, 03 Sep 2019 01:29:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190827160554.30995-1-eric.auger@redhat.com>
 <20190827160554.30995-3-eric.auger@redhat.com>
 <29520007-f3fd-ed8d-f52b-2839f991556a@huawei.com>
 <0dd3bc89-8f91-0f8e-8908-18712240a115@redhat.com>
In-Reply-To: <0dd3bc89-8f91-0f8e-8908-18712240a115@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Sep 2019 09:29:43 +0100
Message-ID: <CAFEAcA8u3Qe9zx=4QxW_Bb8a=JQ7kUmiAO5H-cwAU4i3R+Nf8w@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 2/3] intc/arm_gic: Support PPI
 injection for more than 256 vpus
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Zenghui Yu <yuzenghui@huawei.com>, maz@kernel.org,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tEnamXxwcdka

On Thu, 29 Aug 2019 at 08:58, Auger Eric <eric.auger@redhat.com> wrote:
>
> Hi Zenghui,
>
> On 8/29/19 4:53 AM, Zenghui Yu wrote:
> > For confirmation, should we also adjust the vcpu_index in
> > arm_cpu_kvm_set_irq(), just like above?
>
> I am not familiar with this path. in arm_cpu_initfn(), there is a
> comment saying "VIRQ and VFIQ are unused with KVM but we add them to
> maintain the same interface as non-KVM CPUs." So I don't know when that
> code gets executed.

That comment is saying that all KVM guest CPUs are
EL1-only (since we don't handle nested virt), and therefore
they logically don't have an inbound VIRQ or VFIQ line.
But we provide the qemu_irqs for them anyway, so that
board code doesn't have to have tedious conditionals
saying "if this CPU has EL2 then wire up VIRQ and VFIQ
to the GIC". If you ever try to actually assert the VIRQ
or VFIQ lines you will hit the g_assert_not_reached() in
arm_cpu_kvm_set_irq().

thanks
-- PMM
