Received: by 10.25.27.66 with SMTP id b63csp490423lfb;
        Thu, 9 Jun 2016 12:52:11 -0700 (PDT)
X-Received: by 10.55.93.68 with SMTP id r65mr12098650qkb.174.1465501931859;
        Thu, 09 Jun 2016 12:52:11 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p84si4285608qkl.71.2016.06.09.12.52.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Jun 2016 12:52:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36799 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bB5zv-0002mX-9s
	for alex.bennee@linaro.org; Thu, 09 Jun 2016 15:52:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43864)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bB5ya-00029w-Fo
	for qemu-devel@nongnu.org; Thu, 09 Jun 2016 15:50:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bB5yY-0000q2-9g
	for qemu-devel@nongnu.org; Thu, 09 Jun 2016 15:50:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44692)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1bB5yQ-0000oL-Ls; Thu, 09 Jun 2016 15:50:38 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D70BCC05B1FD;
	Thu,  9 Jun 2016 19:50:37 +0000 (UTC)
Received: from localhost (vpn1-7-121.gru2.redhat.com [10.97.7.121])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u59Joa9I015242; Thu, 9 Jun 2016 15:50:37 -0400
Date: Thu, 9 Jun 2016 16:50:36 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20160609195036.GX18662@thinpad.lan.raisama.net>
References: <1465492263-28472-1-git-send-email-imammedo@redhat.com>
	<1465492263-28472-2-git-send-email-imammedo@redhat.com>
	<20160609172900.GV18662@thinpad.lan.raisama.net>
	<5759C5F6.4020405@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5759C5F6.4020405@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 09 Jun 2016 19:50:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 1/6] target-i386: cpu: consolidate calls
 of object_property_parse() in x86_cpu_parse_featurestr
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
	qemu-devel@nongnu.org, blauwirbel@gmail.com, qemu-arm@nongnu.org,
	pbonzini@redhat.com, Igor Mammedov <imammedo@redhat.com>, rth@twiddle.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LhkWjWaflxVT

On Thu, Jun 09, 2016 at 01:39:34PM -0600, Eric Blake wrote:
> On 06/09/2016 11:29 AM, Eduardo Habkost wrote:
> > On Thu, Jun 09, 2016 at 07:10:58PM +0200, Igor Mammedov wrote:
> > [...]
> >> +
> >> +    if (local_err) {
> >> +        error_propagate(errp, local_err);
> >>      }
> > 
> > error_propagate() already ignores local_err==NULL so you don't
> > need to check it first.
> 
> In fact, if the ONLY reason you are doing an 'if (local_err)'
> conditional is to decide if an error was set, then you don't care about
> the error locally, and could have passed errp instead of &local_err in
> the first place.

In this case, we stop the parsing loop if an error is detected.

-- 
Eduardo
