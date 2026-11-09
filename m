Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15117606A33C
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Nov 2026 01:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFixKUdK
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQER0-0003iZ-GH; Sun, 08 Nov 2026 20:44:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xQEQf-0003hM-6W
 for qemu-arm@nongnu.org; Sun, 08 Nov 2026 20:44:13 -0500
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xQEQc-00036I-1X
 for qemu-arm@nongnu.org; Sun, 08 Nov 2026 20:44:12 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-8b300713befso2248917b3.1
 for <qemu-arm@nongnu.org>; Sun, 08 Nov 2026 17:44:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794188648; cv=none;
 d=google.com; s=arc-20260327;
 b=bcv/VdoTKwlZO/7AZxxihTvL1xOAqJOP6e+fkAj1P6yFcmnjkVh+PhOQmH9tUY3AXm
 nhGa/Y70gdj9D8dpWQZOXGLxK1LNVGFytBuJ+BjBEa8SYvVdV4cypCKGOO87P3Itzh7q
 W2y8cqHmktAzaPeGbooQnDd6kw2zGj99kDvd+hf4fzKPWbHIfqCpy/dRBeO5MNXJmoF+
 ypL6eRSCQkan6nT+6nmUM4YoLz9RHQklwk4MPxXBsZFD1CWXUhD9qxUbVCtpHad4fC4+
 iC2W/XGbt+WyV8glbtavnQmq32GxKTHHhak+uPlw0nQAPmIXH7iayYG4qGN3MLKzrwY7
 cGEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=PEeh2CDsEqZLdR2J8aqfy9cMB1NjNq2FSC7JA1ZKwf4=;
 fh=vG+vRmsTV60pLNz5HTnRoOUPnF8nBJeZ5u3XU4J4HT4=;
 b=C3i+p+eY0kDV26UrJbkY/uwkMJUzY5iFylpmpjY+6yidYz3yG0AhU39dEbe8A3OzRw
 bs1tzkliV/9MRdG7fcVLHShQA5pGg0v7DW+pX0Sda1uwCiyiXxg5GJohR6hN5l6pH9y/
 IHfLMRSZqlAQJKJa7scZDR6/RSuoSOQ8bY5PO/QTFm7fopySUuzMPos9roTrnf7PY5LP
 ABN6G5ESDRH4EcYJ1T9t8zVIVWailqJCFoVR85MCZabD8jReo47PJIHGu5P07zKEqnX3
 sJx0s5wibFJq4xUJs+Srve6q79aijV4Y/IooaJSnsFwWfqRn0jOs6jlvuKPnB5y4rXDd
 lVaw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794188648; x=1794793448; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=PEeh2CDsEqZLdR2J8aqfy9cMB1NjNq2FSC7JA1ZKwf4=;
 b=CFixKUdK1afivPxcxk4mnpuUD5pdVIglmAi/D8TfP3JQTE5AoYPuVAB7PNCb9ELmba
 DjPPZZl5a/bFSWtHb5v4UPbtA4zBq+Uw7XB5DJJ+knVdaEMJnf9riOmbB/ZGv4CXgpuP
 vYw7ttCq+AdmVJeSuwKVwFPx8YM0/Kyic7iY2aVay9Kju6HA8B44bs5d+wnWdIu1xdcD
 fBeydXyyO1UFFp+ASwwFpwW7eph7g9F+oP7J166d269aPQgi9N9eCCkHND45YNmFMAsj
 YIzpx723khx//pXLVts2IezWsOy3L5WOj7gB9BYRDAg2O749yi1QelOXpGjL+NzINp+h
 ARHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794188648; x=1794793448;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=PEeh2CDsEqZLdR2J8aqfy9cMB1NjNq2FSC7JA1ZKwf4=;
 b=Fcjlm19FviKO2nr2HYbIl0Q8b6VTJUj5B224AHbzx2KEt27NT/VFhhMma8jDkZI11o
 8Sczr8LHoQ7A3axGJjcJWEHyfITC5iN3ge2mzPD52R1Rccg1BCOmu+dKEB/nuJ1MFUY9
 IA05MLDEnpQ7aYimZ4vRibzQaJSI+YKCt46VCo/41npxqYCZhsbhHxh3tOmMPSZ0/cr4
 j3wj/D2uIG6C/nfHkvrdzuDGuDIwXR2iWvR/nqazGtN4x61bwrlHfJgyeHx/p+8GecZq
 ET9ObpdGqIzTABcl0eL9HNWd/lxEr1L9OrV7j0ZmzjZm/eoMpoJO7XD+OCpLr3ZxMsxm
 Rdvw==
X-Forwarded-Encrypted: i=1;
 AL+hErFlf08fVeHwwIwNkv3ZW67d1ztFxexXirNEgi4H3lWV1bIHY0MLC7A6UQb2zuzfTILdbBAIIwbqYg==@nongnu.org
X-Gm-Message-State: APuU4Z8lTNgBf/yyr0TMFwH8ya5IXaRpJM6tYgrKAbUwUGAMiC8Rvz1H
 btIjYDosb02tS9suHvG6WKcclEJskz1fw4mADAHFdI1vfRzD7Y4EDXYbzLfT/YD+NgkTuqUr+PX
 4OaLLEMzOOag1tW1Qg0/qLmWVrF7oLac=
