Received: by 10.80.163.71 with SMTP id 65csp595655edn;
        Thu, 29 Sep 2016 17:11:26 -0700 (PDT)
X-Received: by 10.237.41.6 with SMTP id s6mr4356782qtd.153.1475194286411;
        Thu, 29 Sep 2016 17:11:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 58si10344587qtx.77.2016.09.29.17.11.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Sep 2016 17:11:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40909 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bplQD-0005OW-Re
	for alex.bennee@linaro.org; Thu, 29 Sep 2016 20:11:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40295)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bplQ8-0005JM-1n
	for qemu-arm@nongnu.org; Thu, 29 Sep 2016 20:11:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bplQ5-0000bI-Vu
	for qemu-arm@nongnu.org; Thu, 29 Sep 2016 20:11:18 -0400
Received: from mail-ua0-x22c.google.com ([2607:f8b0:400c:c08::22c]:33949)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bplQ5-0000b0-J1
	for qemu-arm@nongnu.org; Thu, 29 Sep 2016 20:11:17 -0400
Received: by mail-ua0-x22c.google.com with SMTP id l16so61998726uaa.1
	for <qemu-arm@nongnu.org>; Thu, 29 Sep 2016 17:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Z8xx6bOLV0/BhsvCHjWp8or67dbQYmYe9u1OE3YJcRQ=;
	b=e3ymEetQ6DbYXiWMs1tEAT0poycVhk6lVEQ7K1WQVfH0F5jQIAZ7FK6vRh8/ayUAFI
	aN1KZUI75zrX6/vZZQjhwi3Z12QtzAvdihFE2whSIbI+QJ14wfm21mOgZi/BXlFDQdUy
	C93O2j6KT/Qk3eaUXmw05/h1YX+SlK2QX5Lrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Z8xx6bOLV0/BhsvCHjWp8or67dbQYmYe9u1OE3YJcRQ=;
	b=mz+O0GIMkQpIPZL+90RvofYslIx5r8O/Uo/4jm/Kx63caEr5Z+0ivBiU4Nf1jfyZJK
	uDaCzvjpUOb7H8od4Jy9fX7sgcrOJ4pKzSQ1xHzXpAYfV2liy6V90Hqw8rdHpHCiiBto
	kXtUaQtgcQZGZuDBHYRdqVAXMfc7KQvursQmvOFeqpCBpKuZ1XKkB8MqnZjzxkMU9v3y
	5P9VUKW5pfebYBzzmaCg3tEzofYlyiy+hxo8ef2LWe5E2LwkCU3j6Rn2deTgA3c7qynQ
	p7PZB8626ZZh+Ugtqoc6zzihgbEo990iJZozE4NdUn7Nve8Dzi9i/Jbl8V6H4NXjX3gd
	C4jA==
X-Gm-Message-State: AA6/9RkdW2jQL9ZbDcI9XVh6Cm9WFZeeuxduRXMXyVKArobqCh2GN7UcsVr4a88Wlx6FZ07L3oCXNEjOnrx5Ik3j
X-Received: by 10.176.69.238 with SMTP id u101mr1047081uau.175.1475194277109; 
	Thu, 29 Sep 2016 17:11:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Thu, 29 Sep 2016 17:10:56 -0700 (PDT)
In-Reply-To: <1474835712-13628-1-git-send-email-jakub@jermar.eu>
References: <1474835712-13628-1-git-send-email-jakub@jermar.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Sep 2016 17:10:56 -0700
Message-ID: <CAFEAcA-_mcYMMEW6h7_V=MA3cFfSxfc0NO8ye0crFMD5TQ2YRA@mail.gmail.com>
To: =?UTF-8?B?SmFrdWIgSmVybcOhxZk=?= <jakub@jermar.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22c
Subject: Re: [Qemu-arm] [PATCH v2] hw/arm: Fix Integrator/CM initialization
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5wLv+wIJ9W+E

On 25 September 2016 at 13:35, Jakub Jerm=C3=A1=C5=99 <jakub@jermar.eu> wro=
te:
>
> Initialization of a class instance cannot depend on its own properties
> as these are not yet set.  Move parts of integratorcm_init() that depend
> on the "memsz" property to the newly added integratorcm_realize().
>
> This fixes: https://bugs.launchpad.net/qemu/+bug/1624726
>
> Signed-off-by: Jakub Jermar <jakub@jermar.eu>
> ---
>  hw/arm/integratorcp.c | 35 +++++++++++++++++++++--------------
>  1 file changed, 21 insertions(+), 14 deletions(-)

Applied to target-arm.next, thanks.

(PS: if you need to send patches in future, sending them inline
rather than as attachments works better with some of our patch
handling tools.)

thanks
-- PMM
