Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp2711510lfh;
        Mon, 30 May 2022 05:02:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSMUsaxkB6fnQwC+5JIGQQ5ubu1h8aEAz4sy4uZ0vBTOQTuXa9FGS582lkJ9wl6AfvC+LD
X-Received: by 2002:a5d:6481:0:b0:20f:ed13:f28d with SMTP id o1-20020a5d6481000000b0020fed13f28dmr26420828wri.719.1653912149415;
        Mon, 30 May 2022 05:02:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653912149; cv=none;
        d=google.com; s=arc-20160816;
        b=QPFPuDDwnatiEuZgYiqL4QOpluLZid5YI+ykffrdUDX2T/qTwfwzLkG+cbvP1vF0Pj
         F7+muTzgkMJ2vazgYZtIbKUc9F+q2DNf1ngeEp6XvR3gE7X7rhXlHmBRXaDKbT5ON7gG
         ylwxJgE03C30EfbJ0kKFJcqQTqaWdJ4c1kzz0h7XXOe1AxVMCW0rAy4ki0+V7CTu6BBA
         heZCj8lThKUvSMSxhf8SyYh1/8ZXrSBix9KS8u8jrdkN1FKzHcb/JTUMRI1ArMW2fYh7
         MlxGrhIJrPFN199j9kLp6lqD0d+i343cwU5iOT61xTKe2JaF/lahVFe1f1aAhUOY51JR
         9dQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=roKSxwnlIVzmffPZmK9iY8XrjTiRAI0dVxsQIRmRF5M=;
        b=IeYmlkMy/vJ1Bm8QjzQ6UxKnTFkYzTHHVCX1U1SIeo3Gvg00L57pkJUXTHQdMDC0CY
         /8UdMaQ7UoiQ/8Twzk6s+JBhpMBw5Sd5Ec4O/w32RPaU9gVKlCPIkgZ6+BePk+H+Pmo/
         Ps8M7o+KTDe64jxwyRQOIwLVWDTLVsaPHAHnBNwYkxgA6kmwaGtMo29G2ezEl9tirRgk
         DLtRUg0yEFddoQwDQbTEXO2Fp3j6dOhiIJHYYObzQuroaZiSxGXOCz5UlSxh1uuDYPei
         vAsncW8j5xvxE9NqYvY56akl/T1A/yDLIhTjR6yOY6VwKOAta79OXwJewubT/vWveFLT
         5qNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="P8+/x/UL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d11-20020a056000186b00b0021003df18dasi12421036wri.101.2022.05.30.05.02.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 May 2022 05:02:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="P8+/x/UL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nve6O-0003JN-KD
	for alex.bennee@linaro.org; Mon, 30 May 2022 08:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvdys-00020a-3r
 for qemu-arm@nongnu.org; Mon, 30 May 2022 07:54:42 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:35823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvdyp-00066g-Bo
 for qemu-arm@nongnu.org; Mon, 30 May 2022 07:54:41 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id t31so5730438ybi.2
 for <qemu-arm@nongnu.org>; Mon, 30 May 2022 04:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=roKSxwnlIVzmffPZmK9iY8XrjTiRAI0dVxsQIRmRF5M=;
 b=P8+/x/ULvXe1FlDohbyiRbrKTK4D7F6QEw3Y3nBPYLPiXOaJ7c1uzSFVas86u2VnqJ
 /Xmq6WOzoId8w6mp7DplMmhdmKv+/jVEutjYgDzCfVf5IOTNKMIp6zLvSMD54hkEa8Rh
 ybCLdjWDElnGlg93e4hV/C2np7XdCJnFijyY33z4ZNf1bkHx7aaBpcSzmddRJ1de5Q2i
 P4dN0NsYuve1nUBM84dygWT1Q2zmfIZPhE5jbd/c3HqMsj+bP9Fpz2bn9L9a5a0osVPm
 7oEiJDzLJNNna8p7h6F9jeq3mSdCSOG6hO4KIar32bwfaqtRvBBH9r+2DlgXO/KezgYY
 /pig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=roKSxwnlIVzmffPZmK9iY8XrjTiRAI0dVxsQIRmRF5M=;
 b=Xb5v/ygRh8TeSKitP6fzDCLMKHd3vmRYpxPJgLUZ8wJAQz6/2i+ITzhVzsbCO5eqXN
 2mv3BjiusfsQ472Wk0F8HmlXigQ28W/s7FarM/oNxDuJg5sMphsfNGeRfnZjMBJT8Q0v
 7JSUYBRlS0zEA2Z+RqjtzDXE24aelTB0IRiSkCvPzZDT7/17EulPzwmCoXFDwuZGx3yK
 LrTjtELE6iqNBh//yJs030ChwLs69PgMsnzCHFisn1w0qkui4kEGO/i/4epiu9v2HPMZ
 TTD8aoXO9AwMtHNmo7HJwRSAk2XQXdsZqmPKotIMCFONDz7iHpwRtxchOrgCmXgyyrDk
 2pHA==
