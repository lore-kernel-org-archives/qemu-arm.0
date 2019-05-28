Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp7463356wrg;
        Tue, 28 May 2019 07:00:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyQWc4KFYlEBt34ol2LFfVUboDVQz7lEqTXfiXs3Hz1TF7R3SseLuEamvBBI6zYjCB4V4Ov
X-Received: by 2002:a67:f7d2:: with SMTP id a18mr28183796vsp.5.1559052017601;
        Tue, 28 May 2019 07:00:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559052017; cv=none;
        d=google.com; s=arc-20160816;
        b=LC7W1THNmabGyhB5h9/F7MbsS2uOTakUVNh2p2O0sDrMxNBsS1a4zkEo2IHcybiilt
         3FN7hp5/FMFm/8B6/tM3V936wUswgM1BkXGPwWMK3mVJKVhuS3q5HpVZkmXghntm6FZ3
         8s4/KDDjujAaguPkRZ0crQJF2duPFdSu31COtjwkwEH2UvDLwX5C+yiQgIlVgMnta4XW
         sqJiFATjJVtUv4dnIpVlIYMrVGZBJdRlSNh7tpfAQ5xL1bhxBikQ1hys98E65mahmKfB
         dv+qhk9eXtssCBueKiHKRFQciTDFHq/FHbVtzLUYuZYowet3dJauxujn0fDK9CXuOkE/
         Gc8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=K9YGea7Ek5kj+CgpjEw+C/X8c2kRS3UtmzNnxNDyECU=;
        b=JzNLEWKFm9mHHq1E6yXt0iNJ2aXxD2k8VRh4Op2t+Cd8S6PLY6do5iwJwubntBZWmg
         N2tut97zyXtqoXR80ytyFlhkkqxT582wxvwKHiZQ3A73ZZgSx+3HoMyE8VoskqwtogKG
         aEAJBESFo59ZNPqCf8mfIorOR9T2XUhAgSSVwzFlPtDPHjnpwRjHTjz5K2glDOb6QYZG
         yvU6IhvcWRhUXF1MOfOQgReWAbx0iCnaOJGlmLaaOK0e73n/QKYhEYKwDNk/dwJBKdpb
         97J80EunTGlccW2G2l2xe1ZcR9wEN1IXF1WAfVYMGNm1IXpOuqyAZH6qcSY7+WUG613p
         bgtA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 66si6030829vsr.236.2019.05.28.07.00.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 May 2019 07:00:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35497 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hVceH-00061x-4I
	for alex.bennee@linaro.org; Tue, 28 May 2019 10:00:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hVcdu-0005tR-Ij
	for qemu-arm@nongnu.org; Tue, 28 May 2019 09:59:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hVcdt-0006Nj-4J
	for qemu-arm@nongnu.org; Tue, 28 May 2019 09:59:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58844)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1hVcds-0006ND-U0; Tue, 28 May 2019 09:59:53 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE6DAA3B58;
	Tue, 28 May 2019 13:59:41 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 57C176A24E;
	Tue, 28 May 2019 13:59:39 +0000 (UTC)
Date: Tue, 28 May 2019 15:59:35 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20190528155935.06843ec7@redhat.com>
In-Reply-To: <b3d08eb9-4727-ce2a-bc8e-57b7760b23f4@redhat.com>
References: <20190524103521.13847-1-lvivier@redhat.com>
	<20190524161045.314fa2de@redhat.com>
	<c1c017f2-84ed-bddf-abb9-7154d9edb372@redhat.com>
	<20190524201432.GP10764@habkost.net>
	<a3f324cc-8226-57e9-2bf3-347d84cf189a@redhat.com>
	<20190527145052.258825fb@redhat.com>
	<b3d08eb9-4727-ce2a-bc8e-57b7760b23f4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 28 May 2019 13:59:47 +0000 (UTC)
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /ng9LQWhYJrN

On Mon, 27 May 2019 15:52:30 +0200
Laurent Vivier <lvivier@redhat.com> wrote:

