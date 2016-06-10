Received: by 10.25.27.66 with SMTP id b63csp248362lfb;
        Fri, 10 Jun 2016 04:57:51 -0700 (PDT)
X-Received: by 10.140.19.231 with SMTP id 94mr1337270qgh.39.1465559871752;
        Fri, 10 Jun 2016 04:57:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p128si6054690qka.190.2016.06.10.04.57.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 04:57:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40013 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBL4R-0003iO-7Q
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 07:57:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bBKyI-0006id-7N
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 07:51:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bBKyC-0007p9-8Z
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 07:51:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43726)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1bBKyC-0007p5-2T; Fri, 10 Jun 2016 07:51:24 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8EB533F723;
	Fri, 10 Jun 2016 11:51:23 +0000 (UTC)
Received: from localhost (vpn1-7-122.gru2.redhat.com [10.97.7.122])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5ABpMmn023560; Fri, 10 Jun 2016 07:51:23 -0400
Date: Fri, 10 Jun 2016 08:51:21 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20160610115121.GG17952@thinpad.lan.raisama.net>
References: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
	<1465226212-254093-8-git-send-email-imammedo@redhat.com>
	<20160608163011.GL18662@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160608163011.GL18662@thinpad.lan.raisama.net>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 10 Jun 2016 11:51:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 07/10] target-sparc: cpu: use
 sparc_cpu_parse_features() directly
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
	pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HmbyL0ZxcjMX

On Wed, Jun 08, 2016 at 01:30:11PM -0300, Eduardo Habkost wrote:
> On Mon, Jun 06, 2016 at 05:16:49PM +0200, Igor Mammedov wrote:
> > make SPARC target use sparc_cpu_parse_features() directly
> > so it won't get in the way of switching other propertified
> > targets to handling features as global properties.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> 
> I would like to apply this to the x86 tree, to allow the
> remaining patches to be applied. May I get an Acked-by from the
> SPARC maintainers?

I hear no objections, I will queue it on x86-next.

-- 
Eduardo
