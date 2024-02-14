Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp651734eje;
        Wed, 14 Feb 2024 00:56:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW9s/7ZY/KWCAgidfTmmIjIsiHhLJVXYMPRC+hnwXrw6xVtlZPTIe286b4AXIcNIdE5BRm3PSSQ8P7nXYjRrGcYbuPFYStB
X-Google-Smtp-Source: AGHT+IGUu5Tpq7cI9z+cCDBqtnk0dvaab+8C83iqZBdylY36QjMPgYzVW7WSQt6ZyL3+jtevov2f
X-Received: by 2002:a05:6214:130a:b0:68c:ba1b:e495 with SMTP id pn10-20020a056214130a00b0068cba1be495mr2645993qvb.43.1707900974531;
        Wed, 14 Feb 2024 00:56:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707900974; cv=none;
        d=google.com; s=arc-20160816;
        b=W2sdZ3NcVtEX3H6Je9zRHY3DTJDq84U2GjxuHRdt03QjBzxO0nsP7hVK1rEOUykGSE
         PaIvfUjFGGKKF+mDFmg8AI2nUvq7aDbuVM/+miX/ZCCiVJtmPpYifnwvDq7kyz0D6ha9
         qpg82cbElrEgUtazpq/yIHLqrSqzkwoLaw62yDix/y5861hDCD6BZ5u35krDIIVeUSLu
         8yHaUl/ysxeW8CWHYmHwBdPKeo0E7jyfvAwniV6TWa7hlZsKCOQqQu6iNUWSVrtjIWSL
         YwKpIXAW1lgIokbo8QRHtEPAydiMO6QsN8yrMLKhK5G+J8t6srfOG8Hay8LCexLvjODD
         bk6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=lZ7eMPPqvFTCxlHHkNE4XCNcUtRm+ZuyIAioeF4xV44=;
        fh=A3sJlXjDbaGUX5X1fjI5EZ/GBicJ6Hn22L5KQZwgFgk=;
        b=OFU7nm4M5cRO95ufnRzOl5kkee8+G+lDOMnHEaY0Dw3P0V/rjqiENhF54K2ZnbkU8z
         38/T4HA8zdlmgB7LwIR/PbF7tOHwftRnXzsffhLwAZCaq+5hGGRKM7yZFWPSJq9svw5g
         Z20h0wMLnszIJzOHiIJ2yJyE3B3bQ5OuW7q4bR0xc7AwWdkID01fWq4sHiQyxZmOQk45
         IrZUuXA3hCZzebrmw8tNmTHKT6CvSbhIXRhe/pTNr4mf80nwuAFnsgyz1bOVv6j9e4AC
         4x8ciE7GvjX3LN+IAkljQL0+gvCZc9EZ2w0EuYK578dxm9XIhxCG/VGgkcgm0uVlwGg4
         Yz9Q==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Ix48GOZn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
X-Forwarded-Encrypted: i=1; AJvYcCWbzOdErvZPgT5S3WfwiZiYaxexR5J0/LzYoQ9EULPW/3ItnsF9uZPC8YMJ2A9De+CQ0XnBoayWYLZlR1BQ3ca3w34bSEVe
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12-20020ad45c6c000000b0068cd943bc70si5222430qvh.199.2024.02.14.00.56.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Feb 2024 00:56:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Ix48GOZn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1raB3n-0007cZ-Jk; Wed, 14 Feb 2024 03:56:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1raB3l-0007bg-MS; Wed, 14 Feb 2024 03:56:05 -0500
Received: from sin.source.kernel.org ([145.40.73.55])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1raB3g-0007ut-VL; Wed, 14 Feb 2024 03:56:05 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3F737CE1C6E;
 Wed, 14 Feb 2024 08:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C7BC433C7;
 Wed, 14 Feb 2024 08:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707900948;
 bh=dIEMdbt4uVH+SLcKL2HAfT6xds6Yg5ZGi16KuJ+Ap8c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ix48GOZnRUmmE4lVcPA3k4gNd4WJlJEhRt+G0TYvbqkmKZfINf138KKyTzSyQ5G9O
 qaIB9G2dzT9FylNpw+ab+WO4VQjWWMBEAzi2tXeje1sQ4eme3C6ebzKSSiyGhgrAZy
 8iP49dTxgQ1LhxSUhDib7wBhQ390NnelfxzVCB5wd8JhIVY5W1Y+qZAKLI5m/S2up/
 0xTDP5dqUiIJiKee6UiejWp+VeJJd3YRpS4yirFCUA52/d3O4Z2pNZTMNXbEMDPlXk
 zc41O9H6wsvXAsksRjBqfZL8MYRzw4WvF2bHgR9eXr0ednGYAHxK0CP/wt6gLzbSvc
 C+JU5QKN+ZhJA==
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-51182f8590bso4485560e87.0; 
 Wed, 14 Feb 2024 00:55:48 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWPWt/+13Wj9jFFPuiPtFHEFaziyUkoOZLCaeD+7l8wpEZmgKEFayFldtClpSNdGRN9u6lEx1s5H9W1s2FnxXz5DdDUvng=
