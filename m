Received: by 10.223.159.82 with SMTP id f18csp328866wrg;
        Wed, 29 Nov 2017 23:24:45 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbR0g1QA+LMlG+6gziUI1vbAQBNBCNDJz1mvfdVrIrVte/Ez1TOQxaN0gg53/RTJLcX0kKV
X-Received: by 10.13.224.69 with SMTP id j66mr882295ywe.430.1512026685341;
        Wed, 29 Nov 2017 23:24:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512026685; cv=none;
        d=google.com; s=arc-20160816;
        b=vRQPENkWb4JXQCKHI6Neq6cOxWfXc62SGI06P9LekioQla5Q9NIjdUhBBr7uumoT9v
         y3cZ2n41hLghTfeiB5y8oInoLWmk1L8+e3IR/7MdjoaWsFNxJF7oQvyptsFEmyFHEuOK
         8Gucd0DbraqwDVcNq9ST9BCG2DaukCJDUtXvKFv32pWOOYAHOI4ltPcfX7sRPahtSZQn
         5aQPr5roJx/Io0T0mFYSJIwot+oqD9oLbAVTFwk+xUwTDDh+jUI1HhHrdEGaDjxGf3KN
         S/AeyXvgnviHGJ9loeyGawyGldCjEzv7vWlSqY7UbLjjQNI2m2A6EYmq9095gY6ppgJw
         xJNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature:arc-authentication-results;
        bh=UEw9JQIxr3+T04omO1aEOjlnP2M+JfM1TY24YVsGRPU=;
        b=ZIGsHvPX9HAKMQulCpGXRBXw4DcR9+zBWmWFoJS0llrEeQnC1I1tVRBglODYjlBnzz
         9rF/KBA3BAHEUqQEEKnIDzTD9W/7nYaiRL6KhQ1LTAD3bXEDhVCMlzPOT2P0xKvF+DrG
         KpriVaxrtuNlaIm4PdValGW/72Lf3RmPjaHKyF2hK4LxGQcMa4qHdG2i4j1fEBKeDnhv
         7KkFWSDPhy6OLEvJvm4PGbfROFsL/Sle/jtEokukj0y75GEHRqO9QRxt4DHCraNArM3c
         bDwnq+SjdLgwwf8xWKD1oYb8dB8kOYrx1Ng/gOJl5N8hJxZn8SlJEwcCs5kb2oxKfovJ
         2DaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PH+5DMlM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x63si704211ybc.770.2017.11.29.23.24.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 29 Nov 2017 23:24:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PH+5DMlM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46646 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eKJDA-0004EP-MP
	for alex.bennee@linaro.org; Thu, 30 Nov 2017 02:24:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1eKGEV-0007id-Q8
	for qemu-arm@nongnu.org; Wed, 29 Nov 2017 23:13:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1eKGET-0008Hx-UW
	for qemu-arm@nongnu.org; Wed, 29 Nov 2017 23:13:55 -0500
Received: from mail-qt0-x236.google.com ([2607:f8b0:400d:c0d::236]:42316)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hongbo.zhang@linaro.org>)
	id 1eKGET-0008Hd-Os
	for qemu-arm@nongnu.org; Wed, 29 Nov 2017 23:13:53 -0500
