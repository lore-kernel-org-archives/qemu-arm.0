Received: by 10.25.85.209 with SMTP id j200csp1078551lfb;
        Mon, 13 Jun 2016 01:23:37 -0700 (PDT)
X-Received: by 10.200.57.40 with SMTP id s37mr2375655qtb.69.1465806217465;
        Mon, 13 Jun 2016 01:23:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w191si14499070qha.56.2016.06.13.01.23.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 01:23:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54366 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCN9k-0006fw-P5
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 04:23:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bCN9b-0006aY-UB
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 04:23:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bCN9a-0002Ee-2N
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 04:23:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57849)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bCN9Z-0002EB-S9; Mon, 13 Jun 2016 04:23:25 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0677F3F724;
	Mon, 13 Jun 2016 08:23:23 +0000 (UTC)
Received: from [10.36.112.17] (ovpn-112-17.ams2.redhat.com [10.36.112.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5D8NDlS004459
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 13 Jun 2016 04:23:15 -0400
To: Sergey Sorokin <afarallax@yandex.ru>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1465575999-3594234-1-git-send-email-afarallax@yandex.ru>
	<1465575999-3594234-2-git-send-email-afarallax@yandex.ru>
	<CAFEAcA-UqUdkoM2abzNiVstLR9tO_SgaQBTjsm=QHt-Hr6xrzQ@mail.gmail.com>
	<4506161465576922@web25g.yandex.ru>
	<CAFEAcA9wU2=jsfAqDOA=ZhOkAZ2wxmkYFhGDw=OwKFM6-04=tQ@mail.gmail.com>
	<4790101465579571@web25h.yandex.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f57056c4-26b2-72e4-49d7-047f8f0ab486@redhat.com>
Date: Mon, 13 Jun 2016 10:23:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <4790101465579571@web25h.yandex.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 13 Jun 2016 08:23:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 1/2] Fix confusing argument names of
 do_unaligned_access() functions
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
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>, Eduardo Habkost <ehabkost@redhat.com>,
	Jia Liu <proljc@gmail.com>, Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Blue Swirl <blauwirbel@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	David Gibson <david@gibson.dropbear.id.au>,
	Leon Alrae <leon.alrae@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PTkvIhrrFmTI



On 10/06/2016 19:26, Sergey Sorokin wrote:
> cpu-common.h is not included in qom/cpu.h what do you think? Should
> it be included? Or may be MMUAccessType should be just moved into
> another header. For example into exec/memattrs.h

You can move it to qom/cpu.h.

Paolo
