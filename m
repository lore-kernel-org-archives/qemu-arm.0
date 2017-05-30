Received: by 10.25.0.6 with SMTP id 6csp1783842lfa;
        Tue, 30 May 2017 05:05:42 -0700 (PDT)
X-Received: by 10.237.33.220 with SMTP id m28mr22433514qtc.33.1496145942432;
        Tue, 30 May 2017 05:05:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496145942; cv=none;
        d=google.com; s=arc-20160816;
        b=RpPgP7qTZTy3bg03Avty5mMUkMA67T/pfNOleT4EoaqnJyv/6atA1TShgaYbFMXBgH
         zjnkTLFD0CXmoo+eKzaTJJmNPmaiSnV2UjF78cUBdq8X4XJrmepVtPbxb6+mTvywusln
         bIJYsDtD8sFmTUav1foxO8jnWlgUEF/UPWyiyB38F/KsXVke5K/p2UMZGhA8tAlgcHYz
         cfo7fJHtJjCkbgsVwhl5XvNgfxHKxvks4S7z3oo4xmNoE2/m+YOiVe4RbLevVF8+aDEU
         gXGsyNfQ4juO3Gn5CwTy9N8UecbEIKnfibDvGTTU+dv+LJaJCnLB8va5NPpgZ83JaRIB
         SqcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=TvLl2F5NjZmFChHpkH8BRLnj+gURQcVYfcVkCncEcCY=;
        b=dIIPa/u5pDIw+CJpNZf+ktMFsPoz86rG4RiaV4VdNULg+D5CIw2qJmAWF+qDARmT/3
         IVNeXidBR+L6/AO4ODGhL66+TrwqqOtlESI0XbdCUFzs+NFP2TTlmZBcpEXCwEsYKZLL
         DZzo4U62l5VTkNJWY4lInPdogLurEmeNnHcfUpI15d5AjwE33d0q04QuJJn8LJWxGfea
         5p7LpfiMsMteO/pnA2Zo1IKaGfiktgoDFPPKM6Xlp3cJyR/tkysbc0ZOIbaSZtdurNRQ
         ulkc5nmeNyOhj+jF+F6ICs2xA259EVu5Z2IORQSwItspTb7KvWtnoWAEM7ODWGoKtZdp
         4aMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 127si12624844qki.5.2017.05.30.05.05.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 05:05:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53457 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFfu9-0004h5-U4
	for alex.bennee@linaro.org; Tue, 30 May 2017 08:05:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dFftH-00045n-87
	for qemu-arm@nongnu.org; Tue, 30 May 2017 08:04:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dFftG-00019y-Dz
	for qemu-arm@nongnu.org; Tue, 30 May 2017 08:04:47 -0400
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:38175)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dFftG-00019m-7x
	for qemu-arm@nongnu.org; Tue, 30 May 2017 08:04:46 -0400
Received: by mail-wm0-x22c.google.com with SMTP id e127so97632968wmg.1
	for <qemu-arm@nongnu.org>; Tue, 30 May 2017 05:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TvLl2F5NjZmFChHpkH8BRLnj+gURQcVYfcVkCncEcCY=;
	b=C+V9pmdyUQWmIOltw+UZRAMmWVFWjLTS7TP223PZKWAFVwHlaPPBNbZA8Bc4o0O1yA
	4sYUh7tJrlr1mmpehdzz108XsLkUA5TNfo1oVM86e+F9+TDJKtiA3cxu6mcHtm8fsmBS
	WckSjS7Bpil9v69nxyogCqXVSsFb8mlWRI5N8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TvLl2F5NjZmFChHpkH8BRLnj+gURQcVYfcVkCncEcCY=;
	b=QWWEzT6lZGidMGWSbMgEdCHP89htqIFIlp3E5rMlTr5ZRjohU78cL5wdzEm0adq05D
	8eP+SNPJ0ByKbP+lGDONYlIUmeL5nNktW1vEJZuEgCTkKMFqNbcytUJQ3sPYnIXhyLOn
	AS9oyXqZDA1BG7c8M4zm5ffe8HjBQnaH+f3M/9m7TMCyZRXsgKk+lETPNuxIa5qzn6YK
	nOOMoQVUe4KFomW+Lbkn3wZzNw4IsJtXH6uyRq5beTqur9h9Hj9u3nzZxvpodmxzA6rz
	XpKOFc9i2muu18mpqqbLRCGO+Y2sFMye5OqNaS66gJi8gIDY7dwB/mclxYk6XIF8CY9W
	JnFQ==
X-Gm-Message-State: AODbwcA30GLSpV1gbSNqACr/qKogc8lY2mP71dk+LdUD5iaH4QQB8lLV
	s/d8OJUlmr4+QDlk6wQEIXS1OtIPmnEs
X-Received: by 10.223.156.26 with SMTP id f26mr13433353wrc.187.1496145885155; 
	Tue, 30 May 2017 05:04:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.135.82 with HTTP; Tue, 30 May 2017 05:04:24 -0700 (PDT)
In-Reply-To: <20170521152949.15338-1-krzk@kernel.org>
References: <20170521152949.15338-1-krzk@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2017 13:04:24 +0100
Message-ID: <CAFEAcA8qYBAgHWPGdSTry7Rmt1Ai9gmKXdKs+f_x_jQU0+7c5Q@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22c
Subject: Re: [Qemu-arm] [PATCH v3 00/11] hw: arm: exynos: Bring up secondary
 CPU, QOM-ify Soc, other improvements
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uLrBH6qp7abl

On 21 May 2017 at 16:29, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> This is a collection of three already sent patchsets [1] [2] [3].
>
>
> Changes since previous versions (v2):
> 1. Patch 11/11: set BIT(8) in PS_HOLD to fix power off on Linux v4.12-rc1.
> 2. Add reviewed-by tags.
>
>
> The first patch in set is a bugfix which also exposes problem of cpuidle.
> Kernel compiled with disabled CPU_IDLE works fine (two CPUs, coming SGIs,
> poweroff working) but with CPU_IDLE it behaves bad due to low-power
> mode (AFTR). This was discussed at [1].

So is this a regression compared to our current model? I was
under the impression from the previous thread that it was,
which is why I didn't apply that patchset.

thanks
-- PMM
