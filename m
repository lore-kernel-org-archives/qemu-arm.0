Received: by 10.80.163.71 with SMTP id 65csp395269edn;
        Fri, 16 Sep 2016 09:06:11 -0700 (PDT)
X-Received: by 10.237.32.205 with SMTP id 71mr16707359qtb.22.1474041971417;
        Fri, 16 Sep 2016 09:06:11 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 99si8688987qkt.8.2016.09.16.09.06.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Sep 2016 09:06:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42551 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bkveU-0000TO-UP
	for alex.bennee@linaro.org; Fri, 16 Sep 2016 12:06:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bkvd2-0007vn-Sn
	for qemu-arm@nongnu.org; Fri, 16 Sep 2016 12:04:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bkvcx-00076G-0g
	for qemu-arm@nongnu.org; Fri, 16 Sep 2016 12:04:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40072)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1bkvcw-00075U-Mr; Fri, 16 Sep 2016 12:04:34 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4815DC04D28B;
	Fri, 16 Sep 2016 16:04:33 +0000 (UTC)
Received: from [10.10.50.75] (unused [10.10.50.75] (may be forged))
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GG4VAc007158; Fri, 16 Sep 2016 12:04:32 -0400
To: Andrea Bolognani <abologna@redhat.com>, qemu-arm@nongnu.org
References: <1473915856-23801-1-git-send-email-wei@redhat.com>
	<1474028956.3600.39.camel@redhat.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <c257adf8-8c72-b352-773d-5a543e17daa0@redhat.com>
Date: Fri, 16 Sep 2016 11:04:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1474028956.3600.39.camel@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 16 Sep 2016 16:04:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH V3 0/2] Add option to configure guest vPMU
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-devel@nongnu.org,
	shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hBqHxlwiLQGy



