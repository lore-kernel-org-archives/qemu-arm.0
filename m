Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4151075lff;
        Mon, 13 Jan 2020 05:52:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqxVPxJ1QiDAdZtSyDg6asjE0nOWGOI2naDwLBMYCJdTLczbg4OqbloA1lD9iFeIcEBxqOG1
X-Received: by 2002:aa7:cf81:: with SMTP id z1mr17314316edx.157.1578923530934;
        Mon, 13 Jan 2020 05:52:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578923530; cv=none;
        d=google.com; s=arc-20160816;
        b=mdKxNayDyGU03BBb0qNqT/eZ0CbcdRrpLZkfpYHKslU6knTBslcBxiLfUfIYiJyc8T
         FN8WcR4DoS/ExNfL3NLgLQvL09oNZ2VC3Mfwahdq5DiJt9XwGx37E+c1zW/3MRyQwske
         Ojtw1cv1YZTvPURsuhpjTl6yCr7Nw72fNi0gbo8oW3fWuSHARY2Aqda5zUJEWeAaguI7
         Bfn5Ca1opJNW+z2ss+y72YFNoD7QUCRSJbbMugouP2nBzUEyHX+xuxiBinIhVmuuiN4V
         8Qz6jh0In9RndLQ4QKjHxTpL6UgMEuWtlvQGNrCIpSDamzEK85mBrNgAbDjiCaYmfxbd
         gcYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=QKWrZYleSpPbUqphBE/CvQjtT991xYaEo3+lzuwI3gc=;
        b=ggewNr9m9STk0S+KoTpsHmzCakgJS42bna6F9ZZzmBr5m5eRlvl8iBnnFtO/qICa+B
         xPH2IFx9o00/Gf9E2yRoNIurQZ2fn90SdyVSQBuw3eu4o3Cap7mWLt4gX1/jCYSb8TwD
         doxntAHU3CUqGo/iyEswQZNTUxqID+yKABJjKTT3vAJ+lUL5+xSMJa+qJWfv/dgGG+WS
         9OajfTra0w75vD38Rp7Z/McU7Uyd+PD1n2MkcmS+nPtrSFaxQgYstgYqrSssSVQ6qBR4
         19ov8EpK0vCQ1eZaSkd2SJVvz9FXgwUixcsadac2Ogwth4aebfO3EIJ1pYNfA64USvIv
         OR3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fFJuLMBw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4si7221281edd.147.2020.01.13.05.52.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jan 2020 05:52:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fFJuLMBw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ir08X-0004Us-PN
	for alex.bennee@linaro.org; Mon, 13 Jan 2020 08:52:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54764)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1ir06u-00036f-05
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 08:50:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1ir06r-0006w1-Tf
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 08:50:27 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:43647
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1ir06r-0006vD-Nq
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 08:50:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578923425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QKWrZYleSpPbUqphBE/CvQjtT991xYaEo3+lzuwI3gc=;
 b=fFJuLMBwGN+m95rFrba8UdLUernUomja08YZsOU8s26aKNNyZ7J1DDU6i6ls4B9qq7QdE9
 uFuX5WujSVhz4nbKFBONhPcOwbXFdEa98nJ6yXyF95x/c34SRV11omt/eITGoKVrdNIYMl
 VZYB6HjVZim8EYgvgbEe3Ei9x4BUa/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-Zex7t8eCO1KlMWYHDueeAw-1; Mon, 13 Jan 2020 08:50:23 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0CE0100550E;
 Mon, 13 Jan 2020 13:50:20 +0000 (UTC)
