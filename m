Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1397486ejc;
        Fri, 11 Aug 2023 07:08:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEf0NTV0Hlg9GwpdWBw4m41/AH020K3HnzvkguwygPaOYOsylBfdkqkHsiSKwQMi2Qnb6D1
X-Received: by 2002:a05:6358:7606:b0:133:7c4:e752 with SMTP id r6-20020a056358760600b0013307c4e752mr1812224rwg.26.1691762895033;
        Fri, 11 Aug 2023 07:08:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691762895; cv=none;
        d=google.com; s=arc-20160816;
        b=ZtNJhCS4P/Q3LCUNm28KeiXdewffDd3ZkjCiJYecXLirs5sSrzPmvprnEbgM8l0F4c
         cWh0y5407+hj92JtO4ATiyU1CrKMOZ8YbvePkm8Cnc3jXjGK4ARpH+inzKQZvNPO5Xn6
         wKDtUDjsrPHRr+FzgmDReK9XqDRqOTcPUWskxUJi0Xuk4IKqvuNoIbrnnurfO1jtV0fz
         wzo6yESGaWXe2mJWUlsAqDaPeYt0g7CH9pV0wyfKHduddIiKmXPw/ZRkcdjNk5ysMjpy
         esYWflMEyDGz+hiq3sf1oJZuz6Ocm/g8Mk0GEs2PjzWnHbWra5gXcd+wQf698e+lJfHK
         Wpdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=r7bFbX07yuBBUa5uASnwWdoa6sYiAjx93TaQjSh4YIE=;
        fh=k4XCDcV5u9fk9vPvzvtIw/DKQuSqhFL8lGQ3XQ8NiJ4=;
        b=K08hdRzWmRb0V5NgI+WYeSYAVUG/rQSO0DAWTtWPQT+J/kJSG2Rk1fBd4AHfitxUUf
         TauWz5IsibzhE9SEPmo50BsoXB+I5R+g4MFytgU3+z/65+tLpB96U6It1mEZPvHHh5kE
         JD1nMRs015KHHDjduyFVQbh3Ek6Djx3Lcoyuuev8YWvxPy5fqbgta9KVNf3fNCx6Fwty
         rhSq5n3Q2E5+gAO47avDVheDNoQw8MylbyJCg4P1onAurGBmrCwGD/l9GETsVRhCoI7U
         X7/IDTYeoeN5RwN0Sxt228ULlW5kh9IurgNoDo5ERZRgTZjGxCI1RNjK1xiYP2D2TY+p
         juTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IQKCVtmz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v42-20020a9f31ad000000b0078cc001ee27si284169uad.164.2023.08.11.07.08.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Aug 2023 07:08:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IQKCVtmz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qUSnN-0007kB-TR; Fri, 11 Aug 2023 10:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUSnK-0007jJ-Ez
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 10:07:15 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUSnH-0006z5-PN
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 10:07:14 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-51d95aed33aso2599789a12.3
 for <qemu-arm@nongnu.org>; Fri, 11 Aug 2023 07:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691762830; x=1692367630;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=r7bFbX07yuBBUa5uASnwWdoa6sYiAjx93TaQjSh4YIE=;
 b=IQKCVtmzNx6rQrukzGiTiIBfBH6QZCN7WSa6zPnV9SAVQA3MzJW/3KrkR3oIo9RRhK
 j/Y3Z5jQspsZhsRRw4nOqoMmJ2OuR3ZzHGSjWEjKEN3NMqr2domJn76LIE1ucmN7MMN6
 w07Y7lGvYJBzjvu9ct2DMPN/pR+ZY5xNIBzVmJ0kIL2OEXiNpG44xoror5/16t09mFA/
 zeraHCfxWcZJPK15LCGcHOKdb6sw9Cm+fm197gwiwBamriiqLiosXa7FdUlDbn8gUGx7
 RpuLsGv0KZ1nFes87/Bds8sXCJ2AL+WnQLSFproTWvnejYT/OrIfSkUvDXfff3Jtz5dd
 cvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691762830; x=1692367630;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r7bFbX07yuBBUa5uASnwWdoa6sYiAjx93TaQjSh4YIE=;
 b=Ly30+CxCb+WdYBydeWlLkrwSMIskIMEu4RgaDLrX4C8xYbWEH7JUcZvPoubNe7WY30
 TLP6ftpZig27bl3ItcXo7qt6+0nJilakZUaJ60nmZZA+r9c5aY/oNbI6jAWABd2dqdWU
 I3q2E7dAsAqHm4qnpK0ksGsHpzmgTybr7Q/HgZW2QO01eGFjbstNEp9VLFvG+MF/uQlb
 XZsbVQg4+qPfqnJlZRNCPy2f585kcBaA0hsc/HpMfgmdzEnBTltcihPJPEcBeENGnbH0
 2fBZtvXWY0enWtgRB3ejkOXPKOqzqWUdoLJL93zAkZOmStrSMu8rZVRsz7RH9qNOCFG3
 xDFA==
X-Gm-Message-State: AOJu0YypxjmBYRuPe8dBAe7M9M/BgcmIS3e8YHZwgZQTY5CeZom6EQwW
 jfFRxDpUU9qmD56F0WtJaKQwg84fxEuhjqONEjqqlQ==
X-Received: by 2002:aa7:d357:0:b0:51f:f1a4:edc6 with SMTP id
 m23-20020aa7d357000000b0051ff1a4edc6mr1858217edr.37.1691762829896; Fri, 11
 Aug 2023 07:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230809102257.25121-1-jason.chien@sifive.com>
 <20230810135050-mutt-send-email-mst@kernel.org>
 <CAFEAcA_B5W5CX7-C_a7iWTL87kpcLsGEjAsqs5t54sgjTKi3Eg@mail.gmail.com>
In-Reply-To: <CAFEAcA_B5W5CX7-C_a7iWTL87kpcLsGEjAsqs5t54sgjTKi3Eg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2023 15:06:58 +0100
Message-ID: <CAFEAcA8vr-Bk+tPvugTH4DwAk=S_RXiUhrqDytFGg-EyoC9Mmg@mail.gmail.com>
Subject: Re: [PATCH] hw/pci-host: Allow extended config space access for
 Designware PCIe host
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Chien <jason.chien@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, Greg Kurz <groug@kaod.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: p+E6NQNoqNqZ

On Fri, 11 Aug 2023 at 10:55, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 10 Aug 2023 at 18:51, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Aug 09, 2023 at 10:22:50AM +0000, Jason Chien wrote:
> > > In pcie_bus_realize(), a root bus is realized as a PCIe bus and a non-root
> > > bus is realized as a PCIe bus if its parent bus is a PCIe bus. However,
> > > the child bus "dw-pcie" is realized before the parent bus "pcie" which is
> > > the root PCIe bus. Thus, the extended configuration space is not accessible
> > > on "dw-pcie". The issue can be resolved by adding the
> > > PCI_BUS_EXTENDED_CONFIG_SPACE flag to "pcie" before "dw-pcie" is realized.
> > >
> > > Signed-off-by: Jason Chien <jason.chien@sifive.com>
> >
> >
> > Acked-by: Michael S. Tsirkin <mst@redhat.com>
> >
> > I'm not planning another pull before release, hopefully
> > another maintainer can pick it up? Peter?
>
> At the moment I don't have anything intended for 8.1 either,
> so whoever of us does it it would be a 1-patch pullreq...

Also, at this stage in the release cycle it's always worth
asking: is this a regression, or was this bug also in 8.0?

thanks
-- PMM