X-Gm-Gg: AYBFou1+BXGKbWQc3XOGBT7FsyYm+8LKM2EJ15BXv5ciGurJLyCdfzhUUwP2HUKB0yD
 k0qyOMD5Kjn1nTVqY1Q3O20sxL9A7aJt2xIAXzXYAoAja9/Kw45jQwcPZV/zoqFOP37RL0/CGVO
 zYLNC99KkUJUgUan59buAulpNqeIVZ8lWwDbJgXAjYUwLzifr38cz9E5jh7BKAWvbj86H0qr/pH
 YXVHm4nx8O2wXzXlPTw6spzWP0ThQWl5UFI4Ie+oSu8YkjyzoZEbk6UjvjqeRiThiME2qSShKZF
 UnQtNhYiJPqodiJHO8mMv9xKXyflGs3L6JeHyWSKnkVv+MGFw2XWrC4oNXVdP50TpSN7GJTt0x2
 VTSN9yv7nMirksQDcihglwSUodN2gKbNvAScCYS2vZJQpK6Z4hAIwigt9yNwH6ibvDEcwkctoaI
 f/
X-Received: by 2002:a05:690c:ec6:b0:8b3:4911:2da6 with SMTP id
 00721157ae682-8b36ca6b529mr16623277b3.37.1794188648414; Sun, 08 Nov 2026
 17:44:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104154207.641511-1-bin.meng@processmission.com>
In-Reply-To: <20261104154207.641511-1-bin.meng@processmission.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 9 Nov 2026 09:43:56 +0800
X-Gm-Features: AclHuK-cM40wqtr9q-UU1fEM780aUlYFH5uJmxgHzV_fB2Bw4vRNitKkaB_AtyQ
Message-ID: <CAEUhbmW4u6sjkOtY_+Rm5SVz7Uxxx69=Q-5kSOWsSC=PfFLYfg@mail.gmail.com>
Subject: Re: [PATCH v5 00/26] hw/riscv: Restore Microchip PolarFire SoC Icicle
 Kit firmware boot
To: Bin Meng <bin.meng@processmission.com>
Cc: QEMU <qemu-devel@nongnu.org>, Alistair Francis <Alistair.Francis@wdc.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Chao Liu <chao.liu@processmission.com>, Conor Dooley <conor@kernel.org>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Markus Armbruster <armbru@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Sebastian Huber <sebastian.huber@embedded-brains.de>,
 Weiwei Li <liwei1518@gmail.com>, 
 qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 4, 2026 at 11:42=E2=80=AFPM Bin Meng <bin.meng@processmission.c=
om> wrote:
>
> The microchip-icicle-kit machine was originally validated with an older
> Hart Software Services (HSS) firmware stack. HSS v2026.04.1 cannot boot
> through U-Boot to Linux because several firmware-visible parts of the
> PolarFire SoC are missing or incomplete.
>
> The first failure occurs before the UART is initialized because the L2
> zero window is not mapped. HSS then needs additional L2 cache controller
> and DDR training behavior. Later boot stages exercise system services,
> the RTC, SDHC version 4 DMA, and high-capacity SD card block sizing,
> along with the complete DDR aliases. The existing models ither reject
> these accesses or expose behavior that does not match the hardware
> specifications.
>
> This series restores the complete firmware boot flow. With these
> changes, QEMU boots the HSS v2026.04.1 eNVM image, loads its U-Boot
> payload from an SD card, and reaches the Buildroot 2026.05 Linux
> login prompt.
>
> The changes are organized around the firmware boot sequence:
>
> * Correct the L2-LIM size, map the L2 zero window, and provide the DMC
>   status transitions required by HSS DDR initialization.
> * Model the documented L2CC Config, WayEnable, and WayMask registers,
>   and resize L2-LIM as cache ways are enabled.
> * Complete SDHCI version 4 support used by the Cadence controller,
>   including Host Control 2, SDMA system addressing, 64-bit ADMA2
>   descriptors, and SDMA boundary continuation.
> * Run ADMA from a bounded timer-driven engine instead of performing work
>   from command or unrelated MMIO accesses.  This keeps DMA progress
>   independent of guest register traffic and avoids consuming a polling
>   deadline inside the command write.
> * Advertise the Cadence controller's 64-bit system bus support.
> * Add the PolarFire SoC serial-number system service and RTC, and honor
>   the system-service notification control bit.
> * Correct the DDR aliases and fix the board topology at its physical
>   configuration of 2 GiB of RAM and five harts.
> * Document direct and HSS boot, add focused qtests and a full firmware
>   functional test, and restore the machine's Supported maintainer
>   status.
>
> Testing performed:
>
> * Built qemu-system-riscv64 and the documentation.
> * Passed various newly added qtests.
> * Booted HSS v2026.04.1, U-Boot, and Buildroot 2026.05 Linux to
>   the login prompt using the functional-test image.
>
> The functional test uses the processmission/qemu-machine-images release
> v1.1.1 tarball:
>
> https://github.com/processmission/qemu-machine-images/releases/download/
> v1.1.1/riscv64-microchip-icicle-kit-v1.1.1.tar.zst
>
> When restoring the HSS boot support, 3 potential bugs were identified in
> the upstream HSS source codes that either blocks the DDR training from
> succeed or traps in a multi-core race at the very beginning or after
> a succesfully DDR training but stuck at OpenSBI/U-Boot hand-off. There
> are already bug reports filed aginst various upstream projects.
>
> Changes in v5:
> - Select REGISTER to fix riscv32-softmmu link failures
> - Rebase onto origin/master
> - Drop the high-capacity SD block-size fix already merged upstream
>

Patch 8/11/15/22/23 still doesn't have any RB/TB tags. Ping for review?

Regards,
Bin

