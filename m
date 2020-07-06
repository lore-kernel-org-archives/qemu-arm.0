Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp183446lfm;
        Mon, 6 Jul 2020 10:32:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpqBujpSP0WPpoEAPzuA5DKskZ2hsDsdUZ99yNUHhQoKdJSD5iOv1SdFdMJIoQUZKr1cah
X-Received: by 2002:a25:acd5:: with SMTP id x21mr75326860ybd.400.1594056770355;
        Mon, 06 Jul 2020 10:32:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594056770; cv=none;
        d=google.com; s=arc-20160816;
        b=ihoAjK/87H28UyEiCmitTf0nKb7r4WbNlFZezdgOxFbIGc8w+EUf1Nkd0oxcYC5mKA
         3fP2VMHJxd/QKGjJ9r0BDIOVRTuEY2Zz3rWdbtSh9Vi7lgflexT2tBcDce7/3+PnUtp9
         3bZmzalPPhO//9qmmF1v0ds0xarfecPMlQAbJwamhuPNJ7y32BJiMBcwKS3P0kgKF2Id
         +urz7iLJ8BrMZ5nkQDD0c+4/Nzr1LqDTmAlt9PxyvLCHeBw5Swe9Q+gKvAQKd5/xgeYv
         YKDxpIxeiKMfXdyJX7GxNGxRd5OCQ7KvzBYIJBtPibxQ0BWUikZq+t4qBKDSoxNyAFUR
         F24w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Qjmg6keciKQ+VOMeBpL/AW2YN1J1Kn6ACCJR6VlV+qI=;
        b=OBGuV+lcFVKISp2W0nr4/nai99YuarUc9x8Duqh2oRAlNV54fXAzVSrR94zfcctD78
         HV0Yir1i39tPIY2GQ+1iJ0UOZdwzHGXLpC/f+Dybjzy0bCXMDWEJKrrK2A/U9LC2OPPM
         uuwyrJp6xAHW3LxKzpdyWsqvUq+Dw4vwqKWuqcXJFkYLaXf42wjCM3qKdRz2Aq/VMIS5
         BSHJOa1b9dfob3V5pq5RvVEO10duuXnYTVPxlXMv+f5QTXTwoILdttymBX1MK2iUPaJo
         npOIBO+81AK6eZsqqZdnJ13lf5+ElQIBpjUPn0LHVF4WOxgsHIDpe+WVM2ocAEbkk+sh
         Ak9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OwWaKMMM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r4si20085645ybo.358.2020.07.06.10.32.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jul 2020 10:32:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OwWaKMMM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsUz3-0002Mw-QB
	for alex.bennee@linaro.org; Mon, 06 Jul 2020 13:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsUct-0002gN-Fs; Mon, 06 Jul 2020 13:09:55 -0400
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:38750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsUcr-0007ch-Mu; Mon, 06 Jul 2020 13:09:55 -0400
Received: by mail-il1-x143.google.com with SMTP id s21so18390706ilk.5;
 Mon, 06 Jul 2020 10:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Qjmg6keciKQ+VOMeBpL/AW2YN1J1Kn6ACCJR6VlV+qI=;
 b=OwWaKMMMP1QFjMhkzf7cgTSnKgDIc5+avykkBDKL5ShxrEZIh2B9WQ4e2zfIOytV/S
 nT2xYaD/K/Vz5l0Ackv84a76Sz0UM/YC/GgxV/iqLEOpTvzEuxbqE411kHshEjoTjLro
 D8tn/C0W0XdheqSqYAmla8lSsnywSVsKq0WHgzdFTlrA5qHkvSACL4/4KkAEjFI5VhYv
 yu4z/Z1UQT1x3Xag1s1raH6NdSUSqtqIsUOrtWYSlMNZfedghH8nGN5g6ZLmqfd1X3fq
 1n5JPWWntS7W1kO4/RKlZkXlSU9pqI4NdubmRt+GADA2vNbCuw3/HfBUFwD2kp5Wgsvr
 AJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Qjmg6keciKQ+VOMeBpL/AW2YN1J1Kn6ACCJR6VlV+qI=;
 b=e7JvzPmQvBpxb8BkBEiozOCZgxY0Vpt8JFdOdhWp4x00Mdj6i5dL4Oe4Oas2q1gFlk
 qdd6zdZV98lka2iZ21+SHVsECWX5gHe0DzMAF4Cy/z9I2tuHnuBYU+kEm1OWyTSc83O/
 tk5ef74ygfzlSUEQk+9C76uHc/RLpuANqec0GZJoWXmyS+rGMmMzsmwQYbCI+TphIOPe
 UgVNS9IHJsoepl/hEJJS1ujEDms+nk1zi6eJNftgl4wz5quMdHDAd8PNdT0GF2dhbqVo
 eZ6UQx3SyhMllj2cSNEjBYtKMTRoqLp9le+Ix8WAKoD6DvRc66xDkQp9/X30cnmw2YTz
 VTdg==
X-Gm-Message-State: AOAM530OmGoE4gaVBWKq6bieSvoaqclp/GqZqTJsgCdWAWyviXiKxaCb
 SX8T9LYCbAgFbK8eBh5JLxtJvx3bpX6qdRrCvPo=
X-Received: by 2002:a92:bb84:: with SMTP id x4mr32234878ilk.177.1594055392114; 
 Mon, 06 Jul 2020 10:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-11-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-11-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 10:00:05 -0700
Message-ID: <CAKmqyKMUWZ9BsEeZkiK4-_MAhFpZO66MKQNhoZ3q1FT+XZie3g@mail.gmail.com>
Subject: Re: [PATCH 10/26] hw/usb/hcd-ehci: Move few definitions from header
 to source
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Paul Zimmerman <pauldzim@gmail.com>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eYb5pEsmxurn

On Sat, Jul 4, 2020 at 7:53 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Move definitions only useful for hcd-ehci.c to this source file.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/usb/hcd-ehci.h | 11 -----------
>  hw/usb/hcd-ehci.c | 12 ++++++++++++
>  2 files changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h
> index 57b38cfc05..4577f5e31d 100644
> --- a/hw/usb/hcd-ehci.h
> +++ b/hw/usb/hcd-ehci.h
> @@ -24,17 +24,6 @@
>  #include "hw/pci/pci.h"
>  #include "hw/sysbus.h"
>
> -#ifndef EHCI_DEBUG
> -#define EHCI_DEBUG   0
> -#endif
> -
> -#if EHCI_DEBUG
> -#define DPRINTF printf
> -#else
> -#define DPRINTF(...)
> -#endif
> -
> -#define MMIO_SIZE        0x1000
>  #define CAPA_SIZE        0x10
>
>  #define NB_PORTS         6        /* Max. Number of downstream ports */
> diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
> index 256fb91e0c..a0beee527c 100644
> --- a/hw/usb/hcd-ehci.c
> +++ b/hw/usb/hcd-ehci.c
> @@ -36,6 +36,18 @@
>  #include "qemu/error-report.h"
>  #include "sysemu/runstate.h"
>
> +#ifndef EHCI_DEBUG
> +#define EHCI_DEBUG   0
> +#endif
> +
> +#if EHCI_DEBUG
> +#define DPRINTF printf
> +#else
> +#define DPRINTF(...)
> +#endif
> +
> +#define MMIO_SIZE        0x1000
> +
>  #define FRAME_TIMER_FREQ 1000
>  #define FRAME_TIMER_NS   (NANOSECONDS_PER_SECOND / FRAME_TIMER_FREQ)
>  #define UFRAME_TIMER_NS  (FRAME_TIMER_NS / 8)
> --
> 2.21.3
>
>
