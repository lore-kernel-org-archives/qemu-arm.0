Received: by 10.28.173.206 with SMTP id w197csp2587025wme;
        Mon, 8 Jan 2018 07:20:33 -0800 (PST)
X-Google-Smtp-Source: ACJfBotdxoEvlsVm1ERVz1mwAVkRmgTnNRHiAfs16+CCYVEKuz9DRnh4cn1s+oYd8FS4EKoCDWim
X-Received: by 10.129.242.13 with SMTP id i13mr10777291ywm.75.1515424833136;
        Mon, 08 Jan 2018 07:20:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515424833; cv=none;
        d=google.com; s=arc-20160816;
        b=uAxmszhjmGbtxAFmkXLe8aluSEC06j0kH4bQ4XUePHesd1RocLcu4VwychFkgZfxfB
         0mUJiTPx//CJapmnjuNMuwcYrl3ThJu8DKKPqwHOg0fi8GXBXrH6F4bptsMDpbgf3QzC
         d+WTsuKhB1Fd/e/bMkNh7+ECbcG97qSfheSrcvcSynoH5g+s+V8yqHKQ0TPEup9QVal8
         RIHf3PsAMv+ebgrwpSkKXKA7Z4u0w+1eiWB+oUYzrPbqHjy5pO3V9BvinJy3usg38CiN
         DhLjyB6QB9rNg+g1RU9tMrN+MaUjFveSKrLN0MeZHLzbjarSQHdzTpdBj1dLIcezg4VJ
         uRYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=D4zzcNVu5O9jrGHckyWPeFqC+rG7qWYkpJIUD3qr1+w=;
        b=0lDTnbB6wKsXM14SMThLGxAjvlzl4K+0mODDP0we5iYpF3vonykPdMnV5oB7p55eq0
         XhmjNo6hbCbgfyJ/8SRpIR9VrvHBG/+WhR+gNhyviCGPe4y+iVVjivB0Kk7euvgdhlK8
         MkbGuynYuRwHYX0q19HniFsiLP6br/4zFJAaVvR72xYIZJ3P0WgaqoY7wY9ByVME4KBj
         Lcmm3CuBf3cFdmvUpk1+O9jkdIsU86FWV7Uv19f93HJyWB1liCptWpja28goxPG+GQrO
         a6DTPYeQ84kRUeCQJeBCc0aMmdEnx8fJpdOfMpuazE3QPHaArskWcSdlittPdF8zDenZ
         VfbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E61Os463;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f184si2523873ywa.735.2018.01.08.07.20.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 07:20:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E61Os463;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40039 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZE0-0004ba-Ju
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 10:20:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYZDp-0004a7-En
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 10:20:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYZDo-0007bn-Ey
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 10:20:21 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:36343)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eYZDo-0007bS-9k
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 10:20:20 -0500
Received: by mail-ot0-x242.google.com with SMTP id w4so9480088otg.3
	for <qemu-arm@nongnu.org>; Mon, 08 Jan 2018 07:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=D4zzcNVu5O9jrGHckyWPeFqC+rG7qWYkpJIUD3qr1+w=;
	b=E61Os463bDj5qoPqKqCvkJ8AyaLh0geNn7SB+FXgz14utaFD52cNKt6fj2GaJzhp8v
	/FjTj/Z6wzdOLzZZJc0Fe2IhiUr6zEnd7NMfnb9nRCW/qDBDzgl42WxRGM5kgZ055dUY
	jyWwWPC02aoVrtAMjqSGhJl7B8oSSMbZM+yKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=D4zzcNVu5O9jrGHckyWPeFqC+rG7qWYkpJIUD3qr1+w=;
	b=FPpvhQrNZsPJ0MfZPUn85lWUT7ZrjjotbryLiHpEYg6MB+r+ev3Qmn+zCGvdefTVfi
	q6LjvwkfWCqRVGrdL0FFee/eeLPx//0vjDYekABgVPUnD2KpZxiOYgIuAXaS48VHIfUL
	psPLl9dprq8wB/KQOYpSyhQPlo76NkDjZtHfwjEMGvspHMYI9GyDtdYT4/AkTVhSIv9r
	NwE4XNLqLBPaDAfVuzggZ7y0CM7qZFDSWex3ir7DcoaV8Dc7Csmkk8X7o+a0UTgBp+ik
	Bu9HNqdyhfyNEVRhG6yMniQdZB12YtdEpCafBY8Znht5XbGcAqKPCoFIjW7xOEWygKkm
	FcZg==
X-Gm-Message-State: AKwxytdTFlYXvuZKzVxDux3LELLC9LMUb/7VHy05A3o/6rpwVLctBqeO
	GZwW+MBEkPz69kAHsYPbsbZ7endOwpMEJNezIz6qTg==
X-Received: by 10.157.52.236 with SMTP id t41mr6681175otd.54.1515424819669;
	Mon, 08 Jan 2018 07:20:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Mon, 8 Jan 2018 07:19:59 -0800 (PST)
In-Reply-To: <797fc842-813f-77dd-959c-2055ee5e2b90@amsat.org>
References: <20180103224208.30291-1-f4bug@amsat.org>
	<CAFEAcA82rAEcG5RH3LxVTHqKpEVDqL+mnW=NfoW-bQ=_VxoHEQ@mail.gmail.com>
	<797fc842-813f-77dd-959c-2055ee5e2b90@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jan 2018 15:19:59 +0000
Message-ID: <CAFEAcA8=KPXJWEjPYFPWd0BGmkh-h_H=SJT9LKfmLSfsARkNkw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH v2 0/2] pxa2xx_timer: ignore incorrect
 registers access to use U-Boot
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Fam Zheng <famz@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mH+tGnD52P3k

On 8 January 2018 at 15:05, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> w=
rote:
> I'm adding a sticker to my monitor "build with
> --enable-trace-backends=3Dsimple" before sending a series with new trace
> events.

I think it would be better to try to harden the log backend
for trace and our log.h so that we get a compile error for
this mistake even with the log backend.

Something like:
 * pull out the bits of log.h that generated trace.h needs
   into a new header (log-for-trace.h ?). I think that's
   just the LOG_TRACE define, qemu_log_mask() and the things
   qemu_log_mask() needs
 * have the generated trace.h files include that header
   instead of full log.h
 * have log.h include that header

That should catch almost all of these "forgot an include"
errors, I think (since almost all uses of log.h from C
code will want one of the other LOG_FOO defines).

thanks
-- PMM
