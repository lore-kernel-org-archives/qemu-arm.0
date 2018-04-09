Received: by 10.28.71.155 with SMTP id m27csp2338162wmi;
        Mon, 9 Apr 2018 02:36:03 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/89xSzwIBOT4l/Y9kJ5mQkq9bvtH/YC4bb+NpojHQS5sd7peK8AOyHF7LqkY/svf9O+nW+
X-Received: by 10.200.39.181 with SMTP id w50mr53070216qtw.206.1523266563247;
        Mon, 09 Apr 2018 02:36:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523266563; cv=none;
        d=google.com; s=arc-20160816;
        b=1AoYh1TJMBYQWh9iCSnz63gqWchOiux6QUus+PYyIUnS/cOfdHlwG6oE9z1pw4YU7e
         WN7ZlEXBqjd2iHACpICdyFvur77oFzqkWT9y2be2xO08qmlayG1DIvFZSd1oYF9C0oA0
         gi3AQP6LsRs1panyNuse2zHSND1AXk3zkvBWMf3tauIaoeBBBwPLCa5mv1irigC4Z/Vv
         LjRI30lz3e0sNsLOMgoMnI3nqAvM90SgFtbpyt4xoT2XZ636o82OyrQREhKjISGvdYqO
         mv/tTmsjICGzEbc3TbW8DUAlnTgj5jHLkstoNVGN+dPDYiZ1wL/9/Iwm2urWCt1r3kmE
         dCOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature:arc-authentication-results;
        bh=58trLa/bWqjRZVkvrID9w1KbUPGW2OxaCVOn2KqBpck=;
        b=HJL7qWaHCKCphgTyuu+hq9M65pPamcmJT7/CcSJjNDes2MbFsTPp4aEn2yz8IQJpbC
         rATEEl3pMYI75UKckf1DHgBDL2hfwHEfi+gA2j0XoYOntJCAs+OAknahNgVfQmWPVZlT
         l2hHj2JsYYsj+Sr/SgtyfpoaWq+Kmrc5MmU+o2cditVS5/rqrOn5fH8fDKs7IznLWuIL
         qra+2eAYbVGK1rpCsQXx9Yyquo2Is7dT/RrKHe2qPTUPjzig9HL4bWjMQ39hCvShy8nO
         ZlvF7SiLqyml5sQXwZq567SllKjuAZeD4vAAbRU46CiKWLHPwcm5jDm+glvka8Y5oiIc
         Ij1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RlkuOxPS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u16si498954qka.455.2018.04.09.02.36.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Apr 2018 02:36:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RlkuOxPS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51397 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f5TDW-0002dm-Py
	for alex.bennee@linaro.org; Mon, 09 Apr 2018 05:36:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ajaygargnsit@gmail.com>) id 1f5TCT-000231-6R
	for qemu-devel@nongnu.org; Mon, 09 Apr 2018 05:34:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ajaygargnsit@gmail.com>) id 1f5TCR-0006dw-Qs
	for qemu-devel@nongnu.org; Mon, 09 Apr 2018 05:34:57 -0400
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:51742)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ajaygargnsit@gmail.com>)
	id 1f5TCO-0006b9-CD; Mon, 09 Apr 2018 05:34:52 -0400
Received: by mail-wm0-x22e.google.com with SMTP id u189so17548446wmd.1;
	Mon, 09 Apr 2018 02:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=58trLa/bWqjRZVkvrID9w1KbUPGW2OxaCVOn2KqBpck=;
	b=RlkuOxPSXwXxaD9R8BJaKmfzDlak3hWmDN5q9e4/67Iavx4dWRkhPkwm8hdBKpqovO
	/mdit9HwuqK6S4Rmw4CzbjUwbq0FT4wzYg43JXysCmMsZCWs1+Wd/DnCocx+eOJpOeSy
	VeJjfmmWcKh558Ij2D3N45/PuEkR42bEYus+oaX1Xi0D9d254Wb6PykNdjI5YLnaMPU2
	6rW0ksiqNLHeUGhQxIy9Ii5V/vbJsoWhgvppLIrCoU2ip/yCLbNB7Pfxno/bpW1510xl
	5KRZrF0ysK2V457OYVm60GyxrwSXIjXPTsnlsGuVt52nKVF9P71DWtAAW9qgVd4zqd8W
	E3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=58trLa/bWqjRZVkvrID9w1KbUPGW2OxaCVOn2KqBpck=;
	b=S+mB+Nj60gciWNeyXNU2N3Hpj6HxP81oDAJj85G2mW7JWMzxFz/lZEn2LgGnCUQlp4
	OgpG9myD2iQAZZFTdEmb1Izl0OxFOxj+XwIy5cuD50qa1WxhLDB5FUM3XufherPvdgek
	mnca2mWyYOv3VVl3NL1tbvpxIPMa1IT1Gb8G5bTXM64pbiBKsGoVA9ssF4PM1Lsw7CHk
	4h9c8EYoNUb6vgL05ooLbeyNhNR6e3EyxUUixW9k6jWzVXlE5uoj8IeQ6h5AaIzLDgvd
	2M1WKI/nDFQK87AzEuncfN9hWHE+0d4KR5E9zduDdmVI8OrV8TNFHfD+b/clxLPrTOJ5
	aMCg==
