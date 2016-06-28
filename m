Received: by 10.25.21.96 with SMTP id l93csp1640300lfi;
        Tue, 28 Jun 2016 06:36:54 -0700 (PDT)
X-Received: by 10.233.237.14 with SMTP id c14mr1836725qkg.88.1467121014603;
        Tue, 28 Jun 2016 06:36:54 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c3si4172213qkg.226.2016.06.28.06.36.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Jun 2016 06:36:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36787 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHtCA-0000Ef-0w
	for alex.bennee@linaro.org; Tue, 28 Jun 2016 09:36:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bHt9n-0005We-SA
	for qemu-devel@nongnu.org; Tue, 28 Jun 2016 09:34:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bHt9g-0001w8-Dz
	for qemu-devel@nongnu.org; Tue, 28 Jun 2016 09:34:26 -0400
Received: from mail-qk0-x22d.google.com ([2607:f8b0:400d:c09::22d]:36283)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bHt9f-0001ux-P6
	for qemu-devel@nongnu.org; Tue, 28 Jun 2016 09:34:20 -0400
Received: by mail-qk0-x22d.google.com with SMTP id z142so4352103qkb.3
	for <qemu-devel@nongnu.org>; Tue, 28 Jun 2016 06:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hXII5MW4C5nGsmo2BHuwAcHW+Bcy4xypvzcrMbRzJSQ=;
	b=cz7KUvdXXpSO7WgyspLO0JQeDHEtfgjzed+4rZO5lajO3TydIpBdJtm7WzmxY0He4k
	a8VuClbQEJBgiy7QH1C8lwhLhIUlkLuPii+lkhhgibmFgoTxHTb446NC5EsCr080mUNW
	XuPORh+dcQ52JpRecksIgYhZ9WsIc53ZG0nFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hXII5MW4C5nGsmo2BHuwAcHW+Bcy4xypvzcrMbRzJSQ=;
	b=QgTLE5+Tu6Wg/lKdkIiwtLH/Hea0cEmzz5uO0+BM5FvOzU/BmKUmkwvh+c/Nvpt/oR
	EtcTUOm/5ns4io7o+8AFy9hXsJ+eDUxtCTFAVXJ2H+bzFwFK4afgIv3tIqZ45XwFPMaC
	0y8Z1LLrNPv9DUmB7F5VXz0ZJHkapkfoXpzDpgC2Cs4VK9K7sYLwJ7ts/VS2s40mj4rA
	X6C60IrMmEsi57BfMpVLwDhTqTQED55vfpxajzqG1mYCcHml9CmoNYZvnsstjkrWAqzO
	y5QBdd7bI1EN/YPnFO43WLtey+e9cyAKaP23/8AD+LXXLqqqKWbIpYJlg/mdL5bEz3Tg
	eSKA==
X-Gm-Message-State: ALyK8tJZypaf6hWmRwrxuFKTmSIrC1up67FawUOOc95zMPhXXYq0DpjcrfCrcG01noJOw9w1EDlr2WIml/dVq7yd
X-Received: by 10.55.136.133 with SMTP id k127mr2020179qkd.20.1467120859017;
	Tue, 28 Jun 2016 06:34:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.46.25 with HTTP; Tue, 28 Jun 2016 06:34:18 -0700 (PDT)
In-Reply-To: <3ec77a9e-5ba7-c81a-ad12-3ade3115308f@redhat.com>
References: <CAN76PtRzf2qAwkMi9PMCUCaUha+6EpFnA_TiBB_oWLVFEQ8yyw@mail.gmail.com>
	<CAFEAcA_SRt+uDMy=bAqktW=cGErYkMiAsNGBT7Jbyd1KRGtjxA@mail.gmail.com>
	<CAN76PtRjHq3NPetkobdT_e5O=OvuJ=Q+q+WKHggHo-ShfQAGCg@mail.gmail.com>
	<CAN76PtTSxkNDT+QQ3VicgyLC0LPYuo-7BaEp2AHkQXCfRLTUGg@mail.gmail.com>
	<2431b67a-8602-4400-bdd8-d597ff62a13b@redhat.com>
	<CAN76PtSMP_cdWXrbWOvchUDJMXNDwg5LjCxCHVTPEBTomS_ysw@mail.gmail.com>
	<3ec77a9e-5ba7-c81a-ad12-3ade3115308f@redhat.com>
