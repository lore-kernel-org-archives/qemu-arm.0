Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp423137lfc;
        Tue, 19 Nov 2019 03:58:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqyjk/vACVuq9dF4D6v0NZ5bBfvtHx6iWujF8JqyN2TIumyIK3rmAjyEc1FYS6GY+E0xhrir
X-Received: by 2002:a7b:c347:: with SMTP id l7mr5292273wmj.48.1574164695186;
        Tue, 19 Nov 2019 03:58:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574164695; cv=none;
        d=google.com; s=arc-20160816;
        b=bZQ6JfLz6NKwMe5UDVuu/CNmUR1nYgeRPHnzulDPgYzC5K2fCuwAynQ7AfvyHUI+Ir
         ZVjopx09FYmlPo6+gCpzv4Gp3oAjhPsWdAHC5yhqI1Jrr0fdOiAA563r3zjr0RmpXsiR
         0SXAeOnN9Gr/b3k5QfVpT2a2IdYPjy7XplTjZWg9Hbc2K0VemNHKGTmn256wCArfm3mv
         i0d2tlac+ptjf3N1Yy3KxeP0FkLDcKmE69VMoJKe10F36TeQO17tt6vNBOOeNH/pMqxa
         a3yWegKwMKCq69qwyvDjyhItB9V7zBYs7XanoSyEQcCcSYuh0mTBjBBOWkbfm2LO72iA
         dn0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=THczhtpawuKZWPnoFB6R2JN2qdWgxuopaHPjGmb5pAw=;
        b=CfifeU4446BPbpEz3Gkz9kIQPeJUfvOFte0k7pBNV755nppvOEKKoEZ7UPvbQ5Jzmz
         eCkXHf+ehNW4R8Bg7zYXQxRWr9WHmTCTouA2RKSAr/dGcha+Mw2XA5jlZC1fulnJCgtF
         Qyo6ai/GVMOfG1AozjDU6iBiEfJ1MIoEcQBEWGoh3Zb64rNy0YCYOs+UGSggTzfdc3vJ
         A7m9G/OfwjxLG7EYPXdBiodK4TsF1LqIkeiCpPwhdMIRbiM+p3bCKCfVfbrkVpNJysWI
         2t/4CcMLfGWHu3VEtH5dIqN25qGM8PfpcbvNVvdzlL/8xb5jJk26DJV8qboYNjtYvwyl
         fmtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Vzr6ungd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2si16627634ede.431.2019.11.19.03.58.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Nov 2019 03:58:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Vzr6ungd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iX298-00072Q-2V
	for alex.bennee@linaro.org; Tue, 19 Nov 2019 06:58:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52586)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1iX290-000700-3r
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 06:58:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1iX28z-0004Wn-0X
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 06:58:06 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:44199)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1iX28w-0004Uq-J7; Tue, 19 Nov 2019 06:58:02 -0500
Received: by mail-wr1-x443.google.com with SMTP id f2so23489298wrs.11;
 Tue, 19 Nov 2019 03:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=THczhtpawuKZWPnoFB6R2JN2qdWgxuopaHPjGmb5pAw=;
 b=Vzr6ungdmy/6Q5tsA9MP+NJei/nYSgLtAVJ0tZqVdt5rapDthfMJyWR0S/0AKMrRE1
 g8u9zuyG1Lnq9OpyePXcoofynWnVRsWSU4voBPq6y/Nc+21c+CXKKo+sg1hgWqv6SoVj
 2a4b4SB2U0HcYm8cBi8zYYswEMXOTDeLF0X4VNT6ZoVhNe1J4T7p5tKk0aumflkWfdbN
 Vbx5QFedcNMEKg1BLj5nTStlUWv/EvtdMQdLCwMdpG2VT7p516PnhOi7CQ7s14QWGPY9
 qizVn8c51WgyGgKQaFMsnPXj2L/5Xx6iX7MjtEpO3bVJ8DXRTO6LkN5T7/ySz/weZ10e
 okHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=THczhtpawuKZWPnoFB6R2JN2qdWgxuopaHPjGmb5pAw=;
 b=VAYoUv5caGtNP0mypLvIlDWgKREbxoUVUXQCQiQ5yLaTCc3Xlyc1oaBFQivcsL0JcQ
 kJG/mAE5dUe2yZyQKJy6hPRTUw6i4m1+DJfHGbQmjxL4asimA9i3sUAxLYbUf3rRl3GN
 JzMP7kE1alw2fM9bTNz0A+/FjVh5E6VEk7CzDw8z32fqbNTCBiTtMtqR5z4HXB7Dsw4Z
 lCfSbGZvmjYrhH3Szqhm+YnVJoEEb7pZIccIW9MUNeYOixrl3yXjifLUGGnTGGIcgwKn
 XVsA1F/TQqSoOBTkOPUo3zpKtwPqwImNpENQIMsn9zDX+YQrNP4f7cbBx+JVyYd2FGkL
 72Zw==
