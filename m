Received: by 10.25.208.211 with SMTP id h202csp1628661lfg;
        Tue, 23 Feb 2016 01:49:09 -0800 (PST)
X-Received: by 10.140.93.65 with SMTP id c59mr39900669qge.101.1456220949774;
        Tue, 23 Feb 2016 01:49:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 63si33135778qhy.96.2016.02.23.01.49.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Feb 2016 01:49:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55325 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aY9af-0001u2-Ah
	for alex.bennee@linaro.org; Tue, 23 Feb 2016 04:49:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34108)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1aY9ab-0001pk-VV
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 04:49:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1aY9aX-000068-Pz
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 04:49:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56447)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1aY9aX-000062-L1; Tue, 23 Feb 2016 04:49:01 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 0DA40602E;
	Tue, 23 Feb 2016 09:49:01 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1N9mvjM024931; Tue, 23 Feb 2016 04:48:57 -0500
Date: Tue, 23 Feb 2016 10:48:39 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20160223104839.5a51df9a@nial.brq.redhat.com>
In-Reply-To: <1456217512.29896.78.camel@redhat.com>
References: <1455906029-25565-1-git-send-email-somlo@cmu.edu>
	<20160222133015.6eece98e@nial.brq.redhat.com>
	<1456217512.29896.78.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 23 Feb 2016 09:49:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	matt@codeblueprint.co.uk, stefanha@gmail.com,
	"Gabriel L. Somlo" <somlo@cmu.edu>, ard.biesheuvel@linaro.org,
	qemu-devel@nongnu.org, leif.lindholm@linaro.org,
	luto@amacapital.net, qemu-arm@nongnu.org, pbonzini@redhat.com,
	lersek@redhat.com, rth@twiddle.net
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v9 0/5] add ACPI node for fw_cfg
 on pc and arm
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
X-TUID: Q1n1FA/1tGXy

On Tue, 23 Feb 2016 09:51:52 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

> On Mo, 2016-02-22 at 13:30 +0100, Igor Mammedov wrote:
> > On Fri, 19 Feb 2016 13:20:24 -0500
> > "Gabriel L. Somlo" <somlo@cmu.edu> wrote:
> > 
> > Gerd,
> > 
> > if you are going to apply it, you'll need to update
> > expected tables for acpi test (rebuild-expected-aml.sh)
> > as a commit on top of this series.  
> 
> Sure?
> 
> Applied the series, ran "make check", no errors.
it's a warning so far not a hard error but it's still there.

> 
> cheers,
>   Gerd
> 

