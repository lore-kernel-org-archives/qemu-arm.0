Received: by 10.25.27.66 with SMTP id b63csp749119lfb;
        Thu, 2 Jun 2016 07:41:48 -0700 (PDT)
X-Received: by 10.55.134.6 with SMTP id i6mr43924576qkd.185.1464878508289;
        Thu, 02 Jun 2016 07:41:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q49si541716qtb.53.2016.06.02.07.41.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Jun 2016 07:41:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47577 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8Toh-0005Mm-LD
	for alex.bennee@linaro.org; Thu, 02 Jun 2016 10:41:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48623)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1b8To3-0004tO-Nl
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 10:41:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1b8Tny-0005bk-EP
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 10:41:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32833)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1b8Tny-0005bY-8O; Thu, 02 Jun 2016 10:41:02 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BFBAAA4527;
	Thu,  2 Jun 2016 14:41:01 +0000 (UTC)
Received: from localhost (vpn1-7-10.gru2.redhat.com [10.97.7.10])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u52Ef0H7018811; Thu, 2 Jun 2016 10:41:01 -0400
Date: Thu, 2 Jun 2016 11:41:00 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20160602144100.GE19055@thinpad.lan.raisama.net>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
	<1464799050-11002-7-git-send-email-imammedo@redhat.com>
	<20160601185450.GG13503@thinpad.lan.raisama.net>
	<20160602120659.13aef452@igors-macbook-pro.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160602120659.13aef452@igors-macbook-pro.local>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 02 Jun 2016 14:41:01 +0000 (UTC)
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
X-TUID: IyFjGj6L6auH

On Thu, Jun 02, 2016 at 12:06:59PM +0200, Igor Mammedov wrote:
> On Wed, 1 Jun 2016 15:54:50 -0300
> Eduardo Habkost <ehabkost@redhat.com> wrote:
[...]
> > > -static void cpu_common_parse_features(CPUState *cpu, char
> > > *features, +static void cpu_common_parse_features(const char
> > > *typename, char *features, Error **errp)
> > >  {
> > >      char *featurestr; /* Single "key=value" string being parsed */
> > >      char *val;
> > > -    Error *err = NULL;
> > > +    static bool cpu_globals_initialized;
> > > +
> > > +    if (cpu_globals_initialized) {
> > > +        return;
> > > +    }
> > 
> > Should we replace this with assert(!cpu_globals_initialized)
> > after applying patch 8/8?
> assert might potentially break cpu_init() users, so I went safest route
> here.

No problem: we can add an assert() after fixing the cpu_init()
users, if necessary (we have only two of them).

-- 
Eduardo
