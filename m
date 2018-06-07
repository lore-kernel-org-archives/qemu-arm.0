Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2130216wrq;
        Thu, 7 Jun 2018 06:53:22 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIVGKi0Y8mAsOS7psdPfac3D3TZo35rpIz3kALQl6eilEes3cV0K0po3MCrDVs6Itm0G2Lm
X-Received: by 2002:ac8:1704:: with SMTP id w4-v6mr1762816qtj.217.1528379601938;
        Thu, 07 Jun 2018 06:53:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528379601; cv=none;
        d=google.com; s=arc-20160816;
        b=mt4umAjfZ6Jqi15KfqTJtUaqe48pIlGqKkcP/rVVL0a0qEzQQTrPmzu9X6YyPpM6rD
         gJrZl8xSq0Cvu9W4bGG4Zjk09jpdmVqfl4pEtcOB9w3+GKrjuvYvOaeDD3I4lC5FLww9
         FxHsbH1+6oJhyReiCdnlJZh/yjrlGZVz/6wwaewEcbMV147EpIaDBPgqh9278x0TrS4i
         cgK7/LHqPR1vwgVT4Pq/J+nhNIzUtzQdDPjCZ2F+TegzqdsnW3HevoOxkly18YlxeDHu
         WBrK5R5B+BLsFkzoTIfkboJQWN/Dy7JCHbR+r6k1pMEvi3+kZLRB6YdvVL8QLM7UH49U
         ryEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from:arc-authentication-results;
        bh=g0EfKYmyD1W/jtFPxLx5JxwwLmFxH82/a7hlWnEf0u0=;
        b=DbFXSZd4e0caq1n0Ag9HUZupPwyqLXx3toY+ytQxRq6sKvSB85927yOouCAtzzETJe
         zXQQP9AAXl5BJxS8M716zPsDeIOyewGC+vknm7FBj/wSxlCtEUeCVlw4BoRbhGOzlqCY
         7rn4ZpoO0x4TC4aYfoSCa0DZzJvI3gMHUkpq6tq7YcOQd3f6FSHvlcQOYGD7LIsVPQbZ
         ezyHvlwPb1e+QoiDecetFLu+R097djlUlC4IrxOQ5/NoS4Jyq+VgYNZu29OTj761Oryp
         rcz1r6nyAznXHUPi4+7wDXrPSz0yUaTPzlJCj08kmVnbEfKRPvFdcy1S9wGYrdRgqPp2
         ocfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c90-v6si3820873qkj.117.2018.06.07.06.53.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 06:53:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58116 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQvLt-0000r6-FG
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 09:53:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fQvLi-0000pC-Un
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 09:53:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fQvLf-0004y9-UT
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 09:53:11 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44210 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1fQvLf-0004xp-Pw; Thu, 07 Jun 2018 09:53:07 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 10419BB42D;
	Thu,  7 Jun 2018 13:53:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-48.ams2.redhat.com
	[10.36.116.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD47D2026DEF;
	Thu,  7 Jun 2018 13:53:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id BF1931138645; Thu,  7 Jun 2018 15:53:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
References: <20180529174821.19964-1-f4bug@amsat.org>
	<20180529174821.19964-4-f4bug@amsat.org>
Date: Thu, 07 Jun 2018 15:53:05 +0200
In-Reply-To: <20180529174821.19964-4-f4bug@amsat.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue,
	29 May 2018 14:48:20 -0300")
Message-ID: <87d0x2vh32.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 07 Jun 2018 13:53:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 07 Jun 2018 13:53:07 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'armbru@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/4] hw/arm/sysbus-fdt: Replace
 error_setg(&error_fatal) by error_report() + exit()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@suse.de>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, Eric Blake <eblake@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vzy0LhgDTRcF

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Use error_report() + exit() instead of error_setg(&error_fatal),
> as suggested by the "qapi/error.h" documentation:
>
>    Please don't error_setg(&error_fatal, ...), use error_report() and
>    exit(), because that's more obvious.
>
> This fixes CID 1352173:
>     "Passing null pointer dt_name to qemu_fdt_node_path, which dereferenc=
es it."
>
> And this also fixes:
>
>     hw/arm/sysbus-fdt.c:322:9: warning: Array access (from variable 'node=
_path') results in a null pointer dereference
>         if (node_path[1]) {
>             ^~~~~~~~~~~~
>
> Fixes: Coverity CID 1352173 (Dereference after null check)
> Suggested-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Same code smell as in PATCH 4/4.

Reviewed-by: Markus Armbruster <armbru@redhat.com>
