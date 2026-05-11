Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF228CD37AC
	for <qemu-arm@archiver.kernel.org>; Mon, 11 May 2026 09:41:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMN7p-0001w7-R6; Mon, 11 May 2026 05:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMN6d-0001S5-5Y
 for qemu-arm@nongnu.org; Mon, 11 May 2026 05:39:24 -0400
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMN6A-0006Nx-Ko
 for qemu-arm@nongnu.org; Mon, 11 May 2026 05:39:05 -0400
Received: by mail-dl1-x1236.google.com with SMTP id
 a92af1059eb24-1329507c387so6671414c88.1
 for <qemu-arm@nongnu.org>; Mon, 11 May 2026 02:38:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778492316; cv=none;
 d=google.com; s=arc-20240605;
 b=ir2t0S7A9ZCxzaiaVH6TnBlwmToFra6SPIcD47aEmrmhdMsaRNxpOzGPoQeX3Uqhuc
 CcJ0rrlGm9O6VdmJFMpGrvoJLdBltXeBQPLeRQ8eOFzBLh4QC2IzCsNjV7Q7tVezpEeQ
 bpN6gefCIJM1zCSx8yy23KfUzQAQ/kihuQK4DozS/W/dJMVqmpEseqvLK3kGtNtwe3G/
 guXt1dHx8cjzUXXLyMcVPDPHg30SqAXHrgjAHk2eoExxjTYA1x3hdafEsaBR2MWg+eW9
 paz/uaDdCPY9hm3Hcq+XFDvydhue/lUpdU7npA9Zu1FmVKz44hS1aeF5A8Df05+hIqsB
 uW7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=7m2jz84B9ksxD8ZH9ghgs3kEtAtNrw6tbDwuxw0Q0T8=;
 fh=9cLPEomEvYQp2xZ76josjANprQSmF1Gdjio0YzAObHs=;
 b=YJfYA6TQH7svwFaJSeZjtr33DRjbfAYpuanqf2eZFxCZYtFbTiBMjeNsEoRszEBJbB
 Rr0iXGlMDj2KPAmZMWfd/9z/mSYr/7Cf7iCkoedFmP9YMefPIBNkig0jWULo42p8Kd24
 DOJx6DlRe2MTyD95VejCpqHXG/THxpN8/XcPe5qE0nD2Dorie87AzGbjEPtkohDpy4HN
 SjZa/rlkX4WRnV1TLygK5X3tISKB2093bBpvfCJIAkGn60vW83MePah/Qp7UK42cTyW4
 pW083m9LKggU6vxX79jePF96jlMDbw28CbN/we0XkkO24ZYyYB3Nri+WAWB2s40Vhcwu
 L9QQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778492316; x=1779097116; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7m2jz84B9ksxD8ZH9ghgs3kEtAtNrw6tbDwuxw0Q0T8=;
 b=VmscAMmiDGiK07QmXRRq38HD5V6iN1paxz3YGQ3QumYMNEz7FXvyVJeljfQ4c1zy6b
 f1VeOU59x1STmlBZkQ8EIoOTBOOI8V+2gywRg7BUSqV4FaRPj4eY4WIBZ5ZKZtoYQ1NY
 uYZY/oH1Ktsa+VEpthY3NzeV62sCliKwQuEINmdsYMI5NP2oxNtLhUNMPVoOzwqSy2y5
 TM2cyRfdIubwD4f5kuRPQHNU/Q2cuxHKb4Ox8VuniLhv9tTDmQEB2cbcxaPUEkzzuEbA
 7Vdsh2asXGozW3lMBrRwnctGizZFm4r+2Jy1tfRs55idUYrWeGWG/xPnCpODgQzz3oCP
 KDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778492316; x=1779097116;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7m2jz84B9ksxD8ZH9ghgs3kEtAtNrw6tbDwuxw0Q0T8=;
 b=o+EP2vDf8bL+MQxaaqqkDMpdw6HIVJwcuOtjkMLzZDGaUesg1UGLAVdI26Ql/Id6nJ
 n+XNCjDSqgxEL5EJ2YJw7kOGw0dLgM2HCaVOZEJeeVgaia/KV3aMtwo4n7gvl78BM5zM
 XniUsQ+TXx0R4J+dgNhx4bs2HemCHbpI317D3uk5slgdg87ZxNgHm9pay8ZXlie0em34
 P2b4oiyc/Ba1SL4bW5iKGCbwdubnYjfN9s3r7wlXZhzBvZFbDUFgZSFkJJj9ynDEn8kT
 H6lFi2iAV4+/IVT7toXJnLySmuCH3O114nYiXWV6NBkXjwgoV8TJUQJMHbMZ36f33cDt
 97/w==
X-Forwarded-Encrypted: i=1;
 AFNElJ+9RGbkmF62+6uqPmajDCtSZEPsGHX+NHaR3S5R40VmYGQHfnleC+d7/Y7ssSrO5hLOtKmA4S5n+w==@nongnu.org
