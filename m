Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp655643wri;
        Wed, 6 Nov 2019 03:55:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqwWdyf8eQphCdJuhbBlCus+5n3vyZBLXUiATOk6l1yqE2GyHzAvzigsyHHbuGVZAZB2mNot
X-Received: by 2002:a17:906:4d99:: with SMTP id s25mr7402952eju.187.1573041344777;
        Wed, 06 Nov 2019 03:55:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573041344; cv=none;
        d=google.com; s=arc-20160816;
        b=j0SxbOO9hk9W3m5twUCsM7SySrbGqHBs38kpesnEnxvk2Ax/pdc9NbSrNEcv+Z39Uj
         jDFcdwUQ+EveKVyhfjU/8WNl1iGd8949fH5YxzrzJn0Q6D5aWykv9t3kYYIhjZ2OHSN/
         o9fpGs9tiED33Px3u9klewH2XfGJPRBIBlzeNZoClbq+D1lC1Dat1vHNC3w71KMiyY1j
         2gjMJOZEYPrCbB+MDHZ9q0cCI9QwuU+UiLqlZ8mLiPtLizTBZ3m1zUrvZ4rUF2nT8/q1
         Dh0TS7/hh+VRnUJTszXPRvZzGJXQGUnsmZ3sHcYG8erakXEsjtKllq0EC7NPcuToRYbD
         qWJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=2vSBEwRVDzubyuQaC6ggRbYQJp47Qxew+QDyYugRu+4=;
        b=E4csIPqUpYkSUUXDKwKmbuv1Dl9a2ejtyg6Nr7Qf7SCYuLc1bLRnSsoF9TFEB9r3BB
         GnzvJKTLd7Mytma9o04tD8gVgRDs/KMSglJDhZ5ILafbC4NQEzhbu/zOUgchTmC7H07Q
         cLOGqtlq1da1tACGquVui992LymPOMUucxCKQH/OgeLY9i+lgExuh2giZXGiP6nQJqj5
         TNfPGApIqDJVF7br3L8wQaivhbdDlU96DiiQqwQiVvkw+GSAhi+bh+Ic59WDx70asbfz
         Hn3Ag3O7gJREg7e4yyKMExEAks2eNgFxFNOhSS7kIJd6UA1IwuHQQY3uhDw6f9uJ22Nm
         rTSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ydID3p3Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h1si6882947eds.434.2019.11.06.03.55.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Nov 2019 03:55:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ydID3p3Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iSJuZ-0002yd-I1
	for alex.bennee@linaro.org; Wed, 06 Nov 2019 06:55:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45283)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iSJu6-0002xF-Mu
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 06:55:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iSJu4-0005Rt-HK
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 06:55:14 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:34181)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iSJu4-0005OO-8Z
 for qemu-arm@nongnu.org; Wed, 06 Nov 2019 06:55:12 -0500
Received: by mail-oi1-x233.google.com with SMTP id l202so20697012oig.1
 for <qemu-arm@nongnu.org>; Wed, 06 Nov 2019 03:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2vSBEwRVDzubyuQaC6ggRbYQJp47Qxew+QDyYugRu+4=;
 b=ydID3p3Zr/zwIaMgYydAsMJ//d4xHa92v6R9dWFRl0HPADy9APx6z2J86QR7CLsCg0
 kH5z/cmMpjl2g/ODq7GOOYIfVLfhSjx0YAjHneisulkuhsAc4QoBREW9Xj9fHfq70Hi0
 v1FaOEyZBaySNAChTC7vhgsrLSKuD5gOxET6WUa5mdcUPG9egiiekn1b5GmfM6VakYa1
 lYr1IBD/pClLYpkbIwrQcitCvvXsMcLPkAn0CswM5y43lv7aC89slmMxn4K6MwuJmy2C
 SmMCbz2fNV9K55Jr+ZLcM0HNDGTphTWNCWGZyzGl5xzqf+o3ldsJukzWr03pEuzz+du5
 E8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2vSBEwRVDzubyuQaC6ggRbYQJp47Qxew+QDyYugRu+4=;
 b=TDGxTb+ou42lC6xHlMUxCci63IkW3NS9Pyql8hALur4nNvMVc9CBzGt+VUYLymuz83
 1XxX8RJQeXuZXTCr0/7Scyv0p4fdjz7zw39HJp/5ROT7XOprV3jiN4A4ioD/psvjpnCa
 A2TkCRMxP3nh2OG6xLpb8J6DhtWHDX1dL9XPeSgFAK9YfW9cP8q0cOyPzGkegx1lUE4F
 N4WR7zywwVSVy32CqS15oILEZmbKvH576CuRryYhU2J0y7UJlwQIR/WABihRYX6+4/Ga
 AGyqP8haTeqOLkd0Rw0agMHEREeKD4S2a8HA7tT3NyAMwx6cPU2jkZtfyX6qqr+LJGNq
 /6Lg==
