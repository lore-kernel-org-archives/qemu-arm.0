Received: by 10.28.71.155 with SMTP id m27csp271822wmi;
        Fri, 23 Mar 2018 03:09:16 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuWJ+l4lwKvPIRwe7yCQTCgNfdevGiPHPAYGDFpZdzk2wbWms0NNiiYgbO/6eVuUK/IVrzT
X-Received: by 10.237.59.99 with SMTP id q32mr23547293qte.222.1521799756414;
        Fri, 23 Mar 2018 03:09:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521799756; cv=none;
        d=google.com; s=arc-20160816;
        b=CAFnJwpLtkAzEyX6Q6jG7uTVN3aO5MnXHkBaqKEcWG2xO6vT0yVxll/u9/5fK3bj2m
         I7+nL3B3kyinrDte4IULagKobnnpOmI/MojY1Wd0JALUGHg/2AOuTHj5QltSJLQjn60G
         BlGl2an96Kynu/BV//5+/wz91CUrFJrid9TsAQvBl4+fAVUKireRNrfBY6C8n4iAf/oE
         YPwGHdqo5DAY+Ib1fFTWUPiWjAgaxg++APYQhZFrc9o9Ucg8B5GflZlyn4cNL0pISOKY
         CN5AWSHRUkpmZvZWe7M+6HRDVfGXHNPaOLU/IyO9DEthn9wJYeYwuTz8b7dmjyI3hyBL
         aO1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=1+9benbJh9bwYIED1waWRM6bOr4AXzU6nwOUBc91fvM=;
        b=n9YNCx4T9Z4bzlLfpNReWFoN3BrNLaT7RbASeH02Nk7OABKOd1kIoc9czJ87MRWii2
         6UpgAQRaCJboyXvJWdCpBz9sBXpt9+ORVUxWgdPcreyF+E9KEOYpq2H6DrFD0L7R2Bp5
         0yHn7j0KWHWsM4Z6S8sQxsA1bPcGsg+9cChq/IuiR7ooihCQkHIGPvFh8AvTW7ETXLXp
         gv/FUqj9PmIQUQpgxJ2gBBays8SF7UAHd6i+Sliyu7q3Mm6qm6TH4LIq7CLpaXfRbVEY
         XOuWCNFcgNfDQLcYKgwrS8Yij1X8gONJbNQViulQ6SoRUIXq7FvePpqs1YbwFCQZvf3o
         PuXA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 79si954005qkr.186.2018.03.23.03.09.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 03:09:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36954 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezJdL-0000O7-Uy
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 06:09:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ezJdD-0000NJ-9B
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 06:09:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ezJdA-0003HD-IC
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 06:09:07 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56080 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1ezJdA-0003GZ-Ct; Fri, 23 Mar 2018 06:09:04 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0D31D722CE;
	Fri, 23 Mar 2018 10:08:53 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-59.brq.redhat.com [10.40.204.59])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 000CE2166BAE;
	Fri, 23 Mar 2018 10:08:45 +0000 (UTC)
Date: Fri, 23 Mar 2018 11:08:43 +0100
From: Andrew Jones <drjones@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20180323100843.i7xrvfodcpi7rtr5@hawk.localdomain>
References: <20180315133441.24149-1-peter.maydell@linaro.org>
	<20180322142343.jvc6pxxvl5zhfjgy@hawk.localdomain>
	<CAFEAcA8Vti8NnrQK4U4kLuk=nNMC5=KiKjc6wT7cLDnCHFj-8w@mail.gmail.com>
	<48f559bd-9f54-bcdd-1f3c-f6fafccfc54e@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <48f559bd-9f54-bcdd-1f3c-f6fafccfc54e@amsat.org>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Fri, 23 Mar 2018 10:08:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Fri, 23 Mar 2018 10:08:53 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.12] hw/intc/arm_gicv3: Fix
 secure-GIC NS ICC_PMR and ICC_RPR accesses
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X7HZcfV/Q+ej

On Thu, Mar 22, 2018 at 05:42:02PM -0300, Philippe Mathieu-Daud=E9 wrote:
> Hi Peter,
>=20
> On 03/22/2018 03:29 PM, Peter Maydell wrote:
> > On 22 March 2018 at 14:23, Andrew Jones <drjones@redhat.com> wrote:
> >> On Thu, Mar 15, 2018 at 01:34:41PM +0000, Peter Maydell wrote:
> >>> If the GIC has the security extension support enabled, then a
> >>> non-secure access to ICC_PMR must take account of the non-secure
> >>> view of interrupt priorities, where real priorities 0..0x7f
> >>> are secure-only and not visible to the non-secure guest, and
> >>> priorities 0x80..0xff are shown to the guest as if they were
> >>> 0x00..0xff. We had the logic here wrong:
> >>
> >> 0x00..0x7f
> >=20
> > I think 0x00..0xff is correct.
>=20
> I guess Andrew only suggested to correct the hex prefix in your comment=
:
> - ... where real priorities 0..0x7f
> + ... where real priorities 0x00..0x7f

Actually I just hadn't thought that through properly. But thanks for
giving me the benefit of the doubt :-)

> >=20
> > the NS view covers the whole 0x00..0xff range, but more sparsely.
> > (OK, technically you can't ever read 0xff, only 0xfe.)
>=20

You can read 0xff, because 0xff will be written when either 0xfe or 0xff
are written. Then, when reading, priority =3D=3D 0xff will fail the !=3D =
0xff
test (which is QEMU's implementation of the pseudo code where PRIMask()
is hardcoded to 0xff). In that case it'll just return the priority value
unchanged, which is 0xff.

Thanks,
drew
