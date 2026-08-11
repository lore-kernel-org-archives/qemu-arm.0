Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E41CC5CFC1
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 10:56:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtk84-00088J-CL; Tue, 11 Aug 2026 06:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wtk83-000881-Rb
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 06:54:43 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wtk82-00007k-60
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 06:54:43 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-8143daf89c7so30424897b3.1
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 03:54:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786445680; cv=none;
 d=google.com; s=arc-20260327;
 b=KQioJs1K+aSGeLNbLtCDYVczW5XVQQITgQKyo6Ox4lwsmk0GZGL3Jx0rQQeXNKPZcu
 ikopDVY+yhgcUtkipCabQChFnLdkzuMB5kpIejT6z9dZGUNuzQ7/iwg+MAmWjDfUvxF0
 60AU6tby9/VCxE8/AgaETbZEobhgyFXGsF5lbOXetAOQV40INyKoQuTQ+9mhlnp2pIyj
 4fo5XO8ajXfkh7MyK3iQdSBaH/P0DXBIF/bFJsJd2veW2znmrIvjSQOEYsBAmJDrU61c
 q9qRQLP5kcbiKf5IP0xo1/1GyfQ6uo7idDz/awrj4y2RjfsIY7rmjmvvZhu4SJNrrsTY
 xBGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=EptJn//rGb7jHcwj96jCJeU0R+HpApyeTrP752eDwEY=;
 fh=j+wSAKyCfCiNd/LNaJ4tQNEoas8zwl/kicvX/BpC3jA=;
 b=HiPkffWSx8iEsT29QbEccDMcyGBqCos4Pu65iLqIdZJVVTsX5pFQbcKCgRCr7A+Ypk
 W6b+f+9VNgBYV87W26pAAq5kQWHtCfrlcCzyY2KftFWjtFkdp2MAlroRZTH3+hZKLikB
 KFk3gFpNNKMjEHRnsz9xGC4Fzy64R16gh7ub+via3CQeA60kK/rK9nVut0AK+I9YObzK
 QEGlGbNJZFlfEVTP5KKZayGqCv8IuyadzUrihFGNOuvgh3UpUoHZDUXQG802yLkX0RB4
 /wZob6wsGyLbtjs0XCzVqf6dXELLmb36LEdaGQ+iorf657FhI34ako0N9dTn7XWrlJRs
 bdXA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786445680; x=1787050480; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=EptJn//rGb7jHcwj96jCJeU0R+HpApyeTrP752eDwEY=;
 b=BxZgtv/lHqmfZ0/ZvlMKJvtpHp7JPkFTIYgov4Jeq7Z8nCN5nJn9XUnAZt9e6RFWGu
 tlt/ndLFrmjiExkvWnYPCc4VRer4VIe1DTuuz5MwvUTruWndWC35SrhSNRTZiwy/f/Qm
 6u4na/3dtGCe7dy1A7XKZ+0IUH8cftdQxliK7Amxyh+xUAB+9lucY5yJkXLBAuskTtQ8
 X+gkr1C/SfC7jJFcL/JWT9T4oehzl1ZpupNbxKqpDRmybX9dxiyf4TrJpbKWeHWgklrp
 HXBOwLLDXczyxw8OXxjfVY8iOvljZaPsbpS8rsdC0Coo+lBj+oS2Z/1zPSlPN7l6zjDU
 7Hsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786445680; x=1787050480;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=EptJn//rGb7jHcwj96jCJeU0R+HpApyeTrP752eDwEY=;
 b=LddEgEzZ5F1ZcmwdHrxCfAvR42e/0+yi1/hjtl0SGv7fbJ3EiqxuHAQLF6I2ip51cb
 11h6kmq1MI60W3tznRRbrjSHpZf8ULLbptHgy1rBoPmBy+cBhLU8X63mNg90B24L4y7j
 4hO1B6Ir04lnMvQ3wLrLDYUvlczHWoIu5OetcI5TcNU6ojLxk34Z8IF//PpDH2J+Tff0
 vJ2c5qlelIi9OXw7z9IpnVsM+H5b+npbSI6WPGoPovzmllbV3p2kdtgm6RcwQAScI7IO
 D1aYvLM+4JGA2LohienJcjMBo31OlKvgorLs00WruoVtfxH/ycAMsKMgP/GF6vg0Wh34
 dsDQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoCRXGbwQvfRl49WT/YsKM6LkRqabaBIYi8scJx5L4A7lrnUxnYY/9iZ2KdUbAV8N8xNgGKXzO14w==@nongnu.org
