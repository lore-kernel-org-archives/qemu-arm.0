Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp299378dyb;
        Tue, 24 Jun 2025 09:28:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVm3SK2bH9PVMt6iftq5Nn+OuLp31+moaw9/jWaLZ45q30MO76zKnQg0yTdm9ShJKpwU8hFVavUoexDwQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGuC96fAgDjXIeWmvIsOWFfAcbjHT8JW7STmV+7qpJ5W85Lpmek/WumZl82zdAqcIXX7Wb4
X-Received: by 2002:a05:620a:a905:b0:7d4:1d7:e2ec with SMTP id af79cd13be357-7d401d7e4a8mr1974736685a.32.1750782539127;
        Tue, 24 Jun 2025 09:28:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750782539; cv=none;
        d=google.com; s=arc-20240605;
        b=SGxP91qsQi1i68GdR6MblUuQv4gzaWmvVYBsVHY4G97+KtvAd4DdURRUZ3dhI7Dz+O
         aoSGYv0bZ8JKQn1romPA7by38cKQtJrgeX76+Z3zUTY49dOSRvZ3lreqQEFC97lMXzGu
         yy7jrNF3NEpXsZRDwqpRHwu95HbyfkHmpsLE0prwn5ljLMTtV/fhDQN3y4zIFUXJphRo
         RejnwrQhkduLMN8b51PwbqaTDBeZKOOczS/jpe6Maky1aAOfJMlDcEAHNHe+p4VUK78y
         nZwj6WL2IEQlgImyF8uxGtSSsN2kRyTwnQq+Dey08k551kvDyRvQmPriCHQP96q+zJvq
         Zrsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=zt6AYzfONTJzp4QyyVjiNAZF2nGdfB2H83PviQv/aSw=;
        fh=dgl8OQX7tbVm+NOk83lRoTcUDOWhqNtLhDdURaYngGE=;
        b=ZKpQPYk+JSqRe9wZwGFMQAv53YVHF7O0O+4KC1u1oN4kkvfZTr4PiCCSzUV8wKNH5T
         NXvfEC0M21VZ3qA3+HSmiFDDl2KZ2yWqoRvzg8JTxl9oYseP8LaDv574I8QM5KfKICg+
         03lGhX2GunN+V9kTueWJYf0xOE6TLIRpqtvP3J5kTXvyOIrh6asfYQyPkoOC8JqNzMgr
         TlDuUK6QLNttn4kgpyHdSzP8fQpASzssdXavb3JoVLh+3koTHV7kpnZXUYvsBJxyjJn3
         ZFSa8h787vmDXuYuEHUb+cH65saYqqvzEiHnocPB6a5ov+pMyzFp9T6rGXEzapN4KHpE
         4VDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=lvYJApJE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3f999f2b2si968065185a.58.2025.06.24.09.28.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Jun 2025 09:28:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=lvYJApJE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uU6Vl-0001Mc-Gg; Tue, 24 Jun 2025 12:28:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1uU6Vj-0001MC-5O
 for qemu-arm@nongnu.org; Tue, 24 Jun 2025 12:28:39 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1uU6Vh-0007MT-2b
 for qemu-arm@nongnu.org; Tue, 24 Jun 2025 12:28:38 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-235f9ea8d08so7398095ad.1
 for <qemu-arm@nongnu.org>; Tue, 24 Jun 2025 09:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1750782515; x=1751387315;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zt6AYzfONTJzp4QyyVjiNAZF2nGdfB2H83PviQv/aSw=;
 b=lvYJApJEh5RtwxKMbTqcTr1ijwNWxfV4EDe/R8vI1j9WGJ06g8gHLijpLEDXCZFP80
 uXc4rZXuDuOb6rh2T0DsORxo9qLea5Qu3XD1+w4vbyxAqnMv0Xjt79l8N1hEio3RTmOs
 ZNntpkUTSOW//h6LmB0qKpYoGfcVhfDaEXCdzvLzGTxFr7zEEbWcl9WZ3+hwgC5i9yZl
 bOVJZ4bw5+tVNjftx7Vsirn0k8hLWSHWURdMJMz9vs4vBpSFApKft7R3jikECFpty47U
 s2zl+GZ2U9COZWobPlJFWEoiNQgQPuZIyMixxoXdEcqoBQjTgh59T3MMM6up/61Ns2Q+
 n39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750782515; x=1751387315;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zt6AYzfONTJzp4QyyVjiNAZF2nGdfB2H83PviQv/aSw=;
 b=dKbciqn0bIOlNYNI6drECSEEo9tVVLIxNN2SIGpOf/HpBKgZr5QzM98MKF9ZceWPVP
 HixRfrBrNb8H2iuK7xo6QJbv12O10d+2FkXCaCx3i+12UBXlvgh0j0HJ+JwGsFsXATFd
 fF1HEZE1EkMawyZlblIKEc11a7Y7wsVoBIVaI+gal5XcBB4JFcAxPCNtlRdaQz109/sl
 rnZWTkuhpQcJLdZUJtUcvDPtGYIoZMatpyM2FhvQWY8DfAA4mN+v+bWbiDSHZd1Ohdl9
 z96AOy2zQtn8v3lQ+in0ZvdUhUCa4QpCG82seGtiyZYolOg/bfzLgWNTSj8c/HZNrZYY
 Oqlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSrxO/QkQ8v98D/VYCxZivWk+sUe5oU74PKiZ2aEcu4bQxG9MN56ju6c15lW0hPYi22S1KmhfhlQ==@nongnu.org
