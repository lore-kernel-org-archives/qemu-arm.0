Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97616106ACDD
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Mar 2026 19:24:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0ldA-00087d-Md; Thu, 12 Mar 2026 15:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w0ld6-00087J-PC
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 15:23:34 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w0ld3-00046e-Pe
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 15:23:31 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-64ad79dfb7cso1772584d50.2
 for <qemu-arm@nongnu.org>; Thu, 12 Mar 2026 12:23:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773343408; cv=none;
 d=google.com; s=arc-20240605;
 b=gWdotBaD8cqn65b1+AIsWBCGx4sR8VJeVbmAAHpiecpr40gl+Fjs8Bxn1yiHIX/6qo
 WdUeiiXEgBU2xJCBzfuCfowtVXCXazdpyBe0yRs9OteCTi/0YC4EbX5PpGOMc7GUTvZq
 Qj2GilFaXB6+PyIlwvq6LSHXGCGCgN+Bwk1/WfGgxIuVftgveT6CJ0HgqrhvmJ/xDgyd
 48C/samv3Rly1c3cEb+ptOZRYeUOHdB5S5OYFi/RGYKPJYhhF1XCjN0ymr4xFg8l02H8
 s1sgOdS8K3G/6R1fcN1Va3S0qRp4vtYd10KIsf/2Ih0+LbCziusUCJl9v6PmhkfL3Bk7
 eG6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=guCvf9N/EXv9zX+nWdqCr2sGMnAPCZsaNwa34jA1JhM=;
 fh=TZTkoXxvQZeeX0WdtaVURYCCf1f2b/MW61VPIcSSdqI=;
 b=CFJidfMHME5YxHji7fxUkb722OvBeFmXpFbAIAsWQIpqDsUnqjklqygeTCrKQwTWtA
 VV/2sxHaY4au8WMxhvaYlZTgz+vKEQZ9c18CPHhH03+qmFGHk42EFj2nGIUayXoPhQ+x
 wor5L4S1vmdwOLDvCBnFIna0dZgM4L6r9Et/yWXkeLtE88GvC0VpoGqxFelfgLyu/lCH
 iN5Ii2UZVYlUVNr+u066vh4KviuR4YyzaMW1S4FkuWde2CTgklz0HURGcWxM1vIZIG8q
 KYtSZYnvhzrZi1mcvvuK5057RA+8qgW7mth7kMkymRQxvzVUbTLn8Lbe+WLPTIFKTkhs
 O05g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773343408; x=1773948208; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=guCvf9N/EXv9zX+nWdqCr2sGMnAPCZsaNwa34jA1JhM=;
 b=nP0yk0RYmOP4PtTvBSTx8ITaxnyXmvzqBZdFpXkR4wYML/X+7l2sjw6ddXnRbcpoLa
 CFyl3PkMaMDMFcOczqJ5NGlnZjBdE9yik/H01Q/GKizJ4d0SBwybRobEoQTCQKiJeaGD
 A+dw6poqXCC53MDMrsWwk5YMusQiWRCRlp1GKQBLUObuRhb+zQ2J4T5kfAQ0B/hRswK5
 HlysneVgw935B5ooEjJcNK3n7KSkRsvi/cZDjDUF1b+PQOWLprSJ6OKWsauIyJQYfTZd
 gAng6DsWv3cKclUWayKBtySzjup7280dsE2LCLtEZayA8VmO5f2EYmfpBDNLgahI4zSl
 diaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773343408; x=1773948208;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=guCvf9N/EXv9zX+nWdqCr2sGMnAPCZsaNwa34jA1JhM=;
 b=hivmMi9xaFp7QU8R3f0WzfH8tFCifQzTeHU7gmkGPYO1YqyGKBHmvfBpIItXcjCg18
 X+a6jlHboO41/4MnY1fGPuL65ELGDzY10fSzojJvLYFrBp2NZ8hlxNAewXf6Aw+kpvdH
 bDdtPf1LoWNbhYDOtn1/ygeXXKSIsGRMtxo9QZz/E/2wNeVu48fJsS2RMG3ec6n2yf7z
 gLKURyX64Z1BHpmxAVQLB5LbhpJLMMJ5MNtQZJlmhWjOrUtCtGg2WS3nZizZlewyd5b4
 MR7vE1ch4HzMuhIecM10NpEuo08vsZArXsAFJwXI3ZvDe8aVauPX1alDqOuDNdVUN6j7
 J0iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgYt7AOPb6BZNU3ALaVRn9c40LN+5CkaXxnHQRKfQvQ5qpX5lBK05MtBICXCPgTqHYQ6zeAbk9ow==@nongnu.org
X-Gm-Message-State: AOJu0Yyy6b6HhawJ7cY8/fD4hH/kVHRBhqnGPEeDMBnkR47RzNdCCJ8t
 Q6qm10t+k+Pmx8Nz1Jge3Tt1n76smUMDUlyzQoc7TGvH/3Oj8aRMuqT/AUkTwLNjQ4d6rI4YkCm
 YQyQgR5JHG50PAKdFeSWjdlPvxvdFI6mM1Pe5XZfrLg==
