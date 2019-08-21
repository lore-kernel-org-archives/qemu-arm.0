Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp276405wrs;
        Tue, 20 Aug 2019 20:17:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyeT5LGgYZUbZGWQXNkQryuJaSHQ7n2cO3zOsRUcNC0q2NQqbfo7z/vwnB4FeXNYCuhQcIW
X-Received: by 2002:a37:4f8a:: with SMTP id d132mr13288876qkb.292.1566357439916;
        Tue, 20 Aug 2019 20:17:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566357439; cv=none;
        d=google.com; s=arc-20160816;
        b=fLjBT9euJCw5TH0gRvwsVRAuvLZEkIfE9zvcVybDQ4SKK/H+1UWMs1tazuv/asVpcb
         CWcDeh0YBynVWYyj9IsPuy3o4Brb+haZ4dNw7oXmUER2kMgdn4toaCSlNaF0HojsCCYJ
         UnDu9akaTVDl9t3qIY2tl5gt5Zm4cTFXdHHz1BZ5buAExGrNwUZkAhtdQsy7/oELtDwG
         9YFEvXUnROvFp6FAtXPcAqzJ8MzzaGo1ArBzazQJvDFJZ3/vTy4A4+dNyaa2m7TzgY5K
         ZfYGyjQZPusbnZAf0hipgILgLkAPouvwzaDJtJHLQcAQL7QKmSLpxyjhi5i6qRAGGaEL
         JVng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=HefSvfC8MkuDZ3t3Fra2/mWNZ34tCHmc7DbjtKktUlg=;
        b=cln0qMQipwSkHP61a9yFdRHvZiGDrP3d15F4gGV8asoUgS1w00ST7+SO8tqyF/oJWv
         puGrELxxplFkIfVagLkmbnQ7mM9R23QPlATlvQlQf+rKySZKv33+AQaX5G9990D75GO0
         kQP9IfWHW4J5iTnM4e2tkd/hgB3Tl3U34OUjcpLSKNCQysp8ISfOSdYRrQv9ttsmaxiv
         NHoYqb63JwHfroWktuy0bZHkujNywlfB+Pu8WBCJ/JU21NEUSSGllnokazuiZbgWSK/H
         0zKbtaZe/FQqPwFqbKJIC9TvupTG4/K++fOr1aaaqt2UqOvJIfNIvTUIO7k/sUUV7oQY
         lSoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=Wwx1eqz4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w73si11970241qka.122.2019.08.20.20.17.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2019 20:17:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=Wwx1eqz4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0H7f-00018q-71
	for alex.bennee@linaro.org; Tue, 20 Aug 2019 23:17:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43630)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1i0H7J-00012K-0M
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 23:16:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1i0H7H-0008NP-T0
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 23:16:56 -0400
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:40085)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1i0H7H-0008NA-KN; Tue, 20 Aug 2019 23:16:55 -0400
Received: by mail-qt1-x843.google.com with SMTP id e8so1328644qtp.7;
 Tue, 20 Aug 2019 20:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HefSvfC8MkuDZ3t3Fra2/mWNZ34tCHmc7DbjtKktUlg=;
 b=Wwx1eqz4a34jRLEMFkT67o7h6p+5u6DkCPdNp/SyGtSlThBv8BMFVxRGBYevzw+s/h
 U2NeRr5CN/msQxu9W+o+d9tmQ51nxiNd1KXPQx0cssydDUSMGeUMdCYmYJ/p7rDJwD6B
 mmpsOrtpMjmPck1KEb0kmEYPt1akRFgHDFTNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HefSvfC8MkuDZ3t3Fra2/mWNZ34tCHmc7DbjtKktUlg=;
 b=XNiDcyYm3mA7cnyGRKbnWGNRBWQkgoMkUrKCgzwSC5n5m26HDNWyWqCkfKq5PTA4Xb
 ioDOEKJy9rKssQ/SakqhubZ6ajs6KdU7GOJs3EL1fJIagFeyDo2BSXocwCq3JbXRaaNG
 e9kcmW9MgOc8T7V2H/MQLwLXhI61QDOs0ewsDtADGXpENOh1jON4VM4F0iBC6SSZjhxI
 MbAOr/Y8h8mkor57BK9luhObM+1rJZ/DBOPw74JzJhoEstOEm9vyuLIdMlFfYJqVPpTV
 t1OnOdCjYaZCRJhJuHXvuaWhYrqSCNaTtatqThdzy+MzKuy8fb/dEPPrefYDMCVRRx3V
 OShQ==
X-Gm-Message-State: APjAAAXtX2qRw9d6VmyD6l4OBq/hiXBhq1hhToDJDMGMEV6FF7WZX/L5
 qwWzPvPi8u+mPDo3+YIHEMTw3mzo0jelRuxoXgE=
X-Received: by 2002:a05:6214:12ad:: with SMTP id
 w13mr7153220qvu.172.1566357414548; 
 Tue, 20 Aug 2019 20:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190704055150.4899-1-clg@kaod.org>
 <cd1f8a48-27cb-5cc5-1fd2-46f1597a7094@redhat.com>
 <20190704101345.GC1609@stefanha-x1.localdomain>
 <b304e4bd-1315-b1be-6c48-add99df92626@redhat.com>
 <CACPK8XdFUO6+Fx17Dry0D2QFhM885DugdvOkWnhgjxPc9VgG2Q@mail.gmail.com>
 <CACPK8XfZq1FvMBXLgS-WHoJy4s_L9k19hLW-XgBNoiY-DhGhWA@mail.gmail.com>
 <f5ed785c-027d-66fe-aba2-d03001b44162@redhat.com>
In-Reply-To: <f5ed785c-027d-66fe-aba2-d03001b44162@redhat.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 21 Aug 2019 03:16:42 +0000
Message-ID: <CACPK8XcG4JRq0hAUPu4+vv-j1TFNwwsu5iv6X9M-qAgm0atTRA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::843
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for 4.1] aspeed/timer: Provide
 back-pressure information for short periods
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
Cc: Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kigioibn5Osp

On Tue, 16 Jul 2019 at 07:02, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> On 7/16/19 9:00 AM, Joel Stanley wrote:
> > On Tue, 16 Jul 2019 at 06:54, Joel Stanley <joel@jms.id.au> wrote:
> >> On Thu, 4 Jul 2019 at 12:26, Paolo Bonzini <pbonzini@redhat.com> wrote=
:
> >>> On 04/07/19 12:13, Stefan Hajnoczi wrote:
> >>>> On Thu, Jul 04, 2019 at 11:26:53AM +0200, Philippe Mathieu-Daud=C3=
=A9 wrote:
> >>>>> CC'ing Stefan & Paolo for a non-ARM view on this...
> >>>>
> >>>> I'm not familiar with the various clock smoothing techniques impleme=
nted
> >>>> in QEMU and KVM, but this looks okay given that Linux guests expect
> >>>> this.
> >>>
> >>> Yeah, even KVM applies a minimum period of 200us to the x86 LAPIC tim=
er.
> >>
> >> Can we please merge this so guests can boot on 4.1?
> >
> > C=C3=A9dric pointed out this lacks my reviewed by. I had not provided i=
t in
> > the past as I wondered if we could come up with a better fix. However,
> > I consider this a good fix for 4.1, and if sometime finds time to
> > further rework the timer model in the future then we can do that work
> > later.
>
> Agreed.
>
> >
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > Tested-by: Joel Stanley <joel@jms.id.au>
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

HI Peter,

Is this one still in your queue?

Cheers,

Joel