X-Gm-Message-State: AOJu0YxEqEME6CokbX/Go2HxOT7AexDuk97KJKa3rLhI1V7Voqn/+403
 RQRz5Ikr/5IQvPf8S1PKV1Wr2VS9osFi8jXkTYM/zd2tk2vtkxgzUEgqx1Q6UMgJIIDhb99LrH3
 APgH2F0ngdrsZ53Azpe/oE/B26wW2VgDYLLpohjnBGg==
X-Gm-Gg: ASbGncufnLTQzIA//wJLPZ0D+N63rEoX0c8TTBDfIR4l3COFI4f9ISYyyyGKdesLAq9
 8XgPdlS19fSAcG4dfqLN1nmX49X01d3lYCO+NcWdeYzHxAIz/Bw1Qtx8JLlc7NlTIWqvixExsiv
 6Xe5dJWg1Wygfhhg6BrL8E1lLJrCmdQmJXsQYrNWUdbvEC
X-Received: by 2002:a17:90a:e704:b0:315:aa28:9501 with SMTP id
 98e67ed59e1d1-315aa289688mr24216223a91.24.1750782514888; Tue, 24 Jun 2025
 09:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAJSP0QU=v_jN5oBDBefg0mB=Qv3SvD4ZdJzz2LT-cu5ZL7pK0Q@mail.gmail.com>
 <CAJSP0QXe1L2P24oUrABO1eUzn1JFc=BJWEfakrQ5u3Ek5LkfKg@mail.gmail.com>
 <CANCZdfqfFNAYcF3BEDucyR3YN1PXwyEmzE5LPcJCyshCXwhe6Q@mail.gmail.com>
 <9bac4585-255a-4805-b24d-b3b75d2ca9c3@redhat.com>
In-Reply-To: <9bac4585-255a-4805-b24d-b3b75d2ca9c3@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 24 Jun 2025 10:28:23 -0600
X-Gm-Features: AX0GCFu2C4bt6N2POkLvXBZbzDREhcHhZkPmIBH_EQlHwhh9NvEW4sYQvc16vyo
Message-ID: <CANCZdfq6+R=VgyYdcdJCmDBTCgLSxDJuqd8h=ehb5F+v-HPT+g@mail.gmail.com>
Subject: Re: FreeBSD 14.1 aarch64 iso URL is down
To: Thomas Huth <thuth@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::633;
 envelope-from=wlosh@bsdimp.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VoUoLy7wWrrG

On Tue, Jun 24, 2025 at 10:02=E2=80=AFAM Thomas Huth <thuth@redhat.com> wro=
te:
>
> On 22/06/2025 03.46, Warner Losh wrote:
> >
> >
> > On Sat, Jun 21, 2025, 6:01=E2=80=AFPM Stefan Hajnoczi <stefanha@gmail.c=
om
> > <mailto:stefanha@gmail.com>> wrote:
> >
> >     On Sat, Jun 21, 2025 at 7:59=E2=80=AFPM Stefan Hajnoczi <stefanha@g=
mail.com
> >     <mailto:stefanha@gmail.com>> wrote:
> >
> >     (I forgot to CC qemu-devel)
> >
> >      >
> >      > Hi,
> >      > This might only be temporary, but the CI is getting HTTP 404 Not=
 Found
> >      > for the following URL:
> >      > https://download.freebsd.org/releases/arm64/aarch64/ISO-IMAGES/1=
4.1/
> >     FreeBSD-14.1-RELEASE-arm64-aarch64-bootonly.iso <https://
> >     download.freebsd.org/releases/arm64/aarch64/ISO-IMAGES/14.1/
> >     FreeBSD-14.1-RELEASE-arm64-aarch64-bootonly.iso>
> >      >
> >      > https://gitlab.com/qemu-project/qemu/-/jobs/10424901718#L848
> >     <https://gitlab.com/qemu-project/qemu/-/jobs/10424901718#L848>
> >      >
> >      > Stefan
> >
> >
> > Time to bump the version to 14.3.
>
> Hmm, while we're used to refresh the CI images for the *host* environment=
s,
> it's rather ugly to see images for the *guests* of the functional tests
> disappear. Maybe we should rather remove that test if the URL is not stab=
le?

Yes. Most of our images have a shelf life of about a year to 18 months. And=
 QEMU
should be testing all the 'supported' FreeBSD images, just like for
other projects.
The question becomes how can we, the FreeBSD Project, remove the friction t=
hat's
here now because we timeout / move the older images as they pass out of sup=
port.

We've also just shifted to a more frequent release cadence, so the
releases have gone
from living for  18-24 months down to just 12. We just released
FreeBSD 14.3, and 14.1
is only a year old. So what's the best way of dealing with this? We
could have a 14-latest
but the md5 would change...

So I'm open to making a change, but I need help crafting something
that will work, since
I'm not clever enough to suggest something here.

Warner