X-Gm-Gg: ATEYQzzO20SZor4+mwT/84/wQDhOMUqJJiJ3KUdb3PEPBf6VQUKRY4x62OvY25GBdp6
 ltuTLmWHQrnE5safkZme00hKNCVn7trL0ne6fYoQv7rUQbaH6ncWWHT/NdRjjYot3S2j6rFwtyd
 vPxuDfR09J7EqJxk7nJu4wjik8T898qkZUJ+uvmFgzZfDYZe451MTeGrjOc1QGEOquGW6oSbQ8l
 gYRf6i8OQk37iMtxJuT3IMIVMqni96L5cTNZKcAUAt76UwieKBW29Ugai7z8Qr+7oG19u4gYqj4
 2ryqFNPRWR1Nw+KnEPT3cx3evWDBV8N7lZSK95smcrSxVXsffY9vpDLav7/dZxc6jOc=
X-Received: by 2002:a53:b45e:0:b0:649:412a:dd11 with SMTP id
 956f58d0204a3-64e630ceb0bmr619428d50.74.1773343408461; Thu, 12 Mar 2026
 12:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260311154934.1575429-1-tangtao1634@phytium.com.cn>
 <20260311154934.1575429-3-tangtao1634@phytium.com.cn>
In-Reply-To: <20260311154934.1575429-3-tangtao1634@phytium.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Mar 2026 19:23:16 +0000
X-Gm-Features: AaiRm50JZDf5rc6NzkRv-BAqy5vqz-zq5Y5e16lDzZ_SlNusYvA_Xa3wr5UQsNw
Message-ID: <CAFEAcA938c9iwZ9oMfd9b_X840PvWFPExmWUxArYssotosDWGg@mail.gmail.com>
Subject: Re: [RFC v2 2/2] tests/qtest: Add qtest-attrs-test for memory access
 with attrs
To: Tao Tang <tangtao1634@phytium.com.cn>
Cc: Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Chao Liu <chao.liu.zevorn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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

On Wed, 11 Mar 2026 at 15:50, Tao Tang <tangtao1634@phytium.com.cn> wrote:
>
> Add qtest-attrs-test to exercise qtest memory commands with optional attrs
> on aarch64 (virt, secure=on) and x86 (pc, tcg).
>
> The test covers:
> - ARM (virt machine): exercises all supported ARM security spaces
>   (non-secure, secure, root, realm).
> - x86 (pc machine): exercises secure attrs accesses
>   (SMM address-space path).
>
> The test also covers libqtest-single *_attrs shortcut wrappers and
> verifies that space=non-secure behaves like omitting attrs.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>  tests/qtest/meson.build        |   4 +-
>  tests/qtest/qtest-attrs-test.c | 234 +++++++++++++++++++++++++++++++++
>  2 files changed, 237 insertions(+), 1 deletion(-)
>  create mode 100644 tests/qtest/qtest-attrs-test.c
>
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index be4fa627b5..c11759e23f 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -115,6 +115,7 @@ qtests_i386 = \
>     'drive_del-test',
>     'cpu-plug-test',
>     'migration-test',
> +   'qtest-attrs-test',
>    ]
>
>  if dbus_display and config_all_devices.has_key('CONFIG_VGA')
> @@ -270,7 +271,8 @@ qtests_aarch64 = \
>    ['arm-cpu-features',
>     'numa-test',
>     'boot-serial-test',
> -   'migration-test']
> +   'migration-test',
> +   'qtest-attrs-test']
>
>  qtests_s390x = \
>    qtests_filter + \
> diff --git a/tests/qtest/qtest-attrs-test.c b/tests/qtest/qtest-attrs-test.c
> new file mode 100644
> index 0000000000..ce204c2c95
> --- /dev/null
> +++ b/tests/qtest/qtest-attrs-test.c
> @@ -0,0 +1,234 @@
> +/*
> + * QTest for memory access with transaction attributes
> + *
> + * Verify optional attrs argument support for qtest memory commands.
> + *
> + * Copyright (c) 2026 Phytium Technology
> + *
> + * Author:
> + *  Tao Tang <tangtao1634@phytium.com.cn>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqtest.h"
> +#include "libqtest-single.h"
> +
> +/*
> + * Default RAM size is 128 MiB on both machines used below.
> + * Keep test addresses in low RAM and away from device MMIO regions.
> + */
> +#define TEST_ADDR_OFFSET    0x1000ULL
> +#define TEST_ARM_BASE       0x40000000ULL
> +#define TEST_X86_BASE       0x0ULL
> +
> +#define TEST_ADDR_ARM       (TEST_ARM_BASE + TEST_ADDR_OFFSET)
> +#define TEST_ADDR_X86       (TEST_X86_BASE + TEST_ADDR_OFFSET)
> +
> +#define ARM_MACHINE_ARGS    "-machine virt,secure=on -cpu cortex-a57"
> +#define X86_MACHINE_ARGS    "-machine pc -accel tcg"

You start a virt machine with secure=on, but you are only
testing the RAM, which is mapped regardless of the security
space, so this will not notice any bugs where we don't actually
access with the correct attributes.

It would be more interesting to look at the secure-only
RAM (which is at 0x0e00_0000), which should only be accessible
via the secure or root spaces. (I'm not sure what qtest will
do for attempted access via non-secure and realm, where the
address will have nothing mapped there. You'll have to check.)

I don't know if the x86 PC machine has a similar bit of RAM
or whatever that behaves differently for secure and non-secure
accesses.

thanks
-- PMM

