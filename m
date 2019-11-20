Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1646624lfc;
        Tue, 19 Nov 2019 23:54:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqwPz3Xys5NP6KtVTXrvYvTr4yrwFCExwXFsTp+/N81gfE5VkT3hVUQQX9XmJJqcBwFKXsp2
X-Received: by 2002:a17:906:958b:: with SMTP id r11mr3483338ejx.332.1574236466086;
        Tue, 19 Nov 2019 23:54:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574236466; cv=none;
        d=google.com; s=arc-20160816;
        b=ptQQ2WfYA5aJeuu++l2TePfAXMCFaYYO58+GikhqOirr3W8Qo3liRWs1L6IyHX4nFX
         3dtwzLPK0yMZHxFOIwu1VrwGK8gNsugJKmplDSatneGHF3J6k9D1zTHayoffDmixXHA+
         E/ePs0LmrWkemIW+BkZa3o1pEQ/4YDurh+HwjRhz7fHUoENvW+nkB49Opq2hJrJJehk6
         yhloh5crCkvw7RK9F1ZIpAaWbGXJedY0ZNf0/AoLUSqnnPa0ShoXMfLkpxMtKrEEnd5Y
         C8KcqYRdWd4fsxH+TYRsetif+t+Tnkcu3ZbcoSf2LPzujre7obsQa9D532UasIGM8/9x
         e1AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=PMnp8xixLPxtFJR0dofL8FX4sA0PXxq+DoOImcWkX7E=;
        b=Fjn3kOXSoaZnYZrhsWt4Y4oFnYHfzZC/WJmyez702CMVmCxth6cpUCDH4NIxeuImJW
         uSYBgWq1O/vS0gbMJEfTEC3m4cqJv/4de+P4oMyuaDvGgeNgSjolkCTN4hMG5nwGoyt/
         7rOA6WNTina8l7IRyeLrspzHTkveG2byzaNE393/BLd6HenHPxhDfw8EJ5lVbongHT0H
         vVxHcJCV3tLJHrhU4XODwuLLbPs0BH2GefgwFODZAPhv0GGzLJI3A88ImPDx7LnEvnfm
         1wUaAvVNXxCo79Lx8wo+Qc8q9cfLyKfy7qw2sSUSrw0Fs92KPetnnDFBP01PUGnfaiI3
         lItQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CY6w4JfS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o21si7287876ejj.188.2019.11.19.23.54.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Nov 2019 23:54:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CY6w4JfS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iXKoi-0006Xd-NK
	for alex.bennee@linaro.org; Wed, 20 Nov 2019 02:54:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60574)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlureau@redhat.com>) id 1iXKoY-0006Vi-ES
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 02:54:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlureau@redhat.com>) id 1iXKoX-0002zE-BG
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 02:54:14 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33459
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1iXKoX-0002yD-7h
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 02:54:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574236452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PMnp8xixLPxtFJR0dofL8FX4sA0PXxq+DoOImcWkX7E=;
 b=CY6w4JfSeNrKsQPhQfsjjGmP+HRzDjdE4J6yM0777c7L1BJzcrzJ76kqYcCn27LIFu2SZT
 51D2IbucttAjMy5UtkSWFJTrFBiSJJJ8o1T7yYIVaI3VSJNf5aHiT1aZbLVrWjsx3VXnvU
 H7BFaJMsgtPSDYmiuNxGnEFtXPSeI3k=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-BFaIMjeENIOmQ9ZVkorKmA-1; Wed, 20 Nov 2019 02:54:11 -0500
Received: by mail-ot1-f71.google.com with SMTP id 9so12307043otf.16
 for <qemu-arm@nongnu.org>; Tue, 19 Nov 2019 23:54:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PMnp8xixLPxtFJR0dofL8FX4sA0PXxq+DoOImcWkX7E=;
 b=Hm8D/1M5y6ywD6en6F16Bw7Pk973Myy+rBGWfZfZQDP1Qhm3PlqK8pv1mzGYkCyjy6
 qUaXvGaIOQboaxcvrz/yd2l0qGSZfdtTGQUnzexgq32f4yY7Qsks9JVB9M7dgeqTqYA6
 yKRjxGvVVI3g8AjymsiiiPUSLhuX2pmUfTYCCI78/ZKluvxP6bhf8kpYNvs+rQrAsfjD
 vY/F1fWMZpqZmdqJ1CSuVP47hvzWyD1ucGFfyXitar31DV/xJZLRkEhTD17cYiNyBA9B
 hYTAARX5OEjUVvXK85ozA7YXN209ZvZWfAOhvfkSmsi66yhuKTXkCSxDtIS53XXIoOmY
 6a9A==
X-Gm-Message-State: APjAAAU1p0XOD8LGUygWeif8IKpgiUXyoOEaQoKqbfWR3BMNUm42qRXW
 q6YwOQMsM85YJDuSOf25TngqxR2P4s4ksYy7nSeWchsc8XnO5VdhvQuskodZtLCdeKHxYKLHds2
 DY5k+z8bk5Y8LGSdw8M814MeSAAbw
X-Received: by 2002:aca:4c14:: with SMTP id z20mr1631760oia.76.1574236450658; 
 Tue, 19 Nov 2019 23:54:10 -0800 (PST)
X-Received: by 2002:aca:4c14:: with SMTP id z20mr1631730oia.76.1574236450422; 
 Tue, 19 Nov 2019 23:54:10 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-15-marcandre.lureau@redhat.com>
 <CAFEAcA_2ct-fOfBGgNExjCrjg7WKb-Xp44GghHWXiW2+3HjWbg@mail.gmail.com>
In-Reply-To: <CAFEAcA_2ct-fOfBGgNExjCrjg7WKb-Xp44GghHWXiW2+3HjWbg@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 20 Nov 2019 11:53:59 +0400
Message-ID: <CAMxuvayTGh6d5H_JXnKRoG7E1MeY-dsw5XqSeR59fdM7njPVeQ@mail.gmail.com>
Subject: Re: [PATCH v3 14/33] serial-mm: add "regshift" property
To: Peter Maydell <peter.maydell@linaro.org>
X-MC-Unique: BFaIMjeENIOmQ9ZVkorKmA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
X-TUID: EA7tYDAeQlHf

Hi

On Mon, Nov 18, 2019 at 6:54 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Wed, 23 Oct 2019 at 18:34, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com> wrote:
> >
> > And a property and rename "it_shift" field to "regshift", as it seems
> > to be more popular (and I don't know what "it" stands for).
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> I have no idea what it_shift means either (I had a look in the
> git history but it seems to have been added with that name
> very early on when the commit logs were generally not very
> informative); 'regshift' sounds good to me too.
>
> > +static Property serial_mm_properties[] =3D {
> > +    DEFINE_PROP_UINT8("regshift", SerialMM, regshift, 0),
>
> This could use a comment describing what the property does.

"Set the register shift value"? Half-kidding, do you have better
comment to make? Otherwise, it's probably not worth.

From what I understand, it's just applying a shift on the IO addr,
probably for alignment/access arch-specific reasons. You probably know
better than me ;)

>
> > +    DEFINE_PROP_END_OF_LIST(),
>
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>

thanks

