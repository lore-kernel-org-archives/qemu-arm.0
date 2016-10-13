Received: by 10.80.166.35 with SMTP id d32csp574228edc;
        Thu, 13 Oct 2016 13:13:47 -0700 (PDT)
X-Received: by 10.55.154.11 with SMTP id c11mr7794305qke.25.1476389627450;
        Thu, 13 Oct 2016 13:13:47 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g130si7534885qke.268.2016.10.13.13.13.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Oct 2016 13:13:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42785 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bumNu-0005bq-SZ
	for alex.bennee@linaro.org; Thu, 13 Oct 2016 16:13:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41525)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bumNr-0005aP-FW
	for qemu-arm@nongnu.org; Thu, 13 Oct 2016 16:13:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bumNp-0003tW-Bj
	for qemu-arm@nongnu.org; Thu, 13 Oct 2016 16:13:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33492)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>)
	id 1bumNp-0003tQ-5S; Thu, 13 Oct 2016 16:13:41 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9C10E85545;
	Thu, 13 Oct 2016 20:13:40 +0000 (UTC)
Received: from javelin (vpn1-4-1.sin2.redhat.com [10.67.4.1])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9DKDaAV028524
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 13 Oct 2016 16:13:38 -0400
Date: Fri, 14 Oct 2016 01:43:35 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA8Vn9F7FOYqU5ddLBKtn=3vnQc-eynsOoV_X-pU7S_C-Q@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1610140142460.31854@wniryva>
References: <1475903058-729-1-git-send-email-ppandit@redhat.com>
	<CAFEAcA8LfjDEMtbT5GRryLvAEu9kzbEzykKXF9DP+dDLajT8BQ@mail.gmail.com>
	<alpine.LFD.2.20.1610131141320.2125@wniryva>
	<CAFEAcA8Vn9F7FOYqU5ddLBKtn=3vnQc-eynsOoV_X-pU7S_C-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 13 Oct 2016 20:13:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v4] timer: a9gtimer: remove loop to
 auto-increment comparator
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Li Qiang <liqiang6-s@360.cn>,
	Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zOi4fwPHIcQt

+-- On Thu, 13 Oct 2016, Peter Maydell wrote --+
| I suggest you try putting in some sample values for the
| various variables to confirm that your new code produces the
| same answers that the old code did.

Yep, sent a revised patch v5. Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
