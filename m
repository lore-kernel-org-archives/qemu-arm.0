Received: by 10.80.166.35 with SMTP id d32csp746821edc;
        Thu, 3 Nov 2016 09:54:31 -0700 (PDT)
X-Received: by 10.55.79.86 with SMTP id d83mr8388009qkb.24.1478192071043;
        Thu, 03 Nov 2016 09:54:31 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w77si4725906qkb.46.2016.11.03.09.54.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Nov 2016 09:54:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34090 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c2LHa-0007tF-Hc
	for alex.bennee@linaro.org; Thu, 03 Nov 2016 12:54:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48461)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1c2LHW-0007sD-IP
	for qemu-arm@nongnu.org; Thu, 03 Nov 2016 12:54:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1c2LHT-0001Ct-H8
	for qemu-arm@nongnu.org; Thu, 03 Nov 2016 12:54:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53616)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1c2LHT-0001CQ-Am; Thu, 03 Nov 2016 12:54:23 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 35986C04B31B;
	Thu,  3 Nov 2016 16:54:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-30.ams2.redhat.com
	[10.36.116.30])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA3GsKtZ031607
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 3 Nov 2016 12:54:21 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E4AE111386CE; Thu,  3 Nov 2016 17:54:19 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>
References: <20161005133530.5702-1-rkrcmar@redhat.com>
Date: Thu, 03 Nov 2016 17:54:19 +0100
In-Reply-To: <20161005133530.5702-1-rkrcmar@redhat.com> ("Radim
	=?utf-8?B?S3LEjW3DocWZIidz?=
	message of "Wed, 5 Oct 2016 15:35:28 +0200")
Message-ID: <87k2ckwll0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 03 Nov 2016 16:54:22 +0000 (UTC)
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
Cc: Rob Herring <robh@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nBNNEcPIQceo

Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@redhat.com> writes:

> This series performs a simple replacement of
> object_new(object_class_get_name(class)) by object_new_with_class(class)
> in the spirit of existing object_new_with_type().

Who's going to take this one?  Still more review needed?