X-Gm-Message-State: ALQs6tCwAZIEexDAuveoX42xGSnXpSMRpXe4tlZapwzxI+FqDR4N5MrX
	mR4CoSJKSWhNQgh6kqwQHgPM3lVpICCcf4/9rfx1lQ==
X-Received: by 10.46.158.137 with SMTP id f9mr22739116ljk.113.1523266490644;
	Mon, 09 Apr 2018 02:34:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:1708:0:0:0:0:0 with HTTP;
	Mon, 9 Apr 2018 02:34:50 -0700 (PDT)
From: Ajay Garg <ajaygargnsit@gmail.com>
Date: Mon, 9 Apr 2018 15:04:50 +0530
Message-ID: <CAHP4M8VnuS5KijfVw9eDz41KPwaT4rJ+4VEU==EbBgdwgFKJhA@mail.gmail.com>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org, rumpkernel-users@freelists.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22e
Subject: [Qemu-devel] Crash when running hello-world unikernel for ARM
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aKc0cAaAEWAJ

Hi All.

We did the following :

a)
Cross-compile rumprun for ARM on a linux x86_64 :

ajay@latitude-3480:~/rumprun-arm-hw/rumprun$
CC=arm-linux-gnueabihf-gcc ./build-rr.sh hw

b)
Compile and bake the hello-world binary

ajay@latitude-3480:~/rumprun-arm-hw/rumprun$
arm-rumprun-netbsdelf-eabihf-gcc helloer.c -o helloer
ajay@latitude-3480:~/rumprun-arm-hw/rumprun$ rumprun-bake hw_virtio
helloer.bin helloer

The second step required changing

conf hw_virtio
    create      "virtio targets (e.g. QEMU/KVM)"
    assimilate  _miconf                      \
    _virtio
fnoc

to

conf hw_virtio
    create      "virtio targets (e.g. QEMU/KVM)"
    assimilate  _miconf
fnoc

in /home/ajay/rumprun-arm-hw/rumprun/./rumprun/etc/rumprun-bake.conf

c)
Tried running on x86_64, via qemu, but got the crash :

######################################################################
ajay@latitude-3480:~/rumprun-arm-hw/rumprun$ qemu-system-x86_64
-nographic -kernel helloer.bin
warning: TCG doesn't support requested feature: CPUID.01H:ECX.vmx [bit 5]
qemu: fatal: Trying to execute code outside RAM or ROM at 0x00000000000a01f1

EAX=00000000 EBX=00000000 ECX=00000000 EDX=00000001
ESI=00000000 EDI=00000000 EBP=00000000 ESP=00009fde
EIP=0000fff1 EFL=00000086 [--S--P-] CPL=0 II=0 A20=1 SMM=0 HLT=0
ES =9000 00090000 ffffffff 00cf9300
CS =9020 00090200 0000ffff 00009b00
SS =9000 00090000 0000ffff 00009300
DS =9000 00090000 0000ffff 00009300
FS =9000 00090000 0000ffff 00009300
GS =9000 00090000 0000ffff 00009300
LDT=0000 00000000 0000ffff 00008200
TR =0000 00000000 0000ffff 00008b00
GDT=     000cab0c 00000017
IDT=     00000000 000003ff
CR0=00000010 CR2=00000000 CR3=00000000 CR4=00000000
DR0=0000000000000000 DR1=0000000000000000 DR2=0000000000000000
DR3=0000000000000000
DR6=00000000ffff0ff0 DR7=0000000000000400
CCS=00000044 CCD=000000b4 CCO=SUBB
EFER=0000000000000000
FCW=037f FSW=0000 [ST=0] FTW=00 MXCSR=00001f80
FPR0=0000000000000000 0000 FPR1=0000000000000000 0000
FPR2=0000000000000000 0000 FPR3=0000000000000000 0000
FPR4=0000000000000000 0000 FPR5=0000000000000000 0000
FPR6=0000000000000000 0000 FPR7=0000000000000000 0000
XMM00=00000000000000000000000000000000 XMM01=00000000000000000000000000000000
XMM02=00000000000000000000000000000000 XMM03=00000000000000000000000000000000
XMM04=00000000000000000000000000000000 XMM05=00000000000000000000000000000000
XMM06=00000000000000000000000000000000 XMM07=00000000000000000000000000000000
Aborted (core dumped)
######################################################################


