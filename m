Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp479389lfp;
        Thu, 13 Feb 2020 03:11:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqz5xBtb1NPExilPImtq0RzrQfTZFppECkx+LVl8hEj2Tma2GZpGegP/B+4w4pJU//cZnkZc
X-Received: by 2002:aed:2f62:: with SMTP id l89mr11125126qtd.358.1581592317339;
        Thu, 13 Feb 2020 03:11:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581592317; cv=none;
        d=google.com; s=arc-20160816;
        b=HWMInSmr/F3djfUDLw8X6MJhMd38+NNMn9LZR3eEghH1dbGA3qYA5ot1xz2vj5e6MP
         fMpkPazn/6wDf7uTtQo7zNcO3JBys2CIX0Na2Q+9jCwpONGCa5nY9j2UInrkAWLH6jYE
         SZ8mXM3PCnPQyTXPUhsOQZuOzT9lnDh3ORkHC1GNH9tSCXLQyRHxBpSThk5DYA4wiZVO
         47mKg4S1xLuQhTqNgoPM9rhlwQh4oZy9p1b1RIxHpDBVgOqTEbohWLdoY9/wlt4xhR5N
         idQlCIVjcUdcVPKd90AK/4aCAy9nVxb1d0O5fMurIVyrYBLwG66hQtAzlOnA0d4W/Ei+
         QkVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y3o+/F6hlUAiW92XSO6P5taF12AhRImG4+u9cXm2jwY=;
        b=Ha0+OJenqu3+PBd+tjjF5rNHVd71UeMOCeXYB+y2CGZHY+/n2D7U9EYnYMtqdCdhBk
         IeMOrIGQou1lPcQgeQZ+ICiFcdawyXlxURqYAGPPxOJPMZXIVHPngpXv2hxQhAK14SLx
         ktyXCDghs2EdbIAvpO6eQ2RkByN9pWiKg3VF1L9B2W0qleVUe6/LP2gYVD6MtfA2/fWi
         q973OUmxQjh/AcxOgHiiJxb98xdFciqbUULWIYMW908cWvwiYWYX+iH2evw07ADpktgZ
         MmFFffapekCtdfVFfRBKa61yE3Vg05nTRjOJaj9GW6tchVtD8UNKUC2C7praF4s4+BdC
         v6MA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A8PdpSB9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q71si990405qka.52.2020.02.13.03.11.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2020 03:11:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A8PdpSB9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2CPU-0000CT-Pu
	for alex.bennee@linaro.org; Thu, 13 Feb 2020 06:11:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58429)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2CPL-0000CG-4b
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 06:11:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2CPJ-0006Ju-Ve
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 06:11:46 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:39813)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2CPJ-0006JX-Po
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 06:11:45 -0500
Received: by mail-ot1-x342.google.com with SMTP id 77so5180465oty.6
 for <qemu-arm@nongnu.org>; Thu, 13 Feb 2020 03:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y3o+/F6hlUAiW92XSO6P5taF12AhRImG4+u9cXm2jwY=;
 b=A8PdpSB9g2CyOxaKAOs+KYXaL4x6hUVOqHF1hOpIGS5/YFLhYdUo+nkjWkaocIhSG/
 iuxXBsHnuXSyQT2L0PN0lZkab7evRn2kqMl8d3RGMEZycUXAChWYoB5Ye1rwrs0//iyZ
 iF8lkL6ck+oB3QWJ4jYCcWCGQmpurAWHVUJelmJP61ny7DJM2q+a3zxu/ptgkdjHoCeT
 l4M9COy7XeFl6yzZ1TT6Ay5TBqxfdhlTIaUjqcLWlJo+lPBrTR7kVkaUn+o1uHckpnnf
 4n1J5SDjhbwNtPG3Ni6v8IBs/ix2qDuVjuTELeXStZ398QzraW5J3SzhZyjlF1R7CXa+
 g1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y3o+/F6hlUAiW92XSO6P5taF12AhRImG4+u9cXm2jwY=;
 b=uX1QiKJVhJPU3XPECfrEGQ8R6ukru/knHMrxv7wEnFMOSe4iZhxhdOU/hCjdwoOO70
 lT6zsbTo4qzEjEkZbf47S+fSOOm+GK77txxyYKtgxnUg8TVjVe3P7GF+vZqbYm09BOA7
 Qvib/IKyMVkO+4NiGv4coDMEIjCMDTaKhX+fzOmI1NlaX8isNXdLDQlfrlJV7pRg09f4
 ey+IylDLZsiONirHxz3lpmafYx3z2RLK2JgxCAv+iNksWGJYhv+Tz4ZDidmX0r+CM6MH
 STBHGbKGbWqdugHYkVt9+TSnVHVZjpLGZxKfSKDeCjAGZgnnZ0YH4UG6PoBTOUmlqY+J
 Q1WQ==
X-Gm-Message-State: APjAAAVsmV/m1nfmmM99pJs4L1AAwZ1GHauOl/1Y8gDU74voA4D40YJW
 mHnHlFshGBEFF5o/VSaRdvfJvcQM6TnUKcJwshEaiQ==
X-Received: by 2002:a05:6830:13d3:: with SMTP id
 e19mr12949937otq.135.1581592304702; 
 Thu, 13 Feb 2020 03:11:44 -0800 (PST)
MIME-Version: 1.0
References: <20200205110541.37811-3-gshan@redhat.com>
In-Reply-To: <20200205110541.37811-3-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Feb 2020 11:11:32 +0000
Message-ID: <CAFEAcA8LJf3rQhi1VyBqSrC9Rj_ZKiYeVMJ8Gb-U7HA4LVagLA@mail.gmail.com>
Subject: Re: [RESEND RFC PATCH v2 2/2] target/arm: Support NMI injection
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
Cc: Andrew Jones <drjones@redhat.com>, jthierry@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Marc Zyngier <maz@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Shan Gavin <shan.gavin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5FvTx05hY4my

On Wed, 5 Feb 2020 at 11:06, Gavin Shan <gshan@redhat.com> wrote:
>
> This supports QMP/HMP "nmi" command by injecting SError interrupt to
> guest, which is expected to crash with that. Currently, It's supported
> on two CPU models: "host" and "max".
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/arm/virt.c          | 18 ++++++++++++++++
>  target/arm/cpu-qom.h   |  1 +
>  target/arm/cpu.c       | 48 ++++++++++++++++++++++++++++++++++++++++++
>  target/arm/cpu64.c     | 25 ++++++++++++++++++----
>  target/arm/internals.h |  8 +++++++
>  5 files changed, 96 insertions(+), 4 deletions(-)

A few quick general notes:

(1) as I mentioned on the cover letter, the mechanism
for injecting an SError/async external abort into the
CPU should be a qemu_irq line, like FIQ/IRQ, not a
special-purpose method on the CPU object.

(2) for function naming, there's a dividing line between:
 * code that implements the (unfortunately x86-centric)
   monitor command named "nmi"; these functions can have
   names with 'nmi' in them
 * code which implements the actual mechanism of 'deliver
   an SError to the CPU'; these functions should not
   have 'nmi' in the name or mention nmi, because nmi is
   not a concept in the Arm architecture

(3) Before we expose 'nmi' to users as something that
delivers an SError, we need to think about the interactions
with RAS, because currently we also use SError to say
"there was an error in the host memory you're using",
and we might in future want to use SError for proper
emulated RAS. We don't want to paint ourselves into a
corner by grabbing SError exclusively for 'nmi'.

thanks
-- PMM
