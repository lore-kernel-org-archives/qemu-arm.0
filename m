Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp669097wrg;
        Mon, 20 May 2019 14:52:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyBPo1FMOyvV5W93HPSNOAYFXQjUhfrl8gS6rihFkbWlwiAI/d+D3/ioTrQkcHqXFEpIdJW
X-Received: by 2002:aa7:cb44:: with SMTP id w4mr78849472edt.233.1558389122216;
        Mon, 20 May 2019 14:52:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558389122; cv=none;
        d=google.com; s=arc-20160816;
        b=EOkeDz2CEr3vwfc1bI2XHjwpRzdJAlsarcGMuKEF08KBEh06h9rGjAidQF2GMwYP5p
         tCiJW55zMpsbHt2oxxppoQcFP7pT7yCN6VzIpTXQzlZclvDGHNBOsfL69vtGxw0fWBnu
         4U8c70gMtUWQPPt1xiG3Lo7tb8gB8FSPSKAkRcRjn50tBfXJBHLyAcl4zZ8ytMcROP2M
         pf420ozaYjTvMO1SEuMnKtcc6MnVu/zQOCdfURUU/q1FbOIyEOjWIFr4WJIB+8XC0VtZ
         K4tY2HFbOsw64bniOrwJFomKLOMjcAJGpJ+t0gTdcEqTKgAbfS3/dwyL5GgJBBuPmuDF
         CerQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=koufGJffk4TKMQ9ktHHDRxKPvbMzt7Wf2ZYKsbOYO7o=;
        b=C76NxEDWhbS4k68yWHKeavWY98f9xPIJp4/oTtAWJeATb0n7OLH+BnRzGa8l4BgE9n
         ZA9sgQZHZFvx+K9nuA3kqrI8OfE0vWb4K8xJrDTZCVORR3vU4qlAgg+5nCZbeCLe9cpY
         dPSaer6QPMbFikX+ZdRfCVyNWewEJoLd8mfFRS4BIZo5qdwIZyXIxXW+FQTyGkdyVBV/
         LaXLc0iOE7obctRtUbpMTuQsnNC7E5C4HIdTC0vk5sqZ8sYi+De+IW5sZPKjDSeUUCYX
         J+wn7B3ylBnE1lS92MthAINRR/lcJe48CdbP+XVrzn15S3MWDq4+SbftAnQoGMCHK/EL
         Ci5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u0bXUr+r;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q21si4119223ejb.278.2019.05.20.14.52.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 14:52:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u0bXUr+r;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:42464 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSqCP-0004Fz-A6
	for alex.bennee@linaro.org; Mon, 20 May 2019 17:52:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hSqA6-0003BB-5D
	for qemu-devel@nongnu.org; Mon, 20 May 2019 17:49:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hSqA5-0005U2-9E
	for qemu-devel@nongnu.org; Mon, 20 May 2019 17:49:38 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:36019)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hSqA4-0005T1-GE; Mon, 20 May 2019 17:49:37 -0400
