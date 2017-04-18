Received: by 10.25.0.144 with SMTP id 138csp1709765lfa;
        Tue, 18 Apr 2017 06:26:06 -0700 (PDT)
X-Received: by 10.55.161.139 with SMTP id k133mr14284283qke.33.1492521966856;
        Tue, 18 Apr 2017 06:26:06 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g17si13874813qta.51.2017.04.18.06.26.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Apr 2017 06:26:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41914 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d0T8w-0000OM-Bb
	for alex.bennee@linaro.org; Tue, 18 Apr 2017 09:26:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43623)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1d0T8s-0000O4-KJ
	for qemu-arm@nongnu.org; Tue, 18 Apr 2017 09:26:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1d0T8q-0002yG-1J
	for qemu-arm@nongnu.org; Tue, 18 Apr 2017 09:26:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50804)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1d0T8p-0002xH-Px; Tue, 18 Apr 2017 09:25:59 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F2F93811A7;
	Tue, 18 Apr 2017 13:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com F2F93811A7
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com F2F93811A7
Received: from blackfin.pond.sub.org (ovpn-116-149.ams2.redhat.com
	[10.36.116.149])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 756984FA25;
	Tue, 18 Apr 2017 13:25:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D52F11138646; Tue, 18 Apr 2017 15:25:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
References: <20170414083717.13641-1-lvivier@redhat.com>
	<20170414083717.13641-4-lvivier@redhat.com>
Date: Tue, 18 Apr 2017 15:25:55 +0200
In-Reply-To: <20170414083717.13641-4-lvivier@redhat.com> (Laurent Vivier's
	message of "Fri, 14 Apr 2017 10:37:16 +0200")
Message-ID: <87lgqx3l0c.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 18 Apr 2017 13:25:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 3/4] versatile: remove
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
X-TUID: 12iHNgcTBvJc

Laurent Vivier <lvivier@redhat.com> writes:

> cannot_destroy_with_object_finalize_yet was added by 4c315c2
> ("qdev: Protect device-list-properties against broken devices")
> because "realview_pci" and "versatile_pci" were hanging
> during "device-list-properties" cleanup (an infinite loop in
> bus_unparent()).
>
> We have this problem because the child is not removed from
> the list of the PCI bus child because it has no defined parent:

s/child/children/

> qdev_set_parent_bus() set the device parent_bus pointer to bus, and
> adds the device in the bus children list, but doesn't update the
> device parent pointer.
>
> To fix the problem, move all the involved parts to the realize function.
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

The devices aren't unpluggable.  There is no unrealize().  How work
needs to be spread between init and realize isn't obvious to me in
general.  I can see this work done both in init and in realize.  I
figure the move is okay.

Reviewed-by: Markus Armbruster <armbru@redhat.com>
