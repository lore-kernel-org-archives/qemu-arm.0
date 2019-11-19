Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp332198lfc;
        Tue, 19 Nov 2019 02:33:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqyVKwxEVasuOqOnf6hYpXMys69rUlKEihOxOfkHu6GW7APQEIwTOzmWeYRaJaQfVA/71+lO
X-Received: by 2002:adf:9dcb:: with SMTP id q11mr34521532wre.42.1574159635028;
        Tue, 19 Nov 2019 02:33:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574159635; cv=none;
        d=google.com; s=arc-20160816;
        b=Ymw5eVDQaXs/FjX0k/JhcMt3T1gFXxTZh2WVzVCH4VooSIUwYlczeBVVb+b94vSkV7
         BJ46u/8Iqk84Ogs5ziDzMTaKJlA6PzZoWYqHUuVtIJiTmCElZq9zpYUiKGSfu4WBwf81
         RdGGD6HDzxDpEWwUUbIcGZ1YS6ky4QbRRu3lalLU1EhCeXtAJkTRLNTvjSi+GrmEG09v
         bINudfzuD0CB/Bx/d3k635QtshiQIuA844+JxdWv/xK5LdeSnRSOapKsu3lbxa+YJwNw
         kg3MHRw3MkFHdw7YKWGop4FG0Mu5Ftwqg/o/nK8v0d1cXHpTKfGWGZNK0dbbwQitqqW9
         kIOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=0lDqPK8b1g/YgSQ4UOhqRSuVLV798FAflD0gLwIGofE=;
        b=X5oaecnCbYocldcbdTGOcpRsXBPVZtpE8CXUsSWPpGsnungmAuV3id85S5/6KA7w1y
         q8IJoJYg2IX1Q4JAEoOST09yu1/FvQpTF3I3XhpqrC2jwUvaJ3qkVh3lroPP68GERmGu
         tOAzzxc+lJCA82HNfn1x7vmdIyEwI25qZ4ia+uRykThGeDMqV2wHF5QPwysrY1cNW4Lh
         RkRMNPHnJ1h2fsxXWTHG2aFDZQNIO/X4XUMBGXLnO7GPttcMwcqknHbFhSP+Ew2deGGL
         yK1ugHPWWmuHBsMExqqI+G1TGwus8qBnAGVI2HOSakGeMlU4IneWK1elENakYvE8g936
         VF3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L8UWS8s4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3si12053605edx.271.2019.11.19.02.33.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Nov 2019 02:33:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L8UWS8s4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iX0pV-0006GA-Uo
	for alex.bennee@linaro.org; Tue, 19 Nov 2019 05:33:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39735)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iX0pH-0006DP-51
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 05:33:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iX0pF-0007pN-Fe
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 05:33:38 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:43218)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iX0pF-0007ox-9W
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 05:33:37 -0500
Received: by mail-oi1-x243.google.com with SMTP id l20so18392277oie.10
 for <qemu-arm@nongnu.org>; Tue, 19 Nov 2019 02:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0lDqPK8b1g/YgSQ4UOhqRSuVLV798FAflD0gLwIGofE=;
 b=L8UWS8s4YkqJRLwNTQSM1MdzeTKKwcB7wmy8MzcfLT9HQ9uYwkyjj0t+jRTpZ3AnYG
 He7cUBRAJUosJGpExEEbLcgbMfU1xZmpbVVUMX5bBj9cCuqVPvVpTwSJY0vi3ZuXAbnU
 6WTJ1/+Lr1lvuFp/vJ/oq9Maq6cj8aQXMgc+C/XG840Kb2pZbxLPdJge9CCWp3+40r6D
 Uh/tKuzUWLQ3MDFVOYx4v9l1agarTYcIHumE0aABfRoH5N16oS5oRwrSWz1OfVT9fCd9
 bk5JYZcTfjBdFjJu1B6hTYJ2Ag/Crsj8eD6UaK1HUkGQ+ytdpd7sN9QDto8hkUEj6LI4
 r/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0lDqPK8b1g/YgSQ4UOhqRSuVLV798FAflD0gLwIGofE=;
 b=NP+enOsaE0V/PsVhULymV9sMEY7uq9Dpa7CKY0rW2Vpig06XB1a5VxOaeLHG6P+iU0
 Ku4WUU7tSKCAMuFWnihU2bw0812+cNOOn92CMPkl2ILcUSyJsosGJzmWKe8vtsI0jCLv
 6l91OIqckicUEMOPsrETqMUEcBxkkafXBh4B1gvKBwKHD5buBwBMOXj+If70H7+iOj6m
 y8GhHmGssPUbZKNZ3Gt64dyxAx8395qO0lCJrAmG8c9Z6qwhM6W8syt+99YwQdx9ORUa
 qcgYvjDQ36fLgBMX033hr3bjK9D//gxx37AthpE+omG+6GHlJxsLEz74U6AmKJX8a1l+
 1Fdw==
X-Gm-Message-State: APjAAAX956jnPWZ7lbYTQx3HpsP6hE86mwOL1vAYVAfR3Kz/xkUe8c40
 ojg0OIQokrVBrlFVfs+wMr5d81HOJ6/jBkednxb6xQ==
X-Received: by 2002:aca:4945:: with SMTP id w66mr3552543oia.98.1574159615840; 
 Tue, 19 Nov 2019 02:33:35 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-8-marcandre.lureau@redhat.com>
 <CAFEAcA8GHqiaHSKdTjzTY_mWxYpDLZhXLYc98kjPGLUnzsG3oQ@mail.gmail.com>
 <CAMxuvawcYnH4pp8PitMO6KcTz_GdwF7i=zJxepofsN1o9Yh65w@mail.gmail.com>
In-Reply-To: <CAMxuvawcYnH4pp8PitMO6KcTz_GdwF7i=zJxepofsN1o9Yh65w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Nov 2019 10:33:24 +0000
Message-ID: <CAFEAcA9Ee950esqNT4PJgGU0txnv_oFJWvQ+8oOn0FS9PBt=-w@mail.gmail.com>
Subject: Re: [PATCH v3 07/33] serial: register vmsd with DeviceClass
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
X-TUID: KfyBilD8ndNm

On Tue, 19 Nov 2019 at 10:23, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
> On Mon, Nov 18, 2019 at 6:22 PM Peter Maydell <peter.maydell@linaro.org> =
wrote:
> > Did you test whether migration still works from a QEMU
> > version without this patch to one with it? (The migration
>
> Yes, I thought I did test correctly, but I realized testing with x86
> isn't correct.
>
> So with arm/musicpal for ex, I can migrate from before->after, however
> after->before won't work. Is that ok?

Broadly speaking, the only case where we care about not
breaking cross-version migration is where we have a versioned
machine type. So musicpal doesn't matter too much. Beyond
that, yes, generally before->after is more important than
after->before. I have a feeling Red Hat downstream cares about
after->before migration at least for x86 but you or your colleagues
would know that better than me :-)

> > vmstate code is too complicated for me to be able to figure
> > out whether passing the 'dev' pointer makes a difference
> > to whot it names the state sections and whether the
> > 'qdev_set_legacy_instance_id' suffices to avoid problems.)
>
> I don't see a way to fix after->before, because the instance id is
> initially 0 with the new code, and the old code expect a different
> value.

Can you explain how the instance ID stuff works? I was
expecting that the result of setting the legacy instance ID
would just be that the new version would always have
the older setting, so if it works for old->new it would also
work for new->old. But as I say I don't understand this bit
of the migration code.

thanks
-- PMM
