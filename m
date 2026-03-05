Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54D6F30931
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 10:37:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vy64r-0006YD-Dt; Thu, 05 Mar 2026 05:37:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vy64p-0006Xq-Dm
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 05:37:07 -0500
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vy64n-0003Q0-Rq
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 05:37:07 -0500
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-64ad019bbd4so7140676d50.0
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2026 02:37:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772707025; cv=none;
 d=google.com; s=arc-20240605;
 b=BKxo459FWXwKf6gciG2m9fSkm1eb4WLQjpaE4rn+AogDJdlTpYBZy6YLHAYlupYpt0
 5ST3b2Y953UgNDXiaQoROWmlvvgpFG8VCnlY53v6SWAyAWrpQgkuVJv82Z2jz2GXdyuZ
 6zJSgknjJ0taBAbCrQt3Sus1f/YYhQurwzAGEQhVqhBSSTwUv4scehV1nAs/cUfTD9Wj
 zgCDTc3uUteSoSb3yvNS4pOhnAZfE7R5HDcL3CR/vVoqyH7j9r/1lQvAsCeHHTtXMO1W
 Ciqm+YbRsLRM165T3WPl+vz1FTKDrcOyUWb7v04n3dAyPQBBZZKyABEbNYZ7flarszvb
 iV1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=AxjPnRuT41SFicNKZIrpim+hvpYn3RgbDx8y2pgwB9w=;
 fh=wDwPu6TAvAzBVOivcT4JzLCsxWY5InGLy9xKetoCGnU=;
 b=VDCiE/TB/SzsICeFuMIsFCJstcfnWwR4RHTefa2uPDMyOQZvoczjwyaXz33kIxZ87C
 iln6bdJc03FhoM7KO/9Ch3DUDLmHy2sFhQd4jwE/ev7mhwIWU6x0vGVKEMC+VB/eSnMP
 Vtw7+xlTJkR3vgQMIWyME35YRYkXE6V2f3txjlTprH3qtvcSnnOyGEDqTszwhQE1CCXX
 ku1uRElVCGpZuQAY545SkD7K0dpdhiv/++ruWjF7fdZp5SO0vrkPrr64rezB8VWDnuKh
 /MvkhKb3M8XpdK/7cVBa+UeD4MJqUaGizkpyrXSE7bvQ/icucusHHmpZ4ezQBEgAkvng
 OQ3A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772707024; x=1773311824; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AxjPnRuT41SFicNKZIrpim+hvpYn3RgbDx8y2pgwB9w=;
 b=Oktfc89gKcFM9MTudLBzL5BKjAlMjR1ypfWmon+xm+ToehJmhhpi2h1r90Ia9HT+w9
 tSY11gyTo3B0QVNDwWI3N43pnIBenWVvQ4mIQyX1cP1Ce4/YiI+a0/4c49luW40OMdJL
 MbIR+waemAxGrwvH0YfT7Ny7kbY3Aj32HK2hguwtmkPMiVRgv1l3HDZP9sQR8Tp9XsBy
 WBH5SHkRRdY32OuM1tyTmArzMI6SS2KDkzlKzuODtfmsxXyRRyh0zlWy4ATGdv+ishM+
 IBNgTJZc5z580uz3j1mCipt1ZXdwJBCHUET/pmNNJMhOEEkX71t7YwyjU79314WdUX2M
 WoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772707024; x=1773311824;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AxjPnRuT41SFicNKZIrpim+hvpYn3RgbDx8y2pgwB9w=;
 b=QCcG8Yqk9e2UPKDaO9ZFRBIxKNw/loQmw1xu+pWUVZ5pwoq+2D9zVCRGuIpWq2dN7f
 MOszdBHxfIVbwSVCuk0AXb8q52F/HxR9Lk978r6kxUmn0xQD0oHJF75BCQadTj1moMbT
 hC9tciNkN83LPPMi9SiDCCCT2sEE7+Wq7JI1Krtwe9SbOclmGAfIwx4tfmeEDm7eiKm7
 E8CGcuEimLhmAZWH7vutvrVjkp9oBZS6B84dBxo5ErmBFPgLrqV8F3+YJLralJrNaBf7
 oX7pv7sU8YGpqy2H5BLuc1noZtHGKF07wXf+gCfYa1eOlTT05bqThSf8zo5Cd2o0Gfg5
 HuvA==
X-Gm-Message-State: AOJu0YyJjWhqIDJewo+Rc517HWeKtj3RQBkBBv+urshUPgqTOmG61Vp5
 70JxFbdJ/u1Q5wKeepK7rODBhWakwmlN3KviKzoSWOG2LeKl5WrHQgkQTJoGWtvoAlmsZG+EJnB
 8oIGYwHxd+QJ811w9aUDGwaE+bCNvyDq6JMCdp+6vajx6oPwhhYg5
