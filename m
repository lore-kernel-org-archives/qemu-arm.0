Received: by 10.80.166.35 with SMTP id d32csp810679edc;
        Thu, 3 Nov 2016 12:16:45 -0700 (PDT)
X-Received: by 10.237.53.132 with SMTP id c4mr9938149qte.85.1478200605280;
        Thu, 03 Nov 2016 12:16:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l2si4987536qkb.97.2016.11.03.12.16.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Nov 2016 12:16:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34710 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c2NVE-0002uQ-NF
	for alex.bennee@linaro.org; Thu, 03 Nov 2016 15:16:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1c2NV5-0002qn-27
	for qemu-arm@nongnu.org; Thu, 03 Nov 2016 15:16:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1c2NV1-0006ko-1E
	for qemu-arm@nongnu.org; Thu, 03 Nov 2016 15:16:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35134)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1c2NV0-0006iJ-Rl; Thu, 03 Nov 2016 15:16:30 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E790D61BB8;
	Thu,  3 Nov 2016 19:16:29 +0000 (UTC)
Received: from localhost (ovpn-116-223.phx2.redhat.com [10.3.116.223])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA3JGSWj025100; Thu, 3 Nov 2016 15:16:29 -0400
Date: Thu, 3 Nov 2016 17:16:27 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20161103191627.GH5057@thinpad.lan.raisama.net>
References: <20161005133530.5702-1-rkrcmar@redhat.com>
	<87k2ckwll0.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87k2ckwll0.fsf@dusky.pond.sub.org>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.0 (2016-08-17)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 03 Nov 2016 19:16:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/2] qom+coccinelle: add and use
 object_new_with_class()
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
Cc: Rob Herring <robh@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xuFC0mC/oruO

On Thu, Nov 03, 2016 at 05:54:19PM +0100, Markus Armbruster wrote:
> Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@redhat.com> writes:
>=20
> > This series performs a simple replacement of
> > object_new(object_class_get_name(class)) by object_new_with_class(cla=
ss)
> > in the spirit of existing object_new_with_type().
>=20
> Who's going to take this one?  Still more review needed?

Not sure. I volunteer to queue QOM and qdev patches in my tree if
you and the others agree. But I would like to get any core QOM or
qdev patches at least Acked-by you, Paolo, or Andreas.

--=20
Eduardo
