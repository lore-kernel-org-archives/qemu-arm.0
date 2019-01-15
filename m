Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4135794wrt;
        Tue, 15 Jan 2019 04:28:55 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6spIpCn0VsJtc6yGSGv2YILvYyIdHu2N969oPQGq5QgWH4BzUOrVCQfRq2YG2RIxvysSaR
X-Received: by 2002:adf:8b4d:: with SMTP id v13mr2873159wra.282.1547555335914;
        Tue, 15 Jan 2019 04:28:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547555335; cv=none;
        d=google.com; s=arc-20160816;
        b=M59Spf7ugOYGorHp69ecwNI52yaomph2WWuIdatGIkivhI+BIM1ywuycICfW7ISqhP
         dDwFJMv6D0iQcJyjKnNLYjY1753g9EYlge/7veF2MC0mPiwToPfWlw4P37TTd7Uo3lcw
         0WkcfrA+T+Qt/qigsa+MEH49hKu7XcS8AVGZGaz/uG8V9Pfnmu0UlnMi2FVrFZdqSJ0g
         iKsQKQWPwK3NTQj6KqgZg/lRmKYEGxoEAOuZHelMvtX3A8afkdOyFpkD70/55PRuyEjv
         OgNNXgCzzxT+NLHXBemANhDdVsJ6tw5SqM77WwJP4NyFw2dxWt2D/mm/bESRMud85yH5
         RbiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from;
        bh=BsCEMWgaL2+71Sg3U4jAGa8VIsA98TfJHzTCQCCy7xA=;
        b=XQwsdf6KYseRvQwvAKi4XaI9KU56pvtgP0BAcbtvTbBf2IFs/UgtAtdWcmrEqdfFrT
         QG2qVZAv+QcgMavaTk524Xjs/ae73lVXFfj+TGWJpnmTJukdm+6xcTpMthSkyOXM5S4A
         1pDeusKoAy7eAkwQUMNbQKvxB/HbPiS4aYiAwpoSkMkG15pKAbL9Q1EI9jJOq2dRZvcN
         g5Hg3Krq6yrfRyB0nZxxc27kYF/0tWlA432l7bc4TQhlNCi57QJVtTPLHCpiPYB9l9k6
         UnkQ/pqLRty2MKwzYPL5fhCyNTbn7jh5A/JBPMCg0efgsbfuP2Gf5bi7tdFqqehhxn2l
         OqcA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t187si20486575wmb.5.2019.01.15.04.28.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Jan 2019 04:28:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59677 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gjNpu-0004A0-W7
	for alex.bennee@linaro.org; Tue, 15 Jan 2019 07:28:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43737)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gjNpl-00049G-Ph
	for qemu-arm@nongnu.org; Tue, 15 Jan 2019 07:28:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gjNpl-0001tG-3G
	for qemu-arm@nongnu.org; Tue, 15 Jan 2019 07:28:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33938)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1gjNpk-0001rw-Tu; Tue, 15 Jan 2019 07:28:45 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4A3128762D;
	Tue, 15 Jan 2019 12:28:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-32.ams2.redhat.com
	[10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81B415C238;
	Tue, 15 Jan 2019 12:28:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id ECA101138648; Tue, 15 Jan 2019 13:28:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
References: <20190111140857.4211-1-philmd@redhat.com>
	<20190111140857.4211-4-philmd@redhat.com>
Date: Tue, 15 Jan 2019 13:28:32 +0100
In-Reply-To: <20190111140857.4211-4-philmd@redhat.com> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri,
	11 Jan 2019 15:08:45 +0100")
Message-ID: <875zuqjea7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 15 Jan 2019 12:28:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 03/15] hw/ssi: Remove SSIBus
 from "qemu/typedefs.h"
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, "Michael S.
	Tsirkin" <mst@redhat.com>, Alistair Francis <alistair@alistair23.me>,
	qemu-devel@nongnu.org,
	Philippe =?utf-8?Q?Mathieu-Da?= =?utf-8?Q?ud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1SxGTiFasmV2

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> There are only three files requiring this typedef, let them
> include "hw/ssi/ssi.h" directly to simplify "qemu/typedefs.h".
>
> To clean "qemu/typedefs.h", move the forward declaration
> to "hw/ssi/ssi.h".
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/strongarm.h      | 1 +
>  include/hw/arm/pxa.h    | 1 +
>  include/hw/ssi/pl022.h  | 1 +
>  include/hw/ssi/ssi.h    | 1 +
>  include/qemu/typedefs.h | 1 -
>  5 files changed, 4 insertions(+), 1 deletion(-)

When typedefs.h changes, we recompile the world, but it pretty much only
ever changes when new typedefs are added.  Thus, *keeping* a typedef
there is therefore pretty cheap.

Nevertheless, we shouldn't keep typedefs there without a real reason.
Being able to move one away without having to add any new #include
directives is a strong sign for "no real reason".  I like patches doing
that.

What I don't like is adding #include directives just so you can move
typedefs out of typedefs.h: it slows down the build.  Granted, the four
added by this patch are a drop in the bucket.  The point I'm trying to
make is typedefs.h's purpose: it's for avoiding #include directives.
Circular ones in particular, but others, too.
