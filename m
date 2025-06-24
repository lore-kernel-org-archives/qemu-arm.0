Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp330619dyb;
        Tue, 24 Jun 2025 10:16:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWsZ/dI4sqw89E4ZrX8hcepq1QWNe64UkylLGskYbrjhpHoplEPa0Z3hcYSYxETVPODPuazEbU22isrGg==@linaro.org
X-Google-Smtp-Source: AGHT+IFUIiRzFS3D1kkYRXIIRFbddy7tOP3fpfCS1YvFGGS35ZdXgw08DO7nvAJMo5YROnGirt1k
X-Received: by 2002:a05:6214:5404:b0:6e8:9dfa:d932 with SMTP id 6a1803df08f44-6fd0a4d8290mr286767406d6.15.1750785407118;
        Tue, 24 Jun 2025 10:16:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750785407; cv=none;
        d=google.com; s=arc-20240605;
        b=Gj/fX51p7O6RZhNxEzHIfsTS0CAbstlzjp6R60wxAiD5IgoAQuHDV3wZfF+vjuA4Nc
         jDMdOrSNtKMXCV3wGyaKTeKQGMRQUMXBevbsQ5KCWTuipx0UKlkuXH6ZH4VguN/TW+LD
         tto+OxhW4jYPXsgAzTfRVpvcSYFP/9z0GDioyX31Hb2Q9p2kFsvY+PygLY8F9ku9EAUO
         bRC3VYf2/EMadlDJuir6JI9gcytTLq/Or9ww7JfceuvsVuQ4z48IpmExs/m8qS4d+qrq
         CblCBHMMvuwdBFK3D9DFMikZPDpgv888P+9flNA+2JcZDkXrQ1Zcw9qFbUYNXEHGbkjF
         zxYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=stPEICxxjD0hh28faYD0ik1IUgLNtnuvShlfWporoJA=;
        fh=UFUfHYSuDdi4XieMnBD5jhAhA+A0eNadILLeGmThoz0=;
        b=WB80VKLaUtnhECnvcGjU3W9Z9MJl70y7wv1NmOsx/JEaxJCplk5f9L2tAM4zv1x1Bu
         pcEzlATrfxlmGO0afhGzPObcGSbMp8M+F/uHJqU1EnM3iChRea9AM8LyjMk8pbib/P4I
         M4mp/WBFhtu5fFmMktashwwMqcTwNcyxgHO8sAyglRB0lcGAHmsJ2vYoms5ZNSYjE3we
         m8AoDhAj9j03xgijCWAC+/YxbxNQhkAjna+bJRWz5p/N5Bm2mD/CcITAGYEqTrbZqL/c
         cnlHJI3bMGAqfISjuEMBkGKr7w2eStC2HPADWBCdsY/XTn2ZgcD/5orP4hQWEHuni6ro
         xntw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kCIkKV5i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd095b9a61si108896676d6.424.2025.06.24.10.16.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Jun 2025 10:16:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kCIkKV5i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uU7Fm-000187-0d; Tue, 24 Jun 2025 13:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1uU7Fe-00017F-FW; Tue, 24 Jun 2025 13:16:09 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1uU7Fc-0005Kv-Ne; Tue, 24 Jun 2025 13:16:06 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6077dea37easo10644836a12.3; 
 Tue, 24 Jun 2025 10:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750785363; x=1751390163; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=stPEICxxjD0hh28faYD0ik1IUgLNtnuvShlfWporoJA=;
 b=kCIkKV5iwD4hlZNFu5NuciuC+40WKRy5/8/TdMaOwW0mWmZ5PeMlrmYdU/n8L+BLq8
 P6FA780dHzdWc8IiPOln1LlB+1RP7IHU1trvXfUUpjHlkF7lM7gYywCgYKq1KL1spkMZ
 0HRgXCCt9NnGGUIxbncxmFVo4C5A3HTTc7DXVdBJHXH3LT0x80Jed7lVNb10Jw1+GRpS
 w+dn0fW/8mvZPmdeZi98auKxjAHDu+2GwlP6H+wjRneAnuco/sdQbQj7vTfOVP25UYGx
 QUVJLT8LUsQ2TDjb3yi0vjPK+cF7rBbzZUONopu+LXEMIt0syUVhnpV9vnPAmv/Rmzq3
 u8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750785363; x=1751390163;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=stPEICxxjD0hh28faYD0ik1IUgLNtnuvShlfWporoJA=;
 b=aMw6DYlelbWRoj9sHW54PTmGQkf7qQdsGwAkWVV6Z6JLZkgkYpCl3r8f3nDdnAvEQf
 AGt0cUFMRD90ID/LdrJT41zbbt6ontIq6JZuRA6KvJkYahdf7SPi3rYE5kCBkYz3dSJk
 MG70M2RkNyeaf0NXg6/0gXc7f4lVy89NB/ku888Cc9ozrC0UESdZ8YbE09f0OIUXjvDR
 ymK1pnfgaKW6cuW2dfu23kSN45Re3T7dD18BOkPZwh4mO0zrU7phhwalWI8cnfd4ltz3
 amkHGXzCJkNVn5TOQWhs662f1A8ZaA/dXh/nVXLfto9VNqnRRhP6G5+9mNb04KTZyaMP
 +S9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTwHBowlyt8ffR1Q85V4jIUdirF+apUs4YZbqAI5mHTEeqHrs+GerVMgyroSXW2PDr2FlDV2wz1w==@nongnu.org,
 AJvYcCVsuwFmrQpwQNKxo+aFyRY4UrShaVYdjO0pGmX8lxF9aAQCaqpQA64eSmsyVKnFUtHW7gvlvg3+7cGX0g==@nongnu.org
