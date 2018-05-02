Received: by 10.28.4.212 with SMTP id 203csp782765wme;
        Wed, 2 May 2018 07:23:43 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrSpYRLkQEbkmOnyQQ4tcnDAUqJA0H5mUeCayjhEP0dPk0Ec7DtFwKfBP4ibmXTsv95PG5u
X-Received: by 10.176.83.91 with SMTP id y27mr18477017uay.146.1525271023620;
        Wed, 02 May 2018 07:23:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525271023; cv=none;
        d=google.com; s=arc-20160816;
        b=YTxQD+UrsTQZcAL7hR46vDy33a4ZsO+X6JtOLbBa56s/nB++Kd85pvpdLE1GV5krP9
         i4baJIllRU/ZjnCxTOGsT6epnX8PUls5mmM767rlxCpfuijDaNmlh+iAiT5vzpegeGsF
         oS1vzmg5zl0JFEDNtctCoZoYEHIyIN+W8KY9H48f1dZAl7InyeH5Ufezbys3UhiStpRw
         8xM1w12XdKlCXpxSh3mMGSPVVrrYkS9AGwnj8zw7RIq/k4ZTo52OI6D5WurzTbNtT7Lj
         X7Ib9lmcKUJkabrER5BGufO5zBdKHg1WSO1+LYTyutfN6gPqD7cdjiowQToor6+9PeZf
         pqdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=u2fmKrKMpqBLcF8R3PItG5Po99Dj74gO1bb/jIi0cnI=;
        b=YmMNtWUclea0V/oJd/DnrAgBzUhRCNUPtYaLtBtWD63O/35MpiJWzAmlUIzlYdurT2
         cr6MVTPz2ixBOEztIL/w9F46iZmXuhHtMRXsprKX3l9CSFuZMtR+aJIWjghmmi5qm2r+
         NKnQkZRg2sUuiM5GEjwEM36u/knK8L8Xm+WNlFSKC3LGxiF4HiTqeu/UmyJ5VT2Ptee0
         F6PjEX/Nq4mfn8XepKpYRhK0JF3fVdzDJL90tpdpxlke8LkayCvi2jdTRmpjYRoKgjmm
         jGNfzhf1pUx3x1GXaQWJwdp7JzL1Dsr19Ku9PbI5M+dr3GsUqx15SbU9/bFIas0CO2AB
         ieaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BDS4xyTl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k10-v6si6086453vkd.2.2018.05.02.07.23.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 May 2018 07:23:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BDS4xyTl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50758 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fDsfX-0006xK-2G
	for alex.bennee@linaro.org; Wed, 02 May 2018 10:23:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54544)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1fDsfG-0006u8-HS
	for qemu-arm@nongnu.org; Wed, 02 May 2018 10:23:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1fDsfA-0000yB-8U
	for qemu-arm@nongnu.org; Wed, 02 May 2018 10:23:26 -0400
Received: from mail-it0-x22e.google.com ([2607:f8b0:4001:c0b::22e]:36006)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ard.biesheuvel@linaro.org>)
	id 1fDsfA-0000y2-25
	for qemu-arm@nongnu.org; Wed, 02 May 2018 10:23:20 -0400