Received: from [10.36.117.108] (ovpn-117-108.ams2.redhat.com [10.36.117.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CBBCC5DA70;
 Mon, 13 Jan 2020 13:50:11 +0000 (UTC)
Subject: Re: [PULL 00/28] Migration pull patches
To: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>
References: <20200110173215.3865-1-quintela@redhat.com>
 <CAFEAcA97ZqynDV6b6YUL_7iF=zsmB2Mwogi0k4ViAUAFTwsTnA@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <c4c373b7-ba6b-b81c-0f3b-163047c4e52f@redhat.com>
Date: Mon, 13 Jan 2020 14:50:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA97ZqynDV6b6YUL_7iF=zsmB2Mwogi0k4ViAUAFTwsTnA@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: Zex7t8eCO1KlMWYHDueeAw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2GyvLndrHVnm

Hi Juan, Peter,

On 1/13/20 2:05 PM, Peter Maydell wrote:
> On Fri, 10 Jan 2020 at 17:32, Juan Quintela <quintela@redhat.com> wrote:
>>
>> The following changes since commit f38a71b01f839c7b65ea73ddd507903cb9489ed6:
>>
>>   Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-and-semihosting-090120-2' into staging (2020-01-10 13:19:34 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/juanquintela/qemu.git tags/migration-pull-pull-request
>>
>> for you to fetch changes up to cc708d2411d3ed2ab4a428c996b778c7c7a47a04:
>>
>>   apic: Use 32bit APIC ID for migration instance ID (2020-01-10 18:19:18 +0100)
>>
>> ----------------------------------------------------------------
>> Migration pull request
>>
>> - several multifd mixes (jiahui, me)
>> - rate limit host pages (david)
>> - remove unneeded labels (daniel)
>> - several multifd fixes (wei)
>> - improve handler insert (scott)
>> - qlist migration (eric)
>> - power fixes (laurent)
>> - migration improvemests (yury)
>> - lots of fixes (wei)
> 
> Hi. This causes a new compile warning for the netbsd VM:
> 
> In file included from
> /home/qemu/qemu-test.tqjNTZ/src/include/hw/qdev-core.h:4:0,
>                  from
> /home/qemu/qemu-test.tqjNTZ/src/tests/../migration/migration.h:18,
>                  from /home/qemu/qemu-test.tqjNTZ/src/tests/test-vmstate.c:27:
> /home/qemu/qemu-test.tqjNTZ/src/tests/test-vmstate.c: In function
> 'manipulate_container':
> /home/qemu/qemu-test.tqjNTZ/src/include/qemu/queue.h:130:34: warning:
> 'prev' may be used uninitialized in this function
> [-Wmaybe-uninitialized]
>          (listelm)->field.le_prev = &(elm)->field.le_next;               \
>                                   ^
> /home/qemu/qemu-test.tqjNTZ/src/tests/test-vmstate.c:1337:24: note:
> 'prev' was declared here
>       TestQListElement *prev, *iter = QLIST_FIRST(&c->list);>                         ^
I just sent "[PATCH v7] migration: Support QLIST migration"
It should fix that warning.

Sorry for the inconvenience.

Thanks

Eric
> 
> 
> I also saw this on aarch32 host (more precisely, on the
> aarch32-environment-in-aarch64-chroot setup I use for aarch32 build
> and test):
> 
> malloc_consolidate(): invalid chunk size
> Broken pipe
> qemu-system-i386: check_section_footer: Read section footer failed: -5
> qemu-system-i386: load of migration failed: Invalid argument
> /home/peter.maydell/qemu/tests/libqtest.c:140: kill_qemu() tried to
> terminate QEMU process but encountered exit status 1 (expected 0)
> Aborted
> ERROR - too few tests run (expected 14, got 13)
> 
> The memory corruption is reproducible running just the
> /x86_64/migration/multifd/tcp subtest:
> 
> (armhf)pmaydell@mustang-maydell:~/qemu/build/all-a32$
> QTEST_QEMU_BINARY=x86_64-softmmu/qemu-system-x86_64
> tests/migration-test -p /x86_64/migration/multifd/tcp
> /x86_64/migration/multifd/tcp: qemu-system-x86_64: -accel kvm: invalid
> accelerator kvm
> qemu-system-x86_64: falling back to tcg
> qemu-system-x86_64: -accel kvm: invalid accelerator kvm
> qemu-system-x86_64: falling back to tcg
> qemu-system-x86_64: multifd_send_sync_main: multifd_send_pages fail
> qemu-system-x86_64: failed to save SaveStateEntry with id(name): 3(ram)
> double free or corruption (!prev)
> Broken pipe
> qemu-system-x86_64: Unknown combination of migration flags: 0
> qemu-system-x86_64: error while loading state section id 3(ram)
> qemu-system-x86_64: load of migration failed: Invalid argument
> /home/peter.maydell/qemu/tests/libqtest.c:140: kill_qemu() tried to
> terminate QEMU process but encountered exit status 1 (expected 0)
> Aborted
> 
> Here's what a valgrind run in that aarch32 setup produces:
> 
> (armhf)pmaydell@mustang-maydell:~/qemu/build/all-a32$
> QTEST_QEMU_BINARY='valgrind --smc-check=all-non-file
> x86_64-softmmu/qemu-system-x86_64' tests/migration-test -p
> /x86_64/migration/multifd/tcp
> /x86_64/migration/multifd/tcp: ==12102== Memcheck, a memory error detector
> ==12102== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
> ==12102== Using Valgrind-3.13.0 and LibVEX; rerun with -h for copyright info
> ==12102== Command: x86_64-softmmu/qemu-system-x86_64 -qtest
> unix:/tmp/qtest-12100.sock -qtest-log /dev/null -chardev
> socket,path=/tmp/qtest-12100.qmp,id=char0 -mon
> chardev=char0,mode=control -display none -accel kvm -accel tcg -name
> source,debug-threads=on -m 150M -serial
> file:/tmp/migration-test-UlotFX/src_serial -drive
> file=/tmp/migration-test-UlotFX/bootsect,format=raw -accel qtest
> ==12102==
> qemu-system-x86_64: -accel kvm: invalid accelerator kvm
> qemu-system-x86_64: falling back to tcg
> ==12108== Memcheck, a memory error detector
> ==12108== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
> ==12108== Using Valgrind-3.13.0 and LibVEX; rerun with -h for copyright info
> ==12108== Command: x86_64-softmmu/qemu-system-x86_64 -qtest
> unix:/tmp/qtest-12100.sock -qtest-log /dev/null -chardev
> socket,path=/tmp/qtest-12100.qmp,id=char0 -mon
> chardev=char0,mode=control -display none -accel kvm -accel tcg -name
> target,debug-threads=on -m 150M -serial
> file:/tmp/migration-test-UlotFX/dest_serial -incoming defer -drive
> file=/tmp/migration-test-UlotFX/bootsect,format=raw -accel qtest
> ==12108==
> qemu-system-x86_64: -accel kvm: invalid accelerator kvm
> qemu-system-x86_64: falling back to tcg
> ==12102== Thread 22 multifdsend_15:
> ==12102== Syscall param sendmsg(msg.msg_iov[0]) points to uninitialised byte(s)
> ==12102==    at 0x53C7F06: __libc_do_syscall (libc-do-syscall.S:47)
> ==12102==    by 0x53C6FCB: sendmsg (sendmsg.c:28)
> ==12102==    by 0x51B9A9: qio_channel_socket_writev (channel-socket.c:561)
> ==12102==    by 0x519FCD: qio_channel_writev (channel.c:207)
> ==12102==    by 0x519FCD: qio_channel_writev_all (channel.c:171)
> ==12102==    by 0x51A047: qio_channel_write_all (channel.c:257)
> ==12102==    by 0x25CB17: multifd_send_initial_packet (ram.c:714)
> ==12102==    by 0x25CB17: multifd_send_thread (ram.c:1136)
> ==12102==    by 0x557551: qemu_thread_start (qemu-thread-posix.c:519)
> ==12102==    by 0x53BE613: start_thread (pthread_create.c:463)
> ==12102==    by 0x54767FB: ??? (clone.S:73)
> ==12102==  Address 0x262103fd is on thread 22's stack
> ==12102==  in frame #5, created by multifd_send_thread (ram.c:1127)
> ==12102==
> ==12102== Thread 6 multifdsend_1:
> ==12102== Invalid write of size 4
> ==12102==    at 0x25CC08: multifd_send_fill_packet (ram.c:806)
> ==12102==    by 0x25CC08: multifd_send_thread (ram.c:1157)
> ==12102==    by 0x557551: qemu_thread_start (qemu-thread-posix.c:519)
> ==12102==    by 0x53BE613: start_thread (pthread_create.c:463)
> ==12102==    by 0x54767FB: ??? (clone.S:73)
> ==12102==  Address 0x1d89c470 is 0 bytes after a block of size 832 alloc'd
> ==12102==    at 0x4841BC4: calloc (vg_replace_malloc.c:711)
> ==12102==    by 0x49EE269: g_malloc0 (in
> /usr/lib/arm-linux-gnueabihf/libglib-2.0.so.0.5600.4)
> ==12102==
> ==12102== Invalid write of size 4
> ==12102==    at 0x25CC0E: multifd_send_fill_packet (ram.c:806)
> ==12102==    by 0x25CC0E: multifd_send_thread (ram.c:1157)
> ==12102==    by 0x557551: qemu_thread_start (qemu-thread-posix.c:519)
> ==12102==    by 0x53BE613: start_thread (pthread_create.c:463)
> ==12102==    by 0x54767FB: ??? (clone.S:73)
> ==12102==  Address 0x1d89c474 is 4 bytes after a block of size 832 alloc'd
> ==12102==    at 0x4841BC4: calloc (vg_replace_malloc.c:711)
> ==12102==    by 0x49EE269: g_malloc0 (in
> /usr/lib/arm-linux-gnueabihf/libglib-2.0.so.0.5600.4)
> ==12102==
> ==12102== Invalid read of size 4
> ==12102==    at 0x519812: qio_channel_writev_full (channel.c:86)
> ==12102==    by 0x519FCD: qio_channel_writev (channel.c:207)
> ==12102==    by 0x519FCD: qio_channel_writev_all (channel.c:171)
> ==12102==    by 0x51A047: qio_channel_write_all (channel.c:257)
> ==12102==    by 0x25CC6D: multifd_send_thread (ram.c:1168)
> ==12102==    by 0x557551: qemu_thread_start (qemu-thread-posix.c:519)
> ==12102==    by 0x53BE613: start_thread (pthread_create.c:463)
> ==12102==    by 0x54767FB: ??? (clone.S:73)
> ==12102==  Address 0x30 is not stack'd, malloc'd or (recently) free'd
> ==12102==
> ==12102==
> ==12102== Process terminating with default action of signal 11 (SIGSEGV)
> ==12102==  Access not within mapped region at address 0x30
> ==12102==    at 0x519812: qio_channel_writev_full (channel.c:86)
> ==12102==    by 0x519FCD: qio_channel_writev (channel.c:207)
> ==12102==    by 0x519FCD: qio_channel_writev_all (channel.c:171)
> ==12102==    by 0x51A047: qio_channel_write_all (channel.c:257)
> ==12102==    by 0x25CC6D: multifd_send_thread (ram.c:1168)
> ==12102==    by 0x557551: qemu_thread_start (qemu-thread-posix.c:519)
> ==12102==    by 0x53BE613: start_thread (pthread_create.c:463)
> ==12102==    by 0x54767FB: ??? (clone.S:73)
> ==12102==  If you believe this happened as a result of a stack
> ==12102==  overflow in your program's main thread (unlikely but
> ==12102==  possible), you can try to increase the size of the
> ==12102==  main thread stack using the --main-stacksize= flag.
> ==12102==  The main thread stack size used in this run was 8388608.
> ==12102==
> ==12102== HEAP SUMMARY:
> ==12102==     in use at exit: 7,159,914 bytes in 28,035 blocks
> ==12102==   total heap usage: 370,889 allocs, 342,854 frees,
> 34,875,720 bytes allocated
> ==12102==
> ==12102== LEAK SUMMARY:
> ==12102==    definitely lost: 56 bytes in 1 blocks
> ==12102==    indirectly lost: 64 bytes in 2 blocks
> ==12102==      possibly lost: 5,916 bytes in 58 blocks
> ==12102==    still reachable: 7,153,878 bytes in 27,974 blocks
> ==12102==                       of which reachable via heuristic:
> ==12102==                         newarray           : 832 bytes in 16 blocks
> ==12102==         suppressed: 0 bytes in 0 blocks
> ==12102== Rerun with --leak-check=full to see details of leaked memory
> ==12102==
> ==12102== For counts of detected and suppressed errors, rerun with: -v
> ==12102== Use --track-origins=yes to see where uninitialised values come from
> ==12102== ERROR SUMMARY: 80 errors from 4 contexts (suppressed: 6 from 3)
> Broken pipe
> qemu-system-x86_64: load of migration failed: Input/output error
> ==12108==
> ==12108== HEAP SUMMARY:
> ==12108==     in use at exit: 6,321,388 bytes in 21,290 blocks
> ==12108==   total heap usage: 59,082 allocs, 37,792 frees, 23,874,965
> bytes allocated
> ==12108==
> ==12108== LEAK SUMMARY:
> ==12108==    definitely lost: 0 bytes in 0 blocks
> ==12108==    indirectly lost: 0 bytes in 0 blocks
> ==12108==      possibly lost: 5,440 bytes in 37 blocks
> ==12108==    still reachable: 6,315,948 bytes in 21,253 blocks
> ==12108==                       of which reachable via heuristic:
> ==12108==                         newarray           : 832 bytes in 16 blocks
> ==12108==         suppressed: 0 bytes in 0 blocks
> ==12108== Rerun with --leak-check=full to see details of leaked memory
> ==12108==
> ==12108== For counts of detected and suppressed errors, rerun with: -v
> ==12108== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 6 from 3)
> /home/peter.maydell/qemu/tests/libqtest.c:140: kill_qemu() tried to
> terminate QEMU process but encountered exit status 1 (expected 0)
> Aborted
> 
> 
> thanks
> -- PMM
> 

