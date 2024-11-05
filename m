Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2865590njc;
        Tue, 5 Nov 2024 06:38:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVj6C2olrZnarkOtLJ5B3Iuu/AxjsuQ/5JlhKTGHTW11fK7ScU6EGj2pAiMu99EOLRonksXdCCi+Bp90A==@linaro.org
X-Google-Smtp-Source: AGHT+IHTBBKbYKGnGiuX+B9NTl7NSSl1i+rsKRXdO8tLtyET3bmoRAlV5y2qK0vE0vre6u/RLrg3
X-Received: by 2002:a05:6830:34a0:b0:716:ab1b:6473 with SMTP id 46e09a7af769-719ca25bcbdmr10592187a34.30.1730817530611;
        Tue, 05 Nov 2024 06:38:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730817530; cv=none;
        d=google.com; s=arc-20240605;
        b=TPJWbNQFO9uPV9mLC2K6ZDBQAvcFVQlwIY6Sz/aETKb/vNxdxBLYUaF2VO6KCEpDH3
         s1eVAoJ949+q8ttw9buBBGt0jxGo0YhefuiWwUTOrsvGjAX3E5HTu05jSvvg/mIVSG4S
         cIgfohUS8R+XOXyyCpNWW58oW4Ko5/tiOYiF0nv7x7i96NCYkPqzrveY0tWzBpK5JLfi
         DCVCxmZ9Z2Sbsw1E0dCYw/0DddFkm+p87e9rthtvtdF+/73TW2bww5iL7VndguBbIm9j
         GnXZGWEGIVyDOfOdq+2j1BwOhBTUWZ05JUawQ4iCVObJxpOEFIEvfhrz+Q+giA2bz1/r
         lL6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=KwKE1gM/FxM2KY8MQQzWbUzus/O47sxJIGMJvhcb5kg=;
        fh=PIvmbBazQUQQhT+gYMHl6Z/mBhDs8mT8bOOE1EGjzd0=;
        b=AKWkn3NEX8H361C0PWJqRAlqBZ9rCeKkKOrrzld5WZDbjWa4avSAIHwAg76zn5Rh6A
         SxcvVRnBP/VooNm7YjJeSMfl/kjK8BypvyTxWoFR3w5H8lBvo4Eq9yzYLOOKQjf41nor
         616JB9Jm56D/AfnpQqlQVKKP2C8hLdZyEEHXVUAXM3Z9P2Sgtl1tYbuOthleXy1giOLQ
         zsxLCekMihsSz8NGCh4tPHGXIP6B3EUbASrLyldruIm1+pxDKNQtbV4ONW9ItuAkwJoC
         2PbDDQNB8+tiRU1kCJ4wyDDgZOPAV9blnK1Q29jXGKxityLf6nFZ4hiAY0p4lb7hcNVq
         wIMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qh2bZvS+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f3ad1bf4si1354613785a.698.2024.11.05.06.38.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 06:38:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qh2bZvS+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8KhU-0001cT-Pi; Tue, 05 Nov 2024 09:38:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t8KhS-0001YF-Qh
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 09:38:30 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t8KhR-0006hG-4u
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 09:38:30 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c9634c9160so6325503a12.2
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 06:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730817507; x=1731422307; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KwKE1gM/FxM2KY8MQQzWbUzus/O47sxJIGMJvhcb5kg=;
 b=qh2bZvS+xCNjus0npYVyKrFA7/I++3A635ybsQBnPejOcDWAErEP0aiHgQYttgVdOZ
 rODoQcFLoJeF4xfSHDQjlKlMeKGN+wiMIrC/mbM2SbpDVfWbnzHi84hh7cQY3CU7UOsk
 TsfDR3y+OAoXi/+EatS7sulQ01kovhD3PzQUdYK9xfyEYH/RsNJKG+W6goOlYNx3IXng
 HWgfoddOTPfAiMns4+d4d0Hmd2XYLwaEW2ZMKIdvAol9Ze+fmw+2A1Tf4cn+9lgr37PG
 NRqnzJDzI9pnmb6j941fP6DF3krwxOOxWpNOig0uIx0gGAZlFvxLwMqOynZ91BqhLyHe
 KZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730817507; x=1731422307;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KwKE1gM/FxM2KY8MQQzWbUzus/O47sxJIGMJvhcb5kg=;
 b=fYKOaAsw6SDoAw+ZUEmICtzZxHi5Kxfwt1dO0dqiuMCLuBaFVNESARsgYAYiEiudNd
 /0ifr9BOMY0fPPegJHP56fYBdML7ywYKpkQDE7ySFYwtsg4VT5+ms6KhC7OpzsNa6/VW
 ydgT48zQwQPXQeRtC07hYsFioLTAyLo17w+k5sgMTb1Zj2S2f4j7r7gfgAl/hphvrHEG
 19IZW0M6b9F5dO4uBNtTo3OZkVZMcH+fu6si/8X3+rabZXnENs0xPnXcu4ddHFnNZCXi
 ccUEbOouqbKPmpQqk29J/sp4VuFXpqwUaeig3vOiuNJRzGt/XVksf0DriHCBSa/XsJ/u
 wr0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIA28F8pW8DW0b6D7yt1QcfzgkEEePaHUTtksBN1w4EyeGq5/+cN7ih2stenWfLmicboX4gqBPnQ==@nongnu.org
