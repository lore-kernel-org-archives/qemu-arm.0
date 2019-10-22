Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5991088wrm;
        Tue, 22 Oct 2019 06:14:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzHwIgi/3IAFChp/Lg5jUGQbzJpiD/dq43FoC5HoTcR4mQRrh0ACa8E8dkXOgnTSrnIeKS8
X-Received: by 2002:a50:97af:: with SMTP id e44mr18146149edb.3.1571750078722;
        Tue, 22 Oct 2019 06:14:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571750078; cv=none;
        d=google.com; s=arc-20160816;
        b=jfhkL0zsRAaeN54J3aM41SNW7KvGSXu6pGkaCc3KC2cZfSIZvCobj7VEduFVeLo6pt
         DbypsdaMJKI1r+eMvdtp/uZ55SBfJOoYX+YBwjJKTFX4I56juJxwyW77vo8M1UmZluFh
         0njuCaVPxl8RG4++iwBG8zPaG1j/7m6PILMC9nRJYakENRZumBEzent4QLjvZC00vGCt
         wac86lW7yjlYDCSDO0DsapbF940uKL8LaITEF9qnp347IGzajLysPXU5Z+Idpcy5goG4
         8gegKIAQ+ZA06NklyUALNxKRA0405mtLHgtule+s0haYU0pY6YZHUpKgRsu9sB1FB6Vq
         +HVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=a1wBe3lyQqhBm3Tp9rzRkxx4ysHQSccZ1HHlopvQIzk=;
        b=qnkcGgV26JTwvxu5Q0I6C8AQ/7PpAft/BJrgSgG/t6b4l7WPjUK5CztXXxTA/eAOMb
         zhlxwfguQ06drAEYFlSWymmJsz/YcilcHDf1lULZkPBDZiLd8vzoKu63FSi7XTYFYhGr
         BLhMo2K94MpvFdsQ4o4sV1AUqTkHXs5VWJkj2EHBxNvRgmyxtWCEZE2kCvjEDDeLM6Dg
         KCd7batGakVXpZOu7S4Opyh+b+swvQRtGsUER4vih9HVqaChlJhSfqm1p5G9o5M9tluX
         3Hv12mKtSIyQGwhjMnY2UYuJNdpyghyOliD6CpkRFFW1qJzyb3AEP7v/li1P81wq1cOW
         5ncg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D9L6aHsp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kt5si10848730ejb.283.2019.10.22.06.14.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2019 06:14:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D9L6aHsp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMtzh-0006W3-OV
	for alex.bennee@linaro.org; Tue, 22 Oct 2019 09:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59880)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iMtrr-0005l8-8C
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 09:06:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iMtrq-00012r-24
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 09:06:31 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:33924)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iMtro-0000zh-QL
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 09:06:29 -0400
Received: by mail-io1-xd42.google.com with SMTP id q1so20324524ion.1
 for <qemu-devel@nongnu.org>; Tue, 22 Oct 2019 06:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=a1wBe3lyQqhBm3Tp9rzRkxx4ysHQSccZ1HHlopvQIzk=;
 b=D9L6aHspB6jWau/6264gkuHedDFsFVTJSw9C6UY1K4MeZl0fBET3ZFZr/+wDbfOTuV
 qCzmoP4bHYV3wyrnu4GcmqsYQF8hkC6eIF7X0NVQ9JKcGPSdGEgECQx3rdV430oNONh6
 wIxmDzVqFdNeJghLhadQFpnh39C9pm2SWd6QrWidhmAiQXFTuA3jpaXDOQs4xD4h6U69
 XDAqOrFCPUnPUo5b/tSxHD2nyhA+ryBIlBF/WXfQZM8jsuJCPNXxn2Vy2u/44k8a4H/F
 hmf56XeyIIW8MZbDjrjF3x4nW8m3IvVFG6eUNvWufz+l9FN7LfeziQNDPkx7D1jaYe+O
 CmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=a1wBe3lyQqhBm3Tp9rzRkxx4ysHQSccZ1HHlopvQIzk=;
 b=hJtfe8aPa+ZyPfKBBGaPbMf3i/WoH9j9aY3zluLBCviEoefWr2FaBk7DitxG6lMVGi
 ZEssWiwnVzR0EdXAJGghO3M4tHs9smJVTq+1tdaN0DmDFIqeDz48babIb/qki6zNETNv
 lfopawY71/AwjvcNwCjTip3+5+Ftlh098ge9QaT02R20NkDQVaNs7wyITmHOkzQNf3D3
 HBMNpzft9sfP3dlHGlRvfehys/J4xTAL1DyuNbSfE5sBhdcAX+4W0flAqJAsAMTbW7q3
 SREnZEtjX+Q9U08RKPQvULMhhrSiOewjrILuHErXrANTxstZvo7P/3q89AUbBxgMRbBX
 eybA==
X-Gm-Message-State: APjAAAWqZ0yqjyAGUad72yRxyW8qva8nXZyhU57XdiorxTOFqwXJVn2Z
 ArnOuyIxPcZTFb2XtTmiF9xfDodYmo9NeRh8l6dmeg==
X-Received: by 2002:a02:7f57:: with SMTP id r84mr3723672jac.69.1571749574568; 
 Tue, 22 Oct 2019 06:06:14 -0700 (PDT)
MIME-Version: 1.0
References: <20191021190653.9511-1-philmd@redhat.com>
In-Reply-To: <20191021190653.9511-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Oct 2019 14:06:02 +0100
Message-ID: <CAFEAcA-85Yd+qCFa8CoWayYsd9F9C+NmZksMnhx=dAsjt+BUjg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] hw/arm: Create the RAM in the board
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d42
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gHFs2SfE2Q2s

On Mon, 21 Oct 2019 at 20:07, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
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



Applied to target-arm.next, thanks.

-- PMM
