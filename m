Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp179202lfm;
        Mon, 6 Jul 2020 10:26:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxloH2NLX0DAD0TftO1Ntw7SE8zzhJeDk23Witqr6edB81lQZvdCnbWPRTooFiq9+WcWlfl
X-Received: by 2002:a25:9cc6:: with SMTP id z6mr77695ybo.425.1594056404392;
        Mon, 06 Jul 2020 10:26:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594056404; cv=none;
        d=google.com; s=arc-20160816;
        b=uHnUGIbpOGRSXQu6RVc6smHFvZwAS67djPDr7pdCUNSAWLJrvfae2tIk/obi2H0Ar7
         UpE3r5E/vsOSHPd79o9JfcUFaN5iYbPLDqBPar7xNexIFdJxfi92JAXfjeRZk0T8ZFip
         yN+ZtO5XfTNXUgGfeV3lcLa0bRpMrOl9qC91VoeT9cwDDtc5l2Rr/UDF7ZvAqCzs/zyW
         ik5d18PUK6dM3uifb0t6tyfhHAQ0pFHDDEka2o6k3JH6R12SSmoclSP7h3yJSm4D8N9t
         A9fYaWeODe7IDFGJ3UKRILvMM/dVnib1ORgKyQUrKYaDfqAduBJHCzku9qCHk17Eevth
         25yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=X20uXtdA36wJdFmnL5kXE6ANkGPKNtErzQUg9fO43F0=;
        b=n7CB34ABJSE5PUpIziaI7bOhkYU8KCm/0bPSvdPdYtLOO6kCagFcyDcuZSiFewsKu4
         XrPQRisH1MkbSM7I6v9G3ke1zw4d5+KTTuvWttKBjlHHgIEYqcDnk3BgTqKaOW6NRXp8
         IEKL4rhdrSwFKQQOCxJMr5mN+Zs97HjVFn4CBqDG0JCUuC0ok+sMUa8EsRZNpRVVe8jK
         tVfAvOrDCDzl7AtH4hNWNhOGPeM7tNgrzLflimzVgslwp4HXlXDUoV+k/SV0D06V5iRS
         9HjjrF6h9DZhKAf9uoWGEma+cZIlpFA/tSrmt3cVmt88TAyW5PHheVNf4TWrQzQBhjg1
         FLwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="WKa0Lnp/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15si22048603ybk.132.2020.07.06.10.26.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jul 2020 10:26:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="WKa0Lnp/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsUt9-0000yf-R8
	for alex.bennee@linaro.org; Mon, 06 Jul 2020 13:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsUX7-0005s6-Ih; Mon, 06 Jul 2020 13:03:57 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:46099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsUX5-0006iM-Ti; Mon, 06 Jul 2020 13:03:57 -0400
Received: by mail-io1-xd41.google.com with SMTP id a12so40146728ion.13;
 Mon, 06 Jul 2020 10:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=X20uXtdA36wJdFmnL5kXE6ANkGPKNtErzQUg9fO43F0=;
 b=WKa0Lnp/4ENw4KYTm55Jp0CBKAAjECKb63/NLtirFrXqJWtjy9YARPnCGw4sN1rNjC
 xj+uAS77lFX7Pw53RhXebWVJDzr039uCYSZgLleFMvlnZrE5XzIgVJuamrvJYBrcM/gQ
 OgQk5oxwJFsQp3xnl3IN5pjJdSv5RpRJknYyuIngvcAGV+aEd3GH78GbDWbSR4txus0n
 OjkePAGPpMQG0Jj3txMJqRtyrJ1n41/fNix/mk8Dgmq6xf+CrzKD4xaDg7J5pIzH5G8L
 K1zDdXydsLx9rQ7CiCTvJ1PTLelBs97/0EipVuw22nVvFXmvZtr9fBmOY3leWsb+Ctmx
 sPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X20uXtdA36wJdFmnL5kXE6ANkGPKNtErzQUg9fO43F0=;
 b=AdfbaQSHXJcsccvB+bt2xV5o3S/dq4qrlFkDSKEGZ0XVlyLaUcixYFnChvRM/jAkAQ
 kKYT2HYez7PxrpgTiC7zc0ZkjkHehf9H7CfvvgORlyX2eGii794X5BfGjIz5dPN2cxTX
 oUEUhLmhJSCoW1MoznH4vlV3fs9duYoQTbwwY21tz9IAvNJZF2XiloN1anODPLIFUkSZ
 1bgoI6DMja6xABsFJ5Aq70Q7tggZuhNNwe4d+T8xwsXpjWcPnI0KKMDnxRbeii+Oj3uE
 cVWRQBbTTGsKKDUonMV5ic+egzrgLK6WAZhV3gI4qKJNBU7cGOnn13p1DlpARoOzPCow
 DFww==
X-Gm-Message-State: AOAM5328Y4qRiSj5vXOagw5F+1eRQvsbBBZyZWzRFrupNoN/beajsmyh
 Ac1xcY9LEqzXWz74EkCjZvYZOk2jR5z8Jp/w0Do=
X-Received: by 2002:a5d:9ed0:: with SMTP id a16mr26245576ioe.176.1594055034056; 
 Mon, 06 Jul 2020 10:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-7-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-7-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 09:54:07 -0700
Message-ID: <CAKmqyKOexZ602pCtmO03FW5x=NzawWSzfHq3puQOgpLbdXnUbg@mail.gmail.com>
Subject: Re: [PATCH 06/26] hw/usb/hcd-dwc2: Remove unnecessary includes
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd41.google.com
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
X-TUID: cxlujnWjQqCo

On Sat, Jul 4, 2020 at 7:53 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> "qemu/error-report.h" and "qemu/main-loop.h" are not used.
> Remove them.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/usb/hcd-dwc2.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/hw/usb/hcd-dwc2.c b/hw/usb/hcd-dwc2.c
> index 72cbd051f3..590e75b455 100644
> --- a/hw/usb/hcd-dwc2.c
> +++ b/hw/usb/hcd-dwc2.c
> @@ -39,8 +39,6 @@
>  #include "migration/vmstate.h"
>  #include "trace.h"
>  #include "qemu/log.h"
> -#include "qemu/error-report.h"
> -#include "qemu/main-loop.h"
>  #include "hw/qdev-properties.h"
>
>  #define USB_HZ_FS       12000000
> --
> 2.21.3
>
>
