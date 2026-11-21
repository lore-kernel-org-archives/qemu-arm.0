Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A308606A320
	for <qemu-arm@archiver.kernel.org>; Sat, 21 Nov 2026 15:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O9N1plTl
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xUn3c-0008VT-5W; Sat, 21 Nov 2026 10:31:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xUn3Z-0008UV-Cf
 for qemu-arm@nongnu.org; Sat, 21 Nov 2026 10:31:13 -0500
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xUn3W-0001k0-8W
 for qemu-arm@nongnu.org; Sat, 21 Nov 2026 10:31:13 -0500
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-675617e81f9so2154987d50.3
 for <qemu-arm@nongnu.org>; Sat, 21 Nov 2026 07:31:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795275068; cv=none;
 d=google.com; s=arc-20260327;
 b=Q6IjzI6EnvQEH7KQhgHGKUVFtvMcHBRZzEeC35hdMwW6AtJSET+0hcgEwwntf+Fi7l
 SY0lJAOKyXK0uGq3dSRUDx8xJkSEk4AeLmxj5wM5xQa4kFHnDCmoV6ffsGllYsZS704b
 XPhUgSJxmburlGZ7RoXMjVnEueRAoSWOxjfOKUjU/uRAouBCD9zGk26whSJKDo2rbUkl
 CCw36l5lAZOqO0/fc1JXWc4e0AbhdZNAtY2olWecZlx/O84plAsiPz8E8jxRjTcSDvj/
 wEafY5M/jPCiGX+0aLmHEacfiyDrfZL3Crczm8wsFueYvmd1fN9dA9gSWL05prn8Yxos
 +RCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Ymh1U0QIx+ok+DwbBTAoaXzSeH80ixPkSzLNsRW/NP4=;
 fh=VLYDCtod+l4XksWSUZ6JPsMtW4upo9rZm1bUOp4cT54=;
 b=stywrD8x0auymj+vZ9905JrgZ2IwF/5hylsL7TbkY2wcFzi40KaasUA2dC6NQrlEBD
 FaTw3QtJQlflGVxXgXdom/fozf5Bc0dOgEyx8rGeJe7xy8aqFkY1DTFk+r6c2VdHjexj
 D9J1zGnsRYDML6hUWBl/RJFCGo3spL+PAv+eN+sM/fUlHxwDua+W2bSQAAJ8WGrAFTkG
 vgtzofd175DjLlTpzSZ1F9woSG/6vnfn6GEszi7S6SFlO7+8PLXYP+SHkjelOhJ6VuQc
 Qv1SSZuhbQ/CkrhNm1t3FJSZjfSauOb4AWAqtPT2/u5CJle/W8dXAfTNNZgKee2MYMvH
 Kfpw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795275068; x=1795879868; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Ymh1U0QIx+ok+DwbBTAoaXzSeH80ixPkSzLNsRW/NP4=;
 b=O9N1plTlIQQoIsptnQFYO/fGawCghmVC100umxbPOrFI2jBZYWH0p/rzJ+TpkktYw0
 5UCR5cFfmNFuiC52BsAklD5A8ZBkW1GUXN/i8TPxO9QVJVy40IOl9uKc0JcQMOo9pXs2
 ZqC/SSsmiU2jpu5PJMMrC74C4u6ImAvUAsGOSVOii0SSC4fB8MaJxkvzn6fop4PhzAUV
 uu7W8o4w//pQU+p4k6x4RuJyUo0Le5hFAL0l+5w9gKgVnKqB130k+fntoBKv7VqdDioo
 Be9AUZDSPQNwDc8Jj+V28c4Z1BXXYEzG1JNK5RlFVpDJFuNPAxod//YrtF0Ntd70fwh+
 wf1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795275068; x=1795879868;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Ymh1U0QIx+ok+DwbBTAoaXzSeH80ixPkSzLNsRW/NP4=;
 b=xFfqUStkQDH2P7XHtMB8ckKlidFcIRjO79UdxVUW4G0B31PptQ9UhInJoRRUpAhifk
 JCCOdAhgQHGkR/ggjaGbhTHws03VrmJO5L2vwFYOcJ6AwNBZ5/MYtV3S/5FpKT+2KTVx
 DRd8PJP1YpHl5yFNxDZ6cb8JfJ0hRWfs9n2pA76tBGbz4GI007gMg5E2TgKmJDBg0cVz
 J/V9ojDze8svXTjmPiJyiHJuAt8/ZQFAgbRRCw3Mr8RCdZDUtOHV6IvNANPHBk+aFw3+
 T2hTvgaPHnFUMExfNkfghKCojQb9AneHjXXNayvZWfRrDc97COBgOkYROIe2eiAZ6q10
 rhBQ==
X-Forwarded-Encrypted: i=1;
 AL+hErF8cjyjQIWifoNNlwoIZnoB2WCbq6mzFEcq0OiOdvWeZQnEv4yz8VG1HHyniVXQsQHqdFVFllHYlg==@nongnu.org
X-Gm-Message-State: APuU4Z8riZIXrMlp6Fw6S5cdgAVNLG9Kvybe6F0D9IXLs868px1F1NWZ
 jHJL+VStVBcqFBnNKp9E+KpTzADLWCBlRapqmZ0V/B7syrQ2k+x7PC2c47DINWF+3kinR1YkYBV
 USBJuzQ7uUtKTYAbnK1QN7yUhug0YRfQ=
