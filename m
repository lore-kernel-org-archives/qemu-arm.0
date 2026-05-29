Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE75FCD6E45
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 09:13:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wStGh-0006jm-8r; Fri, 29 May 2026 05:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wStGg-0006jS-65
 for qemu-arm@nongnu.org; Fri, 29 May 2026 05:12:38 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wStGd-0001ML-42
 for qemu-arm@nongnu.org; Fri, 29 May 2026 05:12:37 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-bdd1986cc86so1131983466b.2
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 02:12:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780045953; cv=none;
 d=google.com; s=arc-20240605;
 b=PaAigrDDYCH+HUffqwZL4aY2ZJHcHvonCYbyn5MzEBfZ+rHtg4p2ciJrsEGG+N6ahV
 6yIEhSBMtFL7+v6TX29Yac1uN9DLqK+5F8COXavW7TSOmQi80c54oTfTgRzHf6Ppwoi8
 U2Uu14g7l+89DP1gDyqujTYB8+7l4ejQFyufRCYm6eI+kFhYzQouP38ODZByBoX1K7E/
 SwE5taU73nOuOULdl07tZyR6k8A6EUVwwirGrOWbGaWqfZV83VlW7SD5J0XwhvzgMlsM
 qvBFPs87hz0ZZVRoDFmRMQBu+HdD1xbI3qxSIyPc1bKFRJNADKuqEwzvsyeyu4NH8WbX
 NGew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=qtCQR2z1HBeGEoJFtbxgUqwRdyhzaoV0GIg+kYKHcUo=;
 fh=x1IbbFfDLdWrDbEa7L5Czpaq6cWFJynR42FCCe2pVKY=;
 b=X/hrNPZN3WUGeVyLcYGrA4Ns0X+TidNNHOt2EErhbru4eFx1lMQkZViw+2FiQc6RNu
 diK926YfaAJ1yIyCUqrcxISLpwp0r9o73XDpRNcWWZtay3Thq6blJhzZ1HBA1vFwTHD1
 2p/zW6dgpvVAREnfH+MG7sc6c3D+1FH+ud8yketGQStzQC0IP3OTv4qp0OHM0CchLIeT
 oUFXaGcMoBi3yqaq1dwMSpPrYhYHcef1ZQIqeG0gBJ3Gld6uOAGvYHQQYjMhNZdZdZB9
 Pr7zawWixJkrk8MFBpDr3wguvgD1ZI45cYflX786nI+ZZJhPIY3iDiXopjHnAJHPw9F5
 AD8g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780045953; x=1780650753; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qtCQR2z1HBeGEoJFtbxgUqwRdyhzaoV0GIg+kYKHcUo=;
 b=f5D7raiEvY6Yeyaw716YmA11upPDJ0X0xlryoDoYSUx8aplwWDL747eZ0OgjO0jHew
 NPJ4O7QKtqKW+NUeLArTstqhM00MDhkvoeBDvSwb63WrtkB4QiVmjte6a2vNk59Aw3PJ
 h75MUQzxgUOzrBFXtYpGOrKZYIb427GVtrseuO3tXmd8LO+7ChHMq2LuBVNh+I+J+FOk
 Y6sg12uxHRMTW5JmNF4AVsSOWZvOpjYilZAeMVLcI4J10eodUooxl5PBhPGlQrq2mfR+
 KSJ72sOmJM2yQW5sjqind+076JmHLOCg7IeoFmvJ1o1bKmdPOC65Lc7hTMGPINaoxRDv
 dJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780045953; x=1780650753;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qtCQR2z1HBeGEoJFtbxgUqwRdyhzaoV0GIg+kYKHcUo=;
 b=jlQFXRCfWkcFWagMS9hFUZC8DjvG3/vXWBx5t2p0ILROmkp+bO0gyGk1MfJt9sM3Io
 oweNk4g2Kr34XtwXm/itDH6rETsS13Ik0iQ3e0v6StfLffKJfiqIoIdTOKDAX/OBj/Vs
 OtHVSNvqM8X9zDyIgpW+8XyfJOuJodio+qF8wWDlVwvFF8jAxzYHoKgGRdRt5AFQaGQ8
 xv+2Of/eZ6uuC4fOtJydFhFdNLRcyeUUNLWURC6kZIaeWJGXZBy9X4igEcA12bFvyht5
 l65N1msPfYrj9bLklqLkjUxo1GEhepB7N5/PSyiWZ/gISw9uTwAu/ldT9H9N6XSVkIGq
 A4/w==
