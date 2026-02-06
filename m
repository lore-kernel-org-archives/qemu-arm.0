Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AAFEE20AA
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Feb 2026 14:16:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1voMcw-00089A-9y; Fri, 06 Feb 2026 09:16:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1voMcO-00086x-9f
 for qemu-arm@nongnu.org; Fri, 06 Feb 2026 09:15:35 -0500
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1voMcK-00014S-Bp
 for qemu-arm@nongnu.org; Fri, 06 Feb 2026 09:15:31 -0500
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-79430ef54c3so7376097b3.2
 for <qemu-arm@nongnu.org>; Fri, 06 Feb 2026 06:15:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770387325; cv=none;
 d=google.com; s=arc-20240605;
 b=OqcGS73kG/uAFfP2WlSIXLDBd4HbvEe9E1NIr5HJVDMIG6oP0IVVBgfw4abJvv+PVY
 rzex32dMR3OTjQMWUVj6h90d/MJ4nFcgX4r+hrgSnuQxH1zROjlvC5P3aM+0U8Xto19c
 w5+tXMK3/Ug5Hty6CTmtThqg6ouih5IvtacrrRhO2N6006Mk2VMTQsJdADy0K8itrUvU
 1jL6ZhcuyEPFZEPmZIf+tXJ9EUT8jh5EehVd/I7d2RV6qF4WR2x50oOw53d8bOwOhiv3
 ny6qrmI8oyRhrjg1gSt9eOScsW9fc2paiX5WXR7IHpnRCBwMRiq+qZZfAITGzdLmkonP
 8ojQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=x9ilGo9/5e9KbmGpslAvXjv/c1v3kw6kBb4KuUuJfdk=;
 fh=91dnbm2V6UWVP9P5PkmKWsPPvZ/R0wT21H+YBXBBe6E=;
 b=JV8nP1Vg6ojbqfWUYCGIh5vlvM1Ecoo1LumLY6ePrf/lA8L8ZYuEA/IvineoEqXsCy
 ldfTurY6fyLe1W4oBWE+GHIb0++jGvfNtJXrn8o6bnPUBowdRhMhqmRw1kgp38vHx7rZ
 tl/LzcT8l1pFhWXNvPQxoOpCCA6sFMXzOQ9WL80SEHakNbBXlgR1c0oK7mSNC2zqXhts
 qeTBKQi0/8nQrZcZV+xbqNTTdZaQR/89xxzBGjjfs6ioYHZCs/Kkqz/mSwjEZcqGzn1g
 fQVS1Jd6jYDGq4YlowRR8hm3KmdzOJ4otzH1SILZAY3DxDSW36+jF/1gsctpGg8EfpLd
 56cA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770387325; x=1770992125; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=x9ilGo9/5e9KbmGpslAvXjv/c1v3kw6kBb4KuUuJfdk=;
 b=SyiB6HzhEJjEN1tG/aeaswPwvfbU4yoIQV3Zao7fJw+gJP1mEWEujzVQcqUuIChWwv
 cmsV08K4trt5SS43v/k+q5zJKQxGVUWU1FLv6R8Y+TBjYoiot149VuUx1Uc9zSZHkLD7
 bXG0NsCp8agfQ5D+gga7iROrHvgI4cXiMP/2LskEVtT+P0HdLm3AEoZhqnYlulVaxu8o
 WLXUvib1Aqt63XknrdTkm5KeT4kOn+1xS4WPrBdO++R4YmBdkSPJIZ6DtmMV1NZdjsco
 yT5IztxU8Bb97mcXeX65LRXEOTknSb5kkWQ/Wib7zVQ5erRrpDqiIFO+0Cal2ZYwbt5q
 hv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770387325; x=1770992125;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x9ilGo9/5e9KbmGpslAvXjv/c1v3kw6kBb4KuUuJfdk=;
 b=DzJJotEoBCR6FlLwGAcvLWuObEKV1neix5IF7AssPtf6Rn+ob0SLEU0APW81auruLY
 upuu9o4/P1CFQbCFUkcFZv0wpfQB0Plu3S7ssrkIQfZknCxIWfIH8SEfXmMU/5l0qenq
 e21m/wjb92sxqYlYk9TRF+rAK+LwBKyTGdRhyq6qBOA42VJlNgIgmWAxZLQSCtHbTZgW
 IhclRbHxw78rmHfsqucWiTXLhz+SdgEXfDFbzmxqeapiqinBuvXUzaoa/iWZ7NUesH2x
 UV8vXgf33uZJPXeNEpCPdCKWiraMUbiMpDT01WdRmd7v9vscHkvHpU1pwk4jwFYlA/Og
 CjkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbtivLN1Jj4WysBuN7LbqHZ2Z0DghMoCqkVTScIDADvYAe4a9D//K6nPDswuPWQtvy4CawkGpTZQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx36h2l6iOepNRNTLXg3VK/dmVK/RJocn5w//nC3BtgjD3K4PMm
 Dh/L937ahJaAMmN7WDib2bX1YpSJL1wZsYmqlnpmo7gV6ACK4vQLcesG9t4YnfLDQ137MnMUaUd
 /QR/GFyowZzTE0eN8ivuBwavjRF4gaWs5NN0hfGvE8Q==
