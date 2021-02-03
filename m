Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp109808lfo;
        Wed, 3 Feb 2021 02:39:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1nXL08+dKoK5u8kxdZ601pkI0RY2L9cS9X9ECOnEJCD8mcTaM6KTLOeuvYzFFHQBt2q7N
X-Received: by 2002:a25:2f4f:: with SMTP id v76mr3472864ybv.391.1612348754717;
        Wed, 03 Feb 2021 02:39:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612348754; cv=none;
        d=google.com; s=arc-20160816;
        b=tCr/P/ctrxcJCgH+woPeX6gaXC1DQF8Nk2OAzHGM7W6RcHrRaThThA+0BgGCs+MHuZ
         ARwmxDG3wNdRzsahIf5xMUvkamGggtr0Wj3xfFZ22K+MfzqXlQk77YbYKNpghZ3NbumE
         jtK6sxE5l1IUGCKAjC17aq6a8ixhF6NpD2NY8xp5L6X9HPYL6sGeA6qkcxuepf9jMwDi
         1qLTXibUVsMkjAI10/z5/zW55OGy62ST9Tms/I3eT0pbLtBboNRe021t/a7yZuUWK5T0
         vvSA/vfxu0UT4xJA78oXGNOMdyHZm6BzaX7y6Lw0d/oSjXzkNQuqfuRGYRUIXgXSM6VG
         iV7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Wi8aKt0V7pdEcjvlO9QHe7lGYNQbKLWBMyA8ozU72r8=;
        b=GNY+gSX7DHye1z8h1zvx7MZu/lX4oWD2V8zU7qx1x9lIHchbtfpRq8Sj0Z8myWCZBF
         FRkVyHRBBk03h5+RSQbs5qowsiT1npGO0C7f8tjRUCtq76dlTG9SinAyWH3GzTaw2ggK
         voSH+M82onkMknxzt/Om/Gj9hFacV9txBP7T/H3BfvEFihuGwMSrvS4Fvmu+jjG3+mIJ
         x5BDhSM70kBwGX6ThiHeUK3/lTtzIyNBp3btFXeI6UPABdCp5KirrHOo6ly5TvxBAig5
         YI8ULkhU7kBG0j/vq2b6AbmTpSTTIQWiP+JGFWQ5+ca0eKqlXZNPAfj4hJ6Vc9pIHocd
         EqYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kUIZCsDF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5si2101371ybo.67.2021.02.03.02.39.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 02:39:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kUIZCsDF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7FZ3-0005ll-TI
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 05:39:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7FYt-0005l7-WE
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 05:39:04 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:46911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7FYs-0004tN-9z
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 05:39:03 -0500
Received: by mail-ej1-x632.google.com with SMTP id w2so502206ejk.13
 for <qemu-arm@nongnu.org>; Wed, 03 Feb 2021 02:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Wi8aKt0V7pdEcjvlO9QHe7lGYNQbKLWBMyA8ozU72r8=;
 b=kUIZCsDFb06c2eI3avKBG9a2FFtQ4mPzUS2ow3CCXhEA4UoIy7zpLRVa7ymPs6WE2q
 hcvex70uw/JGiZITSKSJAGc/apUg0XGTpOE6kEUK71zQGRSnv8lckHSdIO+AeZwIxeMH
 JOtm4GC4d4EdZ5B+Mba4HPr45DOPk0xSJjtYd1cDauFrXHk32C1G9scrWmorNeedQ/2B
 0bAdA8Zxst5yzOGptQUMgcjBCYCc7Pqu4Rhdh3N9qJOkbLggtHEmy64HB2pxQBVWumCJ
 mUzAnUD7xRPTNC9QeE00BFaeo4FgJEyIABp6bTXEQQ2CBPwXBpQDCkCnUVRkapplwBPC
 R28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Wi8aKt0V7pdEcjvlO9QHe7lGYNQbKLWBMyA8ozU72r8=;
 b=j4twHRNMmJcBCuOyO8paIawsyaHQSFMo0QJWSgomQII/m0/QxT1zY6AQEjIEQ/HwUm
 /nfVou7V47+mx7UFdImj6CL+Rg0/Js+ggqOVMXxLHtUOBu5yp44ay3qd1irzJdT/r9PS
 UoiXbCqG3eviAScNHOpQ8r4Y62SVHtjEFZEpRNHTkFnLNETXUmFrymC77kvoxpO/0hMw
 Na3yu1x5m5SAE4b64jngp2J8AzqrcORc9+6PRSGX8IaVPzFg3qoMEn7n4GrYliO0A4GF
 eo0u8L5Ob4/PjgYREngG9koiqzPv9xOnjPqXfs8fSrSFikEfOdOeWgEYWKPsQQOn7SPR
 xaVQ==
X-Gm-Message-State: AOAM531MS9DpoZ+JGmEXObp1fO54SqNLJlW6ZXCirDelLV65eVU7FNgQ
 AUG6C8vitojK6qjy+Igk98e4mRkkEiDZ/TFJoHa3Vg==
X-Received: by 2002:a17:906:3a89:: with SMTP id y9mr443883ejd.4.1612348740502; 
 Wed, 03 Feb 2021 02:39:00 -0800 (PST)
MIME-Version: 1.0
References: <YBogDGJRU5pcDKmi@strawberry.localdomain>
 <153e5c54-f8bf-d088-502d-502309f5d2a6@redhat.com>
 <20210203102758.GC2950@work-vm>
In-Reply-To: <20210203102758.GC2950@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Feb 2021 10:38:49 +0000
Message-ID: <CAFEAcA9_mcXHd5m+Z2M1jvk58kGVEcYKF+0kVsLJTjwB9MZcfw@mail.gmail.com>
Subject: Re: ARM Snapshots Not Backwards-Compatible
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 24GLz/Axiq09

On Wed, 3 Feb 2021 at 10:28, Dr. David Alan Gilbert <dgilbert@redhat.com> w=
rote:
>
> * Philippe Mathieu-Daud=C3=A9 (philmd@redhat.com) wrote:
> > Cc'ing migration team and qemu-arm@ list.
>
> I'll have to leave the detail of that to the ARM peole; but from a
> migration point of view I think we do want the 64 bit ARM migrations to
> be stable now.  Please tie incompatible changes to machine types.

That is the intention, but because there's no upstream testing
of migration compat, we never notice if we get it wrong.
What is x86 doing to keep cross-version migration working ?

thanks
-- PMM
