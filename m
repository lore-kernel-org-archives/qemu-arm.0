Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5234128lfq;
        Tue, 22 Sep 2020 13:30:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwEBHxivZcGrOgQv5CIgmAMAlFp033Gz1ZOAkW5NqzLHZX5bxNr5ZLi8vppmheK5BaLzRK
X-Received: by 2002:a25:d3c4:: with SMTP id e187mr8383101ybf.300.1600806626479;
        Tue, 22 Sep 2020 13:30:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600806626; cv=none;
        d=google.com; s=arc-20160816;
        b=NMOik/ee3QGvfdffXOKytQwdP8ci1MMzevPA7S4jVl9iOhTPozZmcQsnqFISIPQK4F
         clXhWlqksLcUdNji0VtciQ6Mf0K9lRv5ATy2rCt3EF9sVhL2hhS/Tu27MEJdz/RwHtMi
         u3A3URBRlmpKG1KB32fP8V+8Ow++Kf+gR/QAhQne8XhhPfp0naPgnnRolJuGTl3s+c3W
         PV5Y4XYuAKfNlSbVX3iZVNjKXqUI1QbU7uS95YMy5odr79cp+MpxGUuqQBXaMUQOU/Kw
         1C7sCneCCrPYie+3C5sf93at3p4ZTusLwUpENGurdjOJ5jFeVSVnDIl5t6cDGCYR+jVX
         sEHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rg5Bs6WUHjOvN3W0VROPe9Jc7dQbDfoqe6jRVRMSpKM=;
        b=O1kYEYU1GcoXc6uFGjWtNRDKnXQ2WQ4yRh2M1/ZNaTuYGAeyPJxINADzHH8SUbusg9
         9XEqdQ1jU8yXNd9R2sLged5v4XEp7yPSgdic+kfeSUXPbWaKjTSO5jL1fhn7zvxdpjRG
         0cFsTMXksn7DJmsl8rMfUShwgqoppgaA8XBSnE/g7s4Q4GjNjszqQl1Y6T7zTMLRZ023
         fF3nMAKT3oxJN0ZTzm/lbTZuJlMXmUryQUKKEF/q+19fQQiEto6ztxxEefVoAfVcFX52
         lVEs6EMtjPK24ZR9fMPi3IhIPdwALk8+z5u7oil48IhcJDZgZ/hCObmDBAKkjUlyveL0
         gIPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YsDIjk99;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a17si11173753ybp.198.2020.09.22.13.30.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Sep 2020 13:30:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YsDIjk99;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kKovh-0000Et-TS
	for alex.bennee@linaro.org; Tue, 22 Sep 2020 16:30:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kKovG-0000EI-W3
 for qemu-arm@nongnu.org; Tue, 22 Sep 2020 16:30:00 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:33132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kKovC-0000wf-BW
 for qemu-arm@nongnu.org; Tue, 22 Sep 2020 16:29:58 -0400
Received: by mail-ej1-x633.google.com with SMTP id j11so24797569ejk.0
 for <qemu-arm@nongnu.org>; Tue, 22 Sep 2020 13:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rg5Bs6WUHjOvN3W0VROPe9Jc7dQbDfoqe6jRVRMSpKM=;
 b=YsDIjk99jM9AF1hNgM9yzOOLB3/MqOc1tITc6EbobBf/MXtuu4fxLpUSGTK5oSKmQf
 JeRDBA3OW4OHQPrpIVFvE6RBFFFpZZkb/VjOUkdPK4jrQMMHyxgjVhdsjA6a+kaFV0Yi
 RuAX/b3NYe54gaFVHnBSO5DDdWahI2NYuMnTpLyyoEW93xs4ofpVT3KeBfIJdARoNIXd
 lplVMFnDUG9v/U1Hoih6jR+cOq+ydEc49jpMviMh6Tp9ZYx2ZKDk7GZTYewwqyERNxzt
 YEdnVgt3WVmc+A8ALAkfSnmCToIHmoTY6rkSc34hMxzfrQA51pkU9fgyPcpk4KpqSbyd
 0WRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rg5Bs6WUHjOvN3W0VROPe9Jc7dQbDfoqe6jRVRMSpKM=;
 b=Ba48Ie9dFSl8x/S7o5ilx92LTHeSdwcMPdFJ3fJHljNSMwWx48sax4q0ARFVv6nLKa
 dDmerRruxTDtKo3WvwPQ6zNcoo30N0i9aNfKWD2H9OoVOKlZhQSX1q/fslY01kZTxvuK
 uYk6nmU1rhZFRBlFGqhV+76B1nK0ddvM4AwVmTMPiDIs0u+rimrXdUyLGtcjDwdgNFYT
 Hy1DnNFg8yI/FRNWMGRUYYeV6ZHZxR0CtFEV/YDeiJcQjI2u4nPFST5DlEGnCGF1dOlb
 mCtU+gz6+Jjz05CphJgmhGsd4fQLLnS/BgFIztT/V5THScr41ZoQsUQ5Ubyxczz1OFF3
 j2Sg==
X-Gm-Message-State: AOAM531FZQsBV2fEh84yMZCeFFxat+VWZaxpANvo+Jj2ecPo0L4z/rLd
 rNagEi++7E0zdpvVVPgatb11WnGfpqu+ce9I0zEAUA==
X-Received: by 2002:a17:906:d936:: with SMTP id
 rn22mr7055932ejb.4.1600806592190; 
 Tue, 22 Sep 2020 13:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAC41xo2yEoDvy15yExroY+ZX+qQns_rxQiqP9D2Xo3dqquP7KA@mail.gmail.com>
In-Reply-To: <CAC41xo2yEoDvy15yExroY+ZX+qQns_rxQiqP9D2Xo3dqquP7KA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Sep 2020 21:29:41 +0100
Message-ID: <CAFEAcA-gMfOntN=up20vjF00Mbf0MOeWyTWufmcZ9E=AKKYWEw@mail.gmail.com>
Subject: Re: gicv3 maintenance interrupt not triggering
To: Jose Martins <josemartins90@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u4TdA2aVdsLu

On Tue, 22 Sep 2020 at 20:02, Jose Martins <josemartins90@gmail.com> wrote:
> I'm using qemu aarch64 virt platform to run my hypervisor. However,
> the gicv3 maintenance interrupts (id 25) does not trigger. I'm reading
> these values off the gic for the cpu in question:
>
> gich.hcr = 0xd
> gich.misr = 0xd
> gich.eisr = 0xf
> gicr.ispendr0 = 0x0
>
> I think that for this gich state, I should be reading a pending state
> for the maintenance interrupt in the redistributor pending registers.
> I will try out the same code in real hardware asap to confirm there's
> no issue with the driver. But does somebody have any clues on what
> might be the problem?

You might like to (a) enable some or all the QEMU gicv3 trace events to
see if they provide any insight into what the emulated GIC is doing when
your guest prods it, and/or (b) run QEMU under a debugger and look at what
it is doing in gicv3_cpuif_virt_update() (and in particular when it
calls maintenance_interrupt_state()) to see what it thinks it
is setting the maintenance interrupt line to.

Given the MISR and HCR values you quote I would also check that
you've set up the maintenance interrupt itself correctly, ie that
it isn't disabled or similar such that the GIC asserts it but
nothing happens.

(You don't say what QEMU version you're using or what command line
you use to start QEMU -- those are both always useful information
for "I'm trying to do something with QEMU and it's not working"
queries...)

thanks
-- PMM
