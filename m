Received: by 10.25.27.66 with SMTP id b63csp620899lfb;
        Thu, 2 Jun 2016 03:07:19 -0700 (PDT)
X-Received: by 10.200.57.27 with SMTP id s27mr8398274qtb.70.1464862039260;
        Thu, 02 Jun 2016 03:07:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 63si2119354qkm.83.2016.06.02.03.07.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Jun 2016 03:07:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46330 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8PX4-0000dK-Nw
	for alex.bennee@linaro.org; Thu, 02 Jun 2016 06:07:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b8PWx-0000aj-Qy
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 06:07:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b8PWs-0002Um-Mo
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 06:07:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:2859)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1b8PWs-0002Ui-H0; Thu, 02 Jun 2016 06:07:06 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E97F54DB07;
	Thu,  2 Jun 2016 10:07:05 +0000 (UTC)
Received: from igors-macbook-pro.local (ovpn-204-100.brq.redhat.com
	[10.40.204.100])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u52A72bB023415; Thu, 2 Jun 2016 06:07:03 -0400
Date: Thu, 2 Jun 2016 12:06:59 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20160602120659.13aef452@igors-macbook-pro.local>
In-Reply-To: <20160601185450.GG13503@thinpad.lan.raisama.net>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
	<1464799050-11002-7-git-send-email-imammedo@redhat.com>
	<20160601185450.GG13503@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 02 Jun 2016 10:07:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 6/8] cpu: use
 CPUClass->parse_features() as convertor to global properties
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
X-TUID: 7d3DyjLQuNfv

On Wed, 1 Jun 2016 15:54:50 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Wed, Jun 01, 2016 at 06:37:28PM +0200, Igor Mammedov wrote:
> > Currently CPUClass->parse_features() is used to parse
> > -cpu features string and set properties on created CPU
> > instances.
> > 
> > But considering that features specified -cpu apply to
> > every created CPU instance, it doesn't make sence to
> > parse the same features string for every CPU created.
> > It also makes every target that cares about parsing
> > features string explicitly call CPUClass->parse_features()
> > parser, which gets in a way if we consider using
> > generic device_add for CPU hotplug as device_add
> > has not a clue about CPU specific hooks.
> > 
> > Turns out we can use global properties mechanism to set
> > properties on every created Device instance for a given
> > type. That way it's possible to convert CPU features
> > into a set of global properties for specified by
> >  -cpu cpu_model and common Device.device_post_init()
> > will apply them to every cpu model model automaticaaly
> > regardless whether it's manually created CPU or CPU
> > created with help of device_add.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> [...]
> > -static void cpu_common_parse_features(CPUState *cpu, char
> > *features, +static void cpu_common_parse_features(const char
> > *typename, char *features, Error **errp)
> >  {
> >      char *featurestr; /* Single "key=value" string being parsed */
> >      char *val;
> > -    Error *err = NULL;
> > +    static bool cpu_globals_initialized;
> > +
> > +    if (cpu_globals_initialized) {
> > +        return;
> > +    }
> 
> Should we replace this with assert(!cpu_globals_initialized)
> after applying patch 8/8?
assert might potentially break cpu_init() users, so I went safest route
here.
 

