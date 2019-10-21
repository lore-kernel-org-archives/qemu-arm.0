Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5089936wrm;
        Mon, 21 Oct 2019 14:01:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqylXWpdPB7JQGEfqrjHEw8jJdxClHPkKKbuODGKkJO6Ooa0b6r7OmStUojhQ3S/oSEUVSA4
X-Received: by 2002:a17:906:1542:: with SMTP id c2mr23390078ejd.80.1571691668330;
        Mon, 21 Oct 2019 14:01:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571691668; cv=none;
        d=google.com; s=arc-20160816;
        b=cXZP6wOyT4Rs6eFfHCbIzWSAqAwJPwnRIgWx1+EgCGksP39UD4bpKj4wU1dU0Y3ChH
         W3tDMIXogrBlvleHyoKHxTr1PD+E9r3bfYjznngP8yOiT4avhem97EgYRBG4g5mkZT0l
         o5a95W2epH4M+n3MrEbWp15y6FCgZSFIkdPEbpC+OWeP2djwT2y87xdMHAQEmwso3KDh
         YykkZQS/Bbwa3pUuH6fKSGhfZoFL276Z+qBcNrPw+Zf3EEZyIfVZJ7QpYt/Xp+Wthb7w
         Gr+2A1SnkYHRDw2B75r00uSf3WB3OfoUT1aXZVR46zhqi/sMMXVlNlDeoMNF8tVPJi0M
         MXmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=IRfRBhOJ4tK/eyaHwLIDarS0P0zdVadV9K948uMtz8s=;
        b=ZrqoDfcOFqtxzDpw4PKL2bbdrCtWH9t4XnHxITnaL+cWh8ied3RDpVjsetW+nwM52h
         TtnUECDJr95lp43ltx2oT4Q6dJbQ/5ETnvTgb2ySvL6zPxRTAbmm1LSbyJSYAOmbwtel
         bsMIzWcYZrBPHK/rmD9kfgvl9PnJIxs2f84dptZXkL9OE/ut6kfUsH+s3G3boT3G4EgC
         8nBpN+DM8M+tdadq6JnvuayUj7r1Ra0ymeLq397/W0dI1gfRExbWZI8yyrBAqamRcjlZ
         YmaLU4/Ma0GMyoD2CGQ0mFqRNSrOpXsrqF/yr25lTWELsrHFc0d1zXscIaIZXFs3mDQT
         iXwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Z3LiAsQs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9si10892507edb.56.2019.10.21.14.01.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 14:01:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Z3LiAsQs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMenb-0005d0-BK
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 17:01:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42697)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iMemR-0004sZ-UQ
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 16:59:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iMemQ-0006l3-OI
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 16:59:55 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:36542)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iMemN-0006iv-Us; Mon, 21 Oct 2019 16:59:52 -0400
Received: by mail-lj1-x244.google.com with SMTP id v24so14851374ljj.3;
 Mon, 21 Oct 2019 13:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IRfRBhOJ4tK/eyaHwLIDarS0P0zdVadV9K948uMtz8s=;
 b=Z3LiAsQs+IjfGkUKDDbF1Eh8jAjin6+rbCAjr13gMH1+O4756chEphzWBHW9KhkTtg
 Vfy4zZyDaC9qftuuzmvNtKt2WE8Em1b8pbfBpqfrLM7dth2Aoe90Q3RRB7zMUP1Ut/Od
 1WH7lO5CsnMBEaA6wN6y4VsmP6vpShbUVWx0zPP55QBigdf6Xsgo+wCNSNUfjGxpbaXi
 TQLnni6KVPzDgcRQQj23rZbgPKUsI7OFOrlngOmPjBYdwoK5jV+/GSAkQIMjuM89n/w4
 Ei0OlHSptGIj8vdcHSujJryJ8JjnsHUcGw6gQBlSS5Up6POKEeWfAkwemZgCkhFBhSvx
 +4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IRfRBhOJ4tK/eyaHwLIDarS0P0zdVadV9K948uMtz8s=;
 b=MB9m3aaTlgcaWuOeGxrdfnC5xMZHa3JykpRrBXe+TJRtNAHTlGuAGngSp99jicTZQo
 WqQxvPBcMstDJQKNkOCIDY91XYCTtDRg3fTPHMVsPJ11dRSBlZy2hQwy7Km09+TD114C
 4xdsN5343LyxmuO4hdm7jk4B4E5k1r2Iq5d0LUpfm4OepEfOkrlQy8CXd9giA/R1bof4
 OmhYZNrbtokPLfVvuPSIE/ZAq51kAq93zYFIVgahzPFt2OmBpvK/vzB8yPC+T2w9T1sq
 tl1qq7f2wWWnFHufNOOzhp6SDWCcnzGuqcu55W/p4zbgqBw7/D3KXN7iWNTtdJDrqzGI
 oYsQ==
X-Gm-Message-State: APjAAAVnGdLZNOoqsC5RU9xCZf3gtOesCF9hdHGRLYiUh+GGQlheTRbW
 Z9USg7NOEIEJkzypLgQKz6fAxPlLtgzHSxhfiB0=
X-Received: by 2002:a2e:894b:: with SMTP id b11mr16221475ljk.152.1571691590645; 
 Mon, 21 Oct 2019 13:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191021190653.9511-1-philmd@redhat.com>
In-Reply-To: <20191021190653.9511-1-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 21 Oct 2019 13:54:35 -0700
Message-ID: <CAKmqyKO7HrqwTkXVadKikT_+2e2BfW2uevQV0UFm0_ZYnZfCLg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] hw/arm: Create the RAM in the board
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::244
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9p0FjD7RS6q+

On Mon, Oct 21, 2019 at 12:07 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Hi Peter,
>
> This series contains the ARM patches extracted from the
> "Let the machine be the owner of the system memory" series [1]
> reviewed by Richard.
>
> These are cleanups moving the creation of the system ram at
> the board level. The other series will enforce
> memory_region_allocate_system_memory() get called with a
> MachineState argument, this preliminary cleanup is required.

For the whole series:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> Regard,
>
> Phil.
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg05085.html
>
> Philippe Mathieu-Daud=C3=A9 (6):
>   hw/arm/xilinx_zynq: Use the IEC binary prefix definitions
>   hw/arm/mps2: Use the IEC binary prefix definitions
>   hw/arm/collie: Create the RAM in the board
>   hw/arm/omap2: Create the RAM in the board
>   hw/arm/omap1: Create the RAM in the board
>   hw/arm/digic4: Inline digic4_board_setup_ram() function
>
>  hw/arm/collie.c       |  8 ++++++--
>  hw/arm/digic_boards.c |  9 ++-------
>  hw/arm/mps2-tz.c      |  3 ++-
>  hw/arm/mps2.c         |  3 ++-
>  hw/arm/nseries.c      | 10 +++++++---
>  hw/arm/omap1.c        | 12 +++++-------
>  hw/arm/omap2.c        | 13 +++++--------
>  hw/arm/omap_sx1.c     |  8 ++++++--
>  hw/arm/palm.c         |  8 ++++++--
>  hw/arm/strongarm.c    |  7 +------
>  hw/arm/strongarm.h    |  4 +---
>  hw/arm/xilinx_zynq.c  |  3 ++-
>  include/hw/arm/omap.h | 10 +++-------
>  13 files changed, 48 insertions(+), 50 deletions(-)
>
> --
> 2.21.0
>
>
