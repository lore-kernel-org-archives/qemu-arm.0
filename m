Received: by 10.25.208.211 with SMTP id h202csp307753lfg;
        Thu, 17 Mar 2016 02:09:57 -0700 (PDT)
X-Received: by 10.55.71.135 with SMTP id u129mr12796661qka.26.1458205796913;
        Thu, 17 Mar 2016 02:09:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y69si7095934qka.73.2016.03.17.02.09.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Mar 2016 02:09:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33562 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agTwK-0007Pt-9b
	for alex.bennee@linaro.org; Thu, 17 Mar 2016 05:09:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1agTw1-0006qn-LJ
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 05:09:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1agTvy-0004x5-5T
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 05:09:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38226)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1agTvy-0004wy-0Z; Thu, 17 Mar 2016 05:09:34 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 8CD753B716;
	Thu, 17 Mar 2016 09:09:33 +0000 (UTC)
Received: from pxdev.xzpeter.org (vpn1-6-212.pek2.redhat.com [10.72.6.212])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2H99Sx3009853
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 17 Mar 2016 05:09:30 -0400
Date: Thu, 17 Mar 2016 17:09:27 +0800
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160317090927.GG23495@pxdev.xzpeter.org>
References: <1457422582-28799-1-git-send-email-peterx@redhat.com>
	<1457422582-28799-3-git-send-email-peterx@redhat.com>
	<CAFEAcA9jCwLnG5QKTG9Hd+r8tVYSN6A8dwWp2JMPV1rMUAAjLQ@mail.gmail.com>
	<20160317040935.GE23495@pxdev.xzpeter.org>
	<CAFEAcA-jzgMHH0=sMqv8+NB2=xgEP-0jWmYzP0M1om=8uDR6Lw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA-jzgMHH0=sMqv8+NB2=xgEP-0jWmYzP0M1om=8uDR6Lw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Andrew Jones <drjones@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v4 2/3] arm: qmp: add query-gic-capabilities
	interface
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
X-TUID: DVOU8B2txgHV

On Thu, Mar 17, 2016 at 08:50:38AM +0000, Peter Maydell wrote:
> On 17 March 2016 at 04:09, Peter Xu <peterx@redhat.com> wrote:
> > Thanks for the review comments. Do you have any suggestion on which
> > file should I add this in (or create a new one)? I failed to figure
> > it out myself. :(
> 
> I suggest target-arm/monitor.c (we have a monitor.c for other
> target-* already for monitor related functions).

Will take your advice and respin. Thanks!

-- peterx