X-Gm-Gg: ATEYQzyKHzS0rW4ipwEGvTSFOvm2GvWeXjxsyRlwfMZJGU25OSkmuKah/Vk2UoJkJlF
 1jSAwQaVx+npshUH5Jty4YtL4723++y3lYIPd+UryyHvRKBlMJZpyzD1DTC4QAtcScyv6Hvmr2J
 rZ5oEmFE5q8TOSBhK0HO8gEmXRAROGVMa9Z1pTmqPmw7OdkcD8z5JPyLOyk1dznULzmhCxihnV2
 nJsJ82nbtxaz3F7kqc2HNcEiNoywDs2/Mv6D85/9m5cpCUYJdJRTZzbaHtk2GGhltFxqjJuBXm1
 Y8RxuqqrkqJQ5YTtlYBSCBcyGdMEbLvPnzdA86B57jQl/MddQpIe0v8Dw1U9gNonJC8=
X-Received: by 2002:a05:690e:140f:b0:64c:9f31:e33 with SMTP id
 956f58d0204a3-64cf9bc0ff6mr4277623d50.65.1772707024618; Thu, 05 Mar 2026
 02:37:04 -0800 (PST)
MIME-Version: 1.0
References: <20260302092225.4088227-1-peter.maydell@linaro.org>
In-Reply-To: <20260302092225.4088227-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Mar 2026 10:36:50 +0000
X-Gm-Features: AaiRm52qrZIL8yralBJNN0tU10ziebNEyhhvl6Db87mT2g70DBlX5StRGL-5f3U
Message-ID: <CAFEAcA8CytxFhwJahCN7CxGtx3RoGkVpfBuoWGQOXGBPTXi==A@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] arm (and others): fix some memory leaks
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Darren Kenny <darren.kenny@oracle.com>, 
 Qiuhao Li <Qiuhao.Li@outlook.com>, Yodel Eldar <yodel.eldar@yodel.dev>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Since these patches have all been reviewed, I'm going to take
them into target-arm.next. Let me know if you'd prefer something
else or if anybody wants more time to review.

thanks
-- PMM

On Mon, 2 Mar 2026 at 09:22, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset fixes a couple of minor memory leaks I found by running
> "make check" for the arm targets with the clang leak sanitizer enabled.
> Version 2 also includes some patches by Fabiano from last year that
> fell through the cracks; I've rebased them and included them here.
>
> Changes in v2:
>  * patch 1 now just moves the file to keep 'git log --follow' happy
>  * patch 1 fixes the filename in tests/docker/test-fuzz
>  * patch 2 has the SPDX/doc comment that were in patch 1 before
>  * patch 2 drops the walk_path suppression as one of Fabiano's
>    patches fixes this leak properly
>  * patches 5-9 are from Fabiano; most were reviewed last year
>
> Patches still needing review: just patch 1.
>
> thanks
> -- PMM
>
> Fabiano Rosas (5):
>   chardev: Fix QIOChannel refcount
>   chardev: Don't attempt to unregister yank function more than once
>   chardev: Consolidate yank registration
>   tests/qtest/test-x86-cpuid-compat: Free allocated memory
>   tests/qtest/qos-test: Plug a couple of leaks
>
> Peter Maydell (4):
>   scripts: Move lsan_suppressions.txt out of oss-fuzz subdir
>   scripts/lsan_suppressions.txt: Add more leaks
>   hw/arm/aspeed_gpio: Don't leak string in aspeed_gpio_init()
>   tests/qtest/iommu-smmuv3-test: Free QPCIDevice
>
>  .gitlab-ci.d/buildtest.yml             |  2 +-
>  chardev/char-io.c                      |  5 ++++
>  chardev/char-socket.c                  | 34 ++++++------------------
>  hw/gpio/aspeed_gpio.c                  |  2 +-
>  scripts/lsan_suppressions.txt          | 26 +++++++++++++++++++
>  scripts/oss-fuzz/lsan_suppressions.txt |  5 ----
>  tests/docker/test-fuzz                 |  2 +-
>  tests/qtest/iommu-smmuv3-test.c        |  1 +
>  tests/qtest/qos-test.c                 | 36 +++++++++++++++++++-------
>  tests/qtest/test-x86-cpuid-compat.c    |  4 +++
>  10 files changed, 73 insertions(+), 44 deletions(-)
>  create mode 100644 scripts/lsan_suppressions.txt
>  delete mode 100644 scripts/oss-fuzz/lsan_suppressions.txt

