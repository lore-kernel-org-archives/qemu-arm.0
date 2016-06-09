Received: by 10.25.27.66 with SMTP id b63csp317554lfb;
        Thu, 9 Jun 2016 06:26:06 -0700 (PDT)
X-Received: by 10.140.25.174 with SMTP id 43mr9398452qgt.5.1465478765940;
        Thu, 09 Jun 2016 06:26:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v5si2934167qhe.4.2016.06.09.06.26.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Jun 2016 06:26:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34554 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAzyH-0001je-Cf
	for alex.bennee@linaro.org; Thu, 09 Jun 2016 09:26:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bAzyB-0001ft-7r
	for qemu-arm@nongnu.org; Thu, 09 Jun 2016 09:26:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bAzy6-0005R9-VY
	for qemu-arm@nongnu.org; Thu, 09 Jun 2016 09:25:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:2360)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1bAzy6-0005R5-Pl; Thu, 09 Jun 2016 09:25:54 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6082B28A4D;
	Thu,  9 Jun 2016 13:25:54 +0000 (UTC)
Received: from localhost (vpn1-7-121.gru2.redhat.com [10.97.7.121])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u59DPrwG015086; Thu, 9 Jun 2016 09:25:53 -0400
Date: Thu, 9 Jun 2016 10:25:52 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20160609132552.GS18662@thinpad.lan.raisama.net>
References: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
	<1465226212-254093-11-git-send-email-imammedo@redhat.com>
	<20160608170315.GO18662@thinpad.lan.raisama.net>
	<20160609140735.535045d0@igors-macbook-pro.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160609140735.535045d0@igors-macbook-pro.local>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 09 Jun 2016 13:25:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 10/10] pc: parse cpu features
 only once
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
X-TUID: kCdBe4px0wVR

On Thu, Jun 09, 2016 at 02:07:35PM +0200, Igor Mammedov wrote:
> On Wed, 8 Jun 2016 14:03:15 -0300
> Eduardo Habkost <ehabkost@redhat.com> wrote:
[...]
> > > -    cpu = pc_new_cpu(machine->cpu_model, apic_id, &local_err);
> > > +    assert(pcms->possible_cpus->cpus[0].cpu); /* BSP is always
> > > present */
> > > +    oc =
> > > OBJECT_CLASS(CPU_GET_CLASS(pcms->possible_cpus->cpus[0].cpu));
> > 
> > The same pattern will probably repeat in other machines. I
> > wouldn't mind adding a new MachineState::cpu_type field, as we
> > already have MachineState::cpu_model.
> > 
> > MachineState::cpu_model could eventually go away if we move all
> > parse_features() calls to generic code.
> All of above should be done as one step i.e.
>  add cpu_type + drop cpu_model
> When we are ready to call parsing from generic code but not now.
> 
> For calling parsing from generic place, the only blocker is sparc
> target. 
> It needs to be converted to CPU subtypes + features=>properties,
> like hat you've done with x86. 

OK. We just need to keep that in mind and not forget to do that
later.

> 
[...]
> > > +    model_pieces = g_strsplit(machine->cpu_model, ",", 2);
> > > +    if (!model_pieces[0]) {
> > > +        error_report("Invalid/empty CPU model name");
> > > +        exit(1);
> > > +    }
> > > +
> > > +    oc = cpu_class_by_name(TYPE_X86_CPU, model_pieces[0]);
> > > +    if (oc == NULL) {
> > > +        error_report("Unable to find CPU definition: %s",
> > > model_pieces[0]);
> > > +        exit(1);
> > > +    }
> > > +    typename = object_class_get_name(oc);
> > > +    cc = CPU_CLASS(oc);
> > > +    cc->parse_features(typename, model_pieces[1], &error_fatal);
> > > +    g_strfreev(model_pieces);
> > 
> > Can we move this to a generic function to be reused by other
> > machines?
> It could be generalized and reduce similar site in virt-arm 
> to 1 function. I'll do it on top of this series.

Thanks!

-- 
Eduardo
