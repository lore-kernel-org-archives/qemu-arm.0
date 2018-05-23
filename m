Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1123775wre;
        Wed, 23 May 2018 13:41:13 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZp8+X9GOQhKvDZ8ggd5eMCU44/czkS/RgY5gdKfhI2LEzML86rnvGwWc9hG+IZDfIv6tmKs
X-Received: by 2002:ac8:2e8d:: with SMTP id h13-v6mr4293220qta.39.1527108073430;
        Wed, 23 May 2018 13:41:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527108073; cv=none;
        d=google.com; s=arc-20160816;
        b=NqpRrdaHF3ESLC0xiIXmyUQxf2lTwpE/kSlV8n5kK102MotVOtXyQo3NSwh8ciKnBe
         vXoAXpu8AtcQtIj3psFOHYhG2ewzsNvkUxxgS2yrBIVDrvSWdME/7M59QaSf5G4Kvc0N
         4ZfjRzyveZ7VzcX51qmMWhLQ2BYcJ0Jg4yPRSMtuu2aUB5R8ZLuiRUl8FLbp9/gxZhVi
         OrZYooseT8dMQ8g304iE/vBHeVShYITZDGY8AVT2ILruhlaCG3aOJTLRez2R+D3O9qRD
         d5V3fhU9ec2oUrH3MWf7jZSDydo4IGq9ft1hWljiRSdim0riSG5LsW4B4Tyge/b7fbGV
         1pJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=fII0MuK8tE8CzAAlhopTjFFUzwZa4x9bUhCu0+C16tc=;
        b=IkmYXWDeYSDPLinZiQfNNSnjzHUbT082zawoTNCiIbKPeBg+pWNTvEl62xiJ3yivW+
         UylkIDJUA+MuMwf6dUGbtR+oCac3sOeBShR+iu2VQo7wyDvzkdA78i63+40xYan/4T0c
         1micbNT5Sm4JuHSviaoZBaMEWWLOzyc0t0wni2pEimg/+S/ZZFO2+aw0Gg+NRDO0DaqM
         unvB1AzIWuUBOo6jczbmLZVPnxrWLfcWocr9NwZlfbGvWV1H0Pcma0zlPrPJeyt+hvk8
         Pq47Fnx2h3fFgDmcuC4UiCn957ONClmeIqWWXMFKOBTUgE2U812CwvgArNBH4oiaDPa9
         Pqqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a12-v6si4940774qtj.370.2018.05.23.13.41.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 May 2018 13:41:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35331 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLaZM-0006m8-V7
	for alex.bennee@linaro.org; Wed, 23 May 2018 16:41:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fLaYr-0006Z3-Ox
	for qemu-arm@nongnu.org; Wed, 23 May 2018 16:40:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fLaYo-0002Vv-Hi
	for qemu-arm@nongnu.org; Wed, 23 May 2018 16:40:41 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51070 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fLaYo-0002Vn-Bi; Wed, 23 May 2018 16:40:38 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 810C440BC04F;
	Wed, 23 May 2018 20:40:37 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3EE96B592;
	Wed, 23 May 2018 20:40:31 +0000 (UTC)
To: Laszlo Ersek <lersek@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <1527091418-11874-1-git-send-email-eric.auger@redhat.com>
	<ec6bc0b3-5f0b-bf0c-7d9b-0382e114ee9e@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <bf99311a-823d-34e8-1892-be27534afc32@redhat.com>
Date: Wed, 23 May 2018 22:40:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <ec6bc0b3-5f0b-bf0c-7d9b-0382e114ee9e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 23 May 2018 20:40:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 23 May 2018 20:40:37 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 0/2] ARM virt: Support up to 256
 PCIe buses
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
Cc: drjones@redhat.com, zhaoshenglong@huawei.com, ard.biesheuvel@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DuWAF4ULWJNe

Hi Laszlo,

On 05/23/2018 07:45 PM, Laszlo Ersek wrote:
> Hi Eric,
> 
> On 05/23/18 18:03, Eric Auger wrote:
>> Current Machvirt PCI host controller's ECAM region is 16MB large.
>> This limits the number of PCIe buses to 16.
>>
>> PC/Q35 machines have a 256MB region allowing up to 256 buses.
>> This series tries to bridge the gap.
>>
>> It declares a new ECAM region located beyond 256GB, of size 256MB
>> (just after the hypothetical new GICv3 RDIST region). The new
>> ECAM region is used as soon as the highmem option is set (default)
>> and disabled for machines older than 3.0.
>>
>> Best Regards
>>
>> Eric
>>
>> Git: complete series available at
>> https://github.com/eauger/qemu/tree/v2.12.0-256MB-ECAM-RFCv1
>>
>> - Tested with guest running in aarch64 and aarch32 modes (aarch64=off)
>> - In aarch32 mode I encountered the issue the vmalloc region may be
>>   reported too small for the needs (dmesg excerpt below). So I had to
>>   extend the vmalloc size by passing the "vmalloc=512M" option to the
>>   bootargs and this eventually booted fine.
>>
>> [    1.399581] pl061_gpio 9030000.pl061: PL061 GPIO chip @0x0000000009030000 registered
>> [    1.402636] OF: PCI: host bridge /pcie@10000000 ranges:
>> [    1.404506] OF: PCI:    IO 0x3eff0000..0x3effffff -> 0x00000000
>> [    1.406606] OF: PCI:   MEM 0x10000000..0x3efeffff -> 0x10000000
>> [    1.408690] OF: PCI:   MEM 0x8000000000..0xffffffffff -> 0x8000000000
>> [    1.411992] vmap allocation for size 1052672 failed: use vmalloc=<size> to increase size
>> [    1.414895] pci-host-generic 4010000000.pcie: ECAM ioremap failed
>> [    1.427472] pci-host-generic: probe of 4010000000.pcie failed with error -12
>>
>> - Maybe this issue deserves introducing a new highmem_ecam option?
> 
> I refer to my earlier email here:
> 
>   http://mid.mail-archive.com/13d95529-d61e-fc30-ffd4-f1ef93edad40@redhat.com
> 
> This series flips the sole ECAM range that is exposed to the guest to a
> large one that is located above 4GB. That's a problem because -- to my
> understanding -- it breaks 32-bit ARM UEFI builds, unless you change the
> QEMU command line.

