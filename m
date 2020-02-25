Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1971303lfg;
        Tue, 25 Feb 2020 09:50:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqygw+fwANn8fmPbUlY/bT9KXdLJ8XeYnzaDLpCAcORnMu9T9NJvlfJCr21bFzSV6dOm6lwV
X-Received: by 2002:a05:6214:166:: with SMTP id y6mr46520qvs.120.1582653015190;
        Tue, 25 Feb 2020 09:50:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582653015; cv=none;
        d=google.com; s=arc-20160816;
        b=ieJeCvZZmF1Fe0JoQFvBdCacWyVDS89ZGafkSrEhjgBUfp0C/h6zh3tRvSplrNFAU1
         OlPvdw3HAOyB/24WA84/SepMpVUxXKvKAqxrB7uiF7SRgz+Sbajbp5A0GhrWgSzIyfgS
         OLkqGn9RkEEkju/SJ6mu45lJmuGhzDIlU5D5CYMk07cn5PcBW5tbQQsBZEOcdolYawtB
         eWJRf2dh36TotBs/CPHFVg9tv2/WK7ao/FLBd+q950RO6a8ZyJFjDPDe3bFztKKaQT0t
         GvL/S9vnU+viu+CQDvw9jo8SEA0xwzslI8EKeRwpAWaK4iap83eoDmr5J19yZwygf0va
         qKYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rr4UCfVHKav4oC6NIKyVwaHkTCmC6VAHr9oIXyxI1JY=;
        b=pSbXUI43brX3xr4vTXJNAoQEHg4Yw1tT4QwEw0k05CGntu2UuREFM0TwrjEOvy0NvJ
         svO3iZ5EMW60Ac1BNTJv5y83E3OZ8M8YcFCe4YVL4Icr5rPTnNwv/avKIwcDrFUBfcUE
         6HmH+5A1CKaDEDcHT2kcMHEv9qCyk71eIhtX5EydM123IzfTuE55q6YKDlijaNYjdU9D
         DGL8Q2NoLXDV3WvJddonHM1car4FfKao98wF5kQ0YRJfeU8KeStFnur/1SEeKDJ0MBGb
         wAwGkA9NYDO/jGhPf479U5fgIJlbMkH1dmvr0WGU5dQYQcPKZTTfBdva0vxQdRYQiv0e
         g68Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VRAKj0YA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w192si3428qkb.267.2020.02.25.09.50.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 09:50:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VRAKj0YA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6eLW-0005CY-KZ
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 12:50:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52106)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6eLH-00056n-Th
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 12:50:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6eLF-0006li-Gp
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 12:49:59 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:39967)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6eLE-0006kk-6Z
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 12:49:56 -0500
Received: by mail-ot1-x344.google.com with SMTP id i6so324279otr.7
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2020 09:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rr4UCfVHKav4oC6NIKyVwaHkTCmC6VAHr9oIXyxI1JY=;
 b=VRAKj0YAURnyeYjjEC0XlzvILcYMKxtiQ5Rcht+/LtaFUJ8p3JlY7OHOoPLd8944+a
 Mg+aEJDXiEqfjEp0iE7KIhzIiYrkl1fDQM+BVnyXwtlGHNq8M2TgX232zJ6eT7IKVOky
 0emKoIfdf0yR16Rna555XaDBBs1G+yebdKBjTdR2GXv4MChoHBvAwXkS9k1dwYsO2yy7
 lFXitXr5K0elWSRTESJQiUTq0ecGv2SFG05mTBDyEfINviN5VKaaYLWU/BuNLo6WbIFa
 GkjBt0uoBRBrpVYcEr69jB24O1/bGrxDUoA6l7bqOceSwb01WzbGto2HTcXllUvMCail
 Vk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rr4UCfVHKav4oC6NIKyVwaHkTCmC6VAHr9oIXyxI1JY=;
 b=g8FNKYMnh6VoOj2MWQpsp6HorjU4hc2nhjt9goUlLsw1iwWD7PMNbIUxyIw9f9JTZV
 huoumrlq5KxyWa+kDfI0uwHqE/ze+nH1hLHP0skBB48Z3cJ/rfYwxKa8568ce4bc9/AJ
 VO+iE6/fcA7uK+oDyIKQYj5rIL0vUeMbnF0EQlPprHps1+c45aVNcVixZhQWsi6Db1bE
 513BljQjhykk6qQNGoQIPjJf1IsrZRo4l2pvXsppONPSP1UisY2PC7Q8EEG/r4Fi4d8h
 wWVhdtRx3LmD0P3iyyQO5SqfXzZJqJBV/yDJsM595zvHJqP/LGf9tAW9wXBferDhJ8sZ
 hTRA==
X-Gm-Message-State: APjAAAWxm1bMFaU8UvwTWGekjRwdLo49uM/DJ07oLqJhV7FxHPgoIoWG
 7hvjKFe1y+mAMnmhyzU98PI0UHLy0KazTxEnALjRt+aI
X-Received: by 2002:a9d:68d9:: with SMTP id i25mr33647379oto.135.1582652994654; 
 Tue, 25 Feb 2020 09:49:54 -0800 (PST)
MIME-Version: 1.0
References: <20200218190958.745-1-richard.henderson@linaro.org>
 <20200218190958.745-8-richard.henderson@linaro.org>
 <CAFEAcA_QHoRcfv0oLgxNsuEOaRJOoM9sQHqXZEP-tDeJrziVYw@mail.gmail.com>
 <4dbed837-f3a4-2280-8655-6975dd235e4b@linaro.org>
In-Reply-To: <4dbed837-f3a4-2280-8655-6975dd235e4b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 17:49:43 +0000
Message-ID: <CAFEAcA8+72ZdTFj+b4X0fsNoaWPVR_0icfT8Y_FyUkPYRLJ0hA@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] target/arm: Honor the HCR_EL2.TTLB bit
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dd1rEnCjctAt

On Tue, 25 Feb 2020 at 17:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/25/20 4:01 AM, Peter Maydell wrote:
> > The set of operations this traps differs when ARMv8.4-TLBI is
> > implemented. It looks like you've applied this access fn to
> > the wider with-v8.4-TLBI set? (eg TLBI_VMALLE1 is only trapped
> > with ARMv8.4-TLBI, not without.)
>
> Um, that's not true.
>
> ARMv8.4-TLBI adds the *OS and R* insns, and extends this bit to apply there.
> But all of the original v8.0 insns are unchanged.

Oh, the spec has confused me by listing the TLBI operations
in a different order in the "with v8.4-TLBI" section (where
it starts with 'TLBI VMALLE1') and in the "otherwise" section
(where it starts with 'TLBI VMALLE1IS' but 'TLBI VMALLE1'
is still in the list, just later on).

thanks
-- PMM
