Received: by 10.25.208.211 with SMTP id h202csp1065464lfg;
        Mon, 22 Feb 2016 00:39:10 -0800 (PST)
X-Received: by 10.55.209.14 with SMTP id s14mr32797487qki.100.1456130350914;
        Mon, 22 Feb 2016 00:39:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d126si28644855qkb.84.2016.02.22.00.39.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Feb 2016 00:39:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47737 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXm1O-0004xM-BO
	for alex.bennee@linaro.org; Mon, 22 Feb 2016 03:39:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1aXm0i-0003hf-A4
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 03:38:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1aXm0d-0006jn-Ar
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 03:38:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59098)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1aXm0d-0006jj-5P; Mon, 22 Feb 2016 03:38:23 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id BED3D65404;
	Mon, 22 Feb 2016 08:38:22 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-29.ams2.redhat.com
	[10.36.116.29])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1M8cLbf025802; Mon, 22 Feb 2016 03:38:22 -0500
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id 22221805FF; Mon, 22 Feb 2016 09:38:21 +0100 (CET)
Message-ID: <1456130301.29896.29.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Feb 2016 09:38:21 +0100
In-Reply-To: <1455883404-10976-1-git-send-email-peter.maydell@linaro.org>
References: <1455883404-10976-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 22 Feb 2016 08:38:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: xiaoqiang zhao <zxq_yx_007@163.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH] tusb6010: move from hw/timer to hw/usb
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
X-TUID: +qFh+QJ+VzA6

On Fr, 2016-02-19 at 12:03 +0000, Peter Maydell wrote:
> The TUSB6010 is a USB controller (as the name suggests). Move it from
> hw/timer (where it was accidentally filed in 2013 when we moved
> everything out of hw/) to hw/usb.

Added to usb queue.

thanks,
  Gerd

