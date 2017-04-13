Received: by 10.25.0.144 with SMTP id 138csp617098lfa;
        Thu, 13 Apr 2017 00:07:10 -0700 (PDT)
X-Received: by 10.55.77.86 with SMTP id a83mr1369531qkb.6.1492067230679;
        Thu, 13 Apr 2017 00:07:10 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m41si5361861qtb.264.2017.04.13.00.07.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Apr 2017 00:07:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47698 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cyYqR-00021R-R0
	for alex.bennee@linaro.org; Thu, 13 Apr 2017 03:07:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cyYqJ-0001yf-VY
	for qemu-arm@nongnu.org; Thu, 13 Apr 2017 03:07:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cyYqG-000381-RC
	for qemu-arm@nongnu.org; Thu, 13 Apr 2017 03:06:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54618)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cyYqG-00037w-Lh; Thu, 13 Apr 2017 03:06:56 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 29AC37E9F9;
	Thu, 13 Apr 2017 07:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 29AC37E9F9
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 29AC37E9F9
Received: from blackfin.pond.sub.org (ovpn-116-81.ams2.redhat.com
	[10.36.116.81])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E15578865A;
	Thu, 13 Apr 2017 07:06:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 625231138646; Thu, 13 Apr 2017 09:06:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
References: <20170412173203.20072-1-lvivier@redhat.com>
Date: Thu, 13 Apr 2017 09:06:53 +0200
In-Reply-To: <20170412173203.20072-1-lvivier@redhat.com> (Laurent Vivier's
	message of "Wed, 12 Apr 2017 19:32:03 +0200")
Message-ID: <87efwwrdki.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 13 Apr 2017 07:06:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] arm: remove remaining
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
	Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h0v7y/H/dAmG

Laurent Vivier <lvivier@redhat.com> writes:

> With commit ce5b1bbf624b ("exec: move cpu_exec_init() calls to
> realize functions"), we can now remove all the
> remaining cannot_destroy_with_object_finalize_yet as
> unsafe references have been moved to cpu_exec_realizefn().
> (tested with QOM command provided by commit 4c315c27).

Also tested with device-introspect-test :)

> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Thanks, Laurent!

Reviewed-by: Markus Armbruster <armbru@redhat.com>

Just three places marking broken devices left: versatile.c
("realview_pci" and "versatile_pci"), target/ppc/kvm.c (various ppc
CPUs).  Volunteers to fix them, so we can get rid of
cannot_destroy_with_object_finalize_yet?