X-Gm-Gg: AZFdTZdj61spmDEr/F2+DSgHBVBavCFQLkmNH5ZvSES3fJZAtQMwPX99maL/Gz85nlP
 yurKH0Myc56Jm7DU9O1wEhZHo86OwKvGNNdRi3BFJE6NefJMgEjfJW4xQBYhqk9oMPMAwPVSm57
 e+r40dH3v1yVNy0fMwuIaMvTWri7pFJ/A1JcRqqVRvTpumUHt4IwNDaiAmGpiZgIgoQ8oMpnFZh
 uXA/wc8B8ZqFuLxZrryt6beGIxmMEueSlr1yonu8J/M57w65D/YdZCwXxoXPOePi9RPNbPwQAIV
 mq//1KSsQYT9Mdf6+L+gZQ6nsSmYRR3vBHjqhcHPaJLxMxF6myooJYWlPf9LU0L46G2rhmFOz3b
 OJCwlZN1Q7AX5JzaexGyQ79Put9ZPiRx6vnBLl1okUBW2B0/bhZB4dzxxmEYHeO6VfecvcNk=
X-Received: by 2002:a05:690e:12c5:b0:67c:1dca:808 with SMTP id
 956f58d0204a3-67df43f6506mr3192394d50.40.1795275068633; Sat, 21 Nov 2026
 07:31:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104154207.641511-1-bin.meng@processmission.com>
 <CAEUhbmW4u6sjkOtY_+Rm5SVz7Uxxx69=Q-5kSOWsSC=PfFLYfg@mail.gmail.com>
In-Reply-To: <CAEUhbmW4u6sjkOtY_+Rm5SVz7Uxxx69=Q-5kSOWsSC=PfFLYfg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 21 Nov 2026 23:30:57 +0800
X-Gm-Features: Aa3M54q5dQ7qxUjEgRs_XFF_wf_wOAr933o_dCzX0PcLbwkHPto4xrMLFmfvWgU
Message-ID: <CAEUhbmVS6kEBHG29j4w+ftcjcKEoVMPbeKo+88oBZpUJ1W0E1g@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx1-xb133.google.com
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

On Mon, Nov 9, 2026 at 9:43=E2=80=AFAM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Nov 4, 2026 at 11:42=E2=80=AFPM Bin Meng <bin.meng@processmission=
.com> wrote:
> >
> > The microchip-icicle-kit machine was originally validated with an older
> > Hart Software Services (HSS) firmware stack. HSS v2026.04.1 cannot boot
> > through U-Boot to Linux because several firmware-visible parts of the
> > PolarFire SoC are missing or incomplete.
> >
> > The first failure occurs before the UART is initialized because the L2
> > zero window is not mapped. HSS then needs additional L2 cache controlle=
r
> > and DDR training behavior. Later boot stages exercise system services,
> > the RTC, SDHC version 4 DMA, and high-capacity SD card block sizing,
> > along with the complete DDR aliases. The existing models ither reject
> > these accesses or expose behavior that does not match the hardware
> > specifications.
> >
> > This series restores the complete firmware boot flow. With these
> > changes, QEMU boots the HSS v2026.04.1 eNVM image, loads its U-Boot
> > payload from an SD card, and reaches the Buildroot 2026.05 Linux
> > login prompt.
> >
> > The changes are organized around the firmware boot sequence:
> >
> > * Correct the L2-LIM size, map the L2 zero window, and provide the DMC
> >   status transitions required by HSS DDR initialization.
> > * Model the documented L2CC Config, WayEnable, and WayMask registers,
> >   and resize L2-LIM as cache ways are enabled.
> > * Complete SDHCI version 4 support used by the Cadence controller,
> >   including Host Control 2, SDMA system addressing, 64-bit ADMA2
> >   descriptors, and SDMA boundary continuation.
> > * Run ADMA from a bounded timer-driven engine instead of performing wor=
k
> >   from command or unrelated MMIO accesses.  This keeps DMA progress
> >   independent of guest register traffic and avoids consuming a polling
> >   deadline inside the command write.
> > * Advertise the Cadence controller's 64-bit system bus support.
> > * Add the PolarFire SoC serial-number system service and RTC, and honor
> >   the system-service notification control bit.
> > * Correct the DDR aliases and fix the board topology at its physical
> >   configuration of 2 GiB of RAM and five harts.
> > * Document direct and HSS boot, add focused qtests and a full firmware
> >   functional test, and restore the machine's Supported maintainer
> >   status.
> >
> > Testing performed:
> >
> > * Built qemu-system-riscv64 and the documentation.
> > * Passed various newly added qtests.
> > * Booted HSS v2026.04.1, U-Boot, and Buildroot 2026.05 Linux to
> >   the login prompt using the functional-test image.
> >
> > The functional test uses the processmission/qemu-machine-images release
> > v1.1.1 tarball:
> >
> > https://github.com/processmission/qemu-machine-images/releases/download=
/
> > v1.1.1/riscv64-microchip-icicle-kit-v1.1.1.tar.zst
> >
> > When restoring the HSS boot support, 3 potential bugs were identified i=
n
> > the upstream HSS source codes that either blocks the DDR training from
> > succeed or traps in a multi-core race at the very beginning or after
> > a succesfully DDR training but stuck at OpenSBI/U-Boot hand-off. There
> > are already bug reports filed aginst various upstream projects.
> >
> > Changes in v5:
> > - Select REGISTER to fix riscv32-softmmu link failures
> > - Rebase onto origin/master
> > - Drop the high-capacity SD block-size fix already merged upstream
> >
>
> Patch 8/11/15/22/23 still doesn't have any RB/TB tags. Ping for review?
>

Only #10 needs a review or testing tag. Ping?

Regards,
Bin

