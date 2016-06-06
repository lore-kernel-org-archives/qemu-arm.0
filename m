Received: by 10.25.27.66 with SMTP id b63csp1515209lfb;
        Mon, 6 Jun 2016 07:22:09 -0700 (PDT)
X-Received: by 10.55.104.213 with SMTP id d204mr15968474qkc.208.1465222929171;
        Mon, 06 Jun 2016 07:22:09 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t2si12185947qha.66.2016.06.06.07.22.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Jun 2016 07:22:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42756 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b9vPs-0003x6-M6
	for alex.bennee@linaro.org; Mon, 06 Jun 2016 10:22:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b9vPp-0003wz-5O
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 10:22:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b9vPm-0002DA-VO
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 10:22:04 -0400
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:36110)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b9vPm-0002Cr-Rq
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 10:22:02 -0400
Received: by mail-vk0-x22e.google.com with SMTP id c66so47593972vkb.3
	for <qemu-arm@nongnu.org>; Mon, 06 Jun 2016 07:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VKr1y14kID5thpOvGaYmZXTc6h5Kh9aMzxNuHPGHHUo=;
	b=ZeatHk3A/xceYWyNVM6OSeISY+rkaUjAN7WTkxIo8BgJveJU8fpdVDyDRvliKhusiV
	1qnOrX8F3gC+YmbA7wSh2cswp6YRJUcCe0Cb+G/onBBxk4mAD4uIdJHeoDyvbzbnKe3X
	09JCebjR0LkS8x3ogdJvXSzHswKMfLW/lJARI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VKr1y14kID5thpOvGaYmZXTc6h5Kh9aMzxNuHPGHHUo=;
	b=VTxYLzxMMVO9Np2Box1W2k/i0HjBS9UHC6i3rsZA9vMkyYFHsWodNNBMgUcdWfh0O+
	QZu8RRFNb5Z0sIa5QiM1DMDgfU5y6DWT1GjpJyUDH0yOhEri4VoqiUNGVDQkcvadwQE9
	ZYB8VHuilKVVGpDWOM2PvQvDyu5tq6yJ6ehy1GlAPJZAjzEzpQrNO86706qhiiajmBEB
	1ND4Qvi3lpLjILzPb1OEIKIA7gNxfJtd7jTcZfhTM1+Mu54J15prZF1CVpm3SlOBRWf/
	12fMmzEvyDpBQFuJDqLki4gN5TMgVmmUfMTsCWOAZaMZUEBwnoiPAB1tFfVIwuq/uwwz
	fwVQ==
X-Gm-Message-State: ALyK8tIMjqWEDK8jizLqOAJv3JhlzHqLNZmdwKP2z5+ndh78AmxxZ/3kfR5p04f6x8Wb9c8zrKDFAS6bEhRlSmmr
X-Received: by 10.176.0.146 with SMTP id 18mr4255504uaj.17.1465222922413; Mon,
	06 Jun 2016 07:22:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.67.65 with HTTP; Mon, 6 Jun 2016 07:21:43 -0700 (PDT)
In-Reply-To: <1464974151-1231644-1-git-send-email-afarallax@yandex.ru>
References: <1464974151-1231644-1-git-send-email-afarallax@yandex.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2016 15:21:43 +0100
Message-ID: <CAFEAcA8PZ-vStnppShCOjoya8iwD9==LBK-Jn0JZBUftxA_mkw@mail.gmail.com>
To: Sergey Sorokin <afarallax@yandex.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Subject: Re: [Qemu-arm] [PATCH] target-arm: Fix TTBR selecting logic on
 AArch32 Stage 2 translation
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
X-TUID: vRwbP977zGIc

On 3 June 2016 at 18:15, Sergey Sorokin <afarallax@yandex.ru> wrote:
> Address size is 40-bit for the AArch32 stage 2 translation,
> and t0sz can be negative (from -8 to 7),
> so we need to adjust it to use the existing TTBR selecting logic.
>
> Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
> ---
>  target-arm/helper.c | 38 ++++++++++++++++++++++----------------

> @@ -7348,15 +7354,15 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>          }
>      }
>      t1sz = extract32(tcr->raw_tcr, 16, 6);
> -    if (va_size == 64) {
> +    if (aarch64) {
>          t1sz = MIN(t1sz, 39);
>          t1sz = MAX(t1sz, 16);
>      }

I wonder if we should move the extraction of t1sz into the preceding
if() -- then we could do the '3 bit field vs 6 bit field' thing the way
we do for t0sz. Still, that's a cleanup for a different patch.

Applied to target-arm.next, thanks.

-- PMM
