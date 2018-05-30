Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4318028wre;
        Tue, 29 May 2018 21:42:21 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJCZ8NA415dG6c3ViaBbCf5bFtKwagPUg8dtZxJwfTktRt/zGFlEJk0rBjnxP/EXMotqDRU
X-Received: by 2002:a37:c40d:: with SMTP id d13-v6mr1031846qki.340.1527655341257;
        Tue, 29 May 2018 21:42:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527655341; cv=none;
        d=google.com; s=arc-20160816;
        b=ObXlrUj2/ZHvnm6yKK2SxCCf/J3x7zquF1qcCgDLe6pb+jjiAzrcxV+OsqJXcb5D/P
         Lxh8fufBKTn1a3a+9d70LFaY/lULCyHRsMgGJVb9drc7sChr1ZJ/iTl6OJ+009ssfwhe
         eMzEFtR0GBrakUJCmmCfcrLe6YnHEOH7mEBXsuX8oifHeEUTqysxxZf+z4RehQAT0z+F
         Dd4Ih5VgK7k13hAV/+QZJhBAEfKzXvelrkXanJIOVWPtbkpDkn1RGBlGBZyK8jJpOeiX
         oOBpk1Od28V8g9Mp7xw7+mXzqOvgEY9p1k7tna8mtVAbQaF7bh7x1SzN7Iao+DYElYov
         b0Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=v3jGKvftPZfZbmcMtXwMaxT14KyaQF3SiHjYSYBUAz8=;
        b=OA0wqCKLUxS/YnOdjbllugA3OSH8S9muq0K7SIC7xd5Bv/hz5+EPrXb1DYi5inkEyg
         gzz0/BbenAmYlhsG+0SzUTTe7knEx6cl/g7RUQwb1BHQpBShgIHbLdI7AcSrXct14pAf
         mVM9UmrhoCYsvbfPS842fM9GaW4HE3wP8kzF39E5DcCvUEBckNt3nnRz19LSpC63ymwo
         84xos4aoQDmig81yT8j5AbUdnuk5SYIanLa84oiodYInBH/R/iqLBGvDByBf17HJSly0
         GkgWNdTxnj6fLze9qgiUK9mENEOgqr8+4VKCicfcHMOOwR2kQrNIJGTmSb2YQ4IV4gCk
         r68g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v3-v6si9569960qkl.237.2018.05.29.21.42.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 21:42:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36169 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNswG-0002ZC-Qu
	for alex.bennee@linaro.org; Wed, 30 May 2018 00:42:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45685)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1fNsw6-0002Z1-PY
	for qemu-arm@nongnu.org; Wed, 30 May 2018 00:42:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1fNsw3-0007K6-O0
	for qemu-arm@nongnu.org; Wed, 30 May 2018 00:42:10 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49314 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1fNsw3-0007Jk-I4; Wed, 30 May 2018 00:42:07 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 525D676F91;
	Wed, 30 May 2018 04:42:04 +0000 (UTC)
Received: from redhat.com (ovpn-120-96.rdu2.redhat.com [10.10.120.96])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C76532166BB2;
	Wed, 30 May 2018 04:42:01 +0000 (UTC)
Date: Wed, 30 May 2018 07:42:01 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20180530074026-mutt-send-email-mst@kernel.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
	<20180528232719.4721-10-f4bug@amsat.org>
	<20180529134053.1ea9f46d.cohuck@redhat.com>
	<11289f38-6d0f-74c9-1719-83b2a3ed2d97@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <11289f38-6d0f-74c9-1719-83b2a3ed2d97@amsat.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 30 May 2018 04:42:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 30 May 2018 04:42:04 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v4 09/21] target: Do not include
 "exec/exec-all.h" if it is not necessary
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
	Eduardo Habkost <ehabkost@redhat.com>,
	"open list:S390" <qemu-s390x@nongnu.org>,
	David Hildenbrand <david@redhat.com>, qemu-trivial@nongnu.org,
	Anthony Green <green@moxielogic.com>,
	Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, Laurent Vivier <laurent@vivier.eu>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vApD8VbjYf17

On Wed, May 30, 2018 at 12:12:55AM -0300, Philippe Mathieu-Daud=E9 wrote:
> Hi Cornelia,
>=20
> On 05/29/2018 08:40 AM, Cornelia Huck wrote:
> > On Mon, 28 May 2018 20:27:07 -0300
> > Philippe Mathieu-Daud=E9 <f4bug@amsat.org> wrote:
> >=20
> >> Code change produced with:
> >>     $ git grep '#include "exec/exec-all.h"' | \
> >>       cut -d: -f-1 | \
> >>       xargs egrep -L "(cpu_address_space_init|cpu_loop_|tlb_|tb_|GET=
PC|singlestep|TranslationBlock)" | \
> >=20
> > Hm, does this expression catch all files that need to include
> > exec-all.h? The resulting patch seems fine, though.
>=20
> No, not all :/
> I started with "(cpu_loop_|tlb_|tb_)" then kept brutebuilding until no
> more errors appear. In 2 more steps I added "cpu_address_space_init|"
> then "|GETPC|singlestep|TranslationBlock". Quick and dirty enough for m=
y
> goal than trying to build a regex to explode function/struct names from
> headers. This is a clever way to do it for long term command reuse take=
n
> from commit messages...

Brutebuilding isn't a good way to find unused includes, some other header
might pull in an include you are trying to remove for its own purposes.
If you want to try brutebuilding you must also verify that's
not the case - e.g. look at the dependency file generated.

> >>       xargs sed -i.bak '/#include "exec\/exec-all.h"/d'
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
