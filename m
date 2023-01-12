Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4725426ejc;
        Thu, 12 Jan 2023 04:04:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsteQeCGjZ6GcA6qftMV9m9U5qLQgE35jniShmXhCmbXRzp+LLPvGMyyNbS2/YUKz0vVSwc
X-Received: by 2002:a05:7500:4bca:b0:ef:bb1d:1e2e with SMTP id kx10-20020a0575004bca00b000efbb1d1e2emr3770186gab.20.1673525078333;
        Thu, 12 Jan 2023 04:04:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673525078; cv=none;
        d=google.com; s=arc-20160816;
        b=DQqfWWcxExw49SX9HUw9Uc3Lm48smwsRT5URl4GcMpgJ/RayN9/sGIKZvA/jSY85b+
         gqKawrErUFqhDWfJGVy6cB9NtOpPNgqOrcfZWTjpOuQtUbMvgSZEZL/mqPx210Zurkmu
         LOM4CKfjmysFTwxYvZeie4odX8M+tJ30tHTEPcRN/bDmbKB4ve0j4+gaigcS4yahVyii
         fuApd69pkw7plBPrKSb7LFwo8OEcahDJvOTgOzyiyCjqe9x7xkFx5VYKeyBPDwjv2xUC
         U2qrOL5APj/khafSSEohv8sxl4cvgW56LgaO6K+ohNa3vsrWY4lO582xcBOA1NeG/RQs
         fOcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=QuHeVLAkS9T5sY7mVhIfKhtmoz7P507klPOE/UByd00=;
        b=rVpn2RIrLCqmjdtqitm69MlyIe6iFfZf80/xJ76MMsaBUBb7bUX7pZcgJDsZCGbUcW
         E6qRPv2H3YLwVMmSi8qEiyr9xOQUC1fBCFE2uEAGJQP09cv2fMdG7FsNirLImxylZRmu
         fetWNsTsy/ccHK3Tnol2IlvCeO/yhBJPL+ksWj/j+NeABmued1VCxn144NEtMMV+KFdo
         Qv/T9Xx43/ilKFh5tbf5oXNHN3nsHEUkWW/+RXwbiTV9ce3yDZ6hn6PaZtDSxYSxt3N1
         uAO4lvP2rypQW93ldqJlmHHfKogRyFDd0sF/TBW4G6AI1Qm7YPh323l9zAEYYPbqoWPx
         LaoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="DrN8cV//";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13-20020ac8140d000000b003a6955a6213si9809555qtj.427.2023.01.12.04.04.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jan 2023 04:04:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="DrN8cV//";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFwJk-0000Bv-Rm; Thu, 12 Jan 2023 07:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <janne.karhunen@gmail.com>)
 id 1pFwJi-0000Ah-8F
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 07:04:23 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <janne.karhunen@gmail.com>)
 id 1pFwJf-0003Qz-F4
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 07:04:22 -0500
Received: by mail-yb1-xb31.google.com with SMTP id e76so18344431ybh.11
 for <qemu-arm@nongnu.org>; Thu, 12 Jan 2023 04:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QuHeVLAkS9T5sY7mVhIfKhtmoz7P507klPOE/UByd00=;
 b=DrN8cV//kzPa89jPf2rOQUlW2hT19wxuxGCWIYI1+iQ3hT1vFrver19Pws7RfzMPzl
 t9VfRhviqsWnBp2a2jw7yopgOkwpQDwRJtAG+ikmy5UdXvqfJir5Uuf+++hq75kOlZ6L
 NlQ7nBqkZeGWjPOmyHeuvKql7bCemautLiWAWKzq4yHW3w3DKbNtACHYOx2hIQ+ZAjDj
 lmhsF6walOct1mG7GKQdI8ifIDQnW7buMN8BVywgjBbhxVaZHNgzB/Sv+gfTFymsI1gc
 G56pYRgWNCKjpsUIoGMv+CrcLzLEc6DegDBJNCCmmKSfkkyH6YgvJjia/tnbLahoGdze
 36Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QuHeVLAkS9T5sY7mVhIfKhtmoz7P507klPOE/UByd00=;
 b=mPgIAKSvIsMBhqD+9Hw+PnM4h+Z2kazbOhQVLA9p8pWXw2kMNgRqVjWwpfNLnlaZ7S
 3Mu6F/DSzMsUvfu4DHnynlmZXl6iH3Kl4PXLBDWVeUygVjWMVATPqR5HCfhErFdJ/67G
 MVOCLof2nGzWKe/iuna2IWyeW+ecxvLfeEPEeWOpTdSzUreg7doh8h+blhKseyL494Kf
 yrtsZlOsCT6pSy5TiWp4/lYPEu1uwifCbg1gJzx2Sx+uJnJvTV8pgIi0PaTCn974MWYH
 dXpaVcoVf6ZHZycPuJzUP0di1EpuZdGklKP4/rwQs4XWdPjsO4/5ToAawESdIgaxMl4M
 aHLA==
