Received: by 10.25.159.131 with SMTP id i125csp810047lfe;
        Thu, 8 Dec 2016 03:45:36 -0800 (PST)
X-Received: by 10.200.55.103 with SMTP id p36mr24231916qtb.205.1481197536762;
        Thu, 08 Dec 2016 03:45:36 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id z201si17034034qkz.126.2016.12.08.03.45.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Dec 2016 03:45:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45554 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cEx8q-0002Bl-5Y
	for alex.bennee@linaro.org; Thu, 08 Dec 2016 06:45:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57806)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cEx8l-0002Be-Ml
	for qemu-arm@nongnu.org; Thu, 08 Dec 2016 06:45:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cEx8i-0001ls-Kb
	for qemu-arm@nongnu.org; Thu, 08 Dec 2016 06:45:31 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38044)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1cEx8i-0001lP-C1; Thu, 08 Dec 2016 06:45:28 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 19376C04B30E;
	Thu,  8 Dec 2016 11:45:26 +0000 (UTC)
Received: from [10.36.116.40] (ovpn-116-40.ams2.redhat.com [10.36.116.40])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uB8BjNEd014168
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 8 Dec 2016 06:45:25 -0500
To: James Hanley <jhanley@dgtlrift.com>
References: <CAF++6AOJ_kiPyeCO3WO84d4UTrV9v=iK8CJx72ERJ5N_AKj64g@mail.gmail.com>
	<1dda2994-dc9d-d8f6-fb42-856f2b992484@redhat.com>
	<CAF++6AM+fuzZJy8wjmbF08gUx+dagD6zNmgX1K3LdKLx48qZtA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <359bce2a-1814-d796-8c06-66faca0371ea@redhat.com>
Date: Thu, 8 Dec 2016 12:45:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAF++6AM+fuzZJy8wjmbF08gUx+dagD6zNmgX1K3LdKLx48qZtA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 08 Dec 2016 11:45:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-discuss] Custom board with DTS/DTB
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
Cc: qemu-arm@nongnu.org, qemu-discuss@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fhhGCn/m9Ir2

On 07.12.2016 21:31, James Hanley wrote:
> Seems like I spoke too soon. Removed the DTB option and started down the
> road of building up our board as a test and connect gdb to the target
> with the --gdb option.
> jim@jim-VirtualBox:~/project/test$ gdb
> qemu-build/arm-softmmu/qemu-system-arm
> /tmp/cores/core.qemu-system-arm.3253.jim-VirtualBox.1481140001 
> GNU gdb (Ubuntu 7.11.1-0ubuntu1~16.04) 7.11.1
> Copyright (C) 2016 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later
> <http://gnu.org/licenses/gpl.html>
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
> and "show warranty" for details.
> This GDB was configured as "x86_64-linux-gnu".
> Type "show configuration" for configuration details.
> For bug reporting instructions, please see:
> <http://www.gnu.org/software/gdb/bugs/>.
> Find the GDB manual and other documentation resources online at:
> <http://www.gnu.org/software/gdb/documentation/>.
> For help, type "help".
> Type "apropos word" to search for commands related to "word"...
> Reading symbols from qemu-build/arm-softmmu/qemu-system-arm...done.
> [New LWP 3256]
> [New LWP 3254]
> [New LWP 3253]
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
> Core was generated by `qemu-system-arm -M Boardx24 -m 256 -cpu cortex-m4
> -no-reboot -nographic -S -singl'.
> Program terminated with signal SIGSEGV, Segmentation fault.
> #0  gic_test_pending (cm=<optimized out>, irq=<optimized out>,
> s=<optimized out>)
>     at /home/jim/project/test/qemu/hw/intc/gic_internal.h:90
> 90   if (s->revision == REV_NVIC || s->revision == REV_11MPCORE) {
> [Current thread is 1 (Thread 0x7f9c1758f700 (LWP 3256))]
> (gdb) bt
> #0  gic_test_pending (cm=<optimized out>, irq=<optimized out>,
> s=<optimized out>)
>     at /home/jim/project/test/qemu/hw/intc/gic_internal.h:90
> #1  gic_set_pending_private (s=0x0, cpu=0, irq=6)
>     at /home/jim/project/test/qemu/hw/intc/arm_gic.c:136

Looks like QEMU is crashing because s is NULL ... but the backtrace
below does not really help here anymore. So maybe add some printfs to
see where the s = NULL is coming from?

> #2  0x000056402fabe233 in cpu_handle_exception (ret=<synthetic pointer>,
> cpu=0x56403223c720)
>     at /home/jim/project/test/qemu/cpu-exec.c:442
> #3  cpu_exec (cpu=cpu@entry=0x56403223c720) at
> /home/jim/project/test/qemu/cpu-exec.c:631
> #4  0x000056402fae7b36 in tcg_cpu_exec (cpu=0x56403223c720)
>     at /home/jim/project/test/qemu/cpus.c:1117
> #5  qemu_tcg_cpu_thread_fn (arg=<optimized out>) at
> /home/jim/project/test/qemu/cpus.c:1197
> #6  0x00007f9c2185b6ba in start_thread (arg=0x7f9c1758f700) at
> pthread_create.c:333
> #7  0x00007f9c2159182d in clone () at
> ../sysdeps/unix/sysv/linux/x86_64/clone.S:109
> (gdb) 

 Thomas

