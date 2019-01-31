Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6667417wrt;
        Thu, 31 Jan 2019 01:48:49 -0800 (PST)
X-Received: by 2002:aca:7581:: with SMTP id q123mr15304240oic.176.1548928128969;
        Thu, 31 Jan 2019 01:48:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548928128; cv=none;
        d=google.com; s=arc-20160816;
        b=I36Zgf7s0HNeQa0Lclt7C/aUcaBrR3iw7Re0bP75rGXqY7XtIWP42dAvFka5UDZhZ9
         v7Eliv46UNtG7Bv6a3MMiLkjVLQ2nPoQQ2/K1j68aCJK4ekL9OMF0LA2AFFQellGXa0q
         Fc2+rXwm0L93iG9rmcIyd5vZMFoXeMCeekALbXqZ9pPME+ep3RAI06EvOL/pd8R02jpL
         /HND3V+5bGRjZ0axP8Kyi1Ndzk4RlAp600PhcPhq23Vz9yPjjADcEjtKjpwdOA3vvgdL
         sJUCESBPe9RRCC+ZxfCtLm+WSLbW2YXsKsrN1FFXPKltqQ1gu19aINcY31N8kI09UJNm
         i8RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZzUGZ8zqf3cOafK/6hY4QFh3DtgOKBQy6MTXMwDmmM8=;
        b=ak4INLiK4dO56i5SN6F/qpcdCuUsqaU6k0GOQtoJBpNtIzIkbsex9c4N5fAbQn3SRC
         1V6W2FGOTgaVFGu79GTLmdb+bziL6m/No7e4jTZpq2SYDA6a8fj1YckszvOj/PZ1kbxv
         byoRoWUhkXogY853y9RFHPN2YfWRmDt90MdrKocKUXKjT6sOx8FMHyczlyjMsqEU8XBY
         oGdp8brOxiwzU1pClL1+5eVbkGNPoRqUZHgxNV0uX3O9zwWecS+z9dPL79zVt94hRYu4
         bcC3QQE+t5sjd6ig9u/opN4RDgPP8V2KoRR0TmeIwfkVmM+onuZYVnRKiCalL+PxOEme
         +jDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="St/qYaJF";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g110sor2065939otg.156.2019.01.31.01.48.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 31 Jan 2019 01:48:48 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="St/qYaJF";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZzUGZ8zqf3cOafK/6hY4QFh3DtgOKBQy6MTXMwDmmM8=;
        b=St/qYaJFP+ZydrEUM7xnLsnsiitBqicL06wEH3oVYlk61UjeIN3vkAxFavvzlcgpAB
         cCZ3xkJJedF74TeZxglG2pTFFryiD7JrwTpn7SxXMJn/bS8hNLdnTm4TS2SkV+TdQ3mZ
         +4jhhyUyPnwHBXTABkLto9NOwoIQIvBRW0r7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZzUGZ8zqf3cOafK/6hY4QFh3DtgOKBQy6MTXMwDmmM8=;
        b=ZJLi0iOeVwEjnwK95ErZame0n94WXkVB449RgwZZhGehTNJHe9uL9HhMUs3AduRCUx
         Xs5CnXZvL07E51S17QzOHTjk2OnUXKxKIh8nQEhRsOeVfXQSLTVlL32KbQLIWOqaUsH2
         Fl8fgMF8stKzLXsKKauLEw6XKLYGtIq+MgvYbJ0hohyEDfX75cyty53nQ7mFkGXAhhOa
         W8x2t1OyvDMvgF5w3LgnAReE/3pNArV5KEkC6sDEsaDxVX4Mxe0J1L8qlw/1zeEO0Ngv
         noRTaRZWsjBjv1CsV9jPLokcoMQ6HrJwM60NTgDSy3jc4X/y4yyfXSOvUW7s5O4vLyL1
         sgCw==
X-Gm-Message-State: AJcUukf+G8HesYMRBKuyigd0yLA20MWVgp2ECaCL55mokKN6CXqQcGSw
	t0PLq42+bHLccKdWDOBYlS898P3Q+cRYmP1FA4wbl0LMlyHCOA==
X-Google-Smtp-Source: ALg8bN50V1HFyM1fUWsbcesOSeLRZPKBNFkF17ijcyeSJ6nX4GmraZYSg6wgq0+fWfJlWhkUOPue56SBYBVrG+k/6Rw=
X-Received: by 2002:a05:6830:1115:: with SMTP id w21mr24774732otq.316.1548928128569;
 Thu, 31 Jan 2019 01:48:48 -0800 (PST)
MIME-Version: 1.0
References: <1544173675-14217-1-git-send-email-hongbo.zhang@linaro.org>
 <1544173675-14217-3-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA9mF+WiPLW4yyv1aEMLTg2QK2krZvxyjCSsMziJtzx3Ug@mail.gmail.com>
 <CAHmQWvCw5ndod93WqLXDgGxDERtRM3ee_qiLA+S34Y9X2JFvVQ@mail.gmail.com>
 <CAFEAcA_+UhU56D7Yx5K8+=DbtUiiV8V7sX2UgxFKSkScUypxFg@mail.gmail.com> <20190130092321.1ddbd29a@Igors-MacBook-Pro.local>
In-Reply-To: <20190130092321.1ddbd29a@Igors-MacBook-Pro.local>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Jan 2019 09:48:37 +0000
Message-ID: <CAFEAcA_i0dXNUfzKGBgn=riupWtBa=pGYYtY8LUqHdrf6YzbvQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v5 2/2] hw/arm: add Arm SBSA reference
 machine, devices part
To: Igor Mammedov <imammedo@redhat.com>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: ri3WQC6pKZAj

On Wed, 30 Jan 2019 at 08:23, Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Tue, 29 Jan 2019 15:26:29 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
> > Oh, I see now. I think this is a bug in boot.c and we should
> > fix it by making the "this is a firmware boot" code path also
> > do the arm_load_dtb() call. I'll send a patch.
> pls, CC me on it as well.
>
> I'm interested in it from hotplug + reboot perspective,
> where we have a changed/bigger DTB on reboot as it contains new devices (cpus|memory)
>
> loading rom like now doesn't work nice in case of reboot.

OK, but I don't think it will help you there, because all it
does (after a pile of refactoring) is make the firmware-boot
code path go through the if() clause at the bottom of
arm_load_kernel() that calls arm_load_dtb().

thanks
-- PMM
