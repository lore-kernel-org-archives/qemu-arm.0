Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp568240wrv;
        Mon, 15 Jul 2019 23:55:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyV8cugtSxr3a8QBGDpksMICsagsJ+0Ij7/1zWPHR8XbJgaR5r30jX+0C5fu3Dkb4tMPevH
X-Received: by 2002:a50:a5e3:: with SMTP id b32mr26706137edc.169.1563260112572;
        Mon, 15 Jul 2019 23:55:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563260112; cv=none;
        d=google.com; s=arc-20160816;
        b=ro0moo4zs84GCWfpKH5AXWbT/PZOdvTYwtqcZIsQt16pyQk62QZhVur+m9QtEI8Kty
         u/nFn/9oEpOR9Mzh0heeI7uBBu8QgWkwJXZk3Uqv1e4V9uyx9+EqASkOEBB2b2EN3jdC
         HMFod5EB+Ht/q2MwTYvFEIqKyw3uuPsyoJl+4wFvNDyCrIgpCnClvlE9VDfQfwWFAzWE
         YohUf//qAtN4kEGBq/G+8yN/e6SfBCBzcO4Cv/Ofm/3iloTxs2+7qL2skwG8/t++l8/j
         A0c1bgQiycZWjRf2jEiZZ9oBclg8rHMzFmFo/bPNKf9BWXv+ipkQUKwpjZTVueORZ5ro
         +VTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=usensxpkP49U49PKDqI42Xxl/kfLbhduueChDwmz3K4=;
        b=IcA5zh3uSclrVZ7Fmiej4GVDhC5PfY1qkxuf5zS9nIaMXfhXu1co+9A7RnYPCs44cS
         hjX1MoZeqMgXhBBlQ5uPoPX58eH9WZELnXYk9sQMVN2kRatkf0gwCBjxy3Lr/3jLqa67
         l9I5WNzHrqn7Ufu3lhxZYrWPq3h+PQz6HImBsGysLFTip5OKYd1sYDdTa9AyrKjXEq4I
         vArQR7Qx6Mt19THSivDjewmqAVB2YQgfdB5kp+YT5tbLoRaPsGzX91n/tWHQ9H7i+o8k
         fB0xRQA5XppqaFYHAkORRottTesCVE3JL2Pa4UJHukdKik6GJ+4Kr6ZVnS6bRwiFt7Eu
         4/XA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=mujOGOqC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g6si10108548ejs.57.2019.07.15.23.55.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jul 2019 23:55:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=mujOGOqC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hnHMl-0006uh-Er
	for alex.bennee@linaro.org; Tue, 16 Jul 2019 02:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37192)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <joel.stan@gmail.com>) id 1hnHMh-0006uN-V4
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 02:55:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1hnHMe-00071k-QE
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 02:55:06 -0400
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:37736)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1hnHMc-00070C-SL; Tue, 16 Jul 2019 02:55:03 -0400
Received: by mail-qt1-x841.google.com with SMTP id y26so18425204qto.4;
 Mon, 15 Jul 2019 23:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=usensxpkP49U49PKDqI42Xxl/kfLbhduueChDwmz3K4=;
 b=mujOGOqC7rBngmL1oo23bhsSFuXzdfTOQ1T9J/1k82QOioccqV5RrWOw6eOZux+Hv1
 zK9z5lLRlndkaMuMF2BWr/o/QNdnDVo4TtKrIyCq5yX2HxtzlKoVDWwr3Q1thdd3XT64
 aw/2GXyPqzq36MhvmPB7WKUe4VfdAUtjHi6XQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=usensxpkP49U49PKDqI42Xxl/kfLbhduueChDwmz3K4=;
 b=Gk520HtLFgKmYz6IKXL1OuoArpBn1WQdmMSzN2R0YRr7fid37y9NPrBIWDvpSmVl4P
 jwNEfFT3ACzwUGA1y+E8QzFfs3hqlb3EuVfE4T/ipY+6NloGtblOke4vVDDH+2DXHMYa
 HF0ETh1uIHvKb+UKnM9sLr8unvO2dOaPOF+ZN0940W3hbTpraMUgsE2sqLdcC3bH6IG5
 KkWb9K4dsMZ7uPNMAaLDaaM6qALaGoEfcFbHGLKYPmjyBpnrH5zrWLlw+T2OG8MyvmuJ
 ZysyNNzy97boDMcY7u1xqC4tqmoE/g3TrwpKZQg4Alo4uQ3jbZJzJBqy41lZIwcv8DGJ
 4PQQ==
X-Gm-Message-State: APjAAAXXFm8OuPQETD9hdIWJvzdZFDnmriAu/NRhZGr6rSesnMRlUBpo
 /HA8x9il80Dazc53Lkh2aElAcSREp8YmXmENDcQ=
X-Received: by 2002:a0c:afd5:: with SMTP id t21mr22451648qvc.105.1563260101260; 
 Mon, 15 Jul 2019 23:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190704055150.4899-1-clg@kaod.org>
 <cd1f8a48-27cb-5cc5-1fd2-46f1597a7094@redhat.com>
 <20190704101345.GC1609@stefanha-x1.localdomain>
 <b304e4bd-1315-b1be-6c48-add99df92626@redhat.com>
In-Reply-To: <b304e4bd-1315-b1be-6c48-add99df92626@redhat.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 16 Jul 2019 06:54:48 +0000
Message-ID: <CACPK8XdFUO6+Fx17Dry0D2QFhM885DugdvOkWnhgjxPc9VgG2Q@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::841
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
X-TUID: zzWdB4GkIoWH

Hi Peter,

On Thu, 4 Jul 2019 at 12:26, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 04/07/19 12:13, Stefan Hajnoczi wrote:
> > On Thu, Jul 04, 2019 at 11:26:53AM +0200, Philippe Mathieu-Daud=C3=A9 w=
rote:
> >> CC'ing Stefan & Paolo for a non-ARM view on this...
> >
> > I'm not familiar with the various clock smoothing techniques implemente=
d
> > in QEMU and KVM, but this looks okay given that Linux guests expect
> > this.
>
> Yeah, even KVM applies a minimum period of 200us to the x86 LAPIC timer.

Can we please merge this so guests can boot on 4.1?

Cheers,

Joel