X-Gm-Message-State: APjAAAWWP+Vjyg8ag3lIwlxSZQrMJDYHvxeIsao1KVej+bJRyckbMAOS
 zWcmtt9PpdaUO76Dc9E1zy1jos62W3W0kdlRr8EFFQ==
X-Received: by 2002:aca:cf12:: with SMTP id f18mr1801916oig.48.1573041309905; 
 Wed, 06 Nov 2019 03:55:09 -0800 (PST)
MIME-Version: 1.0
References: <CAA8B=UR4KOcSeYv2sKsf8mbbvjuZ_Eqiupk=H0JW6+SQ4uE=mA@mail.gmail.com>
 <CAFEAcA8=yvd_OadDZaa3Um2K4RTrrJ34ZdTXokEDfYk08F1Wqg@mail.gmail.com>
 <CAA8B=UTMXMOKsMjDQ3oCP1J8QdL+UXLM3Paf81w=E5sV=RDg=Q@mail.gmail.com>
 <CAFEAcA9w5be6HO+ghPHrJsy4KxhBZ1MNLdPOQ4kE4nHqFKneUg@mail.gmail.com>
 <CAA8B=URoKnQTZdQar_D-xrid-JoaF_mz-EYr0SasprPpvXznoQ@mail.gmail.com>
 <CAFEAcA9WYCmD+oGHtM=g8pxyCmYt=12NchojdtgPufQUwWFRpg@mail.gmail.com>
 <CAA8B=UTcsW7R6hskd312cH5=M6hqfWXrVKLW+WkVXvn5KsLoOg@mail.gmail.com>
In-Reply-To: <CAA8B=UTcsW7R6hskd312cH5=M6hqfWXrVKLW+WkVXvn5KsLoOg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Nov 2019 11:54:57 +0000
Message-ID: <CAFEAcA-jOxu1eZ1b47F5NtOouX0dPPWhb7zGLg25+SqM4wkjxQ@mail.gmail.com>
Subject: Re: Aarch64-qemu
To: Wissem Yahiaoui <wissem.yahiaouii@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::233
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: set1R0hZpvOW

On Wed, 6 Nov 2019 at 11:44, Wissem Yahiaoui <wissem.yahiaouii@gmail.com> w=
rote:
>
> Hi Qemu team,
>
> As I sent you in the first email, that the SVE specific registers in aarc=
h64-qemu results an core dumped/segmentation fault. I Tried the ZCR_EL1, ZC=
R_EL2 and ZCR_EL12, it compiles fine with the gnu toolchain, but it doesn't=
 run in qemu. I need to simulate the length check at run-time, I am using Q=
emu but apparently I am missing some step/s.

You need to use the prctl() that I suggested, you cannot directly
access any of those registers from userspace. If you have a
simple test program which tries to use the prctl() but does not
work then I can have a look at what is going wrong.

thanks
-- PMM
