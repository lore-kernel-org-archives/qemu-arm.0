Received: by 10.25.21.96 with SMTP id l93csp1535557lfi;
        Mon, 4 Jul 2016 07:02:06 -0700 (PDT)
X-Received: by 10.129.130.196 with SMTP id s187mr2610966ywf.215.1467640926616;
        Mon, 04 Jul 2016 07:02:06 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f66si356849ywa.376.2016.07.04.07.02.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 07:02:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47822 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bK4Rq-0004xL-1s
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 10:02:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bK4Rj-0004w7-MQ
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 10:02:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bK4Rg-0007QT-4r
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 10:01:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40626)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1bK4Rg-0007QM-06; Mon, 04 Jul 2016 10:01:56 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 25DA17F6A8;
	Mon,  4 Jul 2016 14:01:55 +0000 (UTC)
Received: from localhost (vpn1-4-141.gru2.redhat.com [10.97.4.141])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u64E1oYe005126; Mon, 4 Jul 2016 10:01:52 -0400
Date: Mon, 4 Jul 2016 11:01:46 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20160704140146.GO4620@thinpad.lan.raisama.net>
References: <1465492263-28472-1-git-send-email-imammedo@redhat.com>
	<20160704100431.6b20fd28@172-15-182-60.lightspeed.austtx.sbcglobal.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160704100431.6b20fd28@172-15-182-60.lightspeed.austtx.sbcglobal.net>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 04 Jul 2016 14:01:55 +0000 (UTC)
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
X-TUID: wNDDGFi2j2CC

On Mon, Jul 04, 2016 at 10:04:31AM +0200, Igor Mammedov wrote:
> On Thu,  9 Jun 2016 19:10:57 +0200
> Igor Mammedov <imammedo@redhat.com> wrote:
> 
> Eduardo,
> 
> is anything more left to review/fix so remaining patches of this series
> could be merged?

The only thing left is that I run some basic testing and submit a
pull request. I couldn't do that last week (sorry!), but I plan
to submit a pull request this week.

-- 
Eduardo
