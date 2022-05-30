Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp2672476lfh;
        Mon, 30 May 2022 03:52:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhnqTlkh7pAKcRBDapsAc6mD+3rf3koyozic9mh68Ov8I0Paq5T79LSWtQxDsxYdSiEXDb
X-Received: by 2002:ac8:7d8e:0:b0:2f9:3bd1:9d6c with SMTP id c14-20020ac87d8e000000b002f93bd19d6cmr28780305qtd.186.1653907921688;
        Mon, 30 May 2022 03:52:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653907921; cv=none;
        d=google.com; s=arc-20160816;
        b=bHSFtr4HbjwFoQIxIK4gBOZEQ4JW2pneG9eEdvIHTVfwXwVystCT+e1m6dlu/ilDDx
         erSSlv43o+pIoTi1RLU/N6uPJZZGuoi7GBSL3LL89Wv5Ns6DdOfQ7AhtiQDW26KmbrRv
         8Q9Bp1CoE7+x8InuDLgHTHOwXYllCIm5mSmhX8lmO94ECtEqqn3LTi+EoyE22QRG2S70
         4hAopa7KSwa8/OssOZVheaba4aMvt78VxJQLXarw/sSBjuyCjzjTSKT32hngurV+PCMM
         aL+qTyQff0TjRCtxcPOz99nQg0Jq0I/hC/XMehdH7uxGV1gNdK2Eyfic2IUpHJcVkWKt
         1egw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=BKi7MoN6g9BHshIQqrROx/c0ywlgUKQnU4ELmW9zbuQ=;
        b=mDthD7UXMH/z00bz5GznFPerPwScDb4g1W2rpDc00lJeanBJbDHA/dYQYDitwmPG6i
         0uy/2E6vKKhG4gDw2IZn5zQK1gVXvWG51cxolaX59TFxOlRqYzAOBXCpKRPK7WFHFohy
         8fQLipg+Vw/5X7GZeFbCvc+IuBDljvUNn1j8ElvCu+cPKqU7ifE+IEFEuzAqSkFKyDqU
         k925CtH7L4MiRQtrlIRkBj5V8PejIK86VdPc94LSbALgmkYT2ku70VG74/o+mwc92xNb
         ST8xqEczLnmSESsLiOlvu2nYMlQgUBEkCAQI8eUOtv6J50+776s3I9JKpvTlbad9N2Nh
         +sFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aIwknW4K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h1-20020a0562140da100b0046453482f14si1012435qvh.269.2022.05.30.03.52.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 May 2022 03:52:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aIwknW4K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nvd0D-0002aZ-4Y
	for alex.bennee@linaro.org; Mon, 30 May 2022 06:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvcyJ-0002Z4-9A
 for qemu-arm@nongnu.org; Mon, 30 May 2022 06:50:03 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:38800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvcyH-0000Go-5P
 for qemu-arm@nongnu.org; Mon, 30 May 2022 06:50:02 -0400
Received: by mail-yb1-xb29.google.com with SMTP id x137so18382118ybg.5
 for <qemu-arm@nongnu.org>; Mon, 30 May 2022 03:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BKi7MoN6g9BHshIQqrROx/c0ywlgUKQnU4ELmW9zbuQ=;
 b=aIwknW4KcEshDOwN8l1SmzstH36iYlscqsec8hRdY1QrkvC6PX9QiZnABH2E5jqS/2
 JHCrHWlTpzM62d4Kt0uFrBXBGqxV6cDTKuY5V6DalXNpxn5HGTnNQ+1uP4BPZ+7i2zJ6
 he1kHZ5sTgpT6aBcBp1/cUuaK/L4rCOgWeywJ4f/X6tunzzB2VU60utrcCcIp80YZUqB
 utRqbFsB8OrcCmBy48foOC1QV/grY3CvfSCb1itbZ8xyLUNKVveNdgoaZl/lhZ8AaVOs
 +/NXLbQktr1OZEga8cEhgEsYA+V7d7W0o+ZkX/dIHCo/d7czIO97ZwPcR/YrkNMQqhwI
 DjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BKi7MoN6g9BHshIQqrROx/c0ywlgUKQnU4ELmW9zbuQ=;
 b=Ban5XpME1gKjZhYA7kNcxJffbQL+cFEH2JOd9AzjfvcamyrJ+u7ONXwh9QKrHQUXis
 xri8rAXFFbJkb1rViO4oRGvZ5SK3OQJZ8z+8Mgvi/149pQDJBIf+/7LwUaYSWnfxcaS2
 91jdqgPhq3W1xMUocsvMlQIo4am26b8ua6gAo+25fxOnkzanVuigfbTbZtdNbWXJ85RL
 Iw8on5B99YWEBwVOUI3PuZYCvWYNrDCQV1KSkTajz1R5sotsHnlA+T9suh90ckfpP6yj
 MB3Cp3kFq4UjyuCwK9O+soMBYD0n1HSZXUc4YusaZCpGVmnZYIEkJfmEt5q943yc/Kv4
 m/Dw==
X-Gm-Message-State: AOAM5311EH7+pk70amXt17yyHZaZs/gk3FB96a/GScqoPuGSIk19K3JB
 TrqBCIF2YBGHc9QqUKyYQ4UR8bCSjwmMjb2Ur2hwdQ==
X-Received: by 2002:a5b:14c:0:b0:64f:c826:a76b with SMTP id
 c12-20020a5b014c000000b0064fc826a76bmr37097326ybp.479.1653907799993; Mon, 30
 May 2022 03:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20220530093333eucas1p2c05b46a5f9c66704919743236753858f@eucas1p2.samsung.com>
 <e3573c25-1ba6-cb57-f813-99c538a2d254@samsung.com>