Received: by mail-it0-x22e.google.com with SMTP id e20-v6so17237714itc.1
	for <qemu-arm@nongnu.org>; Wed, 02 May 2018 07:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=u2fmKrKMpqBLcF8R3PItG5Po99Dj74gO1bb/jIi0cnI=;
	b=BDS4xyTlzr62Clh12EvVvP/tiNqarf8UnnBkqoA+FFpEgi7lcWQvDV7NM5OBKzRqXV
	M5eH1Q36B578JwGGgcqwq0xn/LPZTX/nfSHyI/G3+8cV+NDmz2G1RsurhFGLYZf62ngv
	02BEnikaEiw5Fcspg9UxvO7QVYxTNpQEjWGU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=u2fmKrKMpqBLcF8R3PItG5Po99Dj74gO1bb/jIi0cnI=;
	b=oP+RKBTGtopmLA/5ELRxMYkaNTm9qUljhhsyeXjNGE64ARbBVoH+QhrD7M/Og6JIH6
	Io+DZ04Jwd3pJ8dtqiVZGOAJuMzVBeqT8FscXuI0HbPtNfw+I28Cnb/1HKyegCSVZ+E9
	TXrFs4S08VIuWIUKqbiHLUnt2006FDrUpcKkizq0Xv2E14yy2M3NeQq3DvRA0NpSrvB7
	fjqatEkM7lk00Y1CKXM48F6PdRN+8L9WSiHZ2k7BaFDNBzUBIW1NMAYp+T8cAU5MklWt
	62rI3fcw5Uu/NI7AOPzYibpQ8BCvutL2ftEs2G4aMrzH7f1UFwH1k8k1lDwQHr4xRMB+
	KeLg==
X-Gm-Message-State: ALQs6tAjThE2wB9u8zBMXFu7qh4Wqa9B3af2Sd1MMHFUNXfSErwcdfnO
	FhD9GH+Iioynn2nccsDisO3ea8FgovDMJc6sUjP1Bg==
X-Received: by 2002:a24:b14d:: with SMTP id
	c13-v6mr20306428itj.106.1525270999240; 
	Wed, 02 May 2018 07:23:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.187.134 with HTTP; Wed, 2 May 2018 07:23:18 -0700 (PDT)
In-Reply-To: <0c121886-f40a-6682-267c-dfa3bfb195d0@redhat.com>
References: <f41972e8-0ae2-7c1d-a66a-499a841080e3@redhat.com>
	<13d95529-d61e-fc30-ffd4-f1ef93edad40@redhat.com>
	<CAKv+Gu-JWfDCApNcw_mpx+y2i+Hkn_Ow3NN_U84ybgOSD_0JOQ@mail.gmail.com>
	<0c121886-f40a-6682-267c-dfa3bfb195d0@redhat.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Wed, 2 May 2018 16:23:18 +0200
Message-ID: <CAKv+Gu-pN4ZR3Yu+81661ZEnekD42F=QaBMvUK=3thxa4fLgnw@mail.gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::22e
Subject: Re: [Qemu-arm] Expand ECAM region in machvirt 2_13?
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	qemu list <qemu-devel@nongnu.org>, Auger Eric <eric.auger@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pYcsIy4iNfU1

