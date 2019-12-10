Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5992681lff;
        Tue, 10 Dec 2019 07:54:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqxSBsN6E2DH7rYLMlJcETOYG9U7UYmasi4vS2H0nfKL4mlvawy6Kd9uADTg0+OIBPKYVe/O
X-Received: by 2002:a0c:990d:: with SMTP id h13mr28917431qvd.247.1575993275490;
        Tue, 10 Dec 2019 07:54:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575993275; cv=none;
        d=google.com; s=arc-20160816;
        b=JotPBvLIOEJuC6Ce+TmGLkN1ZqZcFgZouxO/kR4AOmFCu9FgNj5QzX2/vBJ+PX56PX
         hUSf8Pgunjh0SUgo4D5nZaVLOi6z39piHav6GvmUG6heGHGl8eR7iY76aGKke1tL3QH4
         c+HiYOp1Zsi1D3VfztpiN2mTHCHIiVNi8Z+TihW8vte44bAoUr6FO1B4RBPbA3QqQYNT
         D1x85HTU5Lhom7sUxX/jytwHrkVgGFEa8Vi/AudoI/METcj+aiVHwgV/WxxOmFudXQSs
         zH/Ke45AA0q7hqLaeQRdN+JXJ7Cn7+wLemYCzVPQzdtiXgLNbhn+L5sa4X1MFwjv+BDi
         i1jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qkvXH55G+iv0yZ4areBM4JInh6uKCzUpqm+YCgqvJbg=;
        b=SxMWxVDa8Ughm6Vi9H//3t+5xOpgunnS6u9euT79ItTs81jqEeZZKekFkj7pLBoTC1
         Te1oyw0dzzBkU4kA1iioPcXUmW3uR9RSyvyYhPAk+W6w5W2YKOblvLXPVwhqi/YBAj7c
         mXClzcmRZDWZsZoLccy5h9sGeUdZbbdg0joqKzhAtvsRvDUqXQMSzT+KvEkNieNHTYCu
         GqGHj8ukQ+++dOuEyx0FevkaGd7spFF1mpsV1nq+QtMh2emfrTxVVggbd027xulEb0Hp
         1KVueZQ+jpdF+Y37/cqHj7CNzV8r6ZO0vqv0cEEPxnVYGUOS8WUlsCpHyKRpAUFs94mz
         +p6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="KuFGnYt/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1si2035106qkd.325.2019.12.10.07.54.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 07:54:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="KuFGnYt/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iehqM-0007cf-OT
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 10:54:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46776)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iehqB-0007aw-V6
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 10:54:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iehqA-0008JK-RR
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 10:54:23 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:41119)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iehqA-0008Ix-Lo
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 10:54:22 -0500
Received: by mail-oi1-x241.google.com with SMTP id i1so10208770oie.8
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2019 07:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qkvXH55G+iv0yZ4areBM4JInh6uKCzUpqm+YCgqvJbg=;
 b=KuFGnYt/t268MsTXofoQshaYJr/nAShbCt+AOCnnzl96R8uRChzhjFXZN5CMtqb7Xr
 pxY21NtQsyPc8qWeSj36a/J7SC56DecORnLahkTeDyelNgVzR8wtuLGlvptJLsT1DWnY
 b+37dw4vio4cT+HWLqfeh+BTveDbM/SkVpXUtH+gdvfEuJcquhdK/8O9UF2iA/Jr5onx
 OsIhWk+j3bD7fxvViXxNgHWZN2+7n5hzdwHT1lDLjXeNrqTqd0MpYE6ADUTDAYATeM6Y
 GYx/j74CL0yipW+ERJ5B/GRI+HakWcD9/S+FgHXY5Ae4woqoc+itArFHecIwL3MtLEx2
 15Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qkvXH55G+iv0yZ4areBM4JInh6uKCzUpqm+YCgqvJbg=;
 b=ZnEPYBOl6OPB1F7iFfqdAOQezpZsxlyZDug1sutfh4UN/8rY2mr+mzT4ongcfZ3xNo
 XG5No1XIdP9Y1gBUaT/aIgje9BJFA8TLPvqR4ztHItJxNkHBfBjSNRELd4PaLf4a3hBJ
 z4w8ZwBg73/mA/a/v2iEIUchKFJt55qvolIpUWU/vhYDb7/SFqk7qu6Bc19TkCT9HZ0O
 SgIAY6tmda/oNAuSxwxQRZ2kxQqar3QY+t8rsD9UsmcUdVpHS2YqVKAns2iUwJ2stxIx
 kiLTXftCpUXLqngvYHu2QD+DUxmfmWbdaC3m/ASoauXqxrYVM22u+k5Z44ljg4VTZOoK
 b7vA==
X-Gm-Message-State: APjAAAXn4btt4LScg9712dt0kVN29GVJnbduKQ4g2LwaZU1DeDSGxzM/
 K4tj4pMARajCMl9t3xGWEe/7hVxRfTYldUUZxgBWhQ==
X-Received: by 2002:aca:3182:: with SMTP id x124mr4651766oix.170.1575993261791; 
 Tue, 10 Dec 2019 07:54:21 -0800 (PST)
MIME-Version: 1.0
References: <20191016143410.5023-1-drjones@redhat.com>
 <20191016143410.5023-4-drjones@redhat.com>
In-Reply-To: <20191016143410.5023-4-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Dec 2019 15:54:11 +0000
Message-ID: <CAFEAcA-uP9eAMu=S98hv7Ge_3GU42acpfvWDMmcMSKagnD9rsQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] target/arm/kvm: Implement cpu feature kvm-adjvtime
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: Marc Zyngier <maz@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, bijan.mottahedeh@oracle.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MzNfYsWIMY8i

On Wed, 16 Oct 2019 at 15:34, Andrew Jones <drjones@redhat.com> wrote:
>
> When kvm-adjvtime is enabled the guest's cntvct[_el0] won't count
> the time when the VM is stopped. That time is skipped by updating
> cntvoff[_el2] on each transition to vm_running using the current
> QEMU_CLOCK_VIRTUAL time. QEMU_CLOCK_VIRTUAL only ticks when the VM
> is running.
>
> This patch only provides the implementation. A subsequent patch
> will provide the CPU property allowing the feature to be enabled.


> +void kvm_arm_set_virtual_time(CPUState *cs)
> +{
> +    uint64_t cnt;
> +    struct kvm_one_reg reg = {
> +        .id = KVM_REG_ARM_TIMER_CNT,
> +        .addr = (uintptr_t)&cnt,
> +    };
> +    int ret;
> +
> +    cnt = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> +                   cpu_get_host_tick_frequency(),
> +                   NANOSECONDS_PER_SECOND);
> +
> +    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +    if (ret) {
> +        error_report("Failed to set KVM_REG_ARM_TIMER_CNT");
> +        abort();
> +    }

The commit message (and the doc comment for this function)
say that we're updating the counter offset, but the
kvm_one_reg operation here is updating the timer count
(and relying on the kernel's handling of "if we update
the timer count implement that by changing the offset").
That seems a bit confusing.

Would it be possible to implement "cntvct should not change while the
VM is stopped" with "read cntvct when the VM stops, and just write
back that value when the VM is restarted", rather than
"write back a new value calculated from QEMU_CLOCK_VIRTUAL"?
If I understand commit 00f4d64ee76e873be8 correctly, that's
basically how x86 is doing it. It would also let you sidestep
the need to know the tick frequency of the counter.

thanks
-- PMM
