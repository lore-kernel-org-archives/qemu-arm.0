Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp838344lfa;
        Wed, 28 Oct 2020 13:32:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3mxMXDkfAcNcF9BZ4h+R3vertXBMvP99+9DKPiVdNu016SzRA21KZI99IXWbtl2O1jxFx
X-Received: by 2002:a92:5b42:: with SMTP id p63mr711389ilb.139.1603917151074;
        Wed, 28 Oct 2020 13:32:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603917151; cv=none;
        d=google.com; s=arc-20160816;
        b=clFdYImRWTMVLwgY7uNWbSOv/dMl9gSgofG+eb5URvQpEqvtObfVpJQ1Lo3FNW/XBW
         3u+SoDxZIyRqhpA7g+bw34ayeBAiHbGCMjKY+qEt0tq9Z+sGzIIxMd7MYi01YF3Wp0rg
         N2AYIJWN+niZPlLrBSFs9LWpzFzYBglBhmDvtknum3HtFUR8Eg2LW6LE1v1EtdBYTz6H
         dCgdKkwvH2HFmLKVP8D0o4JpVl2yjqp4gjIu1ihCe6dCRAGjIcz6YNpuxGcB61lKDfL8
         qfSoY1+3siky5IzWdvlsYhGQTVA+9k6zMRxtLsbFXwCJNvecSuXxUZFtNTPg4g0XEK+Q
         Xa5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A60WitzBwUcQrRVGfN8Ljoa+Za+envdNm8g+RcTq0wc=;
        b=d79pN1tbGjW8ovd4q06boFmFSwsoEkDmJPK4eJqklzF6YQJRa0JV7hk95dqapw8/5Y
         0FVlhOtfJ8gWRNLVO8L6tRfrqts12ZnpKQ5P5WN0FxCkEVRXu+q82Q1xbWgfjJoqnqpT
         ahZBaGKHBbwNdN2+vRHwrOD+KzGa0G3xtzCYAwCeaSt0WCJWIWMQ0gBa35M7Tpxe9kEY
         8gSj/MqvYY287sWJlCm5EYFkEqK3cMaTCnoguC61DTHPWj5s2Mb6Uu1OzbQYWPYO0SI4
         onqR1R0OA6+EEsZs9UoQxVpJSvuRNAqdWvbafwhu//ccG7jYdrKpsW/HS9NH/HYdLSAU
         9pLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rk18SVW1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g3si793489jat.2.2020.10.28.13.32.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 13:32:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rk18SVW1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kXs7S-000071-DB
	for alex.bennee@linaro.org; Wed, 28 Oct 2020 16:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXs6v-00005Y-PI
 for qemu-arm@nongnu.org; Wed, 28 Oct 2020 16:31:57 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:42665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXs6s-00019B-Jr
 for qemu-arm@nongnu.org; Wed, 28 Oct 2020 16:31:57 -0400
Received: by mail-ed1-x544.google.com with SMTP id v19so837631edx.9
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2020 13:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A60WitzBwUcQrRVGfN8Ljoa+Za+envdNm8g+RcTq0wc=;
 b=rk18SVW1Dyv/PrlgmyN0i32GHExFumZ8sA099ubn7lYjDWtdamg0pJZ374nCSSP5ed
 JZU4bRQdHG+vim7lH7r1uYcxdsyTCBmwCgnszdZq1R3+76JHt8x0wYmoGenkyK1/ttdv
 V2lgjq/Eb0ddw384MrRumbzH97Ue1APrsLpNjboJXgefRrX5OnSjWCXlYU314F5c5s3T
 oWkzQKVE8A26Hr2wnemM6NiTyuYQVVqbxBWslZCU8gpxfWOB4NtBPxe3neU4ujDs7z7h
 tYuuB/mc1RYM5PoF/5hZSH/q2TUCJ5fGWJDPysFsIDjMUo7x5LPMAsyvJELYnmuZ7Xr/
 oIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A60WitzBwUcQrRVGfN8Ljoa+Za+envdNm8g+RcTq0wc=;
 b=tfKQJCovaZGJkK0QqaAcWwpY4apNiRiWCzFHEt4B5hr36KqX98XdX26Pwlewyqfqbx
 LHBvK2CTXAdHBQiexbtgqC8v8URFg8X6rFOB4cm2aMHrkVA2InHnmreVL82tGqSpiSn4
 3U1KTO22PJ2EwZl9s1lknWIRYwWyMX2tKmJcWQODXYiP7rOmmRQp0EB5ac94x4YrTMJP
 amvgCCAQ3l0NzP8rOZcWXO1thD7u9DIdls+MqZkN8SEz9FvLugs/wKyteRVLZuK4F5uG
 6qTWwuRkluIZCZFdIBB85hxLd2D1Dq2Y2hfzuIJbArlDqLG2EmmMAQRZ9ltVVzAwZYgb
 c4MA==
