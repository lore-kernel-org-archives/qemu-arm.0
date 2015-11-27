Received: by 10.182.158.201 with SMTP id ww9csp989713obb;
        Thu, 26 Nov 2015 18:33:59 -0800 (PST)
X-Received: by 10.140.101.41 with SMTP id t38mr50189050qge.53.1448591639926;
        Thu, 26 Nov 2015 18:33:59 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s73si29243469qks.111.2015.11.26.18.33.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Nov 2015 18:33:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54289 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a28rH-0000vj-K5
	for alex.bennee@linaro.org; Thu, 26 Nov 2015 21:33:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a28qS-0008P1-9L
	for qemu-devel@nongnu.org; Thu, 26 Nov 2015 21:33:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a28qQ-0000x7-WA
	for qemu-devel@nongnu.org; Thu, 26 Nov 2015 21:33:08 -0500
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231]:32969)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1a28qQ-0000ws-Pb; Thu, 26 Nov 2015 21:33:06 -0500
Received: by wmec201 with SMTP id c201so51916367wme.0;
	Thu, 26 Nov 2015 18:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=IiMtu9Pu0Ijpjd/LBlYUih8k0JTW3vx9eQCWHYJL3mM=;
	b=Hf/hhUky38MOd2nGg+9Jp678jPfEm0I641pd6QQVZ+LHbSxcTxX3QoWajocV3Tz2o4
	jGfV+T1sUe99Rd+hTw8o+aXlGP3d6Ebg4OCCS1GqDcDjdP/PXb6cESz+CyAPCwRaJSXu
	jJKwzfptQTP0SWWA7gqXVN0nHifOhnQSO8ObWOU4bTgCpsgzUhK6GayHpvGCa5opv3CT
	y6L4cFoKwwVfewoW94X75GOqpwHpXw1R7uffuZUoS7XFGFERbOoB21DZ84QKoOGSQoMe
	89S5JrJ61d+cvs02aR723bV4uJ34dUmWyU+Z+qvn/E0ld84Gx5nCAx1GVIMXpkeML8va
	g0rg==
MIME-Version: 1.0
X-Received: by 10.194.114.105 with SMTP id jf9mr51513367wjb.102.1448591586228; 
	Thu, 26 Nov 2015 18:33:06 -0800 (PST)
Received: by 10.28.88.11 with HTTP; Thu, 26 Nov 2015 18:33:06 -0800 (PST)
In-Reply-To: <5656B148.1020408@tribudubois.net>
References: <cover.1447964804.git.jcd@tribudubois.net>
	<469d346516e3bf701e5386abc43a845fa46d18cf.1447964804.git.jcd@tribudubois.net>
	<CAPokK=qvFbCPFH4x8=Zp+Kg0wvXVX2UVe2N0VFuBzDQSDiQF1w@mail.gmail.com>
	<5656B148.1020408@tribudubois.net>
Date: Thu, 26 Nov 2015 18:33:06 -0800
Message-ID: <CAPokK=qW4oNtin2fN3MzVfjVUvBHkGgg+HTREW2gdA1T3KmKPw@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::231
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v3 3/3] i.MX: Add an i.MX25 specific CCM
	class/instance.
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HLvJSy4+YcPU

On Wed, Nov 25, 2015 at 11:14 PM, Jean-Christophe DUBOIS
<jcd@tribudubois.net> wrote:
> Le 25/11/2015 06:51, Peter Crosthwaite a =C3=A9crit :
>>
>> On Thu, Nov 19, 2015 at 12:40 PM, Jean-Christophe Dubois
>> <jcd@tribudubois.net> wrote:
>>>
>>> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
>>> ---
>>>
>>> Changes since v1:
>>>   * rework loging to match other i.MX drivers
>>>
>>> Changes since v2:
>>>   * We moved to an inheritance QOM scheme
>>>
>>>   hw/arm/fsl-imx25.c          |   2 +-
>>>   hw/misc/Makefile.objs       |   1 +
>>>   hw/misc/imx25_ccm.c         | 243
>>> ++++++++++++++++++++++++++++++++++++++++++++
>>>   include/hw/arm/fsl-imx25.h  |   4 +-
>>>   include/hw/misc/imx25_ccm.h |  59 +++++++++++
>>>   5 files changed, 306 insertions(+), 3 deletions(-)
>>>   create mode 100644 hw/misc/imx25_ccm.c
>>>   create mode 100644 include/hw/misc/imx25_ccm.h
>>>

>>> +    s->mcr =3D 0x43000000;
>>> +    s->lpimr[0] =3D 0;
>>> +    s->lpimr[1] =3D 0;
>>> +
>>> +    /* default ROM boot will change the reset values */
>>> +    s->cctl |=3D INSERT(1, ARM_SRC);
>>> +    s->cctl |=3D INSERT(1, AHB_CLK_DIV);
>>> +}
>>> +
>>> +static uint64_t imx25_ccm_read(void *opaque, hwaddr offset, unsigned
>>> size)
>>> +{
>>> +    IMX25CCMState *s =3D (IMX25CCMState *)opaque;
>>> +    uint32_t *reg =3D &s->mpctl;
>>
>> If you want the best of both worlds for the register indexing scheme
>> (e.g. array + set of names) an anonymous union-struct would work
>> better. There are some in tree precedents. E.g. from hcd-ehci.h:
>>
>>      union {
>>          uint32_t opreg[0x44/sizeof(uint32_t)];
>>          struct {
>>              uint32_t usbcmd;
>>              uint32_t usbsts;
>>              uint32_t usbintr;
>>              uint32_t frindex;
>>              uint32_t ctrldssegment;
>>              uint32_t periodiclistbase;
>>              uint32_t asynclistaddr;
>>              uint32_t notused[9];
>>              uint32_t configflag;
>>          };
>>      };
>
>
> Well, I think I'll move later to an uint32_t array only with REG name val=
ues
> as index.
> But I'll do it for both i.MX25 and i.MX31 at the same time.
>

So I am having a look at 31, and it seems the register map tightly
packed (suitable for arrayification), however the original model only
chooses to define a handful a registers interspersed through the
memory region. I have a two patch series that adds the missing
registers and converts i.MX31 CCM to union-struct. I have tested this,
at least booting Linux as far as:

[   20.934484] VFS: Cannot open root device ...
[   20.935476] Please append a correct "root=3D" boot option; here are
the available partitions:

One problem with cleaning this up later is conversion to array changes
the fields as known to VMSD requiring a version bump. I think it is
better to lead out with arrayification for i.MX25 if that is the long
term solution. My patches for 31 are here:

https://github.com/pcrost/qemu/tree/imx-ccm.next

Regards,
Peter
