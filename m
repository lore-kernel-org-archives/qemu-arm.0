Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2750873wru;
        Mon, 1 Jul 2019 08:07:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzWbDrppJeT6+Edyd0iFQ1yGbaLSTSQfQ+PdYy/+j7+sF44RRwwecHd12Jr4cUv/FHhxTGY
X-Received: by 2002:a17:906:1845:: with SMTP id w5mr24013403eje.0.1561993662660;
        Mon, 01 Jul 2019 08:07:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561993662; cv=none;
        d=google.com; s=arc-20160816;
        b=NdwqoZ3S7s3fXbsvQLvnZoEhXsOPVoQVum3LM9S51UOnxBp2TI3uTwtH3uNY8gYbto
         HRFEwOkjqKLwH7fZRTUzCpjA2iyGOpHl93J8OqRJ5mbZtyi0z91pTwtR4s86rdtPtGPb
         L2QP9jkJIOY+cN3GhmTsHfqsnINQECzGXf8vUUE1/FDtgPf0O6kvTv7fKz3nYUjYWElD
         XQiz2s8TnE285mVxTk+QvqwDrOtrQheCAR1aCV5WJBPF9J0J78jlEVFp04OqP+yVC5Ym
         KHuqgrlGzcHoHVvVnJH8VTgLTWPiMPtzAfIkNdV0jghpd0Zc2keKAS++U77JHcemQnZB
         mc7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bT/L3E9J3H7vjr92bp5OMJgMLvn8Ud0Rw7GtNyrTxtk=;
        b=ZqNgLi9FHorRe+na90zcxvbzEid1kGGmChsfyKreYsngHAu5mWEQZXkdW7CAJ20aLp
         wc9DhVaLy+SE24yX6UsWzXcFhX4BhwVaA0YP6A45z3nol8EgwBKNscJ6ZOkFPxGa0uvd
         hQ5TRwKq3DPdF0VWQSAQGPD/2lMvWf4VY5EOnbAoJMhZt+o32vcq67OOOBPElDeAzV4L
         I/kWbEL6GcjxwOwjIBsDk4FEHcD2QIRDTy7jbgac3pfC76y7VaLruzyzHvlnNV3SYN9T
         2pxFt6CCCeXnwKr2NmcI+FJ54SL3y9TOGSsWW+8ktkxqfa0Hnk3EaSsfyJLHM/2FtcY8
         4ZSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DvH2Ifhc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x22si7859902eju.379.2019.07.01.08.07.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 08:07:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DvH2Ifhc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhxu9-0006J2-Nf
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 11:07:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32965)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hhxhY-00070E-H9
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 10:54:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hhxhW-0003TV-Ja
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 10:54:40 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:46444)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hhxhW-0003P5-EP
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 10:54:38 -0400
Received: by mail-oi1-x241.google.com with SMTP id 65so10153514oid.13
 for <qemu-arm@nongnu.org>; Mon, 01 Jul 2019 07:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bT/L3E9J3H7vjr92bp5OMJgMLvn8Ud0Rw7GtNyrTxtk=;
 b=DvH2IfhcSYN2o1qB1/f3zI10cVdiSkycOv0AevZdJyBuihIIHG+H+bOlXGAOM7gjFy
 ZWZiHo1dQS8Qyn9+3nLR0lDi8k2JcBfK67TeCu2q4vYR2F6uk1wm4w3OFKW9eIQuyQla
 qLePYpUlREKb0vcbeZLqQW89MH2iw0VHXDLeg6SGiHU+d6knsz/wGoWVTs+1ce/rUUET
 coc/p7/0B8ovbauNm4DvV2adRd5CRDg/NoW/Gua+cnCHEx2MgTEFoL7XXT98pnIWESH5
 Ad9/sw8div+NzKMJsu47+E6yuhX5lhTIIehXsp6mNfS45pRHryrYY0TBz0vcKuNXxBGm
 lTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bT/L3E9J3H7vjr92bp5OMJgMLvn8Ud0Rw7GtNyrTxtk=;
 b=TgYpLmw82UHFbTFQdDMBEgdL6KSUlWLey/IgmJj8YlgRkws1WgJDoindntAJzBEnUk
 f06/diPDN00vPS02yFzoBiYVx7bngmgOUGN5Ro7dZCghjABWSoctqBJcL/acNgeLABp/
 Yc9sogN2Nsk7RMi2wNU/Zh2MQ5xNNSYzaTvDMWDZwGibrU8P95ylA+8PKI9FTy7Gkjmj
 hMw/ayXiGBxZxLPrd6AHQCnlJ07B++E7vEcK0wUSVp3ME2fii0Uh1hY9ZIAETrEZR9vT
 W1WFo2aFaWDvRY9Oc6Qpcwzr70nFbfPgkRZmvfdtsIPlkHrMazwQSIM9Ax11oBAvQLUD
 HW/g==
X-Gm-Message-State: APjAAAWYifQYRqhr8YkhbNa8k0e6+D99wE3cXxRy8AuZvo+gpjcccq7O
 oXI/j8VbvZ+8F5Gfxh2xPShdqtayny4c8NvO5pdwKQ==
X-Received: by 2002:a05:6808:d4:: with SMTP id
 t20mr7205800oic.170.1561992874882; 
 Mon, 01 Jul 2019 07:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <1561890034-15921-1-git-send-email-hongbo.zhang@linaro.org>
In-Reply-To: <1561890034-15921-1-git-send-email-hongbo.zhang@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 15:54:24 +0100
Message-ID: <CAFEAcA8P-=mbQ4__9OXB078GnrGfm9afH1YBDLkv88mUXmm=PQ@mail.gmail.com>
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH v9 0/2] Add Arm SBSA Reference Machine
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Leif Lindholm <leif.lindholm@linaro.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zHwTrNATQagM

On Sun, 30 Jun 2019 at 11:21, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>
> For the Aarch64, there is one machine 'virt', it is primarily meant to
> run on KVM and execute virtualization workloads, but we need an
> environment as faithful as possible to physical hardware,  to support
> firmware and OS development for pysical Aarch64 machines.
>
> This machine comes with:
>  - Re-designed memory map.
>  - CPU cortex-a57.
>  - EL2 and EL3 enabled.
>  - GIC version 3.
>  - System bus AHCI controller.
>  - System bus XHCI controller.
>  - CDROM and hard disc on AHCI bus.
>  - E1000E ethernet card on PCIE bus.
>  - VGA display adaptor on PCIE bus.
>  - Only minimal device tree nodes.
> And without:
>  - virtio deivces.
>  - fw_cfg device.
>  - ACPI tables.

I've pointed out a number of issues with these patches, but they
all turn out to be very minor (mostly fixable by moving code between
patch 1 and 2). The other thing we need is a MAINTAINERS section for
the new board:

diff --git a/MAINTAINERS b/MAINTAINERS
index cad58b94879..0bf3739f06a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -728,6 +728,13 @@ F: include/hw/arm/fsl-imx6.h
 F: include/hw/misc/imx6_*.h
 F: include/hw/ssi/imx_spi.h

+SBSA-REF
+M: Hongbo Zhang <hongbo.zhang@linaro.org>
+M: Peter Maydell <peter.maydell@linaro.org>
+L: qemu-arm@nongnu.org
+S: Maintained
+F: hw/arm/sbsa-ref.c
+
 Sharp SL-5500 (Collie) PDA
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org


So rather than making you do another respin, I'm planning to
make the fixes in my target-arm.next tree as I apply the patches.
That way we can get this in before softfreeze (which is tomorrow).

thanks
-- PMM