X-Gm-Message-State: AOAM530adiingO5mkbo2QPlEqVNwUeCg5UBUkYVRxaGm/wSeanFe3h0J
 xt8ZzSf+yRIeSyoNDXHW/5B3Xx9Pwd786l33+eyOVA==
X-Received: by 2002:a50:f41a:: with SMTP id r26mr666265edm.251.1603917112827; 
 Wed, 28 Oct 2020 13:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <20201028085918.14580-1-maxim.uvarov@linaro.org>
In-Reply-To: <20201028085918.14580-1-maxim.uvarov@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Oct 2020 20:31:41 +0000
Message-ID: <CAFEAcA8_1w=4qdE_AJxUP-uPoFL=Fsg9hy62Lw7bLDjKzL9Vvg@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/arm/virt: use sbsa-ec for reboot and poweroff in
 secure mode
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
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
Cc: Graeme Gregory <graeme@nuviainc.com>,
 =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hXl/Fp3W+SGU

On Wed, 28 Oct 2020 at 08:59, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> If we're emulating EL3 then the EL3 guest firmware is responsible for
> providing the PSCI ABI, including reboot, core power down, etc.
> sbsa-ref machine has an embedded controller to do reboot, poweroff. Machine
> virt,secure=on can reuse this code to do reboot inside ATF.
>
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>

(I've cc'd the sbsa-ref machine maintainers.)

> ---
>  Hello,
>
>  This patch implements reboot for the secure machine inside ATF firmware. I.e. current qemu
>  patch should be used with [1] ATF patch. It looks like that Embedded Controller qemu
>  driver (sbsa-ec) can be common and widely used for other emulated machines. While if
>  there are plans to extend sbsa-ec then we might find some other solution.
>
>  So for the long term it looks like machine virt was used as an initial playground for secure
>  firmware.  While the original intent was a runner for kvm guests. Relation between kvm guest
>  and firmware  is not very clear now. If everyone agree it might be good solution to move secure
>  firmware things from virt machine to bsa-ref and make this machine reference for secure boot,
>  firmware updates  etc.
>
>  [1] https://github.com/muvarov/arm-trusted-firmware/commit/6d3339a0081f6f2b45d99bd7e1b67bcbce8f4e0e


Thanks for this patch. It is definitely a missing
bit of functionality that we intend to allow virt to run
EL3 guest code but don't provide a trigger-shutdown/reboot
device that works in that setup.

I think the key question here is whether we want to implement
this by:
(1) providing the sbsa-ec device in the virt board
(2) some other mechanism, eg a secure-only pl061 GPIO
some of whose output pins can trigger shutdown or reboot

The sbsa-ec device has the advantage of doing the
shutdown/reboot functionality at the moment. The question
I have for the sbsa-ref board folks is: what are your future
plans for that device? If the idea is that it's going to end
up stuffed full of sbsa-ref specific functionality that we
wouldn't want to try to expose in the virt board, then we
should probably go with the pl061 approach instead. But if
it's not likely to grow new functionality then it might be
simpler...

A couple of notes on this patch if we do go down that route:
 * we would need to arrange to only add the new device for
   new versions of the virt board (that is, the "virt-5.0"
   machine must not have this device because it must look
   like the version of "virt" that shipped with QEMU 5.0)
 * the device needs to be mapped into the Secure address
   space only, because Secure firmware wants control over
   it and doesn't want to allow NS code to reboot the system
   without asking the firmware
 * it would need to be described in the DTB (and maybe also
   ACPI tables? I forget whether we need to describe Secure-only
  devices there)

But let's find out if that's the route we want to take first.

thanks
-- PMM
