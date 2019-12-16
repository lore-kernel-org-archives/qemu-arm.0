Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4674166lff;
        Mon, 16 Dec 2019 07:14:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqzulK4pRhD6YytqvXmRrXiJcm1AsGby7X3l87N4ExpM3wQ8nyMEAhOTorp+W720JcfORYYu
X-Received: by 2002:ac8:19f8:: with SMTP id s53mr25634090qtk.29.1576509264118;
        Mon, 16 Dec 2019 07:14:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576509264; cv=none;
        d=google.com; s=arc-20160816;
        b=E4k7xpHSoEdt6XWKr/vphpy+7bPBdtp9fQuLgU3obuqmtBXhz5XK4trOEmxCHAoCBw
         +UAZPhUsDF2fYn6JYedecgHD3u0zyW8xWn7bk8LGPALYFF+AXmQUx07YcYyISM049QyU
         nxrGSRLNf6aabSUzPRWyI+lbeBIZtcmyqVcIZ/6LhT2iaBVCOpDRr5PXtvvljej0Ka7x
         8HjIh1yM93VT5j5S2qc2b5msdWRmlRZQEgQGSr6M55M+Q4IdcLmTqTnulMD2qtqzTfmS
         J0TvCueFZjTeHHZj/EltabePofHK8XAhppZWAssytAvqoLRUh7l47f+R7EyfHL6KRFWa
         F9YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hcPF0Wp6AEwCHVAM39VUCb0pgGQ7HDSvkvxVAmJmL30=;
        b=Fm0bxASdDo201WGlvgyZXh4/SBLwPAwtCgHq5Lw19Q93PfMnsTkvPksgUTJZKYib3D
         rnY7lZyHGptL65W+m9pvdiUTdJnLnW40uszplayGRwBpOE95NGPmxbSjGqKSayW+fxRF
         sRFVApwZUYzGifRKHRfeU8E8VN5hqg8JXcl1himLKUmdwRkdFS3U//cJrjImWf352d90
         uvf9QVtWskU7VoC3DtJKaAAcjvDXsu7cN5dtgjz3VNbmAiUSHBM5odZI9Gq1t/fiCYTK
         xqfEpG3pIas0wLQZbvJG07S/P/y4KIPSglRoklx0/BuEZC4WTFTdPxiTUIJriYTSbjRo
         1gLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YKWpQCS5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 44si364941qvb.44.2019.12.16.07.14.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2019 07:14:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YKWpQCS5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1igs4l-0001bj-7o
	for alex.bennee@linaro.org; Mon, 16 Dec 2019 10:14:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52964)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1igs4c-0001aG-L5
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 10:14:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1igs4b-0004Od-BH
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 10:14:14 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:40497)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1igs4b-0004N5-5X
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 10:14:13 -0500
Received: by mail-ot1-x343.google.com with SMTP id i15so9585355oto.7
 for <qemu-arm@nongnu.org>; Mon, 16 Dec 2019 07:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hcPF0Wp6AEwCHVAM39VUCb0pgGQ7HDSvkvxVAmJmL30=;
 b=YKWpQCS5Q+0IwhiJNjMyx1PDn8ePF6L6JE8d7WNq9HvJzsMn6LE9T55Ko/VKPRXWNy
 uR5apWZ3kzy/BU2z7iFFyjAVO/fzTSuZUGzChpJwvGdnhN5kWQZ7/fsZFI6CVa+JZWuI
 OVtF/5yIXAebQPNohZO6eHmQBIwKo4JeBHFBFpdJmlptu57Fi+cXxE3o9XPNYkaSpZ2s
 MuFrATi/h/vLje4phVHSnAG7Fp9W5uj22mhOf/o7R8xsWOVw35Carau24CPJFSsyuFfC
 2dFsSBPmCET1AX9YkpbOGl+3iu8QmJhk6jL36T4goaEqR2pbusuTxgtOe+rdEtfzWIVA
 PksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hcPF0Wp6AEwCHVAM39VUCb0pgGQ7HDSvkvxVAmJmL30=;
 b=EUpbH7AZ3wSAINngTZfRppsbRZzjSENxWHmQiwzQkZeqFIMpQJwICMAI4Bgg9Ypmok
 JRIvcICdIscLU7IMuJoKfGRGy8iCQo5aIe/NLuxivb14Rb5QsRSl0lyXiEw1N/PwWZuX
 9F3MdBpWnxenpa4kg1ibbI4wkpu/gHDUnCayX2QS22wBjs+X6xJnew0XV66gfyY5lDJG
 NHiDWdvxRrIIAzLW9J/rZsr9RA4KR+ksGHqm17Y+EfoA7uFZQDO7BeJpWpTED2/E3LPI
 I0oHgkFP5PDJ808Iumx8cGG6rforMiOs4Ux3Rd75dFwnmYtv1LFMJ7tRVjS2zsegnl8m
 ckSA==