X-Gm-Gg: AZuq6aIom1arJe/y8ddf6iHfUCU63wYbY9ERx46VNxGuwtTeekjEqv8JzhKGIq06iYd
 zNaZSJ81tcoPd+skvnvr9TYDxM+C0aPx1LqiGFP/oMKEaKtezGoRqutqyVnpm2hZfohzucOQ+x5
 LlRoJG4ZVRKmflKJeKfyqs0iwYvLX67eBhi8JGW4pSEpHbrWtBvBtNSFCBq5ccj90g7zJWT0jmz
 UckImbby4Tf2z8rLk8MjneNqJJyCICa0Pfz152ZBljrHzKdaqTG3opXB8MJsfXuoJQ4sSNG0MbE
 4mv4k+A7aKO41Qijg13EO0JXPviUveXRW36d+XbzgFft3nVeilHZLAk=
X-Received: by 2002:a05:690c:a96:b0:795:616:4367 with SMTP id
 00721157ae682-7952aa74934mr27529477b3.4.1770387324421; Fri, 06 Feb 2026
 06:15:24 -0800 (PST)
MIME-Version: 1.0
References: <20260126165445.3033335-1-eric.auger@redhat.com>
In-Reply-To: <20260126165445.3033335-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Feb 2026 14:15:12 +0000
X-Gm-Features: AZwV_QheT6OL8l9EqJqvPRq05IKRmFRrtKtPJvQNyvDU5DtihmTC8AfEwxbTKkc
Message-ID: <CAFEAcA-gi42JObOjLuPudABX8WRdWf5SzSbkzU-bd06ecF1Vog@mail.gmail.com>
Subject: Re: [PATCH v6 00/11] Mitigation of "failed to load
 cpu:cpreg_vmstate_array_len" migration failures
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 cohuck@redhat.com, maz@kernel.org, oliver.upton@linux.dev, sebott@redhat.com, 
 gshan@redhat.com, ddutile@redhat.com, peterx@redhat.com, philmd@linaro.org, 
 pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Mon, 26 Jan 2026 at 16:54, Eric Auger <eric.auger@redhat.com> wrote:
>
> When migrating ARM guests accross same machines with different host
> kernels we are likely to encounter failures such as:
>
> "failed to load cpu:cpreg_vmstate_array_len"
>
> This is due to the fact KVM exposes a different number of registers
> to qemu on source and destination. When trying to migrate a bigger
> register set to a smaller one, qemu cannot save the CPU state.
>
> For example, recently we faced such kind of situations with:
> - unconditionnal exposure of KVM_REG_ARM_VENDOR_HYP_BMAP_2 FW pseudo
>   register from v6.16 onwards. Causes backward migration failure.
> - removal of unconditionnal exposure of TCR2_EL1, PIRE0_EL1, PIR_EL1
>   from v6.13 onwards. Causes forward migration failure.

Hi; sorry I haven't given this series any attention before.

(1) Yes, this is definitely a problem we need to solve.

(2) What are the requirements we have for this?