Received: by mail-lf1-x142.google.com with SMTP id y10so11468506lfl.3;
	Mon, 20 May 2019 14:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=koufGJffk4TKMQ9ktHHDRxKPvbMzt7Wf2ZYKsbOYO7o=;
	b=u0bXUr+r9/bPiVzwJLzgv0nQ1og1wdajhlcSIogC1byW1W/HNr6Krb81kkg8fBYAgc
	jQKG7LVe8x1qddPmrc6v1p2Dyj2nJIgZNvQ8tO0kmLi4D1vWfd4X2cjftT7zo/HdSN0U
	LXraznxPrZdBD61Dl+pe//GE0jS3t/IZi5A57/GujItj44fDgYTDTdAqkamrhJlr5CnH
	M/5UrZCK1SYS71ITymA+zu5RBl2buIVfmDm3qoMtB/eCiSkhn61MI+8yrz9zRKBj/G3g
	AYqolzZLkMDLJ5rR84jejnC77ZD816pnJ8YyZtuCpQnAtlW2J+gjybOAjM4LQBeHaXf7
	pJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=koufGJffk4TKMQ9ktHHDRxKPvbMzt7Wf2ZYKsbOYO7o=;
	b=mCn6pBnQi7ss9lo1R1fcgsEUHZibWrjiCYEe+ign6T4CVLYJNYtGhR9TeT9Buk8qh+
	q7oN8bX0e1NXS6TItsSc6LO1TVnZue8lSpvzZCX88jt0x+XHwSHJot8VxhVAmCXDfKLS
	XZvGASJnkCodBkslGb4fqUnMY6Xbjkv0RDoxfOdIkpCg4jCTYli1/XnLXHzEdVtn4LM2
	lcvkruiEwVSa7UhE88TU+kavK4Zx0nDlkjMt4VO5QPp5LBV6C1ZCCRnp7pTgNXkQJew4
	iD9ugbR+XTT+mTWbE1d0ve9TiRJcuMbSFGJP9Hdsa2rv3KmCvPdcECsQ8fKw1s6HBRCX
	8a2g==
X-Gm-Message-State: APjAAAWynTPqFA7d48wfNzLNkDLj7Zw9YT9RhhrlbgErMPXTqX0nN1YK
	Z8SHhhPId9tHYJaekuhPheygas310GiguUg2lAQO9CTs
X-Received: by 2002:a19:7516:: with SMTP id y22mr16900911lfe.26.1558388975142; 
	Mon, 20 May 2019 14:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190520214342.13709-1-philmd@redhat.com>
	<20190520214342.13709-2-philmd@redhat.com>
In-Reply-To: <20190520214342.13709-2-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 20 May 2019 14:47:20 -0700
Message-ID: <CAKmqyKM2FYAsC6mDJWdOOOmHq3XL6+9MEnAWfCrNzK2s7AAUPQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: Re: [Qemu-devel] [PATCH 1/4] hw/arm/exynos4: Remove unuseful debug
 code
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Cf0n92Jo4ChD

On Mon, May 20, 2019 at 2:45 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/exynos4_boards.c | 24 ------------------------
>  1 file changed, 24 deletions(-)
>
> diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
> index ea8100f65a8..f0c24b7992e 100644
> --- a/hw/arm/exynos4_boards.c
> +++ b/hw/arm/exynos4_boards.c
> @@ -35,20 +35,6 @@
>  #include "hw/net/lan9118.h"
>  #include "hw/boards.h"
>
> -#undef DEBUG
> -
> -//#define DEBUG
> -
> -#ifdef DEBUG
> -    #undef PRINT_DEBUG
> -    #define  PRINT_DEBUG(fmt, args...) \
> -        do { \
> -            fprintf(stderr, "  [%s:%d]   "fmt, __func__, __LINE__, ##arg=
s); \
> -        } while (0)
> -#else
> -    #define  PRINT_DEBUG(fmt, args...)  do {} while (0)
> -#endif
> -
>  #define SMDK_LAN9118_BASE_ADDR      0x05000000
>
>  typedef enum Exynos4BoardType {
> @@ -140,16 +126,6 @@ exynos4_boards_init_common(MachineState *machine,
>      exynos4_board_binfo.gic_cpu_if_addr =3D
>              EXYNOS4210_SMP_PRIVATE_BASE_ADDR + 0x100;
>
> -    PRINT_DEBUG("\n ram_size: %luMiB [0x%08lx]\n"
> -            " kernel_filename: %s\n"
> -            " kernel_cmdline: %s\n"
> -            " initrd_filename: %s\n",
> -            exynos4_board_ram_size[board_type] / 1048576,
> -            exynos4_board_ram_size[board_type],
> -            machine->kernel_filename,
> -            machine->kernel_cmdline,
> -            machine->initrd_filename);
> -
>      exynos4_boards_init_ram(s, get_system_memory(),
>                              exynos4_board_ram_size[board_type]);
>
> --
> 2.20.1
>
>
