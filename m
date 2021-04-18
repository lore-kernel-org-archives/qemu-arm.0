Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp351311lfb;
        Sun, 18 Apr 2021 05:49:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx09aoZnYD6XXIGICQ2zzvWuXcqnqwKFc8oJgkJ70xlBksW4CsN/N5bKU1bA6szTSc2WBAM
X-Received: by 2002:a05:6e02:20c1:: with SMTP id 1mr13413532ilq.71.1618750181252;
        Sun, 18 Apr 2021 05:49:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618750181; cv=none;
        d=google.com; s=arc-20160816;
        b=Vrr+PGtNiZf3d2a1wDviigdBGM3HocMxpZtlojWPCSLtUOxsXayd1/zZBhj3DHmqlP
         GKgqWiSa3k7N/k294vg3oud1JewVfRZMpkTl26UIhN6DaA50JOB1bSJDIEXhH2lcRWhT
         KkODaMLm3ZLWZDOCSPCkGXrekoLiOgmutXzSn7sTKm0lCkiWDEmHNvmZr0dSOMXnMAa1
         KCx9pib809iyGw54w1JwLje4d3+LjHhLXbpsyyGAonvfubkS/fENmxeaHmOqLxqrfX1P
         VBDRbep6X7I2lXm+KbFmGPSrKZv8FeC3eLrG+nQfCxlenCtuf53HgR/27A428ovhFqp2
         DNow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DEk9ZG6syBTFiBeh26n44EzJi2vmedTTeBxW1EDfvLM=;
        b=i45suLvyySvZ8SRYFVkTYnseOuNkyf8v8gUl0HnJui0N86FHs56OUTlH+wRTCVLeOC
         bV5uWrlKBA8ChvSLfNSkPmWb21RC43e2ktIKOGvJ2v9KU+X1U4Z4aXLb2b7r38XDDbsE
         KBrHx0VDgoUy1bx8Z7HOa3R2MZdaudvHVhPD4/qYw9JWl4BiHL1f4wmhJdSjdiAfSoN5
         4U3L59uQcDtTIeIlgWkh3ql0QCG+Tg1i6X8gRbMhd8K0jPSWJOVpYZb3s01f6o0W8Iqe
         7gyk1rtEQX0sS3XzRiaqR0ghubCt7L39LszOhGFPPyCdQjDgVi6VZQSsuz3UZuZYK+OH
         Ah2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pZKqFDGJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9si12054248jap.88.2021.04.18.05.49.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Apr 2021 05:49:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pZKqFDGJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lY6rs-0004z7-K1
	for alex.bennee@linaro.org; Sun, 18 Apr 2021 08:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lY6rl-0004z0-Q4
 for qemu-arm@nongnu.org; Sun, 18 Apr 2021 08:49:33 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:33635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lY6rj-0005Y7-Tb
 for qemu-arm@nongnu.org; Sun, 18 Apr 2021 08:49:33 -0400
Received: by mail-ed1-x530.google.com with SMTP id w18so37539019edc.0
 for <qemu-arm@nongnu.org>; Sun, 18 Apr 2021 05:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DEk9ZG6syBTFiBeh26n44EzJi2vmedTTeBxW1EDfvLM=;
 b=pZKqFDGJU1X4HWn8R0J9fXjixji7VLO7aL6n+avNvua6gEFsf4pDhOigwi1QgZdlAI
 aCaZkv1kpqtHlEtJgDxuTIwXEoIpC11k7PKdmxnSE24cMB2N7RFtw/WDu54Kd1R88tlD
 USIMWtq2Zhlj6sYXHANo6E+z8lbfUh1j2LIOl6oALx0TyiFhINQrobWJW973q7GRBtUB
 qMxQIjxBshPX09f23P8QSzMWSnqnyMC1e0x5OsXa6LDMN8FKbnaqrllKnHVv6NXafENp
 iu0/iC+IK3POfL1MIB0D8u4PIvz96FlaywxRdcVKDiIXjATSL14s/6pIXb4GEkNe2jfj
 X3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DEk9ZG6syBTFiBeh26n44EzJi2vmedTTeBxW1EDfvLM=;
 b=igzDdPmI5oat5zE9Z23r3Br7FFvVncvthwzYTG5Wp4xDqy/ATjeRbbUIZyAog3vXul
 yDdxkaiNx1uZN3aSO9B9vjMiyHjd6iYjegxgiaj7wG9koSQrf9BBRpZT27EoDXkmkFnj
 E8iGspxixXBaFRaEatEABpEKFe1VJ+p9xmDxQapGMs5dvl0rrCTvqGn8behetD3MqyHH
 4zVVIpjKDIVl2dApFjtKLl7nFzqG18l+QhwSvbQqykHD0AKBN0jyfOfIcDuu+leuQXN5
 BJ1SkMDqfSnT3GennipY04aBp5A4/5KJ0xjfCPDsB/qbjsOv32HbqDEapI0AnyPIK46z
 hLPg==