This series sets up CPU properties controlling this, and then
sets them in the virt machine model based on the machine
type, but this seems awkward for two reasons:

 * using properties confines us to using a "text string"
   way of describing the behaviour; if we could implement
   the handling in code and C data structures in target/arm
   we could potentially do it in a more flexible and
   readable way (e.g. being able to specify the register
   via something other than a raw hex value)
 * different host kernel versions isn't really related to
   the QEMU version, so tying it to a versioned machine
   type doesn't seem to fit

Q: Do we need the user to be able to control this (e.g. adding
extra registers to be ignored) on their command line, or
can we say "you need a newer QEMU that understands how to
deal with this register if you want to do migrations involving
this newer kernel version" ?

Q: This series adds a "hide this register" option which
stops the register appearing in the outbound migration data.
Do we need that, or would it be enough to have "ignore this
register in the inbound migration data" ? Assuming we're
not trying to migrate backwards to an older QEMU version
that's unaware of the new register, that seems to me like
it should be equivalent.

(3) Categories of sysreg that are causing problems:

a: "controls" -- like the PSCI_VERSION pseudoreg. Here the setting
controls what the kernel is exposing to the guest, and so we need
to be able to have the user tell QEMU to use a specific version
that's not the host kernel default if the default isn't one
that's valid for all older kernels. Sometimes the new kernel
default is the same as the old kernel's behaviour and in those
cases we also want handling of "if you see the control reg in
the incoming data and its value is the default then it's OK to
ignore it".

b: "things exposed that should not have been" -- where the old kernel
exposed a register but the new one does not because exposing the
register was wrong (i.e. a bug). The handling here can be
"ignore this in migration input if present". Examples are the
TCG2_EL1, PIRE0_EL1, PIR_EL1 regs that shouldn't exist if the
corresponding feature was disabled for the guest.

c: "things not exposed that should have been" -- where a new kernel
exposes a new register that the old one does not, and so migration
from a host with the new kernel to the old one fails. In most cases
it should be possible to handle this with "ignore in migration input
if present", or "fail migration if incoming value is not some safe
default, but if it is that default value then ignore".

Have I missed anything ?

(4) Mechanisms for handling them:

This series provides two mechanisms:

"safe missing reg" -- these registers are ignored if they appear
in the incoming migration data.

"hidden" -- the behaviour here is that we effectively entirely
ignore the register, so we do not read it from the kernel or write
it back, do not send it in outbound migration data, and do
not expect to see it in incoming migration data.

The "arm: add kvm-psci-version vcpu property" series handles one
specific "control" register, with a specific user-facing cpu property.
If new "control" type registers are rare, this seems like a good
way to go, because it means we can give the user an interface that
is reasonably clear about what it does, and we can provide better
errors on the migration-destination side (e.g. pointing the user
at the need to specify the property on the source side to get a
VM they can migrate to this destination).

The only use of "hidden" so far is for KVM_REG_ARM_VENDOR_HYP_BMAP_2.
However, I'm not sure this is the right way to handle this register.
Judging from the documentation, this seems to be a "control" register:
it would let QEMU enable certain things to be visible to the guest.
It also is odd to treat this differently from the existing
KVM_REG_ARM_VENDOR_HYP_BMAP register, which has exactly the same
semantics.

I think that the right way to treat this register would be
"if this is present in the incoming migration system and the
host kernel doesn't know about it, a value of zero is OK, but
any other value should fail migration".

In general I'm not convinced that "hidden" is a useful thing
to provide -- it should always be fine for QEMU to read and
write back to the same host kernel some sysreg it doesn't
know about, so what "hidden" is mostly doing is "don't put
this into outgoing migration data". Do we need to be able
to do that, or can we instead always use a "ignore in
incoming migration data" strategy?

(5) My preferences

I think that assuming that it meets the requirements, I would
prefer something like a mechanism where we use some kind of
C data structure / code in target/arm/machine.c to represent
"this register needs some special handling", where the special
handling might be:
 - ignore if present in input
 - if present in input, value must be X, otherwise fail
   migration
 - maybe some other things if we need them

and this is not tied to specific QEMU machine versions and
isn't something we expose via QOM properties.

I'd rather avoid the "hidden" register idea unless we
definitely need it in addition to "ignore in incoming data".

thanks
-- PMM

