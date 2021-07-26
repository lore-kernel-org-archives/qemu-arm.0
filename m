Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp2849742lfc;
        Mon, 26 Jul 2021 06:04:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx69ENSkhNbUihtnr6vkYrPR1mSIhBNjpkUNopH+r/IqrWxJ2+OH/sHIE7Kti0ZIZTLXLJO
X-Received: by 2002:a19:6556:: with SMTP id c22mr12873290lfj.456.1627304640985;
        Mon, 26 Jul 2021 06:04:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627304640; cv=none;
        d=google.com; s=arc-20160816;
        b=bsUPplfN9ARG4h7DgwkcfTALq76S9grXZsj1MvDru0Z7ErTS4Zgckgf/q+4tPr9V0a
         Q0jsiZcgzSJt21Hj8fmGVCEXvYOwLEutoSVyj/xilTmWFEl49MXgGqASk7Ov9/FCwQqa
         apWrkIqJf6qgLQulmoMIPrf/VdjUGulYZV+ejblYDC9B4Uy5KaKE54R7SvZFQ9+mpMWx
         cirf2KyOmvKHqsjU3JXhVlvWFeIt9rKE+/+z/Np36ryz800CdNPnO6jz53I5Q+6Fmjrb
         Nrn1AmodN1VKoTD+eZ9xaD1GSVlXmqPVemmhbHRowD5Bj8eib5zC5F+4geyaGnXAbSWb
         vSDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o9YtlpMs57gkF874ra4K+P45JBe0PW3DkFA2j/etbWw=;
        b=QZkowr7SJ93HHCGbWMVMV8q+9nJnd+W5nWsIAkTZ8HpKaqx3pdwKk7y0igGYAVQWK/
         zuoQodXtgZs6NQBhNsPJNqU1z76KKdgUJViEEEUdKz+LsTKdwS7QYV+iXDK8RO7osmOM
         d53qFl7CdIiahSMY9P5WONIutBsL4lIRUrJnsvAF1gLraOMCNE/rG6JYYMKRHNFYQpdk
         +fXDJ3FnPKKhzLtLHK9nf4LmH6VMqd5XYK1jR4IHfmbcMBaYeuk9uhl1K2dybtq4iQ4P
         1wnmGzhImnrafy6HPL7eFxfSBvdAg9HXxr+5ESdLMe2wuxc93z5ZlEVh5ewg0xjslHPZ
         YFCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mAQVaOPw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z25si34238554lfh.127.2021.07.26.06.04.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Jul 2021 06:04:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mAQVaOPw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m80H1-00051z-Oa
	for alex.bennee@linaro.org; Mon, 26 Jul 2021 09:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m80Gl-00050H-LI
 for qemu-arm@nongnu.org; Mon, 26 Jul 2021 09:03:43 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:40839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m80Gh-0000m7-AI
 for qemu-arm@nongnu.org; Mon, 26 Jul 2021 09:03:40 -0400
Received: by mail-ed1-x52d.google.com with SMTP id r16so10442335edt.7
 for <qemu-arm@nongnu.org>; Mon, 26 Jul 2021 06:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o9YtlpMs57gkF874ra4K+P45JBe0PW3DkFA2j/etbWw=;
 b=mAQVaOPwGXEWm/EDSx46gn+L/yUR5b0L/GYAM9ZzeUYtU52/PZ8pz+NBWR1EF/wXNs
 FfICTnEw4J+A3DQm/77PhMSCaSB/O+GZ/RjXnFyN6oJpHEV+iFdABHnQE1AdMXF6Usx5
 9sSc86Wsb2QTnHlM08aLnXp8DcbDA+TDifft3c+iXaK4QaRi/xxAcmHc7DilRtlrY0Op
 4nx7YQxtuL9X8LNljP9kio+iMBXq11jEgzmY/Ni4jfgVyl2OcOwkMG1Hp4BcnBspBLRm
 3lCXit6/rUQCiwlGVoF/o69OayJ5YJ3PGF1f3Y0muU1pJMI55suxaIWs/o3wf3ZZzckn
 KMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o9YtlpMs57gkF874ra4K+P45JBe0PW3DkFA2j/etbWw=;
 b=P2XLMyTKQY2qiiC8WB9kt7dn4O8iCiUshvxQKkX9KRmlSBIgaqHrUMIzPom6B6ZlZB
 UFDJj6haYO6MvhYVR+P80x3BGOe93fBJJdKkWE3vZ7r14Hsbob47Irlet0iqa4OWimrV
 GMzLNxqPxtOu/E7GPrhSvoOAu7DGxcffACnUvfFI2FXZDIxsu7gh+XRZ9mgS8Ed5b9te
 qsYYumlnl2LmlkLDsknxat4Qety5eOA8tAMHIZpYoZEv5AOOiO0iso1zhbEc9qJ5GYt1
 zHtmMGzICcuYcYcAqvUWbVbV9lrWYC2klUwglEm10B4MZLHtQJhn/7A55FQIyD3kwlzJ
 ETRQ==
