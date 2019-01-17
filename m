Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1582898wrt;
        Thu, 17 Jan 2019 01:07:46 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4QqGhpYa0LMxPcz3tRPg40nGmEfzdBKdbtaLq/ZltESpFkJX9FWN5TO1NWofwIA0ez3z3l
X-Received: by 2002:a7b:c24c:: with SMTP id b12mr4545570wmj.29.1547716065965;
        Thu, 17 Jan 2019 01:07:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547716065; cv=none;
        d=google.com; s=arc-20160816;
        b=c2lzVbOG482KBgzYsJFndDfm39eR6zXBphQ0k5jHlpEulyd8kTj2df1yUN6RQWNSr1
         T8yLIxhEgSvAp5Ki9I6gNjwhXV3ge897ntDc3AmDiSHcQgmd7JACajn/VgB2nMvuFRzO
         PMoMGnjmPaIJzxuXHVoBuPWWBLloRuJMiwOEA7ZkxDm4PfcfBN9tZqKdX6BuUjbS2HxS
         xfPXrtvpRON0IOaq8tM/8ZYor+kveA992G27dVFvUYy8YNYSmShTT4YPeDQT0LI1r3Q1
         USTvF2GurqFHbn53R8Usz+TslUhI5MK60ldmzHqNqTVsklqq7a84uuWdcbgPIRUNj6MI
         w+1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from;
        bh=HXWJdU10PdTfvcLCFACNnihclnwIWQq4ZY09l7KttJI=;
        b=WTOsGSBQU2X/U5eQ8I/LugCjS3yVhqLzsLJdQjkZxoFXdabq/bOXhkXFCSzFB4VNyX
         mDBS6LBSpYeT5SlsHchf/BJwoVkH6KTCskNDMYXqEdFUkInr13YudH2pXluSwvqzJche
         0y0ZaXysB0ntNXN6pHvAQaBgSBfslN++JST2LKOhKPa8ADVa7EIOY9+0ABT8hCpWhNc3
         /SINhQz4WqwKT+feigGWKw9QBmogaPZm9bSCxVwjeTcgWswGXbn+cuvV/HpP4ZUboL4G
         TZeh1I0taIDYnDHTlneBPzxBWLjykx1P8M0H5L6CLz2QLMeW0cf5HDFreM/nikGi6E/b
         XPUw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r127si24832960wmf.152.2019.01.17.01.07.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Jan 2019 01:07:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39140 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gk3eK-0005dp-Ol
	for alex.bennee@linaro.org; Thu, 17 Jan 2019 04:07:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gk3ab-0003D7-IM
	for qemu-devel@nongnu.org; Thu, 17 Jan 2019 04:03:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gk3aZ-0004Lg-Mx
	for qemu-devel@nongnu.org; Thu, 17 Jan 2019 04:03:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46836)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1gk3aJ-0003zY-MW; Thu, 17 Jan 2019 04:03:35 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6429040F00;
	Thu, 17 Jan 2019 09:03:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-138.ams2.redhat.com
	[10.36.116.138])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07AFC60BF7;
	Thu, 17 Jan 2019 09:03:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 7E0BD1138648; Thu, 17 Jan 2019 10:03:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20190111140857.4211-1-philmd@redhat.com>
	<20190111140857.4211-4-philmd@redhat.com>
	<875zuqjea7.fsf@dusky.pond.sub.org>
	<403ad2e4-3282-051c-1ff5-8a3a23899293@redhat.com>
	<be75e72a-9f54-c9b5-4a1f-e87e28df8ba5@redhat.com>
	<87sgxtatod.fsf@dusky.pond.sub.org>
	<4b24723e-5a27-f25f-76c1-f2f4e94757ba@redhat.com>
Date: Thu, 17 Jan 2019 10:03:24 +0100
In-Reply-To: <4b24723e-5a27-f25f-76c1-f2f4e94757ba@redhat.com> (Paolo
	Bonzini's message of "Wed, 16 Jan 2019 11:03:15 +0100")
Message-ID: <87ef9b64gz.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 17 Jan 2019 09:03:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 03/15] hw/ssi: Remove SSIBus from
 "qemu/typedefs.h"
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>, qemu-block@nongnu.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qviUjeI4ymq8

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 16/01/19 09:33, Markus Armbruster wrote:
>> What problem exactly are we trying to solve here?
>> To the best of my knowledge, typedefs.h has been working just fine for
>> us, and I can't see why it shouldn't continue to work just fine.
>
> Patches don't have to solve problems.  They can just help long-term
> maintainability, highlight code smells, etc.  Nobody is saying
> typedefs.h doesn't work.  But it's a tool, and including headers from
> headers is also a tool.  Each tool has its purpose and it is useful to
> question what are the exact purposes of the tools.
>
> typedefs.h is useful to avoid rebuilding the world too often if a type
> is used many times as a pointer, but rarely as a struct and rarely has
> functions called on its instances.  This is already a relatively rare
> case, but here we're talking about files that are included less than 20
> times; many of which also already include hw/ssi/ssi.h for their own
> business.  So we're hardly rebuilding anything more often, also because
> hw/ssi/ssi.h is not really changing fast.
>
> typedefs.h is also useful to avoid circular header inclusions.  Here
> hw/ssi/ssi.h is clearly a toplevel include for the SSI subsystem.  I
> agree that includes in a headers _can_ be painful, but sometimes they
> also tell you a hierarchy of what uses what.  typedefs.h doesn't;
> forward struct declarations also do, and I all but dislike using them in
> headers (Thomas, can you send v2 of the HACKING patch?).
>
> Therefore, typedefs.h is not particularly useful for SSIBus.  It doesn't
> hurt much, if at all, to leave it in.  On the other hand, it also
> doesn't hurt much if at all to remove it; it makes the SSI code a very
> tiny little bit more self contained.
>
> It may be that it's not particularly useful just because SSI is small;
> for example I2CBus is also in typedefs.h and it's used a lot more, maybe
> one day SSIBus will be the same.  In doubt, let's drop the patch---but I
> think it's useful to have the discussion and there are cases that are
> not controversial at all in Philippe's series.

I fully agree having the discussion is useful, and I also like many of
the patches in Philippe's series.
