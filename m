Received: by 10.28.91.67 with SMTP id p64csp2684994wmb;
        Mon, 5 Mar 2018 07:45:45 -0800 (PST)
X-Google-Smtp-Source: AG47ELuc0/4d2Tfv/NiNyHEWKaEOsd+Aza6yDK9pXb/AL2RsNOMXpk8rCfgl3eEiPUbUvRXqTZZ1
X-Received: by 10.129.129.194 with SMTP id r185mr9674190ywf.313.1520264745174;
        Mon, 05 Mar 2018 07:45:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520264745; cv=none;
        d=google.com; s=arc-20160816;
        b=YmGcuX9lqmkGa9pfxIl+hvtdQVDGlX40lLs7DXy7vHG9IAbEOpe/XDmndTC3r6bCMI
         ARTzSMunPrCGiYrw3oSGuTJYi31phROSDlc3CWdJ4FzlB9UsPJvDJzTIxxjBAuGpjrRq
         s+HC68OYH7LRurTbbB95z76GqhrdoLu3qRThyElzlj6gj4VhlCHWh6YrARyDWPmVpLAl
         avGiLOJ9r8RCRT9XihcuGd9PK1ZwrV5x5Bc8EJ9NfF6Y95G00W3jUZ+0WB80HJyScUaZ
         iCpDJbcAYqDsixIomSDuUK2ZOfDKrzYTs3c5PWKuus7GHSgTIaRZ3huKFQRh6/8LEOg8
         wYSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=6RsZ4W2qIZCqqvD2ILK9VfxHIpAvcclQ/c42auaf2ts=;
        b=BuNDBXIf1wZJhjfFbYjAXvqRvtEim7bXDwtYqDzgK9nEBnPD+lsY1bj4McwvjXTZ/c
         8mGn/D/N40SZdkFJO2ur+UQZ+9NGLwVyPdB7krlGo6n3zn8RdUZKlzgJmYb+D3VVtFae
         JcHsg30LRq5q/5Pbk4dOJKC8X1JHfg2NMI888ENESQJCc9BNn1dYsldNiG1+RuwGOLV/
         8GNSvwwDIApI6OWCJtpLzQ9h7RVCypCY645nD9wcgCG0gi8hO0ILu5XAdwHPXb34Hn5C
         mMBPF4EjnbMU282kuH953ZrVJsg3mQGozg9IT3qPZYua1NZMcM8sO2AMlPkoYofWZmqL
         xiDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=agEEJhsb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n186si2136902ywf.531.2018.03.05.07.45.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Mar 2018 07:45:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=agEEJhsb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50056 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1essJ6-0002KB-K9
	for alex.bennee@linaro.org; Mon, 05 Mar 2018 10:45:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44691)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1essI5-0001XF-7D
	for qemu-arm@nongnu.org; Mon, 05 Mar 2018 10:44:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1essI4-0007vS-FP
	for qemu-arm@nongnu.org; Mon, 05 Mar 2018 10:44:41 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:42180)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1essI4-0007vC-AG
	for qemu-arm@nongnu.org; Mon, 05 Mar 2018 10:44:40 -0500
Received: by mail-oi0-x241.google.com with SMTP id c18so12333638oiy.9
	for <qemu-arm@nongnu.org>; Mon, 05 Mar 2018 07:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6RsZ4W2qIZCqqvD2ILK9VfxHIpAvcclQ/c42auaf2ts=;
	b=agEEJhsbS869XBpRPTsVQHw+ZRU82/bLy/MdXIq8LjD51FU2bHmxF+qx04GlWwXqzb
	FgrcFt6YTIW67sKQ/k6IpqRvucyoiJ9lHwghHjypfU5OI3rkB1640YMjPW9UQlPLYaDg
	GfZOexf5dArO0cV3Npy+49N4emiT7hOFuH9IU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6RsZ4W2qIZCqqvD2ILK9VfxHIpAvcclQ/c42auaf2ts=;
	b=NzQmmoVybfA3Qp/fMTO1p34lGMNk3i43x/d+7Cl44rzFwrvMVKYcict7vBSmY9iRH0
	SLjXG1fknlfmMTy/E4cV9khZhKIkuhKctoEArEXt9rdigkcbqYslTezsrm/Uf2oHQdcw
	JQzzVlJ9mEe5wGDr3m7bEemkbJ4o+yheEIFLUo9qaW1yYq0XtevmsysyHPx2rcSjAHtb
	2sap7uYZk9J91+DSChRLmzPDMa5q5qAspEzGZHPJuRxE+QGIM1ySp/oP5+RgCOJ9GoFG
	TITsmvHSJax2RUlEB5daPVENW4qeNBCZ402crfI3/VLtpNRBjYCpl1FN3EN/aj3FpzIG
	24DQ==
X-Gm-Message-State: APf1xPDR1NT3+vnleL/Ik1acdRuHMgOW/kT19l6aeLuWVGoMY/gXjCml
	m0BkhytMdiulrCotENepgx2ZG5YeJrL0KlUq/TpxKg==
X-Received: by 10.202.90.138 with SMTP id o132mr9050308oib.11.1520264679560;
	Mon, 05 Mar 2018 07:44:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Mon, 5 Mar 2018 07:44:19 -0800 (PST)
In-Reply-To: <20180303143823.27055-6-richard.henderson@linaro.org>
References: <20180303143823.27055-1-richard.henderson@linaro.org>
	<20180303143823.27055-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Mar 2018 15:44:19 +0000
Message-ID: <CAFEAcA_Fp4nvXDW+UucRw=vEF8DwniwsfhnC0KdumBA8OF294Q@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v4 5/5] aarch64-linux-user: Add support for
 SVE signal frame records
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HgpUkOvhicCq

On 3 March 2018 at 14:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Depending on the currently selected size of the SVE vector registers,
> we can either store the data within the "standard" allocation, or we
> may beedn to allocate additional space with an EXTRA record.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/signal.c | 210 +++++++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 192 insertions(+), 18 deletions(-)

> +static int alloc_sigframe_space(int this_size, target_sigframe_layout *l)
> +{
> +    /* Make sure there will always be space for the end marker.  */
> +    const int std_size = sizeof(struct target_rt_sigframe)
> +                         - sizeof(struct target_aarch64_ctx);
> +    int this_loc = l->total_size;
> +
> +    if (l->extra_base) {
> +        /* Once we have begun an extra space, all allocations go there.  */
> +        l->extra_size += this_size;
> +    } else if (this_size + this_loc > std_size) {
> +        /* This allocation does not fit in the standard space.  */

I think strictly this runs into trouble if it lets us put something
in the standard space that runs right up to the end marker and
doesn't leave space for the extra marker, and then the next thing
can't put in the extra marker. But this won't happen in practice,
so I don't think we really need to try to handle that.

> +        /* Allocate the extra record.  */
> +        l->extra_ofs = this_loc;
> +        l->total_size += sizeof(struct target_extra_context);
> +
> +        /* Allocate the standard end record.  */
> +        l->std_end_ofs = l->total_size;
> +        l->total_size += sizeof(struct target_aarch64_ctx);
> +
> +        /* Allocate the requested record.  */
> +        l->extra_base = this_loc = l->total_size;
> +        l->extra_size = this_size;
> +    }
> +    l->total_size += this_size;
> +
> +    return this_loc;
> +}

thanks
-- PMM
