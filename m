Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031A9CCD185
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Oct 2025 15:45:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v7FIj-0001vx-6n; Fri, 10 Oct 2025 11:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v7FIe-0001v5-NW
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 11:44:57 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v7FIP-0000jV-0A
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 11:44:48 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-71d603a269cso22593267b3.1
 for <qemu-arm@nongnu.org>; Fri, 10 Oct 2025 08:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760111075; x=1760715875; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IP2dGjhuwFJFn+3sjgH5vSPw/PJB0rjZ/XVicG18xoo=;
 b=M2i2rfblzqRwcfEkmKkPaFvgdLAmJXqYyJr3gHJU/OAL3HWicdIu5fTSz0LgM06ZmA
 DRSPTDazpX51D3gtZL15taehmFOENZSHg2O5Wfux0SJUiWYMjP9TCXzJ71FWDxHRBjp7
 ktErCyR+NZ/1agCoG5ESu54Hn7EsEaB92IwZp4c4E/W/jHR0aYrkask2vAT+xtaTuBXW
 fA2wTRQPDGd713ECisNrgvdydqCNnbSEH/1Xh8bhGiMON9lIaPWDv+q8ZhTzwkHQLZMy
 82vd2/6PtryrsDtPr0oLyppWw77MtG5kiUWWYmb/xKMZzxOn4EYNAzUaNH7S4Ha6N1yc
 RsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760111075; x=1760715875;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IP2dGjhuwFJFn+3sjgH5vSPw/PJB0rjZ/XVicG18xoo=;
 b=ptZJfiG0UpQP45nx5yc5D0P4MqFBqXfgcVe8PkOSY9FXIlKtjObAPDsMG/hwAv6ThZ
 Roymf1Elax/sopGMJKisjQGI3R5jv9mxuaN9SYdmqqndFw2mxNWKQScDruabaDiFB43l
 dshgzEHd9LSij3lwSt6xP86YIsi8CzMnqXqno8wmW11EpBtvd477C2idBBn+oI3AwuOQ
 rtqWhM4CvsKOWT+wa6XhkSk+iPrC8ACaqCzzm3hurHSzTaAdDOVlUGARoxakqjBL9DKf
 yY6EwEvEzI1rp8jY4Uow/kg0LEYdyoSk+oSMfBBVZk8Cumac2vYMUYgxiTfdJjdDlQ+i
 dZBw==
X-Gm-Message-State: AOJu0YyBsjnkgdVK//uo4BHCS30gNV1sqr4w7dLsmNQCiqdXDL81Jn1H
 sljvtqkSVnWW0simvttD0nqsuHv5IwL0dqIkuY3SQ9AQSOoOXo2SN+QPGo/3slvZesjRO1N2MsZ
 DSQBj4ioBBT2LhQmwscR3dn5708HHv3IGENPpWl0/6Py8v8Nw00gR
X-Gm-Gg: ASbGncsTgQt4B67Uw260ztgWs5vGrXvpwvO+C4nCgg0YBxt2oDi0egTklkcznhC8Qrh
 qWhiRqM5i5qnqfrw+zC1BB5/ohZ93+hRsVvtmO/ZpFW5iGpqHZ4fPVi9mc8L7/KEceX5EIZ/lPw
 SI6Dw7l7dHcBxkm8g8kMHiZeE1NuNXbZ/KTLI4wYUB/FIsoAEQd69bm2AncAkn4n/46noUtUBM1
 dAagKERxHAqTL5agd65e5Fb4mXQYF0G0dkSPjEGNlcS1zq6KGoW
X-Google-Smtp-Source: AGHT+IHO4ewkA+9g6jWKXpJ15gM4a/0n6dmGfiwqbSa4M6jlsTksPUxclAN6yW7rcjkJocahdWuPiH5L3vvyY0HJrTo=
X-Received: by 2002:a53:a6c1:0:b0:636:18cc:fefb with SMTP id
 956f58d0204a3-63ccb825876mr8510929d50.5.1760111075536; Fri, 10 Oct 2025
 08:44:35 -0700 (PDT)
MIME-Version: 1.0
References: <20251002101648.2455374-1-peter.maydell@linaro.org>
 <20251002101648.2455374-2-peter.maydell@linaro.org>
In-Reply-To: <20251002101648.2455374-2-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Oct 2025 16:44:24 +0100
X-Gm-Features: AS18NWBh81MNJYEunPEjuMZf4QRINO3lJ1eQmWgu3B40N7y5FIYWQRMT08Au7Cw
Message-ID: <CAFEAcA9KeO2r+jNont_2Jpvi5MgViH3nXO7TcbANe+3nS_PF-A@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] target/arm: Clear AArch64 ID regs from
 ARMISARegisters if AArch64 disabled
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Thu, 2 Oct 2025 at 11:16, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> If we create a normally-AArch64 CPU and configure it with
> aarch64=off, this will by default leave all the AArch64 ID register
> values in its ARMISARegisters struct untouched.  That in turn means
> that tests of cpu_isar_feature(aa64_something, cpu) will return true.
>
> Until now we have had a design policy that you shouldn't check an
> aa64_ feature unless you know that the CPU has AArch64; but this is
> quite fragile as it's easy to forget and only causes a problem in the
> corner case where AArch64 was turned off.  In particular, when we
> extend the ability to disable AArch64 from only KVM to also TCG there
> are many more aa64 feature check points which we would otherwise have
> to audit for whether they needed to be guarded with a check on
> ARM_FEATURE_AARCH64.
>
> Instead, make the CPU realize function zero out all the 64-bit ID
> registers if the CPU doesn't have AArch64; this will make aa64_
> feature tests generally return false.

I did some testing, and this doesn't break a KVM AArch32
vcpu, so in that sense it's OK, but it is a bit odd, because
from KVM's point of view the 64-bit ID registers still exist
and must have their correct values (especially, for VM
state load/save). This works because save/load goes through
the cpreg arrays, and doesn't affect cpu->isar. But it
means that QEMU has a different idea of the ID regs than
KVM does.

So I think the better approach here is that we do only
clear these ID registers for the TCG case. For TCG, an
aarch64=off CPU really does not have any aarch64 at all.
For the other accelerators (which is probably only ever
going to be KVM), an aarch64=off CPU is one which has
AArch64 at a higher EL, it's just the VM can never get
to that higher EL. That seems like enough of a difference
to justify treating them differently here (i.e. only
call arm_clear_aarch64_idregs() if tcg_enabled().)

thanks
-- PMM