On 2 May 2018 at 15:54, Laszlo Ersek <lersek@redhat.com> wrote:
> On 05/02/18 14:34, Ard Biesheuvel wrote:
>> On 2 May 2018 at 13:31, Laszlo Ersek <lersek@redhat.com> wrote:
>>> On 05/01/18 17:59, Auger Eric wrote:
>>>> Hi,
>>>>
>>>> I would like to resume the discussion on extending the number of PCI
>>>> buses to 256 (as in Q35) as a follow-up of past discussions:
>>>> https://lists.gnu.org/archive/html/qemu-devel/2018-01/msg03631.html.
>>>>
>>>> With the current 16MB ECAM region we are limited to 16 PCIe busses.
>>>>
>>>> Could we envision to have a 256MB ECAM region and move it to another
>>>> location beyond 256GB, in virt2_13 machine type?
>>>>
>>>> Current ECAM range within [0x3f000000, 0x40000000] would be kept
>>>> unchanged for legacy and when vms->highmem is set to false.
>>>> Migration from <2_13 to >=2_13 would be allowed whereas migration
>>>> from >=2.13 to <2.13 wouldn't.
>>>
>>> If I understand correctly, the idea is to *move* the current one
>>> range, if the virt machine type is >= 2.13 and highmem is set to true
>>> (which is the default IIUC, from 2.12 onward).
>>>
>>> For 64-bit (AARCH64) ArmVirtQemu, that should work fine. The firmware
>>> takes the ECAM base and size from the "pci-host-ecam-generic" DT
>>> node, property "reg", uint64_t elements #0 and #1. (Sorry if this
>>> isn't exact DT lingo, I'm paraphrasing the firmware source code.) If
>>> the QEMU patch just changes the values, that should work
>>> transparently.
>>>
>>> For 32-bit (ARM) ArmVirtQemu, this change (the new ECAM default)
>>> could be a problem. PCI stuff in the firmware wouldn't work unless
>>> people specified highmem=off on the QEMU command line.
>>>
>>> Now, I notice highmen defaults to "on" starting with 2.12 even for
>>> "qemu-system-arm -M virt", not just "qemu-system-aarch64 -M virt", so
>>> why doesn't that already cause a problem with PCI in the 32-bit guest
>>> fw?
>>>
>>> Because, currently "highmen" only controls the presence of the 64-bit
>>> PCI MMIO aperture for BAR allocation; it has no effect on config
>>> space. And if the 64-bit PCI MMIO aperture is exposed to the 32-bit
>>> guest firmware, the latter simply ignores the former, and works with
>>> the 32-bit aperture solely (which is always there).
>>>
>>> So, for "qemu-system-arm -M virt" compatibility, I think we might
>>> need a separate machine type property, which should default to "on"
>>> only on qemu-system-aarch64 (if such distinctions are allowed).
>>>
>>> Of course, I can't tell if the 32-bit ArmVirtQemu firmware is
>>> possible to run on "qemu-system-aarch64 -M virt". (I think it is; I
>>> recall something something about ARMv8 having ARMv7 compat, but I
>>> don't remember ever trying.) If that's the case, then even the above
>>> suggestion won't work, because it would break 32-bit guest fw that
>>> the user has run (for whatever reason) on "qemu-system-aarch64 -M
>>> virt". In this case, I believe we can't just change the contents of
>>> the current "pci-host-ecam-generic" node, but we should implement
>>> some structural DTB addition that old firmware will simply not
>>> notice, while new (64-bit) firmware will specifically look for (and
>>> prefer over the old DT stuff).
>>>
>>> Ard, what's your take? (Sorry if you've already followed up, my email
>>> processing lags.)
>>>
>>
>> Do we have any examples of ACPI platforms where the config space is
>> mapped above 4 GB? I'd like to make sure that all existing code copes
>> with that before even considering it.
>
> Well, we could consider this virtual machine feature a way to root out
> any 64-bit bugs that lurk in code that consumes ECAM :) That would help
> physical platforms. It means that we shouldn't enable the feature by
> default, in 2.13 at least.
>
> Anyway, I've just checked my oldie A3 Mustang for this (it uses UEFI and
> ACPI), and surprisingly, it does put the ECAM range above 4GB:
>
> [    0.000000] ACPI: MCFG 0x00000043FA690000 00003C (v01 APM    XGENE    00000002 INTL 20140724)
> [    0.088654] ACPI: MCFG table detected, 1 entries
> [    0.126613] acpi PNP0A08:00: MCFG quirk: ECAM at [mem 0xe0d0000000-0xe0dfffffff] for [bus 00-ff] with xgene_v1_pcie_ecam_ops
> [    0.127552] acpi PNP0A08:00: [Firmware Bug]: ECAM area [mem 0xe0d0000000-0xe0dfffffff] not reserved in ACPI namespace
> [    0.127601] acpi PNP0A08:00: ECAM at [mem 0xe0d0000000-0xe0dfffffff] for [bus 00-ff]
>
> The base address is 899 GB + 256 MB.
>
> My kernel is 4.11.0-44.6.1.el7a.aarch64.
>

Interesting. So Linux deals with that fine. How about the missing
PNP0C02 device:

Device (RES0)
{
   Name (_CID, "PNP0C02")
   Name (_CRS, ResourceTemplate () {
     Memory32Fixed (ReadWrite, 0x... , 0x1000000)
   })
}

Anyone care to venture a guess how one expresses this, given that
Memory64Fixed does not appear to exist?

(Perhaps our QEMU code only needs a minor tweak here, but I honestly don't know)
