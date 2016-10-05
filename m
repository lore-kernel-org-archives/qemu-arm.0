Received: by 10.80.163.71 with SMTP id 65csp2708458edn;
        Wed, 5 Oct 2016 07:45:04 -0700 (PDT)
X-Received: by 10.31.16.73 with SMTP id g70mr7059603vki.175.1475678703852;
        Wed, 05 Oct 2016 07:45:03 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n75si5297086vkc.1.2016.10.05.07.45.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Oct 2016 07:45:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49652 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1brnRO-0007Mo-A5
	for alex.bennee@linaro.org; Wed, 05 Oct 2016 10:45:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1brnRK-0007LP-5F
	for qemu-arm@nongnu.org; Wed, 05 Oct 2016 10:44:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1brnRG-0007Rm-4e
	for qemu-arm@nongnu.org; Wed, 05 Oct 2016 10:44:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40838)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1brnRF-0007RG-Ul; Wed, 05 Oct 2016 10:44:54 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4D6AF8E013;
	Wed,  5 Oct 2016 14:44:53 +0000 (UTC)
Received: from localhost (ovpn-116-132.phx2.redhat.com [10.3.116.132])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u95EiqB7024038; Wed, 5 Oct 2016 10:44:52 -0400
Date: Wed, 5 Oct 2016 11:44:51 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>
Message-ID: <20161005144451.GL3877@thinpad.lan.raisama.net>
References: <20161005133530.5702-1-rkrcmar@redhat.com>
	<20161005133530.5702-3-rkrcmar@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20161005133530.5702-3-rkrcmar@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.0 (2016-08-17)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 05 Oct 2016 14:44:53 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 2/2] coccinelle: use object_new_with_class()
 in obvious cases
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Alexander Graf <agraf@suse.de>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xz+PU1R3QSFj

On Wed, Oct 05, 2016 at 03:35:30PM +0200, Radim Kr=C4=8Dm=C3=A1=C5=99 wro=
te:
> object_new_with_class(class) does a better job than
> object_new(object_class_get_name(class)), because
> object_class_get_name() lost the class->type and object_new() looked it
> up again from the name.
>=20
> Manually changed vl.c to fit into 80 character line.
>=20
> Signed-off-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

--=20
Eduardo