On 09/16/2016 07:29 AM, Andrea Bolognani wrote:
> On Thu, 2016-09-15 at 01:04 -0400, Wei Huang wrote:
>> This patchset adds a pmu=[on/off] option to enable/disable vPMU support 
>> for guest VM. There are several reasons to justify this option. First,
>> vPMU can be problematic for cross-migration between different SoC as perf
>> counters are architecture-dependent. It is more flexible to have an option
>> to turn it on/off. Secondly Secondly this option matches the "pmu" option
>> as supported in libvirt. To make sure backward compatible, a PMU property
>> is added to mach-virt machine types.
> 
> [...]
> 
>> Wei Huang (2):
>>    arm64: Add an option to turn on/off vPMU support
>>    arm: virt: add PMU property to mach-virt machine type
>>  
>>   hw/arm/virt-acpi-build.c |  2 +-
>>   hw/arm/virt.c            | 15 ++++++++++++++-
>>   target-arm/cpu.c         | 22 ++++++++++++++++++++++
>>   target-arm/cpu.h         |  1 +
>>   target-arm/cpu64.c       |  2 ++
>>   target-arm/kvm64.c       | 19 +++++++++++++++----
>>   6 files changed, 55 insertions(+), 6 deletions(-)
> 
> This doesn't seem to be working :(
> 
> My guest configuration looks like
> 
>   <domain type='kvm'>
>     <name>abologna-rhel73</name>
>     <uuid>78f74104-65f2-4faf-9faa-26107c1071ef</uuid>
>     <memory unit='KiB'>2097152</memory>
>     <currentMemory unit='KiB'>2097152</currentMemory>
>     <vcpu placement='static'>4</vcpu>
>     <os>
>       <type arch='aarch64' machine='virt-2.7'>hvm</type>
>       <loader readonly='yes' type='pflash'>/usr/share/AAVMF/AAVMF_CODE.fd</loader>
>       <nvram>/var/lib/libvirt/qemu/nvram/abologna-rhel73_VARS.fd</nvram>
>       <boot dev='hd'/>
>     </os>
>     <features>
>       <pmu state='off'/>
>       <gic version='2'/>
>     </features>
>     <cpu mode='host-passthrough'/>
>     <clock offset='utc'/>
>     <on_poweroff>destroy</on_poweroff>
>     <on_reboot>restart</on_reboot>
>     <on_crash>restart</on_crash>
>     <devices>
>       <emulator>/usr/libexec/abologna-qemu-kvm</emulator>
>       <disk type='file' device='disk'>
>         <driver name='qemu' type='qcow2'/>
>         <source file='/var/lib/libvirt/images/abologna-rhel73.qcow2'/>
>         <target dev='vda' bus='virtio'/>
>         <address type='virtio-mmio'/>
>       </disk>
>       <controller type='pci' index='0' model='pcie-root'/>
>       <controller type='virtio-serial' index='0'>
>         <address type='virtio-mmio'/>
>       </controller>
>       <interface type='network'>
>         <mac address='52:54:00:57:76:ad'/>
>         <source network='default'/>
>         <model type='virtio'/>
>         <address type='virtio-mmio'/>
>       </interface>
>       <serial type='pty'>
>         <target port='0'/>
>       </serial>
>       <console type='pty'>
>         <target type='serial' port='0'/>
>       </console>
>       <channel type='unix'>
>         <target type='virtio' name='org.qemu.guest_agent.0'/>
>         <address type='virtio-serial' controller='0' bus='0' port='1'/>
>       </channel>
>     </devices>
>   </domain>
> 
> and based on that configuration, libvirt creates a QEMU
> command line that looks like
> 
>   LC_ALL=C \
>   PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin \
>   QEMU_AUDIO_DRV=none \
>   /usr/libexec/abologna-qemu-kvm \
>     -name guest=abologna-rhel73,debug-threads=on \
>     -S \
>     -object secret,id=masterKey0,format=raw,file=/var/lib/libvirt/qemu/domain-5-abologna-rhel73/master-key.aes \
>     -machine virt-2.7,accel=kvm,usb=off \
>     -cpu host,pmu=off \
>     -drive file=/usr/share/AAVMF/AAVMF_CODE.fd,if=pflash,format=raw,unit=0,readonly=on \
>     -drive file=/var/lib/libvirt/qemu/nvram/abologna-rhel73_VARS.fd,if=pflash,format=raw,unit=1 \
>     -m 2048 \
>     -realtime mlock=off \
>     -smp 4,sockets=4,cores=1,threads=1 \
>     -uuid 78f74104-65f2-4faf-9faa-26107c1071ef \
>     -nographic \
>     -no-user-config \
>     -nodefaults \
>     -chardev socket,id=charmonitor,path=/var/lib/libvirt/qemu/domain-5-abologna-rhel73/monitor.sock,server,nowait \
>     -mon chardev=charmonitor,id=monitor,mode=control \
>     -rtc base=utc \
>     -no-shutdown \
>     -boot strict=on \
>     -device virtio-serial-device,id=virtio-serial0 \
>     -drive file=/var/lib/libvirt/images/abologna-rhel73.qcow2,format=qcow2,if=none,id=drive-virtio-disk0 \
>     -device virtio-blk-device,scsi=off,drive=drive-virtio-disk0,id=virtio-disk0,bootindex=1 \
>     -netdev tap,fd=25,id=hostnet0,vhost=on,vhostfd=27 \
>     -device virtio-net-device,netdev=hostnet0,id=net0,mac=52:54:00:57:76:ad \
>     -serial pty \
>     -chardev socket,id=charchannel0,path=/var/lib/libvirt/qemu/channel/target/domain-5-abologna-rhel73/org.qemu.guest_agent.0,server,nowait \
>     -device virtserialport,bus=virtio-serial0.0,nr=1,chardev=charchannel0,id=channel0,name=org.qemu.guest_agent.0 \
>     -msg timestamp=on
> 
> Inside the guest, however, even with pmu=off, I can still see
> the PMU being initialized during boot
> 
>   # dmesg | grep -i pmu
>   [    0.000000] ACPI-PMU: Assign CPU 0 girq 23 level 0
>   [    0.000000] ACPI-PMU: Assign CPU 1 girq 23 level 0
>   [    0.000000] ACPI-PMU: Assign CPU 2 girq 23 level 0
>   [    0.000000] ACPI-PMU: Assign CPU 3 girq 23 level 0
>   [    0.087277] ACPI-PMU: Setting up 4 PMUs for CPU type 0
>   [    0.576255] hw perfevents: enabled with armv8_pmuv3 PMU driver,
>                  5 counters available
> 
> and perf can list the counters
> 
>   # perf list | grep Hardware
>     branch-misses                                      [Hardware event]
>     cache-misses                                       [Hardware event]
>     cache-references                                   [Hardware event]
>     cpu-cycles OR cycles                               [Hardware event]
>     instructions                                       [Hardware event]
>     L1-dcache-load-misses                              [Hardware cache event]
>     L1-dcache-loads                                    [Hardware cache event]
>     L1-dcache-store-misses                             [Hardware cache event]
>     L1-dcache-stores                                   [Hardware cache event]
>     branch-load-misses                                 [Hardware cache event]
>     branch-loads                                       [Hardware cache event]
>     mem:<addr>[/len][:access]                          [Hardware breakpoint]
> 
> and use them
> 
>   # perf stat true
> 
>    Performance counter stats for 'true':
> 
>             0.610960      task-clock (msec)         #    0.102 CPUs utilized
>                    0      context-switches          #    0.000 K/sec
>                    0      cpu-migrations            #    0.000 K/sec
>                   24      page-faults               #    0.039 M/sec
>            1,383,676      cycles                    #    2.265 GHz
>      <not supported>      stalled-cycles-frontend
>      <not supported>      stalled-cycles-backend
>              396,335      instructions              #    0.29  insns per cycle
>      <not supported>      branches
>                5,536      branch-misses             #    0.00% of all branches
> 
>          0.006013060 seconds time elapsed
> 
> same way it can when using pmu=on or not passing any pmu=
> value to QEMU.
> 
> I've tested this both on Moonshot and on ThunderX, the
> behavior is the same.
> 
> Am I doing something wrong?