X-Gm-Message-State: AFqh2ko1Oi0HxGFIwwXLggCqPznEBG98jqhRluaFXnZ4ispugxBqWtGP
 +CDyeAmPtGqbx1cqGyO3KJ0Xvtwz61ykPi40ZWCqivPgRNQ=
X-Received: by 2002:a25:ad1d:0:b0:7b9:44db:e8a7 with SMTP id
 y29-20020a25ad1d000000b007b944dbe8a7mr2374221ybi.84.1673525057071; Thu, 12
 Jan 2023 04:04:17 -0800 (PST)
MIME-Version: 1.0
References: <CAE=NcrY02FoRhbAYiw+BQ9q111HcMmGjbpVW0pM8e6P5agusHQ@mail.gmail.com>
 <CAFEAcA9-2dvt15FWFy6yOfZDJoVbkiKBEjgLwzkC5dkzuVd_tw@mail.gmail.com>
In-Reply-To: <CAFEAcA9-2dvt15FWFy6yOfZDJoVbkiKBEjgLwzkC5dkzuVd_tw@mail.gmail.com>
From: Janne Karhunen <janne.karhunen@gmail.com>
Date: Thu, 12 Jan 2023 14:04:04 +0200
Message-ID: <CAE=Ncrb-joj10P9fGdkB8aycbZ1SK=LZ5X=DKU4_Ygi0A=ryHg@mail.gmail.com>
Subject: Re: static builds on aarch64 ubuntu 22.04
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=janne.karhunen@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: M/0nUAMsRRdw

On Thu, Jan 12, 2023 at 1:53 PM Peter Maydell <peter.maydell@linaro.org> wrote:

> > Anyone seen this on aarch64 ubuntu 22.04 when doing a static build?
> > Broken libc build maybe? Standard -fPIC (and disabled PIE as AFAIK
> > those are mutually exclusive) doesn't seem to affect, neither does
> > gcc9 -> gcc10 change or even entirely disabled stack protector.
>
> > /usr/lib/gcc/aarch64-linux-gnu/10/../../../aarch64-linux-gnu/libc.a(abort.o):
> > in function `abort':
> > (.text.unlikely+0x20): relocation truncated to fit:
> > R_AARCH64_LD64_GOTPAGE_LO15 against symbol `__stack_chk_guard' defined
> > in .data.rel.ro section in
> > /usr/lib/gcc/aarch64-linux-gnu/10/../../../aarch64-linux-gnu/libc.a(libc-start.o)
> > /usr/bin/ld: (.text.unlikely+0x20): warning: too many GOT entries for
> > -fpic, please recompile with -fPIC
>
> Yes, this is a bug with the way your distro has compiled its
> static libc.a, which in turn is because the upstream glibc
> default was to the wrong thing.
>
> Upstream glibc bug report:
> https://sourceware.org/bugzilla/show_bug.cgi?id=29514
> Upstream glibc change that fixes this:
> https://sourceware.org/git/?p=glibc.git;a=commit;h=51231c469b49fb3837590f40a93f88db9a20bb86
>
> (It's a very small change, if you want to propose it to your
> distro as a backport.)

Thanks Peter, that's what I figured. Bummer.


--
Janne
