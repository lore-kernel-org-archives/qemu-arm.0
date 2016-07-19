Received: by 10.25.21.156 with SMTP id 28csp1569746lfv;
        Tue, 19 Jul 2016 05:21:22 -0700 (PDT)
X-Received: by 10.55.170.141 with SMTP id t135mr53494496qke.112.1468930882012;
        Tue, 19 Jul 2016 05:21:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h23si19429536qtb.114.2016.07.19.05.21.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jul 2016 05:21:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55492 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bPU1Z-0000Sf-I3
	for alex.bennee@linaro.org; Tue, 19 Jul 2016 08:21:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34521)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bPU1V-0000SX-H8
	for qemu-arm@nongnu.org; Tue, 19 Jul 2016 08:21:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bPU1R-0004OH-8I
	for qemu-arm@nongnu.org; Tue, 19 Jul 2016 08:21:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52282)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bPU1R-0004O8-2Q; Tue, 19 Jul 2016 08:21:13 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F8187F088;
	Tue, 19 Jul 2016 12:21:12 +0000 (UTC)
Received: from [10.36.112.64] (ovpn-112-64.ams2.redhat.com [10.36.112.64])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6JCL6DF025675
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 19 Jul 2016 08:21:08 -0400
To: Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
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
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d83443d4-48f8-2354-dad7-f92bc384eb00@redhat.com>
Date: Tue, 19 Jul 2016 14:21:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <20160719115935.GB3337@thinpad.lan.raisama.net>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 19 Jul 2016 12:21:12 +0000 (UTC)
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
	qemu-devel@nongnu.org, agraf@suse.de, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Bharata B Rao <bharata@linux.vnet.ibm.com>,
	Thomas Huth <thuth@redhat.com>, dgibson@redhat.com,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TzsVhKrALEVV



On 19/07/2016 13:59, Eduardo Habkost wrote:
>>> > > If it's internal, do we have any reason to register a (writeable)
>>> > > property in the first place? Why not use a plain old
>>> > > "obj->field = value" C statement? Or, if a simple assignment
>>> > > isn't enough, why not a simple obj_set_field(value) C function?
>> > So that arch neutral code won't have to pull obj type definition
> 
> I don't get it. If arch neutral code uses it, it should be
> available in an arch-neutral header.

I agree.  If arch-neutral code uses it, the method should be in CPUClass.

Paolo

>> > and we would be able to reuse all machinery that uses properties
>> > instead of inventing yet another API or ad-hoc function calls.
> Why is adding a new C function or setting a struct field worse
> than adding a new property name? I actually prefer the former,
> because it makes code review easier and allows the compiler to
> detect more mistakes.