Received: by mail-qt0-x236.google.com with SMTP id g9so7230774qth.9
	for <qemu-arm@nongnu.org>; Wed, 29 Nov 2017 20:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=UEw9JQIxr3+T04omO1aEOjlnP2M+JfM1TY24YVsGRPU=;
	b=PH+5DMlM0JkhkJ2VsL3FSwAhcH/+HDS1lWhhlLNyqETLSnH4nt3M/cM2ZydmckL7qQ
	1tO0X+VvHpH+frSguuqRpG87qshIUUM0hB0ziplVxD/1PaHSr/Ct4Eh1Peh2POiMz255
	+RCx6a/lFrZeoO+OOigzPpLhpdFR9gFwOgV2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=UEw9JQIxr3+T04omO1aEOjlnP2M+JfM1TY24YVsGRPU=;
	b=gPbWVZ5xHgvgs/GrzEJcyZXgJd9bo56s2OyNU8Y0bH5g6kdTmHKKwycw88XOZ1pjmT
	0PEKP8xeDOifrwTFVSA3HBCJRjNYiFS0I6p95rOwlEnVIgZqZXtegAPGvD1komFKGwAq
	do/ZIvojK/aTF6zq6CzZPbybR8qS/hY6KkWbDuVD8PCzx3PK3K7Qel/hxooB/iJ1SEXe
	d2o+DN39gnzFyI5s0aEh0ryBGTxwnVzOf/yzUtlFmY3+6S+zVku/l8+sOGTziMr+AWaI
	UWQ/Ti1IEhzbfyYkM7b1Q0wC23QdPvanpYdoF9pfhXx7HlGDjK3fUoWkklrWaBbgQTth
	bYbw==
X-Gm-Message-State: AKGB3mKRR7mw2kkGlUoHH5+jKOWO/O6zKvjYWJQjRNwbwGdPJB5vBzq6
	JEMSkBfA8bQnFa3dzGhDDwNE/0r5CBbYhUwS+ntvRnoodaA=
X-Received: by 10.200.48.251 with SMTP id w56mr1726535qta.214.1512015232946;
	Wed, 29 Nov 2017 20:13:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.134 with HTTP; Wed, 29 Nov 2017 20:13:52 -0800 (PST)
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Thu, 30 Nov 2017 12:13:52 +0800
Message-ID: <CAHmQWvB-UdqvtScCboGXVjUuNvbstCKt_E3XtnAhQ1_vyt43Ow@mail.gmail.com>
To: peter.maydell@linaro.org, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="001a113fe0e4daeadc055f2b7a65"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::236
X-Mailman-Approved-At: Thu, 30 Nov 2017 02:24:31 -0500
Subject: [Qemu-arm] [Question] c79c0a3 target/arm: Implement new
 do_transaction_failed hook
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lQ8yquSispqI

--001a113fe0e4daeadc055f2b7a65
Content-Type: text/plain; charset="UTF-8"

Hi Peter,
I am doing this:
https://github.com/ARM-software/arm-trusted-firmware/blob/master/docs/plat/qemu.rst
Loading ATF in QEMU, and ATF loads UEFI, and then kernel is loaded.
(Difference from the page is I build my own debug version of QEMU_EFI.fd
which has more print logs, instead of using the available one linked in the
page)

Command is:
qemu-system-aarch64 -machine virt,secure=on,virtualization=on -cpu
cortex-a57  -m 1024  -d unimp -semihosting-config enable,target=native
-serial stdio -bios bl1.bin -kernel Image

Now I can use it to load ATF, UEFI and kernel by older QEMU, but cannot do
it with latest QEMU,  e.g. ATF and UEFI can run, but kernel loading fails.
Git bisect shows the bad commit is: c79c0a3 target/arm: Implement new
do_transaction_failed hook.

So Peter, could you please help to analyze it?
Thanks.



Appending fail and success logs for reference, only tail of UEFI log and
head of kernel log(if success) are showed here:

---------- success -----------
[......snip......]
 BlockSize : 262144
 LastBlock : FF
InstallProtocolInterface: CE345171-BA0B-11D2-8E4F-00A0C969723B 7AB9E420
InstallProtocolInterface: CE345171-BA0B-11D2-8E4F-00A0C969723B 7AB9DC20
 BlockSize : 262144
 LastBlock : FF
