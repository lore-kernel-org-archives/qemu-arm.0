Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3472014wrg;
        Fri, 24 May 2019 13:30:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy1eCfKC0jQIHo86Ls9cenpgrYogtyj6CDbM7IyQ87faY2MdeTeMdxoD68jDELtPQY6JcCS
X-Received: by 2002:ab0:4e12:: with SMTP id g18mr7899270uah.1.1558729829032;
        Fri, 24 May 2019 13:30:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558729829; cv=none;
        d=google.com; s=arc-20160816;
        b=KKgGGIHfo3/MsS5y/v+pSMzhNz4RhVh9WwUh73Jj6Fhs0ZlEkLZC9XlZEl4K9dz8Wr
         z24LwoIOln2zjuTpH53MEtE+WhLu7Ppcl/jAAOjBbF0Yl2LDdh8jLrxuzTMZlPlE5KEA
         3hO8qLM5v9MF6QikBjTBs69kBSoCqaQT+IeSAUonjiLLtfD/+jwyCovXLjBrOYloC6w5
         bNO5R7K4o/J/2ZGmZAnTPIO0t7zYYWQWAUQNLDBMnT4G/e40LYxoDxKxUmh8abK6YZa5
         v0VDffDoEV0J1A6Z5ZvXQ+1/cj2SuSJ49VdDZjGzsiJcGmz1/dObmNu29LKYb7NwjXSN
         EBCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=qvacdsumjJGCInkt8ejXfFMYnfaWnF8VmM9azejEkbU=;
        b=gaJN8Ed8Z+zGE9tZpZbddcfS6VfcM1eEyWq6VZsVdJwBhP0NdPja5GqR/cgmiOIV94
         dqU54lZmvzqUUeVam+YmXsbytvpODfhznXST+5eT2mAUumqoU3Zt7uNkebVFNMjUZfK0
         z3z3cqrzfsFTAZ/je5Os8kTWJmIlvaHJyFtxFiaSU20P/IbFHnKYdjPM4ODs/l0yRJF4
         aQ383L7XQPfc7Samg2NclNs5+oimlSwqrpRliF3gKsLEn254oqbGUTsJiTy9yh+h83qh
         SOAdgvLLZuFQucs8W8jVJ2gO4F5c1gemL9CBYiSrzxW4hiItCkUCCP6+k9PU4imNE/d+
         ETAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j68si1427156vkg.31.2019.05.24.13.30.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 May 2019 13:30:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59765 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hUGpg-00081T-GE
	for alex.bennee@linaro.org; Fri, 24 May 2019 16:30:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56836)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hUGpL-0007m9-1w
	for qemu-arm@nongnu.org; Fri, 24 May 2019 16:30:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hUGaK-0004AN-TX
	for qemu-arm@nongnu.org; Fri, 24 May 2019 16:14:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42296)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hUGaK-00049g-LK; Fri, 24 May 2019 16:14:36 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A2160368E0;
	Fri, 24 May 2019 20:14:35 +0000 (UTC)
