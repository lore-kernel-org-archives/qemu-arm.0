Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF03BD2D0ED
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Jan 2026 13:05:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfe53-0000FM-Aq; Tue, 13 Jan 2026 08:05:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vfe51-0000BJ-Ml
 for qemu-arm@nongnu.org; Tue, 13 Jan 2026 08:05:03 -0500
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vfe4z-0001cP-9Z
 for qemu-arm@nongnu.org; Tue, 13 Jan 2026 08:05:03 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-78fb6c7874cso82017787b3.0
 for <qemu-arm@nongnu.org>; Tue, 13 Jan 2026 05:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768309500; x=1768914300; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GGP9pogrURu6COy4QscKhkqpeRI6BYk1AL6F+e+sjmw=;
 b=sgfcXrdH0G04BQKQ70bGwxibZByOc+zG6c9ogCYLox2NscucUCRfPnsAQKPWg2JPq1
 Qomev3RQ4XcD+iSKZZlD5H9StmVC5zrcpfvbDbQJI2EvRavRzbkXEZgLvooGPoOFi9Wc
 P/19ITcJ0W4od3IAabipESHjKmG7Eeu3k5Y0yi3do6Xis5w78qofVocuEWVCrqdn+luM
 SLhHYBXKUXJCVSYoYgBbnH2S4m95kL+0+UCeWPyfp8YtC83Hiq0S4hF7yz1vD33phzVE
 KBcnMMcG8evOgt09GZKDji+HyIr3HaVdfuY9PRfMNrNbXfNVWd1AdQr072cxuPIUB2KR
 39/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768309500; x=1768914300;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GGP9pogrURu6COy4QscKhkqpeRI6BYk1AL6F+e+sjmw=;
 b=GcZVrKNPHd0D+gXaVKmHkPVMN4aW+nvo34L3+j5cOkHGQZ/0eok3nLZYAHz3cuL5KC
 7S3WNpBQKv7k7Ww3djxdRl5AgVfN7VJs1TsVlQjStQVWIJ2Ot36OQs9/hwXfZVF6q5wq
 iGEkFGEmCc3CndZ2zjcaht2KyIDJOiP7hw/dD8ZzYWhg8aCTxsvs9Jnc4IOGcSkaSUTz
 /cQlSkjZqNYv2nDMXcoIWvKkC72zrj/MWpkh5QAop+xam5TmpgJBolb1IBTCoyUtdpgR
 dgJBiSCNh1SxVYKeoU5aImepLZysL1tMkl70nTY/k2YOTKYtwDAKhxmThJ/g6pnrEbsK
 m3/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC7aGL9XO7acvSYWXdcNX4gOh93haS9BFIpd2cC1y0jYd2uiKAgoxItAXS0gXT/mHIMRC2dVT6iw==@nongnu.org
X-Gm-Message-State: AOJu0Yxbov7amwGvc8dHKteuF80fD0qSWW+pDuwjF0BwTW5bgNdEjIim
 5syqjXAkagvy7XoZgfl1qoc78TCnSJVcoQG3GkTWktJbqcOo0d05t9wYJvwxt7paZg1XGf6M4ne
 uV5v2w+7JGuijSgaFDik3ScCGmYX+0rBJdea2yfBWaQ==
X-Gm-Gg: AY/fxX7B8PEdoR0/9UCwXVApASAhDQkXulcqfsMIBLcuAb9xXo5pG81yHEyP7+62P8Y
 mOGlPf5z5nrCz6YMQ3NgjAkOeeURlDpftC0HGVdY0E+VyFsDXXaDy/425yp/ktquJ+881GhDoJS
 NoUr0O77hK7kwqXE+N2tYbQ2xT7qqTqcosDaaES32cCzm4M8UsOeCtKjjghptZWr4kBYzeKJVvo
 9I5rsJdnjjRfOZKNBgFzfgXZO5qnCYx/GFw2w6cBfS6kevML0eOMFp6EGX4EtV2igy0dZ/lhcVD
 +5jV1iz7iDypvf/hPMLgFBQ=
X-Google-Smtp-Source: AGHT+IHQtHtKnt78UsVyFuVtrBhh4vIgmO871yuANhGR3F7ABjae7Y+nc8JoZfq4vxZ9+DkHUlhRhF9MCTQSrarUCcc=
X-Received: by 2002:a05:690e:4195:b0:646:7a21:f03c with SMTP id
 956f58d0204a3-64716c9dd66mr17404436d50.81.1768309499959; Tue, 13 Jan 2026
 05:04:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1767716928.git.mchehab+huawei@kernel.org>
 <CAFEAcA_TMuZG8VJMs2JZ49Xq+wVxcq_7UGOMF+2FUe0k7AUgwA@mail.gmail.com>
 <aWY10BYoJjck3xX8@redhat.com>
In-Reply-To: <aWY10BYoJjck3xX8@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jan 2026 13:04:48 +0000
X-Gm-Features: AZwV_QgnWogDDwf6bylM0e_z-Ke0E-6T6CGTvYJ-MkEz1ntFVBkkixZ9VzADUI8
Message-ID: <CAFEAcA9wnmZOLnA3zb6FPfjrEs-3PRBmyBs=FfiQW2OY5GJfTw@mail.gmail.com>
Subject: Re: [PATCH 0/1] Sync kernel-doc.py with Linux upstream
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Igor Mammedov <imammedo@redhat.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Tue, 13 Jan 2026 at 12:09, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> TL;DR: I would not want to see a new top level tools/ directory
> created, and don't think it fits in python/ either; scripts/ is
> a fine home.

We do already have a tools/ directory, as it happens.
It has two things in it...

Personally I think tools/ ought to be for the set of
things that we build if you --enable-tools in configure
and which we document in docs/tools.
tools/i386/qemu-vmsr-helper.c fits in that idea of
what the directory is for. tools/ebpf/ does not, but
I don't know enough about what it's for to suggest
a better home for it.

We might at some point want to tidy up the qemu-io.c,
qemu-bridge-helper.c, etc that currently live in the
top level directory so they go in tools/ instead.

thanks
-- PMM

