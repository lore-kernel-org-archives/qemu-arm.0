Received: by 10.182.105.169 with SMTP id gn9csp1756267obb;
        Tue, 10 Nov 2015 05:02:38 -0800 (PST)
X-Received: by 10.140.173.65 with SMTP id t62mr4193006qht.96.1447160558389;
        Tue, 10 Nov 2015 05:02:38 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g52si2741026qge.104.2015.11.10.05.02.38
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Tue, 10 Nov 2015 05:02:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59606 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zw8ZK-0003d4-0L
	for alex.bennee@linaro.org; Tue, 10 Nov 2015 08:02:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1Zw8ZE-0003UK-9K
	for qemu-arm@nongnu.org; Tue, 10 Nov 2015 08:02:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1Zw8Z8-0001LC-Pf
	for qemu-arm@nongnu.org; Tue, 10 Nov 2015 08:02:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58600)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1Zw8Z8-0001Kx-KI; Tue, 10 Nov 2015 08:02:26 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 411738F261;
	Tue, 10 Nov 2015 13:02:26 +0000 (UTC)
Received: from hawk.localdomain (ovpn-116-94.ams2.redhat.com [10.36.116.94])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAAD2LjG024758
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 10 Nov 2015 08:02:24 -0500
Date: Tue, 10 Nov 2015 08:02:20 -0500
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20151110130220.GA3452@hawk.localdomain>
References: <1446909925-12201-1-git-send-email-drjones@redhat.com>
	<CAFEAcA_Pk7_MourHFc-SLCQ-StTfc8ssZ_Kz6HahE5=9bxMHyA@mail.gmail.com>
	<87twovpqg1.fsf@blackfin.pond.sub.org>
	<CAFEAcA8rsWg=9ZV75ZmJYPrPznUH-bQObvzHUem1Tciv3_5CaA@mail.gmail.com>
	<87oaf3jww7.fsf@blackfin.pond.sub.org>
	<CAFEAcA8Rh9ts2r-nMGbNm7Y=SpdxL4gv0ch3CBWOHiHTRMeztg@mail.gmail.com>
	<878u67atv0.fsf@blackfin.pond.sub.org>
	<CAFEAcA-z6NzyGkXqG27seP9G5c8qAL-MwY0QCPT1qZhfq6DZ+g@mail.gmail.com>
	<87y4e6xkf3.fsf@blackfin.pond.sub.org>
	<CAFEAcA-nibxGqD1fu3nBcj_mpEkN28kq7x6PxpQbHaGOKWGCtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-nibxGqD1fu3nBcj_mpEkN28kq7x6PxpQbHaGOKWGCtQ@mail.gmail.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt: error_report
	cleanups
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
X-TUID: kDooVEcvSXxX

On Tue, Nov 10, 2015 at 11:55:55AM +0000, Peter Maydell wrote:
> On 10 November 2015 at 09:39, Markus Armbruster <armbru@redhat.com> wrote:
> > Peter Maydell <peter.maydell@linaro.org> writes:
> >> ...so in conclusion Andrew's patch is correct as it stands
> >> and I should just apply it? :-)
> >
> > Yes.  It got my R-by :)
> 
> OK, applied to target-arm.next. Thanks for walking me through this.
>

Thanks guys! And I'm glad you saw this patch Markus! I'll definitely
remember to CC you on all error_* patches in the future :-)

drew 
