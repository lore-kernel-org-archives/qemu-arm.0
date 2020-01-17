Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp9838328lff;
        Fri, 17 Jan 2020 06:01:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqxUu7uLp3x/RMQqRNu1jMJrpTc2142zaJlX3aanRxOCzOxaFY2id+8Q9XHl0sK18i3EKAzO
X-Received: by 2002:a37:4bc6:: with SMTP id y189mr37990546qka.18.1579269682702;
        Fri, 17 Jan 2020 06:01:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579269682; cv=none;
        d=google.com; s=arc-20160816;
        b=PEwiOnJrrikgCPTU7v29QfaAsik9ZRhBOfRZqEkzvTXnKXsHSYwtH5MYEI90ymK9Cg
         4H7425YwFDHsNil4ZnRpafid5Sd05wslVT2kWM4T8OIPOgJRFpBvdOhUH7zEtKgr3hqo
         EKc5rlWUwfd+sPcDPZzMIRekKFOnmkLshoCaM2xMKR3EQMvA9E0eFy6R3+7ZL5jngHOZ
         HaDJGXjrqxK+2IeFbYVT1xZmQb59dhhYW/1/o6pRaBa+MgoVOtQtnCKGJRWvdxw+3FYr
         UXLBO1TLXqATNwAkmHPB2aOeEvGlfkbqzFzD+tdfUvYsmmWSJ9kSUcO+QAeRfhQOJJCL
         lUAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ER+LkyNb1e+F6XJEMqagb4//d3ToXFWicQDU9yloNKc=;
        b=EaJX6eM8SxpC+ODVAcqle4KrIhd/gnbDpq6Ev+Ty321ih2bL8U1baJ8RgYoqBq5r2s
         vKcK7f6DAusDjbSLZFbwr0hmP9hGKlAJDiQwidpmLgDpOMBXY+UXnCMdVW6aRwYnY9b1
         NxSyzKIjiRbmE9duJlh42uqJo69h5qDNVQ6kHcP7V1cEcF8iKmzmSex9cU2/R/0O0n04
         oQTBc1yu+cA7c3p4qNtpRoeqYBS67kjajA78xbOjVkFiGxl1Eot6nPSPXAdOAvB09KOb
         y6PWEDryPWLpP3l6dKmo+GqfraTPDRDZgwOab7OIZLdUH/UqiUymcSrJZkg2HWWYRoHS
         l+Lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NqzUIRAm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5si15099186qkl.3.2020.01.17.06.01.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 06:01:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NqzUIRAm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isSBd-0007U8-Vf
	for alex.bennee@linaro.org; Fri, 17 Jan 2020 09:01:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53080)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1isSBG-0007Qr-9G
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 09:01:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1isSBE-0005uM-QR
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 09:00:57 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:38902)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1isSBE-0005t1-ER
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 09:00:56 -0500
Received: by mail-ot1-x342.google.com with SMTP id z9so20457732oth.5
 for <qemu-arm@nongnu.org>; Fri, 17 Jan 2020 06:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ER+LkyNb1e+F6XJEMqagb4//d3ToXFWicQDU9yloNKc=;
 b=NqzUIRAmrGKHWKdtnkWYTBCbFS5MTyjnH3GLSZQAOoHDSVjpB+33FHxr034Iden8hs
 5vTF9egfQuRwy36yWVuAncxW2TsHLTJsL0nDLS2AM9My0cvUVngyyUJzWnVE236gAa3D
 IosqoyrLmp/0h/b/EjhBC1duffmunURwPGwjEj6JMcwleK4tU0GTtcOK7q4bnuFSA8NY
 vgt/aEtz4EX/n1L/V9GVYUtOh30MstwFGP/3Mp77r3acyROZSb1g/+FmUI2zNWyddcP7
 /mrzNjPPlRicHKgR95D1rkuww2F57EH8LfG2Gd9SDwL1ISDnle+UUtut3feShIafnRxJ
 z06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ER+LkyNb1e+F6XJEMqagb4//d3ToXFWicQDU9yloNKc=;
 b=apfGQ/+CUIg7JKTRUQQJ3eSW5h4+zUVPT46BRo1GEsq3FfeuofH7CZXeVA0jO+s1nQ
 rJnxbwvuV+r099MkDlkijEe1B2BrpBc/wq3m4NQ1eOVy3Ne4FQ/MV0O2+j3YrT1OSZ0H
 FEg3pVyJtFTQJRNnPRvLcUks3g/izVRoxBxhFUeWc+dBD4nXpQtjEFToFfEQAzEJ3OjE
 SiAoSeWB8IwI/DLy5tw4tlb6JQ5LfHZ0oTGu0AHX5krgHZN+V5FBDLUPw3F4mNsRbXJX
 WRwRJkJkBkKF9wDysJ/2T/zLXEF5vUbeMxC2qsLKTg1yfYrb77ZCanJcYIE9o+RyX8Vu
 DMzg==
X-Gm-Message-State: APjAAAUAw4kJWr8HijheVCFJxRLTJEupGWYUO9Cj9dSBABTrbttdkFav
 QRXuvmYSOcfWlEs2uHiduW9VIsE1/gjKp1B1gSxAog==
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr5810406otq.97.1579269654059; 
 Fri, 17 Jan 2020 06:00:54 -0800 (PST)
MIME-Version: 1.0
References: <20191219040612.28431-1-gshan@redhat.com>
In-Reply-To: <20191219040612.28431-1-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jan 2020 14:00:43 +0000
Message-ID: <CAFEAcA-aucN9anYbhqLMQZTOzhfYaBB0DLV0d16B2HkgEs=ULw@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/arm/virt: Support NMI injection
To: Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Eric Auger <eric.auger@redhat.com>, Andrew Jones <drjones@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OaO3ybwg/2oE

On Thu, 19 Dec 2019 at 04:06, Gavin Shan <gshan@redhat.com> wrote:
> This supports NMI injection for virtual machine and currently it's only
> supported on GICv3 controller, which is emulated by qemu or host kernel.
> The design is highlighted as below:
>
>    * The NMI is identified by its priority (0x20). In the guest (linux)
>      kernel, the GICC_PMR is set to 0x80, to block all interrupts except
>      the NMIs when the external interrupt is disabled. It means the FIQ
>      and IRQ bit in PSTATE isn't touched when the functionality (NMI) is
>      functional.
>    * LPIs aren't considered as NMIs because of their nature. It means NMI
>      is either SPI or PPI. Besides, the NMIs are injected in round-robin
>      fashion is there are multiple NMIs existing.
>    * When the GICv3 controller is emulated by qemu, the interrupt states
>      (e.g. enabled, priority) is fetched from the corresponding data struct
>      directly. However, we have to pause all CPUs to fetch the interrupt
>      states from host in advance if the GICv3 controller is emulated by
>      host.
>
> The testing scenario is to tweak guest (linux) kernel where the pl011 SPI
> can be enabled as NMI by request_nmi(). Check "/proc/interrupts" after injecting
> several NMIs, to see if the interrupt count is increased or not. The result
> is just as expected.

So, QEMU is trying to emulate actual hardware. None of this
looks to me like what GICv3 hardware does... If you want to
have the virt board send an interrupt, do it the usual way
by wiring up a qemu_irq from some device to the GIC, please.
(More generally, there is no concept of an "NMI" in the GIC;
there are just interrupts at varying possible guest-programmable
priority levels.)

thanks
-- PMM
