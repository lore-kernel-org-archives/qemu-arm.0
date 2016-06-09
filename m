Received: by 10.25.27.66 with SMTP id b63csp324678lfb;
        Thu, 9 Jun 2016 06:40:28 -0700 (PDT)
X-Received: by 10.140.81.213 with SMTP id f79mr7295133qgd.35.1465479628541;
        Thu, 09 Jun 2016 06:40:28 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n35si3444962qgd.73.2016.06.09.06.40.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Jun 2016 06:40:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34615 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bB0CC-0001o1-0T
	for alex.bennee@linaro.org; Thu, 09 Jun 2016 09:40:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bB0C7-0001lK-JK
	for qemu-arm@nongnu.org; Thu, 09 Jun 2016 09:40:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bB0C1-0000XP-JD
	for qemu-arm@nongnu.org; Thu, 09 Jun 2016 09:40:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60181)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1bB0C1-0000XI-B6; Thu, 09 Jun 2016 09:40:17 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CB7EC8E74B;
	Thu,  9 Jun 2016 13:40:16 +0000 (UTC)
Received: from igors-macbook-pro.local (ovpn-204-90.brq.redhat.com
	[10.40.204.90])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u59DeDgr005790; Thu, 9 Jun 2016 09:40:14 -0400
Date: Thu, 9 Jun 2016 15:40:10 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20160609154010.4fbcd652@igors-macbook-pro.local>
In-Reply-To: <20160609132357.GR18662@thinpad.lan.raisama.net>
References: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
	<1465226212-254093-9-git-send-email-imammedo@redhat.com>
	<20160608164746.GM18662@thinpad.lan.raisama.net>
	<20160609143849.1a72741d@igors-macbook-pro.local>
	<20160609132357.GR18662@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 09 Jun 2016 13:40:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 08/10] cpu: use
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
X-TUID: vMrCs+IjNFU+

On Thu, 9 Jun 2016 10:23:57 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Thu, Jun 09, 2016 at 02:38:49PM +0200, Igor Mammedov wrote:
> > On Wed, 8 Jun 2016 13:47:46 -0300
> > Eduardo Habkost <ehabkost@redhat.com> wrote:
> > 
> > > On Mon, Jun 06, 2016 at 05:16:50PM +0200, Igor Mammedov wrote:
> > > > Currently CPUClass->parse_features() is used to parse
> > > > -cpu features string and set properties on created CPU
> > > > instances.
> > > > 
> > > > But considering that features specified by -cpu apply to
> > > > every created CPU instance, it doesn't make sence to
> > > > parse the same features string for every CPU created.
> > > > It also makes every target that cares about parsing
> > > > features string explicitly call CPUClass->parse_features()
> > > > parser, which gets in a way if we consider using
> > > > generic device_add for CPU hotplug as device_add
> > > > has not a clue about CPU specific hooks.
> > > > 
> > > > Turns out we can use global properties mechanism to set
> > > > properties on every created CPU instance for a given
> > > > type. That way it's possible to convert CPU features
> > > > into a set of global properties for CPU type specified
> > > > by -cpu cpu_model and common Device.device_post_init()
> > > > will apply them to CPU of given type automatically
> > > > regardless whether it's manually created CPU or CPU
> > > > created with help of device_add.
> > > > 
> > > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > > ---
> > > > This patch only make CPUClass->parse_features()
> > > > a global properties convertor and follow up patches
> > > > will switch individual users to new behaviour
> > > 
> > > Considering that we won't fix all callers to not call it multiple
> > > times in the same series, can we add TODO notes to the
> > > ->parse_features() callers that are still need to be fixed?
> > the only callers left that aren't fixed after this series are
> > cpu_init() callers.
> > The rest are taken care of by the last 2 patches.
> 
> I just miss some documentation in the patch saying why exactly we
> still need cpu_globals_initialized.
> 
> I like to keep the comments consistent in the intermediate steps,
> as in case this patch is considered good for inclusion but the
> other two need a respin for some reason. But if you want to add a
> comment just for cpu_init()/cpu_generic_init(), that's OK.
> 
Ok, I'll post v2 for this patch as reply here as 2 following
patches look ok and don't need respining.

> > 
> > > 
> > > Additional comments (and TODO notes suggestions) below:
> > > 
> [...]
> > > 
> > > /*TODO: all callers of ->parse_features() need to be changed to
> > >  * call it only once, so we can remove this check (or change it
> > >  * to assert(!cpu_globals_initialized).
> > >  * Current callers of ->parse_features() are:
> 
> I guess this needs to be changed to "current callers of
> ->parse_features() that may call it multiple times".
> 
> > >  * - machvirt_init()
> > >  * - cpu_generic_init()
> > >  * - cpu_x86_create()
> > >  */
> > > 
> > > As far as I can see, after applying the whole series, only
> > > cpu_x86_create() will remain.
> > Have you meant cpu_generic_init() ?  cpu_x86_create is removed
> > in the last patch.
> 
> Oops, yes, I meant cpu_generic_init().
> 
> > 
> > So I'd drop cpu_x86_create() and machvirt_init() from suggested
> > comment.
> 
> Works for me. Although I prefer when patches can be
> reviewed/applied on their own, without depending on the patches
> that come after them.
> 
> > 
> > > 
> > > > +    if (cpu_globals_initialized) {
> > > > +        return;
> > > > +    }
> > > >  
> > > >      featurestr = features ? strtok(features, ",") : NULL;
> > > >  
> > > >      while (featurestr) {
> > > >          val = strchr(featurestr, '=');
> > > >          if (val) {
> > > > +            GlobalProperty *prop = g_new0(typeof(*prop), 1);
> > > >              *val = 0;
> > > >              val++;
> > > > -            object_property_parse(OBJECT(cpu), val, featurestr,
> > > > &err);
> > > > -            if (err) {
> > > > -                error_propagate(errp, err);
> > > > -                return;
> > > > -            }
> > > > +            prop->driver = typename;
> > > > +            prop->property = g_strdup(featurestr);
> > > > +            prop->value = g_strdup(val);
> > > > +            qdev_prop_register_global(prop);
> > > >          } else {
> > > >              error_setg(errp, "Expected key=value format, found
> > > > %s.", featurestr);
> > > > @@ -308,6 +312,7 @@ static void
> > > > cpu_common_parse_features(CPUState *cpu, char *features, }
> > > >          featurestr = strtok(NULL, ",");
> > > >      }
> > > > +    cpu_globals_initialized = true;
> > > 
> > > This will register globals multiple times if called with
> > > "foo=x,bar".
> > I fail to see how it could happen here.
> 
> I mean it will register globals multiple times if the function is
> called multiple times. "foo=x" will be registered before the
> error at "bar" is detected and reported.
That's true, however I haven't considered it as a caller of
parse_features() will not call it second time if error occurred.

> 
> > 
> > > Easier to just set cpu_globals_initialized=true
> > > earlier, and report errors only on the first ->parse_features()
> > > call?
> > Agreed, I'll make it like this:
> > 
> >     if (cpu_globals_initialized) {
> >         return;
> >     }
> >     cpu_globals_initialized = true;
> 
> OK.
> 

