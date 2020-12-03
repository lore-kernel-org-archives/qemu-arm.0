Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp515915lfb;
        Thu, 3 Dec 2020 08:25:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzRmmSq8DmeMzcGA1PSijnckPIKkb/Xjv9HKKYOluoLfnJFTgogbRajDZgwdNxKg9zBllA
X-Received: by 2002:a25:df05:: with SMTP id w5mr6241763ybg.20.1607012715373;
        Thu, 03 Dec 2020 08:25:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607012715; cv=none;
        d=google.com; s=arc-20160816;
        b=W3IBwRl9S59e4h5d0Vzm/F36vNfIYPlQiVTVrqDhxOrV6He6nvE4d96Ao+WETvI/CK
         shCjNctxS99rD2s21P+aLfurVVrDm9vi2Iwfxb8VAMWiKQVRpn7UoOIBf7EX+JnZUWiC
         eXUWFmzh5h4NXdpUIdx0s3r3dVppVnHuuoG7PN2Z1eRPpPdjzH+qRAI3NnSZRO6O3hs8
         5O8BuXRLmPojEqFDi6vHkeEXloKBep5KYTJDz5bKfp05i/gfzaBdjepH9Bme8/bBYmYo
         lbRWFJR1iZIN64GSnf3w/65uVOH1sJSNs7OKSrd12smTmeKOpyj+Zh2IZ7UEpKbnRjD8
         ACEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=mF0qSWz+6lBvc9Sq7KVrbzTmDoSEC/HrEwNjsh2nOTQ=;
        b=Py+ld+CR1vADA/LTgk+q2VHmMNWxEgnhAWypdn75C/OwqB1Dm78GAVytSXZbfszUai
         Xz9UT6Z5/rU+3/vBXRvj9OfaZq5SSWAc3WnmkF+80bFYAYmoeUz7WdC1w0D3WBXucAGd
         gZBHBowWD+Y2KNx0g8n55j8Szp3z1ZY3TdMMIEjEsx8CeP6rG2oYbpPhQTlLAG/6Qf0U
         RCZAxCfgfuA5Vw0DZT4W0Pr9zu4TXCU9tBP9JWbBSgMlT8gf8wN+8bhgjsEMCBTBF/Pk
         8T8txlhAFePNZIobeNAeQLC0FXk5an8gVbSZ0wgKDLS/a96XTKfqYJXlhbLGSK6I1/j6
         Yc2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gsFbZrcX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m145si1903075ybf.447.2020.12.03.08.25.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Dec 2020 08:25:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gsFbZrcX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkrPu-0005ol-PF
	for alex.bennee@linaro.org; Thu, 03 Dec 2020 11:25:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kkrFL-0002LN-9a
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 11:14:19 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:33216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kkrFJ-0002md-4P
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 11:14:18 -0500
Received: by mail-ej1-x642.google.com with SMTP id 7so4335717ejm.0
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 08:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mF0qSWz+6lBvc9Sq7KVrbzTmDoSEC/HrEwNjsh2nOTQ=;
 b=gsFbZrcXbRW56QwVacjbEbWTOpijDY+wFYhDi1IUO7nlk2y5UngqBG3+LOg+VP1Mh2
 tvbzx2dcMDKzxzOLgHscskZfrTTwhalMpDlpmnHStnPQfPUSwx5ac83iFYWuEJnVK+n3
 Gh35wpuE7g1enSL+xw7i6xn/vU9dk2JX1TYxOwx64y59kpGdKWsbm6bHvYCCdkKqOgWI
 UgTlbqIMQ/aSfHAUlhrjd/ETCdu7R9CwPzXKLqOPATG1hTJX55AANyCPl1DFu6KjuXAH
 wexkp8LhyGW+m8l1gKGCxNwSKE805wgm3utlYrhWtlSPVMB6AbFEH8JJpwuruRC7yMWY
 jk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mF0qSWz+6lBvc9Sq7KVrbzTmDoSEC/HrEwNjsh2nOTQ=;
 b=UZLxf1LRXaFXtBe3iftKrelUGW4+yuPVkXKU57zf/Y2wKCnLfCjYV6ZQ46GYGwhJZu
 SKenieigQ1ghXlpUpQUiw4lYmL+QJaesczjPxRTASLDp/hVTAivUJ7wwPdbw0LB7LtNk
 XczWV7Cq6yJaOSNCi5XSRMaWZW/xLrAozGI9uOpspLPZdqAMGH1r4B6ap0gwDcTefRJe
 rJDDUH//PTviBd8HAKCfMraf9mhlnQicivYZxaobguVJoAdXR9c+HGIr1XnY2n9QhQzo
 I2JNZddDNS0BUaTQJ6lWOEw+oPrgTmZQ763sUKZOnsOZ50U+vhEGRK7hJxwFr7GaaSZt
 HQYw==
X-Gm-Message-State: AOAM533CXqRFeu3W7+HLDeXU7pxiCuKUWSvlmCGQYMMffG+rDm8NMyQr
 j82206sVL3pC29vlz8ZLu/Ut8GXkQd2ZIjLDvWvNaw==
X-Received: by 2002:a17:906:4bc6:: with SMTP id x6mr3167295ejv.4.1607012055361; 
 Thu, 03 Dec 2020 08:14:15 -0800 (PST)
MIME-Version: 1.0
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
 <CAFEAcA9XFGbyYfcpoOVhtV_wySi9=DyMGe84C4uwYG14Z6bD6Q@mail.gmail.com>
 <56701347-e0a0-ae47-8bba-f5cdff253475@redhat.com>
 <3d6d46d8-04bc-7ad8-d71e-4ce15a6e7e47@ispras.ru>
In-Reply-To: <3d6d46d8-04bc-7ad8-d71e-4ce15a6e7e47@ispras.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Dec 2020 16:14:03 +0000
Message-ID: <CAFEAcA_ATUZ+v8VE8q34mmi3pLhg3qFDHgi7mQB-JJKDEZuzaw@mail.gmail.com>
Subject: Re: [PATCH for-6.0 00/11] target/arm: enforce alignment
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sdmz84/PXEE9

On Thu, 3 Dec 2020 at 16:10, Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> wr=
ote:
>
> On 03.12.2020 15:30, Philippe Mathieu-Daud=C3=A9 wrote:
> > Cc'ing Pavel
> >
> > On 12/1/20 4:55 PM, Peter Maydell wrote:
> >> On Wed, 25 Nov 2020 at 04:06, Richard Henderson
> >> <richard.henderson@linaro.org> wrote:
> >>>
> >>> As reported in https://bugs.launchpad.net/bugs/1905356
> >>>
> >>> Not implementing SCTLR.A, but all of the other required
> >>> alignment for SCTLR.A=3D0 in Table A3-1.
> >>
> >> Something in this series breaks the 'make check-acceptance'
> >> record-and-replay test:
> >>
> >>   (30/40) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_aa=
rch64_virt:
> >> PASS (9.14 s)
> >>   (31/40) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_ar=
m_virt:
> >> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
> >> Timeout reached\nOriginal status: ERROR\n{'name':
> >> '31-tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_arm_virt=
',
> >> 'logdir': '/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang=
/tests/result...
> >> (90.19 s)
> >>
> >> The log shows the "recording execution" apparently hanging,
> >> with the last output from the guest
> >> [    3.183662] Registering SWP/SWPB emulation handler
>
> I looked through the patches and it does not seem that they can break
> anything.
> Could it be the same avocado/chardev socket glitch as in some previous
> failures?
> What happens when re-running this test?

I ran it a couple of times with the patchset and it failed the same
way each time. Without is fine.

thanks
-- PMM
