Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3640969wrx;
        Mon, 8 Apr 2019 08:25:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzxcj7O0YpbCmud4bhg9o67OrI5OcC94+qcvH3Y91uNlElgB+8cLtDnqTcmOwZl2VEaQjZF
X-Received: by 2002:adf:cd06:: with SMTP id w6mr19429263wrm.52.1554737106030;
        Mon, 08 Apr 2019 08:25:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554737106; cv=none;
        d=google.com; s=arc-20160816;
        b=NwZB5JH9TykNGr/vxrkBiPM50mBVTi829JBWFiZpA/dlHzVcIjDUgnLPaQQ4kpW6dt
         CszdDJpMXK5r2wgPrQSaE+VC35QFvWcHz9FUooF6/gCtqWZBxv+uBqpD4473E12aEirL
         cArSDeylgYGMx4IFfs7QuHdQHKNTAiGRfA4vsuRx9ESAYSbVSRqECNW5E0308P6Aj+2N
         hzC7EBBizIL06KTi7MPtfIJhw7qKrvc1Q2ztW7+r9PiYD07Wa+d1iPbRTPb3+UkbE0kr
         9lVfFUgQzAEtqsiuNxSvJxZWSUqDyqTo1z/DIlwPDn0FZLsQoyVV3pw41U1zhB3tE981
         M/eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from;
        bh=0flg58GBVVnpup6yYfeaxqrPI2EBMpCBEPRW4cI+wys=;
        b=Tf1IT7eWw1WLrJKAaJgr26Q0BU026gbRozmCvXs1LH0/lLedlkGVIuuf4w3GIQfSSM
         Ztk+kmTS1hUUo5jYYq/hjh2nfWNp4jc/C7p30EPPzPKgmg3mc54ygj9X5HLPoZw4Okqg
         jnRXnD2VqWQii72eWNcX9ubjffKfIq795GONbx+JB93IG3e9+GVv6V6mpwHofFmnyLQs
         +fT4RQ9T031yyRGkvU2+84ZEiWmG+tUNY/UixIBQwGxkl+aaaJ7tnkYs3N/c2qAsTUNx
         UUQGHnNsi2ib+IReEHe3uQ/rvG4mo1fKn+7WUp4o/Z0U7A1BEV65Ag+EeWiIYWt7ceVM
         NxHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t187si6654123wmg.87.2019.04.08.08.25.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Apr 2019 08:25:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:54821 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hDW8v-0007vN-3B
	for alex.bennee@linaro.org; Mon, 08 Apr 2019 11:25:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42512)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hDW74-0006f6-4o
	for qemu-arm@nongnu.org; Mon, 08 Apr 2019 11:23:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hDW73-0000q9-7f
	for qemu-arm@nongnu.org; Mon, 08 Apr 2019 11:23:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39596)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hDW72-0000nb-Tg; Mon, 08 Apr 2019 11:23:09 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B9A14C05E767;
	Mon,  8 Apr 2019 15:23:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-116.ams2.redhat.com
	[10.36.116.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B9265D722;
	Mon,  8 Apr 2019 15:22:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B4D381138648; Mon,  8 Apr 2019 17:22:54 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
References: <20190204231815.29661-1-philmd@redhat.com>
Date: Mon, 08 Apr 2019 17:22:54 +0200
In-Reply-To: <20190204231815.29661-1-philmd@redhat.com> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 5 Feb 2019 00:18:04
	+0100")
Message-ID: <87d0lwmshd.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 08 Apr 2019 15:23:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 00/11] hw: Remove
 "hw/devices.h"
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Rob Herring <robh@kernel.org>, qemu-trivial@nongnu.org,
	Magnus Damm <magnus.damm@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Richard Henderson <rth@twiddle.net>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Philippe =?utf-8?Q?Mathieu-?= =?utf-8?Q?Daud=C3=A9?= <f4bug@amsat.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PM4L7fzctg3u

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Hi,
>
> As his first comment describes itself, the "hw/devices.h" contains
> declarations for "Devices that have nowhere better to go."
> This series remove it, creating new headers for devices covered there.
> MAINTAINERS is updated.
> I also included 2 cleanups while working on this, in "qemu/typedefs.h"
> and "hw/net/ne2000-isa.h" header guard.

Needs a rebase now.  Apart from that, series
Reviewed-by: Markus Armbruster <armbru@redhat.com>