X-Gm-Message-State: APjAAAXboexjiFO+FZS6R8kvfgcFUteHiBLpuuLRo2ThsLTL08b4Uu3h
 exJnU+jpPK3m0fQk+nW5aXF2P0Hdi2fUj72sgFdsGg==
X-Received: by 2002:a05:6830:2001:: with SMTP id
 e1mr30757996otp.97.1576509251530; 
 Mon, 16 Dec 2019 07:14:11 -0800 (PST)
MIME-Version: 1.0
References: <20191212173320.11610-1-drjones@redhat.com>
 <20191212173320.11610-4-drjones@redhat.com>
In-Reply-To: <20191212173320.11610-4-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Dec 2019 15:14:00 +0000
Message-ID: <CAFEAcA_u94O8WYLgB8DF=pu-3V7LrNWpiQFV5mDYeeqLj1Ee2Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/5] target/arm/kvm: Implement virtual time
 adjustment
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: bijan.mottahedeh@oracle.com, Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Heyi Guo <guoheyi@huawei.com>, msys.mizuma@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qoEkkD5cVRAy

On Thu, 12 Dec 2019 at 17:33, Andrew Jones <drjones@redhat.com> wrote:
>
> When a VM is stopped (guest is paused) guest virtual time
> should stop counting. Otherwise, when the VM is resumed it
> will experience time jumps and its kernel may report soft
> lockups. Not counting virtual time while the VM is stopped
> has the side effect of making the guest's time appear to lag
> when compared with real time, and even with time derived from
> the physical counter. For this reason, this change, which is
> enabled by default, comes with a KVM CPU feature allowing it
> to be disabled, restoring legacy behavior.
>
> This patch only provides the implementation of the virtual
> time adjustment. A subsequent patch will provide the CPU
> property allowing the change to be enabled and disabled.
>
> Reported-by: Bijan Mottahedeh <bijan.mottahedeh@oracle.com>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/cpu.h     |  9 +++++++++
>  target/arm/kvm.c     | 48 ++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/kvm32.c   |  3 +++
>  target/arm/kvm64.c   |  3 +++
>  target/arm/kvm_arm.h | 23 +++++++++++++++++++++
>  5 files changed, 86 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 83a809d4bac4..a79ea74125b3 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -821,6 +821,15 @@ struct ARMCPU {
>      /* KVM init features for this CPU */
>      uint32_t kvm_init_features[7];
>
> +    /* KVM CPU features */
> +    bool kvm_adjvtime;
> +
> +    /* VCPU virtual counter value used with kvm_adjvtime */
> +    uint64_t kvm_vtime;

How does this new state interact with migration ?

> +
> +    /* True if the run state is, or transitioning from, RUN_STATE_PAUSED */
> +    bool runstate_paused;
> +
>      /* Uniprocessor system with MP extensions */
>      bool mp_is_up;
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 5b82cefef608..a55fe7d7aefd 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -348,6 +348,24 @@ void kvm_arm_register_device(MemoryRegion *mr, uint64_t devid, uint64_t group,
>      memory_region_ref(kd->mr);
>  }
>
> +void kvm_arm_vm_state_change(void *opaque, int running, RunState state)
> +{
> +    CPUState *cs = opaque;
> +    ARMCPU *cpu = ARM_CPU(cs);
> +
> +    if (running) {
> +        if (cpu->kvm_adjvtime && cpu->runstate_paused) {
> +            kvm_arm_set_virtual_time(cs, cpu->kvm_vtime);
> +        }
> +        cpu->runstate_paused = false;
> +    } else if (state == RUN_STATE_PAUSED) {
> +        cpu->runstate_paused = true;
> +        if (cpu->kvm_adjvtime) {
> +            kvm_arm_get_virtual_time(cs, &cpu->kvm_vtime);
> +        }
> +    }
> +}

How does this interact with the usual register sync to/from
KVM (ie kvm_arch_get_registers(), which I think will do a
GET_ONE_REG read of the TIMER_CNT register the way it does
any other sysreg, inside write_kvmstate_to_list(), plus
kvm_arch_set_registers() which does the write back to the
kernel in write_list_to_kvmstate()) ? Presumably we want this
version to take precedence by the set_virtual_time call
happening after the kvm_arch_set_registers, but is this
guaranteed ?

thanks
-- PMM
