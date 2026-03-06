Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A32F0180E
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 09:33:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyRXp-0004vL-7v; Fri, 06 Mar 2026 04:32:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vyRXU-0004tE-Ha
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 04:32:18 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vyRXR-00025H-5j
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 04:32:07 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso98119185e9.0
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 01:31:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772789512; cv=none;
 d=google.com; s=arc-20240605;
 b=Oe2Z+kTyUJvRW3fvpRdTnHxCbDVWHSJjYdiEXDYs2ez8KK2Oe11PziDGvTPrGsm91i
 YTYwJJXclgI48nnAgjaO1GgSISPMOdAJvRvr06Ks9Umj+NNpTRfzULcOwB12i/33nQOF
 TP/dIYrBe7NNmTt3VV3PM8Zi7EUtJZX/Lq8bJWCEeIoFD+f6mHLpZhiyVYb0cFkW8Syk
 CZQ58elWriI9wPn6HRrNPCC9qFk4Cn/EsjIaHUMfittHr70Mbz6ZssvFD/G0X0uwgJCA
 jL9OrjDlZA9PWvn14gwIWDVhj3onWfdFSF82Ten0wckwe0jhIboN4O5xk7VhKd+xfHW7
 8SDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=qvcGBQuS3QfzV0JdzUqqf1NGYvG1FrQLFPBmrjC0hQY=;
 fh=jkagGXtCYkYmZlDcSyZiJSKrd7lm0lJ3/nwKOLFxv5M=;
 b=jLUzs9l3xEC7dMwotlUXpHkx9+7U0trdc418qT05oWSaDpVr7n41p5R313wHiIZbXv
 Y6tPsdpJh1jVkr2UoOdAifGwsduyl34XIwIxAaLj7ILcPY1yD0oYzj2dK1WMh0Gjk58u
 tdTeAyZ4WKhiP8QQcj9cIoIzf8cfICQxBG0GtVh+nArBoGAkKtRBJrLThGPVqqXfIg1F
 q+M4yhsRbp7DhOTTeHrMbqBMykpNZy3ppAllrk66gyTB44BiW9TINvvMkoO3qrpmCp4P
 Bs3fnC/Eg0gwQ4zy9HygxRB/9kmOQNjtXJO+Xz4Ap+amjPGQOEZwQjYHH+I8kpgxxgo6
 WvHw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772789512; x=1773394312; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qvcGBQuS3QfzV0JdzUqqf1NGYvG1FrQLFPBmrjC0hQY=;
 b=jgh58OI43T5OkKdd92Kx5WbErRZaeT8nmoH32oaGvIDyn/pNGOjOBu98VBcvkqzNQV
 4r9EhXD/6QPIZtIY1amh4rE4vXr1gSY6wZUNIMwV7k/ygcEIC1/sGELrc2U8yqbwyePE
 HgXOLxNyYnygalJoNB9OLqSxgSVOe8nO6j3608dbiPku1cKAG1YPKJcGZK/gNMZtjPOW
 z84Z6Sio+0m2ODRlNtWnC57kuy6CaZngsi3K5XBj0rvEQSMjLfIxZYmK5k9VoTQ8uW8N
 zx2YeLs5+5FLdw5dBfOLU4+AJrAVeK+gcUUcWedFPVAsNO77sDemlrppkU42PxekrKzU
 ZIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772789512; x=1773394312;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qvcGBQuS3QfzV0JdzUqqf1NGYvG1FrQLFPBmrjC0hQY=;
 b=w9b0JwcmWvhBGTwsWzWw0A4X4TGVw5NaxCAI3EshTotc8lO9C61GICNhlWdn8a9uMl
 QgAtoIjU4sK+HxK7G2qRwjkkolh1m6juKWStdvnLcipedfy+pS90YTtW2lW+GYk8g3E6
 9oKboO1LzZR5aktzJRMLoSyHSH+IRE4QaxjBg/zOO7eCK92F5E+dSFmTSMLC8Hven5Qt
 nivGDA136UdANUBiSitGpPPMjwMfkZDoxHo9Egtxt7ixU+ziex7wjLDvhBQnO1rLqWP4
 PcezI5o8sATCTWdUAJkLdtt1zH8WaNqhpmvZdL8SbEOSo8xgHTXRfNMbbtVbtDJgK8+c
 ZBhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUryusUnRCYicJXKJ4j2OzZ7KVInSgqBPE82dFk5jPc4br3T/5vsXWB+Snq9kcOxUniIFQFBpABpw==@nongnu.org
