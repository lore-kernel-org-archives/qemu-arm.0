Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4100885lff;
        Mon, 13 Jan 2020 05:05:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqyBprT/kh0l/aTgbLklgpISckEgV5D4oAjiIBP+69BKb5DuaFk8JTbuLjkV1LlY8DHK+LxI
X-Received: by 2002:a50:ec1a:: with SMTP id g26mr16839089edr.164.1578920752179;
        Mon, 13 Jan 2020 05:05:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578920752; cv=none;
        d=google.com; s=arc-20160816;
        b=irspfTGMqi6rEWegUKlcfaX0jTBkhWW301Ck38DDEk9KuTNYrhC6x9tKulcrpjR1lE
         vlxtPNow/Kvc0VzFGV+3Jtusn1EEE+U0GuWH6P5npyoDTUFgoannMjYY0GMSbgw5Rhtg
         MKRgmtXFuvXIt51NWFZjtKzY8WLkS1kncwLh+dbfPHbI6M6mBXQgKWH2JSbONX3gKwJx
         raUT6SfpYd4Ati8rx6V2uVoZhKW3fPnRbfl3akGdJhnG4nNHejNawCa3BRsHeNPHnj3h
         gRcQnRzq8e+8fZAgORCZE5S0VHkNMGEMWQJNIFc0UO274ho2Uy1R1fLEE4v6n7fpgMlz
         Fhjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vKHDTb6O2diewfOEKXpKeyY85QV23wpT+uMQdQmibek=;
        b=chN8m2/TKr6LZpWtiBg8XyRNbdUM8fkEUnHftxVoUFOd2b9hSG9pFH8DfauUdcUCIS
         WLf9WOCdtz4cBOA8LJgSZSBfK8k6SizVwz6SnDQUOk7z6PJ0a56HdafePOvhRK59LOel
         WW0y/ozeFECcYd2+9tFIefQCz7roAf8pmGPyyZKU2IS33vbPj4S/MK9wlofVYNob/Nsk
         ZtA5qTinK9KRrmTJk8tuMlmisH+F5Z4u3vC8Uy5oeCdfyqz4h5DxwEmZp4HkH3zDsxGn
         qbBXZCiPIJTYyP4kEaEf5118BAmTbbxZ17cvyvj6tXlvJfzWUzgF8ebaEdfWqK94hZC8
         eRHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=skW1CBry;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a21si7148426edv.438.2020.01.13.05.05.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jan 2020 05:05:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=skW1CBry;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iqzPj-0002ba-0g
	for alex.bennee@linaro.org; Mon, 13 Jan 2020 08:05:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42892)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iqzPV-0002aP-0t
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 08:05:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iqzPS-0005c6-S7
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 08:05:36 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:40258)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iqzPS-0005b9-Kr
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 08:05:34 -0500
Received: by mail-oi1-x233.google.com with SMTP id c77so8122332oib.7
 for <qemu-arm@nongnu.org>; Mon, 13 Jan 2020 05:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vKHDTb6O2diewfOEKXpKeyY85QV23wpT+uMQdQmibek=;
 b=skW1CBryGHEweoXfy0wF58k+zoscZaTF7ITOQTndA8AdH4evXEqXg2VE5MCJhT3CjR
 ecxWdnwtE/3sEJY30vIDVOT9/TgKSY1RCQupiTY2ZQdtH695I4+PQuzBnldpCokgdoBZ
 uja599V/3IA4U2GolL0IHNSYiWhDR1wTpp4CIf3gSOM0Nif3mck49rRCCSY0uzPlBnvC
 kOggs1fFO8gF64WdDbiwnGgfpGuRD8Fw28cywaPtxxjv4g0JQG03Uoc4FWcF35T3ZrT8
 OGeb8SwXbF2vZGuY9DIzKJXOjExYQB7It5ll8mKyKTmDKmn4copJq38FSYjG6uRVFg8K
 8F4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vKHDTb6O2diewfOEKXpKeyY85QV23wpT+uMQdQmibek=;
 b=O95d1jF2V9rs+oP6LcBq8GdDouFtTidjRdIqSgYcYGnqsU1YADdE25p1huWIvh9gAn
 423oZW3e19GJeAL61mmQEycK6d+MCTGG269AWmgmHyf5JpJ8dfWuznchRsDalH40Uyp0
 J1IXzHn81MOeDg6WfsTj18McsjwUFN+uC3chseHG9u3A5Rg4Tm2ecbgB69Egz00mosEu
 8lx5lptyndUOzRlywcCMMm43NhWrn3EWes6GEE02lqjYFtj1Oj8AD12zjbjXAx3CK8kz
 BgOwf9BIngmAAh/LZdaGmcXfZ44h5IVqQcCtWeFBGIL9yGmoqw6NWZaWhlP+fHDlgjcV
 /n6g==
