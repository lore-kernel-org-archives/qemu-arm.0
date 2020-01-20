Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp285120lfp;
        Mon, 20 Jan 2020 06:46:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqysUXhjKH1OaZJnWjVtBvrEC7HqjeZKyfkT1MtH7AlN2kfSqgYVM4Pf17LqO1nVgFhmsB6v
X-Received: by 2002:a50:e046:: with SMTP id g6mr18099601edl.172.1579531607317;
        Mon, 20 Jan 2020 06:46:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579531607; cv=none;
        d=google.com; s=arc-20160816;
        b=Ysj4Vpvv+IrA5WD062vpxJuXYjCNEm8/knuI5I0lHGfjJ9DDqsnycnzHbLhJKK3bMy
         VBI5heDWUMRJ0/uBxYrd3j9EGaAvP8G0ZuVYEquhzcs11M0T6eMvOcNRZh696hiQSijb
         9D2eY0Ra62Nr/sPLVQTO9htHaht4eUYplnqWeRQMI32afBt3m7fcQHtKt3ccgyw7wXu5
         GkMHRsoYnH3C3TxYm1Up2RvW+BI0jUo9CtBU3DlLnV/ALButejGpEFIC6T0pASAfD2nC
         tbhTgc6Xv7K7anOmkDbbwooPxUjyUtm2FuA4TO4PxnyeD2rDn93/a7AW3Fp2j3aaHHl1
         qTPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qOK8VN1mzP/WyTATLIzeey0kgoT/JaPleiDvZFbnNDQ=;
        b=Ft35BoYEJ9wxWzL8PbZcEdZBvuqmS0VujPJVFxrZldOIxrw5zoJxkYN4W5qhtUnQHO
         9eFwc2MYl4Gda3qugdZQ0hJ8siofaQHeHIcvueYpUhtN4zBsSb5sIOpmz+VHwgfaFXvC
         lgTM0S1IXn3XHeHW6+yBPrtdMZvtuUuYOLwUOA4F06V78Eg/HzPQKT0X5M/UHGJKY6OI
         6BvBrTlVKVamrJuX4Mk6JJ1WkeeaKmqupJs02hZlz/pYXD5LQLEJQuPAhwbxKrdMpdcR
         1GTSSQZ6mEXkFGC5ukwKMu1knsz3t30y1UgdRZlnPFj5U0GCwibnsCnaWv21C4txK2/y
         1yVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rfXPmkAs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bo24si22069450edb.331.2020.01.20.06.46.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 06:46:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rfXPmkAs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itYKE-0007Sm-DA
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 09:46:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43661)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1itYJx-0007Pu-PG
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 09:46:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1itYJw-0004rA-IP
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 09:46:29 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:34113)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1itYJw-0004qj-DN
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 09:46:28 -0500
Received: by mail-ot1-x341.google.com with SMTP id a15so28884318otf.1
 for <qemu-arm@nongnu.org>; Mon, 20 Jan 2020 06:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qOK8VN1mzP/WyTATLIzeey0kgoT/JaPleiDvZFbnNDQ=;
 b=rfXPmkAsvFAoKRd7hT6Rx6u4FyP/fGq/0VjsY6mDK01YjllLh9YT+B379As1nIpUDw
 rj71JAlak8jkYwMoKcKw9fxriX1VhWnZZ0bZaBZ5B/85rX7knp9kFhwMDsa1mYGgUmw5
 Sylpti/R5wf3CJEO24B/+jt/0/s66/hxKtBGWblSbFsWyZbdjE/Xwb1GOYa2CrlGC8A5
 la/WWx02EyobqJIpzjOlyjG/TG3guI1BiQWEpuzWeEk50v3cxwetPyiyMpqMZC+FEPbB
 ajUUXe242aisSzKj4eTE+I5WF+GnwIv6c6x3h4SkfcqWsdJYH6WWvlwIGo2QP+5yHVM4
 8D/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qOK8VN1mzP/WyTATLIzeey0kgoT/JaPleiDvZFbnNDQ=;
 b=bx+NAKqfnCUsOAOSd8+CzE4WfpRQDGRMFNKBNkrDvBl+wIkQmPuNz0hsEXYXv3+pc0
 0qY11QsmB92NjTWU6Px+5Lts5qzCalxX53IZXdPR6zpbF08te7RykFGAby2x/OPELQ2M
 kQZnmkOaGqugJPA1b0BvJReklhDxU3aROwnd6b/24qBIfRwU1aX31YZY9z1zUC6bF7KW
 nWG2PYlXUwn7CgGWR6sjrqZxliOAhI4x8zGnmBOgVvDe5D5tgUIr7ZT4Q0Ymf6fkqYg1
 UnhxG7AkTnoteIqS9sj6v3h3ZZukZTm+05z22t971Y/EH+9jowPqa6RYd9VE9FF8IEc/
 mWzw==
X-Gm-Message-State: APjAAAVUfmE7v9+uvRjL0JzoGI/N2wu61rdQXnLFvrNAI8VCCg1dG1Pe
 Bv8TLSPkgJA4xLpo3hCGkuYIe+VegqPv2B++fDoDjA==
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr15344821otq.97.1579531587455; 
 Mon, 20 Jan 2020 06:46:27 -0800 (PST)
MIME-Version: 1.0
References: <20200118164229.22539-1-linux@roeck-us.net>
 <20200118164229.22539-3-linux@roeck-us.net>
 <CAFEAcA8yH8deTL6PrX42Lh_TbR=gx4QbukuKUOo1XgLod=2ZXg@mail.gmail.com>
 <526c74cf-bbaf-2c79-08ec-9472288aaa59@roeck-us.net>
In-Reply-To: <526c74cf-bbaf-2c79-08ec-9472288aaa59@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jan 2020 14:46:16 +0000
Message-ID: <CAFEAcA8j=RnrBcoJzpYJZcLUgyq4N-o7TVKhutoDR27idUu-1g@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] hw/arm/exynos4210: Fix DMA initialization
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mmWuuzcWMN0F

On Mon, 20 Jan 2020 at 14:30, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 1/20/20 5:35 AM, Peter Maydell wrote:
> > As the comment in or-irq.h notes, we can safely simply bump the
> > #define value without breaking anything if you need more input
> > OR lines than 32.
> >
>
> Yes, I noticed the comment, and I did that initially, but then
> I noticed the complexity of actually doing it in the code
> increasing it from 16 to 32, and decided I better leave it alone.

Yeah, the conversion from 16 to 32 was hairy because our
initial implementation made the migration-compatibility
awkward. When I wrote that conversion I was careful to
avoid creating a similar problem for my future self if
I needed to bump the value again :-)

> I'll add another patch fixing the check and use 32.

I just sent a patch that fixes the check.

thanks
-- PMM