X-Gm-Message-State: AOJu0YxTLb9lzXrlzv1jtuaQX3nzhoD+own8scH2dpc++5gsa8DvAB/5
 Hi+kJFfkhH2hM/8kPy9qISP5/ZDQ3MRwcDybga7r+EqOW1aoIs2vMT3toiWNJJQrlIzks1H1t6Y
 8xXl0KnUVLD7tK4tDhTepXEFSeTeBHHo=
X-Gm-Gg: ASbGnctQGY1/2GDSEr2Wt00FAVJRApj+q7glwCt1rl6cKT312sK7Gjoh50k9eNM2I4D
 I9kSqMn3oTLOBo/GwfbKfEZfH6XwzFXYvTPvzDCwxOyLPo1kTw70NS9NXvCy10yF8NbqkuRtBv3
 Rsf8fYx92xuHviFVoPMW1qQ/SBn6vSzEUMwIjeg0OcpQ==
X-Received: by 2002:a05:6402:2746:b0:602:3e3:dada with SMTP id
 4fb4d7f45d1cf-60a1d18eb87mr14798817a12.25.1750785362301; Tue, 24 Jun 2025
 10:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAJSP0QU=v_jN5oBDBefg0mB=Qv3SvD4ZdJzz2LT-cu5ZL7pK0Q@mail.gmail.com>
 <CAJSP0QXe1L2P24oUrABO1eUzn1JFc=BJWEfakrQ5u3Ek5LkfKg@mail.gmail.com>
 <CANCZdfqfFNAYcF3BEDucyR3YN1PXwyEmzE5LPcJCyshCXwhe6Q@mail.gmail.com>
 <9bac4585-255a-4805-b24d-b3b75d2ca9c3@redhat.com>
 <CANCZdfq6+R=VgyYdcdJCmDBTCgLSxDJuqd8h=ehb5F+v-HPT+g@mail.gmail.com>
