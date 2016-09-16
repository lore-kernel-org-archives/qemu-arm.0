Received: by 10.80.163.71 with SMTP id 65csp319235edn;
        Fri, 16 Sep 2016 05:29:32 -0700 (PDT)
X-Received: by 10.200.38.241 with SMTP id 46mr15331256qtp.135.1474028972058;
        Fri, 16 Sep 2016 05:29:32 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 76si4134746qkx.204.2016.09.16.05.29.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Sep 2016 05:29:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40261 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bksGp-0003RR-I5
	for alex.bennee@linaro.org; Fri, 16 Sep 2016 08:29:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1bksGk-0003RD-KH
	for qemu-arm@nongnu.org; Fri, 16 Sep 2016 08:29:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1bksGg-0002mW-Bm
	for qemu-arm@nongnu.org; Fri, 16 Sep 2016 08:29:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52844)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>)
	id 1bksGg-0002lf-29; Fri, 16 Sep 2016 08:29:22 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A664490E43;
	Fri, 16 Sep 2016 12:29:19 +0000 (UTC)
Received: from dhcp129-212.brq.redhat.com (dhcp129-212.brq.redhat.com
	[10.34.129.212])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GCTGld018058
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 16 Sep 2016 08:29:18 -0400
Message-ID: <1474028956.3600.39.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Wei Huang <wei@redhat.com>, qemu-arm@nongnu.org
Date: Fri, 16 Sep 2016 14:29:16 +0200
In-Reply-To: <1473915856-23801-1-git-send-email-wei@redhat.com>
References: <1473915856-23801-1-git-send-email-wei@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 16 Sep 2016 12:29:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
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
X-TUID: DEh4+Rrwsgvm

On Thu, 2016-09-15 at 01:04 -0400, Wei Huang wrote:
> This patchset adds a pmu=3D[on/off] option to enable/disable vPMU suppo=
rt=C2=A0
> for guest VM. There are several reasons to justify this option. First,
> vPMU can be problematic for cross-migration between different SoC as pe=
rf
> counters are architecture-dependent. It is more flexible to have an opt=
ion
> to turn it on/off. Secondly Secondly this option matches the "pmu" opti=
on
> as supported in libvirt. To make sure backward compatible, a PMU proper=
ty
> is added to mach-virt machine types.

[...]

> Wei Huang (2):
>=C2=A0=C2=A0=C2=A0arm64: Add an option to turn on/off vPMU support
>=C2=A0=C2=A0=C2=A0arm: virt: add PMU property to mach-virt machine type
>=C2=A0
>=C2=A0=C2=A0hw/arm/virt-acpi-build.c |=C2=A0=C2=A02 +-
>=C2=A0=C2=A0hw/arm/virt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0| 15 ++++++++++++++-
>=C2=A0=C2=A0target-arm/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| 22 ++++++++++++++++++++++
>=C2=A0=C2=A0target-arm/cpu.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0|=C2=A0=C2=A01 +
>=C2=A0=C2=A0target-arm/cpu64.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
|=C2=A0=C2=A02 ++
>=C2=A0=C2=A0target-arm/kvm64.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
| 19 +++++++++++++++----
>=C2=A0=C2=A06 files changed, 55 insertions(+), 6 deletions(-)

This doesn't seem to be working :(

My guest configuration looks like

=C2=A0 <domain type=3D'kvm'>
=C2=A0=C2=A0=C2=A0=C2=A0<name>abologna-rhel73</name>
=C2=A0=C2=A0=C2=A0=C2=A0<uuid>78f74104-65f2-4faf-9faa-26107c1071ef</uuid>
=C2=A0=C2=A0=C2=A0=C2=A0<memory unit=3D'KiB'>2097152</memory>
=C2=A0=C2=A0=C2=A0=C2=A0<currentMemory unit=3D'KiB'>2097152</currentMemor=
y>
=C2=A0=C2=A0=C2=A0=C2=A0<vcpu placement=3D'static'>4</vcpu>
=C2=A0=C2=A0=C2=A0=C2=A0<os>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<type arch=3D'aarch64' machine=3D'vir=
t-2.7'>hvm</type>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<loader readonly=3D'yes' type=3D'pfla=
sh'>/usr/share/AAVMF/AAVMF_CODE.fd</loader>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<nvram>/var/lib/libvirt/qemu/nvram/ab=
ologna-rhel73_VARS.fd</nvram>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<boot dev=3D'hd'/>
=C2=A0=C2=A0=C2=A0=C2=A0</os>
=C2=A0=C2=A0=C2=A0=C2=A0<features>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<pmu state=3D'off'/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<gic version=3D'2'/>
=C2=A0=C2=A0=C2=A0=C2=A0</features>
=C2=A0=C2=A0=C2=A0=C2=A0<cpu mode=3D'host-passthrough'/>
=C2=A0=C2=A0=C2=A0=C2=A0<clock offset=3D'utc'/>
=C2=A0=C2=A0=C2=A0=C2=A0<on_poweroff>destroy</on_poweroff>
=C2=A0=C2=A0=C2=A0=C2=A0<on_reboot>restart</on_reboot>
=C2=A0=C2=A0=C2=A0=C2=A0<on_crash>restart</on_crash>
=C2=A0=C2=A0=C2=A0=C2=A0<devices>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<emulator>/usr/libexec/abologna-qemu-=
kvm</emulator>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<disk type=3D'file' device=3D'disk'>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<driver name=3D'qemu' typ=
e=3D'qcow2'/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<source file=3D'/var/lib/=
libvirt/images/abologna-rhel73.qcow2'/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<target dev=3D'vda' bus=3D=
'virtio'/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<address type=3D'virtio-m=
mio'/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</disk>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<controller type=3D'pci' index=3D'0' =
model=3D'pcie-root'/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<controller type=3D'virtio-serial' in=
dex=3D'0'>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<address type=3D'virtio-m=
mio'/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</controller>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<interface type=3D'network'>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<mac address=3D'52:54:00:=
57:76:ad'/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<source network=3D'defaul=
t'/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<model type=3D'virtio'/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<address type=3D'virtio-m=
mio'/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</interface>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<serial type=3D'pty'>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<target port=3D'0'/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</serial>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<console type=3D'pty'>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<target type=3D'serial' p=
ort=3D'0'/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</console>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<channel type=3D'unix'>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<target type=3D'virtio' n=
ame=3D'org.qemu.guest_agent.0'/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<address type=3D'virtio-s=
erial' controller=3D'0' bus=3D'0' port=3D'1'/>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</channel>
=C2=A0=C2=A0=C2=A0=C2=A0</devices>
=C2=A0 </domain>

