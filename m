Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1193478lfm;
        Tue, 7 Jul 2020 11:36:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVSfpp6Ra6HfQ0JNPViz3upHFgobQVoEMyv28J0w2qhNga/f+Wyb6muU9wr++QcxBw3/1/
X-Received: by 2002:a05:6902:102e:: with SMTP id x14mr35369234ybt.461.1594147009290;
        Tue, 07 Jul 2020 11:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594147009; cv=none;
        d=google.com; s=arc-20160816;
        b=N6EkqtdKgz9pUIaLVjZ8Xf9X6uRDV1hCDDmO2e2Nduh8AjWLrGW52XhKXXwNRdFjui
         lICJkkfd2pzGYStYTeSrGuqpZyrwNEuG88oYik4O4X2Hk7kxAsJHo5W7prDiEY4gfhEa
         Ei2MKozkWlE9YfaRo/Kyjr1w1hnYHcHu6shDZGg5ss47ksOk8NVvbNROJ9K39jgiGAcJ
         NbjSYvZWtm/JTuzJnmFj7mzWXALjSf2fiLc6JY/srhlCWNKd7S5VG1QrLiAcwfxAXZWe
         ig+PVRaInwjJM67CsxN5IznLZ5sBZIyQL0zvko1K+zgcaDFcHCfD44HRryWtsM7d4TFm
         w/ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=jJvgg7ncCWsUv+I9lfgfZl/1muoCm3TDajkxbIRy6+c=;
        b=Hjh4ICBXdPd3G8lkJF6ZWVUf1b2tgdKgSFNwXiPQd/N862z9N4CKup11UHpuIUZQkD
         +jF2DeRo6Id/WrnY65FTyP4eEwidd5vP9G1+NtfAFAp5Yf+e7WuSXZdIklUTzmeO2wZV
         nIjWbriEjyHayEI2A+FnayeqDfUCec7krq+06w7PX2vxZqBmtqz2dqpz0d+NjEQSV3It
         VxeJjl6cOjPT9MHPvyDIFOOjTcxBUCE+8YHWd7K+B1HktRT8zy1A4Xn2pp2xnyZ6xjml
         WlBLRzcxKlyv5D9KLQ1DLD2aGkRbJRbsg01EecRjxL0VPxTUcZ9mSaaJwwtLs+ggURNS
         6RHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iYQuktV2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i201si24328747ybg.223.2020.07.07.11.36.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jul 2020 11:36:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iYQuktV2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jssSW-0004ij-MC
	for alex.bennee@linaro.org; Tue, 07 Jul 2020 14:36:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jssNQ-0004Pd-7r
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 14:31:32 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:41813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jssNO-0004ww-Ao
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 14:31:31 -0400
Received: by mail-ot1-x344.google.com with SMTP id a21so11765146otq.8
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2020 11:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jJvgg7ncCWsUv+I9lfgfZl/1muoCm3TDajkxbIRy6+c=;
 b=iYQuktV2Dn8rvgzdL+a7H1S6anDGryJJhzxtwHjXSeGFpTF3f+VneYtY1PM3c5oIVW
 +IJ3nReT9ryZE0mwwVjxjp1KPC1GT7qum3h5wFmCjMqLtdv4BlsKewOdz3U0bl5lTKZ+
 iq9fpwZ0rh6nST40/pBw5II12W0dI0DL/HKNlv7a5n71gHXXCuQZHneWyO05wVIRpsdI
 ZE0asodsGlBnjzT278Lc9n/FQtDHenwGG0s6kP3nSMqV7zebKF0bmGiSpw4wFWxNdkm1
 9MGkBJ+sNU8CcK50w4gdQ5j1WtYrGHQumjAFBQiZuntrM/ssbvmE2lSGOZBniCr0UAm1
 d/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jJvgg7ncCWsUv+I9lfgfZl/1muoCm3TDajkxbIRy6+c=;
 b=WvFEPdvVdgax/05vsGN243ybe9tL7l/2yvGsK1jGEpxlSetF/YHMuXFi3NDvy+S2Iy
 YrlR7egOsDiE5K9aVMqB5q9DAc6pvXJPSXlX8pM4e+ljIgQ/NpWM19P9aWVm0mz5riLZ
 wzFKFfbdqQ8WuxUkzHCzplys+Uy9mnMeIm9Ns6vzs/MaRrh/CdmHyAEA1O1Kv3KIk1Q/
 HyT24HzaVZdaDKXo+fKLeaRnAz/xCP1Pzp3ZAElkup2una/Z99Yt0kCoGkp0wTn6MEbK
 9X3WtwBFoIFr9+Dx7xQ2zPHbxLnPwnyn4JUBkXp4T1VL1EF/TQ3p4KzjxDLSqjB9Jd5h
 u+tw==
X-Gm-Message-State: AOAM530nzYMBi23t99XqCt+jgTIBn9hMfsrCgYhYtZ26TCFAowF1WgKl
 M6a4WE626R3mZSEa2FCk/Nd6SS6vtO5QT0hRqfdSLQ==
X-Received: by 2002:a9d:7303:: with SMTP id e3mr39514512otk.221.1594146688887; 
 Tue, 07 Jul 2020 11:31:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200705204630.4133-1-f4bug@amsat.org>
 <20200705204630.4133-5-f4bug@amsat.org>
In-Reply-To: <20200705204630.4133-5-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jul 2020 19:31:17 +0100
Message-ID: <CAFEAcA-rhTk2cMayPVaULsbpYfLuQSFgr7D7w43bggP-LBqX6A@mail.gmail.com>
Subject: Re: [PATCH v4 04/10] hw/arm/versatilepb: Comment to remember some
 IRQs lines are left unwired
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 08EBqvDWjXGx

On Sun, 5 Jul 2020 at 21:46, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> The 'card is readonly' and 'card inserted' IRQs are not wired.
> Add a comment in case someone know where to wire them.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/versatilepb.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
> index e596b8170f..45a13ae2b9 100644
> --- a/hw/arm/versatilepb.c
> +++ b/hw/arm/versatilepb.c
> @@ -310,7 +310,9 @@ static void versatile_init(MachineState *machine, int=
 board_id)
>      qdev_connect_gpio_out(sysctl, 0, qdev_get_gpio_in(dev, 0));
>
>      sysbus_create_varargs("pl181", 0x10005000, sic[22], sic[1], NULL);
> +    /* FIXME wire 'card is readonly' and 'card inserted' IRQs? */
>      sysbus_create_varargs("pl181", 0x1000b000, sic[23], sic[2], NULL);
> +    /* FIXME wire 'card is readonly' and 'card inserted' IRQs? */

These should be wired up to the SYS_MCI register in the
"system and configuration registers" block:
https://developer.arm.com/documentation/dui0225/d/programmer-s-reference/st=
atus-and-system-control-registers/mci-register--sys-mci

Our "realview_sysctl" device implements this (we use it on the
realviewpb). However it only has support for having one MMC
device -- we'd need to extend it to have the GPIO inputs for
the 2nd MMC controller, and make the arm_sysctl_gpio_set()
function handle them to set the right bits. Then we could
wire it up at the board level fairly easily (more simply
than for realview, which also has to wire the same lines up
to a GPIO controller).

If you believe the documentation (which includes a little
circuit diagram in both the versatilepb and realviewpb manuals)
then the versatilepb doesn't have the inverter on the CARDIN
line that the realview does.

thanks
-- PMM
