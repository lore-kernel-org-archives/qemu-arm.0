Received: by 10.25.150.194 with SMTP id y185csp285841lfd;
        Wed, 16 Nov 2016 11:02:38 -0800 (PST)
X-Received: by 10.129.167.202 with SMTP id e193mr4402639ywh.112.1479322958591;
        Wed, 16 Nov 2016 11:02:38 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p9si8208211ybe.249.2016.11.16.11.02.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Nov 2016 11:02:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54165 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c75Th-0005J3-DL
	for alex.bennee@linaro.org; Wed, 16 Nov 2016 14:02:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39407)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1c75Ta-0005GE-A3
	for qemu-arm@nongnu.org; Wed, 16 Nov 2016 14:02:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1c75TV-0006YW-FH
	for qemu-arm@nongnu.org; Wed, 16 Nov 2016 14:02:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53264)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1c75TV-0006YK-9l; Wed, 16 Nov 2016 14:02:25 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 705DD624D0;
	Wed, 16 Nov 2016 19:02:24 +0000 (UTC)
Received: from localhost (ovpn-116-133.phx2.redhat.com [10.3.116.133])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uAGJ2NvI029097; Wed, 16 Nov 2016 14:02:23 -0500
Date: Wed, 16 Nov 2016 17:02:22 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20161116190222.GS5057@thinpad.lan.raisama.net>
References: <1479320499-29818-1-git-send-email-ehabkost@redhat.com>
	<b5f6826a-0662-9d7d-7321-20d425fb651c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5f6826a-0662-9d7d-7321-20d425fb651c@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.0 (2016-08-17)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 16 Nov 2016 19:02:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-2.9] qmp: Report QOM type name on
 query-cpu-definitions
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Daniel P. Berrange" <berrange@redhat.com>,
	libvir-list@redhat.com, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Alexander Graf <agraf@suse.de>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <dgibson@redhat.com>, Jiri Denemark <jdenemar@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NDeQjHV26ZBB

On Wed, Nov 16, 2016 at 12:47:14PM -0600, Eric Blake wrote:
> On 11/16/2016 12:21 PM, Eduardo Habkost wrote:
> > The new typename attribute on query-cpu-definitions will be used
> > to help management software use device-list-properties to check
> > which properties can be set using -cpu or -global for the CPU
> > model.
> > 
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> >  qapi-schema.json            | 4 +++-
> >  target-arm/helper.c         | 1 +
> >  target-i386/cpu.c           | 1 +
> >  target-ppc/translate_init.c | 1 +
> >  target-s390x/cpu_models.c   | 1 +
> >  5 files changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/qapi-schema.json b/qapi-schema.json
> > index b0b4bf6..9a3bdd4 100644
> > --- a/qapi-schema.json
> > +++ b/qapi-schema.json
> > @@ -3216,6 +3216,8 @@
> >  # @unavailable-features: #optional List of properties that prevent
> >  #                        the CPU model from running in the current
> >  #                        host. (since 2.8)
> > +# @typename: Type name that can be used as argument to @device-list-properties,
> > +#            to introspect properties configurable using -cpu or -global.
> 
> Missing a '(since 2.9)' designation.

Oops. I will add it the next version. Thanks!

> 
> >  #
> >  # @unavailable-features is a list of QOM property names that
> >  # represent CPU model attributes that prevent the CPU from running.
> > @@ -3237,7 +3239,7 @@
> >  ##
> >  { 'struct': 'CpuDefinitionInfo',
> >    'data': { 'name': 'str', '*migration-safe': 'bool', 'static': 'bool',
> > -            '*unavailable-features': [ 'str' ] } }
> > +            '*unavailable-features': [ 'str' ], 'typename': 'str' } }
> >  
> 
> -- 
> Eric Blake   eblake redhat com    +1-919-301-3266
> Libvirt virtualization library http://libvirt.org
> 

-- 
Eduardo