X-Gm-Message-State: APjAAAUaobJjmR4CZ4tEBqZxcV32eB2UWzuziIurwoA16HMAABm1vO89
 GKjhEKCTCKv2WYlxV8wAuB6CpFHM0FLkoNDSSCyQhA==
X-Received: by 2002:aca:3d7:: with SMTP id 206mr12774707oid.98.1578920733413; 
 Mon, 13 Jan 2020 05:05:33 -0800 (PST)
MIME-Version: 1.0
References: <20200110173215.3865-1-quintela@redhat.com>
In-Reply-To: <20200110173215.3865-1-quintela@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jan 2020 13:05:22 +0000
Message-ID: <CAFEAcA97ZqynDV6b6YUL_7iF=zsmB2Mwogi0k4ViAUAFTwsTnA@mail.gmail.com>
Subject: Re: [PULL 00/28] Migration pull patches
To: Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::233
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DHYeV5CcMuaC

On Fri, 10 Jan 2020 at 17:32, Juan Quintela <quintela@redhat.com> wrote:
>
> The following changes since commit f38a71b01f839c7b65ea73ddd507903cb9489ed6:
>
>   Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-and-semihosting-090120-2' into staging (2020-01-10 13:19:34 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/juanquintela/qemu.git tags/migration-pull-pull-request
>
> for you to fetch changes up to cc708d2411d3ed2ab4a428c996b778c7c7a47a04:
>
>   apic: Use 32bit APIC ID for migration instance ID (2020-01-10 18:19:18 +0100)
>
> ----------------------------------------------------------------
> Migration pull request
>
> - several multifd mixes (jiahui, me)
> - rate limit host pages (david)
> - remove unneeded labels (daniel)
> - several multifd fixes (wei)
> - improve handler insert (scott)
> - qlist migration (eric)
> - power fixes (laurent)
> - migration improvemests (yury)
> - lots of fixes (wei)

Hi. This causes a new compile warning for the netbsd VM:

In file included from
/home/qemu/qemu-test.tqjNTZ/src/include/hw/qdev-core.h:4:0,
                 from
/home/qemu/qemu-test.tqjNTZ/src/tests/../migration/migration.h:18,
                 from /home/qemu/qemu-test.tqjNTZ/src/tests/test-vmstate.c:27:
/home/qemu/qemu-test.tqjNTZ/src/tests/test-vmstate.c: In function
'manipulate_container':
/home/qemu/qemu-test.tqjNTZ/src/include/qemu/queue.h:130:34: warning:
'prev' may be used uninitialized in this function
[-Wmaybe-uninitialized]
         (listelm)->field.le_prev = &(elm)->field.le_next;               \
                                  ^
/home/qemu/qemu-test.tqjNTZ/src/tests/test-vmstate.c:1337:24: note:
'prev' was declared here
      TestQListElement *prev, *iter = QLIST_FIRST(&c->list);
                        ^


I also saw this on aarch32 host (more precisely, on the
aarch32-environment-in-aarch64-chroot setup I use for aarch32 build
and test):

malloc_consolidate(): invalid chunk size
Broken pipe
qemu-system-i386: check_section_footer: Read section footer failed: -5
qemu-system-i386: load of migration failed: Invalid argument
/home/peter.maydell/qemu/tests/libqtest.c:140: kill_qemu() tried to
terminate QEMU process but encountered exit status 1 (expected 0)
Aborted
ERROR - too few tests run (expected 14, got 13)

The memory corruption is reproducible running just the
/x86_64/migration/multifd/tcp subtest:

(armhf)pmaydell@mustang-maydell:~/qemu/build/all-a32$
QTEST_QEMU_BINARY=x86_64-softmmu/qemu-system-x86_64
tests/migration-test -p /x86_64/migration/multifd/tcp
/x86_64/migration/multifd/tcp: qemu-system-x86_64: -accel kvm: invalid
accelerator kvm
qemu-system-x86_64: falling back to tcg
qemu-system-x86_64: -accel kvm: invalid accelerator kvm
qemu-system-x86_64: falling back to tcg
qemu-system-x86_64: multifd_send_sync_main: multifd_send_pages fail
qemu-system-x86_64: failed to save SaveStateEntry with id(name): 3(ram)
double free or corruption (!prev)
Broken pipe
qemu-system-x86_64: Unknown combination of migration flags: 0
qemu-system-x86_64: error while loading state section id 3(ram)
qemu-system-x86_64: load of migration failed: Invalid argument
/home/peter.maydell/qemu/tests/libqtest.c:140: kill_qemu() tried to
terminate QEMU process but encountered exit status 1 (expected 0)
Aborted

