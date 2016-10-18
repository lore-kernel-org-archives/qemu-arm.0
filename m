Received: by 10.80.166.35 with SMTP id d32csp1010163edc;
        Tue, 18 Oct 2016 07:06:25 -0700 (PDT)
X-Received: by 10.55.89.197 with SMTP id n188mr674891qkb.306.1476799585280;
        Tue, 18 Oct 2016 07:06:25 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b7si17330696qkf.294.2016.10.18.07.06.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Oct 2016 07:06:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41737 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwV28-0003tc-Kr
	for alex.bennee@linaro.org; Tue, 18 Oct 2016 10:06:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60616)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bwUlc-0005dQ-Vj
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 09:49:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bwUlZ-0003TZ-T8
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 09:49:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47064)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1bwUlZ-0003TF-NP; Tue, 18 Oct 2016 09:49:17 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 88D1890251;
	Tue, 18 Oct 2016 13:49:16 +0000 (UTC)
Received: from localhost.localdomain (vpn1-7-83.ams2.redhat.com [10.36.7.83])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u9IDnCIv025150
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 18 Oct 2016 09:49:13 -0400
To: Fam Zheng <famz@redhat.com>
References: <20161017201530.502017.26289@ex-std-node742.prod.rhcloud.com>
	<6011d25f-9302-b3dc-36f1-567daf23b62d@redhat.com>
	<20161018133435.GD14000@lemon>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <698a2d9a-8582-39e0-7b8b-ef1be898f929@redhat.com>
Date: Tue, 18 Oct 2016 15:49:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <20161018133435.GD14000@lemon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 18 Oct 2016 13:49:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v5 0/8] KVM PCI/MSI passthrough
 with mach-virt
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, fkan@apm.com,
	qemu-devel@nongnu.org, Bharat.Bhushan@freescale.com,
	alex.williamson@redhat.com, pranav.sawargaonkar@gmail.com,
	qemu-arm@nongnu.org, diana.craciun@freescale.com,
	christoffer.dall@linaro.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: myGJJMU+ea3/

Hi Fam,

On 18/10/2016 15:34, Fam Zheng wrote:
> On Mon, 10/17 22:56, Auger Eric wrote:
>>> make[1]: *** No rule to make target `../hw/core/platform-bus-stub.o', needed by `qemu-system-x86_64'.  Stop.
>> I can't figure out why this rule is missing?
>>
>> I compiled on x86 and aarch64 with
>> ./configure --target-list="x86_64-softmmu" --enable-werror and it looks
>> OK. What do I miss here?
> 
> I think the reason it doesn't work is this: common-obj-y objects are built as
> prerequisite of $(SUBDIR_RULES) which is defined in Makefile, from which the
> unnest of common-obj-y doesn't include this stub object, because Makefile
> doesn't read default-config; later make enters Makefile.target, this time
> common-obj-y _includes_ platform-bus-stub.o, but the object rule doesn't work
> there.
> 
> I think the easiest solution is still move the stub function to stubs/, or
> otherwise you need to fix Makefile or rules.mak for this to work.

Many thanks for this analysis.

I will move the stub functions in stubs/ if it does the same job.

Thanks

Eric
> 
> Fam
> 