X-Gm-Message-State: AOJu0YxUtDETzydLaFT0RzkGcbVsPof3E124paJAMfK1DypUsEBzqODn
 FGGuLRc43Gb6eRy0+rGIPo1jMBoUHUdGopCR0t4LIP3snFMrT2jSwk5g6AHLMGBAzvMox4hItsz
 tghGKQx3X8NH1LTxLhiG0qe7uEit1VcXOi2Uyz+gS+A==
X-Gm-Gg: AR+sD137aAxlvyF5r5mYeqyifbq0vKmAkmBG9F/cr3q1uYSQ0bNjWLcjqwNat5xf5Qr
 I5QpRsFJnGpGGwa9JYnBExa4DUrBQbgDeU6FdUZmK6YlGSIF4BNWtUq2GTJNEK9cBWBIUXExxL5
 tGTDEh2eRSTN4CsPLykWj2ISe7t25tiHQnOsFqqwoxzPMtpICJBI7Kp9wjmqDTbKvVUO7w05Way
 3LmMHkajNOT56s4Eq1kYfrrEz+jNOu6vwuOZ2lPGt6tBTwc2XXTzs9+IE/CqpcrCd/nFX2dMTH4
 d/xzH+n6hTIc4mge7jbIn05egwbOSFkVOZRGzpeBQNFtarsHqn5u/5pwUJJ97nJV3qVy96Hxk2r
 oI6OgilUVuzijtJc7Xjj4iNzLRG4+VzCOxZ345NA=
X-Received: by 2002:a05:690c:e3d0:b0:812:be92:6ea6 with SMTP id
 00721157ae682-82f2e45d7dfmr13705907b3.28.1786445680503; Tue, 11 Aug 2026
 03:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260725231142.61663-1-marcelomanzo@gmail.com>
 <20260725231142.61663-2-marcelomanzo@gmail.com>
In-Reply-To: <20260725231142.61663-2-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Aug 2026 11:54:28 +0100
X-Gm-Features: AUfX_mwuv4V2wO_Cip_DwAQPojC7cBBZED8tYp9UBzi1OWq1bPkCjT7m0VqvncM
Message-ID: <CAFEAcA_Ge+V6+Dm5WQqVzF-On6yfGSdAmP0wSQhHfSxqWSb9Yg@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/misc/bcm2835_powermgt: implement a real watchdog
 timer
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Jason Wang <jasowangio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Sun, 26 Jul 2026 at 00:11, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> The RSTC register's write-config bits (0x30) being set to the
> "full reset" value (0x20) does not mean "reset now" -- it arms the
> hardware watchdog so that a reset happens if the WDOG countdown
> register is not refreshed before it expires. The previous
> implementation treated any such RSTC write as an immediate reset,
> regardless of the WDOG value.
>
> This is dormant on older/lighter userspace (nothing in Bullseye's
> default boot touches these registers this way), but modern systemd
> (observed with Debian 13/Trixie's systemd 257) writes to RSTC as part
> of routine early-boot watchdog probing. With the old code, this fires
> an immediate reset a few seconds into boot; combined with -no-reboot
> this looks exactly like a QEMU crash (clean exit, no panic, no guest
> reboot message) with the last log line being the RSTC/WDOG write.
>
> Fix this by actually implementing the watchdog as a QEMUTimer: writes
> to RSTC/WDOG (re)compute the timeout from the WDOG register (in units
> of 1/65536 s, per the real hardware) and arm a timer for that many
> nanoseconds out; only when the timer actually fires do we request a
> system reset or shutdown, matching real hardware behavior. Clearing
> the write-config bits or the WDOG value disarms the timer, and reset
> disarms it too.
>
> Verified against real Raspberry Pi OS images under the patched
> raspi4b machine: Bullseye (5.15) and Bookworm (6.12) never exercised
> this path either way; Trixie (6.18, systemd 257) no longer crashes at
> boot and reaches a working login/SSH state.
>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>

> @@ -113,6 +136,7 @@ static const VMStateDescription vmstate_bcm2835_powermgt = {
>          VMSTATE_UINT32(rstc, BCM2835PowerMgtState),
>          VMSTATE_UINT32(rsts, BCM2835PowerMgtState),
>          VMSTATE_UINT32(wdog, BCM2835PowerMgtState),
> +        VMSTATE_TIMER_PTR(wdog_timer, BCM2835PowerMgtState),
>          VMSTATE_END_OF_LIST()

If we add a field to the vmstate we should also increment the
version_id and minimum_version_id, and note in the commit message
that this is a migration break for the affected machine types.
(We're OK to break migration compat for raspi because it's not
a versioned machine type.)

I couldn't find any h/w docs for the watchdog (is it one of
the undocumented devices on this SoC?), but this all looks
right and matches how the Linux driver uses this register.

Since the version bump was the only issue here, I've applied
this patch to target-arm.next ready for when we re-open
development for 11.2, with that tweak made.

thanks
-- PMM

