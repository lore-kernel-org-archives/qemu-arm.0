Received: by 10.25.208.211 with SMTP id h202csp1094987lfg;
        Wed, 16 Mar 2016 03:42:38 -0700 (PDT)
X-Received: by 10.140.104.34 with SMTP id z31mr4025402qge.90.1458124957955;
        Wed, 16 Mar 2016 03:42:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g48si2762605qgd.15.2016.03.16.03.42.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 03:42:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54698 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ag8uT-0004yC-Cr
	for alex.bennee@linaro.org; Wed, 16 Mar 2016 06:42:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1ag8uQ-0004w0-7w
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 06:42:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1ag8uM-0008MJ-Tq
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 06:42:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55057)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>)
	id 1ag8uM-0008M8-Oj; Wed, 16 Mar 2016 06:42:30 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 06B8A64D13;
	Wed, 16 Mar 2016 10:42:30 +0000 (UTC)
Received: from dhcp129-59.brq.redhat.com (dhcp129-59.brq.redhat.com
	[10.34.129.59])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2GAgQ49019046
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 16 Mar 2016 06:42:27 -0400
Message-ID: <1458124946.8641.27.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Peter Xu <peterx@redhat.com>
Date: Wed, 16 Mar 2016 11:42:26 +0100
In-Reply-To: <CAFEAcA9QnbcUZyY_=Moi3P+wS27d4Q16e62jKOvNMhO2L72S-Q@mail.gmail.com>
References: <1457422582-28799-1-git-send-email-peterx@redhat.com>
	<CAFEAcA9QnbcUZyY_=Moi3P+wS27d4Q16e62jKOvNMhO2L72S-Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 16 Mar 2016 10:42:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: Andrew Jones <drjones@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v4 0/3] ARM: add query-gic-capabilities SMP
	command
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: C9MGA2i57Bvh

On Wed, 2016-03-16 at 10:32 +0000, Peter Maydell wrote:
> On 8 March 2016 at 07:36, Peter Xu <peterx@redhat.com> wrote:
> >=C2=A0
> > v4 changes:
> > - all: rename query-gic-capability to query-gic-capabilities [Andrea]
> > - patch 3: rename helper function to kvm_support_device, make it
> >=C2=A0=C2=A0=C2=A0inline and lighter. [Drew]
> >=C2=A0
> > v3 changes:
> > - patch 2: remove func declaration, add qmp header [Drew]
> > - patch 3: being able to detect KVM GIC capabilities even without
> >=C2=A0=C2=A0=C2=A0kvm enabled [Andrea]: this is a little bit hacky, ne=
ed some more
> >=C2=A0=C2=A0=C2=A0review on this.
> >=C2=A0
> > v2 changes:
> > - result layout change: use array and dict for the capability bits
> >=C2=A0=C2=A0=C2=A0rather than a single array of strings [Andrea/Markus=
]
> > - spelling out what GIC is in doc [Eric]
> >=C2=A0
> > This patch is to add ARM-specific command "query-gic-capability".
> >=C2=A0
> > The new command can report which kind of GIC device the host/QEMU
> > support. The returned result is in the form of array.
>=C2=A0
> Hi. I've made some code review comments on the specifics of the
> implementation, but really what I'd like to see is:
>=C2=A0=C2=A0* an ack from the libvirt folks that this API meets their
>=C2=A0=C2=A0=C2=A0=C2=A0requirements

I have a working implementation of the libvirt part, but I need
to polish it up before it can be posted on the list; then other
libvirt folks will be able to provide feedback.

Cheers.

--=C2=A0
Andrea Bolognani
Software Engineer - Virtualization Team
