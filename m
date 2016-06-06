Received: by 10.25.27.66 with SMTP id b63csp1494874lfb;
        Mon, 6 Jun 2016 06:41:37 -0700 (PDT)
X-Received: by 10.140.25.150 with SMTP id 22mr15600853qgt.34.1465220496976;
        Mon, 06 Jun 2016 06:41:36 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r2si12076429qtb.129.2016.06.06.06.41.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Jun 2016 06:41:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42561 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b9ume-00037O-EM
	for alex.bennee@linaro.org; Mon, 06 Jun 2016 09:41:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47090)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1b9uma-00037I-Ma
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 09:41:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1b9umV-0001TP-Ot
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 09:41:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60953)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1b9umV-0001TL-JV; Mon, 06 Jun 2016 09:41:27 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D3A6519C33B;
	Mon,  6 Jun 2016 13:41:26 +0000 (UTC)
Received: from [10.36.112.64] (ovpn-112-64.ams2.redhat.com [10.36.112.64])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u56DfMDJ022437
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 6 Jun 2016 09:41:24 -0400
To: David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <gkurz@linux.vnet.ibm.com>
References: <146468219419.25446.8053365248306938869.stgit@bahia.huguette.org>
	<81bca811-db78-ffd2-dbfc-67e14ae88ce2@redhat.com>
	<20160531151029.605aebb1@bahia.lab.toulouse-stg.fr.ibm.com>
	<0818d93b-358a-647d-b14b-698ae74031a1@redhat.com>
	<20160601023328.GB15455@voom.fritz.box>
	<20160602180437.02f3ed85@bahia.huguette.org>
	<20160603011604.GE1087@voom.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <dd7942b2-3fb6-3e6a-b404-8e92a719a247@redhat.com>
Date: Mon, 6 Jun 2016 15:41:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <20160603011604.GE1087@voom.fritz.box>
Content-Type: text/plain; charset=windows-1252
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 06 Jun 2016 13:41:27 +0000 (UTC)
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
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: faAPAv/nye3H



On 03/06/2016 03:16, David Gibson wrote:
> On Thu, Jun 02, 2016 at 06:04:37PM +0200, Greg Kurz wrote:
>> On Wed, 1 Jun 2016 12:33:28 +1000
>> David Gibson <david@gibson.dropbear.id.au> wrote:
>>
>>> On Tue, May 31, 2016 at 03:15:21PM +0200, Paolo Bonzini wrote:
>>>>
>>>>
>>>> On 31/05/2016 15:10, Greg Kurz wrote: =20
>>>>>>>>> +#if defined(TARGET_PPC64) || defined(TARGET_ARM)
>>>>>>>>> +#define LEGACY_VIRTIO_IS_BIENDIAN 1
>>>>>>>>> +#endif   =20
>>>>>>>
>>>>>>> These will only be correct if something else includes cpu.h.  Ins=
tead of =20
>>>>> Unless I missed something, the TARGET_* macros come from the genera=
ted
>>>>> config-target.h header, which is in turn included by qemu/osdep.h a=
nd
>>>>> thus included by most of the code. =20
>>>>
>>>> You're right.  Problems _could_ happen if virtio-access.h is include=
d in
>>>> a file compiled without -DNEED_CPU_H (i.e. with common-obj-y instead=
 of
>>>> obj-y) but include/exec/poison.h should take care of that.
>>>>  =20
>>>>>>> defining this, you should add
>>>>>>>
>>>>>>> #include "cpu.h"
>>>>>>>
>>>>>>> at the top of include/hw/virtio-access.h and leave the definition=
s in
>>>>>>> target-*/cpu.h.
>>>>>>>  =20
>>>>> All this bi-endian stuff is really an old-virtio-only thing... it i=
s
>>>>> only to be used by virtio_access_is_big_endian(). The fact that it
>>>>> broke silently with your cleanup series is yet another proof that
>>>>> this workaround is fragile. =20
>>>>
>>>> It is not fragile actually.  cpu.h doesn't exist in common-obj-y, so=
 the
>>>> TARGET_IS_BIENDIAN define can be safely taken from cpu.h.
>>>>
>>>> Anyway because of poison.h your solution isn't fragile either, so
>>>>
>>>> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com> =20
>>>
>>> Should I take this through my tree?
>>>
>>
>> That would be great !
>=20
> Actually, that was a question for Paolo..

It would be more of a question for mst; I do not maintain virtio (that's
why I wrote R-b and not Acked-by).

Thanks,

Paolo
