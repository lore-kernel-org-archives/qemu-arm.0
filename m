Received: by 10.28.71.155 with SMTP id m27csp862322wmi;
        Wed, 11 Apr 2018 08:36:12 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/ZMvcRECunwwPkfabVv8p6TmgrOt/vhFdiXOf6cfv0H0cLqSeB17zsz3tqAPFSdxFsqG2f
X-Received: by 10.55.4.132 with SMTP id 126mr7433314qke.277.1523460972739;
        Wed, 11 Apr 2018 08:36:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523460972; cv=none;
        d=google.com; s=arc-20160816;
        b=ec2Vu1ZrnyE9/EaTVHG2gSHvTQPDRdsZ/OlxGc+vKBFZ4xr9dDa1SnnvRZOJxnLj5e
         63lPUqOm+bnaE2xDbIzzI5OHbpEE6Eg8JAft3Y3DTAdkqigqU3SVG3LPMiFgKWWWPryh
         CCbOMAoJkD0VoE5sIvtmh4Am2KvC8RUnwjHkdVdZos67qpBxRXZTTvSSwatTCMr8kuKp
         47DC0DVebMGbB7inh/rM6iS5jXN3SsP6zK9dMJ5LC9TVL0+f1SdaZYv+WOmHVX9rPV4p
         rmdr2P7SLzwVi9M2ju4kXSMMfNp9e5qpQMinFri48zu3Iq4LbhXrz+jjVaVe5FYR0Mxj
         PaFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to:date
         :to:from:message-id:arc-authentication-results;
        bh=gwFqb88O1qB7EQTiPOVffHpICVAHpPHZIU5i8XY8dFk=;
        b=FZk7uobrku4JvbS0OSi1rwZw9YvDZ5z1cpm/ZgMJprU1V1HII8LJlMdIXS5NcCfYgA
         lW/qSqwCm7jfIeNe4BdelWlw9pLqsSf1PlJqYym3FVsGn4yqXMudXjblEpOqa02ca25T
         sxcGKuMkKR3lEIXN0RE14M9cqwFasHL4m94kQ2JBqd0KvkiDSLW7XjIYoSqSVVW+gsb0
         AMzzCX2cK5IQHJpEDZByB1zW4i0FKSGOmAE+QPjJybqLjVb1u795wQTPRuI7xOYATi0F
         DW8/7JedDfH/snFf4NUPLhXoDcwBndu8iKTB5FUiNllr/FLMoY0affycV5rT06c1HFOh
         XUIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x83si1650403qka.472.2018.04.11.08.36.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Apr 2018 08:36:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35217 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6HnA-0006W8-6g
	for alex.bennee@linaro.org; Wed, 11 Apr 2018 11:36:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1f6Hn3-0006Vu-EW
	for qemu-arm@nongnu.org; Wed, 11 Apr 2018 11:36:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1f6Hmy-0001FL-Ga
	for qemu-arm@nongnu.org; Wed, 11 Apr 2018 11:36:05 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59304 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <abologna@redhat.com>)
	id 1f6Hmy-0001EY-CB; Wed, 11 Apr 2018 11:36:00 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 57A1741629DD;
	Wed, 11 Apr 2018 15:35:59 +0000 (UTC)
Received: from ovpn-205-97.brq.redhat.com (unknown [10.40.205.97])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F075202698A;
	Wed, 11 Apr 2018 15:35:57 +0000 (UTC)
Message-ID: <1523460955.2942.5.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>
Date: Wed, 11 Apr 2018 17:35:55 +0200
In-Reply-To: <20180410085200.GD5155@redhat.com>
References: <20180409154921.29906-1-wei@redhat.com>
	<20180409155634.GO18283@redhat.com>
	<6bb12858-3b4e-e92f-93ea-b8708c8be870@redhat.com>
	<1523346093.16671.23.camel@redhat.com>
	<20180410085200.GD5155@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 11 Apr 2018 15:35:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 11 Apr 2018 15:35:59 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'abologna@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/1] mach-virt: Change default
 cpu and gic-version setting to "max"
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S1qi78cMVONf

On Tue, 2018-04-10 at 09:52 +0100, Daniel P. Berrang=C3=A9 wrote:
> On Tue, Apr 10, 2018 at 09:41:33AM +0200, Andrea Bolognani wrote:
> > I figure the people not explicitly specifying a CPU model on the
> > command line will probably also use '-M virt' instead of versioned
> > machine types, which means they will get a different guest behavior
> > after upgrading QEMU regardless.
>=20
> Libvirt uses versioned machine types and does not specify -cpu unless t=
he
> user has added <cpu> to their XML. IOW libvirt assumes the default CPU
> model is stable because that's what QEMU has promised in the past.

Hm, you have a point.

I wonder how well that works in practice, though. I started a guest
with no <cpu> element on my laptop and it ended up having

  vendor_id	 : GenuineIntel
  cpu family : 6
  model      : 6
  model name : QEMU Virtual CPU version 2.5+
  stepping   : 3

which I guess translates to the qemu64 CPU model, based on the
description. I have verified the -cpu option is not present on the
command line.

The name seems to imply that if I were using a QEMU release older
than 2.5 I would get a different CPU model, but maybe the stable CPU
guarantee you mention is just a fairly recent development.

I also know that ppc64 performs some trickery if you don't specify a
CPU model, so by default you get a behavior which is pretty close to
using -cpu host.

Basically I'm wondering how reasonable it is to expect a migratable
machine and a stable guest ABI when relying on QEMU defaults instead
of explicitly picking a CPU model.

--=20
Andrea Bolognani / Red Hat / Virtualization
