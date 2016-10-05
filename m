Received: by 10.80.163.71 with SMTP id 65csp2696293edn;
        Wed, 5 Oct 2016 07:21:36 -0700 (PDT)
X-Received: by 10.176.16.129 with SMTP id d1mr5716073uab.16.1475677296584;
        Wed, 05 Oct 2016 07:21:36 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 39si9349144uae.52.2016.10.05.07.21.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Oct 2016 07:21:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49466 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1brn4h-00088s-TG
	for alex.bennee@linaro.org; Wed, 05 Oct 2016 10:21:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rkrcmar@redhat.com>) id 1brn2k-00072T-UZ
	for qemu-devel@nongnu.org; Wed, 05 Oct 2016 10:19:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rkrcmar@redhat.com>) id 1brn2f-0006nL-7T
	for qemu-devel@nongnu.org; Wed, 05 Oct 2016 10:19:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:2344)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rkrcmar@redhat.com>)
	id 1brn2X-0006kh-VB; Wed, 05 Oct 2016 10:19:22 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B1405C05A296;
	Wed,  5 Oct 2016 14:19:19 +0000 (UTC)
Received: from potion (dhcp-1-247.brq.redhat.com [10.34.1.247])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id u95Dgqjv016816; Wed, 5 Oct 2016 09:42:52 -0400
Received: by potion (sSMTP sendmail emulation); Wed, 05 Oct 2016 15:42:51 +0200
Date: Wed, 5 Oct 2016 15:42:51 +0200
From: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20161005134251.GA3256@potion>
References: <20161005133530.5702-1-rkrcmar@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20161005133530.5702-1-rkrcmar@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 05 Oct 2016 14:19:20 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 0/2] qom+coccinelle: add and use
 object_new_with_class()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, Rob Herring <robh@kernel.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Alexander Graf <agraf@suse.de>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cM+Rm4P1NWE8

2016-10-05 15:35+0200, Radim Kr=C4=8Dm=C3=A1=C5=99:
> This series performs a simple replacement of
> object_new(object_class_get_name(class)) by object_new_with_class(class=
)
> in the spirit of existing object_new_with_type().

This series applies after recently posted

  [PATCH v4 1/8] apic: add global apic_get_class()

which adds one more user of object_new(object_class_get_name(class)).
I forgot to include the patch in this series, sorry.
