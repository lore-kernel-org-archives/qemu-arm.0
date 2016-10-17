Received: by 10.80.166.35 with SMTP id d32csp628728edc;
        Mon, 17 Oct 2016 12:22:42 -0700 (PDT)
X-Received: by 10.55.49.8 with SMTP id x8mr15721094qkx.188.1476732162403;
        Mon, 17 Oct 2016 12:22:42 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n88si18734472qkl.10.2016.10.17.12.22.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Oct 2016 12:22:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35311 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwDUJ-0003Vi-Ub
	for alex.bennee@linaro.org; Mon, 17 Oct 2016 15:22:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39252)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bwCrM-0002M7-GQ
	for qemu-devel@nongnu.org; Mon, 17 Oct 2016 14:42:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bwCrL-0001lq-Sk
	for qemu-devel@nongnu.org; Mon, 17 Oct 2016 14:42:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35142)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1bwCrH-0001jA-Fa; Mon, 17 Oct 2016 14:41:59 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0AAC63DE3E;
	Mon, 17 Oct 2016 18:41:58 +0000 (UTC)
Received: from javelin (vpn1-48-133.bne.redhat.com [10.64.48.133])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9HIfnEk030966
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 17 Oct 2016 14:41:53 -0400
Date: Tue, 18 Oct 2016 00:11:47 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA8ALpL_rdgPL7dQbhx6prVV+ipXSoQ7LGu4ue_ReL9O-A@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1610180011020.2314@wniryva>
References: <1476416631-2870-1-git-send-email-ppandit@redhat.com>
	<CAFEAcA8ALpL_rdgPL7dQbhx6prVV+ipXSoQ7LGu4ue_ReL9O-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 17 Oct 2016 18:41:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v6] timer: a9gtimer: remove loop to
 auto-increment comparator
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Li Qiang <liqiang6-s@360.cn>,
	Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XNUqYBEHH6yX

+-- On Mon, 17 Oct 2016, Peter Maydell wrote --+
| > +                    inc = QEMU_ALIGN_DOWN(inc, gtb->inc);
| 
| Isn't this pair of lines equivalent to
|   uint64_t inc = QEMU_ALIGN_UP(update.new - gtb->compare, gtb->inc);
| ?

Yes, sent v7. Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
