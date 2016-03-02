Received: by 10.25.208.211 with SMTP id h202csp1982751lfg;
        Tue, 1 Mar 2016 21:31:15 -0800 (PST)
X-Received: by 10.141.2.11 with SMTP id e11mr4347685qhd.69.1456896675227;
        Tue, 01 Mar 2016 21:31:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f125si3560762qkb.95.2016.03.01.21.31.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 21:31:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54194 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aazNS-0000p2-KO
	for alex.bennee@linaro.org; Wed, 02 Mar 2016 00:31:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aazNQ-0000ol-0l
	for qemu-arm@nongnu.org; Wed, 02 Mar 2016 00:31:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aazNO-000864-Hx
	for qemu-arm@nongnu.org; Wed, 02 Mar 2016 00:31:11 -0500
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:35768)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aazNO-00085z-7N; Wed, 02 Mar 2016 00:31:10 -0500
Received: by mail-wm0-x235.google.com with SMTP id l68so68091120wml.0;
	Tue, 01 Mar 2016 21:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=7hnY9/HDgp95ubLPU4vrK6VVPyzB05BY3q9u154Ts5o=;
	b=0KdiVUboiZgHjB+vFxB/5FsBm4S5W3pxts4+dlVTaV/u7aP7wMaJLh+jDOKpfvw7VL
	2/2bmjTLPvBVNnFvlKRdLgKEFcTVdb3V2fo/2VoBMjN1P+0lvAGk1zAGE11wGB7Rs32Y
	LTwCiwXbG2Hl2ysK8W1NShrzSuqxzXC/iGMnxXFVr7zHfEmT9bifSL/Wa1jyToVNyr0s
	QCl9AbPvRjT/2z4EldE8vJHMeMDVddpyI3y5sJkcsxFrP/xcNETN5KXjgX5FnXwcgkcZ
	sdt+fNLT6gIJz7C1gXhU8X4U4/PuFd7m7wXaYigvpDZGD9nUvQ24/etaRXwdK3Mu3e6/
	MlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=7hnY9/HDgp95ubLPU4vrK6VVPyzB05BY3q9u154Ts5o=;
	b=E15QuOs3JrdJCzLnsYBOzpEvMU2Wwycj2L1fAauCx/bUVmtVgmaU8d5OZMIw/K4M5u
	TKAeBq/QHVF/fLKanfQwoFJIP795tp/3jO0/q0Rbr6R89Z/lBy9YorTs8Js/fiLFOAhn
	BYyNyU4WpqNuseavNqVmzEhm9Q0g+JHkd1F4y63Tn0Wy7OIWBaBPFXzBw8q6I3fIs5Y8
	1uF7/72fDbp6WgNlcYt3jXBYgIr2PNZC5dabcAXSB6TFyklnVFFPq+0DBZ6R5K6MZiBe
	IjJ0zHiE+bGPVXAXHRjWQpHrvR85y2CYbvuMjWWBWS8h7/UhlmKZEMSsciY+GKnTHLQ7
	k9AQ==
X-Gm-Message-State: AD7BkJLjF++/PPEJCFCaHID4iyHDU9KcyDDq0qFRMLjVCYi07lcZOtttZ1QUxJDZZ2CBJVWymuEOjOiFWAZugg==
MIME-Version: 1.0
X-Received: by 10.28.184.137 with SMTP id i131mr2320720wmf.96.1456896669113;
	Tue, 01 Mar 2016 21:31:09 -0800 (PST)
Received: by 10.28.157.197 with HTTP; Tue, 1 Mar 2016 21:31:09 -0800 (PST)
In-Reply-To: <BLUPR0301MB20341204399663BD594BA50C9EBB0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<56D52825.1010107@weilnetz.de>
	<CAPokK=oGzBuvSKw7PFiwwzL0m_=bu7haNYqsyL_WV6PP6UfCyQ@mail.gmail.com>
	<BLUPR0301MB20341204399663BD594BA50C9EBB0@BLUPR0301MB2034.namprd03.prod.outlook.com>
Date: Tue, 1 Mar 2016 21:31:09 -0800
Message-ID: <CAPokK=pYRuJ6z9TJ-j8Vfadp_GxchhukZzEDGM_z9En-A-0QSQ@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::235
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 00/17] ARM big-endian and
	setend support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ErpAN3//OfQ1

