Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3484569lfm;
        Sat, 4 Jul 2020 10:20:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8WwXoz30NIra5lkx5cAFRXv6dLORZBOlyLYVHXLjO7T3qx46ckwTQ2J5lfLr8dVR4TdnN
X-Received: by 2002:a25:2609:: with SMTP id m9mr20381616ybm.387.1593883207240;
        Sat, 04 Jul 2020 10:20:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593883207; cv=none;
        d=google.com; s=arc-20160816;
        b=OsMq1LRtRHlHu1WGpM0Cmm0qoKmhInuMLWSo7+UyWNbVoLzhtTfW18ycfTnX51mYp9
         1C8RxBUreOopkA5ax8y+/ecUM79rQXl9orXswkd+qhORCtV/jclh9bl5uDOGmuLStCVz
         zuwviJJG7tpcwUe8JyShqeJRHOBpdGpakWHUwISRs8L5NsjEYLZpay3YrlhJgAT5rvWS
         Dl6DP7K+42tERLpDc7y8/YGtwg2bO1SgJcqI1K++UvhaYCWGbM2gE6iby5mF8kKIx2W1
         caek3f/XeluGXMkccommkZNERBKsl09uI/Nmj1vsCLcml6zrvKgPjqL9ISBZRV0mqveA
         18Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:message-id:in-reply-to:subject:to:from:date;
        bh=wLJPd/WseHKW+Gw8cwiYkmDMXCvKLSEeQeoXKkq65n4=;
        b=JBhHZ+wT+TeGBszZTYe4PaDq64+4Xh1rNLP4VOL6dJkxNiT/l4HLj6T+53kccgjcIJ
         ZQ/G4prPCU1W9Jq7Qv3McPKHuzdRad+dUmlGzA0z00a9DfRZMrvoCr2TP8RMLAG254NT
         K6WP6DsjWthhPl2aKDqgbvvdBR8T37JvcWYbK5rIfBCYx95mgz34P/BOQaOK0TegntUe
         UPAL/h04sX7s+gjCr1kIun6MRmJ6f3Yj9j45UkF8EQWCAKgAZNVxYSDp3wpPRmYe31o/
         lzO6Fuot+lJWkPWMSLZ/oV9imtcMCN0g521hGIJtF10RprRA1F2fmW/c3IQAEp+JoZ4P
         nueQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v84si14949029ybv.78.2020.07.04.10.20.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 10:20:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrlpe-0002Vi-MG
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 13:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jrlpW-0002Th-CQ; Sat, 04 Jul 2020 13:19:58 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:33936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jrlpU-0005Fs-LM; Sat, 04 Jul 2020 13:19:58 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B1BEA74632C;
 Sat,  4 Jul 2020 19:19:53 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8799B745702; Sat,  4 Jul 2020 19:19:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 84B7A7456F8;
 Sat,  4 Jul 2020 19:19:53 +0200 (CEST)
Date: Sat, 4 Jul 2020 19:19:53 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 25/26] hw/usb/usb-hcd: Use XHCI type definitions
In-Reply-To: <20200704144943.18292-26-f4bug@amsat.org>
Message-ID: <alpine.BSF.2.22.395.2007041918320.92265@zero.eik.bme.hu>
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-26-f4bug@amsat.org>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-100065408-1593883193=:92265"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Leif Lindholm <leif@nuviainc.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rCH6wmHHs7jS

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-100065408-1593883193=:92265
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 4 Jul 2020, Philippe Mathieu-Daudé wrote:
> Various machine/board/soc models create XHCI device instances
> with the generic QDEV API, and don't need to access USB internals.
>
> Simplify header inclusions by moving the QOM type names into a
> simple header, with no need to include other "hw/usb" headers.
>
> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> hw/usb/hcd-xhci.h        | 2 +-
> include/hw/usb/usb-hcd.h | 3 +++
> hw/ppc/spapr.c           | 2 +-
> 3 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/hw/usb/hcd-xhci.h b/hw/usb/hcd-xhci.h
> index f9a3aaceec..b6c54e38a6 100644
> --- a/hw/usb/hcd-xhci.h
> +++ b/hw/usb/hcd-xhci.h
> @@ -23,9 +23,9 @@
> #define HW_USB_HCD_XHCI_H
>
> #include "usb-internal.h"
> +#include "hw/usb/usb-hcd.h"
>
> #define TYPE_XHCI "base-xhci"
> -#define TYPE_NEC_XHCI "nec-usb-xhci"
> #define TYPE_QEMU_XHCI "qemu-xhci"

Why is qemu-xhci left here? Should that be moved to public header too? 
(Maybe no machine adds it but that's a public type too I think.)

Regards.
BALATON Zoltan

> #define XHCI(obj) \
> diff --git a/include/hw/usb/usb-hcd.h b/include/hw/usb/usb-hcd.h
> index c9d0a88984..56107fca62 100644
> --- a/include/hw/usb/usb-hcd.h
> +++ b/include/hw/usb/usb-hcd.h
> @@ -30,4 +30,7 @@
> #define TYPE_VT82C686B_USB_UHCI     "vt82c686b-usb-uhci"
> #define TYPE_ICH9_USB_UHCI(n)       "ich9-usb-uhci" #n
>
> +/* XHCI */
> +#define TYPE_NEC_XHCI "nec-usb-xhci"
> +
> #endif
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index db1706a66c..d8b3978f24 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -2961,7 +2961,7 @@ static void spapr_machine_init(MachineState *machine)
>         if (smc->use_ohci_by_default) {
>             pci_create_simple(phb->bus, -1, TYPE_PCI_OHCI);
>         } else {
> -            pci_create_simple(phb->bus, -1, "nec-usb-xhci");
> +            pci_create_simple(phb->bus, -1, TYPE_NEC_XHCI);
>         }
>
>         if (spapr->has_graphics) {
>
--3866299591-100065408-1593883193=:92265--
