Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5950952lfb;
        Thu, 10 Dec 2020 06:28:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwE8itvR08tBc3xB+dhU1h1E4mnOayLKFMyIS6TdEFRd3pExGfaq5k8+l8CZftVEmAdhZTT
X-Received: by 2002:a25:bccc:: with SMTP id l12mr11422039ybm.295.1607610512574;
        Thu, 10 Dec 2020 06:28:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607610512; cv=none;
        d=google.com; s=arc-20160816;
        b=kqdQJonor0TLTOzekrPa7wh8wa9Z3WEhRZI7zeXX9vEUCxkzbWFN0pcU45Qxj1gW3P
         k7Twwy4Jh67fFbD6PX/dlvLLAqiZYhUG3VCE+fYQ8xH/8xCYM9rVKmPX7NGkEWPzA6oi
         99vLkCuONQjtDuAhjTMHpoNmHaUade41zov0qPjIA0kDfyYm3hL0W/gZzcK/FZI4zD6U
         LrhesVyNZhsako2LqlNPqhU3aImj/yzgLJrkL5E5Oayswf6mZN1IiZDw41WFO2mhe3cG
         175qwR/fQo63FB4asToy229EuwFwmNzDmuZ1b9J1mhzoWw+9NgEKWoWB+Qc84FXutGt6
         rUrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=h0ZkNmdrRk1QmBSvbXHC8b9Yk7HUiLC1aWMMCjxRxnY=;
        b=xhaOqvZdzekTelHK8HLIoyEqJzODGTTRc46c+ozC2qEGtOuCbWlxzlRiQKRy1A+Py6
         S0nXA6OtIBfOvgg/0GnwRr2/1MANgGJBgA4Ew4FDdp4u94e18mZ43Qfwp9zqT/XQWTcW
         tG/Glty4hDoaN/9mip12JKozAmfp8enz6UcZGjuZnQvbWXVlyPmLJf3ZUY6UvyjJ0oX6
         HcvPbbWZ8ifXy28omPxEm2PxuoDIn+vwfKfUU9kLii2DgBWRs/8HES+vBCskuFS7xMI0
         5pvBE0ebG0qepQlOSNKW7ORn8HeGrAKOK1CZL3eIL1efVdJFwQSrKlT8CNHgSDKeCN9j
         ueUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F4QheKpi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w131si5121742ybg.302.2020.12.10.06.28.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Dec 2020 06:28:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F4QheKpi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1knMvn-0001m3-U9
	for alex.bennee@linaro.org; Thu, 10 Dec 2020 09:28:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knMv7-0001kZ-6O
 for qemu-arm@nongnu.org; Thu, 10 Dec 2020 09:27:49 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:35845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knMv5-0007os-DF
 for qemu-arm@nongnu.org; Thu, 10 Dec 2020 09:27:48 -0500
Received: by mail-ej1-x644.google.com with SMTP id lt17so7599508ejb.3
 for <qemu-arm@nongnu.org>; Thu, 10 Dec 2020 06:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=h0ZkNmdrRk1QmBSvbXHC8b9Yk7HUiLC1aWMMCjxRxnY=;
 b=F4QheKpiJJxVg1rHl8Qc5ltjP127YbCLivdRTsGvE/XgdZc4gFui1VMaywti47I6x+
 wTN6MdEF2x/sMYb8G1GowTyblyKhQyTl/dbsFBnLJk9k0hu0t6QczluJUnNcHp8baCae
 2E0jP0hXt/1s/BKOzp2M5R2JellblkE1jgjiGwETIGouxXMEDxZ4AekqsqCC7gE64ysC
 Rg16qM3W1/LT0hxPqs1JXkaJ/3/pP2QNmgEFeXFLmVsB6eUoiESufJj58d1A5D/6rerG
 X1Ysd5zsc3glD0HXcqM6kom6yR+d52wZwzFm572+S2LeuxOQtu207RB0pOg5bOip5+hZ
 n2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h0ZkNmdrRk1QmBSvbXHC8b9Yk7HUiLC1aWMMCjxRxnY=;
 b=LZ07FSRCnze6OCuqF6F5Ymo4is8LRkiICOLVwMc+4m195HQoA7wProzO9vgZLfiuRh
 JiisLDQmibNIgzqdIkfMYe2Nn0rYxEQHBuRl8uKyHlfeorn7k5ZppESv66Kj+jM/qD5h
 OAkOsxzYE7OVifWyh8Byx3kjlqIrKBPHHiDnx+dBvjUec4NTh3wlDNeDqqH4b8KyZHPK
 GRn1yaML/XXMOEOdSBhdH7sWKSP8ivaOJJepjg90SJjwpPfEPF6xhSxj0+b5oF3375KC
 F2Ock0TykqmEroDrtEbDo/W/Ic6Pm6NOeU9XfuOVYdfJX/QxPGb5lT+1efBKUPfonzXB
 wFxQ==
X-Gm-Message-State: AOAM533y/MbbQJSRi17YK0GdOanTwlx6YMJYDjF/hCHj/xJRNhOBZfC/
 Yy7em/C9XfTGeWMtXWXdYKHLQl+3EksTgGXf6oss1Q==
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr6606354ejf.407.1607610465440; 
 Thu, 10 Dec 2020 06:27:45 -0800 (PST)
MIME-Version: 1.0
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-9-marcandre.lureau@redhat.com>
 <a162ec7c-4dc3-5784-866e-dc95f6919b1f@redhat.com>
In-Reply-To: <a162ec7c-4dc3-5784-866e-dc95f6919b1f@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Dec 2020 14:27:34 +0000
Message-ID: <CAFEAcA_xbEm+DmP5hixtkzWJK1fi8X7wZh+eGKmDneZv_=-xbA@mail.gmail.com>
Subject: Re: [PATCH v3 08/13] audio: remove GNUC & MSVC check
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wKFpTUcMfHMl

On Thu, 10 Dec 2020 at 14:26, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 12/10/20 2:47 PM, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > QEMU requires either GCC or Clang, which both advertize __GNUC__.
> > Drop MSVC fallback path.
> >
> > Note: I intentionally left further cleanups for a later work.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  audio/audio.c | 8 +-------
> >  1 file changed, 1 insertion(+), 7 deletions(-)
> >
> > diff --git a/audio/audio.c b/audio/audio.c
> > index 46578e4a58..d7a00294de 100644
> > --- a/audio/audio.c
> > +++ b/audio/audio.c
> > @@ -122,13 +122,7 @@ int audio_bug (const char *funcname, int cond)
> >
> >  #if defined AUDIO_BREAKPOINT_ON_BUG
> >  #  if defined HOST_I386
> > -#    if defined __GNUC__
> > -        __asm__ ("int3");
> > -#    elif defined _MSC_VER
> > -        _asm _emit 0xcc;
> > -#    else
> > -        abort ();
> > -#    endif
> > +      __asm__ ("int3");
>
> This was 15 years ago... Why not simply use abort() today?

That's what I suggested when I looked at this patch in
the previous version of the patchset, yes...

-- PMM
