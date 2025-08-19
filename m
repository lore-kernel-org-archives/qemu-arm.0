Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D2ECA0EF5
	for <qemu-arm@archiver.kernel.org>; Tue, 19 Aug 2025 09:14:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uoIPn-0006uR-Jj; Tue, 19 Aug 2025 05:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uoIPl-0006tD-CS
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 05:13:57 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uoIPj-0005L5-1J
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 05:13:56 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-e933a69651dso2841358276.1
 for <qemu-arm@nongnu.org>; Tue, 19 Aug 2025 02:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755594832; x=1756199632; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tj5O3zBofSq/ThAwdeyH9bgW8PDCyVQCcqXPlL16t0M=;
 b=mWyVCpydKX8Wht8EaSR5e1tpGxCxFGR6VsiEll6hEuR1KcOllgdrmitFFlQcGtgSn4
 QegoFQ0kUF/nB709TYdzjzbqrcrGdc1H3uarMX43onBokfOhuDwNEODBJ+bMw+QSYacZ
 B6dXPekCFMmDVo4f3UqplqNReIEk3NwuAwcizIJnjT3/557AMKRtEKtQqOcbMagNRbq+
 +80yqe8X08Cyw+F0gBNRh4Ecju8nEFgSFZw+JvMc3rklFoTQaL68R/bCzFTiyW4WykIH
 21fx6TwSHg/93aJNWp/+ByU5ilBR1a0LPtp3gr36Nd5erH4lMSvwrrwRzHTQL/0xk/e/
 LShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755594832; x=1756199632;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tj5O3zBofSq/ThAwdeyH9bgW8PDCyVQCcqXPlL16t0M=;
 b=E1S6x1caOvUjHTYAhRdW1vjCR60IDoL92aIegRwlu6F2l4wd/VRszuWdMkhLP8pmqE
 KBUc0U4xX8mxiLhDqF64PTNJsXwPQoQE/bKH0iLTbi5185LCPlmo+hwvFUvLs+CEZ1sP
 ynFw3gqW6Rm4azb1C8ee4kQD0SNaGHX+nuH0rkyQt5Yom1fXi+J3ejM/gc4Q344EziIh
 Aix8R5GD2dK7U1Q71Pu7bksaVmEbKzBHcaykVNiqZrOES+ORNp0VAG4JgSPunLH3Xuwl
 leHrGC8anRS42RKHJGbkouJ+w3y1oNWiLLE85A1G76tiGo4pIx4WMHshMHSl54GUkH4R
 ji+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUf9aupXYn/OLIIViIzFRyimvnSr/EG8Z61OT6WLquE/PCcCSZ9K/UO2dRpGfwjCT/gghDQaw4NaA==@nongnu.org
X-Gm-Message-State: AOJu0Yzq1kTBgrLFJqyHUq3zl2CBq91BGc/l7QoIEPcXNySWHDmWWjiZ
 E8gUEGdNuzGDi/KHgIaGA0hzOjomZjkUJjgpZSt1bdEi3jIo0fQiv0u0MsiqevIKOCR1P9NL00x
 /SQhjzJjoGsO7PQk3BJ5I9IVb/xjZJl65Zyn55y4HFA==
X-Gm-Gg: ASbGncucH26GRITzEdpSfiHGQH1Dx40f4651k/tlmvBW3eZg3otYegAdsdEOJpA7Eb7
 DwwJ713OQ7QLhjRbZOX0Qodnc+q7Y9Gt/rP+hf8Z8XJz1X9fFfBQK8gHh51SaYdvyk51n82G5c7
 GZCMNYVgHDm+HmNiWXcQATUYLZsJtExEBfW/G1JX7EvX+YnAT39jkFt4dH2mmaAFY9Cw9d6jjfk
 NVnft4A
X-Google-Smtp-Source: AGHT+IHT0ElViaG6RmhnSoO6a/CGssITYJIFn8TEtSsyhcGctajF3BsA7U6qxyJLNFhoSJhjB8uV505FOKhxCjweiH4=
X-Received: by 2002:a05:6902:114d:b0:e90:6d24:6741 with SMTP id
 3f1490d57ef6-e94e62d78e1mr1838794276.31.1755594832500; Tue, 19 Aug 2025
 02:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250811193654.4012878-1-vacha.bhavsar@oss.qualcomm.com>
 <20250811193654.4012878-5-vacha.bhavsar@oss.qualcomm.com>
In-Reply-To: <20250811193654.4012878-5-vacha.bhavsar@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Aug 2025 10:13:41 +0100
X-Gm-Features: Ac12FXzv6nnLCgJo7iCQj_qrqw5e1qmhPbhBxTLdkk0eaIXpA78_g0cI_AvR-IA
Message-ID: <CAFEAcA8FchF06dGdixBwY8GWSF3kREuL72ZmeyG_cYqzAmuEjA@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] target/arm: Added test case for SME register
 exposure
To: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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

On Mon, 11 Aug 2025 at 20:37, Vacha Bhavsar
<vacha.bhavsar@oss.qualcomm.com> wrote:
>
> This patch adds a test case to test SME register exposure to
> a remote gdb debugging session. This test simply sets and
> reads SME registers.
>
> Signed-off-by: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
> ---
> Changes since v4:
> - this patch was not present in v4, it was added based on
> suggestions during the review of v4
> ---
>  configure                             |   6 ++
>  tests/tcg/aarch64/Makefile.target     |  23 ++++-
>  tests/tcg/aarch64/gdbstub/test-sme.py | 119 ++++++++++++++++++++++++++
>  3 files changed, 147 insertions(+), 1 deletion(-)
>  create mode 100644 tests/tcg/aarch64/gdbstub/test-sme.py

This test fails for me:

timeout -s KILL --foreground 120
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/tests/guest-debug/run-test.py
--gdb /usr/bin/gdb-multiarch --qemu
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/qemu-aarch64
--qargs "" --bin sysregs --test
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/tests/tcg/aarch64/gdbstub/test-sme.py
-- test_sme --gdb_sme_tile_support >  run-gdbstub-sysregs-sme.out
warning: File transfers from remote targets can be slow. Use "set
sysroot" to access files locally instead.
Python Exception <class 'gdb.error'>: That operation is not available
on integers of more than 8 bytes.
Error occurred in Python: That operation is not available on integers
of more than 8 bytes.
qemu-aarch64: QEMU: Terminated via GDBstub

The gdb is:
GNU gdb (Ubuntu 15.0.50.20240403-0ubuntu1) 15.0.50.20240403-git

> diff --git a/tests/tcg/aarch64/gdbstub/test-sme.py b/tests/tcg/aarch64/gdbstub/test-sme.py
> new file mode 100644
> index 0000000000..c2b9d774ae
> --- /dev/null
> +++ b/tests/tcg/aarch64/gdbstub/test-sme.py
> @@ -0,0 +1,119 @@
> +from __future__ import print_function

Alex, do we still need this line in the gdbstub test cases?
We can probably assume that the gdb's python is python 3
by now, I hope...

> +#
> +# Test the SME registers are visible and changeable via gdbstub
> +#
> +# This is launched via tests/guest-debug/run-test.py
> +#

All new files must have an SPDX line saying what the
license is. You may also wish to add a Copyright line;
that's up to you/your employer.


> +if args.gdb_sme_tile_support:
> +    main(run_test_slices, expected_arch="aarch64")
> +else:
> +    main(run_test, expected_arch="aarch64")
> \ No newline at end of file

Please add the trailing newline.

thanks
-- PMM

