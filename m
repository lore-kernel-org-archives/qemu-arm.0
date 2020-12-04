Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp881641lfb;
        Fri, 4 Dec 2020 10:24:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcXO7AmxgQTP0dKuoyF4UbK5SWuiWxdWpuRdQg86mT7nwhqk8E9HyGBmXQsIQLVVQ8Dnh6
X-Received: by 2002:a25:be89:: with SMTP id i9mr7237743ybk.35.1607106299151;
        Fri, 04 Dec 2020 10:24:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607106299; cv=none;
        d=google.com; s=arc-20160816;
        b=xmkOECIzKS26g6nUrY+qMskBAgIPnKiNvVHE6gLvtr5uLm3Yi552F1R9TRtgfIF9Ui
         hSTkWvaYvaENX0MWuLA8sY5uS0QQscVA9DHVBFK+2PVh73R82Sk/w73Ep2uaC6ClgifH
         S2dobB4NdgIg5HWqoVpgoiL/UojBxiImOI0pwJYqAk5MDOoHiGAJzKJFgUalzql/g9h9
         4LvK7jegPdaCtrjpEu5w7FYfZViSZX5x9sR85vafN6i4fnvrTs5sd4WgV9nUKcuvCzvi
         bBTwyoipQelhR2qC0VNnohsIDJbY4kLuHwFINCGYuJwDzN9hUv1FvOeRxOi1mKFkgf0y
         Bl5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=x21ViHKE8gzgFzcgovKz4qGIY6AqAc/2iDUN+mzcJws=;
        b=yX6Ws4hNaXdpBLcoXmKfd9Vv7yR+PVpygmJ9GUbHOXdZQZIxK0mskN1bCMsf7ZYVx8
         MDvPdlvcpwUUvJ74nPM2cHhkbAfK7mdg6ZevBJqipq0xL4/KgVAkxH3U5XEzzdi2084J
         1APoj+HhODnL2Xz8FeDNFV1Wu8j3LRHlYX58rl/faAjBdfNEnTUm33gAugy4gXiobsP/
         wFaddXRICuwO7X7/EYeiXZSxmOXcmVorrdne4XukF1ZEMIPa5iIQjHJeR0Ztq6i1T6Cg
         jZBKipWR6ZULDaqTrb65ERKy3gzc4AxswM6ke4N2s2BJUiLdPE7YohHsupd+8WQsCz0a
         cFUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DrBXTq9i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15si2049928ybj.303.2020.12.04.10.24.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Dec 2020 10:24:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DrBXTq9i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1klFlK-0002uE-Ey
	for alex.bennee@linaro.org; Fri, 04 Dec 2020 13:24:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1klESn-0004uA-Fy
 for qemu-arm@nongnu.org; Fri, 04 Dec 2020 12:01:45 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:37972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1klES2-0003Np-T4
 for qemu-arm@nongnu.org; Fri, 04 Dec 2020 12:01:43 -0500
Received: by mail-ej1-x644.google.com with SMTP id a16so9697278ejj.5
 for <qemu-arm@nongnu.org>; Fri, 04 Dec 2020 09:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=x21ViHKE8gzgFzcgovKz4qGIY6AqAc/2iDUN+mzcJws=;
 b=DrBXTq9iwPhBhcNIaejzmU86137Wg4cLvB/g9whh+Z/PphkZKx7QGLap0poB2ujEpa
 6C172x1qUWqPj/se9kOxjbMUGQDbR7yal3wGrdBSwsgL0xVMtY5X4FqNtHGYHixbAeNh
 A+a1zb24pTsg8pq5lKXIW5jaeQ5npqz5HZdyls24sSr7JTt3sQ74jddBXJfYow9sgQKr
 2iukEVyhHNvoClATLLR0ujPfCUy0rPdiBhDS/jjytj1VJoCRS0ieeymvpA9eOP5V9uKD
 7MH/Dg8C7mARrz42Dx7hyfft+tCZRFlsvprbzQr6Slu4yZU4S28jqGTSYy4HtbpQIWDB
 xz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=x21ViHKE8gzgFzcgovKz4qGIY6AqAc/2iDUN+mzcJws=;
 b=aP9rU7Sv2aUTRqbe2ke3E9hQD/s7DPKyXWIL/dE+tjmOXtsZep7F3R9+48tcbsoSkA
 7BCJ9UMVqcvCX0nFIwexlgtGbloFygvToLVp8E/vSglZKdcBKC4RYaaCWlrxokJTLabO
 8CHnonm7+UQFd2inxP+4ZGmYJ1u2Lu/81LJyGs6EzxfDSUWg5xJGy94UCC6fmEWtcERy
 nYCdv2DsiOTEiAZFPHAsB1K6KHtiLlj8/3YgYYI8wvFaeG1rqkDz39IUKhtBjzHqNu5u
 QfhdeN+qNT9Csv8keDz/Mk0g75BU0JAYW//5fqxn+rd/zr/X7OADkzTWBHP6rqTlpN99
 ClDg==
