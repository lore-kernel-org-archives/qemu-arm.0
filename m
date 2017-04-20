Received: by 10.25.0.144 with SMTP id 138csp799133lfa;
        Thu, 20 Apr 2017 08:59:41 -0700 (PDT)
X-Received: by 10.200.44.36 with SMTP id d33mr9359290qta.198.1492703981466;
        Thu, 20 Apr 2017 08:59:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n23si6295065qkl.68.2017.04.20.08.59.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 20 Apr 2017 08:59:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54714 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d1EUe-0001WF-U9
	for alex.bennee@linaro.org; Thu, 20 Apr 2017 11:59:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58489)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1d1EUY-0001UX-R2
	for qemu-arm@nongnu.org; Thu, 20 Apr 2017 11:59:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1d1EUV-0001cH-KF
	for qemu-arm@nongnu.org; Thu, 20 Apr 2017 11:59:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60908)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1d1EUV-0001bX-B0; Thu, 20 Apr 2017 11:59:31 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 498B475EC5;
	Thu, 20 Apr 2017 15:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 498B475EC5
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 498B475EC5
Received: from blackfin.pond.sub.org (ovpn-116-149.ams2.redhat.com
	[10.36.116.149])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFD8F173A9;
	Thu, 20 Apr 2017 15:59:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 3A8581138646; Thu, 20 Apr 2017 17:59:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20170414083717.13641-1-lvivier@redhat.com>
	<CAFEAcA-NTpaXL9foLOqZ1AyBOcFokKfJGMxicQFXeAzkMATfBA@mail.gmail.com>
Date: Thu, 20 Apr 2017 17:59:27 +0200
In-Reply-To: <CAFEAcA-NTpaXL9foLOqZ1AyBOcFokKfJGMxicQFXeAzkMATfBA@mail.gmail.com>
	(Peter Maydell's message of "Thu, 20 Apr 2017 14:02:38 +0100")
Message-ID: <871ssn9ijk.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 20 Apr 2017 15:59:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 0/4] qdev: remove all
 remaining cannot_destroy_with_object_finalize_yet
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bszr90243PjX

Peter Maydell <peter.maydell@linaro.org> writes:

> On 14 April 2017 at 09:37, Laurent Vivier <lvivier@redhat.com> wrote:
>> This series removes all the remaining uses of
>> cannot_destroy_with_object_finalize_yet to finally remove
>> the flag itself.
>>
>> The ARM patch has already been sent alone and reviewed by Markus.
>> I have tested the ppc one on ppc64 machine with KVM and using
>> QDM device-list-properties command.
>>
>> For the versatile one, the flag allowed to workaround a problem
>> in the bus unparent function: the bus unparent is trying to
>> unparent all the children of the bus. To do that, it has a list
>> of the children of the bus, and calls object_unparent() for each
>> child, and object_unparent() calls object_property_del_child() if
>> obj->parent is not NULL.  As qdev_set_parent_bus() set only
>> parent_bus and the list of children, parent is NULL and the child
>> is never deleted.  We can avoid the problem by moving the
>> qdev_set_parent_bus() to the realize part.
>>
>> I've tested all the changes with "make check" (including
>> device-introspect-test). I've booted a versatilepb machine
>> with a 3.16.0-4 debian installer kernel.
>>
>> Laurent Vivier (4):
>>   arm: remove remaining cannot_destroy_with_object_finalize_yet
>>   ppc: remove cannot_destroy_with_object_finalize_yet
>>   versatile: remove cannot_destroy_with_object_finalize_yet
>>   qdev: remove cannot_destroy_with_object_finalize_yet
>
> Markus -- are you planning to take this whole series through
> your tree? I'm happy with the ARM patches but I guess we
> should keep the whole series together since patch 4 depends
> on the other 3...

We have no qdev maintainer.  David, you wrote you applied PATCH 2.  Are
you okay with me taking all four?  If yes, would you like me to add your
Acked-by or Reviewed-by to PATCH 2?

> I guess that means
> Acked-by: Peter Maydell <peter.maydell@linaro.org>

Noted.
