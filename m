Received: by 10.25.15.230 with SMTP id 99csp1722525lfp;
        Tue, 28 Mar 2017 10:24:47 -0700 (PDT)
X-Received: by 10.55.183.3 with SMTP id h3mr25211786qkf.165.1490721886908;
        Tue, 28 Mar 2017 10:24:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u29si3968470qta.260.2017.03.28.10.24.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Mar 2017 10:24:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54467 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1csurO-0008CY-EJ
	for alex.bennee@linaro.org; Tue, 28 Mar 2017 13:24:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43581)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1csurK-0008CR-Rx
	for qemu-arm@nongnu.org; Tue, 28 Mar 2017 13:24:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1csurH-00048l-Mr
	for qemu-arm@nongnu.org; Tue, 28 Mar 2017 13:24:42 -0400
Received: from mx2.suse.de ([195.135.220.15]:50239)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <agraf@suse.de>)
	id 1csurH-00048P-Gn; Tue, 28 Mar 2017 13:24:39 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id E9C03AC4A;
	Tue, 28 Mar 2017 17:24:36 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>,
	Vijay Kilari <vijay.kilari@gmail.com>
References: <1487850673-26455-1-git-send-email-vijay.kilari@gmail.com>
	<1487850673-26455-6-git-send-email-vijay.kilari@gmail.com>
	<CAFEAcA-wQwM=g-geopcn+9Y28UL22ugTWKwUOqmdbV=YD5Q1Rg@mail.gmail.com>
From: Alexander Graf <agraf@suse.de>
Message-ID: <f25cd84c-30d4-5e57-aec5-dd37b84a1a6f@suse.de>
Date: Tue, 28 Mar 2017 19:24:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-wQwM=g-geopcn+9Y28UL22ugTWKwUOqmdbV=YD5Q1Rg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 195.135.220.15
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
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v+7elZQaq9Dz

On 02/23/2017 07:37 PM, Peter Maydell wrote:
> On 23 February 2017 at 11:51,  <vijay.kilari@gmail.com> wrote:
>> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>>
>> Reset CPU interface registers of GICv3 when CPU is reset.
>> For this, ARMCPRegInfo struct is registered with one ICC
>> register whose resetfn is called when cpu is reset.
>>
>> All the ICC registers are reset under one single register
>> reset function instead of calling resetfn for each ICC
>> register.
>>
>> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>> ---
>>   hw/intc/arm_gicv3_kvm.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 60 insertions(+)
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

This patch breaks execution on 4.4 (SLES12 SP2) for me:

$ ./aarch64-softmmu/qemu-system-aarch64 -nographic -M 
virt,gic-version=host -enable-kvm -cpu host -kernel /boot/Image
qemu-system-aarch64: KVM_GET_DEVICE_ATTR failed: No such device or address
Group 6 attr 0x000000000000c664
Aborted (core dumped)

If I revert it, it works again. Is that device attr something only newer 
kernels received? In that case, it needs to be guarded by a capability 
check.


Alex

