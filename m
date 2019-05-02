Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp6787317wrh;
        Thu, 2 May 2019 02:15:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzMfIrwQtE9pTG89ifgjZ86elK84ECqVVm/b9R7dVYmCKMnIzrtt2Nfq9Xg9tx0bh9rkxV8
X-Received: by 2002:adf:dbcc:: with SMTP id e12mr1884244wrj.134.1556788544857;
        Thu, 02 May 2019 02:15:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556788544; cv=none;
        d=google.com; s=arc-20160816;
        b=hWFztmV2GS/bI2iu0ijdEPIT4bnljaSqhvpHNVUPRvrrb17JYE/B8ica+b6lwGXCyW
         GihkZqONZOJIbeC8C+qLLp4+OfgiTS7V+/ho1ms9kg0D92yS7CM518/Zum+llyPcoJwP
         EAo+vpTVo2gbD6x+dEFQUc4IcDujEjG28qb1VmZvv7stwLdRD2LgsHFBBYYHcx/kXY+r
         G9FIdTc2mNRTWA7++Ru4cKDF5cXFOAYGL6fg/E1mJHeNoubj2xlHtqTnixBZDV4bmLP0
         rezXP2MW3hWOwAc1RgsOtydzUH4lan8+MGuHQvGsBBteb1NoNWbIGS2bBrsU9RfaIhT2
         geOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=znObITEtc6Zjc9sqUQ0KtSDfRRmpQtsc4V/S2AwJ7Ho=;
        b=iOMEBxeJTpu39cZPTPmNE7CJwasi1c40wj8jfhxLgaI+lFO9Qdw4RE0Vz3xCOPH849
         W4S6GBedXm6/PlOWXRiliXxzaEjJE4Nfp1geWqbLyPwHvFCuYJKKjLdJkp95X5L2zQlw
         wEWUmllyTXdCVTArR5C7CnMYoerR9vUI9qDuLeu81oxSomUe5bv9vU8mSw6ABCszJLks
         DqE2JoHcgCGHiPNw8MpjZW+VusybHkrdeN5gm1yv2ADZ1QK3QlQXuPRecGcpaYf6+Pza
         VGn2v8xhramMaB+F16QzSAFfI4mb5j/WmE2Jbu9dYSM54fIo6fBY1094FMqkwxyi+caU
         jSvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y132si4622572wmc.167.2019.05.02.02.15.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 May 2019 02:15:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:48100 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hM7od-0005H6-Uv
	for alex.bennee@linaro.org; Thu, 02 May 2019 05:15:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hM7oO-0005FL-Gd
	for qemu-arm@nongnu.org; Thu, 02 May 2019 05:15:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hM7oN-0008HK-6k
	for qemu-arm@nongnu.org; Thu, 02 May 2019 05:15:28 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:49441)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hM7oE-0006yX-JB; Thu, 02 May 2019 05:15:20 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
	1MI4gb-1ha5zK2AwJ-00FDFv; Thu, 02 May 2019 11:12:09 +0200
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<philmd@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20190427141459.19728-1-philmd@redhat.com>
	<20190427141459.19728-4-philmd@redhat.com>
	<bb31dd2a-8cd6-0dfe-a71f-4c47ec3d9687@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <65906ce9-944a-0845-5126-2355b1a2f150@vivier.eu>
Date: Thu, 2 May 2019 11:12:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <bb31dd2a-8cd6-0dfe-a71f-4c47ec3d9687@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/q9Tv0oureixicFJ1lTQcd4rLDvlZmO/T9rSCmAQVxUOwNHBbn8
	GcaJVq+sLynv6AneP6qKgebMB6AUcpOVMDIR7w2ae5NRfjlwz3XtkiMorrhDhLXd8N3vAHC
	t0zY0uUyPN6vG5viaU938/620Ufdh4nCnfbvMo422+ssBuu1VnP3JT6ZZbpcIL04/NFTmKE
	5NPB7RbA/M/YTikdWgxTw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FLL73RMG2rE=:BBNdAeIKr6GHiMchOffGql
	4M7TESNYwCTQdRKCVlK/BvMc7jNooE2cL0PGT5IUPKOzz/kbpu+iFPaCBt54jMVVl43KbMrtx
	TUiVADpgGFZy0hv5Tp85chW5AyDDrkmZo8iildKYXsvK8E2ueZIgJDTF9kzfRgrXn+eU+f6jc
	oM/PhzJEvs/yGBzFRWUTPgRqodNaJRsO2COgEtk2accXxdK0RXlr/4CNHW9SKPwynlxEuQI03
	SA6EBCobyCDUUhi/0MqDInFD7k/zP8I+zvsYdCQSqayuRYvBsqxmrWNjEbQCNfUMLxfvUIB9Q
	QUs05oqMJZ0yMA3vwtfOCcdkETjZjYclMIxj5GvxE5NVmfOF0GWoVS3SeycSCYLaV1ZH12LMV
	kEGBJsnXG23hBBcKRavC8fWMq5X3hvxC7VNEayqLtGDmltwixiX69XnxxsiAcLI/P/nV1zFU5
	zK6nSw70kk6oN2NbwtKh6dNrIN1xesUrwBJVeoOZ72h6fGUKQ4EmenaGwVGNxpR+inGcProIz
	kr9BzaCpsW7RCaIDVmfJWOEWgiRmG8bv9ZJ/p3OKCSFOL0LZCjPDTSvYgoxHm/gy8KHFKwqjk
	oy/WMdifgyTbawra6amOpxDfhNVLtiCa8yJ5i1+Ub7mSFEtkdqKz6Ow6DdsM/f3Jy7mn5mDDP
	+zAsXq/E8zZjXU7f/LsiU3zFWpqY7psg86eXTsUDlpcHzXBTrWCef3FHQyCZl1/rJ+rP8yvSh
	P4FG4kvLUNcs2/Rhe1mlBXGL6Pb9fogB16UDlzJYHdIpSXfzAvleeHhuUdw=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: Re: [Qemu-arm] [Qemu-trivial] [PATCH 3/3] hw/dma: Do not build the
 xlnx_dpdma device for the MicroBlaze machines
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3OSYxHudEY35

On 27/04/2019 16:46, Thomas Huth wrote:
> On 27/04/2019 16.14, Philippe Mathieu-Daudé wrote:
>> The xlnx_dpdma device is only used by the ZynqMP AArch64 machine
>> (not the MicroBlaze PMU). Remove it from the ZynqMP generic objects.
>> (Note, this entry was duplicated for the AArch64).
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/dma/Makefile.objs | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/hw/dma/Makefile.objs b/hw/dma/Makefile.objs
>> index 79affecc390..a5b1276f52a 100644
>> --- a/hw/dma/Makefile.objs
>> +++ b/hw/dma/Makefile.objs
>> @@ -8,7 +8,6 @@ common-obj-$(CONFIG_XILINX_AXI) += xilinx_axidma.o
>>  common-obj-$(CONFIG_ZYNQ_DEVCFG) += xlnx-zynq-devcfg.o
>>  common-obj-$(CONFIG_ETRAXFS) += etraxfs_dma.o
>>  common-obj-$(CONFIG_STP2000) += sparc32_dma.o
>> -obj-$(CONFIG_XLNX_ZYNQMP) += xlnx_dpdma.o
>>  obj-$(CONFIG_XLNX_ZYNQMP_ARM) += xlnx_dpdma.o
>>  common-obj-$(CONFIG_XLNX_ZYNQMP_ARM) += xlnx-zdma.o
>>  
>>
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 

Applied to my trivial-patches branch.

Thanks,
Laurent
