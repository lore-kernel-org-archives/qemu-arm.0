Received: by 10.25.21.156 with SMTP id 28csp1607379lfv;
        Tue, 19 Jul 2016 06:40:20 -0700 (PDT)
X-Received: by 10.200.49.129 with SMTP id h1mr61792908qte.103.1468935620349;
        Tue, 19 Jul 2016 06:40:20 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 37si19608215qkw.39.2016.07.19.06.40.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jul 2016 06:40:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56141 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bPVFz-0002K6-OM
	for alex.bennee@linaro.org; Tue, 19 Jul 2016 09:40:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57703)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bPVFs-00025i-1D
	for qemu-arm@nongnu.org; Tue, 19 Jul 2016 09:40:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bPVFn-0007gf-Bb
	for qemu-arm@nongnu.org; Tue, 19 Jul 2016 09:40:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54700)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bPVFn-0007gD-3q; Tue, 19 Jul 2016 09:40:07 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5EC8E796F4;
	Tue, 19 Jul 2016 13:40:06 +0000 (UTC)
Received: from [10.36.112.64] (ovpn-112-64.ams2.redhat.com [10.36.112.64])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6JDdxWY000657
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 19 Jul 2016 09:40:01 -0400
To: Igor Mammedov <imammedo@redhat.com>
References: <20160615005620.GU4882@voom.fritz.box>
	<20160714200743.GC31865@thinpad.lan.raisama.net>
	<20160715063530.2ebl4v4vpdtrpx5a@hawk.localdomain>
	<20160715111138.114d8b5f@nial.brq.redhat.com>
	<20160715161009.GB3727@thinpad.lan.raisama.net>
	<ea2c5171-ec0d-39a8-42b8-02c3f5b6655e@suse.de>
	<20160715174353.GD3727@thinpad.lan.raisama.net>
	<20160715203835.38565299@igors-macbook-pro.local>
	<20160715213353.GA3618@thinpad.lan.raisama.net>
	<20160718092304.363ac0c0@nial.brq.redhat.com>
	<20160719115935.GB3337@thinpad.lan.raisama.net>
	<d83443d4-48f8-2354-dad7-f92bc384eb00@redhat.com>
	<20160719152930.597964c5@nial.brq.redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8f916f68-2af7-6af5-66b1-e9fe4d19dfe6@redhat.com>
Date: Tue, 19 Jul 2016 15:39:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <20160719152930.597964c5@nial.brq.redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 19 Jul 2016 13:40:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] QOM: best way for parents to pass
 information to children? (was Re: [PATCH RFC 07/16] qom/cpu: make nr-cores,
 nr-threads real properties)
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
Cc: peter.maydell@linaro.org, Andrew Jones <drjones@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, agraf@suse.de,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Bharata B Rao <bharata@linux.vnet.ibm.com>,
	Thomas Huth <thuth@redhat.com>, dgibson@redhat.com,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PiZNyE7+tix1



On 19/07/2016 15:29, Igor Mammedov wrote:
> On Tue, 19 Jul 2016 14:21:05 +0200
> Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
>> On 19/07/2016 13:59, Eduardo Habkost wrote:
>>>>>>> If it's internal, do we have any reason to register a (writeable)
>>>>>>> property in the first place? Why not use a plain old
>>>>>>> "obj->field = value" C statement? Or, if a simple assignment
>>>>>>> isn't enough, why not a simple obj_set_field(value) C function?  
>>>>> So that arch neutral code won't have to pull obj type definition  
>>>
>>> I don't get it. If arch neutral code uses it, it should be
>>> available in an arch-neutral header.  
>>
>> I agree.  If arch-neutral code uses it, the method should be in CPUClass.
>
> it looks a bit like deQOMification, but if it's preferred
> we can do following for -smp.

Properties are primarily an interface for users.  Sometimes we use them
internally when they are anyway inaccessible to users, but if you want
to hide things from users there's already a suitable mechanism which is
class and interface methods.

Paolo

> 1. Add machine::{nr_cores,nr_threads,nr_sockets} fields
> 2. Add to concrete cpus classes that use above data (as globals currently)
>      a duplicate fields ex: X86CPU:{nr_cores,nr_threads}
> 3: Have X86CPU:{nr_cores,nr_threads} fields set buy PCMachine::pre_plug{} handler
> 
> That way we'd have a bit of data duplication in X86CPU:{nr_cores,nr_threads}
> but still maintain role separation where CPUs won't have to to poke into
> its parent containers (machine). The sort of what we are doing currently with apic-id.
> 
> 
>>
>> Paolo
>>
>>>>> and we would be able to reuse all machinery that uses properties
>>>>> instead of inventing yet another API or ad-hoc function calls.  
>>> Why is adding a new C function or setting a struct field worse
>>> than adding a new property name? I actually prefer the former,
>>> because it makes code review easier and allows the compiler to
>>> detect more mistakes.  
> 
