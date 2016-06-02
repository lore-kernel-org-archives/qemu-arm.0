Received: by 10.25.27.66 with SMTP id b63csp754741lfb;
        Thu, 2 Jun 2016 07:53:34 -0700 (PDT)
X-Received: by 10.55.10.130 with SMTP id 124mr44081092qkk.91.1464879214622;
        Thu, 02 Jun 2016 07:53:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g125si550535qhg.126.2016.06.02.07.53.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Jun 2016 07:53:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47620 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8U06-00027L-4G
	for alex.bennee@linaro.org; Thu, 02 Jun 2016 10:53:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1b8U01-00025Z-OV
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 10:53:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1b8Tzx-0000TI-Al
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 10:53:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:6394)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1b8Tzx-0000Sm-4t; Thu, 02 Jun 2016 10:53:25 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 796496F666;
	Thu,  2 Jun 2016 14:53:24 +0000 (UTC)
Received: from localhost (vpn1-7-10.gru2.redhat.com [10.97.7.10])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u52ErNZc000668; Thu, 2 Jun 2016 10:53:23 -0400
Date: Thu, 2 Jun 2016 11:53:22 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20160602145322.GG19055@thinpad.lan.raisama.net>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
	<1464799050-11002-5-git-send-email-imammedo@redhat.com>
	<20160601184620.GE13503@thinpad.lan.raisama.net>
	<20160602142222.307ec4ee@nial.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160602142222.307ec4ee@nial.brq.redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 02 Jun 2016 14:53:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH RFC 4/8] target-i386: cpu: consolidate calls
 of object_property_parse() in x86_cpu_parse_featurestr
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
Cc: peter.maydell@linaro.org, Peter Krempa <pkrempa@redhat.com>,
	libvir-list@redhat.com, mark.cave-ayland@ilande.co.uk,
	qemu-devel@nongnu.org, blauwirbel@gmail.com, qemu-arm@nongnu.org,
	pbonzini@redhat.com, Jiri Denemark <jdenemar@redhat.com>, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l7SirzOiMbsf

(CCing libvirt folks)

BTW:

On Thu, Jun 02, 2016 at 02:22:22PM +0200, Igor Mammedov wrote:
[...]
> >         /* Special cases: */
> >         if (!strcmp(name, "xlevel")) {
> >             numvalue = strtoul(val, &err, 0);
> >             if (!*val || *err) {
> >                 error_setg(errp, "bad numerical value %s", val);
> >                 return;
> >             }
> >             if (numvalue < 0x80000000) {
> >                 error_report("xlevel value shall always be >= 0x80000000"
> >                              ", fixup will be removed in future versions");
> >                 numvalue += 0x80000000;
> >             snprintf(num, sizeof(num), "%" PRIu32, numvalue);
> >             val = num;
[...]
> >         } else if (!strcmp(name, "hv-spinlocks")) {
> >             const int min = 0xFFF;
> > 
> >             numvalue = strtoul(val, &err, 0);
> >             if (!*val || *err) {
> >                 error_setg(errp, "bad numerical value %s", val);
> >                 return;
> >             }
> >             if (numvalue < min) {
> >                 error_report("hv-spinlocks value shall always be >= 0x%x"
> >                              ", fixup will be removed in future versions",
> >                              min);
> >                 numvalue = min;
> >             }

Those "fixup will be removed in future versions" warnings are
present since QEMU 1.7. Assuming that libvirt never allowed those
invalid values to be used in the configuration (did it?), I
believe we can safely remove the hv-spinlocks and xlevel fixups
in QEMU 2.7.

The hv-spinlocks setter already rejects invalid values. We just
need to make x86_cpu_realizefn() reject invalid xlevel values.

-- 
Eduardo