> On 27/05/2019 14:50, Igor Mammedov wrote:
> > On Mon, 27 May 2019 08:55:49 +0200
> > Laurent Vivier <lvivier@redhat.com> wrote:
> >   
> >> On 24/05/2019 22:14, Eduardo Habkost wrote:  
> >>> On Fri, May 24, 2019 at 04:39:12PM +0200, Laurent Vivier wrote:  
> >>>> On 24/05/2019 16:10, Igor Mammedov wrote:  
> >>>>> On Fri, 24 May 2019 12:35:21 +0200
> >>>>> Laurent Vivier <lvivier@redhat.com> wrote:
> >>>>>     
> >>>>>> On pseries, core-ids are strongly binded to a node-id by the command
> >>>>>> line option. If an user tries to add a CPU to the wrong node, he has
> >>>>>> an error but it is not really helpful:
> >>>>>>
> >>>>>>      qemu-system-ppc64 ... -smp 1,maxcpus=64,cores=1,threads=1,sockets=1 \
> >>>>>>                            -numa node,nodeid=0 -numa node,nodeid=1 ...
> >>>>>>
> >>>>>>      (qemu) device_add power9_v2.0-spapr-cpu-core,core-id=30,node-id=1
> >>>>>>      Error: node-id=1 must match numa node specified with -numa option
> >>>>>>
> >>>>>> This patch improves this error message by giving to the user the good
> >>>>>> topology information (node-id, socket-id and thread-id if they are
> >>>>>> available) to use with the core-id he's providing:
> >>>>>>
> >>>>>>      Error: node-id=1 must match numa node specified with -numa option 'node-id 0'
> >>>>>>
> >>>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> >>>>>> ---
> >>>>>>
> >>>>>> Notes:
> >>>>>>        v3: only add the topology to the existing message
> >>>>>>            As suggested by Igor replace
> >>>>>>              Error: core-id 30 can only be plugged into node-id 0
> >>>>>>            by
> >>>>>>              Error: node-id=1 must match numa node specified with -numa option 'node-id 0'
> >>>>>>        v2: display full topology in the error message  
> >>>>>>>>>     numa.c | 25 ++++++++++++++++++++++++-  
> >>>>>>     1 file changed, 24 insertions(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/numa.c b/numa.c
> >>>>>> index 3875e1efda3a..7882ec294be4 100644
> >>>>>> --- a/numa.c
> >>>>>> +++ b/numa.c
> >>>>>> @@ -458,6 +458,27 @@ void qmp_set_numa_node(NumaOptions *cmd, Error **errp)
> >>>>>>         set_numa_options(MACHINE(qdev_get_machine()), cmd, errp);
> >>>>>>     }
> >>>>>> +static char *cpu_topology_to_string(const CPUArchId *cpu)
> >>>>>> +{
> >>>>>> +    GString *s = g_string_new(NULL);
> >>>>>> +    if (cpu->props.has_socket_id) {
> >>>>>> +        g_string_append_printf(s, "socket-id %"PRId64, cpu->props.socket_id);
> >>>>>> +    }
> >>>>>> +    if (cpu->props.has_node_id) {
> >>>>>> +        if (s->len) {
> >>>>>> +            g_string_append_printf(s, ", ");
> >>>>>> +        }
> >>>>>> +        g_string_append_printf(s, "node-id %"PRId64, cpu->props.node_id);
> >>>>>> +    }
> >>>>>> +    if (cpu->props.has_thread_id) {
> >>>>>> +        if (s->len) {
> >>>>>> +            g_string_append_printf(s, ", ");
> >>>>>> +        }
> >>>>>> +        g_string_append_printf(s, "thread-id %"PRId64, cpu->props.thread_id);
> >>>>>> +    }
> >>>>>> +    return g_string_free(s, false);
> >>>>>> +}  
> >>>>>
> >>>>> turns out we already have such helper: cpu_slot_to_string()  
> >>>>
> >>>> It doesn't display the node-id but the core-id. And node-id is what we need
> >>>> to know.  
> >>>
> >>> I'm confused about what you are trying to do here.
> >>>
> >>> On v1, the message looked like:
> >>>     Error: core-id 30 can only be plugged into node-id 0
> >>>
> >>> which is probably good for spapr.
> >>>
> >>>
> >>> Then I suggested you added the other cpu->props fields.  e.g. on
> >>> PC the message would look like:
> >>>     Error: socket-id 20, core-id 30, thread-id 40 can only be plugged into node-id 0
> >>>
> >>>
> >>> But you sent a v2 patch that would print this on PC:
> >>>     Error: core-id 30 can only be plugged into socket-id 20, node-id 0, thread-id 40
> >>>
> >>> which doesn't make sense to me.
> >>>
> >>>
> >>> Then in a reply to v2, Igor suggested:
> >>>
> >>>    error_setg(errp, "node-id=%d must match numa node specified "
> >>>                      "with -numa option '%s'", node_id, topology);
> >>>
> >>>
> >>> Igor suggest would address the problem above.  I expected it to become:
> >>>     node-id=0 must match numa node specified with -numa option core-id=30
> >>> and on PC:
> >>>     node-id=0 must match numa node specified with -numa option socket-id=20,core-id=30,thread-id=40
> >>>
> >>> Or maybe it could include the input node-id too:
> >>>     node-id=0 must match numa node specified with -numa option node-id=1,core-id=30
> >>> and on PC:
> >>>     node-id=0 must match numa node specified with -numa option node-id=1,socket-id=20,core-id=30,thread-id=40
> >>>
> >>> Both options would work.
> >>>
> >>>
> >>> But you implemented code that would print:
> >>>     Error: node-id=0 must match numa node specified with -numa option 'node-id 1'
> >>> and on PC it would print:
> >>>     Error: node-id=0 must match numa node specified with -numa option 'socket-id 20 node-id 1 thread-id=40'
> >>>
> >>> which doesn't make sense to me.
> >>>
> >>>
> >>> I was expecting something like:
> >>>     Error: CPU slot core-id=30 is bound to node-id 0, but node-id 1 was specified
> >>> and on PC:
> >>>     Error: CPU slot socket-id=20,core-id=30,thread-id=40 is bound to node-id 0, but node-id 1 was specified
> >>>
> >>>      
> >>
> >> The idea is to provide the information to the user to help him to know
> >> where the cpu can be plugged when it cannot on the node-id he originally
> >> provided.
> >>
> >> So all the solutions you propose sounds good to me.
> >>
> >> I only need you and Igor agree on the same one.  
> > 
> > We with Eduardo basically agree on contents/set of properties to print,
> > it is only different phrasing (Eduardo's suggestion is better than what we have now).
> > But lets get to what problem you are going to fix/improve. SO I've went ahead and tried
> > with following CLI:
> > 
> >     qemu-system-x86_64 -smp 1,maxcpus=4 -numa node,cpus=0-1 -numa node,cpus=2-3 -monitor stdio -device qemu64-x86_64-cpu,socket-id=1,core-id=0,thread-id=0,node-id=1
> > 
> > end it errored out with:
> > 
> >    qemu-system-x86_64: -device qemu64-x86_64-cpu,socket-id=1,core-id=0,thread-id=0,node-id=1: node-id=1 must match numa node specified with -numa option
> > 
> > As you see we already have all user provide properties for cpu (including invalid ones) reported,
> > what we are missing is suggestion for valid node-id. How about following error message:
> > 
> > qemu-system-x86_64: -device qemu64-x86_64-cpu,socket-id=1,core-id=0,thread-id=0,node-id=1: invalid node-id, must be 0  
> 
> The case I'm worrying about is when the cpu is hotplugged: we don't have the "-device ..." information.
> 
>   $ qemu-system-ppc64 -nodefaults -nographic -monitor stdio -m 1G -smp 1,maxcpus=64,cores=1,threads=1,sockets=1 -numa node,nodeid=0 -numa node,nodeid=1
>   QEMU 3.0.1 monitor - type 'help' for more information
>   (qemu) device_add power8_v2.0-spapr-cpu-core,core-id=30,node-id=1
>   node-id=1 must match numa node specified with -numa option
> 
> So you can see the needed information is missing.

device-add is synchronous command so user (monitor) has a invalid properties command right above error, similar thing applies to QMP where user can match command with reply.
Repeating device properties looks to me like unnecessary date duplication.

> 
> Thanks,
> Laurent

