Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C8ECD8CA4
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 15:26:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWyL0-0000bO-6N; Tue, 09 Jun 2026 11:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWyKx-0000Wd-KU
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 11:25:55 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWyKu-0002Bq-Lq
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 11:25:55 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-bebb72b845aso876621566b.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 08:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781018751; cv=none;
 d=google.com; s=arc-20240605;
 b=L0ymg35D9XQziijS64CZ2RV77KafjH2YTd4/PguVIsrigprjnZ6Jdnj8wQOSAh8Tx8
 WKFoOROYX4cbNO2DKU9L3pM1hYv85Ph3IYxZ4d9ovnrKGSyyh+9xCqoMcqJVjRHNM/Na
 EB0q2oAeDUl81aPp9rkxrA6k1sU7bTBtUfYQWrjDZspD/oKg6MpddhtKBNQ1CIDGKFFD
 XUGM6NBYroaFU9EvLXWjecyTIbFm4xuRuE1TXNSlYWb5B27fj2pwsNaJEtsJ7wN1Y+Yd
 khwQJF7Z9x9+UZnp6A0TCS9HBmW8bFaFw7iWHj6SXglKeTUhmkAWF4N9Q+Yi/1OxTcAS
 nW3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=o7hZxrOxQsSfFXsDoeNg7xAeFrfoXUdRu0/vaXFQ7xY=;
 fh=7FgzlhLH6UuDibCAfcYDlPFTq9LoeJ4fV6ovILsCMp8=;
 b=DrwfJJEDj2LB3pr30XAmecCOYPlaskAuAzQ6tJUgPzMrsOgkP+T6Fzv+QauL/6aHTn
 SsUiv6K2kVSCjNFbppWrK42kqqAK6b2PPpJbZOgRT1nq+NbfRokxjcQNxhK1yvsjQHoS
 8t41cfH2/fra9hwLrc4724j8KDS5ttgFckOyA1321liryqVrthgopLszigoKC34LIlqQ
 Tx2EXgk8JjCmSAyw0q+yRSVi/cQALh/8Kcknyk+fq9JKiy1U6kG8fGr33xW/2aP+d2aa
 sXmQ+r/309aTVvzWFXWHLshYR5fBoLsWTPbDQuF8Rbdcu2+4V+wcvkbetRpVGiJSghor
 59TA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781018751; x=1781623551; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o7hZxrOxQsSfFXsDoeNg7xAeFrfoXUdRu0/vaXFQ7xY=;
 b=eqhVwtcdaKQeArCD6FtycGKL7q1qZQ6cQ1GmgGkzDpl50mzaFNd87uWORVrsEAa3S8
 grqqV1IA5c5hZF99TRecLJCxO5oAvwSO4YRJ7ceU3+pyHuV3hho3k5jPFAPEuiSIKVH6
 smtbqWI3pozrzX5NedRQS90irhd13VhIA9XbWkpr7D/XfuBCyA5L5w5PAVKTadZuPQ2a
 Ke/R5ICvfUH8AjMO4l8UIHreEbI4ur1Ha8dCdSLlnX204JkAn6suW01wX+mslYUEmgSO
 PW9gpoPWCVw9FhD9mNKmZQI+J1yA7tY4nt1CjPkadMkovMaDgI1VeTOMHhn5Bb8aIGTJ
 5pJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781018751; x=1781623551;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o7hZxrOxQsSfFXsDoeNg7xAeFrfoXUdRu0/vaXFQ7xY=;
 b=R3HowK9dgH0e5+dkOMFHwuCTfysjOPKL5NE7OCiuZzMIMgDIfwvgFRPGR3M0errHKZ
 FLk54KSHS+Rf2PKZFUtB9uKdYVuexOojWHC8G2ROnpVGxFjR4nxlYOhcQdmuvjGNY4bq
 LX3l00ytNrh0XsAntg6E8gs78sDezkz659PPI4u4TQFLy1imFtIykeSay2yjwOnVAPXV
 IEj7KmFmIThMEVesU/HmMN50LdJO2qz4NZjW+3bbUyKQC7vVCYxqWULoFoM6szO3Y/0W
 EYZslwiTJwj7PtGmXUnXH0kMuvoUKiYfBfg8OV3zq+4QccuLtTWD+19tWZ8GUQ7q8LS6
 5kmw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9VXZ+qXl0Ufe2WTcXbO9JhlY0uVfU+OkSTK79vJB9hnmi3QEaQvKDePRo4u3ybpaeBYXSJ1alhLA==@nongnu.org