X-Gm-Message-State: APjAAAUKZ5zULRWgjPE3RbvcrPba9RWZHosXlAfenifIERE8SCJ5sQDa
 D4J9iPGc7fWOoHIeeY7gkcYs//5QSRkWoPGB/tc=
X-Received: by 2002:a5d:6cc3:: with SMTP id c3mr36402590wrc.202.1574164681300; 
 Tue, 19 Nov 2019 03:58:01 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-8-marcandre.lureau@redhat.com>
 <CAFEAcA8GHqiaHSKdTjzTY_mWxYpDLZhXLYc98kjPGLUnzsG3oQ@mail.gmail.com>
 <CAMxuvawcYnH4pp8PitMO6KcTz_GdwF7i=zJxepofsN1o9Yh65w@mail.gmail.com>
 <CAFEAcA9Ee950esqNT4PJgGU0txnv_oFJWvQ+8oOn0FS9PBt=-w@mail.gmail.com>
In-Reply-To: <CAFEAcA9Ee950esqNT4PJgGU0txnv_oFJWvQ+8oOn0FS9PBt=-w@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 19 Nov 2019 15:57:49 +0400
Message-ID: <CAJ+F1CKYriLP=FK5s2u=azk-rfUCAG-gR6_keXDSOPS4D0Mq3A@mail.gmail.com>
Subject: Re: [PATCH v3 07/33] serial: register vmsd with DeviceClass
To: Peter Maydell <peter.maydell@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Magnus Damm <magnus.damm@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Burton <pburton@wavecomp.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eDq21C4turos

On Tue, Nov 19, 2019 at 2:35 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Tue, 19 Nov 2019 at 10:23, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com> wrote:
> > On Mon, Nov 18, 2019 at 6:22 PM Peter Maydell <peter.maydell@linaro.org=
> wrote:
> > > Did you test whether migration still works from a QEMU
> > > version without this patch to one with it? (The migration
> >
> > Yes, I thought I did test correctly, but I realized testing with x86
> > isn't correct.
> >
> > So with arm/musicpal for ex, I can migrate from before->after, however
> > after->before won't work. Is that ok?
>
> Broadly speaking, the only case where we care about not
> breaking cross-version migration is where we have a versioned
> machine type. So musicpal doesn't matter too much. Beyond
> that, yes, generally before->after is more important than
> after->before. I have a feeling Red Hat downstream cares about
> after->before migration at least for x86 but you or your colleagues
> would know that better than me :-)
>
> > > vmstate code is too complicated for me to be able to figure
> > > out whether passing the 'dev' pointer makes a difference
> > > to whot it names the state sections and whether the
> > > 'qdev_set_legacy_instance_id' suffices to avoid problems.)
> >
> > I don't see a way to fix after->before, because the instance id is
> > initially 0 with the new code, and the old code expect a different
> > value.
>
> Can you explain how the instance ID stuff works? I was
> expecting that the result of setting the legacy instance ID
> would just be that the new version would always have
> the older setting, so if it works for old->new it would also
> work for new->old. But as I say I don't understand this bit
> of the migration code.

From what I understand, the alias_id is only used in
savevm.c:find_se(), and thus can only be used to match against
"legacy" instance id values. On new code, instance_id is generated
incrementally from 0 with calculate_new_instance_id(), based on
"qdev-path/vmsd-name".



--=20
Marc-Andr=C3=A9 Lureau
