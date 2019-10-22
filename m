Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp371412wrq;
        Tue, 22 Oct 2019 13:08:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzJOH4yw2ZwhuYcIsdRwuP/pRe3H52qY/u7lUppE9S8fLoV6yak3ZKAz7oyf+GeUR0knOW9
X-Received: by 2002:ac8:5147:: with SMTP id h7mr5160338qtn.119.1571774889474;
        Tue, 22 Oct 2019 13:08:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571774889; cv=none;
        d=google.com; s=arc-20160816;
        b=i10WRtyTsl+1wpbEgjaFecIJUfXIXWy82q5fPoJz2JhKLd56SpjpMoUik1wsYOI0N6
         3TlljtLvrWg0QSYA/kZBhrJy8KR2K6zmHL/ImjcLc7aT0XCsRNKbeTD/yhy/b4tj1vyH
         43oiId/wui9y8tUX1hZGdt7mOL+/q/yHu+qE9dtTqcUbYYRFMfHKzgXMQIbtayopSOhH
         U4k9d+NYXVCKSjkb2kd0yo0yqw+2bDDyAoXAuz16gp5IKg1BdpNhNFUBbCYHfga1awI5
         Zh7sxo94TS+I5mzZbhUHtQC6FsJx9Jgz3w5oRy1qFNIHWjX+CGIfvf1kUXnAMCfpRnmU
         0z5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=FABTWZn8F1KpQOJlQHVuuS1BQ0WStYGViUjiYotC6n0=;
        b=Pn7IPy1dazffGzkfblKriAMn8HUr4JkiPw0ZyUiOtBd4eYFjUylIC+MxtzVKVPu0sQ
         DBGYB30i7aKO7VfGRxFVoB6TbhwgeSlssbOWmeZyePIvBfq57YjwB/9uyrZFtpNZJQ6a
         1IGienppz/n/xLwwUZwUnw8Xpd39cxh+qvCmkk+XKuSgj/Ryxh12RWlzsyQdvWwSm6Pq
         KNTwAGftARACTwxEfA0Xz3iV/hmgriDLhkDdyYfQD1Kpyuj32IVTzTsrrrytNE+Rbixm
         8wWoPKjJ71BsLanmPdpYILtr7zld3bQFuPEmpUssWkU2/d5XfLSJU0DKmu0BpbtrEJp5
         GTeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z66si766522qke.225.2019.10.22.13.08.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2019 13:08:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iN0Rs-0000x5-V6
	for alex.bennee@linaro.org; Tue, 22 Oct 2019 16:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42758)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iN0Ri-0000we-0I
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 16:07:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iN0Rg-0006QU-1U
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 16:07:57 -0400
Received: from 7.mo69.mail-out.ovh.net ([46.105.50.32]:48289)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iN0Rf-0006Pi-Gr
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 16:07:55 -0400
Received: from player763.ha.ovh.net (unknown [10.109.160.143])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 3DE0A6CD2D
 for <qemu-arm@nongnu.org>; Tue, 22 Oct 2019 22:07:53 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player763.ha.ovh.net (Postfix) with ESMTPSA id 41CD4B4822EC;
 Tue, 22 Oct 2019 20:07:46 +0000 (UTC)
Subject: Re: [PATCH] aspeed: Add an AST2600 eval board
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191016090745.15334-1-clg@kaod.org>
 <CACPK8XdT0_JCxzfxd4dCafK0Ae9+18ZWcusuXV+d4eEmwwBnkA@mail.gmail.com>
 <CAFEAcA_6yxaanT2N6Twos_FxjJNgvVKShwgq=pR4fqmcZUsQFA@mail.gmail.com>
 <CAFEAcA8py1obBXc1o02wTRkXms9NwCnCT6Q9ZZ-4W=NzNocLrQ@mail.gmail.com>
 <a0b2779c-bcd5-0fe9-ff3f-d4254aba8805@kaod.org>
 <CAFEAcA9nymSxBkEm8GcJm9p4Y_obmK-fbojFEi+Et52H-mPFdA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5da3ef50-cf48-b5fd-f343-abac72774842@kaod.org>
Date: Tue, 22 Oct 2019 22:07:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9nymSxBkEm8GcJm9p4Y_obmK-fbojFEi+Et52H-mPFdA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 7032370818775157568
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrkeejgddugeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.50.32
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: soR0uMSabkMB

On 22/10/2019 19:20, Peter Maydell wrote:
> On Tue, 22 Oct 2019 at 18:16, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
>> Is it time for me to install an OSX system for dev and tests or is the=
re
>> a way to reproduce the issue ? no errors spotted in valgrind.
>=20
> I dunno. You could have a look to see if you can repro
> it with the travis builds. I would investigate but I
> don't have time this week given impending softfreeze
> and KVM Forum next week.

Sure. I will reinstall a Mac I have under OSX.

C.=20
