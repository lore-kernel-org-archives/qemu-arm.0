Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4270512wrp;
        Mon, 16 Sep 2019 10:26:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxFhBP4cWdhYiwlVCnpiXNSP4cPueIfo2LHTru5edsj1slttnagF3h68sTto9rWYvhhDmWy
X-Received: by 2002:a17:906:d0c5:: with SMTP id bq5mr1065387ejb.95.1568654780850;
        Mon, 16 Sep 2019 10:26:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568654780; cv=none;
        d=google.com; s=arc-20160816;
        b=V7SmGQENPnPgdqC3xMy+/waDkSPHtap/ocqhA3COmxwbUvpZd+R4ZdQ/YQdAWCfjky
         IVKcRwYADYYQj1zMtC6IX84munDKjjMcI0ujfMnO3RYjUuC2wDCz4JCaxSeTlUpyxpXk
         aQitjjIVvyTzhNpc+FToYHxOmBvWd8tDgmpBXP81yVUoExyJEAKTC731m0JhHMrbrhGt
         jUPIS7y66x/HAqb0E2ZyWKNX6CVE+FI7il1rVdIZLH1Qg8//NQUHy+CpDvTjlQlmvsmN
         aAAy1zAUq2kx7npEPzEO9LiZOUSZwZU2X30zun9c2PGpZTamvVKLoZqMZJwWoz79MsRa
         yYFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RBy9L3lBIhpXe0r8RcgHmA/6kWJtJxLCkgShM0+x6H8=;
        b=uG0i4htAjqgBedPoee0SY4A/heePqB2vDdfwZ2NTuuUQ5790f6YCg8vGJb3tczecQi
         51XMo0dITAF2XTnFrWXPoNRRdhi5BEaLEGCTwBK+LoeIjaZUnevPSslRmJApz1185s0E
         UcWN1S8tw7rWYOy7NXK/u66QUIOcPgB9e0s2GUTlb+93OQ5qqdN4DvNBVs7KX4PTF4jX
         Lr47fq5F8KhZD7g8gv5ee1vCfWR69av3XlSN922Hc1a8aGRMBVZyy/y5mJbHA4Q0NGRD
         LffZB3SjO3GJ3dTRnGDMrLquu3WmWFeuvVSeiAqNm8NuMWEExyyW29Tp5zST5vb2P9wm
         WCgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ViHLYqME;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k19si18836876eds.71.2019.09.16.10.26.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Sep 2019 10:26:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ViHLYqME;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i9ulX-0007wU-Tr
	for alex.bennee@linaro.org; Mon, 16 Sep 2019 13:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56299)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i9ulL-0007w3-OP
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 13:26:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i9ulH-0005HO-Ud
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 13:26:07 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:33711)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i9ulH-0005Gy-Oi
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 13:26:03 -0400
Received: by mail-oi1-x22c.google.com with SMTP id e18so481445oii.0
 for <qemu-arm@nongnu.org>; Mon, 16 Sep 2019 10:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RBy9L3lBIhpXe0r8RcgHmA/6kWJtJxLCkgShM0+x6H8=;
 b=ViHLYqMEgmDe7Zi+FIVrsOd8w6TvzSFDA5694IMNnw94A/OccsVLrdl7k/yfvyzQ/P
 s1JvmugDBDSP7mz1EO18UGR9Io0pHyqqJ9Ln4L8pAjj9+c18WUEErRJ+4vUGHMHamsRa
 HNowN2RFYDoKW8jxNE0fFOGRTCH8WqmBQ35XxCT188ydZim9RSWNAfXsBwV2eYZgXYqZ
 8lpkfvcyOqRFjkVxiP5XyedoEvHQ2YQslnHWdfrd6gksGp3J4wIbGGlpqMGTGOr1r4lv
 3WmcBhdFfsDOiS+eG/tqY+Y9R+j4QYvw1dhxHTWHP9ZinjEvmvYWfaiuFV6pJ7l/bYu5
 ATrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RBy9L3lBIhpXe0r8RcgHmA/6kWJtJxLCkgShM0+x6H8=;
 b=Sfr7vsbTq1o4445EtyI1/dgxx5Ktv3uaT+TyoqVpZfJECF1KWM3XyMcUqKlmTHfulI
 r2stTamEft8i3GHY6k5dBLRCDpXpKfcPpweeKrxXGVW6z1YgZk0bRXw67Qu3zBss3HaB
 7OKgQhsUYXN+IwQDv56zEDMuFu9kB2oAdoOpE1oWd8/eAWMJjGeqEV1wqVjbcbcjIiok
 HTOTVImC3WCuZh8cEhYnN/kQnUPftYBttrW3Yk8SoVU8bQ8E7wYoU3ii678TuID1rcFQ
 S6s3LsKw3RaG48rIiswvLopJyDMro38fAvjGDvHiuoXyuBQtCiKvQZwRr0WYzzoxHVwi
 CGRQ==
X-Gm-Message-State: APjAAAXQznIQF7q+wF6ln5db/hcSXRZdeXnw45KM9jpcQrWdRDRdzWjE
 aQowt8r2wYht0vVGIlYnX4109UGhZ/JY0zx3skfyFRsv/Lg=
X-Received: by 2002:aca:b646:: with SMTP id g67mr241681oif.163.1568654762870; 
 Mon, 16 Sep 2019 10:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <f2c90efa-1412-9c41-ba76-ebad90745f4d@linux.microsoft.com>
 <CAFEAcA9S7Kj5sJVM0Ot6KKpe9z3BfQWyZwUv-Vx_+g5sRbxqmA@mail.gmail.com>
In-Reply-To: <CAFEAcA9S7Kj5sJVM0Ot6KKpe9z3BfQWyZwUv-Vx_+g5sRbxqmA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Sep 2019 18:25:52 +0100
Message-ID: <CAFEAcA9rrcmJogBAXGeDW_YQ_YtJmOioHGVmP63msSRmRNEbjg@mail.gmail.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22c
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
X-TUID: XpefxejUVLnp

On Mon, 16 Sep 2019 at 18:24, Peter Maydell <peter.maydell@linaro.org> wrote:
> On Mon, 16 Sep 2019 at 17:31, Lakshmi Ramasubramanian
> <nramas@linux.microsoft.com> wrote:
> > qemu-system-aarch64: -device tpm-tis,tpmdev=tpm0: 'tpm-tis' is not a
> > valid device model name
>
> This is because QEMU only supports TPM device emulation on x86.
> To add it to aarch64 somebody would have to investigate what the
> hardware interface for TPM ought to be on aarch64 hardware, and
> then implement an emulation of it and add that to the 'virt'
> board. (It would probably share a lot of the implementation with
> the current x86 TPM, obviously.)

Hmm, actually a quick grep suggests we have some TPM support
for PPC as well (via a hypercall interface). The rest of
my answer still stands, though.

thanks
-- PMM
