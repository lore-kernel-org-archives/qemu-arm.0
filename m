Received: by 10.25.21.96 with SMTP id l93csp1117457lfi;
        Mon, 27 Jun 2016 06:28:19 -0700 (PDT)
X-Received: by 10.237.57.41 with SMTP id l38mr23031270qte.74.1467034099531;
        Mon, 27 Jun 2016 06:28:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y7si17109807qtd.128.2016.06.27.06.28.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Jun 2016 06:28:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58687 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHWaI-0007S8-Uu
	for alex.bennee@linaro.org; Mon, 27 Jun 2016 09:28:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHWaD-0007Rv-8z
	for qemu-arm@nongnu.org; Mon, 27 Jun 2016 09:28:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHWaB-0004ma-DF
	for qemu-arm@nongnu.org; Mon, 27 Jun 2016 09:28:12 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:35318)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHWaB-0004mM-2q
	for qemu-arm@nongnu.org; Mon, 27 Jun 2016 09:28:11 -0400
Received: by mail-vk0-x22b.google.com with SMTP id j2so231635027vkg.2
	for <qemu-arm@nongnu.org>; Mon, 27 Jun 2016 06:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wcZJRnETVmE5ZSImrMpG7/KZ2ZMZDDjqlw3POsc94FA=;
	b=K+zuJXsE7FOHsmsSbjrpWTSxh7YbMcPMothXDKqK/0V6RqMPFbpIAa4CYoidLKE+Gs
	a/jXleOjNTvCa82LS7gMl7JPoGyb8S8gEl5+GNUzQJZ3sZFvMiEjk5JvPcGi/oyulLaf
	EUU45e+rysOUmsh/Y3jOUKKwJZpNPg6NkV+7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wcZJRnETVmE5ZSImrMpG7/KZ2ZMZDDjqlw3POsc94FA=;
	b=iM7o0RgvX16MCXwmyT5Veht/Lb+AfV5MR5lCX4Ia1DAj77IYeezy/PC+L7N9FtihLP
	YYnXcoWODUE9mtA5lnHgOqIIxL/Ju8AepJS9VDIdK4spAKTSaUp26g44xxW7pPiIzxsH
	wH3Vr/lHNl92K8/Zfu8j+o+g6rgJfizAnssnZ70U/75nm9upEGiHL9BsA4/UL3RejHSk
	w7DDTHSsgNGSzGCctp7nIHSHtTPmLTd0CIdhF+AD8gLieYAlSShSbj9n+7cRc3AoK4Iz
	dI+zpPtNxgaFN+C03C4eXMDtURillaUt3JL1ktSxx4jshhLMx6gylE1o89Ej5YnJ+Juj
	gxXg==
X-Gm-Message-State: ALyK8tLgK66KujHji36jq6XXJU5fuMqJgOwzVLlf5lYtebNZ4J748z5ESbeyWF9lyaHw2j98wTHmn2O165rO9J2A
X-Received: by 10.176.65.106 with SMTP id j97mr8573773uad.64.1467034090513;
	Mon, 27 Jun 2016 06:28:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Mon, 27 Jun 2016 06:27:51 -0700 (PDT)
In-Reply-To: <20160625123521.16752-1-digetx@gmail.com>
References: <20160625123521.16752-1-digetx@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jun 2016 14:27:51 +0100
Message-ID: <CAFEAcA8HFfuEHP-d8+H3DC06+RpjjXqQoCX81w2Yr+Txsn5fSw@mail.gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Subject: Re: [Qemu-arm] [PATCH v2] hw/ptimer: Don't wrap around counter for
 expired timer that uses tick handler
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mdo1gYvthKez

On 25 June 2016 at 13:35, Dmitry Osipenko <digetx@gmail.com> wrote:
> Software should see timer counter wrap around only after IRQ being triggered.
> Change returned counter value to "1" for the expired timer and avoid returning
> wrapped around counter value in periodic mode for the timer that has bottom-half
> handler setup, assuming it drives timer IRQ.
>
> This fixes regression introduced by the commit 5a50307 ("hw/ptimer: Perform
> counter wrap around if timer already expired") on SPARC emulated machine as
> reported by Mark Cave-Ayland.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  hw/core/ptimer.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
> index 05b0c27..8006442 100644
> --- a/hw/core/ptimer.c
> +++ b/hw/core/ptimer.c
> @@ -93,10 +93,10 @@ uint64_t ptimer_get_count(ptimer_state *s)
>          bool oneshot = (s->enabled == 2);
>
>          /* Figure out the current counter value.  */
> -        if (s->period == 0 || (expired && (oneshot || use_icount))) {
> +        if (expired && (oneshot || use_icount || s->bh != NULL)) {
>              /* Prevent timer underflowing if it should already have
>                 triggered.  */
> -            counter = 0;
> +            counter = 1;
>          } else {
>              uint64_t rem;
>              uint64_t div;

I guess this fixes a regression, but it looks really weird.
Why should the timer behaviour change if there happens to be
a bottom half present? That should be an internal implementation
detail. It's also a bit odd that use_icount is in the check:
that shouldn't generally affect device emulation behaviour...

thanks
-- PMM
