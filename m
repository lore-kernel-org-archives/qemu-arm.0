Received: by 10.25.0.144 with SMTP id 138csp1710143lfa;
        Tue, 18 Apr 2017 06:26:55 -0700 (PDT)
X-Received: by 10.237.61.174 with SMTP id i43mr13186337qtf.103.1492522015422;
        Tue, 18 Apr 2017 06:26:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k13si13853098qkl.146.2017.04.18.06.26.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Apr 2017 06:26:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41917 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d0T9i-0000nA-G7
	for alex.bennee@linaro.org; Tue, 18 Apr 2017 09:26:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1d0T9d-0000lW-Gy
	for qemu-arm@nongnu.org; Tue, 18 Apr 2017 09:26:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1d0T9c-0003ND-CG
	for qemu-arm@nongnu.org; Tue, 18 Apr 2017 09:26:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55044)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1d0T9c-0003My-6d; Tue, 18 Apr 2017 09:26:48 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F2A0CC059746;
	Tue, 18 Apr 2017 13:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com F2A0CC059746
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com F2A0CC059746
Received: from blackfin.pond.sub.org (ovpn-116-149.ams2.redhat.com
	[10.36.116.149])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE30E7E591;
	Tue, 18 Apr 2017 13:26:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 4A7B31138646; Tue, 18 Apr 2017 15:26:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
References: <20170414083717.13641-1-lvivier@redhat.com>
	<20170414083717.13641-5-lvivier@redhat.com>
Date: Tue, 18 Apr 2017 15:26:45 +0200
In-Reply-To: <20170414083717.13641-5-lvivier@redhat.com> (Laurent Vivier's
	message of "Fri, 14 Apr 2017 10:37:17 +0200")
Message-ID: <87h91l3kyy.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 18 Apr 2017 13:26:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 4/4] qdev: remove
 cannot_destroy_with_object_finalize_yet
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +fX4EOAYWV58

Laurent Vivier <lvivier@redhat.com> writes:

> As all users have been removed, we can remove
> cannot_destroy_with_object_finalize_yet field
> from the DeviceClass structure.
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Huzzah!

Reviewed-by: Markus Armbruster <armbru@redhat.com>
