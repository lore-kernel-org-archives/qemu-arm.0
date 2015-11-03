Received: by 10.182.105.169 with SMTP id gn9csp1647614obb;
        Mon, 2 Nov 2015 20:34:32 -0800 (PST)
X-Received: by 10.55.82.84 with SMTP id g81mr34220087qkb.16.1446525272732;
        Mon, 02 Nov 2015 20:34:32 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 41si21258388qgt.67.2015.11.02.20.34.32
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Mon, 02 Nov 2015 20:34:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45604 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZtTIm-0007A4-Ek
	for alex.bennee@linaro.org; Mon, 02 Nov 2015 23:34:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56540)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZtTI5-0006SM-Rk
	for qemu-devel@nongnu.org; Mon, 02 Nov 2015 23:33:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZtTI4-00018g-Ly
	for qemu-devel@nongnu.org; Mon, 02 Nov 2015 23:33:49 -0500
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:33337)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ZtTI4-00017v-Gc; Mon, 02 Nov 2015 23:33:48 -0500
Received: by wmeg8 with SMTP id g8so75013188wme.0;
	Mon, 02 Nov 2015 20:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TaxuP5/H2lS4+MitObCEAsYPaZs/p0LOsH4wmkFOPZ0=;
	b=vH82fqOABmu6vU8k3IRvCeFZCftcFVOJVbxcijoziGyxhYVf6PXx6bOe1A2y1+xrSn
	wMlflR3u163q+P1JL02+w5r/ximUA3pPLhG1mw4Jeikv/7p8Mv8j61MeDs/crguGH/zz
	E9atMwCtXM3+kOhKkwoSxZcRBahl5j7WcKEPq2VkgrV788bDHiRPBafFu7uJF32ytTPU
	OIJX8yFkZoSRCilF6VD2tktuKloq2Gu+nSdItim9XGuQDVMKjtswQ2l95/1T6LnwO8lI
	AIsRRSz3oCtRrDn50Z8Wr5ODhwJazlVkfAalup0DJGXfZ7IYdTgfm4t8d2F1hMBk0I2D
	W5mg==
MIME-Version: 1.0
X-Received: by 10.28.178.69 with SMTP id b66mr16054452wmf.15.1446525227893;
	Mon, 02 Nov 2015 20:33:47 -0800 (PST)
Received: by 10.28.88.75 with HTTP; Mon, 2 Nov 2015 20:33:47 -0800 (PST)
In-Reply-To: <CAFEAcA9d2VLd=3spu_3Ji+Zw_pRJr_yEQUjyh87Av6c7wHHE-w@mail.gmail.com>
References: <1446285001-7316-1-git-send-email-zhaoshenglong@huawei.com>
	<CAPokK=o74VZSArfMBuybGFHhWu3g6+o=2Mcegwg7PDCT1n9n5g@mail.gmail.com>
	<CAFEAcA9d2VLd=3spu_3Ji+Zw_pRJr_yEQUjyh87Av6c7wHHE-w@mail.gmail.com>
Date: Mon, 2 Nov 2015 20:33:47 -0800
Message-ID: <CAPokK=q9G22p6LZFcnzpjuNo2KntmstQDTeoVTSmmAx-Tw3S1Q@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::22c
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	qemu-arm@nongnu.org, Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] ARM: ACPI: Fix MPIDR value in
	ACPI table
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nXyPZmbj+C+X

On Sat, Oct 31, 2015 at 5:04 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 31 October 2015 at 18:53, Peter Crosthwaite
> <crosthwaitepeter@gmail.com> wrote:
>> On Sat, Oct 31, 2015 at 2:50 AM, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>>> From: Shannon Zhao <shannon.zhao@linaro.org>
>>>
>>> Use mp_affinity of ARMCPU as the CPU MPIDR instead of the CPU index.
>>>
>>> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>>> ---
>>> This patch is based on below patch.
>>> http://lists.nongnu.org/archive/html/qemu-devel/2015-10/msg06919.html
>>>
>>>  hw/arm/virt-acpi-build.c | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>> index 29a1980..1c621cb 100644
>>> --- a/hw/arm/virt-acpi-build.c
>>> +++ b/hw/arm/virt-acpi-build.c
>>> @@ -451,13 +451,15 @@ build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info,
>>>      for (i = 0; i < guest_info->smp_cpus; i++) {
>>>          AcpiMadtGenericInterrupt *gicc = acpi_data_push(table_data,
>>>                                                       sizeof *gicc);
>>> +        ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
>>> +
>>>          gicc->type = ACPI_APIC_GENERIC_INTERRUPT;
>>>          gicc->length = sizeof(*gicc);
>>>          if (guest_info->gic_version == 2) {
>>>              gicc->base_address = memmap[VIRT_GIC_CPU].base;
>>>          }
>>>          gicc->cpu_interface_number = i;
>>> -        gicc->arm_mpidr = i;
>>> +        gicc->arm_mpidr = armcpu->mp_affinity;
>>
>> As a general rule, hw/ should not be reaching into the CPU state
>> struct like this. What is the real HW equivalent of this query?
>
> This is just doing the same thing the hw/arm/virt.c code does
> to populate the dt... (In real firmware it would presumably
> either (a) have a fixed ACPI table or (b) maybe read the MPIDR,
> but neither of those really fits here I think.)

So, I think this is just another case of the MPIDR information flow
going the wrong way. It should go from board to all of CPU, DT and now
this. I guess we can just fix this incrementally when we fix the
implicit setting of MPIDR in mach-virt.

Regards,
Peter

>
> thanks
> -- PMM