InstallProtocolInterface: FA920010-6785-4941-B6EC-498C579F160A 7AB966A0
InstallProtocolInterface: A19832B9-AC25-11D3-9A2D-0090273FC14D 7AB951A8
InstallProtocolInterface: 09576E91-6D3F-11D2-8E39-00A0C969723B 7AB95A18
[......snip......]
InstallProtocolInterface: 65530BC7-A359-410F-B010-5AADC7EC2B62 799CE438
InstallProtocolInterface: 41D94CD2-35B6-455A-8258-D4E51334AADD 799CC0A0
InstallProtocolInterface: 4579B72D-7EC4-4DD4-8486-083C86B182A7 799CD030
FetchBlob: loading 16310784 bytes for "kernel"
FetchBlob: loading 1 bytes for "cmdline"
InstallProtocolInterface: 09576E91-6D3F-11D2-8E39-00A0C969723B 7BD0F4E8
InstallProtocolInterface: 964E5B22-6459-11D2-8E39-00A0C969723B 7BD0F578
[Security] 3rd party image[0] can be loaded after EndOfDxe:
VenHw(B0FAE7E7-6B07-49D0-9E5B-3BDEC83B039D)/kernel.
InstallProtocolInterface: 5B1B31A1-9562-11D2-8E3F-00A0C969723B 7AB9D040
Loading driver at 0x00075628000 EntryPoint=0x0007638C4CC
Loading driver at 0x00075628000 EntryPoint=0x0007638C4CC
InstallProtocolInterface: BC62157E-3E33-4FEC-9920-2D3B36D750DF 799C9118
ProtectUefiImageCommon - 0x7AB9D040
  - 0x0000000075628000 - 0x0000000000FFA000
SetUefiImageMemoryAttributes - 0x0000000075628000 - 0x0000000000001000
(0x0000000000004008)
SetUefiImageMemoryAttributes - 0x0000000075629000 - 0x0000000000DE3000
(0x0000000000020008)
SetUefiImageMemoryAttributes - 0x000000007640C000 - 0x0000000000216000
(0x0000000000004008)
[Bds]Stop Hotkey Service!
[Bds]UnregisterKeyNotify: 000C/0000 Success
[Bds]UnregisterKeyNotify: 0017/0000 Success
[Bds]UnregisterKeyNotify: 0000/000D Success
EFI stub: Booting Linux Kernel...
EFI stub: Generating empty DTB
EFI stub: Exiting boot services and installing virtual address map...
SetUefiImageMemoryAttributes - 0x000000007BE60000 - 0x0000000000040000
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x0000000078AF0000 - 0x0000000000040000
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x0000000078A40000 - 0x0000000000050000
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x0000000078950000 - 0x0000000000040000
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x00000000788B0000 - 0x0000000000040000
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x0000000078810000 - 0x0000000000040000
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x0000000078770000 - 0x0000000000040000
(0x0000000000000008)
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.14.0-00005-g516fb7f (hongbo@mycomputer) (gcc
version 6.2.1 20161016 (Linaro GCC 6.2-2016.11)) #1 SMP PREEMPT Mon Nov 13
15:40:56 CST 2017
[    0.000000] Boot CPU: AArch64 Processor [411fd070]
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: EFI v2.60 by EDK II
[    0.000000] efi:  SMBIOS=0x78710000  SMBIOS 3.0=0x786f0000
ACPI=0x786d0000  ACPI 2.0=0x786d0014  MEMATTR=0x799c4018
[    0.000000] cma: Reserved 16 MiB at 0x000000007f000000
[    0.000000] ACPI: Early table checksum verification disabled


---------- failed -----------
[......snip......]
 BlockSize : 262144
 LastBlock : FF

