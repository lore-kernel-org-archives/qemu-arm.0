Received: by 10.25.21.156 with SMTP id 28csp859844lfv;
        Wed, 3 Aug 2016 10:39:04 -0700 (PDT)
X-Received: by 10.200.48.112 with SMTP id g45mr1260611qte.70.1470245944809;
        Wed, 03 Aug 2016 10:39:04 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 65si2840989qkm.109.2016.08.03.10.39.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Aug 2016 10:39:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36022 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bV08G-0004x7-E0
	for alex.bennee@linaro.org; Wed, 03 Aug 2016 13:39:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58528)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1bV078-0004MS-N9
	for qemu-devel@nongnu.org; Wed, 03 Aug 2016 13:37:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1bV073-0001Wn-3B
	for qemu-devel@nongnu.org; Wed, 03 Aug 2016 13:37:53 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:9030)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1bV072-0001WW-Qs
	for qemu-devel@nongnu.org; Wed, 03 Aug 2016 13:37:49 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
	u73HTNcB050650
	for <qemu-devel@nongnu.org>; Wed, 3 Aug 2016 13:37:48 -0400
Received: from e06smtp11.uk.ibm.com (e06smtp11.uk.ibm.com [195.75.94.107])
	by mx0a-001b2d01.pphosted.com with ESMTP id 24kkah57py-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Wed, 03 Aug 2016 13:37:47 -0400
Received: from localhost
	by e06smtp11.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <cornelia.huck@de.ibm.com>;
	Wed, 3 Aug 2016 18:37:45 +0100
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
	by e06smtp11.uk.ibm.com (192.168.101.141) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 3 Aug 2016 18:37:43 +0100
X-IBM-Helo: d06dlp02.portsmouth.uk.ibm.com
X-IBM-MailFrom: cornelia.huck@de.ibm.com
X-IBM-RcptTo: qemu-arm@nongnu.org;qemu-devel@nongnu.org;qemu-ppc@nongnu.org
Received: from b06cxnps4075.portsmouth.uk.ibm.com
	(d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id AA9C82190023; 
	Wed,  3 Aug 2016 18:37:08 +0100 (BST)
Received: from d06av09.portsmouth.uk.ibm.com (d06av09.portsmouth.uk.ibm.com
	[9.149.37.250])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u73HbgDA7340414; Wed, 3 Aug 2016 17:37:42 GMT
Received: from d06av09.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av09.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u73Hbg14005110; Wed, 3 Aug 2016 11:37:42 -0600
Received: from gondolin (dyn-9-152-224-112.boeblingen.de.ibm.com
	[9.152.224.112])
	by d06av09.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u73Hbg1a005087; Wed, 3 Aug 2016 11:37:42 -0600
Date: Wed, 3 Aug 2016 19:37:40 +0200
From: Cornelia Huck <cornelia.huck@de.ibm.com>
To: "Daniel P. Berrange" <berrange@redhat.com>
In-Reply-To: <1470241360-3574-2-git-send-email-berrange@redhat.com>
References: <1470241360-3574-1-git-send-email-berrange@redhat.com>
	<1470241360-3574-2-git-send-email-berrange@redhat.com>
Organization: IBM Deutschland Research & Development GmbH Vorsitzende des
	Aufsichtsrats: Martina Koederitz
	=?UTF-8?B?R2VzY2jDpGZ0c2bDvGhydW5nOg==?=
	Dirk Wittkopp Sitz der Gesellschaft: =?UTF-8?B?QsO2Ymxpbmdlbg==?=
	Registergericht: Amtsgericht Stuttgart, HRB 243294
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16080317-0040-0000-0000-000002B9D5BF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16080317-0041-0000-0000-00001C781161
Message-Id: <20160803193740.08c3a365.cornelia.huck@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-08-03_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
	definitions=main-1608030172
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
Subject: Re: [Qemu-devel] [PATCH 1/5] virtio-console: set frontend open
 permanently for console devs
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
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Amit Shah <amit.shah@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DwYjrFkAUmeo

On Wed,  3 Aug 2016 17:22:36 +0100
"Daniel P. Berrange" <berrange@redhat.com> wrote:

> The virtio-console.c file handles both serial consoles
> and interactive consoles, since they're backed by the
> same device model.
>=20
> Since serial devices are expected to be reliable and
> need to notify the guest when the backend is opened
> or closed, the virtio-console.c file wires up support
> for chardev events. This affects both serial consoles
> and interactive consoles, using a network connection
> based chardev backend such as 'socket', but not when
> using a PTY based backend or plain 'file' backends.
>=20
> When the host side is not connected the handle_output()
> method in virtio-serial-bus.c will drop any data sent
> by the guest, before it even reaches the virtio-console.c
> code. This means that if the chardev has a logfile
> configured, the data will never get logged.
>=20
> Consider for example, configuring a x86_64 guest with a
> plain UART serial port
>=20
>   -chardev socket,id=3Dcharserial1,host=3D127.0.0.1,port=3D9001,server,no=
wait,logfile=3Dconsole1.log,logappend=3Don
>   -device isa-serial,chardev=3Dcharserial1,id=3Dserial1
>=20
> vs a s390 guest which has to use the virtio-console port
>=20
>   -chardev socket,id=3Dcharconsole1,host=3D127.0.0.1,port=3D9000,server,n=
owait,logfile=3Dconsole2.log,logappend=3Don
>   -device virtconsole,chardev=3Dcharconsole1,id=3Dconsole1
>=20
> The isa-serial one gets data written to the log regardless
> of whether a client is connected, while the virtioconsole
> one only gets data written to the log when a client is
> connected.
>=20
> There is no need for virtio-serial-bus.c to aggressively
> drop the data for console devices, as the chardev code is
> prefectly capable of discarding the data itself.
>=20
> So this patch changes virtconsole devices so that they
> are always marked as having the host side open. This
> ensures that the guest OS will always send any data it
> has (Linux virtio-console hvc driver actually ignores
> the host open state and sends data regardless, but we
> should not rely on that), and also prevents the
> virtio-serial-bus code prematurely discarding data.
>=20
> The behaviour of virtserialport devices is *not* changed,
> only virtconsole, because for the former, it is important
> that the guest OSknow exactly when the host side is opened
> / closed so it can do any protocol re-negotiation that may
> be required.
>=20
> Fixes bug: https://bugs.launchpad.net/qemu/+bug/1599214
>=20
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> ---
>  hw/char/virtio-console.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)

=46rom my limited understanding of the character layer this sounds
reasonable, and I agree that this is 2.7 material.

Acked-by: Cornelia Huck <cornelia.huck@de.ibm.com>