X-Gm-Message-State: AOAM5330RetsOZaeFs/3oae1vHW8QR/H10ZNndVo/J1HEOJZFZ53gpCX
 DnvaUsaMrR7CtvfeVPv6pVDCArdF+MGIkJn74T9su765AFg=
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr2146422edw.52.1607099783375;
 Fri, 04 Dec 2020 08:36:23 -0800 (PST)
MIME-Version: 1.0
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
 <CAFEAcA9XFGbyYfcpoOVhtV_wySi9=DyMGe84C4uwYG14Z6bD6Q@mail.gmail.com>
 <56701347-e0a0-ae47-8bba-f5cdff253475@redhat.com>
 <3d6d46d8-04bc-7ad8-d71e-4ce15a6e7e47@ispras.ru>
 <CAFEAcA_ATUZ+v8VE8q34mmi3pLhg3qFDHgi7mQB-JJKDEZuzaw@mail.gmail.com>
 <3ab6b7fb-51cf-0ec4-2c70-e86bb01dcc3f@ispras.ru>
In-Reply-To: <3ab6b7fb-51cf-0ec4-2c70-e86bb01dcc3f@ispras.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Dec 2020 16:36:12 +0000
Message-ID: <CAFEAcA9wBVjurjNLoRw9UbWnp-N1=oNVP0en90_QU7h+rZ0MeA@mail.gmail.com>
Subject: Re: [PATCH for-6.0 00/11] target/arm: enforce alignment
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pxScUWOcF7qi

On Fri, 4 Dec 2020 at 06:17, Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> wr=
ote:
>
> On 03.12.2020 19:14, Peter Maydell wrote:
> > On Thu, 3 Dec 2020 at 16:10, Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru=
> wrote:
> >>
> >> On 03.12.2020 15:30, Philippe Mathieu-Daud=C3=A9 wrote:
> >>> Cc'ing Pavel
> >>>
> >>> On 12/1/20 4:55 PM, Peter Maydell wrote:
> >>>> On Wed, 25 Nov 2020 at 04:06, Richard Henderson
> >>>> <richard.henderson@linaro.org> wrote:
> >>>>>
> >>>>> As reported in https://bugs.launchpad.net/bugs/1905356
> >>>>>
> >>>>> Not implementing SCTLR.A, but all of the other required
> >>>>> alignment for SCTLR.A=3D0 in Table A3-1.
> >>>>
> >>>> Something in this series breaks the 'make check-acceptance'
> >>>> record-and-replay test:
> >>>>
> >>>>    (30/40) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test=
_aarch64_virt:
> >>>> PASS (9.14 s)
> >>>>    (31/40) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test=
_arm_virt:
> >>>> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
> >>>> Timeout reached\nOriginal status: ERROR\n{'name':
> >>>> '31-tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_arm_vi=
rt',
> >>>> 'logdir': '/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-cla=
ng/tests/result...
> >>>> (90.19 s)
> >>>>
> >>>> The log shows the "recording execution" apparently hanging,
> >>>> with the last output from the guest
> >>>> [    3.183662] Registering SWP/SWPB emulation handler
> >>
> >> I looked through the patches and it does not seem that they can break
> >> anything.
> >> Could it be the same avocado/chardev socket glitch as in some previous
> >> failures?
> >> What happens when re-running this test?
> >
> > I ran it a couple of times with the patchset and it failed the same
> > way each time. Without is fine.
>
> I applied the patches and got no failures on my local machine.
>
> Do you have any ideas on debugging this bug?
> What does "arm-clang" means? Is the host compiler is clang?

Yes, it's a clang build (with the sanitizers enabled, though I didn't
see any output from the sanitizers in the logfile).

thanks
-- PMM
