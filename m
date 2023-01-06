Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp460416ejc;
        Fri, 6 Jan 2023 09:52:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs/azdS68+k7bA9f1uAPzDnQlhiHaaPZfsb9z/08v5yaU2KNFwQa3KK+HF8cz4BkGclbQXP
X-Received: by 2002:ac8:460c:0:b0:3a9:77d7:a2fe with SMTP id p12-20020ac8460c000000b003a977d7a2femr75846670qtn.1.1673027544159;
        Fri, 06 Jan 2023 09:52:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673027544; cv=none;
        d=google.com; s=arc-20160816;
        b=Ij0agF2gZYAkTXqWBePVBUg7aisEJhWLcwFoLcmre3DHq8VTTK6hEvufih15Jm/kvY
         7QtU0UKEp9SDY94EGPj2OhiVSHPooZ2Q4QRVUFFZdVzJ4c2t+b29ia0KqTE0pk+J55XA
         FioKZkz30GTlHiWoyH+RxWn4Jh3w05icQzCPpLNDWIfrhWp/6pI2M56zUaagROtCOXdC
         g1QAvHIcOhuYAz0zm8ppumKNUoRfGCeOzC/DtMFyz5cjGpq0TTFR9mRp8s6/lj79W1Hh
         L7HlbpLuh9lQhywCJnjrNVXN1ZCoEOnpZ8Xsq28Cl+U25HmXPJWxCkVt0Z2bL3Zjr/gI
         TeOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=SJ8hPDGrCEyZK9KawWvPVf6wiiy7sBG99LcNDYd+zDg=;
        b=Qp8cAwIDoKnZFcOtjlEKC+m6tm7c8Tdnu+XpKDcGH3dm62xj2az3YKGCKRjfrowYsN
         x2BqsrRiPwqMdl7vDBo28JY3zk0ixyfv940+3KOYv+rujSoPN0L71U81aHhPP1G71wFe
         ljMCR9Z4KW4Vq97991KUPR7gnl/p6m7rF6/eKi2GMLIsRdi/lx1E3n/zdOhfeh42W9Pa
         DV22AzC8CWuBV86SDAExETHwCt+GqBQdYLY/ucdmxQb6PGT2Z+da46SkPEcbWI8WPCVo
         ZSgrMjiYLg5R7Y7eb1M8RUd9F9cPNmZLbZ2mvybaRaMwLGBCyrVBZZW5UjuyF64vvB31
         KozQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VUML8qZc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x1-20020a05620a0ec100b007024ba46107si950040qkm.684.2023.01.06.09.52.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Jan 2023 09:52:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VUML8qZc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDqsp-0003o6-NQ; Fri, 06 Jan 2023 12:51:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDqsj-0003n7-Tv
 for qemu-arm@nongnu.org; Fri, 06 Jan 2023 12:51:53 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDqsg-0002I9-Cx
 for qemu-arm@nongnu.org; Fri, 06 Jan 2023 12:51:52 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 z9-20020a17090a468900b00226b6e7aeeaso2410168pjf.1
 for <qemu-arm@nongnu.org>; Fri, 06 Jan 2023 09:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SJ8hPDGrCEyZK9KawWvPVf6wiiy7sBG99LcNDYd+zDg=;
 b=VUML8qZch/Jv8BSAcHxHGeAHsOC4WJoLkwSCgMP5w1z7u2UpzTX/NOHwU9W7svHPYy
 rKyB12UGWO41JrYyoDB3U4ZzvtLTngAWia03WY1o2/+mH0soLQdJdLrb8xyereyG3iCe
 IUZNT/yUdKh6m0XMvaicXmZX98HDmb4a9L6IU+joNqezKNq7uoc1iPZOwfCRMDsSMI73
 OzKSjEQ+OBxhCCRHzqmS8NNLQHS+nk3k5rr/n5VC+SuECn7Aa08wJKcxkdonB816P/6O
 Zh8DXLJbMHTLrp5RSJJXpu67t1SwGny+FQJIkBeF3qMxmZ2x51rK3uu56EhHp3Gb/0yD
 gyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SJ8hPDGrCEyZK9KawWvPVf6wiiy7sBG99LcNDYd+zDg=;
 b=BRr2LuyKq/oKdN+MV5ncVNoNg4y03VAq66EXXfnTyxI/rhRdf29yGLZ4HaKhvUKnGo
 Bl8HYSSgg5bLtDP6XUdBySBqxtmnTSz4J4oeF/xdK9QNcpsgU1X/p3yY1Yp7925EEITX
 foLe6bImfWAZ0sDqsUJB5YJF3QU18RpI0j3VVcluzMe3K8bLXCF2YmQPltvM0ozcEwFL
 thWq8BjJ279S3zu9Tk5MRQgOI7f06Ecr5FiLXEsGwXprcZ4iqE3bIGfrlzLRXz9ABntx
 XIWgHauHvtRZjruQv8MvJhDxt4Iz87G3ZqX4tTub1ZqtEVC9stfs8jbALyMZumgDxSPJ
 9xAQ==
X-Gm-Message-State: AFqh2kofQjPiH4o8fswObmq45XRyznk6965M72Ku8MorQW1TdMkzw6YF
 Fo8EggM1efAkOE01f/DyHTVd9/T5LgFapG/P8JpqRw==
X-Received: by 2002:a17:903:2653:b0:189:cdc8:7261 with SMTP id
 je19-20020a170903265300b00189cdc87261mr3776628plb.168.1673027507504; Fri, 06
 Jan 2023 09:51:47 -0800 (PST)
MIME-Version: 1.0
References: <20230104220449.41337-1-philmd@linaro.org>
In-Reply-To: <20230104220449.41337-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2023 17:51:35 +0000
Message-ID: <CAFEAcA_sw=SdiKD4X3E1=AURS40NTv7zeLNfRTTP6zdLnr93rg@mail.gmail.com>
Subject: Re: [PATCH 00/20] hw: Remove implicit sysbus_mmio_map() from pflash
 APIs
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Song Gao <gaosong@loongson.cn>, 
 Antony Pavlov <antonynpavlov@gmail.com>, Jan Kiszka <jan.kiszka@web.de>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org, 
 Mark Burton <mburton@qti.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Damm <magnus.damm@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <eduardo@habkost.net>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Radoslaw Biernacki <rad@semihalf.com>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org, 
 Leif Lindholm <quic_llindhol@quicinc.com>, Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: VRzik4kUh2Tv

On Wed, 4 Jan 2023 at 22:04, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Paving the road toward heterogeneous QEMU, the limitations of
> having a single machine sysbus become more apparent.
>
> The sysbus_mmio_map() API forces the caller to map a sysbus
> device to an address on the system bus (system bus here is
> the root MemoryRegion returned by get_system_memory() ).
>
> This is not practical when each core has its own address
> space and group of cores have access to a part of the
> peripherals.
>
> Experimenting with the PFLASH devices. Here the fix is
> quite easy, we split the pflash_cfi_register() -- which
> does the implicit sysbus mapping -- into an explicit qdev
> pflash_cfi_create() followed by the sysbus_mmio_map() call.

pflash_cfi_register() is a legacy convenience function. If
you don't like the sysbus_mmio_map() it does then you can
create, configure, realize and map the device directly.
This is what hw/arm/virt.c does, for instance (it wants to
map the flash devices into either secure or non secure RAM).
(This also lets you embed the device struct into some other
struct if you want rather than using qdev_new(), though
we don't have any code that does that currently.)

thanks
-- PMM
