Received: by 10.25.150.194 with SMTP id y185csp1556043lfd;
        Tue, 8 Nov 2016 04:18:08 -0800 (PST)
X-Received: by 10.202.169.81 with SMTP id s78mr7604159oie.81.1478607488062;
        Tue, 08 Nov 2016 04:18:08 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a68si863829otc.38.2016.11.08.04.18.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Nov 2016 04:18:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60520 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c45Lr-00019a-Cf
	for alex.bennee@linaro.org; Tue, 08 Nov 2016 07:18:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45837)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c45Lo-00019G-1G
	for qemu-arm@nongnu.org; Tue, 08 Nov 2016 07:18:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c45Lk-0003u2-4M
	for qemu-arm@nongnu.org; Tue, 08 Nov 2016 07:18:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46756)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1c45Lj-0003t7-VV; Tue, 08 Nov 2016 07:18:00 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B787C61963;
	Tue,  8 Nov 2016 12:17:58 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-42.ams2.redhat.com [10.36.116.42])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id uA8CHsvi027755; Tue, 8 Nov 2016 07:17:55 -0500
From: Thomas Huth <thuth@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Date: Tue,  8 Nov 2016 13:17:48 +0100
Message-Id: <1478607473-25851-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 08 Nov 2016 12:17:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 0/5] Fixes for the MAINTAINERS file
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
X-TUID: IY7USG2y4SKV

I've currently got some update patches to the MAINTAINERS file
floating around, and Paolo asked me to send a PULL request for
them - so here's now the assembled set of patches for a final
review. If there are no objections, I'll send a PULL request in
a couple of days.

Note: I've also included John's patch for the bitmap support here,
since it is related - if that should go through another tree
instead, please let me know.

The m68k update is also a v2 of a patch that I've sent some time ago...
Laurent, please have another look at that one to see whether it is
OK now.

John Snow (1):
  MAINTAINERS: Add Fam and Jsnow for Bitmap support

Thomas Huth (4):
  MAINTAINERS: Add some ARM related files to the corresponding sections
  sparc: Add slavio_misc.c and eccmemctl.c to the MAINTAINERS file
  m68k: Update the 68k sections in the MAINTAINERS file
  MAINTAINERS: Add an entry for the CHRP NVRAM files

 MAINTAINERS | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

-- 
1.8.3.1

