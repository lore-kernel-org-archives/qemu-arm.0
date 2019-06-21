Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp490629wrg;
        Fri, 21 Jun 2019 03:33:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzrlJf5ReH0IW0RAVCl9iNyZacAJjtV3W0pQkOUOI2uGFOnqoDBe4V2x0p8FWuMTKiQL6Yo
X-Received: by 2002:a17:906:c73c:: with SMTP id fj28mr16455450ejb.136.1561113217265;
        Fri, 21 Jun 2019 03:33:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561113217; cv=none;
        d=google.com; s=arc-20160816;
        b=DpNl1rRQxPiDkcOH2SXmFnnXD+ra8aXh1r2Ku59lrxcTKf30MiWPC/Y5IHSrdk7EwO
         ULUGnOcRYUGElfNrms+c24UP+MqvqAncYizX1jW7dmqnONZPydKy0TWKDxuDLB4GS5SI
         gqVZHFYwFhTOK7vV05PzwQYWjwNiRw6ye/hQ5PWI9m6eILiT0MPGDSWnLYpz3lbBf1R7
         ERRjHqjb+S3r59amMj/dSovGXZtTIn6C3Wb9Ay34K1p19YIV7z2Hydo8eZktbzWX1jqn
         cHRYy2Usvs9r8u00vgTx7enowItFLd1dnsVN2Bxck3ZvhFVGfnbX0UtuctwJBsk/17N2
         CjAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c0tzWgBtY5Q80TKSqGILZ875XtrTUzlsD0Ec0rksDqI=;
        b=MXwpgkWrgMPVrFvkrXzuZsEyPUyhDfjdEkPZJJqx2aOZnZlQTv8mk061dmjnwhQaAP
         dgxDpU9GvpEj5Bo6yiqrUPFeRXonG/X6QjC5TS2boALFAvaxZdOgp6wWxd08WGjtOdj6
         h7pM+NrlFq9ID1zMuo+I6yhT3hrOJIkOhjASopW46GZmFQh+Tvnc9ngA6Z7ma6Ddlqy9
         iq9iL1Vttz+u3VGp066BdrTd+EXHdPEYUBSvWEFidhXjB4+R08lTOUHq/xvt21OVOmoU
         2uOBJ+E/fTwMP8qYelX8Pb977FSj3Ak2hhp6naRO1WGbdjGkncZqZs3XRXWLEBQqKliN
         0hvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yhtnOGnO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o34si2143767edc.436.2019.06.21.03.33.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2019 03:33:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yhtnOGnO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58864 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1heGrQ-0001O1-Aq
	for alex.bennee@linaro.org; Fri, 21 Jun 2019 06:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35584)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1heGrG-0001My-1f
 for qemu-arm@nongnu.org; Fri, 21 Jun 2019 06:33:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1heGrC-0005bZ-Uz
 for qemu-arm@nongnu.org; Fri, 21 Jun 2019 06:33:25 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42398)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1heGrC-0005YA-P3
 for qemu-arm@nongnu.org; Fri, 21 Jun 2019 06:33:22 -0400
Received: by mail-ot1-x344.google.com with SMTP id l15so5801009otn.9
 for <qemu-arm@nongnu.org>; Fri, 21 Jun 2019 03:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c0tzWgBtY5Q80TKSqGILZ875XtrTUzlsD0Ec0rksDqI=;
 b=yhtnOGnOEcIn3TP8y2s2XasaiWYil7VJTofjR2kVBuYR6zn0F4pTelGqyvxHqQQFAH
 mdFEaLXClYwAycyrxQZY2k1OlKydzQqT8LMlfXKX4PsF5Px9ipRCnSqLA+mstV0MkWmm
 XIDy3AvP8voDV4gxQEoOoAqkSJU7xqRAb1ZN7hv3ASKlFx8CO64n1uH/ONvYzYH5HNXL
 2HICi3cGOlJ6TGDPrLc0x1Md+0htA0IEtKEkNeUyzC4CBtbpFVRB6X3sJ6cFRyGA3mCe
 DwbTF4dqLrqD36D4otfoNS4vH2CAKmDg/dA1pTSZk/H+KknmNcq6U8zLfBWPvazIWtHz
 MM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c0tzWgBtY5Q80TKSqGILZ875XtrTUzlsD0Ec0rksDqI=;
 b=C1FlWm4Rj1yHQfGK4XeXf70SOxfwwmCnv8VobWAdLyL4T5dfKSkaoYDE5jVWh4Ik1u
 zMvV61a8wtDYXuUs74gJ4n9d/kEDKnfRL7lCHikv9DlpnSDwJ0OgB+WeWMBl2+gFkju6
 zb/hY0Bl8PE5WaJcR3l1MIxuBbuotrOJLzW8LpMyjblWmR9DqhIScke3cXaZsno0BM1Q
 R9SwW1acM2sqE2KdC2EjMHexs/ZElYx3Z7UxfPv5j1LedyyT1av9toNY0kMeiFbCcMa9
 Q5ddfM9C3OCIl5XXqnY17DGPEfL8wEXFFQgoMuAq7kGmJZnsFF/lOOr8PiBF6t+Wqjy6
 S+4w==
X-Gm-Message-State: APjAAAVDXyMBIvOxE3zWGwQZWgHqhWT5o/YkhfRu2m6WJdaeIsnYSUrI
 tweBvw/8dSPdEbp1nOk6WBz6z0MA8gMBDMsG9cATRg==
X-Received: by 2002:a9d:7245:: with SMTP id a5mr5257398otk.232.1561113201153; 
 Fri, 21 Jun 2019 03:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190620222314.2670-1-wainersm@redhat.com>
In-Reply-To: <20190620222314.2670-1-wainersm@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Jun 2019 11:33:10 +0100
Message-ID: <CAFEAcA92m9n7FR2a6=ecnr5bn-Sq97LZRxHRuzWO-OcbdgA4fw@mail.gmail.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [RFC v2 PATCH] hw/arm/virt: makes virt a default
 machine type
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FVpegJLuS5mt

On Thu, 20 Jun 2019 at 23:23, Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
> I came across this when running the acceptance tests in an aarch64 host.
> The arch-independent tests fail because, in general, they don't set a
> machine type. In order to avoid treating arm targets as special cases
> on avocado_qemu framework I prefered to attempt to promote virt as
> default for ARM emulation. Moreover since it represents a generic hardware
> and its used is broaden advised [1], I found it the right choice.

Not providing a default machine type for Arm is a deliberate
choice: there is no single right answer and the user has
to decide what their preference is. We used to have a default
machine type set, and it caused a lot of user confusion as
they expected Arm to be like x86 where everything will run
fine on the default machine type and it did not, which is
why we switched to not having a default.

thanks
-- PMM