From: Kevin Zhao <kevin.zhao@linaro.org>
Date: Tue, 28 Jun 2016 21:34:18 +0800
Message-ID: <CAN76PtR17jwwkVVX4xpzNoFDJKqyc5SxHTQe5OGh_ndm7r7Avg@mail.gmail.com>
To: Cole Robinson <crobinso@redhat.com>
Content-Type: multipart/mixed; boundary=94eb2c072772a533eb053656b14d
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::22d
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] Question about a qemu Aarch64 error when adding
 several SCSI disks
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	Gema Gomez-Solano <gema.gomez-solano@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9lKvyb5/PvF5

--94eb2c072772a533eb053656b14d
Content-Type: text/plain; charset=UTF-8

On 28 June 2016 at 02:23, Cole Robinson <crobinso@redhat.com> wrote:

> On 06/27/2016 09:05 AM, Kevin Zhao wrote:
> > Hi Cole,
> >
> > On 24 June 2016 at 19:35, Cole Robinson <crobinso@redhat.com> wrote:
> >
> >> On 06/24/2016 12:58 AM, Kevin Zhao wrote:
> >>> Hi Peter,
> >>>      Follow your advice, I have complied the Qemu v2.6.
> >>> stack@u202158:~$ kvm --version
> >>> QEMU emulator version 2.6.50 (v2.6.0-1280-g6f1d2d1-dirty), Copyright
> (c)
> >>> 2003-2008 Fabrice Bellard
> >>>      With this newest version, I use virt-manager to create the guest ,
> >> the
> >>> xml file is in the attachment. But the Qemu return error when creating:
> >>>      *error: internal error: process exited while connecting to
> monitor:
> >>> qemu-system-aarch64: -device
> >>> pci-bridge,chassis_nr=2,id=pci,bus=pci,addr=0x1: Duplicate ID 'pci' for
> >>> device*
> >>>
> >>
> >> That's probably this libvirt issue fixed in 1.3.4 and later:
> >>
> >> https://www.redhat.com/archives/libvirt-users/2016-April/msg00030.html
> >>
> >> I suggest testing with libvirt.git as well, there's been aarch64 related
> >> patches trickling in regularly
> >>
> >> - Cole
> >>
> >>      Thanks for your valuable advice. Follow your advice, I have build
> the
> > upstream vesion
> > of libvirt. The libvirt  version is :
> >         root@u202158:/opt/stack/kevin/libvirt/daemon# ./libvirtd
> >         2016-06-27 12:11:03.501+0000: 28044: info : libvirt version:
> 2.0.0
> > I stopped the system libvirtd-bin and libvirt-guests , then using
> libvirtd
> > above.
> >
> > Also I have replace the system Qemu with the Qemu 2.6.50 which I have
> built
> > from upstream :
> >         root@u202158:/opt/stack/kevin/libvirt# qemu-system-aarch64
> --version
> >         QEMU emulator version 2.6.50 (v2.6.0-1280-g6f1d2d1-dirty),
> > Copyright (c) 2003-2008 Fabrice Bellard
> > Using this XML in the attachment:
> >         Then Run virsh command to create guest:
> >         root@u202158:/opt/stack/kevin/libvirt/tools# ./virsh create
> > /opt/stack/f23.xml --console
> >         error: Failed to create domain from /opt/stack/f23.xml
> >         error: internal error: process exited while connecting to
> monitor:
> > 2016-06-27T12:45:23.807405Z qemu-system-aarch64: -drive
> > file=/var/lib/libvirt/qemu/nvram/f23_VARS.fd,if=pflash,format=raw,unit=1:
> > Could not open         '/var/lib/libvirt/qemu/nvram/f23_VARS.fd':
> > Permission denied
> >
> > Here I met the permission problem and I'm not sure where is wrong. If I
> use
> > origin qemu-system-aarch64(installed by apt-get),I will not meet the
> > problem of permission..Kindly need your help, you will be really
> > appreciated,,,   :D
> > $ls -l /usr/bin/qemu-system-aarch64
> > -rwxr-xr-x 1 root root 26935520 Jun 27 10:56 /usr/bin/qemu-system-aarch64
> >  $ls -l /var/lib/libvirt/qemu/nvram/f23_VARS.fd
> > -rw------- 1 root root 67108864 Jun 20 07:27
> > /var/lib/libvirt/qemu/nvram/f23_VARS.fd
> >
> >
> >
>
> Depending on how you compiled libvirt, it may run qemu as the unprivileged
> qemu:qemu user. Perhaps that VM was created with the default compilation
> options to run qemu as root:root, and whatever you are trying to run it
> with
> now is using qemu:qemu
>