X-Gm-Message-State: AOAM530Qt4bbiP1IfAc+dJPq57U2ZWwRAtUNynLcahEChb7MGJ0FBPcp
 eE3XpXMHGA4qDdP8quc1p7+rpxMS4pVenf+FTZDuOw==
X-Received: by 2002:aa7:c857:: with SMTP id g23mr20962239edt.100.1627304617709; 
 Mon, 26 Jul 2021 06:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210709094948.60344-1-sebastian.huber@embedded-brains.de>
 <20210725080817.ivlkutnow7sojoyd@sekoia-pc.home.lmichel.fr>
 <57459310-fe80-0cc2-5ffb-5b42bfe1a351@embedded-brains.de>
In-Reply-To: <57459310-fe80-0cc2-5ffb-5b42bfe1a351@embedded-brains.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Jul 2021 14:02:55 +0100
Message-ID: <CAFEAcA8DAt+o-XZepg8xtj4i3xLW_yChwPnDZVM0O=rW8+9qJQ@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gic: Fix set/clear pending of PPI/SPI
To: Sebastian Huber <sebastian.huber@embedded-brains.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Luc Michel <luc@lmichel.fr>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gavX5S8E0aDv

On Mon, 26 Jul 2021 at 09:06, Sebastian Huber
<sebastian.huber@embedded-brains.de> wrote:
> Ok, I will remove this part from the patch in v2. I probably didn't
> fully understand how the Qemu GICv2 emulation works. What I wanted to
> address is this behaviour (see GICv2 manual) when someone changes the
> GICD_ITARGETSR<n> (n > 1):
>
> "Has an effect on any pending interrupts. This means:
>
> * adding a CPU interface to the target list of a pending interrupt makes
> that interrupt pending on that CPU interface
>
>
> * removing a CPU interface from the target list of a pending interrupt
> removes the pending state of that interrupt on that CPU interface.
>
> Note
>
> There is a small but finite time required for any change to take effect."

We do get this wrong, but none of your changes to the file actually
change this behaviour :-)

What we currently do for writes to GICD_ITARGETS<r> is:

        /* Interrupt CPU Target. RAZ/WI on uniprocessor GICs, with the
         * annoying exception of the 11MPCore's GIC.
         */
        if (s->num_cpu != 1 || s->revision == REV_11MPCORE) {
            irq = (offset - 0x800);
            if (irq >= s->num_irq) {
                goto bad_reg;
            }
            if (irq < 29 && s->revision == REV_11MPCORE) {
                value = 0;
            } else if (irq < GIC_INTERNAL) {
                value = ALL_CPU_MASK;
            }
            s->irq_target[irq] = value & ALL_CPU_MASK;
        }

which is to say that we update irq_target[] but we don't change the
status of any pending interrupt. We should add code here that
checks whether irq is pending on any core and if so marks it as
instead pending on the targets we just set up, something like

 if (irq >= GIC_INTERNAL && s->irq_state[irq].pending) {
     /*
      * Changing the target of an interrupt that is currently pending
      * updates the set of CPUs it is pending on
      */
     GIC_DIST_SET_PENDING(irq, value);
 }

thanks
-- PMM