d)
Also find below when tried with gdb :

######################################################################
ajay@latitude-3480:~/rumprun-arm-hw/rumprun$ gdb --args
qemu-system-x86_64 -nographic -nographic -kernel helloer.bin
GNU gdb (Ubuntu 7.11.1-0ubuntu1~16.5) 7.11.1
Copyright (C) 2016 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
<http://www.gnu.org/software/gdb/documentation/>.
For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from qemu-system-x86_64...(no debugging symbols found)...done.
(gdb) r
Starting program: /usr/bin/qemu-system-x86_64 -nographic -nographic
-kernel helloer.bin
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
[New Thread 0x7fffecde1700 (LWP 30356)]
warning: TCG doesn't support requested feature: CPUID.01H:ECX.vmx [bit 5]
[New Thread 0x7fffd1f2f700 (LWP 30357)]
qemu: fatal: Trying to execute code outside RAM or ROM at 0x00000000000a01f1

EAX=00000000 EBX=00000000 ECX=00000000 EDX=00000001
ESI=00000000 EDI=00000000 EBP=00000000 ESP=00009fde
EIP=0000fff1 EFL=00000086 [--S--P-] CPL=0 II=0 A20=1 SMM=0 HLT=0
ES =9000 00090000 ffffffff 00cf9300
CS =9020 00090200 0000ffff 00009b00
SS =9000 00090000 0000ffff 00009300
DS =9000 00090000 0000ffff 00009300
FS =9000 00090000 0000ffff 00009300
GS =9000 00090000 0000ffff 00009300
LDT=0000 00000000 0000ffff 00008200
TR =0000 00000000 0000ffff 00008b00
GDT=     000cab0c 00000017
IDT=     00000000 000003ff
CR0=00000010 CR2=00000000 CR3=00000000 CR4=00000000
DR0=0000000000000000 DR1=0000000000000000 DR2=0000000000000000
DR3=0000000000000000
DR6=00000000ffff0ff0 DR7=0000000000000400
CCS=00000044 CCD=000000b4 CCO=SUBB
EFER=0000000000000000
FCW=037f FSW=0000 [ST=0] FTW=00 MXCSR=00001f80
FPR0=0000000000000000 0000 FPR1=0000000000000000 0000
FPR2=0000000000000000 0000 FPR3=0000000000000000 0000
FPR4=0000000000000000 0000 FPR5=0000000000000000 0000
FPR6=0000000000000000 0000 FPR7=0000000000000000 0000
XMM00=00000000000000000000000000000000 XMM01=00000000000000000000000000000000
XMM02=00000000000000000000000000000000 XMM03=00000000000000000000000000000000
XMM04=00000000000000000000000000000000 XMM05=00000000000000000000000000000000
XMM06=00000000000000000000000000000000 XMM07=00000000000000000000000000000000

Thread 3 "qemu-system-x86" received signal SIGABRT, Aborted.
[Switching to Thread 0x7fffd1f2f700 (LWP 30357)]
0x00007ffff2b74428 in __GI_raise (sig=sig@entry=6) at
../sysdeps/unix/sysv/linux/raise.c:54
54    ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
(gdb) bt
#0  0x00007ffff2b74428 in __GI_raise (sig=sig@entry=6) at
../sysdeps/unix/sysv/linux/raise.c:54
#1  0x00007ffff2b7602a in __GI_abort () at abort.c:89
#2  0x000055555573d33d in cpu_abort ()
#3  0x0000555555781fdd in get_page_addr_code ()
#4  0x0000555555743d63 in ?? ()
#5  0x000055555574485b in cpu_x86_exec ()
#6  0x0000555555765fb2 in ?? ()
#7  0x00007ffff2f106ba in start_thread (arg=0x7fffd1f2f700) at
pthread_create.c:333
#8  0x00007ffff2c4641d in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:109
(gdb)
######################################################################


Where should we be looking to start to fix?



Thanks and Regards,
Ajay
