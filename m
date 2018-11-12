Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2551601wrw;
        Sun, 11 Nov 2018 16:33:14 -0800 (PST)
X-Google-Smtp-Source: AJdET5fROuVcWe4wnEfcxyT1SHB8GjPUX8dxozGM3eT+HTrk3BCkSgekj0jZsd/NcksP0tXQGdGP
X-Received: by 2002:a0c:f392:: with SMTP id i18mr17743888qvk.30.1541982794530;
        Sun, 11 Nov 2018 16:33:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541982794; cv=none;
        d=google.com; s=arc-20160816;
        b=stKm5xCSAPdaKGU39XUb8CpxSYKoBn0tQb6D9PItsp7Z+1inkiLkvH1mDLXBuS7Ax6
         cla2CSnYQkzo8ddr8w+87xvt3fkKL1dThQmmH0g4/QhB0OCPdpAldvWgoRSzzEftQu9q
         y+tv/VK5BpknxjcuoHrYKuKwNjAJK/lVXkD82a0A8axvFZ5Z/4U7AdxLTxeM+7VwTJDO
         EDq2OuIBXgjIpliyH7FkXDQzv3ZwQD95RmQlLwYFZdm/RAfoFTNkBJbek2FMD+0XWzpr
         mCOO/sOfi5IS50tgZPcJT43vHfRYmON8ZZ5fdHm+OrXYTKvOMKdtkXV4GC1l2XHRYt0Y
         vkfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=AsIfX81HIO7I3qZCNu7GvJ5KDE410AA2a7AT5+ZPNec=;
        b=WGZEisJYhlzZPsvN376jfofhM9Z9PIqpRSDe5HPyHajxAoHYQEDE0YJRwB68DS2H35
         bSwZiQK29ICn9G+ygCkr58yMtWz8Lt8lLVaweLFWWUDpdLscY6v9G8GMlzJ1UxIviBER
         z0ssmtHFth00hJYRoH6QoE2/FAI1Te8H7SCrpAm3IWSHedVRP3SPbS2uphVRGDXI+pGm
         NOi+CQ+mz9Vj5cUesqAAlRCKJdlRMXGCtpxRqGwRQlzBYo02NDwHQoKl1z6RxMKKjdsx
         CSr2UqzakOlVHtPg7NrkmMAaViMfZWCRaAJ3JQq6VaM+PWoq4X+8YDD3EgYVlCazPpnh
         1KDA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l58si3958688qtl.165.2018.11.11.16.33.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 11 Nov 2018 16:33:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44191 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gM0AD-0004jP-JB
	for alex.bennee@linaro.org; Sun, 11 Nov 2018 19:33:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gM0A0-0004dy-6Q
	for qemu-arm@nongnu.org; Sun, 11 Nov 2018 19:33:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gM09v-0000OS-Cf
	for qemu-arm@nongnu.org; Sun, 11 Nov 2018 19:33:00 -0500
Received: from mail-yw1-f65.google.com ([209.85.161.65]:45960)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gM09v-0000OJ-7h; Sun, 11 Nov 2018 19:32:55 -0500
Received: by mail-yw1-f65.google.com with SMTP id p18-v6so3713127ywg.12;
	Sun, 11 Nov 2018 16:32:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AsIfX81HIO7I3qZCNu7GvJ5KDE410AA2a7AT5+ZPNec=;
	b=XATRolNXt01b9sEYpdx729TDE/me2WgAyHLX8ByOKIpAvjRKcC2fnAn8dBD6bs4Zn4
	8tsphfYmk+vORSugnA9wQpgpoGHx9Qe0fTFKztbMKdVW8En7hMUfTwuJeF0k04NJIfjD
	tJSbQMsAFbw5HoHvF5KLALDeS8KfcfW3NI0JYcgKpUXFJPL8L4lqTavU8uNuDToybcnf
	pI7lSH5AiImSW/Y6wLx2fZ9JvZ3EgWKVwDjhg0tTEtXO8XFJNr9KKPImhDMRkkzHnQ22
	dcoPgdxM0r/76ufykmseVcbTVaMbsN8I/Ncjoc/Te6KqD99U5esIuGNsvfXAGNG7xKJ2
	T9NQ==
X-Gm-Message-State: AGRZ1gJD963X6za4s5pE8spcpXa2Gbj8ItqH5pUp1VgZ+R7L+kEy6PpL
	HQq6fZG9xCqNo5iCnfTxqkFKkcySTd3DPC2z2H4=
X-Received: by 2002:a0d:c306:: with SMTP id
	f6-v6mr16476645ywd.356.1541982774636; 
	Sun, 11 Nov 2018 16:32:54 -0800 (PST)
MIME-Version: 1.0
References: <20181109173553.22341-1-peter.maydell@linaro.org>
In-Reply-To: <20181109173553.22341-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 12 Nov 2018 01:32:43 +0100
Message-ID: <CAAdtpL4UorO9DbcBWL07cLzvgiBb616u8ikbxq_pwM0884AZQg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.161.65
Subject: Re: [Qemu-arm] [PATCH 0/2] Fix the last Hyp mode bug and turn it on
 for A7, A15
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, adam.lackorzynski@kernkonzept.com,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0jwKryqcUl+5

Hi Peter,

On Fri, Nov 9, 2018 at 6:36 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset fixes the last serious bug in our implementation
> of Hyp mode (aka EL2 for AArch32), and turns the feature bit
> on for the Cortex-A7 and Cortex-A15 CPUs.
>
> The bug is that Hyp mode is an exception to the previous
> general rule that every AArch32 mode (except SYS, which
> always shares with USR) has its own banked r13, r14 and
> SPSR. Instead Hyp has a banked r13 and SPSR, but r14 is
> shared with USR and SYS. We were accidentally implementing
> it as banked, which results in remarkably nonobvious
> failure modes.
>
> With this fix, I can boot an AArch32 guest that uses KVM to
> boot an AArch32 nested guest, and I can also boot an L4Re/
> Fiasco guest successfully.

Nice!
More acceptance tests to add :)

>
> Not entirely sure what to do about this for 3.1 -- maybe
> put in the bugfix patch but hold off on actually setting
> the feature bit til 4.0?

The bugfix surely fits.

Do you think enabling the feature isn't well tested and might trigger
unexpected side effects?
It is certainly not tested... except by you. But if you include it, it
might be more tested :)

>
> thanks
> -- PMM
>
> Peter Maydell (2):
>   target/arm: Hyp mode R14 is shared with User and System
>   target/arm/cpu: Give Cortex-A15 and -A7 the EL2 feature
>
>  target/arm/internals.h | 16 ++++++++++++++++
>  target/arm/cpu.c       |  2 ++
>  target/arm/helper.c    | 29 +++++++++++++++--------------
>  target/arm/kvm32.c     |  4 ++--
>  target/arm/op_helper.c |  2 +-
>  5 files changed, 36 insertions(+), 17 deletions(-)
>
> --
> 2.19.1
>
>
