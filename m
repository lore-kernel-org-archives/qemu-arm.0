Received: by 10.25.150.194 with SMTP id y185csp1570019lfd;
        Tue, 8 Nov 2016 04:49:30 -0800 (PST)
X-Received: by 10.157.15.154 with SMTP id d26mr5969574otd.85.1478609370644;
        Tue, 08 Nov 2016 04:49:30 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v35si17876202otb.29.2016.11.08.04.49.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Nov 2016 04:49:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60685 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c45qD-0007aZ-Ti
	for alex.bennee@linaro.org; Tue, 08 Nov 2016 07:49:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54170)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c45q4-0007Y2-6h
	for qemu-arm@nongnu.org; Tue, 08 Nov 2016 07:49:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c45q1-0006RI-5x
	for qemu-arm@nongnu.org; Tue, 08 Nov 2016 07:49:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38256)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1c45q1-0006RC-0A; Tue, 08 Nov 2016 07:49:17 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1B18F7F3F5;
	Tue,  8 Nov 2016 12:49:16 +0000 (UTC)
Received: from [10.36.116.42] (ovpn-116-42.ams2.redhat.com [10.36.116.42])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA8CnCJw028085
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 8 Nov 2016 07:49:13 -0500
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <1478607473-25851-1-git-send-email-thuth@redhat.com>
	<1478607473-25851-4-git-send-email-thuth@redhat.com>
	<118e4f8d-c837-46aa-da6a-5fb135dc3c07@vivier.eu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <46d63cec-57f2-e433-b4ef-e117fde46c68@redhat.com>
Date: Tue, 8 Nov 2016 13:49:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <118e4f8d-c837-46aa-da6a-5fb135dc3c07@vivier.eu>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 08 Nov 2016 12:49:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 3/5] m68k: Update the 68k sections in the
 MAINTAINERS file
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
Cc: Fam Zheng <famz@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dgbmnLA7RQbI

On 08.11.2016 13:21, Laurent Vivier wrote:
> Le 08/11/2016 =C3=A0 13:17, Thomas Huth a =C3=A9crit :
>> disas/m68k.c obviously belong to the m68k CPU section in
>> the MAINTAINERS file, but remove the hw/m68k/ directory
>> here since it only contains machine (not CPU) related
>> files, as requested by Laurent. Add the machine related
>> files to the right machine sections instead.
>=20
> I think you can also add include/hw/m68k/mcf.h in the machine section.

That header currently contains prototypes for both, the 5206 and the
5208 machine... and I'd like to avoid adding that twice. We should
likely clean that up one day, but since it's currently orphaned anyway,
it's IMHO not that important to have this listed right now.

 Thomas

