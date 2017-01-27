Received: by 10.25.77.65 with SMTP id a62csp111130lfb;
        Thu, 26 Jan 2017 23:44:54 -0800 (PST)
X-Received: by 10.55.121.194 with SMTP id u185mr6796631qkc.56.1485503093949;
        Thu, 26 Jan 2017 23:44:53 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g41si2969187qtb.257.2017.01.26.23.44.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Jan 2017 23:44:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43193 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cX1DH-0006mo-6E
	for alex.bennee@linaro.org; Fri, 27 Jan 2017 02:44:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cX1DB-0006l0-AP
	for qemu-arm@nongnu.org; Fri, 27 Jan 2017 02:44:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cX1D7-00012w-Vr
	for qemu-arm@nongnu.org; Fri, 27 Jan 2017 02:44:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48370)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1cX1D7-00012W-QT; Fri, 27 Jan 2017 02:44:41 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DA2666DD86;
	Fri, 27 Jan 2017 07:44:41 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-36.ams2.redhat.com
	[10.36.116.36])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0R7ibAO025160
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 27 Jan 2017 02:44:39 -0500
To: Vijay Kilari <vijay.kilari@gmail.com>
References: <1485422381-29019-1-git-send-email-eric.auger@redhat.com>
	<1485422381-29019-3-git-send-email-eric.auger@redhat.com>
	<CALicx6uLp5SapC5PiDRB6OdaVWXVNYUCORAQ7EsPJ-KNNF5cTw@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ba3db103-9b6f-880d-aeea-d3194a1d34f1@redhat.com>
Date: Fri, 27 Jan 2017 08:44:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CALicx6uLp5SapC5PiDRB6OdaVWXVNYUCORAQ7EsPJ-KNNF5cTw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 27 Jan 2017 07:44:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC 2/4] hw/intc/arm_gicv3_kvm: Rename
 KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS
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
Cc: Peter Maydell <peter.maydell@linaro.org>, drjones@redhat.com,
	Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, peterx@redhat.com,
	"Kumar, Vijaya" <Vijaya.Kumar@cavium.com>,
	qemu-arm <qemu-arm@nongnu.org>, shannon.zhao@linaro.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0vRuO3twqrMJ

Hi Vijaya,

On 27/01/2017 08:02, Vijay Kilari wrote:
> Hi Eric,
> 
> On Thu, Jan 26, 2017 at 2:49 PM, Eric Auger <eric.auger@redhat.com> wrote:
>> Rename KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS into KVM_DEV_ARM_VGIC_CPU_SYSREGS
>> as exposed in the kernel user API and pulled by update-linux-headers.sh.
> 
> I will fix it in my next qemu patch series.
> I have updated kernel to use KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS in
> latest kernel patch
> version v11. I so you can drop this patch.

Sure I saw the change in your v11.

Thanks

Eric
> 
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> KVM_DEV_ARM_VGIC_CPU_SYSREGS may be fixed at kernel level instead
>> ---
>>  hw/intc/arm_gicv3_kvm.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
>> index 267c2d6..d8ecbc3 100644
>> --- a/hw/intc/arm_gicv3_kvm.c
>> +++ b/hw/intc/arm_gicv3_kvm.c
>> @@ -108,7 +108,7 @@ static inline void kvm_gicr_access(GICv3State *s, int offset, int cpu,
>>  static inline void kvm_gicc_access(GICv3State *s, uint64_t reg, int cpu,
>>                                     uint64_t *val, bool write)
>>  {
>> -    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
>> +    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_CPU_SYSREGS,
>>                        KVM_VGIC_ATTR(reg, s->cpu[cpu].gicr_typer),
>>                        val, write);
>>  }
>> --
>> 2.5.5
>>
