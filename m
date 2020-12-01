Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp415429lfb;
        Tue, 1 Dec 2020 10:24:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRkSB/z0Deh0LQzLNDscPu9kkix6G5dXkcPKfjfoBD74u3diu4PswD2DyR37PXAjRWC/3E
X-Received: by 2002:a25:16c4:: with SMTP id 187mr4313030ybw.39.1606847083717;
        Tue, 01 Dec 2020 10:24:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606847083; cv=none;
        d=google.com; s=arc-20160816;
        b=yKW5ppzU3Pd8lphS2+RtTZg6cRpLd+2Jl5gW8uJUUKThR+rWdu4W/nJzDNdj3o26Ww
         9dykBgzENtO8bR7m5p8o0p2v+lgFEbzVxQ+9Z0BmgxNJ8/TGxDulRGiczZE+3Qh3P+Ky
         rtp9XjB543zlhrQlEW+0eZ2uXzSDK403TV//eSEW7wtd0yacfNf4HM07qsHrRxjtinrC
         L4pNBMpmqNXEVMlD5Y1kp3P85fJAPHBjj3mG9rGiht9Fx51KIlVx+SRCycSHgI9PvJoW
         wLgE1cnF8FqHY69r4+EJIbmb3Zt007aUVajLCPR6p7PX82EkZB0rdEehWJh1Z2ciuDsq
         7kqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=nDylUzpiXOUcneja2ipw/wkuQLpBRFshdUUIzVTRj2s=;
        b=LpWR/WZx+ebiB0oGtuGOX6Yf6b7s5FVGf2pjZt7JWolAHUPk6fa6nUJUn/6QHYMAQL
         4hpeOluCN5Jn2NwoDYaBlspLu4n27FHElu3LHX1IQ2gAyDto3jgDfbO+6q3Lf1gDaCAb
         xyTfg8sEYD1ACRoqp049DGFEYk0/S4nv0yGVh9Lj435Col2snr18FfIvTTojPUEQ93sE
         pYuuxeYTkOSHnDvZQNQtirnJ25WX0lv24CO3OiIyob8dhy3zC8wLhSC8gsCQFwqAS7Si
         C9n3AoevmkJ+4Bfduv5/H99WSiGXZMfonwCL44Ts3bWjn9agb3jx/Vuq1/9iTp5Poxe+
         AisA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zSJnA9Au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t4si406816ybd.382.2020.12.01.10.24.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 10:24:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zSJnA9Au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkAKR-0001gh-2J
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 13:24:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kkAJl-0001Ft-LT
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 13:24:01 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:43546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kkAJj-0003Am-S9
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 13:24:01 -0500
Received: by mail-ed1-x52c.google.com with SMTP id q16so4687202edv.10
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 10:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nDylUzpiXOUcneja2ipw/wkuQLpBRFshdUUIzVTRj2s=;
 b=zSJnA9Au2vDYLhNF+DQQxr0VzwXt0ul/1LJa2fSiwkzjeRDxPFDYV5d/OdhzYxPZPf
 jwPFpjv85HKZIgHQLtzR8NvrCWGy+jNTvRdMVmMrOeXuZe+E2ivcjzDY3Wd6aMQkDsh/
 +q2BIb9IcfypIlG0XR2a46yLHaZYrNaAPJ46umiYtvhH3UDIkzM2USBwZCFRbfefQTnW
 24++X28P211mJuWdbXKovndNRIT8KZLBOTv++PPAj3AdrnZiU6scsraK6TI3f1z1JtIh
 dST/AuCEWkjvEZR0NbJZfFJvHhOBaX3DrQmg4GpwVoG11Cr7q4YFuEzsW88aEAWBUtJi
 h+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nDylUzpiXOUcneja2ipw/wkuQLpBRFshdUUIzVTRj2s=;
 b=nOVvT5QfH4gDuJ/MRYp6cnt6mVdI/8B2S2jXUqHWmm+SEl5RbXVpui8gxBIb3+nESR
 5RsJkzP67RjrAwpRD7ds/p9cA+K+bWKKW59pivkX+jT0nNeQ0bEKrumXhaRriZGQJffM
 LF/qw6nBJhEUSV1LtAASdYRqzdNf1RsZKjhR7lBZhjRnEYtPT2qo7b/sYGNT1vFxN8uR
 nf/Hc2T7B4Dl9+cvvqO1RTzoARFg4i83eWD0lJKKCZfM8dVtw5RqNFFXeWax1yB51Dp5
 mCAGPGi0QUKxQd5xD5+3C+P4YATKALMkx03T2MFktY5Kc2T34G9sN7P2lltAKxkHrr6a
 Od1w==