Thank you for your quick feedback. Effectively I ran the aarch32 guest
in DT boot. My bad.
> 
> (1) Please enable the "firmware repo" from Gerd's site:
> 
> https://www.kraxel.org/repos/
> 
> (2) Please install the "edk2.git-arm" package.
> 
> (3) Please run the 32-bit ARM UEFI firmware, with qemu-system-aarch64,
> in a separate directory, as follows (note: TCG only, KVM not needed):
> 
>   cp /usr/share/edk2.git/arm/vars-template-pflash.raw vars
>   FWBIN=/usr/share/edk2.git/arm/QEMU_EFI-pflash.raw
> 
>   qemu-system-aarch64 \
>     -nodefaults \
>     -no-user-config \
>     \
>     -M virt \
>     -cpu cortex-a15 \
>     -m 1024 \
>     \
>     -drive if=pflash,format=raw,file=$FWBIN,readonly \
>     -drive if=pflash,format=raw,file=vars \
>     \
>     -device virtio-gpu-pci \
>     -device qemu-xhci \
>     -device usb-kbd \
>     \
>     -chardev stdio,signal=off,mux=on,id=char0 \
>     -mon chardev=char0,mode=readline \
>     -serial chardev:char0
> 
> This will boot the UEFI shell for you in a graphical window and take
> input from the keyboard in that window. A virtio-gpu-pci device is used
> as GPU (a PCI Express virtio device) and a USB3.0 keyboard is used as
> human input device (the USB3.0 controller is also PCI Express).
> 
> 
> I didn't test it, but I expect that this series, when applied as-is,
> will break the above use case, unless highmem is explicitly disabled.

Yes as you expected, it leads to an exception whereas it works properly
without the series. Actually I misunderstood your last email and was
thinking/hoping that with aarch32 LPAE, things should work.


PCI Bus First Scanning

Data Abort Exception PC at 0x7F7E1A06  CPSR 0x40000033 nZcveaifT_svc
/home/jenkins/workspace/edk2/build/edk2-g7cd8a57599/Build/ArmVirtQemu-ARM/DEBUG_GCC5/ARM/MdeModulePkg/Bus/Pci/PciHostBridgeDxe/PciHostBridgeDxe/DEBUG/PciHostBridgeDxe.dll
loaded at 0x7F7E0000 (PE/COFF offset) 0x1A06 (ELF or Mach-O offset) 0xA06
0x6820       LDR    r0, [r4 #0x0]
  R0 0x00000001   R1 0xFFFFFFFF   R2 0x00000000   R3 0x00000000
  R4 0x10000000   R5 0x7FAC6C28   R6 0x00000001   R7 0x00000004
  R8 0x7FAC6C28   R9 0x00000000  R10 0x00000000  R11 0x00000000
 R12 0x00000000   SP 0x7FAC6B68   LR 0x7F7E19F5   PC 0x7F7E1A06
DFSR 0x00000008 DFAR 0x10000000 IFSR 0x00000000 IFAR 0x00000000
 Precise External Abort: read from 0x10000000

ASSERT [ArmCpuDxe]
/home/jenkins/workspace/edk2/build/edk2-g7cd8a57599/ArmPkg/Library/DefaultExceptionHandlerLib/Arm/DefaultExceptionHandler.c(268):
((BOOLEAN)(0==1))

> 
> I think the first patch is OK (modulo the runaway empty line at the end
> of acpi_dsdt_add_pci()), while realizing my review cannot be complete.
> :)
> 
> Regarding the second patch, I do believe we need "more sophistication"
> there. For example, I guess it could be possible to distinguish "-cpu
> cortex-a15" from "-cpu cortex-a57" somehow, and stick with the low/small
> ECAM in the former case. (The 32-bit firmware already runs on cortex-a15
> only, and not on cortex-a57, according to my testing.)

So we should detect we are in ACPI boot  + aarch32 mode to force legacy
ECAM region, right?

Thanks

Eric
> 
> Thanks,
> Laszlo
> 