X-Gm-Message-State: AOAM530nUZGbog9GeFoOQeCKQb7CzSrlVRP3sA7XkIaAQjBKjOSGGcjL
 bcv7z0ErRqOmfCyhgM/hakJHH/geg6KvG6Y1GtBVzw==
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr53095965ybq.67.1653911678078; Mon, 30
 May 2022 04:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20220530093333eucas1p2c05b46a5f9c66704919743236753858f@eucas1p2.samsung.com>
 <e3573c25-1ba6-cb57-f813-99c538a2d254@samsung.com>
 <CAFEAcA8EqCh0LDS=N+5W8fPnF2Fj-Z7r=wssDAD-V5tBWRM85w@mail.gmail.com>
 <5a05e699-d050-adae-ca14-c68b5534f214@samsung.com>
In-Reply-To: <5a05e699-d050-adae-ca14-c68b5534f214@samsung.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 May 2022 12:54:27 +0100
Message-ID: <CAFEAcA90R49A6txYhP_vFHoa=XPV+g6XxoZdVXmHcS2EPW__Ew@mail.gmail.com>
Subject: Re: Help: NVIC, level-triggered interrupts and interrupt pending
To: =?UTF-8?Q?Igor_Kotrasi=C5=84ski?= <i.kotrasinsk@samsung.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
X-TUID: 14+rsXLwCM/N

On Mon, 30 May 2022 at 12:34, Igor Kotrasi=C5=84ski <i.kotrasinsk@samsung.c=
om> wrote:
>
> On 30.05.2022 12:49, Peter Maydell wrote:
> > On Mon, 30 May 2022 at 10:33, Igor Kotrasi=C5=84ski <i.kotrasinsk@samsu=
ng.com> wrote:
> >>
> >> Hi,
> >>
> >> I've been hacking on QEMU recently, adding support for a custom Cortex=
-M
> >> board. One of the devices that I'm emulating is using level-triggered
> >> interrupts, for which I assume qemu_irq_raise/lower is the right tool.
> >> However, I'm having trouble receiving interrupts for my device which I
> >> *think* are caused by interaction with setting/clearing
> >> interrupt-pending status.
> >>
> >> The way I'm handling my interrupt currently is as follows:
> >>
> >> 1. The device raises an interrupt with qemu_irq_raise.
> >> 2. In interrupt handler, I set the clear-enable nvic register and queu=
e
> >> a handler.
> >> 3. In handler, I read data from the device and set a register that
> >> lowers its interrupt with qemu_irq_lower.
> >> 4. Then I set the clear-pending nvic register.
> >> 5. Finally I set the set-enable nvic register.
> >
> > You don't say in this sequence where "return from the interrupt
> > exception handler" happens, which is an important part of the
> > sequence. (That is, I'm not sure whether your design has only
> > step 2 in the CPU exception handler with the "queued" handler
> > being run after exception-return, or whether all of 2-5 are
> > in the CPU exception handler for the interrupt.)
> >
>
> Sorry, I lied a bit here. I'm running someone else's code and I misread
> it a bit. The exact sequence here is:
>
> 1. The device raises the interrupt.
> 2. Interrupt handler sets the set-pending register, then the
> clear-enable register, then returns.
> 3. A handler running outside exception context reads data from the
> device and lowers the irq.
> 3.5. The device raises the irq again.
> 4. The handler sets the clear-pending register, then the set-enable
> register.

Does this code work on real hardware?

Do you have a test case image you could provide?

thanks
-- PMM
