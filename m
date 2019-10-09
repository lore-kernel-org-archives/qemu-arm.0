Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1289091wrm;
        Wed, 9 Oct 2019 11:47:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyRmKWX3MhlRhuJhpMc9EiImrI8i6uZy8tzOhFgOFwHpcXrinJyuwELr3yUtpNAfFg1/KfA
X-Received: by 2002:ac8:38bb:: with SMTP id f56mr5333383qtc.154.1570646866281;
        Wed, 09 Oct 2019 11:47:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570646866; cv=none;
        d=google.com; s=arc-20160816;
        b=DJ22G5sfvCbwOpxMBvxpcGutOIJAdoiRmlgnIOulX2Ax8KZAd/PwIg/VcyUWN7pWun
         4zbHVs2f3TMC/B+m7mNP3fVmQwa6fLVVE3C/+YSydfcVudTQHCIVWRei3ScmoZM7KQA8
         24m5+t9hgnBUd0IvL1giSExg+PrniHK0Crz8KVe2avdOBfyKEDr4n4vZb1l08lLUgwa5
         G/CaT/utxLVxaX/C+12ncJ951rMykBpg43oNrh2W2Bl6dHSReuQWdhcSTxiFWIgUk6E/
         9Y57mVit/IB7Gnb9O3dlkVK1vtA4TRvjoW6wlbcDZKGk3gJZ0eI4YO/MsL+jKMDl4f0o
         w8yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3g/D2fe1BvDimcQvKdf4hxfNjstsd/kFe/ZTYgk3oUI=;
        b=YLXBwa+pdqBrNKlmIouxSPt1jS23jeOWcG3WBJGeBBxNKmiCJacz/uwnWZpf4jKX+P
         F/BZ+0jlhpzjbS6xIh6FYXro4ibiuU8e2qjQlIhygFF6LM7Q8XicHJaKk2OqNCarStnz
         eDvRQ+f4ZstySAyBFZ0uVK+OtI4zjADGOa4FC3+QbbqFvbBgCMKUmduzGmNjlRi0STqc
         W8fEGVPk+xmganf2+DZWDAKhPGM/hZogWrp7R/AsvB+D3Luxq6DhtxgjlUS1tw3rcXl0
         21nGw9KJaV+ASvB6sZz36dYZPn7g1aYo6zZsMQz9uTuhJ5VcXNew42OtX1lPCwlkHOxd
         DKxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Jq+UaPmj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17si2960933qtm.167.2019.10.09.11.47.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 11:47:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Jq+UaPmj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIGzw-0001lH-Ut
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 14:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56966)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iICLc-0005yW-Ee
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 09:49:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iICLb-0005Cb-EX
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 09:49:48 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:46560)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iICLb-0005CE-AN
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 09:49:47 -0400
Received: by mail-ot1-x344.google.com with SMTP id 89so1737280oth.13
 for <qemu-arm@nongnu.org>; Wed, 09 Oct 2019 06:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3g/D2fe1BvDimcQvKdf4hxfNjstsd/kFe/ZTYgk3oUI=;
 b=Jq+UaPmjbXBn5Ni0j4LCmWxovZeAmudgO2aIXalRNNAkR2OkiHQzCQWBncEDvsI4bK
 bnLxMkbu1vmyCm5KzL4A/L2pyRnEIpmoOA/Y53qJdTvY69WBUCw7OzQzlZitW/Eeec4a
 z66bDgEofGVAmSUaO/UW9YHUmTUxD2mf3mtn8udF61rncuSmG/tCls7+yRxYhIjKikzk
 IxlHj+ROsWNq45BNSqiVM4/74dzngweU9NHPgtCf02vjPtZD5obIrez3tagglwFfZmGw
 Ff0EtKkWvS8e0/2oyPvXLZ8lk6TFcGv3fV/15r3/zSl3GtFu4n/Yao2nfkbni/s7UMxt
 QauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3g/D2fe1BvDimcQvKdf4hxfNjstsd/kFe/ZTYgk3oUI=;
 b=N5j32XJcQGiM8tE4OVL3h5tPhN381apntaYs5/f6DRHma4/mH1bHw2bm6QRDw521fO
 yKYCFyvb3l6pJyz1Pt+thsnBDnjwgi3BCqoeOSTui42RIwhsVVmL58b1f/mgf0TQLR2v
 i5rkyPV56EFyLodFVLF9aLrUXyB8i9KCsRT1mTke3LGMFphPQj6dOVx2XJ7guGMG1/Uw
 39MxyRl/r494QE2sXPwb3/MO6vst5uqwGtnbQvkd+tv6OPbCnX2+EBe8LLAhqMuv5v0n
 yQgQLlZqPfbWSvvZT/MKXjJaZ1exW4QWMMoIz61Avz3j/o8cwP8HmIVX7Wntni4L6Kh4
 TmTQ==
X-Gm-Message-State: APjAAAWyQyhu7fad3NnAl7fo95ePqvgIT9+/PjnS1AVhAhzY8wteVMAn
 Td0FvnIwx+QhclqWMANs4d235fQxoF/6XwEiolSDgA==
X-Received: by 2002:a9d:30c1:: with SMTP id r1mr2937187otg.91.1570628986270;
 Wed, 09 Oct 2019 06:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20191008171740.9679-1-peter.maydell@linaro.org>
 <20191008171740.9679-12-peter.maydell@linaro.org>
 <09f5a1b0-8750-eaa4-c6a3-c395ded3167c@linaro.org>
 <4fb18f38-eef3-281b-f414-d257e3dfa2b1@linaro.org>
In-Reply-To: <4fb18f38-eef3-281b-f414-d257e3dfa2b1@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Oct 2019 14:49:35 +0100
Message-ID: <CAFEAcA9ps-s3WEGjR2sVkVpZ=AAa-qcu+JyUhdVY1SnZqgBiUQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/21] hw/timer/exynos4210_mct.c: Switch GFRC to
 transaction-based ptimer API
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HlAQum5q6JI6

On Wed, 9 Oct 2019 at 02:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/8/19 9:56 PM, Richard Henderson wrote:
> > On 10/8/19 1:17 PM, Peter Maydell wrote:
> >> @@ -945,7 +977,7 @@ static void exynos4210_mct_update_freq(Exynos4210MCTState *s)
> >>          DPRINTF("freq=%dHz\n", s->freq);
> >>
> >>          /* global timer */
> >> -        ptimer_set_freq(s->g_timer.ptimer_frc, s->freq);
> >> +        tx_ptimer_set_freq(s->g_timer.ptimer_frc, s->freq);
> >>
> >>          /* local timer */
> >>          ptimer_set_freq(s->l_timer[0].tick_timer.ptimer_tick, s->freq);
> >
> > Failed to update them all, it would appear.
>
> Ho hum.  Done in a subsequent patch.
> I didn't realize that you weren't converting the entire file at once.

Yeah, the MCT device is pretty complicated and (per the commit
message) I felt it was easier to write and debug by switching
each ptimer one at a time rather than trying to do the whole
lot at the same time.

thanks
-- PMM