X-Gm-Message-State: AOJu0YyN+TIS35BcYvDkzBa5gmNha7CgBtvQeYUbQYyxIdpZNYe+pz5p
 2T/m8QF7GvAlweWs8KO7wybfg9OrvEhlQRSM98hRU1QPJZH9Mnsr8bpTfOGkBzZGxUO6zCqKicF
 nG2OM9f+Q8vM4XAiaBOQPxSXh6sdwRxKdZx5c8wJ1kw==
X-Gm-Gg: ATEYQzzuHQ5bwITyNGTGmx8+LLgfdrwab8WQfs6wYB0Vn3igntMf6+vh+ZVNMxvvpIo
 jMSuzQFs/KMiWzVJyREbi3jsmjR73Rx+YATRDBJgShYgRxmjaVlV93VjkaXztnYGhnOJ9hlJKd9
 5RQFyFuTHhCMyDk0s1dG75UugPPl/44FPcaCR6PDwBsiIvGFCiMAX4JIBcDrvhuAzFB4JaVUjNs
 l0Cq1nElPqQGtLqkUHN2kVdJO+nVM0Cy2aQTPvai6lfq3MaWjRF5zHDPHsXVnFuSgJG1RhpY0GS
 2Yb0K1xmOYyr1ajprdqgkc8wLjHq8mUccgBHxg84GjJL918Uyg==
X-Received: by 2002:a05:600c:1551:b0:47e:e87f:4bba with SMTP id
 5b1f17b1804b1-4852696934emr22390385e9.29.1772789512440; Fri, 06 Mar 2026
 01:31:52 -0800 (PST)
MIME-Version: 1.0
References: <20260303-sme2-hvf-v6-0-b473702d8287@linaro.org>
 <20260303-sme2-hvf-v6-1-b473702d8287@linaro.org>
 <CAFEAcA8zTkc4pyHQKoDkTMhGPLQmxBaJS3bZiGRrPgux3rDLzw@mail.gmail.com>
In-Reply-To: <CAFEAcA8zTkc4pyHQKoDkTMhGPLQmxBaJS3bZiGRrPgux3rDLzw@mail.gmail.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 6 Mar 2026 11:31:26 +0200
X-Gm-Features: AaiRm531CxY9a4swvztKYl0fEGNIqco6Qum_hqbWYxHto7dV761FAriOPA1jokY
Message-ID: <CAAjaMXbXdrW9N1xLMPxL9OmjLqti6A3rqAmYipu6OkdBY8JPNQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] hvf/arm: handle FEAT_SME2 migration
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>,
 qemu-arm@nongnu.org, Mohamed Mediouni <mohamed@unpredictable.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Mar 6, 2026 at 11:19=E2=80=AFAM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Tue, 3 Mar 2026 at 07:42, Manos Pitsidianakis
> <manos.pitsidianakis@linaro.org> wrote:
> >
> > SME2 support adds the following state for HVF guests:
> >
> > - Vector registers Z0, ... , Z31 (introduced by FEAT_SVE but HVF does
> >   not support it)
> > - Predicate registers P0, .., P15 (also FEAT_SVE)
> > - ZA register
> > - ZT0 register
> > - PSTATE.{SM,ZA} bits (SVCR pseudo-register)
> > - SMPRI_EL1 which handles the PE's priority in the SMCU
> > - TPIDR2_EL0 the thread local ID register for SME
>
> Mohamed points out that this breaks the build when compiling
> with GCC (which I hadn't noticed because I happen to do my testing
> of target-arm with clang on Linux these days):

Oops. same here, I was using clang.


>
> > --- /dev/null
> > +++ b/target/arm/hvf/hvf_sme_stubs.h
> > @@ -0,0 +1,158 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +
> > +typedef int32_t hv_return_t;
> > +typedef uint64_t hv_vcpu_t;
>
>
> > +typedef __attribute__((ext_vector_type(64))) uint8_t hv_sme_zt0_uchar6=
4_t;
>
> The "ext_vector_type()" attribute is clang specific and gcc
> doesn't recognize it.
>
> Since we're defining all these types specifically because the system
> headers are not providing them and only for the prototypes, my
> preference would be to simply drop the attribute from this
> declaration:
>
> typedef uint8_t hv_sme_zt0_uchar64_t;
>
> Could somebody confirm that that works OK on the relevant macos
> configurations ?

I think this works. Do you want me to send a new revision?

>
> thanks
> -- PMM

--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd

