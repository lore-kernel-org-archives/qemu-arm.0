Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E12CAC5B8
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Oct 2025 12:08:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v5k0q-0002Cq-FD; Mon, 06 Oct 2025 08:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v5k0p-0002C8-1Y
 for qemu-arm@nongnu.org; Mon, 06 Oct 2025 08:08:19 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v5k0d-0004BA-4C
 for qemu-arm@nongnu.org; Mon, 06 Oct 2025 08:08:18 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-71d71bcab6fso48860897b3.0
 for <qemu-arm@nongnu.org>; Mon, 06 Oct 2025 05:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759752483; x=1760357283; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dWtN/BQNKDNruOvqhY6XFXqr6A4r08zr2pZxCpYPS44=;
 b=x6/ES/obBv+99Ly/Oi5/jdoLyhjpAVEME6zMxt5RsYXgX2/mYkxztCXy/1aYkKaWgL
 FW9bb728Z0qKMG/DwqVz8gwAsDnkFLbKJw591+9KVVTaTc7vugPqPpf/KYX0WZ0dwtqN
 33t0VMBGic4nys+w7NscCfYz1zvgYwIeSy0dmy8BRpEK9tYNkOVVd1OZw5/JXqLqF7s1
 CkAu4o3L1gejzE4U/os1Lhrg6jrwVQuwy7dIQn4NAzKOZRCvTt/sotLfT0rWVXgvyKGx
 pmZeTLkLGHNM/ue6EYChEGEj5jdwfwd6zmgS7aBbqdkmLTt2wx7MCAVHGxBxNl9QAY3g
 uM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759752483; x=1760357283;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dWtN/BQNKDNruOvqhY6XFXqr6A4r08zr2pZxCpYPS44=;
 b=XlVWrJMqSC2OueyIUGYQggwxotXW68IySUWozPn4SHq4V5v2mAUoWj/1jqhp2boj9r
 d/9E7nGB/GtgfpTDMujP3jDDFXz36CvLx0xGYJEFYSljaQOp4PjWk+Bad6M3uisk+Ke+
 XXSDoY9R2l7bl892Qs7Rx/0NqUxddWSXiWCTPcvjrsg1AAHqz4SomdtdUJLyxB4ztmc9
 Y+YpKXrrsB/iPsoIglO+h/3Re9FmS/vpKv2gJlz0BhM71BexJ9Ds78rgHbItU6Ez9ecJ
 wyMNvGEGehXlKk0CTSaHhxMW/Q9ChLEaem4JHNlU0zm9VD7sAEW4CMlw/DyEez3GJce2
 PE4Q==
X-Gm-Message-State: AOJu0Yx4P15SD+8SJfAiwGuTHD2zDF4Fei2trdUG2/q8bqZkPzYbFxpW
 zLELiE1DaySUvl9iyFGdENtZa+swMN0rDR4m8DbEk8Px56b7oD93ysGcRSKghTcAA7PEq0TrPvI
 le7T/LmLY3vweWq8UWMzLEkZK0f6hx+EdQmd1ixEnNA==
X-Gm-Gg: ASbGnctRvEHGeorEDahFNn0dcCnfv1CjvjgNCwlZ+9u6oSUNSgM1LmH/itlemGxj5Kj
 HC9/OO42i++Z8wLJAg4PKuN8YORdED5C47DqdQbSMzjP0HOIjXzWphBu705de1K9qyIB4Itta7B
 6XsURMrm95H1Y+LDpZ/YPtqfYxXGGHLXhOMQKQEi/B697BFEN1AHlFfZ6v/Avk7w8iq4pTXLpqW
 V7jD9NC8CG5FqCOvaSmHH4kC/nlNxdrU0q8AqN0ETaV6Ck=
X-Google-Smtp-Source: AGHT+IHe6lNjA2RTEGS3da0GpUv/2yNzdnWYSJePsZE6sMe4TvT9UtD8R8DftfQiyKjsMB23lxPooM0Lidio3WKJAOI=
X-Received: by 2002:a05:690e:1650:b0:63b:a404:6c46 with SMTP id
 956f58d0204a3-63ba4046e59mr9126158d50.24.1759752482853; Mon, 06 Oct 2025
 05:08:02 -0700 (PDT)
MIME-Version: 1.0
References: <20251006115022.164004-1-thuth@redhat.com>
In-Reply-To: <20251006115022.164004-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Oct 2025 13:07:51 +0100
X-Gm-Features: AS18NWDJ6wturVsYa0FoLwVMDUvREB-OQBILppdFs1cITMv00JYyBLSU2EZrCwg
Message-ID: <CAFEAcA_vKwfX-G8rJpSH-_+6VcEHa8wdMh66Yreh5PB6tcSJQA@mail.gmail.com>
Subject: Re: [PATCH] tests/functional/aarch64: Skip some sbsaref_alpile tests
 by default
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Radoslaw Biernacki <rad@semihalf.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 6 Oct 2025 at 12:50, Thomas Huth <thuth@redhat.com> wrote:
>
> From: Thomas Huth <thuth@redhat.com>
>
> test_sbsaref_alpine is one of the longest running tests in our testsuite,
> because it does a full Linux boot a couple of times, for various differen=
t
> CPU configurations. That's quite a lot of testing each time, for a rather
> small additional test coverage, so mark some of the tests with the
> @skipSlowTest() decorator.
>
> Suggested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  See: https://lore.kernel.org/qemu-devel/87eczriaej.fsf@draig.linaro.org

That suggests dropping the subtests entirely, not merely
marking them as "slow". I think I agree with that.

>  tests/functional/aarch64/test_sbsaref_alpine.py | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tests/functional/aarch64/test_sbsaref_alpine.py b/tests/func=
tional/aarch64/test_sbsaref_alpine.py
> index abb8f5114bd..33e77cc7049 100755
> --- a/tests/functional/aarch64/test_sbsaref_alpine.py
> +++ b/tests/functional/aarch64/test_sbsaref_alpine.py
> @@ -41,12 +41,14 @@ def boot_alpine_linux(self, cpu=3DNone):
>          self.vm.launch()
>          wait_for_console_pattern(self, "Welcome to Alpine Linux 3.17")
>
> +    @skipSlowTest()
>      def test_sbsaref_alpine_linux_cortex_a57(self):
>          self.boot_alpine_linux("cortex-a57")
>
>      def test_sbsaref_alpine_linux_default_cpu(self):
>          self.boot_alpine_linux()
>
> +    @skipSlowTest()
>      def test_sbsaref_alpine_linux_max_pauth_off(self):
>          self.boot_alpine_linux("max,pauth=3Doff")

This is odd, because the slow case is the default CPU
one, not the pauth=3Doff one (which is faster because we
are disabling the slow pauth checks).

thanks
-- PMM

