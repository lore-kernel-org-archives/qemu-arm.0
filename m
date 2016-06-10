Received: by 10.25.27.66 with SMTP id b63csp148993lfb;
        Fri, 10 Jun 2016 00:23:30 -0700 (PDT)
X-Received: by 10.200.37.15 with SMTP id 15mr461530qtm.68.1465543410024;
        Fri, 10 Jun 2016 00:23:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t7si2672243qha.1.2016.06.10.00.23.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 00:23:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38788 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBGmv-00061s-DE
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 03:23:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bBGmq-00061Z-96
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 03:23:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bBGmm-0002D2-2P
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 03:23:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58092)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1bBGml-0002Cs-Sz; Fri, 10 Jun 2016 03:23:19 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B630461C3;
	Fri, 10 Jun 2016 07:23:19 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5A7NGpZ028680; Fri, 10 Jun 2016 03:23:17 -0400
Date: Fri, 10 Jun 2016 09:23:15 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20160610092315.2e0de322@nial.brq.redhat.com>
In-Reply-To: <5759C5F6.4020405@redhat.com>
References: <1465492263-28472-1-git-send-email-imammedo@redhat.com>
	<1465492263-28472-2-git-send-email-imammedo@redhat.com>
	<20160609172900.GV18662@thinpad.lan.raisama.net>
	<5759C5F6.4020405@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 10 Jun 2016 07:23:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/6] target-i386: cpu:
 consolidate calls of object_property_parse() in x86_cpu_parse_featurestr
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
Cc: peter.maydell@linaro.org, Eduardo Habkost <ehabkost@redhat.com>,
	mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
	blauwirbel@gmail.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
	rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JQOPM8YQRbh4

On Thu, 9 Jun 2016 13:39:34 -0600
Eric Blake <eblake@redhat.com> wrote:

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
errp might be NULL, so we won't do parsing at all.
considering it's more or less generic API hook it's safer
to follow error handling pattern used in properties
i.e. use local_error internally and then propagate error
if caller cares about it.
