Received: by 10.25.15.230 with SMTP id 99csp1723097lfp;
        Tue, 28 Mar 2017 10:26:29 -0700 (PDT)
X-Received: by 10.237.63.7 with SMTP id p7mr26355644qtf.249.1490721989107;
        Tue, 28 Mar 2017 10:26:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a49si3996770qtb.17.2017.03.28.10.26.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Mar 2017 10:26:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54478 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1csut2-0000d5-LS
	for alex.bennee@linaro.org; Tue, 28 Mar 2017 13:26:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1csusz-0000co-5O
	for qemu-arm@nongnu.org; Tue, 28 Mar 2017 13:26:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1csusw-00056Q-0N
	for qemu-arm@nongnu.org; Tue, 28 Mar 2017 13:26:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37010)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1csusv-00054o-R7; Tue, 28 Mar 2017 13:26:21 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8B20BC06C9EF;
	Tue, 28 Mar 2017 17:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8B20BC06C9EF
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 8B20BC06C9EF
Received: from localhost.localdomain (ovpn-117-27.ams2.redhat.com
	[10.36.117.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82DA590A67;
	Tue, 28 Mar 2017 17:26:18 +0000 (UTC)
To: Alexander Graf <agraf@suse.de>, Peter Maydell <peter.maydell@linaro.org>, 
	Vijay Kilari <vijay.kilari@gmail.com>
References: <1487850673-26455-1-git-send-email-vijay.kilari@gmail.com>
	<1487850673-26455-6-git-send-email-vijay.kilari@gmail.com>
	<CAFEAcA-wQwM=g-geopcn+9Y28UL22ugTWKwUOqmdbV=YD5Q1Rg@mail.gmail.com>
	<f25cd84c-30d4-5e57-aec5-dd37b84a1a6f@suse.de>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <aee838cc-d6c2-08bf-16b7-2951b96796a0@redhat.com>
Date: Tue, 28 Mar 2017 19:26:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <f25cd84c-30d4-5e57-aec5-dd37b84a1a6f@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 28 Mar 2017 17:26:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v9 5/5] hw/intc/arm_gicv3_kvm:
 Reset GICv3 cpu interface registers
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
Cc: Marc Zyngier <marc.zyngier@arm.com>, Pavel Fedin <p.fedin@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OEn7BsQQdCPr

Hi Alex,

On 28/03/2017 19:24, Alexander Graf wrote:
> On 02/23/2017 07:37 PM, Peter Maydell wrote:
>> On 23 February 2017 at 11:51,  <vijay.kilari@gmail.com> wrote:
>>> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>>>
>>> Reset CPU interface registers of GICv3 when CPU is reset.
>>> For this, ARMCPRegInfo struct is registered with one ICC
>>> register whose resetfn is called when cpu is reset.
>>>
>>> All the ICC registers are reset under one single register
>>> reset function instead of calling resetfn for each ICC
>>> register.
>>>
>>> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>>> ---
>>>   hw/intc/arm_gicv3_kvm.c | 60
>>> +++++++++++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 60 insertions(+)
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> This patch breaks execution on 4.4 (SLES12 SP2) for me:
> 
> $ ./aarch64-softmmu/qemu-system-aarch64 -nographic -M
> virt,gic-version=host -enable-kvm -cpu host -kernel /boot/Image
> qemu-system-aarch64: KVM_GET_DEVICE_ATTR failed: No such device or address
> Group 6 attr 0x000000000000c664
> Aborted (core dumped)
> 
> If I revert it, it works again. Is that device attr something only newer
> kernels received? In that case, it needs to be guarded by a capability
> check.

The patch just posted should fix it:

[PATCH v2] hw/intc/arm_gicv3_kvm: Check KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS
in reset

Thanks

Eric
> 
> 
> Alex
> 
