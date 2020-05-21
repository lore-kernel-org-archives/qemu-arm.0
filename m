Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1777291lfb;
        Thu, 21 May 2020 10:33:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx29YunfhIEbqf+ofRj98I4jVk0YYLZr9EI/9g3EWWoOTrN1oTFE6rC/8PbkGWbuZdEXOAj
X-Received: by 2002:a25:9c04:: with SMTP id c4mr17375579ybo.103.1590082406336;
        Thu, 21 May 2020 10:33:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590082406; cv=none;
        d=google.com; s=arc-20160816;
        b=PSwrAX8r4+JTp4M7K/z0PVanpvtGQQkkj5S4xuyCTcNK9PS0rVhrk1HU5gVUd//gyc
         BX/GhA2UGJ7hVsgqusaEOdWffUvoRRcscNh+KETutA23RNZ+h1YQ7H560nJ5tFoMrzCp
         e2NyF6uQ8I/9OYRSWuHYV8Jf7Q2I/bCbt8GWBRZ3vY9ydmmZwisWZ5HUi5zekAW0eg7m
         qTNpJWMXl1U7U0dYmIwhEdRKptyIK8hd6wvrgdkKnP6ZVPkb2MjQu2gjfeXTggqq6uBa
         Q+Imzl9dyT3TrYDRH4bF7rYHC8SdJvK9od5Tcl5ryxUegQtKanFAYzs5zSFgdGaRrrY1
         YGkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OQzcYHoz5Czl27l47Bsn/r0C/ioFvgugtKBDv+ZDzvI=;
        b=oXGM5jKLC2ug6lqMzpeoSitlus86Y4a4eXrTWfClIv7AhM0k8zd5vXwXQQqegmvYh1
         RXqQ11tfxiBPOOHbsReGZH4yT/SnZJnHwi0pLhodHbfaY/yaB3jEXK2j4EP6H0oNKWz/
         9Bf+ualByhtNFwwwsMgpr1zFXyICt5e7QtuIpsHHkcd+kOsb4Ec11sT7j9qDbLhkWLHZ
         JXn2HwKhMwHsBMnv6iCr7ab0kI3JaBEqAww90wPdSRLIZsNFn/lOZqcFO+ZLFIdEu2hV
         0WW1BUrnM53qFE2we4ThhdeZrIv6qQ4COnd3q9fPiZtpkK0a/nG1yG936BghHUCyQGM9
         gNsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LyAq5mq2;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id y145si5633090yby.457.2020.05.21.10.33.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 May 2020 10:33:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LyAq5mq2;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590082405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OQzcYHoz5Czl27l47Bsn/r0C/ioFvgugtKBDv+ZDzvI=;
	b=LyAq5mq27bLA52mwJjTDZ71+oZ5nyZ+wO5p6KpYn6lkq9z6nfqgtsDqY8CMinEd0c7M8KA
	9OJO5Y6lSOOPAVb+yIYr/6rbQULThkvMH8wb6dNZsPuxV70+pCbqJsEArnTXHUFpQMNZUj
	fRBEd+SZ6il0BZRrVo5lrKrPDWzYoXc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-Pmirb7dTO2GfDQN1g0DXZQ-1; Thu, 21 May 2020 13:33:23 -0400
X-MC-Unique: Pmirb7dTO2GfDQN1g0DXZQ-1
Received: by mail-wr1-f71.google.com with SMTP id r7so3204182wrc.13
        for <alex.bennee@linaro.org>; Thu, 21 May 2020 10:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OQzcYHoz5Czl27l47Bsn/r0C/ioFvgugtKBDv+ZDzvI=;
        b=MOkmXoHPhMv5TlUUPDFMHZJ1X6ylaqz2+dpE8DcG/KkjUXke+hcLxal9k0xN0ndjJK
         V1xMJJti+4fIqhVCY4mUpE89rAcZfzG2SRaf49MiXrovGCHr7ESFdSGbbcON1bGWJi62
         j5Xk//EWQPlnoB5Z2lV5o4SE5u/2+KhD1MTTU5NPSZ+5g0xDmvcmKzzX2+ghqv4S4xCf
         eGSOlzqRbTKFqu2yRY595rJeC7z2x75W79iz90X+xJSHYqXGwCmpmSxra6QVhaq0zHPz
         Cb4DyWUNv4yIKvExAHP9RXCGeiy6sktrY5vU/2VvGW9ZZU2YdMGCCW9vfh8tMFalknIi
         ++gw==
X-Gm-Message-State: AOAM532mrTUM3RbmDZtBBCCvGtIus0RXRzyj1Q0MGcNv0WWuutlGM2Lg
	YoyRVzZAITjvM8fUvF/FJARJDzjztmY4U2Hfet189v54S8x5T8ww5nxXj8V4QSxfNlYNtno2kT8
	Z7ISBTLsqOKojKVrNMX4+KOB/xmwBZpUf
X-Received: by 2002:adf:ea90:: with SMTP id s16mr9308879wrm.19.1590082401885;
        Thu, 21 May 2020 10:33:21 -0700 (PDT)
X-Received: by 2002:adf:ea90:: with SMTP id s16mr9308857wrm.19.1590082401656;
 Thu, 21 May 2020 10:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200515170804.5707-1-philmd@redhat.com> <20200515170804.5707-10-philmd@redhat.com>
In-Reply-To: <20200515170804.5707-10-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Thu, 21 May 2020 19:33:10 +0200
Message-ID: <CAP+75-WA8mDfBHkUtHvz_q3n__CH-XmKA-Jf92FHFFOQR4oUFQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] Makefile: Allow target-specific optional Kconfig
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Max Filippov <jcmvbkbc@gmail.com>, Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <Alistair.Francis@wdc.com>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>, Richard Henderson <rth@twiddle.net>, 
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Chris Wulff <crwulff@gmail.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
	Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	Paolo Bonzini <pbonzini@redhat.com>, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
	Marek Vasut <marex@denx.de>, Michael Walle <michael@walle.cc>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: cbYY3Sl5WgBZ

On Fri, May 15, 2020 at 7:08 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Allow use of target-specific Kconfig file.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  Makefile | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index b4c0830b26..5fce168fcb 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -423,11 +423,13 @@ MINIKCONF_INPUTS =3D $(SRC_PATH)/Kconfig.host \
>                     $(SRC_PATH)/accel/Kconfig \
>                     $(SRC_PATH)/hw/Kconfig
>  MINIKCONF_DEPS =3D $(MINIKCONF_INPUTS) \
> -                 $(wildcard $(SRC_PATH)/hw/*/Kconfig)
> +                 $(wildcard $(SRC_PATH)/hw/*/Kconfig) \
> +                 $(wildcard $(SRC_PATH)/target/*/Kconfig)
>  MINIKCONF =3D $(PYTHON) $(SRC_PATH)/scripts/minikconf.py
>
>  $(SUBDIR_DEVICES_MAK): %/config-devices.mak: default-configs/%.mak $(MIN=
IKCONF_DEPS) $(BUILD_DIR)/config-host.mak
>         $(call quiet-command, $(MINIKCONF) $(MINIKCONF_ARGS) \
> +               $(wildcard $(SRC_PATH)/target/$(firstword $(subst -, ,$@)=
)/Kconfig) \

This is incorrect, $@ is a $TARGET_ARCH (example aarch64) and we want
to include $TARGET_BASE_ARCH (example arm).

>                 > $@.tmp, "GEN", "$@.tmp")
>         $(call quiet-command, if test -f $@; then \
>           if cmp -s $@.old $@; then \
> --
> 2.21.3
>
