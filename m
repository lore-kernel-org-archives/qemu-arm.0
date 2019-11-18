Received: by 2002:a19:fc0b:0:0:0:0:0 with SMTP id a11csp191633lfi;
        Mon, 18 Nov 2019 07:28:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqwONraUMFqakeTrAdvLwlXVBGfx5JvnRb8nBhWvt/Hm96qbiMzrTUCtMSmDMJd+whB+FSIm
X-Received: by 2002:a05:620a:101a:: with SMTP id z26mr24178867qkj.344.1574090924402;
        Mon, 18 Nov 2019 07:28:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574090924; cv=none;
        d=google.com; s=arc-20160816;
        b=i+yt93G8p00W0wGmBdsj82HPAL+sCC1JZSKh8cv1nhzpdBIXiQUgPm0cEy+zBZB2li
         fYwVilVMW2K9nhenEMartesorCk1MD1K6VkyYLBN8juxTs7cJsUUAL/KdhXRoXd7j/SU
         7pxmJ3pgm4SdsnQBkrS73FIKM1fOcpVnBq2TivPzAThaLp7z9guiSO+VubpEsfd9CjL6
         MKDILxaEnzYrjuoUlc7/kqSRfJTgVpWaQSXSrHPBJFoJ8f8ySDLGkt3uJfDKGgNjB8um
         IdWYtVOJXX5DBTuTAtzwAIo/K8IHpe5GXTt89a3UAm2iIfpwDe/cBRYjlE4ZVF+zVQyH
         i2mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=7afJ7tzPngtye9+ZMXHFHBKQgLixlBBO+3uIN0csNZk=;
        b=j7+o21VYuzJ45DByjkZ98E4HKqL9LhJnU3SsRmwOv6x0jg4wfgPi0nadAq1v5lTlmI
         8LplUgJjKuoQHzTZ4vVTuzA4nE/KUwMm0ugEF1ct67V/kyj6UT3Z+RyTE3C+A+ARSL3X
         lGIlnT9pL+hMEmpYMrWQ0sFC8NacCEoTzp1MSdzkSzdugHzBwd1tg7Zthl/Hwid268F/
         +D15+NsEMNBYomantInJNQZ1zPyXaV8tST5BlXXs6jXArJ62rGCVDELY4U/GGsoO28FF
         PCB2ONeDj6tCtcN215/HDaPPU27Zi/0ymbZyfJcDaPOgbz95IoCOKJlGnkUFKc96ETA1
         mWmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VEwhSkl8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6si11534180qte.106.2019.11.18.07.28.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 07:28:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VEwhSkl8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWixH-0002kO-F7
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 10:28:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37542)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iWix3-0002i4-2S
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 10:28:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iWix2-0002WA-0Q
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 10:28:28 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:44208)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iWix1-0002VV-QX
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 10:28:27 -0500
Received: by mail-oi1-x244.google.com with SMTP id s71so15627331oih.11
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2019 07:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7afJ7tzPngtye9+ZMXHFHBKQgLixlBBO+3uIN0csNZk=;
 b=VEwhSkl8ChEcPJNybye8+pdh9412ki0N9z9zjJh7a9eLt7hILBIFqkXrc/u9FR4aGM
 zQ+GE4RwE7ePGTIv82Gn7c3EUeSJ2V8Ln5zHKGqWXtbQL1zJhn/pEMHLq+OHBgtpl/bo
 0d0nV/uj3OKjzh8FXhuK14gzCApwGGKU1r65UZg+k4wapFMsEeR0PCHBSvohoKJ0H+yC
 XHAmt3kXdt7cUbNNmcHFADbc7iV1dtgXm1PDj3RLGuGBewEzw6gpnMuvIs4V5QsUDice
 CSbdT1Kr41+w3Npdv4fphpDhATfyJajwcEKzqagFQGLdRHXK5x5zpoC12R+tSvFUV9Js
 PaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7afJ7tzPngtye9+ZMXHFHBKQgLixlBBO+3uIN0csNZk=;
 b=WarjXsy4lUBslDPj0zlGL0AcQBLDQUW4jM/G17MJJ+PAE9ZRVX/5sdWqnCW4Fswyj5
 svESXmSWBCu/XljX5x2Y+rHBE5qMFmwGCIr7q1k8Mm8aidvwrTVcCuvV1ABgi/70tVDT
 dDJEqY7h55UZ1JRQWuFJsjvPEFwLfefvmhqRbGk/iA24aD0ZuLbOa9DE/RBWHMNLQUyK
 tazwm6JJWSlwWdlR1YlykTjWAUU2snfSKKkIN50/0H12SknXMFGW0GocK1763bTeOISE
 2KIudP+Vm1n7kyIwakl8wl4GeRwh8dIx/fRcR6kTibatPY95GATjo7MqGrSA0LUDdjY1
 ye5w==
X-Gm-Message-State: APjAAAU8YtxH9JtZrM7Ms7SrhVD5gSHNinn8OLc29TDTf28SS7gr6xep
 PRjeDK9owrVyQMv+7ZWxIqbICDVUlbpeK4rCYfx3xg==
X-Received: by 2002:aca:a9d4:: with SMTP id
 s203mr20061094oie.146.1574090906952; 
 Mon, 18 Nov 2019 07:28:26 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-23-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-23-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2019 15:28:12 +0000
Message-ID: <CAFEAcA8tQ4Hn6Rm5_DeQmo5JHk5Debp_qGFqGoFvJu4Srh3sQw@mail.gmail.com>
Subject: Re: [PATCH v3 22/33] etraxfs: remove PROP_PTR usage
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Paul Burton <pburton@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3Upyn3zLdU7y

On Wed, 23 Oct 2019 at 18:34, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> etraxfs_dma_client are not Object, so can't be exposed to user with
> QOM path. Let's remove property usage and move the constructor to the
> .c unit, simplifying some code on the way.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/net/etraxfs_eth.c      | 44 +++++++++++++++++++++++++++++----------
>  include/hw/cris/etraxfs.h | 20 +++---------------
>  2 files changed, 36 insertions(+), 28 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
