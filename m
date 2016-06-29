Received: by 10.25.21.96 with SMTP id l93csp2242394lfi;
        Wed, 29 Jun 2016 08:56:00 -0700 (PDT)
X-Received: by 10.129.48.85 with SMTP id w82mr4033715yww.152.1467215760261;
        Wed, 29 Jun 2016 08:56:00 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b71si3427444qka.336.2016.06.29.08.56.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 29 Jun 2016 08:56:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44581 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bIHqJ-0003OJ-PU
	for alex.bennee@linaro.org; Wed, 29 Jun 2016 11:55:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bIHqG-0003OC-7Y
	for qemu-arm@nongnu.org; Wed, 29 Jun 2016 11:55:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bIHqA-0005IM-MW
	for qemu-arm@nongnu.org; Wed, 29 Jun 2016 11:55:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46389)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bIHqA-0005Hs-GL; Wed, 29 Jun 2016 11:55:50 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 26D1E552FE;
	Wed, 29 Jun 2016 15:55:47 +0000 (UTC)
Received: from [10.36.112.42] (ovpn-112-42.ams2.redhat.com [10.36.112.42])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5TFtbol030541
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 29 Jun 2016 11:55:39 -0400
To: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-devel@nongnu.org
References: <1467150268-11038-1-git-send-email-andrew.smirnov@gmail.com>
	<1467150268-11038-2-git-send-email-andrew.smirnov@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <daa5a9d7-bc26-71ab-cc74-c3a6f0f8787b@redhat.com>
Date: Wed, 29 Jun 2016 17:55:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1467150268-11038-2-git-send-email-andrew.smirnov@gmail.com>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 29 Jun 2016 15:55:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC PATCH] exec: Support non-direct memory writes
 in cpu_memory_rw_debug
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
	Marcelo Tosatti <mtosatti@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"open list:X86" <kvm@vger.kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Luiz Capitulino <lcapitulino@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Alexander Graf <agraf@suse.de>, "open list:ARM" <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
	Cornelia Huck <cornelia.huck@de.ibm.com>,
	"open list:PReP" <qemu-ppc@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Leon Alrae <leon.alrae@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lCU1zSkpp9tk

On 28/06/2016 23:44, Andrey Smirnov wrote:
> Add code to support writing to memory mapped peripherals via
> cpu_memory_rw_debug(). The code of that function already supports
> reading from such memory regions, so this commit makes that
> functionality "symmetric".

It's not entirely symmetric however, as you cannot write to the MMIO
registers of romd devices.  Is this correct?  So I'll leave to others
the review of whether the functionality is appropriate.  Regarding the co=
de:

> @@ -2621,7 +2625,7 @@ static MemTxResult address_space_write_continue(A=
ddressSpace *as, hwaddr addr,
>  }
> =20
>  MemTxResult address_space_write(AddressSpace *as, hwaddr addr, MemTxAt=
trs attrs,
> -                                const uint8_t *buf, int len)
> +                                const uint8_t *buf, int len, bool forc=
e)

I would prefer to leave this API as is, and instead add a new API such
as address_space_write_debug or address_space_program.  It's okay to add
the "force" argument to address_space_write_continue.

>=20
> +typedef enum {
> +    MEMTX_READ,
> +    MEMTX_WRITE,
> +    MEMTX_PROGRAM,
> +} MemTxType;

This needs comments.  If you go with address_space_write_debug, rename
MEMTX_PROGRAM to MEMTX_WRITE_DEBUG.

Thanks,

Paolo
