Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1302540njc;
        Mon, 30 Sep 2024 08:17:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW8MrRaHS1sP0anHXn+sAFNwsTX3WQlOBjDS2USgshBHw++HBcFKtpWaMF7zNG949U2NHyIlCLn+wOG/A==@linaro.org
X-Google-Smtp-Source: AGHT+IEs7d1DJPx02ZrwAgR0FG8YRRzZiCfCiw6qYagXTRHG91nYGUIG5oeQF7UfUp2IEsfDRqOf
X-Received: by 2002:a05:620a:444c:b0:7a9:bf2a:d7c8 with SMTP id af79cd13be357-7ae378b4f50mr1907705485a.41.1727709438590;
        Mon, 30 Sep 2024 08:17:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727709438; cv=none;
        d=google.com; s=arc-20240605;
        b=YG3IybFetcyw58k+/tzst7ImRiWBo0iTz/O5GrnCln6SGur7yVX+LVKZcnRJ4QuP9C
         URO7tATfbbWeL+CKEknXG2kFfkpQ40AgtgJxXLANiK8J83BA99oz3+7Lgei4lNpCRgkj
         ft7q9vGDF67egJFNAzZXNba4yd3A/of9TXAPweM6qFs61OvPdanJqMrsEihMIBGgfYQI
         avjpw1n2WSV2+vGR1iMt1NFPI5cYn2TF5QXQ2FAetnfoCJZVZaD/sysg3CPQ/O7g8cL+
         gV98e8d+4N3CE4uwmoWu8O6CrRXeOsTNXl2lEMqplVyM585LeybgGf4V87OAnujoiMXs
         bjkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=u8jF7f97obPQbQPRwah5xs/l/E1L4LlJnkZkiyAlH64=;
        fh=GM9acArPY2fDtHdkCjukbca0GBTkFAE2X2sLKidq27Q=;
        b=MFP1fUe9rEQbi492Buzr7kTOjbercNSo8Id41XeCNaZC6HoAFB0G9tpZ/LctgpK0Tl
         bE1klySGb7/mVa1Z0FxO4SRN6ATwNlGuZmDJ+coXhrSu27H/DjXRxllVlLTCfmV13S8N
         h/q0AdiJqrN+XEtbea9n6SVqeZxK37gzzZdN/vo2s2pnZAdpgqfwHlN3uLD4kd7oICoE
         8qb97J5CvmcQg+KS/UVG3YExAbaVWu33sEg0EYrJIItf9Kr3f5mIGxzHM0ZJV7j286/3
         YbI8KlOnggOcirN4i9UJ7LPBT02V4UzElTDLVVIqEYrqDYH0qJsMQkcmE9Z1zbspmzWX
         F/8Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NYUp0l60;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae378a31f1si868270185a.775.2024.09.30.08.17.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 08:17:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NYUp0l60;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1svI9A-000614-Rt; Mon, 30 Sep 2024 11:17:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1svI99-0005zO-Ld
 for qemu-arm@nongnu.org; Mon, 30 Sep 2024 11:17:11 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1svI96-000593-F7
 for qemu-arm@nongnu.org; Mon, 30 Sep 2024 11:17:10 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c8967dd2c7so1562454a12.1
 for <qemu-arm@nongnu.org>; Mon, 30 Sep 2024 08:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727709426; x=1728314226; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=u8jF7f97obPQbQPRwah5xs/l/E1L4LlJnkZkiyAlH64=;
 b=NYUp0l60I1B20jsg9yNZZXJ9vlq6C4zPjyxm/kCXzwjexxfSRmlt2bbhtaVhCSCwEk
 iT8AFaP5tZLvGEDShAWlTLRdo7D0GAriaVxZyA0yfPDqSiwaIIMrxlPgBE5LXOAw0UMA
 K5TDlBn9keWvJB595xkhJSLEQ+JJ7dVJjKrAOfi211cLbIpZL305tz2fpOTnyschZSB3
 nOg5t+cJKo3jg2sZilbWpJgwXb3vkA1BTgklN1bInHYgTRnL70Od+/zP4SQJfWQ/f4XZ
 Ruee+tXXtOIzC9rrHC1k7v7dpNdohv1W5HFv6HJXQiogRI5u3a9p3vLchZtWZGk+/PsK
 TAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727709426; x=1728314226;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u8jF7f97obPQbQPRwah5xs/l/E1L4LlJnkZkiyAlH64=;
 b=A70Dv4PnWGtCD0QOf4/1pma27PIYanErCsHqr0wt40n1iOVmYN00/724SVaCZttWcI
 ma9xuwxEVLYrBu0PwqzSE/MSsUD9hpNOyUjSpP/Ui+x0Srtu4t8v6csaXGljPvc4zIIb
 yPNMMjwnAtLtMXYsn5BqnyTWRBDI0Nwk7ZnUGY/xKOV+VBphxASMrp4WxKvUqtfGpIpe
 G9ceLC1awT0BXndx/GdcoZ2P5K3MtfR15txHSrOyFWHWEVgDiaXIgWpMHR4JGnjR8YN3
 feiUbmv7fAHK9/HK3yoZDlgxlT4bITy3FDpdBw8Rr7AwmS3A46RGHLO0Prgmu2Qhs2Qv
 J9zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVixLSXztugnTRWtT1tUBunrtRW7tpwgb40+2UYi3qJWIDR2vPAXEYqSKq+A2lD2ZG2CXl/YWyP1Q==@nongnu.org