Synchronous Exception at 0x0000000078B051A0
PC 0x000078B051A0 (0x000078AF0000+0x000151A0) [ 0] ArmVeNorFlashDxe.dll
PC 0x000078B05160 (0x000078AF0000+0x00015160) [ 0] ArmVeNorFlashDxe.dll
PC 0x000078B01CF8 (0x000078AF0000+0x00011CF8) [ 0] ArmVeNorFlashDxe.dll
PC 0x000078B024C4 (0x000078AF0000+0x000124C4) [ 0] ArmVeNorFlashDxe.dll
PC 0x00007BBA21CC (0x00007BB9E000+0x000041CC) [ 1] PartitionDxe.dll
PC 0x00007BB9FA30 (0x00007BB9E000+0x00001A30) [ 1] PartitionDxe.dll
PC 0x00007EEE2A0C (0x00007EED4000+0x0000EA0C) [ 2] DxeCore.dll
PC 0x00007EEE1DD8 (0x00007EED4000+0x0000DDD8) [ 2] DxeCore.dll
PC 0x00007BCF0878 (0x00007BCE0000+0x00010878) [ 3] BdsDxe.dll
PC 0x00007BCF08E8 (0x00007BCE0000+0x000108E8) [ 3] BdsDxe.dll
PC 0x00007BCFF684 (0x00007BCE0000+0x0001F684) [ 3] BdsDxe.dll
PC 0x00007BCE30F0 (0x00007BCE0000+0x000030F0) [ 3] BdsDxe.dll
PC 0x00007EED685C (0x00007EED4000+0x0000285C) [ 4] DxeCore.dll
PC 0x00007EED57DC (0x00007EED4000+0x000017DC) [ 4] DxeCore.dll
PC 0x00007EED5024 (0x00007EED4000+0x00001024) [ 4] DxeCore.dll
PC 0x00006000EA3C
PC 0x00006000EC20
PC 0x0000600087EC
PC 0x0000600088C4
PC 0x000060008230
PC 0x580B0A42580B0A21

Recursive exception occurred while dumping the CPU state

--001a113fe0e4daeadc055f2b7a65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Peter,<div>I am doing this:</div><div><a href=3D"https:=
//github.com/ARM-software/arm-trusted-firmware/blob/master/docs/plat/qemu.r=
st">https://github.com/ARM-software/arm-trusted-firmware/blob/master/docs/p=
lat/qemu.rst</a></div><div>Loading ATF in QEMU, and ATF loads UEFI, and the=
n kernel is loaded.</div><div>(Difference from the page is I build my own d=
ebug version of QEMU_EFI.fd which has more print logs, instead of using the=
 available one linked in the page)</div><div><br></div><div>Command is:</di=
v><div>qemu-system-aarch64 -machine virt,secure=3Don,virtualization=3Don -c=
pu cortex-a57=C2=A0 -m 1024=C2=A0 -d unimp -semihosting-config enable,targe=
t=3Dnative -serial stdio -bios bl1.bin -kernel Image<br></div><div><br></di=
v><div>Now I can use it to load ATF, UEFI and kernel by older QEMU, but can=
not do it with latest QEMU,=C2=A0 e.g. ATF and UEFI can run, but kernel loa=
ding fails. Git bisect shows the bad commit is:=C2=A0c79c0a3 target/arm: Im=
plement new do_transaction_failed hook.</div><div><br></div><div>So Peter, =
could you please help to analyze it?</div><div>Thanks.</div><div><br></div>=
<div><br></div><div><br></div><div>Appending fail and success logs for refe=
rence, only tail of UEFI log and head of kernel log(if success) are showed =
here:</div><div><br></div><div>---------- success -----------</div><div>[..=
....snip......]</div><div><div>=C2=A0BlockSize : 262144=C2=A0</div><div>=C2=
=A0LastBlock : FF=C2=A0</div><div>InstallProtocolInterface: CE345171-BA0B-1=
1D2-8E4F-00A0C969723B 7AB9E420</div><div>InstallProtocolInterface: CE345171=
-BA0B-11D2-8E4F-00A0C969723B 7AB9DC20</div><div>=C2=A0BlockSize : 262144=C2=
=A0</div><div>=C2=A0LastBlock : FF=C2=A0</div><div>InstallProtocolInterface=
: FA920010-6785-4941-B6EC-498C579F160A 7AB966A0</div><div>InstallProtocolIn=
terface: A19832B9-AC25-11D3-9A2D-0090273FC14D 7AB951A8</div><div>InstallPro=
tocolInterface: 09576E91-6D3F-11D2-8E39-00A0C969723B 7AB95A18</div><div>[..=
....snip......]</div><div>InstallProtocolInterface: 65530BC7-A359-410F-B010=
-5AADC7EC2B62 799CE438</div><div>InstallProtocolInterface: 41D94CD2-35B6-45=
5A-8258-D4E51334AADD 799CC0A0</div><div>InstallProtocolInterface: 4579B72D-=
7EC4-4DD4-8486-083C86B182A7 799CD030</div><div>FetchBlob: loading 16310784 =
bytes for &quot;kernel&quot;</div><div>FetchBlob: loading 1 bytes for &quot=
;cmdline&quot;</div><div>InstallProtocolInterface: 09576E91-6D3F-11D2-8E39-=
00A0C969723B 7BD0F4E8</div><div>InstallProtocolInterface: 964E5B22-6459-11D=
2-8E39-00A0C969723B 7BD0F578</div><div>[Security] 3rd party image[0] can be=
 loaded after EndOfDxe: VenHw(B0FAE7E7-6B07-49D0-9E5B-3BDEC83B039D)/kernel.=
