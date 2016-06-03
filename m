Received: by 10.25.27.66 with SMTP id b63csp418738lfb;
        Fri, 3 Jun 2016 12:37:12 -0700 (PDT)
X-Received: by 10.55.135.7 with SMTP id j7mr4900694qkd.32.1464982632040;
        Fri, 03 Jun 2016 12:37:12 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s187si3306433qkf.133.2016.06.03.12.37.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Jun 2016 12:37:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57425 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8uu4-0003NN-Gl
	for alex.bennee@linaro.org; Fri, 03 Jun 2016 15:37:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1b8uty-0003KU-7K
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 15:37:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1b8utt-000126-4W
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 15:37:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58564)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1b8uts-00011k-Si; Fri, 03 Jun 2016 15:36:57 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 58D71B1F8C;
	Fri,  3 Jun 2016 19:36:56 +0000 (UTC)
Received: from localhost (vpn1-7-42.gru2.redhat.com [10.97.7.42])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u53JatOj017837; Fri, 3 Jun 2016 15:36:55 -0400
Date: Fri, 3 Jun 2016 16:36:54 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20160603193654.GY19055@thinpad.lan.raisama.net>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
	<1464799050-11002-5-git-send-email-imammedo@redhat.com>
	<20160601184620.GE13503@thinpad.lan.raisama.net>
	<20160602142222.307ec4ee@nial.brq.redhat.com>
	<20160602145322.GG19055@thinpad.lan.raisama.net>
	<20160602150506.GF5194@andariel.pipo.sk>
	<20160602183104.3720c55d@nial.brq.redhat.com>
	<20160603073009.GG5194@andariel.pipo.sk>
	<20160603113749.752bce47@nial.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160603113749.752bce47@nial.brq.redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 03 Jun 2016 19:36:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 4/8] target-i386: cpu:
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
Cc: peter.maydell@linaro.org, Peter Krempa <pkrempa@redhat.com>,
	libvir-list@redhat.com, mark.cave-ayland@ilande.co.uk,
	qemu-devel@nongnu.org, blauwirbel@gmail.com, qemu-arm@nongnu.org,
	pbonzini@redhat.com, Jiri Denemark <jdenemar@redhat.com>, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0QjtoWde+ENc

On Fri, Jun 03, 2016 at 11:37:49AM +0200, Igor Mammedov wrote:
> On Fri, 3 Jun 2016 09:30:09 +0200
> Peter Krempa <pkrempa@redhat.com> wrote:
> 
> > On Thu, Jun 02, 2016 at 18:31:04 +0200, Igor Mammedov wrote:
> > > On Thu, 2 Jun 2016 17:05:06 +0200
> > > Peter Krempa <pkrempa@redhat.com> wrote:  
> > > > On Thu, Jun 02, 2016 at 11:53:22 -0300, Eduardo Habkost wrote:  
> > > > > On Thu, Jun 02, 2016 at 02:22:22PM +0200, Igor Mammedov wrote:  
> > 
> > [...]
> > 
> > > > I couldn't find anything regarding xlevel (so we might actually not
> > > > support it at all), but we indeed do limit the hv_spinlock count:
> > > > 
> > > > 
> > > >                 if (def->hyperv_spinlocks < 0xFFF) {
> > > >                     virReportError(VIR_ERR_XML_ERROR, "%s",
> > > >                                    _("HyperV spinlock retry count must be "
> > > >                                      "at least 4095"));
> > > >                     goto error;
> > > >                 }
> > > > 
> > > > Peter  
> > > Peter,
> > > Does libvirt still uses -cpu xxx,+feat1,-feat2 syntax
> > > or canonical property syntax there feat1=on,feat2=off  
> > 
> > We use the legacy one:
> > 
> > -cpu core2duo,+ds,+acpi,+ht,+tm,+ds_cpl, ...
> > 
> > and
> > 
> > -cpu 'qemu32,hv_relaxed,hv_vapic, ... 
> > 
> > for the hyperv features.
> > 
> > We probably can switch to the new one if there's a reasonable way how to
> > detect that qemu is supporting the new one.
> for x86 features became properties since 2.4 release (commit 38e5c119),
> that's the one way to know it.
> But it's still only +-features for sparc (that's the last remaining
> target that has legacy parsing).
> 
> Another way to detect it is to probe via QOM if CPU has a property corresponding
> to a feature.
> 
> Maybe Eduardo knows about other ways to do it.

The properties could be detected by running
device-list-properties when libvirt is probing for QEMU binary
capabilities. But we still don't return any useful information
for abstract classes or X86CPU subclasses.

You could work around it by running qom-list on the first VCPU
object, but when libvirt probes QEMU binary capabilities, it uses
-machine none (which doesn't create any VCPU).

I will look for other mechanisms that can be used in QEMU
2.{4,5,6} already, but I am not sure we will find one.

If all fails, we can consider making query-command-line-options
return useful data for -cpu on QEMU 2.7.

-- 
Eduardo
