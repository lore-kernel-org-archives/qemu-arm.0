Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5446329wrp;
        Tue, 17 Sep 2019 09:18:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxnB0+c4z1cCwErWV6awWTPyGEWGKeZa/FyVNMp+juwU2PRMtrX6eTz5pLZUZ7ikFMFUAUU
X-Received: by 2002:a17:906:f6d1:: with SMTP id jo17mr5622049ejb.62.1568737128701;
        Tue, 17 Sep 2019 09:18:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568737128; cv=none;
        d=google.com; s=arc-20160816;
        b=0LeaJL1rztZjWuyeasMJ+MRCQ8ThqdiQoajqBZqwtoY2G9nzlZ/1DmsGK4XRaB1yfZ
         mfW+cCejMjWDe8b0PZ6oVNGpRtweV9EmUn6He/Zndxx2uyUQ3mJVGC8lxJqE8c/EPP7c
         STsbz1FfSJuBW+Gcs9xDKB8RkGQfY4WAt3Xi0WRqQiXUaNRKCMNWcFNwoGkYRP6m4R9N
         PDBmEvs0U83wckEvt3CCPRvQC1ewC+Ewe8Fy/CDjtqWYlfbi2spUdQ6zQOx85HTXM/Nr
         bSFvhAjOVlQNme0Qe9yB1VohqM9ivBdLCHJYBhC+e9+NK/rgIh0g6MJpPb1+AxARPDqq
         KZBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qpCzVRqb9nXEM2nZ6DrUWx1jmVVCaKL+KBof0X1p4xM=;
        b=UlkMMVEQKZKUDkjWfWHrqFCUXvz2FOd3bcDo3dULKUqRawGOwqo9hHJQ+LZEMZhzbf
         B7jY37PpWLEvNbGa67JiVdvStQYShkocwoqn/9JI+SUJ0i7G3Z2HaMcadrvYsVPnt/9U
         tDwWHgBmIOBEsKLznlB1ioCEsgBV5m1vLQgTUGF3G5eFjLCNy5+LO8mQaXaWyovkTHMQ
         n9wIt61GYvNaT+sPbFaj7faTmhAZ503JxGI/GKdHQKqgGKfrbpAJi7YrzB1FBaE2JcXb
         CQPG6cypoz0ajU/2Fu2YpfsGtAh7oKPS27/oH5VWS9lGtFsbtQoElmHNtwmrJc1D8LTa
         rY6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yHKyFVLX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d24si1840971ede.119.2019.09.17.09.18.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 09:18:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yHKyFVLX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAGBj-0006mP-BC
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 12:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42997)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iAGA5-0005Uk-Ef
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 12:17:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iAGA4-0001r0-6I
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 12:17:05 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:43840)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iAGA3-0001qt-Vs
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 12:17:04 -0400
Received: by mail-oi1-x230.google.com with SMTP id t84so3341448oih.10
 for <qemu-arm@nongnu.org>; Tue, 17 Sep 2019 09:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qpCzVRqb9nXEM2nZ6DrUWx1jmVVCaKL+KBof0X1p4xM=;
 b=yHKyFVLXssbinhTkKMTijP7JXZ7jiLbttcVYdFv7WnzJyA3nnLSwlXriUpX9KJUZ02
 94ysKZIGVO7e/+klBXYf6BxlSZ2VVcco2qOy92k2SczMofoNweb4TJr2FVlKOLVRQCjE
 UL1bBHQGAiogGT/T+JyV81/hhY+jpS+rhz2ryavo6aTMnYTn1kkR61eSen5Edcq2CbV0
 4UsNsg+07/SyUOh6Vik8W+h68PNwm15J5xnu7dnc4wuVOjfAC2tu2/6WaWDWcangmmKG
 GXO5iCyeDSROY8kFXauj083xQOFhtj0YF4yeHG9UsnBz0EGm7OXcnS88fT4eXHmOENO/
 VwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qpCzVRqb9nXEM2nZ6DrUWx1jmVVCaKL+KBof0X1p4xM=;
 b=ECaMeau1oknDcRgKF09zHRBrCkDaBiipJ+ehtyfb1NGw7De9yvsQJBdF7kT0GYQCgy
 eY2OPZm64p2PJG/eTU/7qzEYW1NDmyFAhfLqq2Wp88Dfy/w8ySMUU6b8wjVT/0NcmQ+Y
 OBBldXXPJB74sgxH9dWPYcuNDTXAs+BetBlU+4tPozq0Bhvp/HykXXqIuMh3oL7/JOr+
 tBST3gTLAWUoGF2f6nqdhjKvmV1QznHdobvJVcPU4oSuePhvINmr9FXi5RnYrWqNY5kX
 JjovLdm62/VP3VMhjXFt+mrdVc0gjhtvF3t+m5vk3JP2vHquUpao46fcyo4O5aD81XTL
 KB+Q==
X-Gm-Message-State: APjAAAXDW3Ku25p0VkcJAIWpKKPE/t+BGUyja6WqvqqoAsKcrAGclE8f
 j55xX4d+UyPFfhcfLkeJCTVkET8xcS/919vgFSX/YcNC6jY=
X-Received: by 2002:aca:50d8:: with SMTP id e207mr4197515oib.48.1568737023179; 
 Tue, 17 Sep 2019 09:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <f2c90efa-1412-9c41-ba76-ebad90745f4d@linux.microsoft.com>
 <CAFEAcA9S7Kj5sJVM0Ot6KKpe9z3BfQWyZwUv-Vx_+g5sRbxqmA@mail.gmail.com>
 <8655a3d4-0fcf-1012-5a65-16355651a901@linux.microsoft.com>
In-Reply-To: <8655a3d4-0fcf-1012-5a65-16355651a901@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Sep 2019 17:16:52 +0100
Message-ID: <CAFEAcA_+=LvX5-Wiz6roemra9b2jJ4UaRt-fGgA+v_DSgj6dBg@mail.gmail.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::230
Subject: Re: [Qemu-arm] Adding /dev/tpm0 to qemu-system-aarch64
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5YxL7BHM8Lbi

On Tue, 17 Sep 2019 at 17:04, Lakshmi Ramasubramanian
<nramas@linux.microsoft.com> wrote:
> The TPM I am emulating is implemented in firmware (fTPM) that runs in
> the Trust Zone (emulated in QEMU). There is a kernel module that handles
> this fTPM.
>
> If I add the following entry in the Device Tree that QEMU passes to the
> boot loader, the fTPM kernel module will load and it should be able to
> talk to the firmware device.
>
>         tpm@0 {
>             compatible = "myorg,ftpm"
>         };
>
> How do I add such a custom entry in the device tree in QEMU?

If you're running a UEFI blob within QEMU that runs at EL3
and provides this TPM, then it's the responsibility of that UEFI
blob to provide device tree or ACPI tables to the guest which
describe devices which the UEFI blob is providing. QEMU shouldn't
describe them in the device tree it passes to UEFI, because
QEMU doesn't implement them.

thanks
-- PMM
