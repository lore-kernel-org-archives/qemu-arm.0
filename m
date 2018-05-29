Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3931946wre;
        Tue, 29 May 2018 12:38:51 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL6R+L77HeLrOSqNF/KIgAI5qitMDvBrn0hIasT5VOPhm/Cq8Q0JPI3TuHKg79LPzMKenkj
X-Received: by 2002:a37:8202:: with SMTP id e2-v6mr6507112qkd.443.1527622731547;
        Tue, 29 May 2018 12:38:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527622731; cv=none;
        d=google.com; s=arc-20160816;
        b=ADO6Q6W2V0f2hI16U7ChTbVvzOlnmbSxiVenPKw9Rg0oYqSjZtPMecKOrxG+rXwtaI
         uMGhjWptKBWWYgjznMjaD6wM9AWmPsbXgfIgA0cjTgRrOFCllgSc4wKfLVI6XhreKxhk
         jhlBqH+aSkHp5NLkpeykB6uTeZTZX7hZhJa89mS5kmGRaA9kuQHD+l6ADrOqsn4CsOBW
         t2POSCELyvUmG3cdsc5WI8XDomeYzU1GfbCuAKmzVy6OwGiz6KunboV5tR7IIMuABEFB
         SNCEDYAZsmG/BRpFjlPH4XONt+cFMbma4YRBNp1NoXQz15/KD0lgKCDhTFDjAQFihKth
         Vkmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=bEMmIWDozYXfh3EvXFIt9KaV2y7ZT6lnt3CPgUuYFzk=;
        b=asCk3syVAXWg2tnwqgFsGJ/Rx3WRTkL6WUUcrtZEvVkAADCsqGrj4O8afPTWa9WU7i
         aIO3khpBFb/TLpDy3SFZF72Ib/uJazGeWf8uJRmIYuq9N1grfVMGmF23NW6mPb9ntqzC
         6Fytr+lsq+ETW+YAFStalDsCA6EGPWx2bXm4LHvhrmE1Am20GJ0X3YmxjPXGl4cJq4j4
         DoIRAHPjw3Otk0/QTUhwG1uPSVpy7/Hk3zRGxOJZrGCvBgZG7p6SnuuhTPtPDYOrujqW
         coB2VYZMgc41oanargPI9WoeZMjGL4UHegXBP1RT4tClsAQCNc+ableBzuzoxmt4AIj8
         0kwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q64-v6si1709860qkb.166.2018.05.29.12.38.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 12:38:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34649 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNkSI-0000tH-Vz
	for alex.bennee@linaro.org; Tue, 29 May 2018 15:38:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36707)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNkRj-0000qP-N6
	for qemu-devel@nongnu.org; Tue, 29 May 2018 15:38:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNkRi-0006VX-Gv
	for qemu-devel@nongnu.org; Tue, 29 May 2018 15:38:15 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40776 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fNkRb-0006RE-O3; Tue, 29 May 2018 15:38:07 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3EBCF4022905;
	Tue, 29 May 2018 19:38:07 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CF501117653;
	Tue, 29 May 2018 19:38:02 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20180529174821.19964-1-f4bug@amsat.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <b093773f-fe16-776f-f379-13ad776a954c@redhat.com>
Date: Tue, 29 May 2018 21:38:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180529174821.19964-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 29 May 2018 19:38:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 29 May 2018 19:38:07 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [PATCH 0/4] qapi/error: converts
 error_setg(&error_fatal) to error_report() + exit()
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-block@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UF+EYq/5qw7a

Hi,

On 05/29/2018 07:48 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi,
>=20
> This series converts error_setg(&error_fatal) to error_report() + exit(=
) as
> suggested by the "qapi/error.h" documentation.
>=20
> This reduce Coverity and Clang static analyzer positive falses.
>=20
> See http://lists.nongnu.org/archive/html/qemu-devel/2017-07/msg07585.ht=
ml:
>=20
>     On 07/24/2017 04:52 PM, Eric Blake wrote:
>     That's a shame.  Rather, we should patch this file (and others) to =
avoid
>     all the inconsistent uses of error_setg(&error_*), to comply with t=
he
>     error.h documentation.

Thanks for the fix.

For the series:
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

>=20
> Regards,
>=20
> Phil.
>=20
> Philippe Mathieu-Daud=C3=A9 (4):
>   hw/block/fdc: Replace error_setg(&error_abort) by error_report() + ab=
ort()
>   hw/ppc/spapr_drc: Replace error_setg(&error_abort) by error_report() =
+
>     abort()
>   hw/arm/sysbus-fdt: Replace error_setg(&error_fatal) by error_report()
>     + exit()
>   device_tree: Replace error_setg(&error_fatal) by error_report() + exi=
t()
>=20
>  device_tree.c       | 23 +++++++++++++----------
>  hw/arm/sysbus-fdt.c | 45 ++++++++++++++++++++++++++-------------------
>  hw/block/fdc.c      |  7 ++++---
>  hw/ppc/spapr_drc.c  |  3 ++-
>  4 files changed, 45 insertions(+), 33 deletions(-)
>=20
