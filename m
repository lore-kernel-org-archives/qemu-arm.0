Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp4936815wrx;
        Tue, 5 Mar 2019 08:37:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqyRE3hpJVd4Xrqd6dmqqw7KhB78qCfMHkxX8Nw/cGbzzGE178D56Lf/9N1HHgVhh9gCKpni
X-Received: by 2002:a25:ea02:: with SMTP id p2mr2898643ybd.41.1551803859338;
        Tue, 05 Mar 2019 08:37:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551803859; cv=none;
        d=google.com; s=arc-20160816;
        b=A76PtOMwdJI1WouuPQYpkpoHsxCpzdnAjkLwScAtFN0kX/5G6rLpZhcCA+WYJxUuV4
         ccvelqXMvjJalszHvSY0N3fAwVaWpylWMJoGBZ9YeIUgrNBqboclrBii0BDuDL9MEhdf
         iXJdbEEXnjHvJGQAtixpYfp0AVxJJYjd4gf2iTILbn+0OHk2Bnw4B28KA1yyNSStE31z
         SvPlhlHpabMzdrx99wcPYK/DVfX7EEmiD0xBFiLiJlKU3faparot5WB0G6kFH9fbE1/4
         1jyv+OtgH7dT+I4lpoI8wx8zXs7lJN+rSUQVKIN1sg/upVYhhE/XlLcI9Bl0dU4rRilk
         RJiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WUZ0WJpoP6M45K4WU1OMQUQQ23gucGVmyC9SEUSDr8E=;
        b=a+CLR4GD7rER5F/O8JX4fUzk/BljJZPGBxNCc0jT4TPygUcdVk/+XkV/yMFBKZH5Zk
         xyTRzrcHx0rEghtkfSTlQv/B+2x+waTa4adFIfg9JjS4UPhNfO74i/JeTt7nRiYjKcqI
         kJ0vEIdYjR/Oql/x4SUCXTvsI0dNei+dFIbUZLYhtm7T9nhvcjtsozHsWvezywjJEtqe
         F9tTgplBHm4wMlQAyzBSszgsuYFLYAwrqg4uMy4Z/oUySbUCh9vkz5ysfJOAaw67GqiG
         j6GoGNmvFSBP3ePiR3uuGuk1XJNagI78jGKTKDGR48/ngVYomWPFpPeZTcVlkS+clGGB
         uEWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Plr89zkX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 188si5384942ybp.38.2019.03.05.08.37.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Mar 2019 08:37:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Plr89zkX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:45544 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1D4U-0004sq-QG
	for alex.bennee@linaro.org; Tue, 05 Mar 2019 11:37:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h1D4K-0004rs-5k
	for qemu-arm@nongnu.org; Tue, 05 Mar 2019 11:37:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h1D4J-0003lc-5v
	for qemu-arm@nongnu.org; Tue, 05 Mar 2019 11:37:28 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:41446)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h1D4I-0003kN-IO
	for qemu-arm@nongnu.org; Tue, 05 Mar 2019 11:37:26 -0500
Received: by mail-ot1-x341.google.com with SMTP id t7so7951078otk.8
	for <qemu-arm@nongnu.org>; Tue, 05 Mar 2019 08:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WUZ0WJpoP6M45K4WU1OMQUQQ23gucGVmyC9SEUSDr8E=;
	b=Plr89zkXf15VDxbLtUUc1Q/e3QPy4s42qF/rf119Qx2GZFHfNg9Mu4HjnFuWOoNpBt
	N9TRruUlpWJfDjZnzJxqpyfBrYamA3AjxbrXJH2o4DydQJwyqNx41xn0jB1MOaCKyWeJ
	pfDVv5XmUTJniFOj4gDeTNP2CMj8PEVShLE4wu7erMgnl8ioTwPrV8iBEYXTXijMZBLx
	UlshkdieY7gZGq5Y0nUE9ANl3AoRQkMhMVoUIAX8FoIOqbA5/ObWYvbaUPUB1vzZo3Gu
	UbzWL+dXrZJo95KsLAFjlGVNieSOboItt06aUfXlN0h8YdYxf5or8ADoNFhe+OBEy6P3
	jaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WUZ0WJpoP6M45K4WU1OMQUQQ23gucGVmyC9SEUSDr8E=;
	b=cfz9TCXFIJSeTc6jfugqNCzhoZVCd34J0KyN/TFjtdUxilVjGw3HcX00FlYV3ZhyKC
	AesyNdjUsSTdty+EyCNpfLbpQ1fjeLunizqApvfwdScisCPODBbV8JkV/DZKt3fBkR8w
	qKTcBb3T+iADOXwaxegLu52FtyPkMpkcGpruw8nPUl/GeYdXB1uJAOC77VVmL4BNmh/O
	yT5G+aM3524FWQf5aT7hTKBN2Ka2oV5LV7AV6Wvyz0uCcdeGH5NWLOual7J5//fK4wNy
	2C5uMs9y6e5C3hG9NXVFUtGp1btll9GOe2hYFAKLdCVBlVQx4gg3uPFMdxix/52G8aAg
	K5hg==
