Received: by 10.25.44.15 with SMTP id s15csp5143860lfs;
        Tue, 11 Jul 2017 10:38:46 -0700 (PDT)
X-Received: by 10.55.192.10 with SMTP id o10mr1408524qki.86.1499794725962;
        Tue, 11 Jul 2017 10:38:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499794725; cv=none;
        d=google.com; s=arc-20160816;
        b=zdAZGv4MxJvPpevaMHHhzMMGdDs2VxNvLpbFmBn8z4ckfBjOAP1c1Mhhc3PyfaxrbG
         KkxNttz1xhPmZOXjgc8z3+c9L3nqhCUBzWmCAap4g+n9YzA5iUYlrefJCxBZ4nsAoLUF
         FGEUkuKxj5UbTc7lMzDBdH5V4iT1g1ODQu7MZ0ZMMUOK5R5FxzZixZ6Cve1pcnKHPF8w
         pvxQvp7C8i9ndQMVqAi4bSHUezXpQginuy7YIgQUCjOALEc8Rrr5iDQ0F97y7b2ZtdGM
         rCyVirP/qc6srFzo9jGffYSX5S5m8VsVB65qLeW5hmHX11e5oMUHJT1s/26qDdPpfP0w
         Lmog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:thread-index
         :thread-topic:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:to:from:date:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=l5v4wkRIe4pmbVlwapdxy1oP1ntPihnpSA24rva1fco=;
        b=uQjNxB4buS5RLV1q/dG1YjeKffx476FS2Dmm3CmWH0bbjGcg+3Il+dCdi+obj2Bh9g
         8BpQqJRs9cgYVVnb3pFqOkq9Oi6S1NB9FPWqFnUQeY6cYq+e3+duXjSv/rMezYoue8Mn
         YUDZfvS2KDbe41q/2Y716n+Y9gn5NY/N4F2OP/yXw6kxpLAim0KAv1xTqcqtoIi7zgBh
         b6HlL48H+DKeCCT/lyJz7wU9ZpUtWUpUwohQD2Tz0yfDfNSt5S4A/zv1ZnR70mxNvN2E
         pGPqAWZw+BbAChc4HEVrsHDphKgcbJtW2CRD/zCtQQ/Efp4yWOTYaeOU/ETaH3VhPLiu
         mGlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 138si466102qkh.173.2017.07.11.10.38.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 10:38:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47940 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUz7T-0006kt-6B
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 13:38:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46146)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1dUyzN-0007zi-G4
	for qemu-devel@nongnu.org; Tue, 11 Jul 2017 13:30:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1dUyzM-0005eN-KM
	for qemu-devel@nongnu.org; Tue, 11 Jul 2017 13:30:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58324)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mlureau@redhat.com>)
	id 1dUyzI-0005TX-7O; Tue, 11 Jul 2017 13:30:16 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 087638EB3F;
	Tue, 11 Jul 2017 17:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 087638EB3F
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=mlureau@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 087638EB3F
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78373729C8;
	Tue, 11 Jul 2017 17:30:09 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
	(zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3CAE04A491;
	Tue, 11 Jul 2017 17:30:08 +0000 (UTC)
Date: Tue, 11 Jul 2017 13:30:06 -0400 (EDT)
From: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <2146046377.49609243.1499794206964.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAFEAcA9Hv_C-w9hVO2C5WYw7SFOerHPsGb1-B44fQiy2Ud+CCQ@mail.gmail.com>
References: <1499788408-10096-1-git-send-email-peter.maydell@linaro.org>
	<1499788408-10096-4-git-send-email-peter.maydell@linaro.org>
	<1572293529.49604420.1499793538326.JavaMail.zimbra@redhat.com>
	<CAFEAcA9Hv_C-w9hVO2C5WYw7SFOerHPsGb1-B44fQiy2Ud+CCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.36.112.26, 10.4.195.21]
Thread-Topic: target/arm: Make Cortex-M3 and M4 default to 8 PMSA regions
Thread-Index: atWBtMI/RTvXSv8TQpnbjEZtLdraww==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 11 Jul 2017 17:30:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 3/3] target/arm: Make Cortex-M3 and M4
 default to 8 PMSA regions
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NT1Ks2wM2VcZ

hi

----- Original Message -----
> On 11 July 2017 at 18:18, Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat=
.com>
> wrote:
> > ----- Original Message -----
> >> The Cortex-M3 and M4 CPUs always have 8 PMSA MPU regions (this isn't
> >> a configurable option for the hardware).  Make the default value of
> >> the pmsav7-dregion property be set per-cpu, so we don't need to have
> >> every user of these CPUs set it manually.  (The existing default of
> >> 16 is correct for the other PMSAv7 core, the Cortex-R5.)
> >>
> >> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> >
> > So until now that value was wrong for m3/m4 if I understand correctly.
>=20
> Correct. (It was too high, so didn't cause a problem for
> guests typically -- a guest assuming 8 memory regions would
> just not use the registers associated with the extra
> unexpected ones.)

Would be nice to add that to the commit message

in any case:
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
