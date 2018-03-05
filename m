Received: by 10.28.91.67 with SMTP id p64csp2877981wmb;
        Mon, 5 Mar 2018 10:58:22 -0800 (PST)
X-Google-Smtp-Source: AG47ELupDO6LtXqZgeJHpsogeqp9Bxyd2BFjBlQ03BtnZ6y3NAVyUJk116Ius8ysVPbKGcP8aHEm
X-Received: by 10.129.112.1 with SMTP id l1mr9771885ywc.383.1520276301896;
        Mon, 05 Mar 2018 10:58:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520276301; cv=none;
        d=google.com; s=arc-20160816;
        b=R7y5jpx+qMVUSVlmWOQOFCjTYrbyj5RCCx8uee98afHo36hwa5iOzdh83wrWzaUEgB
         +oVvmFfZCG0gxXa0o0B9HoSLpjuwakpVyvKhrClRvx9l3Vi96mkne4xeSpF+0HavOf63
         RoTU1uBx4+lBIZncu0A38uNx3XZ5mwFtBU3EojVZJR9zyNYsJGinc9zPdQXC6lHfRify
         uldzH9tJ+yig92XvQoZX62YWH02EKAPQFHAleIEzvt9NZ/UCdL7O+ZUZvqJobpliMSEL
         c1VUY3w0PHjh1UjzfnEhHhfWJ49f55GoFyJiQ3L+m5KPgpKrjdWet2BIv5N5gjmHWsVp
         J6Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=ytwQi7i+NGvJ3XQjEsnTMgcZG7dHLNmNEnyEs9dU7t4=;
        b=VUMW2H1SFXLmj1n3+8qzHj6VTs5trVGonGPvyTAAaGfpCULfl4YdbNlGJobihHziTy
         lnr7JWoNwZfw1VRNeuXbF1/eKz7PvoHFThhDdBgCSuPH++6HjwRID4N1lydopEf6ApHS
         Lvp86sQSnCh5g8a0OP8N4g0XXelXSwKCQ7GEPy3xjI8z3eMcPFRryjRAqQeQI7k0k1si
         om9TLKfeNLBk1oE0fPOuA1DeACioBgvIlRXGE9SupInxWCoF3ynQlE0dyP+8iksP1IqK
         RXhsYwjsgkkoWiZ9jt+1ahGYbhVs181CKKJis2IkL6KWa/Gg9fxSpPqKMm8nQFqlsV7o
         tZEg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q2si1116658ywd.546.2018.03.05.10.58.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Mar 2018 10:58:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51011 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1esvJV-0002Pa-C9
	for alex.bennee@linaro.org; Mon, 05 Mar 2018 13:58:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44585)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1esvJL-0002O0-Se
	for qemu-arm@nongnu.org; Mon, 05 Mar 2018 13:58:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1esvJI-0005kT-3E
	for qemu-arm@nongnu.org; Mon, 05 Mar 2018 13:58:11 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54064 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1esvJH-0005kP-Uo; Mon, 05 Mar 2018 13:58:08 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3BEA54063640;
	Mon,  5 Mar 2018 18:58:07 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.59])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86AF71C551;
	Mon,  5 Mar 2018 18:57:56 +0000 (UTC)
Date: Mon, 5 Mar 2018 18:57:54 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Message-ID: <20180305185754.GE17368@redhat.com>
References: <20180305112732.26471-1-f4bug@amsat.org>
	<20180305112732.26471-3-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180305112732.26471-3-f4bug@amsat.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 05 Mar 2018 18:58:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 05 Mar 2018 18:58:07 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH v2 02/30] hw: include
 "qemu/cunits.h" and clean unused "qemu/cutils.h"
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Michael Walle <michael@walle.cc>,
	Yongbok Kim <yongbok.kim@mips.com>, Marek Vasut <marex@denx.de>,
	qemu-trivial@nongnu.org, Alexander Graf <agraf@suse.de>,
	=?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	Marcel Apfelbaum <marcel@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Chris Wulff <crwulff@gmail.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Paul Burton <paul.burton@mips.com>,
	"open list:New World" <qemu-ppc@nongnu.org>,
	Aurelien Jarno <aurelien@aurel32.net>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2X/N28eZEKgJ

On Mon, Mar 05, 2018 at 08:27:04AM -0300, Philippe Mathieu-Daud=C3=A9 wro=
te:
> These files were including "qemu/cutils.h" to use the byte-based size
> definitions, now available in "qemu/cunits.h".

I know I'm "complaining" about bike-shed colour here....

Feels like just calling it units.h is sufficient - all our .h code is
C code so don't need reminding of it by filename, particularly since
we're avoiding system header clash by using the qemu/ prefix on #includes=
.

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Regardless of whether you rename it or not though,

   Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