Received: from localhost (ovpn-116-14.gru2.redhat.com [10.97.116.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A0F321001F5D;
	Fri, 24 May 2019 20:14:34 +0000 (UTC)
Date: Fri, 24 May 2019 17:14:32 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20190524201432.GP10764@habkost.net>
References: <20190524103521.13847-1-lvivier@redhat.com>
	<20190524161045.314fa2de@redhat.com>
	<c1c017f2-84ed-bddf-abb9-7154d9edb372@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1c017f2-84ed-bddf-abb9-7154d9edb372@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 24 May 2019 20:14:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3] numa: improve cpu hotplug
 error message with a wrong node-id
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lZUhhz6JVf6H

On Fri, May 24, 2019 at 04:39:12PM +0200, Laurent Vivier wrote:
> On 24/05/2019 16:10, Igor Mammedov wrote:
> > On Fri, 24 May 2019 12:35:21 +0200
> > Laurent Vivier <lvivier@redhat.com> wrote:
> > 
> > > On pseries, core-ids are strongly binded to a node-id by the command
> > > line option. If an user tries to add a CPU to the wrong node, he has
> > > an error but it is not really helpful:
> > > 
> > >    qemu-system-ppc64 ... -smp 1,maxcpus=64,cores=1,threads=1,sockets=1 \
> > >                          -numa node,nodeid=0 -numa node,nodeid=1 ...
> > > 
> > >    (qemu) device_add power9_v2.0-spapr-cpu-core,core-id=30,node-id=1
> > >    Error: node-id=1 must match numa node specified with -numa option
> > > 
> > > This patch improves this error message by giving to the user the good
> > > topology information (node-id, socket-id and thread-id if they are
> > > available) to use with the core-id he's providing:
> > > 
> > >    Error: node-id=1 must match numa node specified with -numa option 'node-id 0'
> > > 
> > > Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> > > ---
> > > 
> > > Notes:
> > >      v3: only add the topology to the existing message
> > >          As suggested by Igor replace
> > >            Error: core-id 30 can only be plugged into node-id 0
> > >          by
> > >            Error: node-id=1 must match numa node specified with -numa option 'node-id 0'
> > >      v2: display full topology in the error message
> > > > > >   numa.c | 25 ++++++++++++++++++++++++-
> > >   1 file changed, 24 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/numa.c b/numa.c
> > > index 3875e1efda3a..7882ec294be4 100644
> > > --- a/numa.c
> > > +++ b/numa.c
> > > @@ -458,6 +458,27 @@ void qmp_set_numa_node(NumaOptions *cmd, Error **errp)
> > >       set_numa_options(MACHINE(qdev_get_machine()), cmd, errp);
> > >   }
> > > +static char *cpu_topology_to_string(const CPUArchId *cpu)
> > > +{
> > > +    GString *s = g_string_new(NULL);
> > > +    if (cpu->props.has_socket_id) {
> > > +        g_string_append_printf(s, "socket-id %"PRId64, cpu->props.socket_id);
> > > +    }
> > > +    if (cpu->props.has_node_id) {
> > > +        if (s->len) {
> > > +            g_string_append_printf(s, ", ");
> > > +        }
> > > +        g_string_append_printf(s, "node-id %"PRId64, cpu->props.node_id);
> > > +    }
> > > +    if (cpu->props.has_thread_id) {
> > > +        if (s->len) {
> > > +            g_string_append_printf(s, ", ");
> > > +        }
> > > +        g_string_append_printf(s, "thread-id %"PRId64, cpu->props.thread_id);
> > > +    }
> > > +    return g_string_free(s, false);
> > > +}
> > 
> > turns out we already have such helper: cpu_slot_to_string()
> 
> It doesn't display the node-id but the core-id. And node-id is what we need
> to know.

I'm confused about what you are trying to do here.

On v1, the message looked like:
  Error: core-id 30 can only be plugged into node-id 0

which is probably good for spapr.


Then I suggested you added the other cpu->props fields.  e.g. on
PC the message would look like:
  Error: socket-id 20, core-id 30, thread-id 40 can only be plugged into node-id 0


But you sent a v2 patch that would print this on PC:
  Error: core-id 30 can only be plugged into socket-id 20, node-id 0, thread-id 40

which doesn't make sense to me.


Then in a reply to v2, Igor suggested:

 error_setg(errp, "node-id=%d must match numa node specified "
                   "with -numa option '%s'", node_id, topology);


Igor suggest would address the problem above.  I expected it to become:
  node-id=0 must match numa node specified with -numa option core-id=30
and on PC:
  node-id=0 must match numa node specified with -numa option socket-id=20,core-id=30,thread-id=40

Or maybe it could include the input node-id too:
  node-id=0 must match numa node specified with -numa option node-id=1,core-id=30
and on PC:
  node-id=0 must match numa node specified with -numa option node-id=1,socket-id=20,core-id=30,thread-id=40

Both options would work.


But you implemented code that would print:
  Error: node-id=0 must match numa node specified with -numa option 'node-id 1'
and on PC it would print:
  Error: node-id=0 must match numa node specified with -numa option 'socket-id 20 node-id 1 thread-id=40'

which doesn't make sense to me.


I was expecting something like:
  Error: CPU slot core-id=30 is bound to node-id 0, but node-id 1 was specified
and on PC:
  Error: CPU slot socket-id=20,core-id=30,thread-id=40 is bound to node-id 0, but node-id 1 was specified


-- 
Eduardo
