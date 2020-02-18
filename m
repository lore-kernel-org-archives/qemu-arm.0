Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5943662lfp;
        Tue, 18 Feb 2020 01:50:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqyQNwZaojm/vkI90KbWGDgASrl91woCLRe9QGheXX6Dx25AjvQCPHwLSd4lCv3Qg46MuAUY
X-Received: by 2002:a37:396:: with SMTP id 144mr17757275qkd.260.1582019447153;
        Tue, 18 Feb 2020 01:50:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582019447; cv=none;
        d=google.com; s=arc-20160816;
        b=OY+Pbf+hgC3MF1QEzNjOPveSYUGHaOUIh+ibNKfBeQcxOCBgtXJrjSGXx9Y51uB5xv
         a54Y7tu3OFu1T4zbOoo23ATe27AU4qsv8xb/0qKWZmmrTpUfdguPc22Q0dGyslmY4IeT
         qPHqF5NEamRFvHajpLrFJYSksf2D5ZRhrcNDhOnafeiOdI2FzthIyISPdKGF+NUXSllP
         DDibWDvPp6az614JpEfLWaiOBT3bL/LI2s1bM79Tr83W8hN9bhvTcZRiPulb8qh3qCAV
         DoQdwFWV7y7aJDjJjSD5la59FL10xuYAtJa3QdpgYF2/nItDtTXsoXNarHabqwwT6EX0
         XD3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:user-agent:in-reply-to:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=R3AO3tmIG7efoBv5HijqT2xz+05at74+b9OgZQ+Bdw8=;
        b=RAX+T/6JKZlu73WG4IFNu/NlhcmMouU8xWFcL0I85pm1AwY9dhqhoaMM5AEi3Gcvp5
         tTaPr3ydlmO7BslDB7Bi9KgGH+kKwLvIx0wT0+sBEitVrGNlvLj/TAjLL8u8kZ0dY6M2
         cgWkC8mIW4DCUcEdMUljRGJFlOs81CRSPke1QDxRbAO5shw3MyAJ5txcmh2hdh41HMzT
         PAeCpqyKZEaNUUtbyRn01/zxtHtCXCE46ZJc7CfPJs+Vw9M00k9outHXArf6k6NoVCt9
         vZMnwC6BCTjR6JznqDc194xA5LHZrAj+XP8QYnMCLG9ANcfi8/N2g7a8sUPabzMaPGpR
         BG+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WkiqGwBA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7si1581428qtl.44.2020.02.18.01.50.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 01:50:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WkiqGwBA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zWg-0003G1-H7
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 04:50:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44759)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1j3zWU-0003BG-Ob
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:50:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1j3zWT-0000tb-PT
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:50:34 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:48431
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1j3zWT-0000t9-LU
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:50:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R3AO3tmIG7efoBv5HijqT2xz+05at74+b9OgZQ+Bdw8=;
 b=WkiqGwBArbJha3vf228aVuJGdyjjf0zvu4ao0z6TyDJkskoDn+XJIlylnWYpdBJmn+GXjm
 TOsp25NNT4BDKJGIysGRAE3qkPHHAKP2r0ZhjAJr1105GYLPKZrGAn7uGXx6CixJyLym00
 vIZjBodpoSQnvTGF9aV0QGGYUTaKmg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-0dQR3SJTMIixBS1HsBx3qw-1; Tue, 18 Feb 2020 04:50:31 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 228DA8010EB;
 Tue, 18 Feb 2020 09:50:29 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D7951BC6D;
 Tue, 18 Feb 2020 09:50:08 +0000 (UTC)
Date: Tue, 18 Feb 2020 09:50:06 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH RESEND 02/13] audio/alsaaudio: Remove superfluous
 semicolons
Message-ID: <20200218095006.GD3080@work-vm>
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200218094402.26625-3-philmd@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 0dQR3SJTMIixBS1HsBx3qw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <DirtY.iCE.hu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Julia Suvorova <jusual@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wp4PGJHYJH7f

* Philippe Mathieu-Daud=C3=A9 (philmd@redhat.com) wrote:
> Fixes: 286a5d201e4
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
> Cc: "K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n" <DirtY.iCE.hu@gmail.com>
> ---
>  audio/alsaaudio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
> index a23a5a0b60..a8e62542f9 100644
> --- a/audio/alsaaudio.c
> +++ b/audio/alsaaudio.c
> @@ -819,7 +819,7 @@ static size_t alsa_read(HWVoiceIn *hw, void *buf, siz=
e_t len)
>              switch (nread) {
>              case 0:
>                  trace_alsa_read_zero(len);
> -                return pos;;
> +                return pos;
> =20
>              case -EPIPE:
>                  if (alsa_recover(alsa->handle)) {
> @@ -835,7 +835,7 @@ static size_t alsa_read(HWVoiceIn *hw, void *buf, siz=
e_t len)
>              default:
>                  alsa_logerr(nread, "Failed to read %zu frames to %p\n",
>                              len, dst);
> -                return pos;;
> +                return pos;
>              }
>          }
> =20
> --=20
> 2.21.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

