Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E832EFEFB56
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Feb 2026 15:05:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvzOy-0006Lc-4R; Fri, 27 Feb 2026 10:05:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvzOw-0006KQ-5G
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 10:05:10 -0500
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvzOt-0003j4-Rb
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 10:05:09 -0500
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-64ad9238d8fso2029384d50.3
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 07:05:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772204706; cv=none;
 d=google.com; s=arc-20240605;
 b=ApNKpKSkw1jun1640OSG/ZGsRHfQm68Xtvoi5UQ/JDMhNCe3cVbs5kmWM5OnmU/YWk
 Pcd+KPbCQ+81HcM5Ejo8Pbr37YnB3DAXlz8fK8W4rkgLEqJZg0JwyCN7S9AnaABHLokF
 dhX1bICsLa/YFN2v/S2wnWkSwED87u4S8mECJUCknrgBnHS39NKvl9caiO6N79lSnPbu
 XJzaSMITp4RE40tJuO3rgHb4g+pKPtx/0uEOjhUX8qVKqvvPWTKl8hWdXklZKtIfXZrL
 uNI7Oor1spDxRMTlmc65aPPdz14JBNTnBbraUJmeTRo2fyg3ApM5ZBtiBiFtwZX2HO3K
 36tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=bQYyYl6AGFnau/0Z1LKVfDyYADIMLrkJIezRGu7W9DI=;
 fh=DGQ4PCtqkmG3Clj0hVuvj0GV2Z5LAKYKVvLb/Y/OJ7Y=;
 b=V7OCDOsDKqy4QGFL7odysOvICdzLYTvwxPdyAMwr72RGAGGfxScJKRNsDvVSiJFMHj
 vrjdEeYRvZ132b8VsVUwnxQGU3jT4Q4E7N7mm9WYlMgo92ZjQdnEYIJ2jVCyYjEK3W+F
 frAk4Y/31sXy+Qo6i9yQwIG97xeFHbbmXoss5hbdSbCZjXfgd8VsmqUQD5Tg2U/HF1o8
 O/JtCh6VyJXkqk/Jn2lQjk+eaqa0a6L2ULREVJnAB0d015lnSdQgWeccsF3uEjMYWI8K
 Iuz8i+HaOUjFsyB3nKzVwLBwtK6zjEoBK3HumKd6Nd1+iMo6a6hhFFmXcA8ih17bQJtn
 W+3Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772204706; x=1772809506; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bQYyYl6AGFnau/0Z1LKVfDyYADIMLrkJIezRGu7W9DI=;
 b=WufVHUymL0X7QWiKYpV7mf7uDiz/NPkA+3CFs3uLBFr2s/Y67yxAPT2iHDi4CztUaj
 JcAgCmtWJAm9OaV/6IvxHwKhe8zcDEcVkQ0rLd/RvEhenQNHbX2G7K8NlyFw+GwXdJHd
 3nyFBVWjqApe9NMO/BIMDwW2Xcy+rz1LAG++WR8q2xmwIvXLP/YJfnIJxYZaAHYJuH1q
 DtSJSUNBezWRkJdrlfZ1HtDlK+a8dCMB9kGKTEGI3WZvuVJOBsFk5ls9HspydAraP1XS
 G3dgHiyfaZpIMj6zccx1arXwcW4mQPjaPBwg+WSYv2nIJ3L2/dQCzkDjvxB6l2Y4JdxY
 MZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772204706; x=1772809506;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bQYyYl6AGFnau/0Z1LKVfDyYADIMLrkJIezRGu7W9DI=;
 b=nN3zuZwEAj/yFzKGr5ohlsVGF7STHJRNDQCdGugrpls69jRcYofPCMwcZnjA8Kav7q
 Ye91Z95X+9Dkwhbgu5MFhkzypgDf0DLd3TWvcewyZMYFNLq5eMIc2VqcuBDLYv/Esjig
 p7N8W4EtRQ7sLcTLa0txzpHNRE3g5yN+7EIimJYMdTIY9cPOJle//u1lvkcKiNSCMWOy
 EsyHR4zKaROfgKIwyABYtgDAEx0bqDOPsx6iiR7e3a3fWaAGNMivnN0wm/HJxpa5eMjq
 Z3KwuLFhPnlm7ZBoATfN+CNZCjW5NXGKpuHQsh0Rbv2ucRwYMJc81RCBMQlwK4U8Og8i
 5yYQ==
X-Gm-Message-State: AOJu0YyB+0ANX/qn1SnHQmCfqNncJB1SpXuiRVnAm1lMkwdEwT5r8Ll5
 Gt+E1tHa5ssR0hB1QzOMRaGrX6M7CEAK/1NPc2nCV4uAjIQAUm/cwdp/H7h84aTYSj1iGy1hRdt
 HKD0zuh9Pokq/fMin5Cabg06PxdspoJFoIAaYOId7ZXEPoRYe+faY