In-Reply-To: <CANCZdfq6+R=VgyYdcdJCmDBTCgLSxDJuqd8h=ehb5F+v-HPT+g@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 24 Jun 2025 13:15:50 -0400
X-Gm-Features: Ac12FXwTC60e3gyDQi7IDOdYMdtwHot_gdlpHicbrJuQ6I3r0sEJaPOMbzQ_J_k
Message-ID: <CAJSP0QWSVhAYBtxKV+WDubmif2m=jxTYd-BK=d7ExZXWUNUYXA@mail.gmail.com>
Subject: Re: FreeBSD 14.1 aarch64 iso URL is down
To: Warner Losh <imp@bsdimp.com>
Cc: Thomas Huth <thuth@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=stefanha@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nyBowwmKBaZF

On Tue, Jun 24, 2025 at 12:28=E2=80=AFPM Warner Losh <imp@bsdimp.com> wrote=
:
>
> On Tue, Jun 24, 2025 at 10:02=E2=80=AFAM Thomas Huth <thuth@redhat.com> w=
rote:
> >
> > On 22/06/2025 03.46, Warner Losh wrote:
> > >
> > >
> > > On Sat, Jun 21, 2025, 6:01=E2=80=AFPM Stefan Hajnoczi <stefanha@gmail=
.com
> > > <mailto:stefanha@gmail.com>> wrote:
> > >
> > >     On Sat, Jun 21, 2025 at 7:59=E2=80=AFPM Stefan Hajnoczi <stefanha=
@gmail.com
> > >     <mailto:stefanha@gmail.com>> wrote:
> > >
> > >     (I forgot to CC qemu-devel)
> > >
> > >      >
> > >      > Hi,
> > >      > This might only be temporary, but the CI is getting HTTP 404 N=
ot Found
> > >      > for the following URL:
> > >      > https://download.freebsd.org/releases/arm64/aarch64/ISO-IMAGES=
/14.1/
> > >     FreeBSD-14.1-RELEASE-arm64-aarch64-bootonly.iso <https://
> > >     download.freebsd.org/releases/arm64/aarch64/ISO-IMAGES/14.1/
> > >     FreeBSD-14.1-RELEASE-arm64-aarch64-bootonly.iso>
> > >      >
> > >      > https://gitlab.com/qemu-project/qemu/-/jobs/10424901718#L848
> > >     <https://gitlab.com/qemu-project/qemu/-/jobs/10424901718#L848>
> > >      >
> > >      > Stefan
> > >
> > >
> > > Time to bump the version to 14.3.
> >
> > Hmm, while we're used to refresh the CI images for the *host* environme=
nts,
> > it's rather ugly to see images for the *guests* of the functional tests
> > disappear. Maybe we should rather remove that test if the URL is not st=
able?
>
> Yes. Most of our images have a shelf life of about a year to 18 months. A=
nd QEMU
> should be testing all the 'supported' FreeBSD images, just like for
> other projects.
> The question becomes how can we, the FreeBSD Project, remove the friction=
 that's
> here now because we timeout / move the older images as they pass out of s=
upport.
>
> We've also just shifted to a more frequent release cadence, so the
> releases have gone
> from living for  18-24 months down to just 12. We just released
> FreeBSD 14.3, and 14.1
> is only a year old. So what's the best way of dealing with this? We
> could have a 14-latest
> but the md5 would change...
>
> So I'm open to making a change, but I need help crafting something
> that will work, since
> I'm not clever enough to suggest something here.

A test run should be repeatable. If a test passes on a given qemu.git
commit then it should continue to pass when run again. Using -latest
breaks this property, so let's avoid it.

Ideas:
1. FreeBSD provides convenient permanent URLs.
2. QEMU uses a permanent FreeBSD ISO mirror URL instead. Need to find
a mirror that is fast and reliable.
3. Someone agrees to regularly update the URL in QEMU's test suite so
that breakage isn't exposed. IMO the least desirable solution because
an old copy of the test will start failing after 12 months.

Stefan