Yeah it really the problem with privilege. I change the
/var/lib/libvirt/qemu/nvram/f23_VARS.fd
 to another directory so that qemu can access it,and no permission denied
error
again.
Thank Cole.

All:
     With the Qemu 2.6.50 and
libvirt(commit 03ce1328086d6937d2647d616efff29941a3e80a):
*I find that the problem that I have met before occurs again. I can
reproduce it.*
     1.  After launching a VM with fedora23(for example), the xml is
f23.xml in attachment.
     2. Then  use qemu-img command to generate a qemu disk f23-2.qcow2 and
f23-3.qcow2
     3. Add f23-2.qcow2 as sdc.
     $ ./virsh  attach-device  f23  /root/sdc.xml
sdc.xml :
    <disk type="file" device="disk">
       <driver name="qemu" type="qcow2"/>
      <source file="/var/lib/libvirt/images/f23-2.qcow2"/>
      <target dev="sdc" bus="scsi"/>
    </disk>
     Then in the Guest f23, we can see it takes effect immediately.

     4. Add f23-3.qcow2  as sdh , also add virtio-scsi controller for sdh.
      $ ./virsh edit f23
      add this below
      <controller type="scsi" index="1" model="virtio-scsi"/>
        <disk type="file" device="disk">
      <driver name="qemu" type="qcow2"/>
      <source file="/var/lib/libvirt/images/f23-4.qcow2"/>
      <target dev="sdh" bus="scsi"/>
    </disk>
      $ ./virsh destory f23  && ./.virsh start f23