</div><div>InstallProtocolInterface: 5B1B31A1-9562-11D2-8E3F-00A0C969723B 7=
AB9D040</div><div>Loading driver at 0x00075628000 EntryPoint=3D0x0007638C4C=
C</div><div>Loading driver at 0x00075628000 EntryPoint=3D0x0007638C4CC=C2=
=A0</div><div>InstallProtocolInterface: BC62157E-3E33-4FEC-9920-2D3B36D750D=
F 799C9118</div><div>ProtectUefiImageCommon - 0x7AB9D040</div><div>=C2=A0 -=
 0x0000000075628000 - 0x0000000000FFA000</div><div>SetUefiImageMemoryAttrib=
utes - 0x0000000075628000 - 0x0000000000001000 (0x0000000000004008)</div><d=
iv>SetUefiImageMemoryAttributes - 0x0000000075629000 - 0x0000000000DE3000 (=
0x0000000000020008)</div><div>SetUefiImageMemoryAttributes - 0x000000007640=
C000 - 0x0000000000216000 (0x0000000000004008)</div><div>[Bds]Stop Hotkey S=
ervice!</div><div>[Bds]UnregisterKeyNotify: 000C/0000 Success</div><div>[Bd=
s]UnregisterKeyNotify: 0017/0000 Success</div><div>[Bds]UnregisterKeyNotify=
: 0000/000D Success</div><div>EFI stub: Booting Linux Kernel...</div><div>E=
FI stub: Generating empty DTB</div><div>EFI stub: Exiting boot services and=
 installing virtual address map...</div><div>SetUefiImageMemoryAttributes -=
 0x000000007BE60000 - 0x0000000000040000 (0x0000000000000008)</div><div>Set=
UefiImageMemoryAttributes - 0x0000000078AF0000 - 0x0000000000040000 (0x0000=
000000000008)</div><div>SetUefiImageMemoryAttributes - 0x0000000078A40000 -=
 0x0000000000050000 (0x0000000000000008)</div><div>SetUefiImageMemoryAttrib=
