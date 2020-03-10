Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1143152lfc;
        Tue, 10 Mar 2020 12:55:46 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvgA6cRLXh4wTtR5cO1APQ77kqnXDZpPRtndsNZT/ukyaghrBafKzBRvpwXZC7DOhXrvyWT
X-Received: by 2002:ae9:df42:: with SMTP id t63mr658439qkf.369.1583870146765;
        Tue, 10 Mar 2020 12:55:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583870146; cv=none;
        d=google.com; s=arc-20160816;
        b=JsA3p+HFOS6r0kdncCPcyXhE8+ca6uzUoDWvCZBVfkR9YqYv+4wxX274sQ+9hoXNGv
         U2rNkuAt/gIb9xbIGFyrTJ0718s/aoLAw7VjGXWCGrUHl4MSw91AjZ9jHUSvMox19K5v
         +ONSnVPOTUAQnN+Ypz7gNEoCYsMTdqGOC5aervUXsW9trmnD5NeHJSt+YKNcjK3ChmMv
         TRjNjm2NKIlUDHU759LhU+W6MbIPzFnsvxxHD/fNAKSBu6jYpoR29kFPbRgUXZHKpM7I
         xK1KK6mMrBTTSnynQ8tC3lu25uK3/lmvRt6sswUQUh9FMqWJbxV3utIfZw6fgaZDY9gY
         zGjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1pyw82QS4ZZRYkQoubeSy5bpQaJIvgsbJXLiwnBer6U=;
        b=ipmawAxy5DHPSQJj9Qcub1OJkEj0G1RItju7/DtCXV8DtouuO131r7nnKg+zDka+vJ
         IwGE2iaPWB7hGU8e1w0q9oWfO3P+wIyB02i7KaAGkxYgtljW1QeHN+QNhYRT52QuijEo
         /+WJRzFrgquAaMqKVhESvGm53OFuIwHNSqkGLXECcqMceyPUCg6VrwxroDgM/iBOiNh1
         QrPEJndLszJr4wvamNx2/6ofKXDQf66fjfvoqRCT2mmV+R2h5NLNocX7YqBnOtRHTVRg
         NDsE0ytroON4uQvwV2l5fAptPb2bkzj1cl2NI/fYjkzM89/x7S+JhQafca8Pyd06frTU
         LV2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fc+HIJYd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b6si4031233qtt.369.2020.03.10.12.55.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Mar 2020 12:55:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fc+HIJYd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBkyf-0006AJ-Fa
	for alex.bennee@linaro.org; Tue, 10 Mar 2020 15:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38913)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jBkyX-00069w-DX
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 15:55:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jBkyV-0002fQ-RG
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 15:55:37 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:35646)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jBkyV-0002c4-Kh
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 15:55:35 -0400
Received: by mail-ot1-x344.google.com with SMTP id k26so7182983otr.2
 for <qemu-arm@nongnu.org>; Tue, 10 Mar 2020 12:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1pyw82QS4ZZRYkQoubeSy5bpQaJIvgsbJXLiwnBer6U=;
 b=fc+HIJYdVkCYOTrYvlOo7T843VljKHeIv0loZkpsnl+wGh30u7v/tleEOUVD6/1GEb
 qSfroeWsmJvjmFvBpXdAElyFdpjs+KxKY9wGRhDylxot2286wHRt2glb4hOkKmhaC94I
 7ANpY7sRDtkdy1rRxeTTdoYa+WzT/l+FGJoob4p6/9M98+258mVsVbBx3OuqV3I8VC6x
 H/CgqileeLEt532plA9/hmqy9JScCFWZYYdTZrJTnHqTDHNjmmELHyb2ze420V6A3nUM
 yy2tlQOh5DoAREGjkBbRk+3Zc0gzLMe469Noz1/RJrh3dHyMYNytmKSKuUUPYR6fSEAc
 bVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1pyw82QS4ZZRYkQoubeSy5bpQaJIvgsbJXLiwnBer6U=;
 b=OSJKSGUb3sXS1xz8vfPsFDRkzUV0vPeLOp60cS8E6d0NrsxKtjqAb/VC4lijjQYLNp
 6f1gTY7GL58lP4j2H11qwI6u17B/X6dWFjov4gbMXzuwMMUY5dn/tSdv0ZEK5HXzAj4I
 sW7gb3Syova241glLk7NqVGrBl8XX9An4gVL/DJMjG+3OE9VEpF1VywumEiKLlvur1SW
 DRFiZZcr2QPWEar4TYONDEXOt3l/aFlm9NyQ7BUiAC96/7/FVLq9C+jbMfvHe+m4XbET
 cBowW0sggOXNxgt7FfY/6F4xSmjreFQ31YGP3Dpe+NiMy4jlYpczHPqLpwRHIj8YFPTQ
 3wpg==
X-Gm-Message-State: ANhLgQ0HmoE870cDgBNEeAG0rHksKa9Sv1Fq++xcomejeRSI5GqvpGYQ
 fOB3hftHxHF1MqUOJhLsGEzzFkzVnid8MYew0aonhg==