I can replicate the problem. To answer your question: No, I think it is
a bug caused in this patch. Following code path, it turns out that
machvirt_init() is called after ARMCPU->has_pmu property has been
configured. So in your example, machvirt->pmu_default_on will overwrite
the ARMCPU->has_pmu value to be TRUE (always).

Even worse, our desired PMU setting can't be fully covered by a Boolean
ARMCPU->has_pmu field because machvirt_init() can't tell ARMCPU->has_pmu
is default-OFF or forced-OFF. Here is the matrix of one example:

                               ARMCPU->has_pmu  VMC->pmu_default_on vPMU
-M virt-2.7 -cpu host          default-OFF      TRUE                ON
-M virt-2.7 -cpu host,pmu=off  forced-OFF       TRUE                OFF*
-M virt-2.7 -cpu host,pmu=on   forced-ON        TRUE                ON
-M virt-2.6 -cpu host          default-OFF      FALSE               OFF
-M virt-2.6 -cpu host,pmu=off  forced-OFF       FALSE               OFF
-M virt-2.6 -cpu host,pmu=on   forced-ON        FALSE               ON
-M virt-2.8+ -cpu host         default-OFF      FALSE               OFF
-M virt-2.8+ -cpu host,pmu=off forced-OFF       FALSE               OFF
-M virt-2.8+ -cpu host,pmu=on  forced-ON        FALSE               ON

The problematic one is the second line (*). To solve the problem, we
might want to change ARMCPU->has_pmu to an int (or enum).

> 
> -- 
> Andrea Bolognani / Red Hat / Virtualization
> 
