Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2270107wrt;
        Fri, 23 Nov 2018 08:42:25 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XopBsP7VaKjXVXGRMYXL3vkNnD7RU/tEcM5hJPycmDwECyC5B80GZVJCyXNskTskBN+/5H
X-Received: by 2002:a81:2916:: with SMTP id p22mr13584220ywp.176.1542991345485;
        Fri, 23 Nov 2018 08:42:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542991345; cv=none;
        d=google.com; s=arc-20160816;
        b=LNKXRZRv54o3toQ0ipfUgb5OCjabWMlYRqA3HMt0hQqhcwzC8hiFMfQBomzBkDJMQm
         gGO//ioaisRLH/teuO+QmPbnUbz8HZ8GEGbp9xxAO3JlsCvtnhk2aNA7c4miDxnwDOeJ
         DiXWdt5oTk8KHme26WM6gDlNy3LCudMNNP+Xr7o8m0xbTu9m5CjvwmdfC7bGbjk1wZwk
         hd7vNCSTyahEHts4njKS+DEBPIRt930JdtKIvDqKPVG7XdXkVfaKTIXrmgY9RIspZmJ2
         pG/f51aBDv2NZ09LVgltltMKhB5qY4YWY25cGv4LbphmasQo4xNGmdA1p861/WaLfbAI
         ZWdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=C89qSZmOxWH68BGqLGN0vCimXgyHf7mdNB8tka18RAY=;
        b=iQjK37Lrjgc/N1puVet2NKcrEpNQLnhZm3AHk0imZypvT7iJEJ4Sc549sk5FxT+QSb
         e4teewmCtm2dyevIQE5Oi1GJMIVjc3DMDIaW+M2WeB/6Y+zd1dZIj9pVQ1BIcE4/CSX4
         WdRTWCNN8WIBeuk4tq6+XsHO1YqYk0aSbwswYhzJoeamhBGZZyVLtAqaymtG8rx2oLE8
         DlkttcaxAD7u9BpWSLMPaYFBa/iLtxrLx9LomMyj6yerUi5ePQeUsQfRrxk/bKAsO5Go
         IoOEG2ZFIIde0HoYkqRo4w/9en/nb/cTzwHGe9kgj24ohIfq3FoT/BdCc3ag2tN2Unoj
         HpVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WNG9h+e7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o129si22194405ywo.237.2018.11.23.08.42.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 08:42:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WNG9h+e7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53395 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQEXA-0003Qg-Sb
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 11:42:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gQEWw-0003Oy-NQ
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 11:42:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gQEWq-0008G5-Th
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 11:42:10 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:42538)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gQEWd-00074Z-G0; Fri, 23 Nov 2018 11:41:51 -0500
Received: by mail-lf1-x143.google.com with SMTP id l10so9105613lfh.9;
	Fri, 23 Nov 2018 08:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=C89qSZmOxWH68BGqLGN0vCimXgyHf7mdNB8tka18RAY=;
	b=WNG9h+e75nR1A4UcgLeOmPDLXJTiYY6MxQ7gt6mUbv6CsoZLW0laLRlZ+bUcsejCTI
	ykSQ8kmGpcH6Qls5q6ARHk/fgA4ufHPRJ4ID6/otiDjAXMUDVDAylCE+uvflhqBpJNwl
	nJYFUsfeXa67M3Mlu6bDw9fWE7+BURJ2xpQJbSZlPUnK6D9R4lVtxu5eajNyns6Ju4wI
	pCIfeMWnviXHUv3tn5P9LsD8lX9EFIhsy7vBhqQTUOkJdLkfZMFceTKlHBGPMwIbQS+K
	5nTdfTKvDuq68Gy0yLpqhlXULvDgwJRuqPC3uH8ONDOzAEPguGYxwCKvaPIIej2JUYEF
	K58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=C89qSZmOxWH68BGqLGN0vCimXgyHf7mdNB8tka18RAY=;
	b=ah1bnWuX0hE/XLG/KrpA3OdMYAr1zwlw3Tezxs0/5mvIEwl3Ay9ZEtH3QwKTf6cFdu
	0gnVIcckb8e69ung9KFvvGVP3xB63V6BD9TOQb1KmeYxpQhcUY228Kk814BP5Pm8GS3a
	eMZOudXEjHtwVqs1TU5/AHaVC0wEHMRihlQMKgC063pSSGANm0b4aw8DHIZeZIIyoNts
	9YRJqRiJYtyD/VXv6eefXUHU9XRX7y2VAM7Z03uRVqkX0w85W5Nka84WsnP7kimdCZGi
	0W5WyliBVQ6LNAszqTDIjWWP74fqR1KER0o2ekuNzjt8lkf+s6XmbJu9Uf/DQ2JgEv9G
	6Xaw==