X-Gm-Message-State: AOJu0YysqVAqP/jWVD0YLtVUG0pxFpis6cvx8DZ1vBbOrt2FuaY9pHRm
 W2iGksXPrpbkGpfjDb5sMhGmLQ9wWbL8uPYhcHK08C8DOG/k0pkmgtU9ohZVX5dOXsMKNd/ZChk
 mJScJOGQWixaxhJnNSVAyZGtnfJr51uRpnjfV53Xl/w==
X-Gm-Gg: Acq92OFaVsr5/XYyMMm0HVkkGFb0/pZEsvUWVzDSt58isHe2fAqBB1arMZLBmj005An
 FhQGhRPP9y7xJbaQn6XLtTMIRRyzTr3GtxE7px1gcFEJTMO6csRIKXPlYB/y84m1EWDs/m2p/jm
 Iv0IjNHzi8QdsKxtVcR86bXV6shizRZvYwW6Djm851gL3E1hkG/flzxGBCVfVGwJjY+iNBGEzZX
 LWcU8HMbaS4VAM88OB4JsRgNGNiZ2SR4mSWPvQtHxWBh+mM7fLTTgR75OmyiM2JGfzOzPx+401I
 ySCrpmwHFNA9fiApnrxe9jsKoSOtl1qIAwHUW4OZcrZ4p4x9dGPcyC4fX5Wq3m4i5VWQaIJb6/v
 QOA==
X-Received: by 2002:a17:907:6e87:b0:bee:b5f2:639d with SMTP id
 a640c23a62f3a-bf370376bf2mr1047493266b.10.1781018750780; Tue, 09 Jun 2026
 08:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260609105626.1038690-1-thuth@redhat.com>
 <CAFEAcA9O6b02VMuto8VzaEsVi3zTqNtQKG_RcMaPnNdPXGUBhw@mail.gmail.com>
 <CAMvPwGpvpHD+Sx-HZR4FFMJB+W8Rk8LoU0256Q=vwKAdC96HSQ@mail.gmail.com>
In-Reply-To: <CAMvPwGpvpHD+Sx-HZR4FFMJB+W8Rk8LoU0256Q=vwKAdC96HSQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 16:25:37 +0100
X-Gm-Features: AVVi8CdB3SImlFLR632tnSYS0KHxqTkH9TALVmIC-IdIEoCpYoimC7lGmw54OfM
Message-ID: <CAFEAcA9N_O7RZRU+SPTfB_ePasjVZvUsFPhndfQDuHgQ+4Q-5A@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c/pmbus_device: Fix a possible crash when requesting
 too many bytes
To: Titus Rwantare <titusr@google.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 9 Jun 2026 at 15:52, Titus Rwantare <titusr@google.com> wrote:
>
> On Tue, 9 Jun 2026 at 04:01, Peter Maydell <peter.maydell@linaro.org> wrote:
> > I had a look at this bug earlier, but was not sure that this is the
> > right thing. What happens is that the guest does something that
> > causes the device to queue up data X ready for the guest to
> > read, but then instead of reading it, the guest does another
> > "I would like data X please" action. My guess is that the way
> > the hardware handles this is probably not "add the second
> > copy of data X after the first one". Perhaps it is "drop the
> > data the guest didn't read, so the next guest read gets the
> > second lot of data, not the first". But maybe the spec really
> > does say "you can do things in the order 'ask for A, ask for
> > B, read data for A, read data for B".
> >
> > I couldn't conveniently find the pmbus spec to find out what
> > the hardware is supposed to do here. We need some input from
> > somebody who knows about pmbus.

> Queueing reads are an implementation detail I decided on, not part of
> the spec. How the data gets discarded is up to the device
> manufacturer.

So what *does* the spec say? Does it just say that if you don't
read all the data before doing something else then it's all
unpredictable? Is there a way for the guest to get the device
back into a sane state after it's broken it like that?

-- PMM

