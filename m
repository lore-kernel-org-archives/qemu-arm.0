Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10815642wrv;
        Thu, 25 Jul 2019 09:15:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyLBlSob8/OiCjz3+U/QcZ6sQsrr8YbEDH75Y5XOBP015qiHp5yGSJi88dBDHK5o9KXNv6j
X-Received: by 2002:a17:906:8313:: with SMTP id j19mr68411813ejx.276.1564071316494;
        Thu, 25 Jul 2019 09:15:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564071316; cv=none;
        d=google.com; s=arc-20160816;
        b=jIEfPObsX4l5pbVVjamiLEVH1qcvFStSJ2BH7lS9QiTc75J408wFE0xML6SC8U/t1T
         T9YswJIvNsYAu17PrQQal5NyMnYAXn5Khp8DaQID1qATuBfEp/GufeJCz5SoAaWTAFLF
         8ZdQoGJgrwmKpHIJ+ruChklwwZZVsPNlg70ElGMh6JeLgziq5bJeofCF2tXtGwLm2KWV
         WvNc2ay8+qp419Yz+kNZuUR279mLMzQ2kMtKb5WtVTRBkYq97t+kqub9OeTiaoWt9SJ6
         CBpxfZInpjbOffC/ibvBr1rMXNSvScc7PyKXXGSUi9e/Agu8bd3PstnqsrH50shyknK2
         Li6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oM4RDlq5BSdN7rfljW6fTXLCRkrhHgoyTaQtPscYJns=;
        b=qGrx/cLC0bS93OHFL5MUV3+iQg7m4Ru1RLKWdHwzoa2Pc2j4ydV2+R1DiqWTE83CYt
         IKdE+/Vtiut39ss4IAzSW/rxGP8f0Yna5oPiXWUYuPOtzJmq/CBII9vBm+N4t0xdWyqB
         9fO0YP1IxmwCWT8P3f4AKdZX9D6f7JaewBnwlCTdnCXX3Tq4JGpraUhwhri7fjG6shZ8
         mgE8mi97W+9W3RKiG0b7FpAwyBfmxFQIb39BYIwL5eI2rHxGQFAuSildppqTs9CSoDme
         dl7umQI4m3EM+jYKN2t5fP3HtF+F14RA2CQYvXKR9vZXCVTxUghrYO71+8AnZgM3P6CD
         GH1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=u3YQpVJx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b21si11565182ede.393.2019.07.25.09.15.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 09:15:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=u3YQpVJx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqgOh-0005e1-EI
	for alex.bennee@linaro.org; Thu, 25 Jul 2019 12:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58658)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hqgOT-0005FJ-MP
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 12:15:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hqgOS-0004R2-MB
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 12:15:01 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:35011)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hqgOS-0004QT-Gc
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 12:15:00 -0400
Received: by mail-oi1-x241.google.com with SMTP id a127so38040123oii.2
 for <qemu-devel@nongnu.org>; Thu, 25 Jul 2019 09:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oM4RDlq5BSdN7rfljW6fTXLCRkrhHgoyTaQtPscYJns=;
 b=u3YQpVJxawnKIMAU0HRHb2jpBqCH9pakMG+ROIja2C58HvlFdVxAtYeznYCi94UDAE
 v0TUOmQqCYhqF8wbCrGeoaD+LUlMiV6Ze+sJkTRuwBuMpm1J1RDFi6WKrpNlV4MrVdx6
 bKlc5lAJKoVsEGAjamGNsmkP+4Us4YalPhKAf96zQ750q4lsgPggeLhSERlTxvsS4Bmy
 TH40/9iMO04g5209CzpzbtE7st7KRPQ6BsrIRtgZDxVCZnr899nlcofZEm2MB/uoPfCt
 qCW7bOCaqGA3bWEylgMcseafNX2Gn/FVUJrFPItfYpZ8XUgtNMf/iW5Sgo8QEcgT/wFg
 hmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oM4RDlq5BSdN7rfljW6fTXLCRkrhHgoyTaQtPscYJns=;
 b=kbR3ouzqebmfiBwA55JZKSbGYkO4G3ijLIBJGtMGg5ciX/OCJ/71pvNZxFRl1x5BO4
 W9T6WFB7//jJKzY3cOkLrTA+dhRZzyehDRLmrFW5wKGMLtSbSQMMVlsohXYKjAdpAa/J
 OxqEN/QBe82y/vYMs4Xnns0OTB69u+g83yDquaAHo3tUZO355PzgrBS5GoCIihVSajAC
 4Dn8ZvgOShnmpezAfhNUssp8MKQnNKqIcinWpuiWpWY3TKNDgLXxjChRSDWmPVD4Xuew
 C4agdJ2yvVPFd0k4jFxjDIbDYmCat86FsxoH/4KdArkK4LzRHtAFPXmx12xI+s2MYZhP
 UitQ==
X-Gm-Message-State: APjAAAUgT9RaFGVIr3CE3pbxwNDzjVAF4db77HQ6D00jbTQOlDjwluXV
 PUkf5aGGpxVXADwE+xrleF3HJHlMErwbWK2BDnQmx1OmdiI=
X-Received: by 2002:a05:6808:d4:: with SMTP id
 t20mr24174585oic.170.1564071299522; 
 Thu, 25 Jul 2019 09:14:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190724143553.21557-1-damien.hedde@greensocs.com>
In-Reply-To: <20190724143553.21557-1-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jul 2019 17:14:48 +0100
Message-ID: <CAFEAcA_KW329Hzi-fm7RnxZsjdUDz=qmCd69YeO6ar9i+MZTJA@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH for 4.1?] pl330: fix vmstate description
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iFHxwz9ozhC9

On Wed, 24 Jul 2019 at 15:36, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Fix the pl330 main and queue vmstate description.
> There were missing POINTER flags causing crashes during
> incoming migration because:
> + PL330State chan field is a pointer to an array
> + PL330Queue queue field is a pointer to an array
>
> Also bump corresponding vmsd version numbers.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>
> I found this while working on reset with xilinx-zynq machine.
>
> I'm not sure what's the vmsd version policy in such cases (for
> backward compatibility). I've simply bumped them since migration
> was not working anyway (vmstate_load_state was erasing critical part
> of PL330State and causing segfaults while loading following fields).
>
> Tested doing migration with the xilinx-zynq-a9 machine.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I worked out that we can catch this category of bug by adding
type-checking to the VMSTATE_STRUCT_VARRAY_UINT32 macro and
friends that ensures that the passed in field name is really
an array and not a pointer. This also caught at least one
other bug of the same type...patches to follow later.

thanks
-- PMM
