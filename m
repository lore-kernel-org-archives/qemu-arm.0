Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327C6C71130
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Jul 2025 16:07:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uYoNJ-0005xL-3Y; Mon, 07 Jul 2025 12:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uYoN6-0005kX-FI
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 12:07:17 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uYoN4-0000Ph-Sh
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 12:07:12 -0400
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e8187601f85so3062429276.2
 for <qemu-arm@nongnu.org>; Mon, 07 Jul 2025 09:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751904429; x=1752509229; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gI1NaEdiD3UCtdd4/givRGsziakR5o7SzMY1WqWAiyY=;
 b=g1yBMVQBTGP1iNBqavHVjaY2Xy6/NhofkhD830v6UOB4IP7L52xUIa8rb4zb1WgtRV
 3o7XYUO3XR7PxAx8SflQctI7vi3404cOzZErGssJQH09j5Ztb0LrQlOXbwYn5rm1PgOE
 dSBoNJLfpDEKvmZYG/VrT5sQ2iB1BDmIK9UrIoL6+rJlpEeORN9r9GPzVaFuTTg3FPJx
 KsWew7D0O1k2WvnsBkk8+1+ha2wLvi+vgEFFB554SuXb4+/q8zQ/nVJB604n1vwBOM0P
 uaZZlRX+QXLQRFs1IDKwnbTpGgscox9TA1/HxgcY/CnJQcQKhcayWkOm+eyikscKRamt
 yXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751904429; x=1752509229;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gI1NaEdiD3UCtdd4/givRGsziakR5o7SzMY1WqWAiyY=;
 b=qL2Ct4xU+Wr0NEw9vGLvVyiiJhLZfb1rphRVhpSBXETAbuieDQ8iKXoxeXLNLX3+pP
 SBHE+vnlGhMXdOLaFMDuWjjoKiM+s4OwZ0zUKAcdz93FyC3BPFwLMOGI/hTmjJcuFzDS
 t7IphIFEAHI2BLFloyAUCRrhwdlknUimjvKEQa+0fqj97o9zrXeaYsQBdxx9QFNd7Uxh
 CUn4D5lL70KhDm/8mazhLfWUBMomV6ZJXFf+bbf9DzYwyWCTJQ5RZAFDLf9L8A3IK6la
 DqpqqMuetMApS+XB5Qw+1mclZvIuDOiTvRhea9l2S9kgBK9gWb9CPw7E7z0Rmhx4ZnbR
 I6rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4vMGR31FnkfNMhWq3et0EkeCMFX7Z2MKfkXQzqXbxdZ+9l1ZmmscjHNk7QKOYijbT2470iWLnYQ==@nongnu.org
X-Gm-Message-State: AOJu0YzVVXD/QtWWpYkQzp499RrxL5aSI3S65eJ4+JCH46xI4grqXaPR
 uZZ1Sxn3+hTpl9UYakl60v0Q0yqcJiQUOhpNUbgJ95igClGiFOIjLL/nVk+ZLTlhcKDy7sy7x4i
 TcMu/hYiDNCZHklndAgV2Ul5zW3yOf10ejOygzbN5tQ==
X-Gm-Gg: ASbGncs1r/4Yd3UPx1c+C4RMcBRx8YKPfDmDYUYlCCzsWfBqM9XAa1enMbFIdwIKJgy
 HREsrhoSbXer3D4AHRmrmBxX/iHq9gF5Dmwqiogs0N9gj8g2BFVSfaF4VdkiOT8Nqobu4YhGyw0
 xi1Bu4gv4AT9QQDlItY/tdhAYLNwuRnyQRXN+2/s5CgLsO
X-Google-Smtp-Source: AGHT+IEQABQCCOXJ07L81DhzGDCLOUuWK3z5NZsAT6/B92P3SpagvN5tLKVZdZWhGvBo/4qsXZkiaFU4ctlC62wLzW4=
X-Received: by 2002:a05:690c:6e08:b0:6fb:a696:b23b with SMTP id
 00721157ae682-7179e4a6233mr548297b3.33.1751904429206; Mon, 07 Jul 2025
 09:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250702163115.251445-1-eric.auger@redhat.com>
 <20250702163115.251445-5-eric.auger@redhat.com>
 <CAFEAcA9hhdwHNrBfEqO4GD6kSb3Efcw-Rztq=CqvcOGMG3+z6A@mail.gmail.com>
 <9c78f7c0-88ce-4c4d-b6c0-5b77b4d83367@redhat.com>
 <CAFEAcA-qh5zPUY6q-TH3T8CCrD2KEfXNDrZbVzr2H-HX5n7sSw@mail.gmail.com>
 <86y0t09im1.wl-maz@kernel.org>
 <CAFEAcA_fNzm1w_vccMv8q6QhyPFu+qSSq23+EyP==LCV0xWWSQ@mail.gmail.com>
 <86wm8k9fb0.wl-maz@kernel.org>
In-Reply-To: <86wm8k9fb0.wl-maz@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Jul 2025 17:06:57 +0100
X-Gm-Features: Ac12FXyNPRiN4FXd84VRSygmlkJyWQBpj9q_0BOzyKTqI-L8FKFuUZur895ctuc
Message-ID: <CAFEAcA9qsGak2HY5n8F_kaxE4+anyLoOthKuXRfRBeV7gUEmAA@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] hw/arm/virt: Allow virt extensions with KVM
To: Marc Zyngier <maz@kernel.org>
Cc: eric.auger@redhat.com, eric.auger.pro@gmail.com, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, miguel.luis@oracle.com, richard.henderson@linaro.org, 
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com, 
 hi@alyssa.is
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 7 Jul 2025 at 16:44, Marc Zyngier <maz@kernel.org> wrote:
>
> On Mon, 07 Jul 2025 15:46:04 +0100,
> Peter Maydell <peter.maydell@linaro.org> wrote:
> > Speaking of GIC ID registers, we never updated QEMU to
> > handle the GICv4.1 GICD_TYPER2 register, so we don't try
> > to send and sanity check that on migration at the moment.
>
> KVM only exposes a virtual GICv3 to the guest, even in the host can do
> GICv4.0+. The only nit is the "nASSGIcap" bit, which is always
> advertised to the guest when the host if v4.1-capable. We have a patch
> series in progress to address this and make it controllable.

Isn't that out-of-spec? If the GIC the guest sees is a GICv3
then GICD_TYPER2 should be RES0...

Anyway, I have some lightly tested QEMU patches that
migrate the GICD_TYPER2 value, which I'll send out in a moment.

-- PMM

