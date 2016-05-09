Received: by 10.25.208.137 with SMTP id h131csp1428794lfg;
        Mon, 9 May 2016 00:48:25 -0700 (PDT)
X-Received: by 10.140.179.76 with SMTP id z73mr35795316qhz.36.1462780105572;
        Mon, 09 May 2016 00:48:25 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u76si2532389qkg.204.2016.05.09.00.48.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 May 2016 00:48:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39808 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1azfvV-0005lM-6T
	for alex.bennee@linaro.org; Mon, 09 May 2016 03:48:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48879)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1azfvS-0005jA-MA
	for qemu-arm@nongnu.org; Mon, 09 May 2016 03:48:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1azfvM-0002ZG-PJ
	for qemu-arm@nongnu.org; Mon, 09 May 2016 03:48:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49721)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1azfvM-0002Z4-Jj; Mon, 09 May 2016 03:48:16 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 54866627C9;
	Mon,  9 May 2016 07:48:15 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-19.ams2.redhat.com
	[10.36.116.19])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u497mESa029858; Mon, 9 May 2016 03:48:14 -0400
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id D597D80C1F; Mon,  9 May 2016 09:48:12 +0200 (CEST)
Message-ID: <1462780092.22096.16.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 09 May 2016 09:48:12 +0200
In-Reply-To: <1462371352-21498-1-git-send-email-peter.maydell@linaro.org>
References: <1462371352-21498-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 09 May 2016 07:48:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 0/2] hw/display/blizzard: remove
 blizzard_template.h
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
Cc: qemu-arm@nongnu.org, Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
	Pooja Dhannawat <dhannawatpooja1@gmail.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JMTkEuqsLlMG

On Mi, 2016-05-04 at 15:15 +0100, Peter Maydell wrote:
> Now that we can rely on the display surface being 32 bits,
> the whole machinery of blizzard_template.h being included once
> per supported depth is unnecessary.
>=20
> This series expands out the DEPTH-dependent macros, and then
> moves the remaining code into blizzard.c and removes the header file.
>=20
> It applies on top of Pooja Dhannawat's patch
> "blizzard: Remove support for DEPTH !=3D 32" (which you can
> also find in my target-arm.next branch:
> https://git.linaro.org/people/peter.maydell/qemu-arm.git target-arm.next)

So you take those two through the arm queue too I guess?

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

cheers,
  Gerd