X-Gm-Message-State: AOJu0Yyqt0I7Z88/C9a37ArDEiVAJ3TC9IMafQZ5D8mcPP7q/I8uc+EO
 ECwXdD/oTD2xcmkCeQyremMUjwFRvBkXgzdncHFsfOPYG64nh/v2bwzv+UoY4RINpI7RMAHjNXU
 cdEK6X/fTDF2CoB6rl/tatuMgHHME2XCBbzbLVgRyHhjvCp1q
X-Received: by 2002:a05:6402:2790:b0:5ce:d4ff:606 with SMTP id
 4fb4d7f45d1cf-5ced4ff0642mr6568182a12.34.1730817507204; Tue, 05 Nov 2024
 06:38:27 -0800 (PST)
MIME-Version: 1.0
References: <20241105132339.2967202-1-clg@redhat.com>
In-Reply-To: <20241105132339.2967202-1-clg@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Nov 2024 14:38:15 +0000
Message-ID: <CAFEAcA9yP3=C5=wuXbBDQ0bSGonjGAyJ387=KsAcPS09Kn4pHg@mail.gmail.com>
Subject: Re: [PATCH] test/functional: Fix Aspeed buildroot tests
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: H61Filh+QqTX

On Tue, 5 Nov 2024 at 13:23, C=C3=A9dric Le Goater <clg@redhat.com> wrote:
>
> Since commit 786bc2255256, cached asset files are read-only. Adjust
> the QEMU command line for buildroot tests to reflect the new
> constraint on the flash drive.
>
> Fixes: f04cb2d00d5c ("tests/functional: Convert most Aspeed machine tests=
")
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@redhat.com>
> ---
>  tests/functional/test_arm_aspeed.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/functional/test_arm_aspeed.py b/tests/functional/test_=
arm_aspeed.py
> index 9761fc06a454..19853161b267 100644
> --- a/tests/functional/test_arm_aspeed.py
> +++ b/tests/functional/test_arm_aspeed.py
> @@ -125,7 +125,7 @@ def test_arm_ast2500_romulus_openbmc_v2_9_0(self):
>      def do_test_arm_aspeed_buildroot_start(self, image, cpu_id, pattern=
=3D'Aspeed EVB'):
>          self.require_netdev('user')
>          self.vm.set_console()
> -        self.vm.add_args('-drive', 'file=3D' + image + ',if=3Dmtd,format=
=3Draw',
> +        self.vm.add_args('-drive', 'file=3D' + image + ',if=3Dmtd,format=
=3Draw,read-only=3Dtrue',
>                           '-net', 'nic', '-net', 'user')

There are a couple of other places in this file where we add
a '-drive' option pointing to a file -- do they also need
read-only=3Dtrue adding ?

thanks
-- PMM