X-Gm-Message-State: AOJu0YxgEFpBi863MGtaQcPv7DTRE7GROOSIWcj7V7I4CS5sL8VTuQWU
 AYmW8J/EfoZsMC4370VtfYZrbIfRNfn2+KUVNcI/Xt5lxAof6GlUtU54VQzEvd3EkSgAhe6K8EJ
 X/HTfb+3TBItpwloEXQitTwEQYIsPwV/e9N8jWw==
X-Received: by 2002:a05:6402:d07:b0:5c2:4dcc:b90a with SMTP id
 4fb4d7f45d1cf-5c88260791cmr11853419a12.34.1727709426303; Mon, 30 Sep 2024
 08:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240923035632.81304-1-sebastian.huber@embedded-brains.de>
 <20240923035632.81304-2-sebastian.huber@embedded-brains.de>
In-Reply-To: <20240923035632.81304-2-sebastian.huber@embedded-brains.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Sep 2024 16:16:54 +0100
Message-ID: <CAFEAcA8Wf-PzAC-YGdma3YVETyuatLJHmvjrrb_kG2NjDSGs+Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/arm/boot: Use hooks if PSCI is disabled
To: Sebastian Huber <sebastian.huber@embedded-brains.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: v/cds/l5sPLh

On Mon, 23 Sept 2024 at 04:57, Sebastian Huber
<sebastian.huber@embedded-brains.de> wrote:
>
> In arm_load_kernel(), use the secondary boot hooks provided by the
> platform if PSCI is disabled also while booting a non-Linux kernel.
> While booting Linux with PSCI disabled, provide default hooks if needed.
>
> In do_cpu_reset(), use the secondary CPU reset hook provided by the
> platform for resetting a non-Linux kernel.
>
> This change allows a more accurate simulation of the platform reset
> behaviour.

So, the difficulty with this is that it's effectively
introducing an extra way of booting. At the moment we
have two boot approaches for Arm guests:

(1) Booting Linux -- the boot.c code simulates what the BIOS,
boot rom etc, does, both to set up the 1st CPU for the kernel
boot entry, and to set up the secondaries in whatever way
the bootrom does that the kernel expects to release them from.

(2) Booting bare-metal -- boot.c assumes the guest code is going
to do whatever the BIOS/bootrom does, so you get what you get
for real-hardware CPU reset. (Either the secondaries start
in power-off state and the primary will release them via some
kind of power controller device, or else all the CPUs start at
once at the reset vector and the bootrom is going to sort the
secondaries out and put them in a pen.)

What you want is a third thing:

(3) Booting not-a-kernel but not 100% bare-metal: emulate what
the bootrom does for primary and secondary CPUs but don't
boot the guest binary as if it was a Linux kernel.

The problem with adding that is that we don't have any
way to distinguish whether the user wanted that or our
existing type (2), because both are "user gave us a binary
that isn't a Linux kernel". (It also has a bit of a
"continuously expanding job" problem because the bootrom
could do arbitrarily complicated things, like boot directly
from SD cards, which we have historically not wanted to
emulate within QEMU itself.)

There are other platforms where the real hardware's bootrom
has a particular "this is what a bare-metal-under-the-bootrom
startup looks like" definition, notably the raspberry pi
boards. There too we don't currently implement that, and
instead effectively tell users "pick one of the two boot
paradigms we do support"...

thanks
-- PMM