Here's what a valgrind run in that aarch32 setup produces:

(armhf)pmaydell@mustang-maydell:~/qemu/build/all-a32$
QTEST_QEMU_BINARY='valgrind --smc-check=all-non-file
x86_64-softmmu/qemu-system-x86_64' tests/migration-test -p
/x86_64/migration/multifd/tcp
/x86_64/migration/multifd/tcp: ==12102== Memcheck, a memory error detector
==12102== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
==12102== Using Valgrind-3.13.0 and LibVEX; rerun with -h for copyright info
==12102== Command: x86_64-softmmu/qemu-system-x86_64 -qtest
unix:/tmp/qtest-12100.sock -qtest-log /dev/null -chardev
socket,path=/tmp/qtest-12100.qmp,id=char0 -mon
chardev=char0,mode=control -display none -accel kvm -accel tcg -name
source,debug-threads=on -m 150M -serial
file:/tmp/migration-test-UlotFX/src_serial -drive
file=/tmp/migration-test-UlotFX/bootsect,format=raw -accel qtest
==12102==
qemu-system-x86_64: -accel kvm: invalid accelerator kvm
qemu-system-x86_64: falling back to tcg
==12108== Memcheck, a memory error detector
==12108== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
==12108== Using Valgrind-3.13.0 and LibVEX; rerun with -h for copyright info
==12108== Command: x86_64-softmmu/qemu-system-x86_64 -qtest
unix:/tmp/qtest-12100.sock -qtest-log /dev/null -chardev
socket,path=/tmp/qtest-12100.qmp,id=char0 -mon
chardev=char0,mode=control -display none -accel kvm -accel tcg -name
target,debug-threads=on -m 150M -serial
file:/tmp/migration-test-UlotFX/dest_serial -incoming defer -drive
file=/tmp/migration-test-UlotFX/bootsect,format=raw -accel qtest
==12108==
qemu-system-x86_64: -accel kvm: invalid accelerator kvm
qemu-system-x86_64: falling back to tcg
==12102== Thread 22 multifdsend_15:
==12102== Syscall param sendmsg(msg.msg_iov[0]) points to uninitialised byte(s)
==12102==    at 0x53C7F06: __libc_do_syscall (libc-do-syscall.S:47)
==12102==    by 0x53C6FCB: sendmsg (sendmsg.c:28)
==12102==    by 0x51B9A9: qio_channel_socket_writev (channel-socket.c:561)
==12102==    by 0x519FCD: qio_channel_writev (channel.c:207)
==12102==    by 0x519FCD: qio_channel_writev_all (channel.c:171)
==12102==    by 0x51A047: qio_channel_write_all (channel.c:257)
==12102==    by 0x25CB17: multifd_send_initial_packet (ram.c:714)
==12102==    by 0x25CB17: multifd_send_thread (ram.c:1136)
==12102==    by 0x557551: qemu_thread_start (qemu-thread-posix.c:519)
==12102==    by 0x53BE613: start_thread (pthread_create.c:463)
==12102==    by 0x54767FB: ??? (clone.S:73)
==12102==  Address 0x262103fd is on thread 22's stack
==12102==  in frame #5, created by multifd_send_thread (ram.c:1127)
==12102==
==12102== Thread 6 multifdsend_1:
==12102== Invalid write of size 4
==12102==    at 0x25CC08: multifd_send_fill_packet (ram.c:806)
==12102==    by 0x25CC08: multifd_send_thread (ram.c:1157)
==12102==    by 0x557551: qemu_thread_start (qemu-thread-posix.c:519)
==12102==    by 0x53BE613: start_thread (pthread_create.c:463)
==12102==    by 0x54767FB: ??? (clone.S:73)
==12102==  Address 0x1d89c470 is 0 bytes after a block of size 832 alloc'd
==12102==    at 0x4841BC4: calloc (vg_replace_malloc.c:711)
==12102==    by 0x49EE269: g_malloc0 (in
/usr/lib/arm-linux-gnueabihf/libglib-2.0.so.0.5600.4)
==12102==
==12102== Invalid write of size 4
==12102==    at 0x25CC0E: multifd_send_fill_packet (ram.c:806)
==12102==    by 0x25CC0E: multifd_send_thread (ram.c:1157)
==12102==    by 0x557551: qemu_thread_start (qemu-thread-posix.c:519)
==12102==    by 0x53BE613: start_thread (pthread_create.c:463)
==12102==    by 0x54767FB: ??? (clone.S:73)
==12102==  Address 0x1d89c474 is 4 bytes after a block of size 832 alloc'd
==12102==    at 0x4841BC4: calloc (vg_replace_malloc.c:711)
==12102==    by 0x49EE269: g_malloc0 (in
/usr/lib/arm-linux-gnueabihf/libglib-2.0.so.0.5600.4)
==12102==
==12102== Invalid read of size 4
==12102==    at 0x519812: qio_channel_writev_full (channel.c:86)
==12102==    by 0x519FCD: qio_channel_writev (channel.c:207)
==12102==    by 0x519FCD: qio_channel_writev_all (channel.c:171)
==12102==    by 0x51A047: qio_channel_write_all (channel.c:257)
==12102==    by 0x25CC6D: multifd_send_thread (ram.c:1168)
==12102==    by 0x557551: qemu_thread_start (qemu-thread-posix.c:519)
==12102==    by 0x53BE613: start_thread (pthread_create.c:463)
==12102==    by 0x54767FB: ??? (clone.S:73)
==12102==  Address 0x30 is not stack'd, malloc'd or (recently) free'd
==12102==
==12102==
==12102== Process terminating with default action of signal 11 (SIGSEGV)
==12102==  Access not within mapped region at address 0x30
==12102==    at 0x519812: qio_channel_writev_full (channel.c:86)
==12102==    by 0x519FCD: qio_channel_writev (channel.c:207)
==12102==    by 0x519FCD: qio_channel_writev_all (channel.c:171)
==12102==    by 0x51A047: qio_channel_write_all (channel.c:257)
==12102==    by 0x25CC6D: multifd_send_thread (ram.c:1168)
==12102==    by 0x557551: qemu_thread_start (qemu-thread-posix.c:519)
==12102==    by 0x53BE613: start_thread (pthread_create.c:463)
==12102==    by 0x54767FB: ??? (clone.S:73)
==12102==  If you believe this happened as a result of a stack
==12102==  overflow in your program's main thread (unlikely but
==12102==  possible), you can try to increase the size of the
==12102==  main thread stack using the --main-stacksize= flag.
==12102==  The main thread stack size used in this run was 8388608.
==12102==
==12102== HEAP SUMMARY:
==12102==     in use at exit: 7,159,914 bytes in 28,035 blocks
==12102==   total heap usage: 370,889 allocs, 342,854 frees,
34,875,720 bytes allocated
==12102==
==12102== LEAK SUMMARY:
==12102==    definitely lost: 56 bytes in 1 blocks
==12102==    indirectly lost: 64 bytes in 2 blocks
==12102==      possibly lost: 5,916 bytes in 58 blocks
==12102==    still reachable: 7,153,878 bytes in 27,974 blocks
==12102==                       of which reachable via heuristic:
==12102==                         newarray           : 832 bytes in 16 blocks
==12102==         suppressed: 0 bytes in 0 blocks
==12102== Rerun with --leak-check=full to see details of leaked memory
==12102==
==12102== For counts of detected and suppressed errors, rerun with: -v
==12102== Use --track-origins=yes to see where uninitialised values come from
==12102== ERROR SUMMARY: 80 errors from 4 contexts (suppressed: 6 from 3)
Broken pipe
qemu-system-x86_64: load of migration failed: Input/output error
==12108==
==12108== HEAP SUMMARY:
==12108==     in use at exit: 6,321,388 bytes in 21,290 blocks
==12108==   total heap usage: 59,082 allocs, 37,792 frees, 23,874,965
bytes allocated
==12108==
==12108== LEAK SUMMARY:
==12108==    definitely lost: 0 bytes in 0 blocks
==12108==    indirectly lost: 0 bytes in 0 blocks
==12108==      possibly lost: 5,440 bytes in 37 blocks
==12108==    still reachable: 6,315,948 bytes in 21,253 blocks
==12108==                       of which reachable via heuristic:
==12108==                         newarray           : 832 bytes in 16 blocks
==12108==         suppressed: 0 bytes in 0 blocks
==12108== Rerun with --leak-check=full to see details of leaked memory
==12108==
==12108== For counts of detected and suppressed errors, rerun with: -v
==12108== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 6 from 3)
/home/peter.maydell/qemu/tests/libqtest.c:140: kill_qemu() tried to
terminate QEMU process but encountered exit status 1 (expected 0)
Aborted


thanks
-- PMM
