Received: by 10.25.21.96 with SMTP id l93csp1550990lfi;
        Mon, 4 Jul 2016 07:32:39 -0700 (PDT)
X-Received: by 10.37.126.1 with SMTP id z1mr7549725ybc.57.1467642759666;
        Mon, 04 Jul 2016 07:32:39 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k63si2188477qkc.107.2016.07.04.07.32.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 07:32:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48289 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bK4vP-0005xT-4T
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 10:32:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bK4vJ-0005vS-4q
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 10:32:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bK4vD-0000Tx-5f
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 10:32:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44850)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1bK4vD-0000Tc-07; Mon, 04 Jul 2016 10:32:27 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 530BDC05B1E8;
	Mon,  4 Jul 2016 14:32:26 +0000 (UTC)
Received: from 172-15-182-60.lightspeed.austtx.sbcglobal.net
	(ovpn-112-69.ams2.redhat.com [10.36.112.69])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u64EWMd1017753; Mon, 4 Jul 2016 10:32:23 -0400
Date: Mon, 4 Jul 2016 16:32:19 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20160704163219.41a442fa@172-15-182-60.lightspeed.austtx.sbcglobal.net>
In-Reply-To: <20160704140146.GO4620@thinpad.lan.raisama.net>
References: <1465492263-28472-1-git-send-email-imammedo@redhat.com>
	<20160704100431.6b20fd28@172-15-182-60.lightspeed.austtx.sbcglobal.net>
	<20160704140146.GO4620@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 04 Jul 2016 14:32:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 0/6] cpus: make "-cpu cpux,
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
	qemu-devel@nongnu.org, groug@kaod.org, blauwirbel@gmail.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com,
	david@gibson.dropbear.id.au, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VmXWZmS1Gh33

On Mon, 4 Jul 2016 11:01:46 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Mon, Jul 04, 2016 at 10:04:31AM +0200, Igor Mammedov wrote:
> > On Thu,  9 Jun 2016 19:10:57 +0200
> > Igor Mammedov <imammedo@redhat.com> wrote:
> > 
> > Eduardo,
> > 
> > is anything more left to review/fix so remaining patches of this
> > series could be merged?
> 
> The only thing left is that I run some basic testing and submit a
> pull request. I couldn't do that last week (sorry!), but I plan
> to submit a pull request this week.
Is there a tree for Greg to rebase his work upon? 

