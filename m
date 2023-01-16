Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1078453ejc;
        Sun, 15 Jan 2023 18:46:36 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsnbk6cAJTH6MSRdG1mUCdQW3oHkB/H//KdshNMVJimtK+fTctoh5ZX5zY59YnKkKiuQgOf
X-Received: by 2002:ac8:48c8:0:b0:3b3:8219:20d5 with SMTP id l8-20020ac848c8000000b003b3821920d5mr12066518qtr.30.1673837196123;
        Sun, 15 Jan 2023 18:46:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673837196; cv=none;
        d=google.com; s=arc-20160816;
        b=tAt+pXHR5kVznnybYqapp13ZKY6CJyjgVudvqsgMLeiwoVV+qRvThV5nxmnYFcmGzA
         EYP/6A3jgIx1Jedel0uceqqeuhnJLOC83xJbq250nUEaCQFn5uPZBZinwucUC0/OSEcx
         szzfup9TBg4uMQImT7CcEue7701TYe3u5f0zcebaJ+OYWINx9/fgWBgN1hInrKuLjsc+
         o64t3D7TtvjYVN4J31xSACbJ+8/+j4xwjk17djODCE6ex5bPOJm756zDgNCpjWCEmlvQ
         cPa3RC0YJehv9mHDbvY1xy1oS9oYJ5f5QXmVJME2GY8UEXHzdubu8pcMLNyZuUGR9kg3
         HTmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=mvW1D5PImzje8ifMoIl2sqimPnVAM5zJoAYKcwrQCik=;
        b=If8eNfpK5IxcaQeCypHsiIOeZfplgeqlivGLBTp3P749Jz4LVnvmgzsTvBqEGG4KhL
         fmp40eGg9f+wxOyssmlTwNBQniYiwUMxIve7Tgs0AhG2xWJAIFRZxme/Z/Ye/CYVnZwY
         dfL/1YE+Encnr0hqp65zceIFD1jo2WW6ZOHEtkMHlAvXfw+1Fd8W0wYa79aTkDvSO/v0
         zhk03gUpLQTKsLkxmo1LlOQJc27a4joiVR10A/hvtDtb+wV79upsaz6vYdTFE880D5+5
         KJVXPVMEqdor/NRqvVEoNcumnrD2MMHM6EdudzvAb2h+Gpp6rAtwpLigW3tG9HxYJKQe
         B2HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=To64EWEo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj8-20020a05620a190800b006ffaecb925fsi17607988qkb.542.2023.01.15.18.46.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Jan 2023 18:46:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=To64EWEo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHFVu-0005Qt-MO; Sun, 15 Jan 2023 21:46:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHFVr-0005PR-Ft; Sun, 15 Jan 2023 21:46:20 -0500
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHFVp-0000Fr-9r; Sun, 15 Jan 2023 21:46:18 -0500
Received: by mail-vs1-xe2f.google.com with SMTP id n190so23885100vsc.11;
 Sun, 15 Jan 2023 18:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mvW1D5PImzje8ifMoIl2sqimPnVAM5zJoAYKcwrQCik=;
 b=To64EWEoJGlbEaGy1vfDvJJaG3gNXrdR6dPSK9RZgQ6GJAjJSdtQtl4N7dQPCF236e
 mD3LpYksuIQzS0C6eZgNIGRHB6S5CCrmYdc43YSUn+K8D8i6tWnV3a07c56/Spw1N7Be
 2jVtGR8i4nsvm/gn80HwLQxge8bKBA2+GEUiWblkRnipt4cc3XJ8tUIeW2JrA4SoNv1O
 COnzcvZuZlvOqFEwe0b5+Dgrrz2L8YumBXmYVFD6uSlf/mdJtT1RSQ44MXKi+TAgduS9
 GSBE9HIXz+exBcGxyTsQ7akUURwN+i9dD0PXYa421JkBNli8uCGP+8zizeEI9UIlT/d/
 saxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mvW1D5PImzje8ifMoIl2sqimPnVAM5zJoAYKcwrQCik=;
 b=KDWKrFhHldFsbLaRlfx77kDEGcz9MWd7HEAx6GLLXDtHZ+FaX2E/RbmON1CA5Thto6
 82Bm3YWSy4QHNCgsVOb0Xn8YjOU1C4WNxGcC35jJ3jSIATlSKhgEkulYugL5L5I0tKbF
 b2nzvb/9loa7OAJoaeYKLVzsrPUXd7kvXq4rgjgd+n2lydXNj6MH8x/DnOsHOxFqJ3xG
 1xnC/egsNhCVPdeHyy8keJR09Vidjc9hI+1cKXZEZwIxfjJJcJ2WWdRZMrbSMwwN1q9S
 QSoCPLDWWHvZSn8EmvBYk/dox26ZIo4SKg8qA5D6mQzdaMSPVl9lmjjPZm8rmOZBO8D2
 dSlg==
X-Gm-Message-State: AFqh2kobsbC7FjDyLOP02/hpGepSo4a5EhEwUm0+GZ7W2LLRDHDY3nU7
 zZ4Wxgz5Vd0qr5IZut3j2VJI9aG0E8O+Eg04S0w=
X-Received: by 2002:a67:e052:0:b0:3d0:c2e9:cb77 with SMTP id
 n18-20020a67e052000000b003d0c2e9cb77mr3000616vsl.54.1673837174938; Sun, 15
 Jan 2023 18:46:14 -0800 (PST)
MIME-Version: 1.0
References: <20230113200138.52869-1-philmd@linaro.org>
 <20230113200138.52869-2-philmd@linaro.org>
In-Reply-To: <20230113200138.52869-2-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jan 2023 12:45:48 +1000
Message-ID: <CAKmqyKP7En+Gwb4dZw1dRNMBDoNKJ9_01J60KR1CG_J3OQ_FOw@mail.gmail.com>
Subject: Re: [PATCH 1/4] iothread: Remove unused IOThreadClass / IOTHREAD_CLASS
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-arm@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-trivial@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-TUID: bogUABHEubV4

On Sat, Jan 14, 2023 at 6:04 AM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Since commit be8d853766 ("iothread: add I/O thread object") we
> never used IOThreadClass / IOTHREAD_CLASS() / IOTHREAD_GET_CLASS(),
> remove these definitions.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  iothread.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/iothread.c b/iothread.c
> index 3862a64471..b41c305bd9 100644
> --- a/iothread.c
> +++ b/iothread.c
> @@ -25,10 +25,6 @@
>  #include "qemu/rcu.h"
>  #include "qemu/main-loop.h"
>
> -typedef ObjectClass IOThreadClass;
> -
> -DECLARE_CLASS_CHECKERS(IOThreadClass, IOTHREAD,
> -                       TYPE_IOTHREAD)
>
>  #ifdef CONFIG_POSIX
>  /* Benchmark results from 2016 on NVMe SSD drives show max polling times=
 around
> --
> 2.38.1
>
>
