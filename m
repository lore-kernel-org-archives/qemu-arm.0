Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp573187wrv;
        Tue, 16 Jul 2019 00:01:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwB8+hibzL/Cqq6l6/I8jSuoQErydn0/NuvG1GS3vsaJL35quI4Q7CAgpOvd4lideYH8TLB
X-Received: by 2002:a17:906:3018:: with SMTP id 24mr24764495ejz.187.1563260467237;
        Tue, 16 Jul 2019 00:01:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563260467; cv=none;
        d=google.com; s=arc-20160816;
        b=CHA2wsEaGn7YfQVEsXj7G/aJru2WcEQr+TTTyZr1ONGtMl/NI8jXk/NC+Prn9+GirX
         7ACAFXA0TD53HQA+6xxOJy1/ox2ExXyCCTe5DpWfkYVjUsBzQboFcFQLRgfieVzI8Yty
         08NkyZdCkUKdnMeQXawobvnh5A/2hQNk3k1eX9qiSkWQq1UwqVFoRTtnWMp5qxIXXbDh
         XqUEzfReU+PQw/U6mAOhBz06Td2Env5m11TgdzCW3irm6jWeJgAb+LMJGDyLB8xDJGFE
         ku33GEI8DrOpDg2+tZb4owxwies9mtsV54RdwDLPzco0UDTdhzCLi9XUYFLam1tb/4Y3
         fqcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=TnJUM65uBcMIaHiYN7n5Wt/PcM5KenfjKYVz0ojBb2U=;
        b=YZb6dGsy35bCVB8zosI6G7Mb4WiOJPIG8xH4+4JbGVn1o+BI3COBtPK/uce5qPZtmJ
         cSf3+p+Bg/sEfYZSo5ScxLYRfHCuKqxeifWlhWKGyMtVdmZ/2N+PfQ+w7leAnXk0f1lw
         oRBzJTj5A05c9+gGkV3GsLP5qpSqc6HaNKecEkuasqt5OzQBLFxxAfRTf9nJd/mHHQWj
         /ew20RAOUZPddQ+AvhgBx0drcuQUPGS9JX01LlO2297/6lXQC8etEbOFyJ3r6vQcy4va
         OS6O8zTMh+SZ8CH3kuvmTLVpwL4iQs9lhxo8H4Dn6a/nBiswcdHbzIf0SH/4wE+/x0FC
         mKuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=P4eshgUN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k51si12363453eda.111.2019.07.16.00.01.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2019 00:01:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=P4eshgUN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hnHSU-00022A-1Q
	for alex.bennee@linaro.org; Tue, 16 Jul 2019 03:01:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39013)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <joel.stan@gmail.com>) id 1hnHSO-0001vk-K9
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 03:01:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1hnHSM-0003Dd-G2
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 03:01:00 -0400
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:33119)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1hnHSL-0003BG-Bv; Tue, 16 Jul 2019 03:00:58 -0400
Received: by mail-qt1-x841.google.com with SMTP id r6so14249439qtt.0;
 Tue, 16 Jul 2019 00:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TnJUM65uBcMIaHiYN7n5Wt/PcM5KenfjKYVz0ojBb2U=;
 b=P4eshgUNzzC96Ps/vPg0FH9cnhwkl+TUGZzA/CNjhlW3LYsftH15jqXrXqEGAin19B
 WL0V5x+qg0O3E45dVZI65SyQ0x9obKsizbHa/Tz5OlMDKCx3PcTW6Fe3zIIFIbGagQDw
 4nkqlMp3o9BucbDEK7E04mTGYjZYf0mJzqohk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TnJUM65uBcMIaHiYN7n5Wt/PcM5KenfjKYVz0ojBb2U=;
 b=Qn9E8CNDheXFkD9KxuhqpKGF8zg9TgVaCPgEGUtadY+ol2ApXb6pcaQwIG959ZLjlS
 fYHdSJC/DudjKLTjcJPW+uNTBG286C094yyoWEUkeCPBfP8NE+69Gdpbs17p2qidVX08
 JefQQO4YZNxUCnuDPSHdsfF6QgIYXgEPhRJTKnfLbBd8x048TBaWsF+RzEanM8XlGBiA
 YRo6znbzMAMQdirjaX4q30DolmicmHruiiUVftuPe3uc8Bh6s9VOCTllMViuJBsk9bFq
 ow1Xq/vfnOLfhx3iGUuNiiJ3DwEqM1fPvVeGMe2VhViYsn6KlEtgDbwVho2/XA5KuvB+
 avCA==
X-Gm-Message-State: APjAAAVGfSSRkVBvI7jkZcPL2fOZVUC2ifPxdwjI9YqWkfj4c8mmkWnG
 SIRRTl2puPYmfjOWCkY8Hl4daHs1BEGn30Ww5Kw=
X-Received: by 2002:a05:6214:1306:: with SMTP id
 a6mr22977497qvv.38.1563260455165; 
 Tue, 16 Jul 2019 00:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190704055150.4899-1-clg@kaod.org>
 <cd1f8a48-27cb-5cc5-1fd2-46f1597a7094@redhat.com>
 <20190704101345.GC1609@stefanha-x1.localdomain>
 <b304e4bd-1315-b1be-6c48-add99df92626@redhat.com>
 <CACPK8XdFUO6+Fx17Dry0D2QFhM885DugdvOkWnhgjxPc9VgG2Q@mail.gmail.com>
In-Reply-To: <CACPK8XdFUO6+Fx17Dry0D2QFhM885DugdvOkWnhgjxPc9VgG2Q@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 16 Jul 2019 07:00:43 +0000
Message-ID: <CACPK8XfZq1FvMBXLgS-WHoJy4s_L9k19hLW-XgBNoiY-DhGhWA@mail.gmail.com>
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
X-TUID: Es+10woYVn91

On Tue, 16 Jul 2019 at 06:54, Joel Stanley <joel@jms.id.au> wrote:
>
> Hi Peter,
>
> On Thu, 4 Jul 2019 at 12:26, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > On 04/07/19 12:13, Stefan Hajnoczi wrote:
> > > On Thu, Jul 04, 2019 at 11:26:53AM +0200, Philippe Mathieu-Daud=C3=A9=
 wrote:
> > >> CC'ing Stefan & Paolo for a non-ARM view on this...
> > >
> > > I'm not familiar with the various clock smoothing techniques implemen=
ted
> > > in QEMU and KVM, but this looks okay given that Linux guests expect
> > > this.
> >
> > Yeah, even KVM applies a minimum period of 200us to the x86 LAPIC timer=
.
>
> Can we please merge this so guests can boot on 4.1?

C=C3=A9dric pointed out this lacks my reviewed by. I had not provided it in
the past as I wondered if we could come up with a better fix. However,
I consider this a good fix for 4.1, and if sometime finds time to
further rework the timer model in the future then we can do that work
later.

Reviewed-by: Joel Stanley <joel@jms.id.au>
Tested-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel
