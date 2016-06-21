Received: by 10.25.21.96 with SMTP id l93csp2114986lfi;
        Tue, 21 Jun 2016 12:48:16 -0700 (PDT)
X-Received: by 10.55.155.193 with SMTP id d184mr33433351qke.152.1466538494965;
        Tue, 21 Jun 2016 12:48:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r70si1396230qkr.195.2016.06.21.12.48.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Jun 2016 12:48:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53950 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFReg-0005jw-99
	for alex.bennee@linaro.org; Tue, 21 Jun 2016 15:48:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34482)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bFReb-0005i3-8R
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 15:48:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bFReR-00030O-FK
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 15:48:08 -0400
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:36191)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bFReR-00030C-Ad
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 15:47:59 -0400
Received: by mail-vk0-x232.google.com with SMTP id u64so34596172vkf.3
	for <qemu-arm@nongnu.org>; Tue, 21 Jun 2016 12:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=j/ppqey9Se2swrUtI9nlqLj3RmZNbtfozr1Q4APEjRI=;
	b=L58JZfSEqMKIQOMQYa7XTYT+5YkU/hIvCgqrK/kFYjPbba8MBr1BImmJN5ZovBixZa
	GCYue+ZgALZBaIK2PtFmcKrNVdMyCgAji5ZYLcf56ypnY6a58eUnrW1hrRUGsiYPcR3R
	PXW4+h8R6sZL4jELxE+wY4jCVgFCIEwMBvtnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=j/ppqey9Se2swrUtI9nlqLj3RmZNbtfozr1Q4APEjRI=;
	b=dUlw94onpkl0IyWi001h5dnHp569khx+NCWHTHUOnu1p0OvuJ2/UEmwt9P56mN08V9
	JnAYW8DcC44+h0V9QWxe0PwBV2AUYyxDihZuMxMzitjjevzeDKOp0KQhI6s8QhXa+f2y
	oxzMG56lut+VwonE5jQie19XH6jsZ1YO1/JgFtGQP7jqHROp+Xq5miYmWXWMKForsKPx
	zRJnGVIOhqzMcvnQe3IoZBhmtph8+txOClMC/g7J7nvJOamlrCM3ul/zAkjKUKlEupan
	AcZuiK1uDtwMQXza9XwF0CJOibl7KhFBtNAugKc2qPUEY4eiecYEN6IDCFzAfCKJ6Hc0
	dsIw==
X-Gm-Message-State: ALyK8tKlIs8P2mk9D0aS3e3UOhdPsMn1HsrO91577AFoGop+I7Jhx5oPfhlECkhhhHtIpduK1OTLJg1iyXEAAXsV
X-Received: by 10.159.37.175 with SMTP id 44mr10517782uaf.66.1466538478803;
	Tue, 21 Jun 2016 12:47:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Tue, 21 Jun 2016 12:47:39 -0700 (PDT)
In-Reply-To: <20160621184552.p7trf4zpqnrmwruu@hawk.localdomain>
References: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
	<1466528974-12183-7-git-send-email-peter.maydell@linaro.org>
	<20160621184552.p7trf4zpqnrmwruu@hawk.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2016 20:47:39 +0100
Message-ID: <CAFEAcA_AnYGV0jy9HAUevHPB=FY3NP25-7BUpdbySZS-QPeGrg@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 6/6] hw/arm/virt: Set
 minimum_page_bits to 12
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l6ka+bweEkP4

On 21 June 2016 at 19:45, Andrew Jones <drjones@redhat.com> wrote:
> On Tue, Jun 21, 2016 at 06:09:34PM +0100, Peter Maydell wrote:
>> Since the virt board model will never create a CPU which is
>> pre-ARMv7, we know that our minimum page size is 4K and can
>> set minimum_page_bits accordingly, for improved performance.
>>
>> Note that this is a migration compatibility break.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  hw/arm/virt.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index c5c125e..f9b51aa 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1440,6 +1440,8 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>>      mc->block_default_type = IF_VIRTIO;
>>      mc->no_cdrom = 1;
>>      mc->pci_allow_0_address = true;
>> +    /* We know we will never create a pre-ARMv7 CPU which needs 1K pages */
>> +    mc->minimum_page_bits = 12;
>>  }
>
> As this breaks migration, then I guess we also need
>
> @@ -1507,5 +1510,6 @@ static void virt_machine_2_6_options(MachineClass *mc)
>  {
>      virt_machine_2_7_options(mc);
>      SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_6);
> +    mc->minimum_page_bits = 10;
>  }
>  DEFINE_VIRT_MACHINE(2, 6)

Doesn't hurt, but are we trying to claim migration
compat between different QEMU versions with the
versioned-machine names ?

thanks
-- PMM
