Received: by 10.80.163.71 with SMTP id 65csp2138273edn;
        Tue, 4 Oct 2016 07:13:27 -0700 (PDT)
X-Received: by 10.55.27.32 with SMTP id b32mr3648929qkb.211.1475590407180;
        Tue, 04 Oct 2016 07:13:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l95si15902482qte.110.2016.10.04.07.13.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Oct 2016 07:13:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42892 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1brQTG-0003JM-LF
	for alex.bennee@linaro.org; Tue, 04 Oct 2016 10:13:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47342)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1brQ5t-0007GF-M1
	for qemu-arm@nongnu.org; Tue, 04 Oct 2016 09:49:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1brQ5o-0007qk-Ow
	for qemu-arm@nongnu.org; Tue, 04 Oct 2016 09:49:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41800)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1brQ5o-0007qO-Hv; Tue, 04 Oct 2016 09:49:12 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E52258535A;
	Tue,  4 Oct 2016 13:49:11 +0000 (UTC)
Received: from kamzik.brq.redhat.com ([10.34.1.163])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u94Dn8N9002224
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 4 Oct 2016 09:49:10 -0400
Date: Tue, 4 Oct 2016 15:49:08 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161004134908.e3oayr7zkxbq6d3o@kamzik.brq.redhat.com>
References: <1474641676-25017-1-git-send-email-drjones@redhat.com>
	<CAFEAcA-98_+mdZO-YKW-_Or5=v4vDGS6NgHHmBX5i3a2pPQ0Tg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-98_+mdZO-YKW-_Or5=v4vDGS6NgHHmBX5i3a2pPQ0Tg@mail.gmail.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 04 Oct 2016 13:49:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] hw/arm/virt: add 2.8 machine type
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zoN2qetn2uCX

On Tue, Oct 04, 2016 at 02:32:36PM +0100, Peter Maydell wrote:
> On 23 September 2016 at 15:41, Andrew Jones <drjones@redhat.com> wrote:
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> >
> > ---
> >
> > This will conflict with Wei's PMU property series (which is why I
> > asked him to add it to that series...), but anyway, it'll be a minor
> > resolution to make.
> > ---
> 
> There wasn't a textual conflict but it (slightly belatedly)
> occured to me that perhaps the "support KVM GICv3 ITS" patches
> which went in to master in the same pullreq as this might
> need some tweaks so the ITS doesn't get used in the 2.7
> machine. Would you or Eric A like to have a look?
>

Good call. We should avoid guest visible changes, even when
the changes complete already exposed devices. I'll send a
patch.

Thanks,
drew
