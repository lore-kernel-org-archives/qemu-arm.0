Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2429525lfi;
        Thu, 26 Mar 2020 14:52:13 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvDGPJQXuhyeZApZ8fm53r+13maJqcA/Ee6jtou9Qpp8SEFAw7HqbRHlgJefNWbcOJzrbCB
X-Received: by 2002:aed:3461:: with SMTP id w88mr11173503qtd.143.1585259533181;
        Thu, 26 Mar 2020 14:52:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585259533; cv=none;
        d=google.com; s=arc-20160816;
        b=NHqFXxvFVxWoP1ZMvTQIIB34HNsZlUZGBM4dEk7op2M8FQCVXk2jAJteXiojLhz7vf
         osfmWoEmjayiJL1CiAQBz5Ze48RMxs6UPtK0ZyXZ/9Y2MP6vVBOwoEaPGXJAUmUfCUjc
         Y7I35h9jeh8AAIBlFRCDGpj84CDkOGKs97Ko2a+WHVfPzbEKR5XmS8wjg446Zh0G2T0Z
         YPatEHjOKJmGXUeTzD14UZ60scClew39q8ehpwM4I3w08hFFF4QzCEFjWkLStQICAk4/
         bZKqpUoeFYYWWxDnEoGtAI0iJ1f0Qsq23+5wLKyzmSkv8JSno2TW9g3KrKPJz1m3AzRO
         oF1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=eHb0jfKvXVU274VJYP9E1m8sOv0o9NIfCTrQgmuuMxQ=;
        b=lp1jCBjj8hBSxwgnDAIIOYs72b0N2jR4Ay/4Z0ouuwaExcHkGmz57XOvDlWs35NAr/
         N4UPgu/WuRe/CSF6HDlRU8D+L3iND1pC8a/Bb3c9gbS8ovWP8mUWlAw9WV7ibulAJZ/C
         2/QjqaL8t77pR1oQhgrE3jnIX5F1zax9PXLa37H8vSf2wYIT1vD1Qk+0xnckNVDSMIws
         I6dwQin0hlaDxbgDkIvwg38ES/yVSggGuKwMSdKCI/UHiowuOeM6P+jwsYd5zH3DLo8P
         VfK/3FZE4NGrFThCKQWMNi/TzJqM/IkDddEbMAfjP4g3285kDRfzCV1Y8zsDSSd+rY0f
         DPcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="km/Z6bQK";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u187si2304031qkb.229.2020.03.26.14.52.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 14:52:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="km/Z6bQK";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHaQ8-0001L6-LX
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 17:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51501)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaOm-0000Hr-BX
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 17:50:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaOl-0000le-CV
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 17:50:48 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:39526)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHaOl-0000kW-7Z
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 17:50:47 -0400
Received: by mail-oi1-x22e.google.com with SMTP id d63so7003878oig.6
 for <qemu-devel@nongnu.org>; Thu, 26 Mar 2020 14:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eHb0jfKvXVU274VJYP9E1m8sOv0o9NIfCTrQgmuuMxQ=;
 b=km/Z6bQKQvqySinTMdQCbKwMWomhCsjefkMpcfKgD5dpEFIAqVZzvDhpesBR9SGnOL
 X/045XR9qwEddTL/yolS8x5FoidJ7bdxVy1lJMJmEdhrleiVHLZUTSsz0orY1hknqnN2
 +W1s1DrYyf0+lwe0jcyJzJtZrKLWLS6qnluEKfat0vdrhJFgL3Qf1qZqnKfc87ypkgJr
 zAM99meJPbB+IBlIbAt6JHT2f/QOoOvUTkQT73mFkQlgZDqi7vQXQrhdyflfNrWMR+E8
 wtB6x+NGg+Chj6O3uiInCDfW7YsOqUwAbELXElGE8TShGAjAeRPl97oDkw6mtlA/RIii
 4aqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eHb0jfKvXVU274VJYP9E1m8sOv0o9NIfCTrQgmuuMxQ=;
 b=hh21Tj06fcl8t8p4AdmCPi6GSRPYqLvRjaXfwQF9jcZ+KKBRsZkMPziaOixglmoZzP
 FHDioJkmYnBBLIOiaHlTYmyknOwr4fvOnhzDE9c+zO1cCJxQqLG7R1Dd76eCAXTjEpqH
 BITfqizkUvN7yxiJfZ8b0Ikfwh+Y038emFoKqf3LCLgm8wRjNiiDj8fsXVlfBLL/7E/O
 SgnlyW+hp/5MlpnrJvp7PsK1ZDFvX5oZPurCsjNBR9b5FulT/v7QqvKjd0Dmba+SHZeO
 yH0ZVHZAUuZyJPS7Sb10cMz+2NT3dk/4hbTqlL2QXFBssCi7uDmadNBcRZgwpS9ZNHiG
 sgLw==
X-Gm-Message-State: ANhLgQ1IgzUhYRyQNb2oIl3otiFTH1gyHjav8jWCe5XxDeuedoXUY7/C
 NT1L5SKA3tTLovsXK3oEADCSjfKomzGF2WlWLCTiiQ==
X-Received: by 2002:a05:6808:64c:: with SMTP id
 z12mr1837436oih.146.1585259446443; 
 Thu, 26 Mar 2020 14:50:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-11-f4bug@amsat.org>
In-Reply-To: <20200325191830.16553-11-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Mar 2020 21:50:35 +0000
Message-ID: <CAFEAcA9boqPf35M9pEn7wF_McdXBUwoyWSSXHC=O5g8H+Aa=4g@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 10/12] hw/misc/macio/macio: Add missing
 error-propagation code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22e
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
Cc: Paul Burton <pburton@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BGHFY9vDe7fb

On Wed, 25 Mar 2020 at 19:19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Running the coccinelle script produced:
>
>   $ spatch \
>     --macro-file scripts/cocci-macro-file.h --include-headers \
>     --sp-file scripts/coccinelle/object_property_missing_error_propagate.=
cocci \
>     --keep-comments --smpl-spacing --dir hw
>
>   [[manual check required: error_propagate() might be missing in object_p=
roperty_set_bool() hw/misc/macio/macio.c:350:8]]
>
> Add the missing error_propagate() after manual review.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