X-Gm-Message-State: APjAAAWz3vaF93EE6UFUys4AqcmsvQaEhQ/fD2McCKCnYpc8Nnz74NON
	0sfz4I1Ak4RarNYRtUwOfF8hCu+hFNCx4SOHGS8uHQ==
X-Received: by 2002:a9d:61c7:: with SMTP id h7mr1360690otk.363.1551803845327; 
	Tue, 05 Mar 2019 08:37:25 -0800 (PST)
MIME-Version: 1.0
References: <CADYoBw1HTzqTjfyDgDbP042AH1EkS1DD7Sf4um8eO7d22t4CDA@mail.gmail.com>
	<CAFEAcA9UzFdyAFkAuWzcV5x1JDBCTVr=okdLN-MpiduvACt4tw@mail.gmail.com>
	<CADYoBw3yj9yuxUSFuwCqKbTZNFFDF7Je4Kgxt-Rvd71x3JusQA@mail.gmail.com>
In-Reply-To: <CADYoBw3yj9yuxUSFuwCqKbTZNFFDF7Je4Kgxt-Rvd71x3JusQA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Mar 2019 16:37:13 +0000
Message-ID: <CAFEAcA_N83yo8xV3hCpVPFOhQj+R95+8fVePjEXgxKZtQPUP3w@mail.gmail.com>
To: bzt <bztemail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH] Added periodic IRQ support for
 bcm2836_control local timer
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WkBuoJAUeT2l

On Mon, 4 Mar 2019 at 19:27, bzt <bztemail@gmail.com> wrote:
>
> On 3/4/19, Peter Maydell <peter.maydell@linaro.org> wrote:
> >> + * The IRQ_TIMER support is still very basic, does not handle timer
> >> access,
> >> + * and such there's no point in enabling it without the interrupt flag
> >> set.
> >
> > Can you be more precise about what's missing here? I didn't
>
> The local timer (as per the referenced QA7 doc calls it, section
> 4.11), means 3 registers in the ARM Control MMIO, at addresses 0x24,
> 0x34, 0x38. Please note that I haven't named IRQ_TIMER bit in the
> irqsrc and fiqsrc fields, that was already defined. This patch
> implements that one.
>
> > see anything in the spec that looked like a register for
> > reading the current timer value (though it would certainly
> > be usual to provide one).
>
> Those are registers 0x1C and 0x20, called "Core timer access LS/MS",
> section 4.3. I'll make the comment more clear. Those are not local
> timer IRQ related, because they could use a different frequency than
> the IRQ, just happen to be enabled with a bit in the local timer's
> control register (and not in the core timer control register at 0x0),
> and on real hardware triggering an IRQ requires both the timer enable
> and interrupt enable bits to be set. The timer counter is a 64 bits
> one, while the IRQ's counter is only 28 bit wide, which cannot be
> directly read, does not use the prescaler, and it's reload value
> stored in the local timer control register itself (unusal, but that's
> how it is).

OK, so that's just an entirely separate timer whose control bit
happens to be in the same register? I'd assumed that the enable
bit here was so you could have the local timer be running but
not generate interrupts -- in which case when it expired it would
set the "interrupt flag" (and reload), but it wouldn't assert
the external interrupt line.

In fact thinking about it that does seem like the more plausible
reading of that specification:
 * bit 28 (Timer enable) enables the timer
 * when it gets to zero we set bit 31 "Interrupt flag"
 * the outbound interrupt line is the logical OR of
   bits 31 ('interrupt flag') and 29 ('interrupt enable')

Are you sure it doesn't work that way ?

I'd have thought that any enable bit for the "core timer" would
be in the core timer control register at 0x4000_0000. Since the
"core timer" is (apparently) the source of the clock for all the
per-CPU architected generic timers, it seems more likely that
it just runs constantly without an enable bit.

thanks
-- PMM