X-Received: by 2002:a9d:1920:: with SMTP id j32mr9462411ota.221.1583870134403; 
 Tue, 10 Mar 2020 12:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200302105516.5972-1-eric.auger@redhat.com>
 <20200302105516.5972-6-eric.auger@redhat.com>
 <CAFEAcA-XD9LiokquaHj+kCYWA3N=7k3V3R8r5gA1HZM9Adus1A@mail.gmail.com>
 <1370e0bc-ae17-c891-72b5-4cbc58ff3247@redhat.com>
In-Reply-To: <1370e0bc-ae17-c891-72b5-4cbc58ff3247@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Mar 2020 19:55:22 +0000
Message-ID: <CAFEAcA9W9=5s4Bfr9otP1p984AUxYxckgzZkhgOxzFOwSPfj3Q@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] hw/arm/virt: kvm: Check the chosen gic version is
 supported by the host
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: Marc Zyngier <maz@kernel.org>, Andrew Jones <drjones@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DwYUX0QkWfeT

On Tue, 10 Mar 2020 at 18:02, Auger Eric <eric.auger@redhat.com> wrote:
>
> Hi Peter,
>
> On 3/9/20 2:28 PM, Peter Maydell wrote:
> > On Mon, 2 Mar 2020 at 10:55, Eric Auger <eric.auger@redhat.com> wrote:
> >>
> >> Restructure the finalize_gic_version with switch cases and, in
> >> KVM mode, explictly check whether the chosen version is supported
> >> by the host.
> >>
> >> if the end-user explicitly sets v2/v3 and this is not supported by
> >> the host, then the user gets an explicit error message.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >> Reviewed-by: Andrew Jones <drjones@redhat.com>
> >>
> >> ---
> >>
> >> v2 -> v3:
> >> - explictly list V2 and V3 in the switch/case
> >> - fix indent
> >> ---
> >>  hw/arm/virt.c | 77 +++++++++++++++++++++++++++++++++++----------------
> >>  1 file changed, 53 insertions(+), 24 deletions(-)
> >>
> >> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >> index eb8c57c85e..aeb6c45e51 100644
> >> --- a/hw/arm/virt.c
> >> +++ b/hw/arm/virt.c
> >> @@ -1542,33 +1542,62 @@ static void virt_set_memmap(VirtMachineState *vms)
> >>   */
> >>  static void finalize_gic_version(VirtMachineState *vms)
> >>  {
> >> -    if (vms->gic_version == VIRT_GIC_VERSION_HOST ||
> >> -        vms->gic_version == VIRT_GIC_VERSION_MAX) {
> >> -        if (!kvm_enabled()) {
> >> -            if (vms->gic_version == VIRT_GIC_VERSION_HOST) {
> >> -                error_report("gic-version=host requires KVM");
> >> -                exit(1);
> >> -            } else {
> >> -                /* "max": currently means 3 for TCG */
> >> -                vms->gic_version = VIRT_GIC_VERSION_3;
> >> -            }
> >> -        } else {
> >> -            int probe_bitmap = kvm_arm_vgic_probe();
> >> +    if (kvm_enabled()) {
> >> +        int probe_bitmap = kvm_arm_vgic_probe();
> >
> > Previously we would only do kvm_arm_vgic_probe() if the
> > user asked for 'host' or 'max'. Now we do it always,
> > which means that if the user is on a really old kernel
> > where the CREATE_DEVICE ioctl doesn't exist then we
> > will now fail if the user specifically asked for gicv2,
> > where previously we (probably) would have succeeded.
> > I don't think we should put too much weight on continuing
> > to theoretically support ancient kernels which we're not
> > actually testing against, but it does seem a bit odd to
> > probe even if we don't need to know the answer.
> >
> > More relevant to actual plausible use cases, if
> > kvm_irqchip_in_kernel() == false, we shouldn't be
> > probing the kernel to ask what kind of GIC to use.
> I think the existing code also does the same:
> kvm_arm_vgic_probe() gets called as soon as vms->gic_version <= 0 &&
> kvm_enabled() whatever the state of kvm_irqchip_in_kernel().

Yes, but your change here makes it call kvm_arm_vgic_probe()
even if the gic_version was explicitly set to 2 or 3
by the user, doesn't it ? That's what I was commenting on.

> So in case the host only supports GICv2, in kvm mode with userspace
> irqchip we would use GICV2 in host/max mode. If host supports GICv3 we
> would select GICv3 which is not supported in !kvm_irqchip_in_kernel().

> So do I understand correctly that you want me to change that behavior
> and always set v2 in KVM/!kvm_irqchip_in_kernel() max/host mode?

I think:
(1) we should retain the current behaviour that if the user
asked for userspace-irqchip and specifically chose gic
version 2, then we don't probe the kernel for its capabilities,
we just create a userspace gicv2.

(2) we should also retain the current behaviour that we
default to "2" if the user requests userspace-irqchip but
doesn't specify the gic-version.

(3) the ideal-world behaviour would be that we correctly
handle the user asking for userspace-irqchip plus either "max"
(choose '2') or "3" (produce a useful error message if we
don't do so already). I'm not sure what "host" should mean
here. But this point (3) is separate from what this series is
doing, I think, and is basically fixing the bug that we didn't
think about the userspace-irqchip case when we implemented
"host" and "max" or when we added GICv3 support.

thanks
-- PMM