X-Gm-Message-State: AOAM533xv+2rwspmJXZq9KkKMudD2XPpahkdSyw4KERhFyjZ+ahzF/Gc
 II2kDv/RYx6OFYgihBpdsMSocLEFAGs/euMPcROq5A==
X-Received: by 2002:a50:fe88:: with SMTP id d8mr4313199edt.36.1606847038218;
 Tue, 01 Dec 2020 10:23:58 -0800 (PST)
MIME-Version: 1.0
References: <3333301.iIbC2pHGDl@basile.remlab.net>
 <CAFEAcA9J0t1UtrNqGxst7-9kCq_+M3+xA6-h+xo3x9Z6Ccc5bw@mail.gmail.com>
 <2747838.e9J7NaK4W3@basile.remlab.net>
In-Reply-To: <2747838.e9J7NaK4W3@basile.remlab.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 18:23:46 +0000
Message-ID: <CAFEAcA8j9ZPLt95ObzMGF=yei_FLzduMSnFyS9MoDgQYPvGrhQ@mail.gmail.com>
Subject: Re: [PATCHv3 00/17] ARMv8.4 Secure EL2
To: =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zd7Uwd8OjWpJ

On Tue, 1 Dec 2020 at 17:42, R=C3=A9mi Denis-Courmont
<remi.denis.courmont@huawei.com> wrote:
>
> Le tiistaina 1. joulukuuta 2020, 18.54.36 EET Peter Maydell a =C3=A9crit =
:
> > On Mon, 23 Nov 2020 at 08:02, R=C3=A9mi Denis-Courmont
> >
> > <remi.denis.courmont@huawei.com> wrote:
> > > The following changes since commit
> 8cc30eb1400fc01f2b139cdd3dc524f8b84dbe07:
> > >   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-sparc-2020=
1122'
> > >   into staging (2020-11-22 15:02:52 +0000)>
> > > follow.
> > >
> > > Changes since version 2:
> > > - Don't set HPFAR.NS in AT instruction in NS state.
> >
> > This series seems to break the 'make check-acceptance' tests. Specifica=
lly
> > the vexpress-a9 image fails to boot:
> >  (20/40)
> > tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_vexpre=
ssa9
> > : INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
> > Timeout reached\nOriginal status: ERROR\n{'name':
> > '20-tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ve=
xpres
> > sa9', 'logdir':
> > '/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang/tes... (90=
.23
> > s)
>
> The base tests fail without the patchset seem to assume an US American lo=
cale,
> which is frankly infuriatingly culturally insensitive.

I run them with en_GB.UTF-8, which works fine for me, but it's a bug
in the test suite if something's locale dependent and not ensuring
it is set correctly.

> As for the acceptance tests fail equally early without the patchset with =
a
> completely helpless diagnostic about unresolved references. Wiki does not=
 help
> either.

I just run "make -C my-build-dir check-acceptance"; I don't know anything
about the internals. It would help if you quoted the error messages
you see.

FWIW, I also see a hang on a manual run of a different vexpress-a9
kernel, so the bug is not specific to the check-acceptance tests.

thanks
-- PMM