Got the error:
2016-06-28 11:37:17.017+0000: 6329: warning : qemuDomainObjTaint:3227 :
Domain id=15 name='f23' uuid=e2de65f4-5d9a-4b90-a56a-ae40f4763aec is
tainted: high-privileges
2016-06-28 11:37:17.017+0000: 6329: warning : qemuDomainObjTaint:3227 :
Domain id=15 name='f23' uuid=e2de65f4-5d9a-4b90-a56a-ae40f4763aec is
tainted: host-cpu
2016-06-28 11:37:28.546+0000: 6313: error : qemuMonitorIORead:583 : Unable
to read from monitor: Connection reset by peer
2016-06-28 11:37:28.546+0000: 6313: error : qemuProcessReportLogError:1815
: internal error: qemu unexpectedly closed the monitor:
qemu-system-aarch64: /opt/stack/kevin/qemu/migration/savevm.c:615:
vmstate_register_with_alias_id: Assertion `!se->compat || se->instance_id
== 0' failed.

*So this bug seems exist with new qemu and new libvirt. *

>
> - Cole
>
>

--94eb2c072772a533eb053656b14d
Content-Type: text/xml; charset=US-ASCII; name="f23.xml"
Content-Disposition: attachment; filename="f23.xml"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ipzgn33s0

PGRvbWFpbiB0eXBlPSJrdm0iPgogIDxuYW1lPmYyMzwvbmFtZT4KICA8dXVpZD5iZjc0NDc5Yi03
NmRhLTRhODQtOTYyYS01NzYzOTQ5MDFmM2E8L3V1aWQ+CiAgPG1lbW9yeT4xMDQ4NTc2PC9tZW1v
cnk+CiAgPGN1cnJlbnRNZW1vcnk+MTA0ODU3NjwvY3VycmVudE1lbW9yeT4KICA8dmNwdT4xPC92
Y3B1PgogIDxvcz4KICAgIDx0eXBlIGFyY2g9ImFhcmNoNjQiIG1hY2hpbmU9InZpcnQiPmh2bTwv
dHlwZT4KICAgIDxsb2FkZXIgcmVhZG9ubHk9InllcyIgdHlwZT0icGZsYXNoIj4vdXNyL3NoYXJl
L0FBVk1GL0FBVk1GX0NPREUuZmQ8L2xvYWRlcj4KCTxudnJhbT4vdmFyL2xpYi9saWJ2aXJ0L2lt
YWdlcy9mMjNfVkFSUy5mZDwvbnZyYW0+CiAgICA8Ym9vdCBkZXY9ImNkcm9tIi8+CiAgICA8Ym9v
dCBkZXY9ImhkIi8+CiAgPC9vcz4KICA8Y3B1IG1vZGU9Imhvc3QtcGFzc3Rocm91Z2giLz4KICA8
Y2xvY2sgb2Zmc2V0PSJ1dGMiLz4KICA8b25fcG93ZXJvZmY+ZGVzdHJveTwvb25fcG93ZXJvZmY+
CiAgPG9uX3JlYm9vdD5kZXN0cm95PC9vbl9yZWJvb3Q+CiAgPG9uX2NyYXNoPmRlc3Ryb3k8L29u
X2NyYXNoPgogIDxkZXZpY2VzPgogICAgPGVtdWxhdG9yPi91c3IvYmluL2t2bTwvZW11bGF0b3I+
CiAgICA8ZGlzayB0eXBlPSJmaWxlIiBkZXZpY2U9ImRpc2siPgogICAgICA8ZHJpdmVyIG5hbWU9
InFlbXUiIHR5cGU9InFjb3cyIi8+CiAgICAgIDxzb3VyY2UgZmlsZT0iL3Zhci9saWIvbGlidmly
dC9pbWFnZXMvZjIzLnFjb3cyIi8+CiAgICAgIDx0YXJnZXQgZGV2PSJzZGEiIGJ1cz0ic2NzaSIv
PgogICAgPC9kaXNrPgogICAgPGRpc2sgdHlwZT0iZmlsZSIgZGV2aWNlPSJjZHJvbSI+CiAgICAg
IDxkcml2ZXIgbmFtZT0icWVtdSIgdHlwZT0icmF3Ii8+CiAgICAgIDxzb3VyY2UgZmlsZT0iL3Zh
ci9saWIvbGlidmlydC9pbWFnZXMvRmVkb3JhLVNlcnZlci1EVkQtYWFyY2g2NC0yMy5pc28iLz4K
ICAgICAgPHRhcmdldCBkZXY9InNkYiIgYnVzPSJzY3NpIi8+CiAgICAgIDxyZWFkb25seS8+CiAg
ICA8L2Rpc2s+CiAgICA8Y29udHJvbGxlciB0eXBlPSJzY3NpIiBpbmRleD0iMCIgbW9kZWw9InZp
cnRpby1zY3NpIi8+CiAgICA8aW50ZXJmYWNlIHR5cGU9Im5ldHdvcmsiPgogICAgICA8c291cmNl
IG5ldHdvcms9ImRlZmF1bHQiLz4KICAgICAgPG1hYyBhZGRyZXNzPSI1Mjo1NDowMDpjZTo0ODoy
NiIvPgogICAgICA8bW9kZWwgdHlwZT0idmlydGlvIi8+CiAgICA8L2ludGVyZmFjZT4KICAgIDxj
b25zb2xlIHR5cGU9InB0eSIvPgogIDwvZGV2aWNlcz4KPC9kb21haW4+Cgo=
--94eb2c072772a533eb053656b14d--
