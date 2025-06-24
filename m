Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp345732dyb;
        Tue, 24 Jun 2025 10:42:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWZ+TEP+8UiT2a/GVFXoJvVrYKXb0YOHOX7u4g8vFfgj5i2jVa3du61tdqDK3PM6xBGXWL3tWtteQrv+w==@linaro.org
X-Google-Smtp-Source: AGHT+IEiqruXtR7qBvDTHv+uhOmkA2xsKV9l3DGLUmG83pc6U9zT8W91fJbVGYPHbe3rYbx6sZMF
X-Received: by 2002:a05:6214:590a:b0:6fa:fdb3:587b with SMTP id 6a1803df08f44-6fd0a4699e0mr237966296d6.1.1750786947127;
        Tue, 24 Jun 2025 10:42:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750786947; cv=none;
        d=google.com; s=arc-20240605;
        b=Hhmh9OSaGqCZcj+JDuVEhkcaAI0oIpNSEdD0hNXspSg89gvIvhY4cNmVzpwEKVS+je
         5zJG6I11kUKEfiqMlrGYP/gPqvQSzfKUGS1og1RUZb9MB0Hk1Km8pwVOoi9KRfLWz+ep
         nNZOGjGilAoJi0WRWA+14yYQUUTrzrju0EQweIrGxokmrqchzVgmaDv8F4CZLIgMRJNK
         flhI1pJPaAG8ZEDaBJ+Z0s+2ooUtGx7XF0lxJMiDbVv/diHcUZRWe/KjMxhtsx4MiGox
         1A30jpYbjy9JatcLVcUO8c/vLrDCcH9M8le0c5HCbMcJTLTgN5nE0O+isbHi+fn4bfnU
         O9PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=aA8ih3bAHdJTnR1IUhY/sl71KMFw0RsevXDXGItG9as=;
        fh=vILi7s+Nv54CndlTVm4mVmH9HjGfmbl3nErkV4U+2GA=;
        b=XX8/1zZ5vHpYiPQ4OMlyruNtoT3+W0EBulZ5TaZSPRZOHKDs+XSmy1AcmskP8z3LZ7
         nhfiRk8i8ezILqQU3u5kjVAlA2nDvnSHy9F+RSh/ey92p1AM89e2dwZCcVZMnWJcumL8
         Vz8vfQlwxFNX0xQ8USDIIE9HVplhPcnCdbCYp5ZCPzz9hEe7nSRStXXqIzveTtD1eLnY
         tZwPEvQNPplEKiL79LMYHzqjCVDCKzWVdOWU05Zxzs/IVWl3vR9sKD3PzqttGEKnP6N5
         /IwEIaLNPWapQNt8/MlALc12zTix9U90FyraFZ4Y1sWTCku0phrcF4KAecdYprJUvsaO
         oS+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=GChvEuIs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd09532392si108717966d6.228.2025.06.24.10.42.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Jun 2025 10:42:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=GChvEuIs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uU7ee-0008Ds-0K; Tue, 24 Jun 2025 13:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1uU7eT-0008Cn-U6
 for qemu-arm@nongnu.org; Tue, 24 Jun 2025 13:41:49 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1uU7eP-0001Jx-HB
 for qemu-arm@nongnu.org; Tue, 24 Jun 2025 13:41:44 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-3137c2021a0so768414a91.3
 for <qemu-arm@nongnu.org>; Tue, 24 Jun 2025 10:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1750786900; x=1751391700;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aA8ih3bAHdJTnR1IUhY/sl71KMFw0RsevXDXGItG9as=;
 b=GChvEuIsaETS0ftKUieX0jKG7/RNzSIb3nYnPp3auSdgD3+00TBTwjSBFbb4Ja1SAK
 9zMw5RSyOJHLU8iCfg3v2D6NZkz6AqTacQpJ5szDJnKX0rdslT5IwQsbOuFNUlzdT2t0
 ww9xZ5B7mmT31PxNK1BSbq84ZixfEVtUuYxBTwOAAdAVCX/egcdntYGC1Y/ruFWNZqKU
 FpqClmVlBSSrjAOSkgY7jW2xRWd4dCJWscI/WF3C32oRK7s6z7+ZuoWzh80z5bOHPr0i
 yzdxVTDAfjs3IbYHVrNZ5LzoOmPKk9XF0BihbA0tWJKDVAmxZb/nj+jY/AXI6f4Mvarm
 amuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750786900; x=1751391700;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aA8ih3bAHdJTnR1IUhY/sl71KMFw0RsevXDXGItG9as=;
 b=O1Ylp0cYk2VSZGUdIQfgL987v3mBJZxVlCK6/PlcNWn68jaX6Wvscv8ZZjENrqWzeT
 2vtMw3VggeuX8XRaZVvr87NzMlUevUOpJU3Fx/Rtg2okLSkbzGsJ1XkC12V8tYSMyiaN
 iEI2pXPX2DizAVRBWDm9ihomUnPATaJAikLPWwPsuyLTjt1wOKRHSuGgQmO33yvvCBe7
 gRE8OoPAfzBWkjEWXs3v+aUg76hyeQ9DFCRNVJZvcvD0KcLGYeIrVw3tWxGzojrNapST
 F1UcPb+7uSR14MbjTb3keZVRBilsam5cPyQk6XbUcFFS1kiPXOHZlmMXlzs8G/exmtYM
 Ck1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiZ63nIA8knZBiLK/zGJDUmHL7TZtHMY/5fKs1jptiXwsYcoSNseP5C8k89ZtrAd0wVWaJbRuaWw==@nongnu.org