X-Gm-Message-State: AOJu0Yy/elphHOGGPmS0GSpcPJbygyOsFJbxUFPpTxjaqhWJTlPw04SK
 7aj1bCD2wY2S2XL30zDAAcbwmxegt9bb/cQuM4YIAcCQh4IjgRGIXLd3knxjfylO8aPA2AlGgJp
 D5kicPV0kTH7CkQN/NxaIFBo3K2Sr4Ijv97fkYUtfFGgpXtLbRjjZ
X-Gm-Gg: Acq92OHzjE/Fn/N+NNVWc6SB/TuvICly8berq0AfDkBKCxKaaUvl3adZRyqR5jJ5ODB
 oySOfDRArsVDqYtQYrcv+3pj+vNxU4hiFvQDsEbPM8pUvtkBObaL6Dhs9TvpqCCXwTg0/YjZ31n
 zSSud92ZMfMKjqvHBZrMuU5Qz+PhSWTtS6Fun5JdEIvr1pwoc7te38BQCrdiXZOG71pYbPYGOK2
 UpA6ImdmGrIJaWmsrDVR/l1dNw3QDGwh2WXNSVcYfro2m2H7aHxroillOCftedCb3A952t/uv+y
 0pY4E/Het7JRd8ftZjUCD9T/qzzgXkfx5JFVjVqO27bz3I1/wPN/YybntB77JB7hjpU=
X-Received: by 2002:a05:690e:168c:b0:651:b938:188b with SMTP id
 956f58d0204a3-65c79c46c58mr22996973d50.24.1778485629370; Mon, 11 May 2026
 00:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260508183717.193630-1-tdave@nvidia.com>
In-Reply-To: <20260508183717.193630-1-tdave@nvidia.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 May 2026 08:46:57 +0100
X-Gm-Features: AVHnY4KJvyGgwSg3VDb4jYfnlrdFQ4HsXNAOChkVA_oRqH9XIYfUWmwNkWZrZBA
Message-ID: <CAFEAcA9KxUF6c555Q_Kqn_NVE3z1ojr91+KuatYudj_T4GjbxA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/8] hw/arm/virt, hw/pci: PCI pre-enumeration and
 fixed BAR allocation
To: Tushar Dave <tdave@nvidia.com>
Cc: qemu-devel@nongnu.org, alwilliamson@nvidia.com, jgg@nvidia.com, 
 skolothumtho@nvidia.com, qemu-arm@nongnu.org, mst@redhat.com, 
 marcel.apfelbaum@gmail.com, devel@edk2.groups.io
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1236;
 envelope-from=peter.maydell@linaro.org; helo=mail-dl1-x1236.google.com
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

On Fri, 8 May 2026 at 19:37, Tushar Dave <tdave@nvidia.com> wrote:
>
> This RFC introduces a mechanism to specify Guest Physical Addresses
> (GPAs) for PCI BARs, allowing explicit placement of guest MMIO BAR
> addresses to match host physical addresses for assigned devices.
>
> On some platforms, P2P DMA is performed between devices within the same
> IOMMU group. The PCI fabric ACS is configured to permit direct P2P
> without going through the host bridge in order to achieve the required
> performance.
>
> To support this multi-device IOMMU group P2P scenario in virtualization,
> the VM may need to use the same MMIO BAR addresses as the host physical
> address layout.

This feels like something's wrong in the design. A VM doesn't
necessarily have the same memory layout as the host: the
VM hardware is all about making that possible.

> Why QEMU programs PCI resources rather than EDK2:
>
> To support fixed BAR placement, QEMU performs PCI bus enumeration and
> resource assignment prior to firmware execution. EDK2 already provides
> a PCD-controlled mechanism (PcdPciDisableBusEnumeration) that allows
> the platform to skip PCI enumeration and resource allocation. This
> series leverages that mechanism so that, when enabled, firmware runs in
> a discovery-only mode and preserves the configuration established by
> QEMU.

I'm definitely not enthusiastic about having QEMU do PCI bus
enumeration. This isn't the way the hardware does it, and it's a
lot of code that's duplicating what the guest already has (there's
over a thousand lines of code in this patchset).

> We use the virt machine in this series as the concrete example
> consuming the fixed-BAR model. Other machines may require their own
> machine-specific mechanism (such as pcie-mmio-window) if they want to
> adopt the same approach.
>
> Example usage:
>
>   -machine virt,...,pcie-mmio-window=0x400000000000:0x400000000000,pci-pre-enum=on \
>   -device vfio-pci,host=0009:06:00.0,id=dev0 \
>   -set device.dev0.fixed-bars=bar2@0x6b8000000000,bar4@0x6c8000000000

...and you end up with enormous command lines like this full of
magic numbers relating to address space layout.

I think it would be better to find a way of doing this that
doesn't have the "VM address space layout has to match the
host layout" restriction.

-- PMM

