Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2125802wrq;
        Thu, 7 Jun 2018 06:49:02 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL+ZbJlPYEr7TKMZYvQm6UWhJh7H0/otL5QzKka7kGl70Xw2WMi63966sMWs0jWUtpe2T1b
X-Received: by 2002:ac8:2429:: with SMTP id c38-v6mr1765412qtc.122.1528379342406;
        Thu, 07 Jun 2018 06:49:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528379342; cv=none;
        d=google.com; s=arc-20160816;
        b=vrH4cLTCscjq1OiiCtY5zNkeGLnvxD7wfCC4/HKSpnANu/Yl9gRo7JzsCtQZiRuqf/
         Vx/9K/FrV/3In8BxaNq7k07EK9AP52YdgWKVWI/CwPiRN4sS+WrZr1vbSrg/F/VAJd1c
         6y4OjoShgq6rBhrSvpqoulAljGCGNrovd00bQF1Dl461TwS3uNAjbqmE0aotfhb8e9X4
         3PCfzw/gU/TAXUf2pXgRBdEZT3LwPJ9SeehSkE/gfQTikUM022bofju4TLNKQM7Nl262
         +vzOPYDSQoz3PTjYWlYpF8BbZ/0E4GtXQIUNGQSgufa0dieXp3pFrsmLwGdV4oHLpmIJ
         q3wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from:arc-authentication-results;
        bh=s/CD0vU1K0vr6wV4ua9KI4JAGsCeB7mOVdFnCySl8rg=;
        b=UWxoxIcVW+R/WnHrw0ketvyf4RbwU4xkvt01o/xUqd2Ps1sBApKEh3xq4RT6Wc0H3X
         odTNpq6iQuKS8F5srO1X/Yp1cMEYcCxOuK5I4WitCVgl7NmTq9iCB2c8v/D+grXKu3JI
         r0ofPWisNUgUCH3UFDYFPvncctQ4AGDEKcoTiNKr40A51xZ5oSme9SCLiSWKhNai0EZ5
         281lYfmMjXPQ7HzRR1plLF0dyiRbVXoHNOD5f5pciy6SVbq7HI/ez0fCiREdY6XL3GAL
         Y0iuWm3biBtHlOd8kGKG3d851WbR74Eq2ds//RmumUeRrw6rhg6ISoHI5+l+U0rCMlXg
         IcHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 52-v6si2161028qtv.160.2018.06.07.06.49.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 06:49:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58087 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQvHh-0004He-TP
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 09:49:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fQvHY-0004HP-S3
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 09:48:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fQvHV-00024G-R3
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 09:48:52 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40922 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1fQvHV-000242-Lv; Thu, 07 Jun 2018 09:48:49 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1A05E401EF06;
	Thu,  7 Jun 2018 13:48:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-48.ams2.redhat.com
	[10.36.116.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD5992026DEF;
	Thu,  7 Jun 2018 13:48:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B08ED1138645; Thu,  7 Jun 2018 15:48:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
References: <20180529174821.19964-1-f4bug@amsat.org>
Date: Thu, 07 Jun 2018 15:48:47 +0200
In-Reply-To: <20180529174821.19964-1-f4bug@amsat.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue,
	29 May 2018 14:48:17 -0300")
Message-ID: <87lgbqvha8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Thu, 07 Jun 2018 13:48:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Thu, 07 Jun 2018 13:48:49 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'armbru@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/4] qapi/error: converts
 error_setg(&error_fatal) to error_report() + exit()
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DaHuKLLKj4ms

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Hi,
>
> This series converts error_setg(&error_fatal) to error_report() + exit() =
as
> suggested by the "qapi/error.h" documentation.

Appreciated!

The series actually converts two anti-patterns.

1. From

    if (COND) {
        error_setg(&error_fatal, ...);
    }

to

    if (COND) {
        error_report(...);
        exit(1);
    }

This is exactly what error.h asks for.

2. From

    if (COND) {
        error_setg(&error_abort, ...);
    }
to

    if (COND) {
        error_report(...);
        abort();
    }

error.h asks for

    assert(!COND);

instead.  See my reply to PATCH 1 for why.
