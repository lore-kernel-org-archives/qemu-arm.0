Received: by 10.25.27.66 with SMTP id b63csp333223lfb;
        Wed, 1 Jun 2016 11:51:24 -0700 (PDT)
X-Received: by 10.140.230.81 with SMTP id a78mr40183845qhc.68.1464807084184;
        Wed, 01 Jun 2016 11:51:24 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 105si26646637qgm.64.2016.06.01.11.51.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Jun 2016 11:51:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43634 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8BEh-0004Y3-JW
	for alex.bennee@linaro.org; Wed, 01 Jun 2016 14:51:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50231)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1b8BEb-0004WL-F8
	for qemu-arm@nongnu.org; Wed, 01 Jun 2016 14:51:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1b8BEY-0001vu-Pk
	for qemu-arm@nongnu.org; Wed, 01 Jun 2016 14:51:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44570)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1b8BEY-0001ve-Ko; Wed, 01 Jun 2016 14:51:14 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47352A0B5E;
	Wed,  1 Jun 2016 18:51:12 +0000 (UTC)
Received: from localhost (vpn1-7-51.gru2.redhat.com [10.97.7.51])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u51IpBP8007152; Wed, 1 Jun 2016 14:51:11 -0400
Date: Wed, 1 Jun 2016 15:51:10 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160601185110.GF13503@thinpad.lan.raisama.net>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
	<CAFEAcA-KUzT7137bcowBSpLM-OvTNSs9pM6RvqkoySDBZQySGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-KUzT7137bcowBSpLM-OvTNSs9pM6RvqkoySDBZQySGw@mail.gmail.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 01 Jun 2016 18:51:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH RFC 0/8] cpus: make "-cpu cpux,
 features" global properties
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>, Blue Swirl <blauwirbel@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gbu5qMjDEtJw

On Wed, Jun 01, 2016 at 07:21:00PM +0100, Peter Maydell wrote:
> On 1 June 2016 at 17:37, Igor Mammedov <imammedo@redhat.com> wrote:
> > Current CLI option -cpu cpux,features serves as template
> > for all created cpus of type: cpux. However QEMU parses
> > "features" every time it creates a cpu instance and applies
> > them to it while doing parsing.
> >
> > That doesn't work well with -device/device_add infrastructure
> > as it has no idea about cpu specific hooks that's used for
> > parsing "features".
> > In order to make -device/device_add utilize "-cpu features"
> > template convert it into a set of global properties, so that
> > every new CPU created will have them applied automatically.
> 
> Is there a plan for supporting heterogenous CPU setups?
> (We don't really do those very well at the moment, but
> we might in future. The closest we come today is the
> zynqmp SoC which has Cortex-R5s and A53s in it.)

I am not aware of any specific plan, but this series gets us
closer to eventually replacing -cpu (which doesn't allow
heterogenous CPU setups) with simple -device/-global combinations
(which would be more flexible).

-- 
Eduardo