X-Gm-Gg: ATEYQzwgtaoCUKoKj5bv600LcIi3B44M3ZJH8EbpQMvlhDTxvnsbY4a4Cr8YPuZlpu+
 04k26brWxTU4v9a+3165cr40AyXXZvM/S0dXaFD6hypplJZ6BWSiVMsm0c87b6i9+H8f6dVEhzP
 HzkBluODbtTqkrE9toNos6NkLj9eBP5XIl4HpOlJFwO1+A+dIRZT76uWn77U/hF6swavsXzZO+L
 XuuDpkcmhp7BMg/kwuwQVitfT0fvxPKYnT7xKG1HEEZXSzAOK20ow9ZoglB37MKdhbsJ7N6uUZY
 nhAwv8ymF+MudYJVSBdrhKYDvJvCc04r/Xl85u0RUXv/aXhWnlddXdhOef1iyltxwhg=
X-Received: by 2002:a05:690e:44a5:b0:64c:a894:f723 with SMTP id
 956f58d0204a3-64cc1f2704emr2043353d50.0.1772204706420; Fri, 27 Feb 2026
 07:05:06 -0800 (PST)
MIME-Version: 1.0
References: <20260227135736.2280161-1-peter.maydell@linaro.org>
 <20260227135736.2280161-2-peter.maydell@linaro.org>
In-Reply-To: <20260227135736.2280161-2-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Feb 2026 15:04:53 +0000
X-Gm-Features: AaiRm521CMDjXfjtvXpLaKxDxfrq5PyN4OGz451qxRCQIRIESTccqQ-z6s0XMk0
Message-ID: <CAFEAcA853KSRD7yJKjyoM-E2R4YNou=x+BCR9EWrjym==-tQjA@mail.gmail.com>
Subject: Re: [PATCH 1/4] scripts: Move lsan_suppressions.txt out of oss-fuzz
 subdir
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Fabiano Rosas <farosas@suse.de>, 
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

I forgot to cc the 'device fuzzing' maintainers on this patch;
sorry about that.

-- PMM

On Fri, 27 Feb 2026 at 13:57, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The oss-fuzz code uses an lsan_suppressions file to suppress certain
> leak-sanitizer cases that are known issues or not our code's bug.
> This is useful more widely than just for the fuzzer harness: if you
> want to build QEMU with the leak sanitizer enabled and run 'make
> check' then you will want to suppress some bogus leak reports.
>
> Move the file up a directory, and add the usual SPDX identifier
> and a comment describing how to use it.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  .gitlab-ci.d/buildtest.yml             |  2 +-
>  scripts/lsan_suppressions.txt          | 11 +++++++++++
>  scripts/oss-fuzz/lsan_suppressions.txt |  5 -----
>  3 files changed, 12 insertions(+), 6 deletions(-)
>  create mode 100644 scripts/lsan_suppressions.txt
>  delete mode 100644 scripts/oss-fuzz/lsan_suppressions.txt
>
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 1b656b9eb0..7548057c54 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -626,7 +626,7 @@ build-oss-fuzz:
>      IMAGE: fedora
>    script:
>      - mkdir build-oss-fuzz
> -    - export LSAN_OPTIONS=suppressions=scripts/oss-fuzz/lsan_suppressions.txt
> +    - export LSAN_OPTIONS=suppressions=scripts/lsan_suppressions.txt
>      - CC="clang" CXX="clang++" CFLAGS="-fsanitize=address"
>        ./scripts/oss-fuzz/build.sh
>      - export ASAN_OPTIONS="fast_unwind_on_malloc=0"
> diff --git a/scripts/lsan_suppressions.txt b/scripts/lsan_suppressions.txt
> new file mode 100644
> index 0000000000..ffade3ba5a
> --- /dev/null
> +++ b/scripts/lsan_suppressions.txt
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +# This is a set of suppressions for LeakSanitizer; you can use it by setting
> +#   LSAN_OPTIONS="suppressions=/path/to/scripts/lsan_suppressions.txt"
> +# when running a QEMU built with the leak-sanitizer.
> +
> +# The tcmalloc on Fedora37 confuses things
> +leak:/lib64/libtcmalloc_minimal.so.4
> +
> +# libxkbcommon also leaks in qemu-keymap
> +leak:/lib64/libxkbcommon.so.0
> diff --git a/scripts/oss-fuzz/lsan_suppressions.txt b/scripts/oss-fuzz/lsan_suppressions.txt
> deleted file mode 100644
> index 7d90c280d0..0000000000
> --- a/scripts/oss-fuzz/lsan_suppressions.txt
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -# The tcmalloc on Fedora37 confuses things
> -leak:/lib64/libtcmalloc_minimal.so.4
> -
> -# libxkbcommon also leaks in qemu-keymap
> -leak:/lib64/libxkbcommon.so.0
> --
> 2.43.0