X-Gm-Message-State: AOAM531ImRJ2UAv6paHN23q134+aOUWRnry6YEXPnjvf4cA0F+eM5F3F
 Y3fDcMUYjmO3QYjrFcB3iLl1VPp6FjAo/BA1k2d3MEpFO/b2MQ==
X-Received: by 2002:a05:6402:51d0:: with SMTP id
 r16mr16823481edd.52.1618750170244; 
 Sun, 18 Apr 2021 05:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <b5aa5292-5088-fb31-24b4-c8fc202413fd@freyder.net>
In-Reply-To: <b5aa5292-5088-fb31-24b4-c8fc202413fd@freyder.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 18 Apr 2021 13:48:40 +0100
Message-ID: <CAFEAcA_cm2diBGVwLvXGrSLb5ATXN++sbGQWcQ8wknDjtUiVhA@mail.gmail.com>
Subject: Re: Emulation of armv7+e1000e+/dev/sda or /dev/mmcblk0 devices
To: steve freyder <steve@freyder.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-arm list <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8Ad2Iz6XWs7r

On Sun, 18 Apr 2021 at 02:42, steve freyder <steve@freyder.net> wrote:
> I'm a new qemu-arm list member and looking to get an emulation of an
> armv7 processor with a PCI bus, supporting an e1000e NIC, and some form
> of storage device preferably SATA and [e]MMC - I have an iMX6 SOM custom
> board with an e1000e on the carrier board via PCI that I'm attempting to
> approximate.  I want to boot U-Boot (I've built U-Boot 5.2 with support
> for MMC, SATA, and e100e networking).  I have the "virt" machine able to
> boot U-Boot and see the e1000e, but I have found nothing that allows the
> booted U-Boot see any MMC or SATA devices.  All attempts to use -sd, or
> -drive to create some kind of MMC/SATA device have failed with what
> appear to be (as I have been able to understand) the standard reasons,
> missing busses, missing properties, etc, etc. A majority of searches
> result in documentation from developers that's 5-10 or more years old,
> so I'm hard-pressed to determine whether this is my own lack of
> knowledge (probably YES), or whether I'm simply looking at stuff that's
> been overcome by events.

You have a couple of options:
 (1) if one of the existing iMX6 board models (like sabrelite)
     has enough of the devices that you need, you could use that
 (2) you could use the 'virt' board. You don't say what command line
     you've been trying, but it sounds to me like the problem is that
     you aren't passing the command line options to either:
      * use a virtio blk device (this is usually good if you just want
        "some kind of disk storage"; u-boot should support virtio-blk
        over pci, but I don't know if it's compiled in by default)
      * provide a PCI emulation of some kind of disk controller
        (eg scsi, ahci) as well as an emulation of the disk itself.
Using a -drive option alone is sort of like asking to emulate "a board,
and a disk drive on the table next to it, but not actually plugged into
anything" :-)

The upstream 'u-boot' has support for a qemu-arm board type which
is documented to work on the 'virt' board and to support SATA disks
via AHCI, including the command line options to set that up:

https://github.com/u-boot/u-boot/blob/4f48163201f991de6d4a31b1c98a79e19971f57f/doc/board/emulation/qemu-arm.rst

Have you tried those? If they don't work, what is the error that
QEMU reports?

thanks
-- PMM
