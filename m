Received: by 10.25.0.144 with SMTP id 138csp110918lfa;
        Thu, 20 Apr 2017 22:44:44 -0700 (PDT)
X-Received: by 10.55.155.131 with SMTP id d125mr11180705qke.32.1492753483987;
        Thu, 20 Apr 2017 22:44:43 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 75si8471787qky.210.2017.04.20.22.44.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 20 Apr 2017 22:44:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57267 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d1RN5-0000B7-4E
	for alex.bennee@linaro.org; Fri, 21 Apr 2017 01:44:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48412)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1d1RJa-0005sf-2T
	for qemu-devel@nongnu.org; Fri, 21 Apr 2017 01:41:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1d1RJZ-0004e9-6r
	for qemu-devel@nongnu.org; Fri, 21 Apr 2017 01:41:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47904)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1d1RJS-0004YL-O9; Fri, 21 Apr 2017 01:40:58 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 989A320264;
	Fri, 21 Apr 2017 05:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 989A320264
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 989A320264
Received: from blackfin.pond.sub.org (ovpn-116-149.ams2.redhat.com
	[10.36.116.149])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5362717966;
	Fri, 21 Apr 2017 05:40:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id C35F51138646; Fri, 21 Apr 2017 07:40:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
References: <20170414083717.13641-1-lvivier@redhat.com>
Date: Fri, 21 Apr 2017 07:40:55 +0200
In-Reply-To: <20170414083717.13641-1-lvivier@redhat.com> (Laurent Vivier's
	message of "Fri, 14 Apr 2017 10:37:13 +0200")
Message-ID: <87tw5i1fo8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 21 Apr 2017 05:40:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 0/4] qdev: remove all remaining
 cannot_destroy_with_object_finalize_yet
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jxaOc93zkpVP

Laurent Vivier <lvivier@redhat.com> writes:

> This series removes all the remaining uses of
> cannot_destroy_with_object_finalize_yet to finally remove
> the flag itself.
>
> The ARM patch has already been sent alone and reviewed by Markus.
> I have tested the ppc one on ppc64 machine with KVM and using
> QDM device-list-properties command.
>
> For the versatile one, the flag allowed to workaround a problem
> in the bus unparent function: the bus unparent is trying to
> unparent all the children of the bus. To do that, it has a list
> of the children of the bus, and calls object_unparent() for each
> child, and object_unparent() calls object_property_del_child() if
> obj->parent is not NULL.  As qdev_set_parent_bus() set only
> parent_bus and the list of children, parent is NULL and the child
> is never deleted.  We can avoid the problem by moving the
> qdev_set_parent_bus() to the realize part.
>
> I've tested all the changes with "make check" (including
> device-introspect-test). I've booted a versatilepb machine
> with a 3.16.0-4 debian installer kernel.

Applied to my tree, thanks!