X-Forwarded-Encrypted: i=1;
 AFNElJ9FX1SXV7/+C1oVeGa1yXErDY8hyoDvFHqax1sbYJI2qbCsH6m8BYE34Gg0TlLKk88qOc1uKKUGUQ==@nongnu.org
X-Gm-Message-State: AOJu0YzruhZe73WhK9iN5BKwlx2esrd4rwPF7vq7eamL2c3vSDmX4zSf
 AbdKHR2OKTjys6CosA7vFIBYWhPLfx1tTkCIDtw10d2kLBe3ooxy+YZaCvkpLa/1v3zWbqUFztB
 kVYtif+H7Cz0zrVXzqoAJ/YlYGDtTdIZk86N1rgiNFw==
X-Gm-Gg: Acq92OEbaXh4kv6YPJZSylgssJpmOdLjxzjSnmoIDSMff9QLN6P1m44OBNj3E/ZCSnm
 zDrRCKtUZuFR3ln0Sv0UZuKihKf8Oszp155LvbbTBkx1DO0PJo0UVvXmSjrO6BK2lfjrlvVr1LX
 soMJeVgWHJvdDUJRVuntI2Kv5H+I4z0w8bUSfpeBURdk1J4AJEWiFKaqt33sWfoU7yGaplRVOju
 +QoW+S2TKJi00gKYSxBxNKPXmdGtfoyLjwTSewMm6eFrXgIURZVnyBfArODP9pTEsEQWR508rBu
 r/3IqYT1gSvixSKV7RzuVBiXyLrVmUbkN4OwNiZ8o11fRlSnbPVwHBDgoGnf5OpQFnMTZ1xfERb
 ITw==
X-Received: by 2002:a17:907:a46:b0:bc6:7238:bd57 with SMTP id
 a640c23a62f3a-be9c86942b9mr112136266b.7.1780045949264; Fri, 29 May 2026
 02:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1779986496.git.matyas.bobek@gmail.com>
In-Reply-To: <cover.1779986496.git.matyas.bobek@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 May 2026 10:12:16 +0100
X-Gm-Features: AVHnY4KhEUSk7XrpZ3BKkDvyGLdiZKRjXxpeclgjJkw81EpXUhE9Gbsa7_piOWI
Message-ID: <CAFEAcA-diz0Bh1Ah87MPXxkDcvxF58tACTcxxJw68xtw8pTfLw@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] hw/arm/sabrelite: Add FlexCAN support
To: =?UTF-8?B?TWF0ecOhxaEgQm9iZWs=?= <matyas.bobek@gmail.com>
Cc: qemu-devel@nongnu.org, Matyas Bobek <bobekmat@fel.cvut.cz>, 
 Pavel Pisa <pisa@fel.cvut.cz>, Bernhard Beschow <shentey@gmail.com>,
 qemu-arm@nongnu.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 Oliver Hartkopp <socketcan@hartkopp.net>, 
 Nikita Ostrenkov <n.ostrenkov@gmail.com>, Andrey Volkov <andrey@volkov.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 28 May 2026 at 18:17, Maty=C3=A1=C5=A1 Bobek <matyas.bobek@gmail.co=
m> wrote:
>
> This series adds emulation of the FlexCAN CAN controller, version 2,
> found in NXP i.MX6 series SoCs. The controller is integrated into
> fsl-imx6 and the Sabrelite ARM board.
>
> The chip has two FlexCAN controllers, but the Linux Sabrelite
> device tree enables only one by default. Linux kernel with both
> controllers enabled has been tested to work properly (using a custom
> device tree).
> See docs/system/devices/can.rst for an example of QEMU command line
> invocation.

If I run "make check" under a build with the clang sanitizers
enabled, the test fails with an array out of bounds access:

test:         qtest+qtest-arm - qemu:qtest-arm/flexcan-test
start time:   08:46:34
duration:     3.22s
result:       killed by signal 6 SIGABRT
command:      QTEST_QEMU_STORAGE_DAEMON_BINARY=3D./storage-daemon/qemu-stor=
age-daemon
QTEST_QEMU_VNC_BINARY=3D./tools/qemu-vnc/qemu-vnc MESON_TEST_ITERATION=3D1
MSAN_OPTIONS=3Dhalt_on_error=3D1:abort_on_error=3D1:print_summary=3D1:print=
_stacktrace=3D1
QTEST_QEMU_BINARY=3D./qemu-system-arm RUST_BACKTRACE=3D1
PYTHON=3D/home/pm215/qemu/build/arm-clang/pyvenv/bin/python3
MALLOC_PERTURB_=3D136
UBSAN_OPTIONS=3Dhalt_on_error=3D1:abort_on_error=3D1:print_summary=3D1:prin=
t_stacktrace=3D1
G_TEST_DBUS_DAEMON=3D/home/pm215/qemu/tests/dbus-daemon.sh
QTEST_QEMU_IMG=3D./qemu-img
ASAN_OPTIONS=3Dhalt_on_error=3D1:abort_on_error=3D1:print_summary=3D1
/home/pm215/qemu/build/arm-clang/tests/qtest/flexcan-test --tap -k
----------------------------------- stdout --------------------------------=
---
TAP version 13
# random seed: R02S02bc6ca307d8afe2f7478a86cd8f0c6a
1..5
# Start of arm tests
# Start of net tests
# Start of flexcan tests
# starting QEMU: exec ./qemu-system-arm -qtest
unix:/tmp/qtest-3845367.sock -qtest-log /dev/null -chardev
socket,path=3D/tmp/qtest-3845367.qmp,id=3Dchar0 -mon
chardev=3Dchar0,mode=3Dcontrol -display none -audio none -run-with
exit-with-parent=3Don -nographic -M sabrelite -object can-bus,id=3Dqcan0
-machine canbus0=3Dqcan0 -machine canbus1=3Dqcan0  -accel qtest
ok 1 /arm/net/flexcan/linux_probe
# starting QEMU: exec ./qemu-system-arm -qtest
unix:/tmp/qtest-3845367.sock -qtest-log /dev/null -chardev
socket,path=3D/tmp/qtest-3845367.qmp,id=3Dchar0 -mon
chardev=3Dchar0,mode=3Dcontrol -display none -audio none -run-with
exit-with-parent=3Don -nographic -M sabrelite -object can-bus,id=3Dqcan0
-machine canbus0=3Dqcan0 -machine canbus1=3Dqcan0  -accel qtest
ok 2 /arm/net/flexcan/freeze_disable_interaction
# starting QEMU: exec ./qemu-system-arm -qtest
unix:/tmp/qtest-3845367.sock -qtest-log /dev/null -chardev
socket,path=3D/tmp/qtest-3845367.qmp,id=3Dchar0 -mon
chardev=3Dchar0,mode=3Dcontrol -display none -audio none -run-with
exit-with-parent=3Don -nographic -M sabrelite -object can-bus,id=3Dqcan0
-machine canbus0=3Dqcan0 -machine canbus1=3Dqcan0  -accel qtest
----------------------------------- stderr --------------------------------=
---
../../hw/net/can/flexcan.c:305:24: runtime error: index 80 out of
bounds for type 'FlexcanRegsMessageBuffer[64]' (aka 'struct
FlexcanRegsMessageBuffer[64]')
    #0 0x5b5c6378e3c9 in flexcan_get_last_enabled_mailbox
/home/pm215/qemu/build/arm-clang/../../hw/net/can/flexcan.c:305:24
    #1 0x5b5c6378a9a1 in flexcan_mb_write
/home/pm215/qemu/build/arm-clang/../../hw/net/can/flexcan.c:700:30
    #2 0x5b5c6378a9a1 in flexcan_mem_write
/home/pm215/qemu/build/arm-clang/../../hw/net/can/flexcan.c:1232:17
    #3 0x5b5c63c6de46 in memory_region_write_accessor
/home/pm215/qemu/build/arm-clang/../../system/memory.c:492:5
    #4 0x5b5c63c6d3cd in access_with_adjusted_size
/home/pm215/qemu/build/arm-clang/../../system/memory.c:568:18
    #5 0x5b5c63c6ce92 in memory_region_dispatch_write
/home/pm215/qemu/build/arm-clang/../../system/memory.c
    #6 0x5b5c63ca7008 in flatview_write_continue_step
/home/pm215/qemu/build/arm-clang/../../system/physmem.c:3263:18
    #7 0x5b5c63c9e5b6 in flatview_write_continue
/home/pm215/qemu/build/arm-clang/../../system/physmem.c:3293:19
    #8 0x5b5c63c9e5b6 in flatview_write
/home/pm215/qemu/build/arm-clang/../../system/physmem.c:3324:12
    #9 0x5b5c63c9e4a8 in address_space_write
/home/pm215/qemu/build/arm-clang/../../system/physmem.c:3444:18
    #10 0x5b5c63caf690 in qtest_process_command
/home/pm215/qemu/build/arm-clang/../../system/qtest.c
    #11 0x5b5c63cacb8d in qtest_process_inbuf
/home/pm215/qemu/build/arm-clang/../../system/qtest.c:778:9
    #12 0x5b5c646888b7 in tcp_chr_read
/home/pm215/qemu/build/arm-clang/../../chardev/char-socket.c:511:13
    #13 0x7d3004bd245d
(/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x5d45d) (BuildId:
116e142b9b52c8a4dfd403e759e71ab8f95d8bb3)
    #14 0x7d3004bd26cf in g_main_context_dispatch
(/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x5d6cf) (BuildId:
116e142b9b52c8a4dfd403e759e71ab8f95d8bb3)
    #15 0x5b5c64866a4b in glib_pollfds_poll
/home/pm215/qemu/build/arm-clang/../../util/main-loop.c:290:9
    #16 0x5b5c64866a4b in os_host_main_loop_wait
/home/pm215/qemu/build/arm-clang/../../util/main-loop.c:313:5
    #17 0x5b5c64866a4b in main_loop_wait
/home/pm215/qemu/build/arm-clang/../../util/main-loop.c:592:11
    #18 0x5b5c63cb5cd6 in qemu_main_loop
/home/pm215/qemu/build/arm-clang/../../system/runstate.c:950:9
    #19 0x5b5c647026bb in qemu_default_main
/home/pm215/qemu/build/arm-clang/../../system/main.c:50:14
    #20 0x5b5c64702693 in main
/home/pm215/qemu/build/arm-clang/../../system/main.c:93:9
    #21 0x7d300282a1c9 in __libc_start_call_main
csu/../sysdeps/nptl/libc_start_call_main.h:58:16
    #23 0x5b5c63077684 in _start
(/home/pm215/qemu/build/arm-clang/qemu-system-arm+0x1546684) (BuildId:
46de6576c6cf821195d15a70a05dd4e75e97f22d)

SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior
../../hw/net/can/flexcan.c:305:24
Broken pipe
../../tests/qtest/libqtest.c:210: kill_qemu() detected QEMU death from
signal 6 (Aborted) (core dumped)



You can do a sanitizer enabled build by running configure with options like=
:

'--cc=3Dclang' '--cxx=3Dclang++' '--enable-ubsan'

and then run 'make check' as normal.


You can also do a build with the address sanitizer enabled
as well, but it's a little bit more involved:

'../../configure' '--cc=3Dclang' '--cxx=3Dclang++' '--enable-ubsan'
'--enable-asan'
'--target-list=3Darm-softmmu,arm-linux-user,aarch64-softmmu,aarch64-linux-u=
ser'

For an asan build, you will need to set ASAN_OPTIONS and LSAN_OPTIONSwhen
running make check, like this:

TIMEOUT_MULTIPLIER=3D3 ASAN_OPTIONS=3D"fast_unwind_on_malloc=3D0"
LSAN_OPTIONS=3D"suppressions=3D$PWD/scripts/lsan_suppressions.txt" make -C
build/arm-san/ -j15 check

(Current head-of-git has a leak in the tpm-tis device which is
fixed by this patch:
https://patchew.org/QEMU/20260528093123.55403-1-mbawa@redhat.com/
That should get upstream shortly, but if you don't have it yet
you'll also see leak reports about that.)

thanks
-- PMM