In-Reply-To: <e3573c25-1ba6-cb57-f813-99c538a2d254@samsung.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 May 2022 11:49:49 +0100
Message-ID: <CAFEAcA8EqCh0LDS=N+5W8fPnF2Fj-Z7r=wssDAD-V5tBWRM85w@mail.gmail.com>
Subject: Re: Help: NVIC, level-triggered interrupts and interrupt pending
To: =?UTF-8?Q?Igor_Kotrasi=C5=84ski?= <i.kotrasinsk@samsung.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qfl3EIoL2x0O

On Mon, 30 May 2022 at 10:33, Igor Kotrasi=C5=84ski <i.kotrasinsk@samsung.c=
om> wrote:
>
> Hi,
>
> I've been hacking on QEMU recently, adding support for a custom Cortex-M
> board. One of the devices that I'm emulating is using level-triggered
> interrupts, for which I assume qemu_irq_raise/lower is the right tool.
> However, I'm having trouble receiving interrupts for my device which I
> *think* are caused by interaction with setting/clearing
> interrupt-pending status.
>
> The way I'm handling my interrupt currently is as follows:
>
> 1. The device raises an interrupt with qemu_irq_raise.
> 2. In interrupt handler, I set the clear-enable nvic register and queue
> a handler.
> 3. In handler, I read data from the device and set a register that
> lowers its interrupt with qemu_irq_lower.
> 4. Then I set the clear-pending nvic register.
> 5. Finally I set the set-enable nvic register.

You don't say in this sequence where "return from the interrupt
exception handler" happens, which is an important part of the
sequence. (That is, I'm not sure whether your design has only
step 2 in the CPU exception handler with the "queued" handler
being run after exception-return, or whether all of 2-5 are
in the CPU exception handler for the interrupt.)

It is also weird that you are clearing the pending state by
manually writing to the NVIC register -- generally the expected
design is that the NVIC itself will mark the interrupt as no
longer pending when it takes the interrupt (ie at step 2).
Also, it's implementation-defined whether the NVIC even lets
you control the pending state via the software registers, so
a design like this isn't guaranteed to work on all hardware.

> The problem happens when the device re-raises the interrupt between
> steps 3 and 4. I would expect the interrupt to stay pending after
> clearing its pending status, and random ARM docs I found on the net seem
> to confirm that:
>
>      A pending interrupt remains pending until one of the following:
>      ...
>      * Software writes to the corresponding interrupt clear-pending
> register bit. For a level-sensitive interrupt, if the interrupt signal
> is still asserted, the state of the interrupt does not change.
>
>
> https://developer.arm.com/documentation/dui0497/a/cortex-m0-peripherals/n=
ested-vectored-interrupt-controller/level-sensitive-and-pulse-interrupts

This is a explanatory document; its explanations might be helpful,
or might not. If you're in doubt about the precise detail of how
the CPU and the NVIC work you should be looking at the Armv8M
Architecture Reference Manual (or Armv7M, possibly, depending on
what CPU you're using).

> On QEMU however, pending status is cleared and I lose the interrupt. I
> tried to hack in the behaviour described in the docs quoted above, like s=
o:
>
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 773e311754..4914b1217f 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -2393,6 +2393,12 @@ static MemTxResult nvic_sysreg_write(void
> *opaque, hwaddr addr,
>           for (i =3D 0, end =3D size * 8; i < end && startvec + i <
> s->num_irq; i++) {
>               if (value & (1 << i) &&
>                   (attrs.secure || s->itns[startvec + i])) {
> +                /* If the interrupt signal is still asserted, the state
> of the
> +                 * interrupt does not change.
> +                 */
> +                if (!setval && s->vectors[i + NVIC_FIRST_IRQ].level) {
> +                    continue;
> +                }
>                   s->vectors[startvec + i].pending =3D setval;
>               }
>           }
>
> This fixed the issue I was having. However, I'm not sure if it's the
> right solution. One, this affects all devices connected to nvic, so this
> might randomly break them. Two, there's a confusing comment in
> armv7m_nvic.c, in set_irq_level, that seems to imply that all external
> interrupts are edge-triggered:
>
>      /* The pending status of an external interrupt is
>       * latched on rising edge and exception handler return.
>       *
>       * Pulsing the IRQ will always run the handler
>       * once, and the handler will re-run until the
>       * level is low when the handler completes.
>       */

The NVIC doesn't make a distinction between "edge triggered" and
"level triggered" interrupt types. Instead it provides behaviour
which generally speaking is compatible with both kinds of device:
an interrupt becomes pending if either:
 * the input IRQ line is high and the interrupt is not Active
 * the input IRQ line transitions from low to high and the
   interrupt is Active

(this is rule R_CVJS in the v8M Arm ARM, and the implications
for both level and pulse sensitive interrupts are explained in
I_WTFS). The code associated with that comment is doing the second
of those -- if the level transitions low-to-high we call
armv7m_nvic_set_pending(), which will mark the interrupt pending.
Checking the pending status on exception handler return is part
of the first bullet point -- it's a transition from interrupt
Active to not-Active, so if the IRQ line is high at that point
then we should make the interrupt Pending again.

> I'd be very thankful for any help with this. I *think* I found a bug,
> but I'm not 100% sure.

I suspect you're right that there's a bug lurking here -- I'll think
a bit more about it and dig into the details of what the architecture
specifies -- but I suspect also that your software design is doing
something a bit odd that is why it's running into this corner case
in the first place.

thanks
-- PMM