and based on that configuration, libvirt creates a QEMU
command line that looks like

=C2=A0 LC_ALL=3DC \
=C2=A0 PATH=3D/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin \
=C2=A0 QEMU_AUDIO_DRV=3Dnone \
=C2=A0 /usr/libexec/abologna-qemu-kvm \
=C2=A0=C2=A0=C2=A0=C2=A0-name guest=3Dabologna-rhel73,debug-threads=3Don =
\
=C2=A0=C2=A0=C2=A0=C2=A0-S \
=C2=A0=C2=A0=C2=A0=C2=A0-object secret,id=3DmasterKey0,format=3Draw,file=3D=
/var/lib/libvirt/qemu/domain-5-abologna-rhel73/master-key.aes \
=C2=A0=C2=A0=C2=A0=C2=A0-machine virt-2.7,accel=3Dkvm,usb=3Doff \
=C2=A0=C2=A0=C2=A0=C2=A0-cpu host,pmu=3Doff \
=C2=A0=C2=A0=C2=A0=C2=A0-drive file=3D/usr/share/AAVMF/AAVMF_CODE.fd,if=3D=
pflash,format=3Draw,unit=3D0,readonly=3Don \
=C2=A0=C2=A0=C2=A0=C2=A0-drive file=3D/var/lib/libvirt/qemu/nvram/abologn=
a-rhel73_VARS.fd,if=3Dpflash,format=3Draw,unit=3D1 \
=C2=A0=C2=A0=C2=A0=C2=A0-m 2048 \
=C2=A0=C2=A0=C2=A0=C2=A0-realtime mlock=3Doff \
=C2=A0=C2=A0=C2=A0=C2=A0-smp 4,sockets=3D4,cores=3D1,threads=3D1 \
=C2=A0=C2=A0=C2=A0=C2=A0-uuid 78f74104-65f2-4faf-9faa-26107c1071ef \
=C2=A0=C2=A0=C2=A0=C2=A0-nographic \
=C2=A0=C2=A0=C2=A0=C2=A0-no-user-config \
=C2=A0=C2=A0=C2=A0=C2=A0-nodefaults \
=C2=A0=C2=A0=C2=A0=C2=A0-chardev socket,id=3Dcharmonitor,path=3D/var/lib/=
libvirt/qemu/domain-5-abologna-rhel73/monitor.sock,server,nowait \
=C2=A0=C2=A0=C2=A0=C2=A0-mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dco=
ntrol \
=C2=A0=C2=A0=C2=A0=C2=A0-rtc base=3Dutc \
=C2=A0=C2=A0=C2=A0=C2=A0-no-shutdown \
=C2=A0=C2=A0=C2=A0=C2=A0-boot strict=3Don \
=C2=A0=C2=A0=C2=A0=C2=A0-device virtio-serial-device,id=3Dvirtio-serial0 =
\
=C2=A0=C2=A0=C2=A0=C2=A0-drive file=3D/var/lib/libvirt/images/abologna-rh=
el73.qcow2,format=3Dqcow2,if=3Dnone,id=3Ddrive-virtio-disk0 \
=C2=A0=C2=A0=C2=A0=C2=A0-device virtio-blk-device,scsi=3Doff,drive=3Ddriv=
e-virtio-disk0,id=3Dvirtio-disk0,bootindex=3D1 \
=C2=A0=C2=A0=C2=A0=C2=A0-netdev tap,fd=3D25,id=3Dhostnet0,vhost=3Don,vhos=
tfd=3D27 \
=C2=A0=C2=A0=C2=A0=C2=A0-device virtio-net-device,netdev=3Dhostnet0,id=3D=
net0,mac=3D52:54:00:57:76:ad \
=C2=A0=C2=A0=C2=A0=C2=A0-serial pty \
=C2=A0=C2=A0=C2=A0=C2=A0-chardev socket,id=3Dcharchannel0,path=3D/var/lib=
/libvirt/qemu/channel/target/domain-5-abologna-rhel73/org.qemu.guest_agen=
t.0,server,nowait \
=C2=A0=C2=A0=C2=A0=C2=A0-device virtserialport,bus=3Dvirtio-serial0.0,nr=3D=
1,chardev=3Dcharchannel0,id=3Dchannel0,name=3Dorg.qemu.guest_agent.0 \
=C2=A0=C2=A0=C2=A0=C2=A0-msg timestamp=3Don