utes - 0x0000000078950000 - 0x0000000000040000 (0x0000000000000008)</div><d=
iv>SetUefiImageMemoryAttributes - 0x00000000788B0000 - 0x0000000000040000 (=
0x0000000000000008)</div><div>SetUefiImageMemoryAttributes - 0x000000007881=
0000 - 0x0000000000040000 (0x0000000000000008)</div><div>SetUefiImageMemory=
Attributes - 0x0000000078770000 - 0x0000000000040000 (0x0000000000000008)</=
div><div>[=C2=A0 =C2=A0 0.000000] Booting Linux on physical CPU 0x0</div><d=
iv>[=C2=A0 =C2=A0 0.000000] Linux version 4.14.0-00005-g516fb7f (hongbo@myc=
omputer) (gcc version 6.2.1 20161016 (Linaro GCC 6.2-2016.11)) #1 SMP PREEM=
PT Mon Nov 13 15:40:56 CST 2017</div><div>[=C2=A0 =C2=A0 0.000000] Boot CPU=
: AArch64 Processor [411fd070]</div><div>[=C2=A0 =C2=A0 0.000000] efi: Gett=
ing EFI parameters from FDT:</div><div>[=C2=A0 =C2=A0 0.000000] efi: EFI v2=
.60 by EDK II</div><div>[=C2=A0 =C2=A0 0.000000] efi:=C2=A0 SMBIOS=3D0x7871=
0000=C2=A0 SMBIOS 3.0=3D0x786f0000=C2=A0 ACPI=3D0x786d0000=C2=A0 ACPI 2.0=
=3D0x786d0014=C2=A0 MEMATTR=3D0x799c4018=C2=A0</div><div>[=C2=A0 =C2=A0 0.0=
00000] cma: Reserved 16 MiB at 0x000000007f000000</div><div>[=C2=A0 =C2=A0 =
0.000000] ACPI: Early table checksum verification disabled</div></div><div>=
<br></div><div><br></div><div>---------- failed -----------<br></div><div>[=
......snip......]</div><div><div>=C2=A0BlockSize : 262144=C2=A0</div><div>=
=C2=A0LastBlock : FF=C2=A0</div><div><br></div><div>Synchronous Exception a=
t 0x0000000078B051A0<br></div><div>PC 0x000078B051A0 (0x000078AF0000+0x0001=
51A0) [ 0] ArmVeNorFlashDxe.dll</div><div>PC 0x000078B05160 (0x000078AF0000=
+0x00015160) [ 0] ArmVeNorFlashDxe.dll</div><div>PC 0x000078B01CF8 (0x00007=
8AF0000+0x00011CF8) [ 0] ArmVeNorFlashDxe.dll</div><div>PC 0x000078B024C4 (=
0x000078AF0000+0x000124C4) [ 0] ArmVeNorFlashDxe.dll</div><div>PC 0x00007BB=
A21CC (0x00007BB9E000+0x000041CC) [ 1] PartitionDxe.dll</div><div>PC 0x0000=
7BB9FA30 (0x00007BB9E000+0x00001A30) [ 1] PartitionDxe.dll</div><div>PC 0x0=
0007EEE2A0C (0x00007EED4000+0x0000EA0C) [ 2] DxeCore.dll</div><div>PC 0x000=
07EEE1DD8 (0x00007EED4000+0x0000DDD8) [ 2] DxeCore.dll</div><div>PC 0x00007=
BCF0878 (0x00007BCE0000+0x00010878) [ 3] BdsDxe.dll</div><div>PC 0x00007BCF=
08E8 (0x00007BCE0000+0x000108E8) [ 3] BdsDxe.dll</div><div>PC 0x00007BCFF68=
4 (0x00007BCE0000+0x0001F684) [ 3] BdsDxe.dll</div><div>PC 0x00007BCE30F0 (=
0x00007BCE0000+0x000030F0) [ 3] BdsDxe.dll</div><div>PC 0x00007EED685C (0x0=
0007EED4000+0x0000285C) [ 4] DxeCore.dll</div><div>PC 0x00007EED57DC (0x000=
07EED4000+0x000017DC) [ 4] DxeCore.dll</div><div>PC 0x00007EED5024 (0x00007=
EED4000+0x00001024) [ 4] DxeCore.dll</div><div>PC 0x00006000EA3C</div><div>=
PC 0x00006000EC20</div><div>PC 0x0000600087EC</div><div>PC 0x0000600088C4</=
div><div>PC 0x000060008230</div><div>PC 0x580B0A42580B0A21</div><div><br></=
div><div>Recursive exception occurred while dumping the CPU state</div></di=
v></div>

--001a113fe0e4daeadc055f2b7a65--
