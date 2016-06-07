Received: by 10.25.27.66 with SMTP id b63csp2232224lfb;
        Tue, 7 Jun 2016 15:29:18 -0700 (PDT)
X-Received: by 10.140.253.85 with SMTP id y82mr1917502qhc.94.1465338558409;
        Tue, 07 Jun 2016 15:29:18 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c35si16494572qte.32.2016.06.07.15.29.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 15:29:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53353 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAPUr-0002wM-Qj
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 18:29:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39758)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bAPUn-0002vq-DI
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 18:29:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bAPUi-00086H-Dr
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 18:29:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34120)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1bAPUi-00086C-8O; Tue, 07 Jun 2016 18:29:08 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F1E32027E;
	Tue,  7 Jun 2016 22:29:07 +0000 (UTC)
Received: from localhost (vpn1-7-78.gru2.redhat.com [10.97.7.78])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u57MT6Ln002751; Tue, 7 Jun 2016 18:29:06 -0400
Date: Tue, 7 Jun 2016 19:29:05 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20160607222905.GJ18662@thinpad.lan.raisama.net>
References: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
	<1465226212-254093-3-git-send-email-imammedo@redhat.com>
	<20160607202544.GF18662@thinpad.lan.raisama.net>
	<57573795.9050600@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57573795.9050600@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 07 Jun 2016 22:29:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 02/10] target-i386: cpu: move
 features logic that requires CPUState to realize time
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
	qemu-devel@nongnu.org, blauwirbel@gmail.com, qemu-arm@nongnu.org,
	pbonzini@redhat.com, Igor Mammedov <imammedo@redhat.com>, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jkHBP7VqL8ez

On Tue, Jun 07, 2016 at 03:07:33PM -0600, Eric Blake wrote:
> On 06/07/2016 02:25 PM, Eduardo Habkost wrote:
> 
> > [...]
> >> +    /* TODO: convert plus_features & minus_features static vars
> >> +     * to global properties, once broken host_features is fixed
> >> +     */
> > 
> > I will rewrite this to:
> > 
> >     /*TODO: cpu->host_features inclurrectly overwrites features
> 
> Was that supposed to be "incorrectly" or "currently"?

Wow, that's an weird typo. I wrote "incorrectly" inclurrectly.

-- 
Eduardo