X-Gm-Message-State: AOJu0YwD4y9LEVqq1q2yNwrBzT5wSwLrO0zwyBDCq3mEf8gW0hqXy+pX
 bb6f1PKL88fJ2MgD/v1KdxMqFyObmHLQRdtR+4p/hxlSv7Axcs8vACmz2wiQ8oukRcRlyBw9qVv
 mxcQqZtiWHkbgkt1msNPgmJL2msQiScrNC9vjzUvCLKnx2jj4P99jFgc=
X-Gm-Gg: ASbGncuGln41l+HSb6a6rBuXLVkXFWfk8fXA2FDu9vL6LaQmEKHobt28GSWC7LoXqGe
 8fB8gFLlaLdf6vRvbVMnZIACBu9uDehGWvOlrO+gCJt55bQ0Yabk00J2Ob6DiYLuh60x3sRlCDa
 nyEqvNCcjbZJpp4srev6Wvu9coiOcQb7VwN3jUGpMRXwhy
X-Received: by 2002:a17:90b:2590:b0:313:20d2:c99b with SMTP id
 98e67ed59e1d1-3159d647127mr28596543a91.9.1750786899589; Tue, 24 Jun 2025
 10:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAJSP0QU=v_jN5oBDBefg0mB=Qv3SvD4ZdJzz2LT-cu5ZL7pK0Q@mail.gmail.com>
 <CAJSP0QXe1L2P24oUrABO1eUzn1JFc=BJWEfakrQ5u3Ek5LkfKg@mail.gmail.com>
 <CANCZdfqfFNAYcF3BEDucyR3YN1PXwyEmzE5LPcJCyshCXwhe6Q@mail.gmail.com>
 <9bac4585-255a-4805-b24d-b3b75d2ca9c3@redhat.com>
 <CANCZdfq6+R=VgyYdcdJCmDBTCgLSxDJuqd8h=ehb5F+v-HPT+g@mail.gmail.com>
 <CAJSP0QWSVhAYBtxKV+WDubmif2m=jxTYd-BK=d7ExZXWUNUYXA@mail.gmail.com>
In-Reply-To: <CAJSP0QWSVhAYBtxKV+WDubmif2m=jxTYd-BK=d7ExZXWUNUYXA@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 24 Jun 2025 11:41:28 -0600
X-Gm-Features: AX0GCFtMWAW2_eHl3v0MdJ-bRUHJR4z_y5BJyj3ZrEBLkIb_5qEoxgjfw_El7mI
Message-ID: <CANCZdfqTKUMLbrT9HEXa-O7pyHqfcMWMmYx7iCq=ZU_ewgCaag@mail.gmail.com>
Subject: Re: FreeBSD 14.1 aarch64 iso URL is down
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Thomas Huth <thuth@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=wlosh@bsdimp.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-TUID: KiEUjli3hULk

On Tue, Jun 24, 2025 at 11:16=E2=80=AFAM Stefan Hajnoczi <stefanha@gmail.co=
m> wrote:
>
> On Tue, Jun 24, 2025 at 12:28=E2=80=AFPM Warner Losh <imp@bsdimp.com> wro=
te:
> >
> > On Tue, Jun 24, 2025 at 10:02=E2=80=AFAM Thomas Huth <thuth@redhat.com>=
 wrote:
> > >
> > > On 22/06/2025 03.46, Warner Losh wrote:
> > > >
> > > >
> > > > On Sat, Jun 21, 2025, 6:01=E2=80=AFPM Stefan Hajnoczi <stefanha@gma=
il.com
> > > > <mailto:stefanha@gmail.com>> wrote:
> > > >
> > > >     On Sat, Jun 21, 2025 at 7:59=E2=80=AFPM Stefan Hajnoczi <stefan=
ha@gmail.com
> > > >     <mailto:stefanha@gmail.com>> wrote:
> > > >
> > > >     (I forgot to CC qemu-devel)
> > > >
> > > >      >
> > > >      > Hi,
> > > >      > This might only be temporary, but the CI is getting HTTP 404=
 Not Found
> > > >      > for the following URL:
> > > >      > https://download.freebsd.org/releases/arm64/aarch64/ISO-IMAG=
ES/14.1/
> > > >     FreeBSD-14.1-RELEASE-arm64-aarch64-bootonly.iso <https://
> > > >     download.freebsd.org/releases/arm64/aarch64/ISO-IMAGES/14.1/
> > > >     FreeBSD-14.1-RELEASE-arm64-aarch64-bootonly.iso>
> > > >      >
> > > >      > https://gitlab.com/qemu-project/qemu/-/jobs/10424901718#L848
> > > >     <https://gitlab.com/qemu-project/qemu/-/jobs/10424901718#L848>
> > > >      >
> > > >      > Stefan
> > > >
> > > >
> > > > Time to bump the version to 14.3.
> > >
> > > Hmm, while we're used to refresh the CI images for the *host* environ=
ments,
> > > it's rather ugly to see images for the *guests* of the functional tes=
ts
> > > disappear. Maybe we should rather remove that test if the URL is not =
stable?
> >
> > Yes. Most of our images have a shelf life of about a year to 18 months.=
 And QEMU
> > should be testing all the 'supported' FreeBSD images, just like for
> > other projects.
> > The question becomes how can we, the FreeBSD Project, remove the fricti=
on that's
> > here now because we timeout / move the older images as they pass out of=
 support.
> >
> > We've also just shifted to a more frequent release cadence, so the
> > releases have gone
> > from living for  18-24 months down to just 12. We just released
> > FreeBSD 14.3, and 14.1
> > is only a year old. So what's the best way of dealing with this? We
> > could have a 14-latest
> > but the md5 would change...
> >
> > So I'm open to making a change, but I need help crafting something
> > that will work, since
> > I'm not clever enough to suggest something here.
>
> A test run should be repeatable. If a test passes on a given qemu.git
> commit then it should continue to pass when run again. Using -latest
> breaks this property, so let's avoid it.
>
> Ideas:
> 1. FreeBSD provides convenient permanent URLs.
> 2. QEMU uses a permanent FreeBSD ISO mirror URL instead. Need to find
> a mirror that is fast and reliable.
> 3. Someone agrees to regularly update the URL in QEMU's test suite so
> that breakage isn't exposed. IMO the least desirable solution because
> an old copy of the test will start failing after 12 months.

So there's two issues at play.

FreeBSD does maintain all our archival releases forever. They never change.
But, we don't have permanent links to them today. We start with one URL and
then migrate to a second one when they transition from supported to unsuppo=
rted.
We do this, in part, to make sure people upgrade. So in effect, this breaka=
ge
means that our notion is "working" in the sense that the FreeBSD project's =
goals
of making people "keep up to date."

This does, I realize, clash with the views that QEMU wants to have some sta=
ble
way to test images over time, even if the upstream's notion of supported or=
 not
changes.

One easy idea might be to 'prestage' the 'legacy' releases when they
are supported
on the 'legacy' server so that tests can be written with the legacy
path so that these
tests always work, now and in the future.

So, this is terrible from a FreeBSD point of view. We'd like it if
qemu always tested
all of our releases, as well as snapshots of the tip of the spear.
There's got to be some
way to have some shared responsibility that we can automate. FreeBSD could =
test
the most recent release of qemu against a bunch of images in our CI
cluster. But we
don't actually have a CI cluster we could put that into (our focus is
just a little different)
today. Ideally, your (3) above would happen as we rotate in new
versions and out old
versions of FreeBSD. But honestly, I'm the person (or one of the
people) that should
be keeping his eye on the ball, but we see how well that has worked
out. So the question
becomes is this a management failure (eg, someone/something needs to prompt=
 me
or others in the FreeBSD project to update it via reminders, release
checklists, etc)?
Or is it something that can fixed by automations somehow? I don't know...

Warner
