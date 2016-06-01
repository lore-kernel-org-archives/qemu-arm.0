Received: by 10.25.27.66 with SMTP id b63csp44393lfb;
        Wed, 1 Jun 2016 01:38:09 -0700 (PDT)
X-Received: by 10.140.175.4 with SMTP id v4mr35449830qhv.72.1464770277397;
        Wed, 01 Jun 2016 01:37:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d195si10549021qhd.74.2016.06.01.01.37.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Jun 2016 01:37:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40902 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b81f2-000407-OW
	for alex.bennee@linaro.org; Wed, 01 Jun 2016 04:37:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1b81Xc-0006Ol-MM
	for qemu-arm@nongnu.org; Wed, 01 Jun 2016 04:30:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1b81XY-0001ot-Ll
	for qemu-arm@nongnu.org; Wed, 01 Jun 2016 04:30:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41844)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1b81XY-0001oY-G1; Wed, 01 Jun 2016 04:30:12 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B18A064D01;
	Wed,  1 Jun 2016 08:30:10 +0000 (UTC)
Received: from [10.32.176.49] (dhcp-176-49.mxp.redhat.com [10.32.176.49])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u518U7ux007020
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 1 Jun 2016 04:30:09 -0400
To: David Gibson <david@gibson.dropbear.id.au>
References: <146468219419.25446.8053365248306938869.stgit@bahia.huguette.org>
	<81bca811-db78-ffd2-dbfc-67e14ae88ce2@redhat.com>
	<20160531151029.605aebb1@bahia.lab.toulouse-stg.fr.ibm.com>
	<0818d93b-358a-647d-b14b-698ae74031a1@redhat.com>
	<20160601023328.GB15455@voom.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <911eab48-a5a6-cba0-040a-1c3b77a46821@redhat.com>
Date: Wed, 1 Jun 2016 10:30:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <20160601023328.GB15455@voom.fritz.box>
Content-Type: text/plain; charset=windows-1252
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 01 Jun 2016 08:30:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] virtio: move bi-endian target support to a
 single location
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Greg Kurz <gkurz@linux.vnet.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hy3oJRlvau19



On 01/06/2016 04:33, David Gibson wrote:
> On Tue, May 31, 2016 at 03:15:21PM +0200, Paolo Bonzini wrote:
>>
>>
>> On 31/05/2016 15:10, Greg Kurz wrote:
>>>>>>> +#if defined(TARGET_PPC64) || defined(TARGET_ARM)
>>>>>>> +#define LEGACY_VIRTIO_IS_BIENDIAN 1
>>>>>>> +#endif =20
>>>>>
>>>>> These will only be correct if something else includes cpu.h.  Inste=
ad of
>>> Unless I missed something, the TARGET_* macros come from the generate=
d
>>> config-target.h header, which is in turn included by qemu/osdep.h and
>>> thus included by most of the code.
>>
>> You're right.  Problems _could_ happen if virtio-access.h is included =
in
>> a file compiled without -DNEED_CPU_H (i.e. with common-obj-y instead o=
f
>> obj-y) but include/exec/poison.h should take care of that.
>>
>>>>> defining this, you should add
>>>>>
>>>>> #include "cpu.h"
>>>>>
>>>>> at the top of include/hw/virtio-access.h and leave the definitions =
in
>>>>> target-*/cpu.h.
>>>>>
>>> All this bi-endian stuff is really an old-virtio-only thing... it is
>>> only to be used by virtio_access_is_big_endian(). The fact that it
>>> broke silently with your cleanup series is yet another proof that
>>> this workaround is fragile.
>>
>> It is not fragile actually.  cpu.h doesn't exist in common-obj-y, so t=
he
>> TARGET_IS_BIENDIAN define can be safely taken from cpu.h.
>>
>> Anyway because of poison.h your solution isn't fragile either, so
>>
>> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
>=20
> Should I take this through my tree?

If you don't hear from mst, go ahead.

Paolo
