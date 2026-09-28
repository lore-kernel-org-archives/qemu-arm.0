Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A392AC9833F
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 13:45:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBBfs-0000LX-Pk; Mon, 28 Sep 2026 09:45:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBBfc-0000BJ-Jw
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 09:45:28 -0400
Received: from mail-yx2-x0f.google.com ([2607:f8b0:4864:41::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBBfb-0001Q3-2F
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 09:45:28 -0400
Received: by mail-yx2-x0f.google.com with SMTP id
 956f58d0204a3-66f7f72a284so2838344d50.2
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 06:45:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790603126; cv=none;
 d=google.com; s=arc-20260327;
 b=ASqZ3sdcL9AA8VlkLnP98WMoYf4ECq6PwP6zWxE1b0XYkZTE2qKm1T7KWyMqy7f5uZ
 GLMr2XsphmG4nGzZ5vK/gTdvh0WAh4kKK9ON5TrF3h1GjXiiSaM90oa8LamTUnzkw8mq
 zhTVlQ7ZJF5eUTAAi1mZyynDQcEhNYMEPyhJHm2RXbRWb2T5ZyR33Pu6crtSeNxIovWB
 w2pQn+91LWx+z0G4R1yoc6OyLk/G6sOBtctEY7xvxq1wYfEGXYENiWPj1/1+shMbBJBb
 0H2qYH8dvfX1xdlw5Wz0yk417VwglIGUSpNBcNFVne0nxJT+sl0M2/iueTXJYsShNcHx
 URBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=KhV3UwfdpRcdUekG+mtvaodNjfW/8yJ5uU8Sh22D3Rc=;
 fh=oRtWNLoDpR6EfTI7+HFV/gXqlqqTqKGsg5+SwbtD+KA=;
 b=GiBW+yoTYLu6AjCidc2lfpnBpsentTSLjRAFHdg0/OaO34oyYlXt07vZTb6qFblk/M
 SD+xLev5sWpUyldXKFK84UiMyPcAl/tVYU0tIR1IAqZ1/C7RhWKGVeXZJZYA5ww2cYHW
 OzuzmLNM2M59EDx5cVQkW31Oo2GkUJvUWYfxOQoPTJ5+qPAk9LhBDbT1CUfO7INKwCrn
 CWl+suldgTxS+7Evb1iBEZtMh2NcmDQGvNtyTX90/bk97VyTEs9uFn5ucYdIbK6WpNJ7
 uQQFJrFxjteILLqJdPgAZ/B+NBAccw7BEmmsio4wHb9g7Udyb3jyMv8/ZczHIU1V59U+
 Nkeg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790603126; x=1791207926; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=KhV3UwfdpRcdUekG+mtvaodNjfW/8yJ5uU8Sh22D3Rc=;
 b=aXBQoI/qE9fIfFYlIZuWR+MzgkFZSgqt0YLAgXEcQmq69O2M/qejiJhK9SkY74WbUG
 4kGiUcEy3tQhsFiisYJj2EkCZqpNJKTor2mkeIG19BQjjMiizqDPmv5kZnIaUTFWFZ1c
 lfTfHuHXGcENlXSAM67rG7KIxp8qIKVottIL9jZLMkQYmk9468nYZA6dEyqv5CnmZ5Ca
 BY5YhKNdfcLVz+9F9MxkMxfW7q0oAXjihKRH+8ehOyWjLpYhT2nTdHSd5kU2fB9IsNII
 k3ZG6phhBgylOy35jMRXdVs11Hl5L6CD3Lu+kA4pnRXqe2YSQcc5tSQkcZjFA4puNJTH
 NTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790603126; x=1791207926;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=KhV3UwfdpRcdUekG+mtvaodNjfW/8yJ5uU8Sh22D3Rc=;
 b=Cbj9cOjaBVAYwj6HZp3mVG4oJ+p8OKmEjFrnNXvwzHrUMjWrr8wNWNNRF3Y6cDN0bV
 XuSjAFZPa+DobaO381fMZCHdA1sHAIGpvUfZkv/ROvPUf3kyIacXT+iVMHdLZWfgBCIS
 hBZ9lDrG02BnFiMmT88LWRaKe3Tvs1JK3RDkfdCWrGt3M6yGEfPwK0uX5nvb87iyLnGO
 AvHDCPhDn3cZAKsQS8VB/P5kl1oLECiZLGiaqj89HAO3CJ7f3QKZX5ZQvT9wZoYoDPRQ
 qS7izhBXDNreQAdaVlrG/XLm742q03TT4crRiRKUv1/uSLY+q6GmEMWAqECsP8Oy1bRe
 z0Aw==
X-Gm-Message-State: AFq9FYKWyXzcyBPeA00dNpmhGH2rIwR+3n05qHxUM0k+VNhk4wIiC+hv
 9jcVLqBAME/anX19tP51A0EnCFdC6P9d3uv7cBWaXlvZhS+g0wDG8/0em3nszSa336r3Lw42Dlj
 e7wNx7EfAcrbWaxJ8QbBFFo7Mg01yNYr7KAYUs8r3UA==
X-Gm-Gg: AYBFou0uWGaMUku7K4rn6lhGXWCq+jwNKuCSZ0cd2Hcp17xw6YbosDT4TKEUy+NQLli
 Gw81Fx5BjMZ50sZZT1+pnVqnqHe3GrtLPRalFruXfKqhOZ+CjqzuNAob9C41LdUHYoqc9TfH1hN
 dNbLWOyiZG0CKF2bxTQNp39IDSQh3wUXwgEKw1KlTyQ1/E0fftei5i3v/AY8iDz0ZXD67/+2de5
 H9FTkeR0yTgCMiV8Sq/As0ykVO38OhOYqS0f6gcH/iB9DhGWMBm9g2ikhu48XM4JFKkRzgC7KQz
 iFpGmgHe3H8F/xTF3yjMMO3YxqRbrbRCSfYu+zoduXbF30OIrMs58uHB/NWySVIDUfvlBUF3ygX
 MYMr4sIUrf7p1WOwtBggvKOMvwTxR5/o4Kt94dtYL
X-Received: by 2002:a05:690e:12c4:b0:675:3735:fdf7 with SMTP id
 956f58d0204a3-67537360a90mr2238368d50.16.1790603125537; Mon, 28 Sep 2026
 06:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260918092120.370805-1-wangyize7@huawei.com>
In-Reply-To: <20260918092120.370805-1-wangyize7@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Sep 2026 14:45:13 +0100
X-Gm-Features: AclHuK8jh9wcEEcEWy7aMhBejScFDDnV4iFR2vRW8uZEOMq8YObDbqDJLsKPyCM
Message-ID: <CAFEAcA-mW_3=qgy2w1cLcXmkEqx3WrzifktvZ7P-0Wez4A=JPw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Batch register access for live migration optimization
To: Yize Wang <wangyize7@huawei.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com, 
 cohuck@redhat.com, pbonzini@redhat.com, zhengchuan@huawei.com, 
 jiangjiacheng@huawei.com, yize_w1110@163.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x0f.google.com
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

On Fri, 18 Sept 2026 at 10:25, Yize Wang <wangyize7@huawei.com> wrote:
>
> This series adds batch register access support to QEMU's KVM GICv3
> register synchronization path, reducing syscall overhead during
> ARM64 live migration.
>
> Currently, QEMU issues one ioctl per register when saving/restoring VGIC
> state. On large VM configurations this means tens of thousands of syscalls,
> where lock acquisition and context switch overhead dominates migration
> downtime. Thus, we provide a batch register method to allow userspace
> read/write multiple distributor and redistributor registers in a single call.
> In this way, we can significantly reduce syscalls and migration downtime.
>
> All batch paths probe kernel capability at runtime and fall back to the
> original one-by-one path when the kernel does not support batch access,
> ensuring backward compatibility.
>
> This series depends on the corresponding kernel patches that add
> KVM_DEV_ARM_VGIC_GRP_BATCH_REGS support.
>
> Test the VM migration time under pressure conditions.
> The VM specifications for migration are as follows:
> - VM use 4-K page;
> - the number of VCPU is 160;
> - the total memory is 320Gigabit;
> - use 'Redis SET-benchmark' to pressurize VM;
>
> Performance results (3-run average, ms):
>
>     | Metric              | Without patch | With patch | Improvement |
>     |---------------------|---------------|------------|-------------|
>     | Migration downtime  |        536    |     321    |     40%     |
>     | Source (total)      |        344    |     230    |     33%     |
>     |   - VGIC put        |        158    |      40    |     75%     |
>     |   - VGIC get        |        120    |      19    |     84%     |
>     | Destination (total) |        192    |      91    |     53%     |
>     |   - VGIC put        |        132    |      27    |     80%     |
>
> Yize Wang (4):
>   Sync KVM ARM VGIC batch register UAPI to QEMU headers
>   hw/intc/arm_gicv3_kvm: Add batch helper structures and functions
>   hw/intc/arm_gicv3_kvm: Refactor kvm_arm_gicv3_put for batch register access
>   hw/intc/arm_gicv3_kvm: Refactor kvm_arm_gicv3_get for batch register access

Just FYI for next time, patchsets like these that are the userspace half
of a kernel KVM API change/enhancement that hasn't yet been accepted
into the upstream kernel should be marked as "RFC" for the QEMU patchset.

thanks
-- PMM