X-Gm-Message-State: AGRZ1gKk6+zBXbzjSVXiMwKk7t5dmaH8598QSwA1Q6xkQX2lfdYTI9qm
	TCh8QDrWZhC11T6ahGBzkSk=
X-Received: by 2002:a19:4e59:: with SMTP id c86mr10215149lfb.132.1542991309044;
	Fri, 23 Nov 2018 08:41:49 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	d24-v6sm3620618ljg.2.2018.11.23.08.41.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 23 Nov 2018 08:41:48 -0800 (PST)
Date: Fri, 23 Nov 2018 17:41:47 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: mbilal <muhammad_bilal@mentor.com>
Message-ID: <20181123164147.GL1148@toto>
References: <e8dae726-8853-4e44-1eb8-b9cfb0bc44f2@mentor.com>
	<CAFEAcA_EM39P8HFoC=B=XP3Ax8NgNSotn=wMJJsG05P8Ywdruw@mail.gmail.com>
	<abd7b108-4d21-9c1c-16d3-6d31d47f74eb@mentor.com>
	<20181123132017.GJ1148@toto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181123132017.GJ1148@toto>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::143
Subject: Re: [Qemu-arm] [Qemu-discuss] How to select specific qemu net 'nic'
 device
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jasowang@redhat.com,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-discuss <qemu-discuss@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: diIVhZNa1Cef

On Fri, Nov 23, 2018 at 02:20:17PM +0100, Edgar E. Iglesias wrote:
> On Fri, Nov 23, 2018 at 02:59:32PM +0500, mbilal wrote:
> > Hi,
> > 
> > Thanks for reply.
> > 
> > According to your suggestion I've tested with 3.1 rc2 release and problem is
> > still exist in this release also.
> > 
> > Here is my reproducible scenario.
> 
> 
> Thanks,
> 
> I've had a look and the assert looks bogus to me.
> We shouldn't be asserting on RX descriptor setups when the receiver is disabled.
> 
> I'll send a patch in a moment.
> 
> Best regards,
> Edgar

+ Jason

Hi,

I've sent a patch to fix te GEM model.
The assert in the GEM model was wrong IMO but I also think the net layer
is behaving a bit suspicious in this case. The qemu_flush_or_purge_queued_packets()
path is delivering queued packets to a net model without checking can_receive().
Without digging too much into the details my gut feeling is that the net layer
shouldn't be doing this. I may be missing something though.

Here's the backtrace:
(gdb) bt
#0  0x00007ffff39e0e97 in raise () from /lib/x86_64-linux-gnu/libc.so.6
#1  0x00007ffff39e2801 in abort () from /lib/x86_64-linux-gnu/libc.so.6
#2  0x00007ffff39d239a in ?? () from /lib/x86_64-linux-gnu/libc.so.6
#3  0x00007ffff39d2412 in __assert_fail () from /lib/x86_64-linux-gnu/libc.so.6
#4  0x0000555555b47de6 in gem_receive (nc=<optimized out>, 
    buf=<optimized out>, size=346)
    at /home/edgar/src/c/qemu/qemu/hw/net/cadence_gem.c:982
#5  0x0000555555bf033d in nc_sendv_compat (flags=<optimized out>, iovcnt=1, 
    iov=0x7fffffffd620, nc=0x555556edd360)
    at /home/edgar/src/c/qemu/qemu/net/net.c:701
#6  qemu_deliver_packet_iov (sender=<optimized out>, flags=<optimized out>, 
    iov=0x7fffffffd620, iovcnt=1, opaque=0x555556edd360)
    at /home/edgar/src/c/qemu/qemu/net/net.c:733
#7  0x0000555555bf2a85 in qemu_net_queue_deliver (size=<optimized out>, 
    data=<optimized out>, flags=<optimized out>, sender=<optimized out>, 
    queue=0x555556edd4e0) at /home/edgar/src/c/qemu/qemu/net/queue.c:164
#8  qemu_net_queue_flush (queue=0x555556edd4e0)
    at /home/edgar/src/c/qemu/qemu/net/queue.c:261
#9  0x0000555555bf0d3c in qemu_flush_or_purge_queued_packets (
    nc=0x555556edd360, purge=<optimized out>)
    at /home/edgar/src/c/qemu/qemu/net/net.c:607
#10 0x0000555555bf0dd9 in net_vm_change_state_handler (opaque=<optimized out>, 
    running=0, state=<optimized out>)
    at /home/edgar/src/c/qemu/qemu/net/net.c:1423
