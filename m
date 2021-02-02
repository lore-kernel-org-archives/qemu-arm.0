Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp73813lfo;
        Tue, 2 Feb 2021 04:29:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNLQR3TaXw7mx9FcZYf/bB5a/2MQ1F4Sst4ZGxpKfLDUJ/dn3ydnijaSSBYZD9SZWT663w
X-Received: by 2002:a25:3bc5:: with SMTP id i188mr31574145yba.332.1612268957946;
        Tue, 02 Feb 2021 04:29:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612268957; cv=none;
        d=google.com; s=arc-20160816;
        b=RhHw8LEgmdQjkskBaCvq/cUwtC2Rd6x72JvA18AIwNr1z7TEVmFGcRmwL5gBGiKM2e
         +oa6EihW8nMBL6g5wusSED+1FZ5pUHC5hBOK7VcNbyTEWMushA1cD5clEi5uj+T5zGQk
         aVPHeN3JVs0vCX7+9AskYgVXYwOjWJP1gG67ZTp6lDAFcdsnyCw45U1r4cvX0AxflJd8
         GInxmuCixl+pqpunvpEplxmS1gHrDc2FtNbAi5ewt353E7BP9ZNrJOIDjkcBaqiHSX/A
         EHpYIc1sXdHiCMTVvexnZVnVO404P4d3a9pMYpgP0g9REEpwzduocrc2TDt8IQ0/YV3c
         TEDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=c+G3TuuZdddZdLSCiu835Rng3C9zacytq1wS/2XqQGs=;
        b=BR2LI+suRw7K3dqGFt7YxtqgrweAlWVlxwgENsl2tYNGy2DOZrgiiPz3LPQg9yPrP0
         9doOsNIvPWyo3or45ayull2vWZurIbbIExZvj+GLhNIaMCNqu5brX/QOoIN1LSTXEV2l
         4O9/mYxyjaetWpPkE5KVZw0UCs70IJTxbIFYrV3rsKI40qv8+rYsSD3cB0C3fZPLa9T5
         su11mzvwCfq5Y/pDBzHFrKsNjBmXGLblNaBKlisK0IT5OGR/5AuUc4J5BSK8pXB3pc4S
         qs0TWyFeNWWAAHhiTYdPDJsrzqdvJkNNWiJVOLmTGaVu74XeGvRhvIjbAW+MuH6oCYNh
         QFHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WD0UkueD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1si20934062ybj.253.2021.02.02.04.29.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 04:29:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WD0UkueD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6uo0-00031W-GI
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 07:29:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6uky-0008RS-87
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:26:09 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:42463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6uks-0007rW-8n
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:26:06 -0500
Received: by mail-ej1-x62e.google.com with SMTP id r12so29644950ejb.9
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 04:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=c+G3TuuZdddZdLSCiu835Rng3C9zacytq1wS/2XqQGs=;
 b=WD0UkueDxddiNwGrR4Li13eT6HazdV+08hsBCGr7OWeKjM88OcpAKDVzK2EKu50Wqz
 DOVPj6xUY2WFgDoYNd5xp3FPzuMKc7OBItoY8J+oJQiPxQDoO8HRzNzNqVKeOxS205TZ
 Ng69ptkB25NDbWyWYBDkOpUhzCS1pTlAt2RoSknB1IJKKfcJGsYQfsvlUpBidFCGBNBO
 5oAX8usOrJWRUe5xTEeLqg5buxCwXYjj64CyjkdgWMsFQJR0Y2LZ1vZ9k56f8DxOnWo5
 WHsMPbe6R01O0Eg1tR243HL7Tip4H0v9NLQ50TvAvEHpAtVS75jDNUDuxvjtomPtI7/0
 SabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c+G3TuuZdddZdLSCiu835Rng3C9zacytq1wS/2XqQGs=;
 b=GUK0vb21TodNRKf4ZHaPxc/qzMmeIM/0/4VFUdemJW17uJSUwkCxGW6No885h7MR7r
 IOLsTWxIJoTCAXM7n5meQxeMgV4kfV6Hbgd0c5q/v9raxFKH9IqN/QMSSAxp2Hxzm2RW
 8FjnEKksMVkq+ciY+SoToyX2yaeRYb2YwTSOo1GBrLMq0hwEna7uViCO/dnvZtgLTkSw
 ejZ7ZmEQ7NnrmJd2XZ1ya0RIoWVEZdUaCMt6q6vB+qU0An9jnxKr5FxPkzG6qQGTHm6D
 D85P3yuXF+RpVHu2lcbxLURSGRig8lngibKJDBqgeVkHbJCC444Hv3tWFaooOae4Cihn
 hNzQ==
X-Gm-Message-State: AOAM530lbv7f+8HWHLI0tlQGGmXRr2SxVPQKDX15+4dopzAXRkWPF6aT
 KX+4wMBw5fk1LmqTb4ntAA6xes7nC/645MiZXbw0jQ==
X-Received: by 2002:a17:907:1b10:: with SMTP id
 mp16mr22242179ejc.482.1612268760281; 
 Tue, 02 Feb 2021 04:26:00 -0800 (PST)
MIME-Version: 1.0
References: <20210131151410.318649-1-f4bug@amsat.org>
In-Reply-To: <20210131151410.318649-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 12:25:49 +0000
Message-ID: <CAFEAcA9WEmiePw_SipgUZwGFNcMPi4ejoXDT5v3mhYQhxX_rcg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] hw/arm/raspi: Restrict BCM2835 / BCM2836 SoC to
 TCG
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Luc Michel <luc@lmichel.fr>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vtWoSUilwKUd

On Sun, 31 Jan 2021 at 15:14, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Peter mentioned [*] KVM only support ARMv8 targets. Restrict the
> non-ARMv8 machines to TCG.
>
> While this is still not enough to boot a raspi3 image using KVM:
>
>   $ qemu-system-aarch64 -M raspi3b -enable-kvm ...
>   qemu-system-aarch64: ../../softmmu/physmem.c:745: cpu_address_space_ini=
t: A=3D
> ssertion `asidx =3D3D=3D3D 0 || !kvm_enabled()' failed.
>   Aborted (core dumped)

Side note: this assertion isn't specific to the raspi3b -- it's
caused because we don't correctly screen out "tried to use KVM
on a CPU type with EL3 enabled", which should cause an error
but instead gets far enough through CPU init to hit this assertion.

thanks
-- PMM
