Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp232144ejb;
        Thu, 1 Feb 2024 05:34:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEz9Bp1lpV67ezY+B+txnij8mJg99LiA2VW6LOthFtW7ZPGK6/YTqumnDp5vexm6DbGRWJ
X-Received: by 2002:a05:620a:2405:b0:783:8b27:46f with SMTP id d5-20020a05620a240500b007838b27046fmr3224738qkn.31.1706794456533;
        Thu, 01 Feb 2024 05:34:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706794456; cv=none;
        d=google.com; s=arc-20160816;
        b=L0ir1hJlcOWlF7e/GAgk2KR6UdnQ9HQ+abxzK7GmpzAEY3cRgfRVAbCIHk8O3i059L
         4HxqM6A9/WXiV53FrmRrpUma+9tdV1NffoUKd81pwhBex5O9M97sI4139ecSNZlVNuDq
         Iu4VEJAmI2WS36KItGa6Tnm602T6VnvrPbjccYH0CdKV31hS3lkDrmpIUjebs2/wOYp0
         bKUIVwAvu1qZH7TD4BD3oFEvU0aRlrDCbdoIaqww/Z8S2cBvNyudXKOxx7e/LF3jye2W
         +8jdUY6XhpRZVCwPfXndprziIjK56ntKU9iN4AxRCm8H9yk2yy4844ix1N241uyftnLE
         XSUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=io87DHhBMjJIuCrn/6iiYfrsoMeo6aQOZ9fSI+L5OJg=;
        fh=KBl6++/saq2hXVZb9+9+Mi9MUdOnPSamjdtwtOW5Kg4=;
        b=YZNODRs06cb6AthGJ72dSwRAQPoeYhL9eWCeDjWpZH9iG/VXypnbhyGZr1MqGuEb+J
         Cg1n0fOY/F9D+8LwkqVyEIZBgJ36vzChTUZg6aYWiDR1qmfTWgWDykbLBzRcZXuchgpc
         uuRWCxpxVnMCm41MY8IAzFUoegcYuQd/ZiocdFy1yvZO2UngO44FU7DYMGeGW7pqLG2k
         4wDzttsgfZAvKq/p4D4Htsg1SpFXaahZEhEevHRA6YeocxvL6TVN3u+9bX+mBCQGaiwz
         6EstDxT7zBU8oJSEnMB2uaxRxe88zc7tmcgFk189TRYdDMlnEWBZ90vb4NEUT1gs7iKH
         +jXQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kPWAHYWK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCVpQamI/IvdqJEwv2LyqJMi6OGb3mUJM/3SIwyp7nCt/dttj2Zp4oPc3pjuDwZmFwRId2GlTE751OpkdgVrGQbSFZAx4idi
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e7-20020ac84e47000000b0042a519d4a5csi13894647qtw.530.2024.02.01.05.34.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 05:34:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kPWAHYWK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rVXCh-0001wE-S7; Thu, 01 Feb 2024 08:34:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVXCg-0001v4-17
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 08:34:06 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVXCe-0007Tx-8y
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 08:34:05 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so1262390a12.0
 for <qemu-arm@nongnu.org>; Thu, 01 Feb 2024 05:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706794443; x=1707399243; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=io87DHhBMjJIuCrn/6iiYfrsoMeo6aQOZ9fSI+L5OJg=;
 b=kPWAHYWKO4EI70yaTPybqSh2mCcSioKnGI6jT++nr9xwMUfr2/AaYmiRa26vV7NzRn
 NG1bc6zPv3A0YflnyYej+/kp+epOMcOkQBIf0ipADh6TrH5+iNIM+rGtZK5eMl6VqRcP
 kx18bVSMH5Or3BxWPW7qh7SwlY18FqopDw1QbWzG5GFmyHcA4KfIxpteHp7sEOe+fo/1
 A9Cb3H1CRUJmxcqt9II49mJIbT+IpK+6sDMaukGNsGUyX1HZA0BS/uv31aO0jU12609J
 83wScOjkshB5JopuyaGTuO9nUtFz+3XhteO8Rj4e7cIJBVElFoJJUGy7UE3VwsRwbQiE
 /5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706794443; x=1707399243;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=io87DHhBMjJIuCrn/6iiYfrsoMeo6aQOZ9fSI+L5OJg=;
 b=LjTL4vfuCLzaRyHMTrs7NGnkXtj2xWrk+brPXux98EoVvnk0Fc2ezWWCE3u8E2/v9J
 ueJw0jUtT9pssJfGpVsdBX6Bksbr5N6vjAr98fY3WxKb4ln+CJz4zl0vdG4z3zdy89C/
 pSsqXuEpYEJWBLdZ2YHuo3zbkDFhxMERtZKokWNFMWRmdB0QpZpE/yXzY4EFuE+CZAW1
 YrOABbAL5JfXHyZmocK2lTqhyWT2Z7cMz2T7PtuNyfm7vr+eUbYp4anr6NBoW4iscRTX
 LWpEeHSJpoOID+vaMdc7C7TrdOEvGeGiQSNrcKT1LIeZgsHzrLSt4fkgNSa/IrAJj+S4
 N4TA==
X-Gm-Message-State: AOJu0YwT1Z0HdT+ODXzXlak5fTHTnP2AL/YytYQB7usnKYVHRfZPyXbe
 +Cd6/pYI+kC4yYTrJ03iE6GURx1KzKNrb5N5jA/2M+9EIBnIE2hhAcGirf7NAOWqZNi2FRBmj9/
 jl2S+PBs+KMFije7Wicle7sA9Y1PCDN6L0n2JeomzjgRxsPa8
X-Received: by 2002:a50:ee19:0:b0:55f:d5a0:749b with SMTP id
 g25-20020a50ee19000000b0055fd5a0749bmr261166eds.39.1706794442744; Thu, 01 Feb
 2024 05:34:02 -0800 (PST)
MIME-Version: 1.0
References: <20240122143537.233498-1-peter.maydell@linaro.org>
In-Reply-To: <20240122143537.233498-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Feb 2024 13:33:51 +0000
Message-ID: <CAFEAcA_xH=fRR2iTr9+RgiA6n51FCakCsk60z=Mr6XmaujbebQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] virt: wire up NS EL2 virtual timer IRQ
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Leif Lindholm <quic_llindhol@quicinc.com>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>, 
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: Qk4nRhhc3tIK

Ping for code review, please?

thanks
-- PMM

On Mon, 22 Jan 2024 at 14:35, Peter Maydell <peter.maydell@linaro.org> wrote:
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
>  include/hw/arm/virt.h     |   2 ++
>  hw/arm/virt-acpi-build.c  |  20 +++++++++----
>  hw/arm/virt.c             |  60 ++++++++++++++++++++++++++++++++------
>  tests/data/acpi/virt/FACP | Bin 276 -> 276 bytes
>  tests/data/acpi/virt/GTDT | Bin 96 -> 104 bytes
>  5 files changed, 67 insertions(+), 15 deletions(-)
>