#11 0x0000555555a641c7 in vm_state_notify (running=running@entry=0, 
    state=state@entry=RUN_STATE_SHUTDOWN)
    at /home/edgar/src/c/qemu/qemu/vl.c:1562
#12 0x0000555555889b0a in do_vm_stop (state=RUN_STATE_SHUTDOWN, 
    send_stop=<optimized out>) at /home/edgar/src/c/qemu/qemu/cpus.c:1074
#13 0x0000555555844200 in main (argc=<optimized out>, argv=<optimized out>, 
    envp=<optimized out>) at /home/edgar/src/c/qemu/qemu/vl.c:4648
(gdb) q


Cheers,
Edgar


> 
> 
> 
> > 
> > QEMU launching
> > --------------
> > 
> > ./qemu-system-aarch64 -M xlnx-zcu102 -m 1G -kernel /dev/null -S -s  -net nic
> > -net nic -net nic -net nic -net user,hostfwd=tcp::8080-:8080 -smp 1 -serial
> > stdio -serial /dev/null
> > 
> > gdb session
> > ------------
> > 
> > (gdb) file zcu102_net_uni.out
> > Reading symbols from zcu102_net_uni.out...done.
> > (gdb) tar rem :1234
> > Remote debugging using :1234
> > _ld_text_start () at os/arch/armv8/common/arch_asm.S:381
> > 381	    MOV     X14, X0
> > (gdb) load
> > Loading section .text, size 0x59c0c lma 0x0
> > Loading section .rodata, size 0x2bbc lma 0x59c0c
> > Loading section .rtl.data, size 0x770 lma 0x5c7c8
> > Loading section .data, size 0x4dc lma 0x5cf54
> > Start address 0x0, load size 381972
> > Transfer rate: 23313 KB/sec, 2021 bytes/write.
> > (gdb) c
> > Continuing.
> > ^C
> > 
> > 
> > So any breakpoint or Ctrl-C asserts the QEMU.
> > 
> > qemu-system-aarch64: qemu-3.1.0-rc2/hw/net/cadence_gem.c:982: gem_receive:
> > Assertion `!first_desc' failed.
> > 
> > 
> > Our networking demo application running fine unless you interrupt the GDB
> > (either with breakpoints or interrupt signal).
> > You can see following message on QEMU console which is the indication of
> > demo is fine (it also well tested on actual hardware)
> > 
> > Open the following Nucleus node address in your web browser:
> >     http://127.0.0.1:8080/
> > 
> > 
> > I'm attaching demo application binary.
> > 
> > 
> > 
> > 
> > Thanks for care about this issue,
> > -Bilal
> > 
> > 
> > 
> > On 11/23/2018 01:59 PM, Peter Maydell wrote:
> > > On 23 November 2018 at 04:13, mbilal <muhammad_bilal@mentor.com> wrote:
> > > > Hi,
> > > > 
> > > > I'm using qemu emulation for xilinx zcu102 platform, this board have four
> > > > networking GEM0, GEM1, GEM2 and GEM3 devices.
> > > > 
> > > > To run network demo on this board *only* require GEM3 device to be configure
> > > > while other GEM devices don't need to be configure, that's why u-boot and
> > > > other RTOS only configure GEM3 device.
> > > > 
> > > > 
> > > > QEMU is enabling these GEM devices  with networking '-net nic' option and
> > > > QEMU consider first '-net nic' option for GEM0 and second '-net nic' option
> > > > for GEM1 and so on. that's why if need to enable GEM3 network device we must
> > > > need to give following full command line options
> > > > 
> > > > -net nic -net nic -net nic -net nic -net user, ...
> > > > 
> > > > In this way all four GEM devices would be enable but first three GEM0-GEM2
> > > > devices are un-configured and useless. In our case QEMU is being *crashed*
> > > > due to trying to use these un-configured GEM devices to o send/receive GDB
> > > > breakoint/interrupt cause. IIUC QEMU uses first device in the -nic loop
> > > > i.e
> > > > 
> > > > qemu-system-aarch64: hw/net/cadence_gem.c:921: gem_receive: Assertion
> > > > `!first_desc' failed.
> > > 
> > > If QEMU asserts like this, this is a bug in QEMU. I've cc'd
> > > the maintainers of the Xilinx board.
> > > 
> > > Could you provide a complete set of instructions to reproduce
> > > this bug, please ? (full command line, guest image, etc)
> > > 
> > > Could you also tell us which version of QEMU you are using?
> > > If possible, try with the current git master or
> > > with the 3.1 rc2 release candidate we've just put out, to
> > > see if it's already been fixed.
> > > 
> > > thanks
> > > -- PMM
> > > 
> 
> 
