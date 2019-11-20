Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1430867lfc;
        Tue, 19 Nov 2019 19:36:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqyOT0pjPEYoYkPb7rS9wabF9IDheGR6jv2QxN2goeZMTNy4AzEy47kXcGyRerfFVtmzLXui
X-Received: by 2002:a17:906:944d:: with SMTP id z13mr2049223ejx.58.1574221011536;
        Tue, 19 Nov 2019 19:36:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574221011; cv=none;
        d=google.com; s=arc-20160816;
        b=QJ+EIX/hwcqFpHa2homKT0We8qKFrbFkHcWjgydv3d5WJenCrYwQBnhkw+e26WrmA8
         Sw42zxtdRiKy6CW9baLCeJKWzAi6yR6I7Eh4KkN7XsVuHhZSu09MpsYwHIXfsgTzSTeJ
         KEA39+wfVOCREOUeNImQRCh1ZuRfgsP4+nn/Lg6SGd22Xd6E8RkgpKAvIhka75LcgVHe
         D1yHC7PonequhOsgKrlh+KEUp4rCpfTzJ6ZgxSJhwZncvtt7iykFcfa5NPXLoFoK2dFk
         WZFCtfVz7G69cI2KetOXg0FU2aBaWD7d5dNmhHw7JsrROWRJl2ogyDYFaCOl3CcmNy2N
         W2LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=wSKl4ZjlxedUP+FlAu7TIdnnUEwTf0V/UY+HsjFaX0Y=;
        b=eCEUKcAY//S93cnJNJzWbV4QpOz8DLDuPzsdARVRTYzp9iC6FUlcSB7ed28t/0uG9Z
         53ADPmr/4G048S+aWU5Uy2gvNpuW0brvT6TsvWp7yT8J2va/mlGZULZgGIYT8bQLbcG9
         sS7FumdYHzNGtgfRij5J1aGxbzAwb0PsikFO1eAHrwmn8iFVq2Y036wNYjwT+5uk54bG
         FDu9RQHUcKFQmXyah5uw/1f8w+O1qr9djPVt2uGDBNJzvhbJUbqiLv0FzY9zWUkskzOy
         tbSmJ6eU/MQmSRQowFhMfv5hwaL3B7Iw6iwvOVUEzytBnmSIOuFhbIwbnPGqQYKCyvOc
         GdHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="J/GRzHwI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z31si18316886ede.236.2019.11.19.19.36.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Nov 2019 19:36:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="J/GRzHwI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iXGnS-0004U9-82
	for alex.bennee@linaro.org; Tue, 19 Nov 2019 22:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44871)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlureau@redhat.com>) id 1iXGnD-0004Mo-Io
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 22:36:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlureau@redhat.com>) id 1iXGnB-00051y-EF
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 22:36:34 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:42553
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1iXGnA-00050D-TP
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 22:36:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574220992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wSKl4ZjlxedUP+FlAu7TIdnnUEwTf0V/UY+HsjFaX0Y=;
 b=J/GRzHwI0Fgh5t4H3XtX+CrrZzlABSyde2YZTZ72XSv97h66f9eyLM++rpBxzVdVGRpMfI
 ODg9vkql7hcfiSVzKhJGENAZYekUEZIYcPYS81lD8fV7U/ZrLO3dAG8kkg2Hf9B5fhnLCw
 OdW1C4x5qEwWKiVsaOih8AohJ6/e1MA=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-cMvyeVlIPo-Ld2PUMkeuxQ-1; Tue, 19 Nov 2019 22:36:30 -0500
Received: by mail-ot1-f71.google.com with SMTP id 60so13235144otd.19
 for <qemu-arm@nongnu.org>; Tue, 19 Nov 2019 19:36:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wSKl4ZjlxedUP+FlAu7TIdnnUEwTf0V/UY+HsjFaX0Y=;
 b=pKhMwC7e22eLRpClK5u114yzEJz2SHoHgtdAUwYncnHSSbaJHI9wuWSvXrhqBoWzZ1
 cNx0QVu4vde3kG14rQZrgPRDyGL9dlW4g8CU2fjXqM8NVc0K7nSaukeNNTkedaXFPqKR
 vP1nLRpXGMArwUrdlCmOKcOdp9DXiCUOg/PPoZ2EOFZKxauCeeE9pMW7z5KXZWnuzc76
 7l5BIapshPET49AAwp9J25TEq2qGgypUd75T3n6KTpvb3GVqLMxeusIpvP1Zc/UJqml3
 Tw6fjgIvO2wWZ8X1M02id6eFVK0xx2J5TCuL3Gx2P6nRh6/GF6cjXM3HwMM1zY0Fz4HD
 /54Q==
X-Gm-Message-State: APjAAAVkJCeY1zITQrgJf3RfI3VZULaiqZtkxDnJH+ZCAWSQrf9tbf7E
 uOgISzwuD70A/1OhynsJKT7xJKp7tftq+L0vCPoEvW6ipklK9kTJenaO589RYBBFOVt93sDtA4k
 AVvVxmiwcuR0ElPPGDwnoXa/IvXSo
X-Received: by 2002:a9d:5cc7:: with SMTP id r7mr242478oti.331.1574220990099;
 Tue, 19 Nov 2019 19:36:30 -0800 (PST)
X-Received: by 2002:a9d:5cc7:: with SMTP id r7mr242448oti.331.1574220989481;
 Tue, 19 Nov 2019 19:36:29 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-2-marcandre.lureau@redhat.com>
 <CAFEAcA_k9TqzRJZ4=Q1jQP46SajiaMLEciSHZ83_CicMv__oiA@mail.gmail.com>
In-Reply-To: <CAFEAcA_k9TqzRJZ4=Q1jQP46SajiaMLEciSHZ83_CicMv__oiA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 20 Nov 2019 07:36:18 +0400
Message-ID: <CAMxuvawFVf=6-GLO59T=v+W0vrhYVYuj0w30Oi6c7Zsen7Ri4g@mail.gmail.com>
Subject: Re: [PATCH v3 01/33] qdev: remove unused qdev_prop_int64
To: Peter Maydell <peter.maydell@linaro.org>
X-MC-Unique: cMvyeVlIPo-Ld2PUMkeuxQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Paul Burton <pburton@wavecomp.com>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 Magnus Damm <magnus.damm@gmail.com>,
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
X-TUID: ASb1Wsz3DZHj

Hi

On Mon, Nov 18, 2019 at 6:01 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Wed, 23 Oct 2019 at 18:32, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com> wrote:
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  hw/core/qdev-properties.c    | 32 --------------------------------
> >  include/hw/qdev-properties.h |  3 ---
> >  2 files changed, 35 deletions(-)
>
> I think I'd rather keep this. It's weird to not have a symmetric
> set of properties for the common integer types, and annoying
> for whoever next runs into a need for an int64 property to
> have to reinstate the deleted code. (Yes, I know we don't
> currently have int8 or int16.)
>

I don't think we should aim at being complete. Whenever we identify
dead code, unused for a long while, we should clean it up.

In this case, it is even worse, this has never been used since its
introduction in commit 07d1d063d3235c02f60dc92ec174d419e6f8a750, in
2017.