Inside the guest, however, even with pmu=3Doff, I can still see
the PMU being initialized during boot

=C2=A0 # dmesg | grep -i pmu
=C2=A0 [=C2=A0=C2=A0=C2=A0=C2=A00.000000] ACPI-PMU: Assign CPU 0 girq 23 =
level 0
=C2=A0 [=C2=A0=C2=A0=C2=A0=C2=A00.000000] ACPI-PMU: Assign CPU 1 girq 23 =
level 0
=C2=A0 [=C2=A0=C2=A0=C2=A0=C2=A00.000000] ACPI-PMU: Assign CPU 2 girq 23 =
level 0
=C2=A0 [=C2=A0=C2=A0=C2=A0=C2=A00.000000] ACPI-PMU: Assign CPU 3 girq 23 =
level 0
=C2=A0 [=C2=A0=C2=A0=C2=A0=C2=A00.087277] ACPI-PMU: Setting up 4 PMUs for=
 CPU type 0
=C2=A0 [=C2=A0=C2=A0=C2=A0=C2=A00.576255] hw perfevents: enabled with arm=
v8_pmuv3 PMU driver,
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A05 counters available

and perf can list the counters

=C2=A0 # perf list | grep Hardware
=C2=A0=C2=A0=C2=A0=C2=A0branch-misses=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[Hardware event]
=C2=A0=C2=A0=C2=A0=C2=A0cache-misses=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[Hardware event]
=C2=A0=C2=A0=C2=A0=C2=A0cache-references=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0[Hardware event]
=C2=A0=C2=A0=C2=A0=C2=A0cpu-cycles OR cycles=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0[Hardware event]
=C2=A0=C2=A0=C2=A0=C2=A0instructions=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[Hardware event]
=C2=A0=C2=A0=C2=A0=C2=A0L1-dcache-load-misses=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
[Hardware cache event]
=C2=A0=C2=A0=C2=A0=C2=A0L1-dcache-loads=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[Hardware cache event]
=C2=A0=C2=A0=C2=A0=C2=A0L1-dcache-store-misses=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[=
Hardware cache event]
=C2=A0=C2=A0=C2=A0=C2=A0L1-dcache-stores=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0[Hardware cache event]
=C2=A0=C2=A0=C2=A0=C2=A0branch-load-misses=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0[Hardware cache event]
=C2=A0=C2=A0=C2=A0=C2=A0branch-loads=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[Hardware cache event]
=C2=A0=C2=A0=C2=A0=C2=A0mem:<addr>[/len][:access]=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[Hardware breakp=
oint]

and use them

=C2=A0 # perf stat true

=C2=A0=C2=A0=C2=A0Performance counter stats for 'true':

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00=
.610960=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0task-clock (msec)=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#=C2=A0=C2=A0=C2=A0=C2=A00.102 CPU=
s utilized
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0context-switches=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0#=C2=A0=C2=A0=C2=A0=C2=A00.000 K/sec
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0cpu-migrations=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0#=C2=A0=C2=A0=C2=A0=C2=A00.000 K/sec
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A024=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pa=
ge-faults=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0#=C2=A0=C2=A0=C2=A0=C2=A00.039 M/sec
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01,383,6=
76=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cycles=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0#=C2=A0=C2=A0=C2=A0=C2=A02.265 GHz
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<not supported>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0stalled-cycles-frontend
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<not supported>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0stalled-cycles-backend
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0396,335=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0instructions=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#=C2=
=A0=C2=A0=C2=A0=C2=A00.29=C2=A0=C2=A0insns per cycle
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<not supported>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0branches
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A05,536=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0branch-misses=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#=
=C2=A0=C2=A0=C2=A0=C2=A00.00% of all branches

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00.006013060 seconds=
 time elapsed

same way it can when using pmu=3Don or not passing any pmu=3D
value to QEMU.

I've tested this both on Moonshot and on ThunderX, the
behavior is the same.

Am I doing something wrong?

--=C2=A0
Andrea Bolognani / Red Hat / Virtualization