X-Gm-Message-State: AOJu0YzCgDB/0nRVGe51GDPXTvtAyAFsbDuc316fCaCvC201Vvb0PYeH
 XZxMFR7xNwzxcqWBG3WWLSZ+I0RJWUm+c4hYz7tAM5vejONQwZGFYPqAObSOQke1k5e7UM7s4fz
 vSCjeW2z5OqxUKTWEkHd+SUkxLNk=
X-Received: by 2002:a05:6512:1590:b0:511:a206:8fee with SMTP id
 bp16-20020a056512159000b00511a2068feemr1676763lfb.64.1707900946712; Wed, 14
 Feb 2024 00:55:46 -0800 (PST)
MIME-Version: 1.0
References: <20240122143537.233498-1-peter.maydell@linaro.org>
In-Reply-To: <20240122143537.233498-1-peter.maydell@linaro.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 14 Feb 2024 09:55:35 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHTcYB0K7f7S6F3SqSye3XAJemTt6qAb8cgmcThYshrWA@mail.gmail.com>
Message-ID: <CAMj1kXHTcYB0K7f7S6F3SqSye3XAJemTt6qAb8cgmcThYshrWA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] virt: wire up NS EL2 virtual timer IRQ
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Leif Lindholm <quic_llindhol@quicinc.com>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=145.40.73.55; envelope-from=ardb@kernel.org;
 helo=sin.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: CSZdxyeFRy/C

On Mon, 22 Jan 2024 at 15:35, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset wires up the NS EL2 virtual timer IRQ on the virt
> board, similarly to what commit 058262e0a8b2 did for the sbsa-ref board.
>
> Version 1 was an RFC patchset, originally sent back in autumn:
> https://patchew.org/QEMU/20230919101240.2569334-1-peter.maydell@linaro.org/
> The main reason for it being an RFC is that the change, while correct,
> triggers a bug in EDK2 guest firmware that makes EDK2 assert on bootup.
> Since the RFC, we've upgraded our in-tree version of the EDK2 binaries
> to a version that has the fix for that bug, so I think the QEMU side of
> these patches is ready to go in now.
>
> To accommodate users who might still be using older EDK2 binaries,
> we only expose the IRQ in the DTB and ACPI tables for virt-9.0 and
> later machine types.
>
> If you see in the guest:
>      ASSERT [ArmTimerDxe] /home/kraxel/projects/qemu/roms/edk2/ArmVirtPkg/Library/ArmVirtTimerFdtClientLib/ArmVirtTimerFdtClientLib.c(72): PropSize == 36 || PropSize == 48
>
> then your options are:
>  * update your EDK2 binaries to edk2-stable202311 or newer
>  * use the 'virt-8.2' versioned machine type
>  * not use 'virtualization=on'
>
> I'll put something about this into the release notes when this
> goes into git. (There are other reasons why you probably want a
> newer EDK2 for AArch64 guests, so this is worth flagging up to our
> downstream distros who don't take our pre-built firmware binaries.)
>
> changes v1->v2:
>  * the change in DTB and ACPI tables is now tied to the machine version
>  * handle change of the ARCH_TIMER_*_IRQ values from PPI numbers to INTIDs
>  * bump the FADT header to indicate ACPI v6.3, since we might be using
>    a 6.3 feature in the GTDT
>  * the avocado tests now all pass, because we have updated our copy
>    of EDK2 in pc-bios/ to a version which has the fix for the bug
>    which would otherwise cause it to assert on bootup
>  * patch 2 commit message improved to give details of the EDK2 assert and
>    state the options for dealing with it (this will also go into the
>    QEMU release notes)
>
> thanks
> -- PMM
>
> Peter Maydell (3):
>   tests/qtest/bios-tables-test: Allow changes to virt GTDT
>   hw/arm/virt: Wire up non-secure EL2 virtual timer IRQ
>   tests/qtest/bios-tables-tests: Update virt golden reference
>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