On Tue, Mar 1, 2016 at 1:34 PM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
>> From: Peter Crosthwaite [mailto:crosthwaitepeter@gmail.com]
>> Sent: Tuesday, 1 March 2016 10:44 AM
>>
>> On Mon, Feb 29, 2016 at 9:27 PM, Stefan Weil <sw@weilnetz.de> wrote:
>> > Am 18.01.2016 um 08:12 schrieb Peter Crosthwaite:
>> >> Hi All,
>> >>
>> >> This patch series adds system-mode big-endian support for ARM. It also
>> >> implements the setend instruction, and loading of BE binaries even in
>> >> LE emulation mode.
>> >>
>> >> Based on Paolo's original work. I have moved all the BE32 related work
>> >> to the back of the series. Multiple parties are interested in the BE8
>> >> work just on its own, so that could potentially be merged w/o BE32.
>> >> PMM requested BE32 be at least thought out architecturally, so this
>> >> series sees BE32 functionality through.
>> >>
>> >> I have tested all of LE. BE8 and BE32 in both linux-user mode (for
>> >> regressions) and system mode (BE8 and BE32 are new here).
>> >> My test application is here, the README gives some example command
>> >> lines you can run:
>> >>
>> >> https://github.com/pcrost/arm-be-test
>> >>
>> >> Regards,
>> >> Peter
>> >
>> > It would be nice to get at least the emulation for 'setend' into the
>> > next version, because it is needed for the Raspberry Pi emulation.
>> >
>>
>> BTW if you can link me binaries and a failing command line for the
>> failing rPI work I can test it, I am currently doing my own standalone
>> tests (of linux user as well).
>
> Download and unzip:
> https://downloads.raspberrypi.org/raspbian_lite_latest
>
> Then, mount the boot partition, and grab a copy of kernel7.img. You should now be able to boot on a current qemu with:
>
> qemu-system-arm -M raspi2 -kernel kernel7.img -sd 2016-02-26-raspbian-jessie-lite.img -append "rw earlyprintk loglevel=8 console=ttyAMA0 root=/dev/mmcblk0p2 rootwait" -serial stdio -d unimp
>
> At present, this fails with:
>
> [   10.535232] VFS: Mounted root (ext4 filesystem) on device 179:2.
> [   10.729685] devtmpfs: mounted
> [   10.805125] Freeing unused kernel memory: 416K (80776000 - 807de000)
> [   17.317286] random: systemd urandom read with 6 bits of entropy available
> arm: unimplemented setend
> [   17.366656] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004
> [   17.366656]
> [   17.384625] CPU: 0 PID: 1 Comm: systemd Not tainted 4.1.7-v7+ #817
> [   17.395562] Hardware name: BCM2709
> [   17.404738] [<80018440>] (unwind_backtrace) from [<80013e0c>] (show_stack+0x20/0x24)
> [   17.419042] [<80013e0c>] (show_stack) from [<80558548>] (dump_stack+0x98/0xe0)
> [   17.432237] [<80558548>] (dump_stack) from [<8055473c>] (panic+0xa4/0x204)
> [   17.444761] [<8055473c>] (panic) from [<8002937c>] (do_exit+0xa0c/0xa64)
> [   17.452507] [<8002937c>] (do_exit) from [<80029470>] (do_group_exit+0x50/0xcc)
> [   17.462827] [<80029470>] (do_group_exit) from [<80033ed4>] (get_signal+0x2b0/0x6e0)
> [   17.474429] [<80033ed4>] (get_signal) from [<80013194>] (do_signal+0x98/0x3ac)
> [   17.482176] [<80013194>] (do_signal) from [<80013690>] (do_work_pending+0xb8/0xc8)
> [   17.490129] [<80013690>] (do_work_pending) from [<8000f9e4>] (work_pending+0xc/0x20)
> [   17.501020] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004
> [   17.501020]
>

Reproduced. With my patch series I am now getting further:

[    5.570600] VFS: Mounted root (ext4 filesystem) on device 179:2.
[    5.628967] devtmpfs: mounted
[    5.667292] Freeing unused kernel memory: 448K (8078a000 - 807fa000)
[    7.829100] random: systemd urandom read with 2 bits of entropy available
[    7.902604] systemd[1]: systemd 215 running in system mode. (+PAM
+AUDIT +SELINUX +IMA +SYSVINIT +LIBCRYPTSETUP +GCRYPT +ACL +XZ
-SECCOMP -APPARMOR)
[    7.913866] systemd[1]: Detected architecture 'arm'.

Welcome to Raspbian GNU/Linux 8 (jessie)!

[    8.625874] NET: Registered protocol family 10
[    8.645330] systemd[1]: Inserted module 'ipv6'
[    8.671989] systemd[1]: Set hostname to <raspberrypi>.
[   12.670915] systemd[1]: Cannot add dependency job for unit
display-manager.service, ignoring: Unit display-manager.service failed
to load: No such file or directory.
[   12.720439] systemd[1]: Starting Forward Password Requests to Wall
Directory Watch.
[   12.731310] systemd[1]: Started Forward Password Requests to Wall
Directory Watch.
[   12.734406] systemd[1]: Expecting device dev-ttyAMA0.device...
         Expecting device dev-ttyAMA0.device...

...

[  OK  ] Started Permit User Sessions.
[  OK  ] Started Login Service.
[  OK  ] Started System Logging Service.
[  OK  ] Started LSB: Apply config from /boot/os_config.json.
[  OK  ] Started dhcpcd on all interfaces.
[  OK  ] Reached target Network.
         Starting /etc/rc.local Compatibility...
[  OK  ] Reached target Network is Online.
         Starting LSB: Start NTP daemon...
[  OK  ] Started /etc/rc.local Compatibility.
         Starting Wait for Plymouth Boot Screen to Quit...
         Starting Terminate Plymouth Boot Screen...
[  OK  ] Started Wait for Plymouth Boot Screen to Quit.
         Starting Getty on tty1...
[  OK  ] Started Getty on tty1.
         Starting Serial Getty on ttyAMA0...
[  OK  ] Started Serial Getty on ttyAMA0.
[  OK  ] Reached target Login Prompts.
[  OK  ] Started Terminate Plymouth Boot Screen.

Raspbian GNU/Linux 8 raspberrypi ttyAMA0

raspberrypi login: pi
Password:
Linux raspberrypi 4.1.18-v7+ #846 SMP Thu Feb 25 14:22:53 GMT 2016 armv7l

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
pi@raspberrypi:~$ cat /proc/cpuinfo
processor    : 0
model name    : ARMv7 Processor rev 1 (v7l)
BogoMIPS    : 38.40
Features    : half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva
idivt vfpd32 lpae evtstrm
CPU implementer    : 0x41
CPU architecture: 7
CPU variant    : 0x2
CPU part    : 0xc0f
CPU revision    : 1

Hardware    : BCM2709
Revision    : 0000
Serial        : 0000000000000000
pi@raspberrypi:~$ uname -a
Linux raspberrypi 4.1.18-v7+ #846 SMP Thu Feb 25 14:22:53 GMT 2016
armv7l GNU/Linux

Regards,
Peter

> Cheers,
> Andrew
