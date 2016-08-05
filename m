Received: by 10.25.21.156 with SMTP id 28csp1729447lfv;
        Fri, 5 Aug 2016 03:19:37 -0700 (PDT)
X-Received: by 10.237.43.71 with SMTP id p65mr11894426qtd.116.1470392377115;
        Fri, 05 Aug 2016 03:19:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n6si8541214qkb.114.2016.08.05.03.19.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Aug 2016 03:19:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44178 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bVcE4-0007Qs-DU
	for alex.bennee@linaro.org; Fri, 05 Aug 2016 06:19:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60755)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bVc3L-0004Ir-AO
	for qemu-arm@nongnu.org; Fri, 05 Aug 2016 06:08:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bVc3I-0004Vz-Fg
	for qemu-arm@nongnu.org; Fri, 05 Aug 2016 06:08:30 -0400
Received: from mail-ua0-x232.google.com ([2607:f8b0:400c:c08::232]:35965)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bVc3I-0004Vg-4I
	for qemu-arm@nongnu.org; Fri, 05 Aug 2016 06:08:28 -0400
Received: by mail-ua0-x232.google.com with SMTP id j59so193890540uaj.3
	for <qemu-arm@nongnu.org>; Fri, 05 Aug 2016 03:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xWKRF6tjbUPolnZsJV8YZosrpNTGz6egMFjTAa1uj4A=;
	b=GKG+WM2z5D0MTI3a5vQdpszhhPo1w9WefFLTI5WJUFOoYVHjpFoqut6FrNUBUAR8+Z
	kcnTcXVhlVrhis7x3xp+uSA6HLj1pk6VV2qfEJ5tjP7YQ0f3dvcDFvzQlD4pg8RBBujr
	yvCQiqLUkTFpTnja1SukVcHrcUL835AE26FFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xWKRF6tjbUPolnZsJV8YZosrpNTGz6egMFjTAa1uj4A=;
	b=meFuem9YFSO+RfbqKHsyLm4+oYOltT1R4YhVCW5NF5RYW9zJFASzxKHNa1Yy4RQXB8
	011o39uC+nriEwB8YUhFfkk4vEB2nEZR0yYMkOS4wDNWrq7FtDC8tJwcdOQUkp9Yb7ak
	MDPi0I+IsZGD6xsZtC6dJDf79Xq2velFveEhnNT2eaopfYLN7RgUuQZrALHqk3GGiXhZ
	IpIPCPhNOy+zGaaEVz0NfrmHmxy9bSPRHHqXtUijDob7flGmVJ+zM2SKQPK73PlESm4/
	opRAq2FqHczDzAmPmlnCsWRy5VJrCLC3aeyD4MOzFisHQCrkRi++34aSNxPqgaxu+ofq
	cBwQ==
X-Gm-Message-State: AEkoousnx9Epkk6S/MmWzDbHKJlJylEtCgFSb3RdEJrQtrHUrY80k/1Zu+1IuW9tjb+UuGTRpXKqZWQwUWnRXykZ
X-Received: by 10.176.4.226 with SMTP id 89mr40847431uaw.83.1470391707688;
	Fri, 05 Aug 2016 03:08:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.41.34 with HTTP; Fri, 5 Aug 2016 03:08:26 -0700 (PDT)
In-Reply-To: <20160805082857.GH9933@redhat.com>
References: <CAN76PtTfrRFDNDXHFiOvavk4EkOqdXvfKOYJh5AmZPzErxmOkw@mail.gmail.com>
	<20160805082857.GH9933@redhat.com>
From: Kevin Zhao <kevin.zhao@linaro.org>
Date: Fri, 5 Aug 2016 18:08:26 +0800
Message-ID: <CAN76PtRqvnnO3aixQ+iZpmP-fN6H=+AehqJT+_HsfMS3kep_5Q@mail.gmail.com>
To: "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: multipart/related; boundary=94eb2c1259066b12080539503fdd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::232
Subject: Re: [Qemu-arm] [Qemu-devel] [Help]: Does qemu-system-aarch64
 support virtio-9p? I got a problem when remap host file to guest in
 AArch64.
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cG2XME1OEcIz

--94eb2c1259066b12080539503fdd
Content-Type: multipart/alternative; boundary=94eb2c1259066b12070539503fdc

--94eb2c1259066b12070539503fdc
Content-Type: text/plain; charset=UTF-8

Hi Daniel && Peter && All,
     Thanks for your help. I've changed to 9p2000.u but also met the
problem. The qemu of booting the guests is here:
http://paste.openstack.org/show/550382/
     After booting *Debian 8* OS, enter into the guests  and run the
command( changed to 9p2000.u):
[image: Inline images 1]
*And you can see it has been blocked also :-)* .The dmesg info is here:
http://paste.openstack.org/show/550383/
In the last:
[  318.086744] FS-Cache: Loaded
[  318.089626] 9p: Installing v9fs 9p2000 file system support
[  318.089655] FS-Cache: Netfs '9p' registered for caching

 The guest kernel is 4.6.0-1-arm64 #1 SMP Debian 4.6.4-1 (2016-07-18)
aarch64 GNU/Linux
Guest qemu-system-aarch64: QEMU emulator version 2.6.0 (Debian 1:2.6+dfsg-3)
For Fedora 24, I find a bug here, related to this issue, Can't mount
virtio-9p fs at boot time
it is : https://bugzilla.redhat.com/show_bug.cgi?id=1184122

     It is a little werid of this problem, kindly need your help :-) Thanks~

On 5 August 2016 at 16:28, Daniel P. Berrange <berrange@redhat.com> wrote:

> On Fri, Aug 05, 2016 at 10:23:58AM +0800, Kevin Zhao wrote:
> > Hi All,
> >      I have a problem may about Qemu and kindly need your help. Does
> > qemu-system-aarch64 support virtio-9p ?
> >      Recently I have tried to use qemu remapped the file from host to
> > guest. As I know, Qemu has supported this so long as guest kernel has
> > support 9p(virtfs). Reference to this link:
> > http://wiki.qemu.org/Documentation/9psetup
> > Fedora 24 AArch64 kernel has supported this:
> > [root@sha-win-225 ~]# lsmod | grep 9p
> > 9p                     56273  0
> > fscache                87449  1 9p
> > 9pnet_virtio            9122  0
> > 9pnet                  83564  2 9p,9pnet_virtio
> > virtio_ring            13866  5 virtio_net,virtio_pci,9pnet_
> > virtio,virtio_mmio,virtio_scsi
> > virtio                  9467  5 virtio_net,virtio_pci,9pnet_
> > virtio,virtio_mmio,virtio_scsi
> >
> >     Now I use virsh to launch the VM, and the corresponding qemu command
> I
> > have pasted here:
> > http://paste.openstack.org/show/549225/.
> >     You can see that:
> > * -fsdev
> > local,security_model=mapped,id=fsdev-fs0,path=/var/lib/
> libvirt/images/coreos
> > -device
> > virtio-9p-pci,id=fs0,fsdev=fsdev-fs0,mount_tag=share,bus=pci.2,addr=0x1*
> >      Here is the command that remapped the directory from host to guest.
> > After VM launched, I use the command to mount:
> > * mount -t 9p -o trans=virtio share /tmp/shared/
> > -oversion=9p2000.L,posixacl,cache=loose*
> > But mount command will be blocked and output nothing.
>
> Try using  version=9p2000.u instead - I've noticed other versions have
> been buggy in various kernel version/qemu version combinations. The
> 9p2000.u version is what i use in libvirt-sandobx and so I know it will
> work in general.
>
> >      The Qemu version is QEMU emulator version 2.5.0 (Debian
> > 1:2.5+dfsg-5ubuntu10.2). Besides test fedora24 guest, I have got the same
> > problem in Debian jessie.
> >       Kindly need your help~You will be really appreciated.
>
> Regards,
> Daniel
> --
> |: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/
> :|
> |: http://libvirt.org              -o-             http://virt-manager.org
> :|
> |: http://autobuild.org       -o-         http://search.cpan.org/~danberr/
> :|
> |: http://entangle-photo.org       -o-       http://live.gnome.org/gtk-vnc
> :|
>

--94eb2c1259066b12070539503fdc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Daniel &amp;&amp; Peter &amp;&amp; All,=C2=A0<div>=C2=
=A0 =C2=A0 =C2=A0Thanks for your help. I&#39;ve changed to 9p2000.u but als=
o met the problem. The qemu of booting the guests is here:=C2=A0</div><div>=
<a href=3D"http://paste.openstack.org/show/550382/">http://paste.openstack.=
org/show/550382/</a><br></div><div>=C2=A0 =C2=A0 =C2=A0After booting <b>Deb=
ian 8</b> OS, enter into the guests =C2=A0and run the command(=C2=A0changed=
 to 9p2000.u):=C2=A0</div><div><img src=3D"cid:ii_1565a23ea85d3680" alt=3D"=
Inline images 1" width=3D"562" height=3D"34"><br></div><div><div><b>And you=
 can see it has been blocked also :-)</b> .The dmesg info is here:=C2=A0<a =
href=3D"http://paste.openstack.org/show/550383/">http://paste.openstack.org=
/show/550383/</a><br></div></div><div>In the last:</div><div><div><div>[ =
=C2=A0318.086744] FS-Cache: Loaded</div><div>[ =C2=A0318.089626] 9p: Instal=
ling v9fs 9p2000 file system support</div><div>[ =C2=A0318.089655] FS-Cache=
: Netfs &#39;9p&#39; registered for caching</div></div></div><div><br></div=
><div>=C2=A0The guest kernel is=C2=A04.6.0-1-arm64 #1 SMP Debian 4.6.4-1 (2=
016-07-18) aarch64 GNU/Linux</div><div>Guest qemu-system-aarch64:=C2=A0QEMU=
 emulator version 2.6.0 (Debian 1:2.6+dfsg-3)</div><div>For Fedora 24, I fi=
nd a bug here, related to this i<span style=3D"background-color:rgb(255,255=
,255)"><font size=3D"1">ssue,=C2=A0<span style=3D"color:rgb(0,0,0);font-fam=
ily:&quot;DejaVu Sans&quot;,&quot;Liberation Sans&quot;,sans-serif">Can&#39=
;t mount virtio-9p fs at boot time</span></font></span></div><div>it is : <=
a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1184122">https://bu=
gzilla.redhat.com/show_bug.cgi?id=3D1184122</a></div><div><br></div><div>=
=C2=A0 =C2=A0 =C2=A0It is a little werid of this problem, kindly need your =
help :-) Thanks~</div></div><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">On 5 August 2016 at 16:28, Daniel P. Berrange <span dir=3D"ltr">=
&lt;<a href=3D"mailto:berrange@redhat.com" target=3D"_blank">berrange@redha=
t.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"">On Fri, Aug 05, 2016 at 10:23:58AM +0800, Kevin Zhao wrote:<br>
&gt; Hi All,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 I have a problem may about Qemu and kindly need yo=
ur help. Does<br>
&gt; qemu-system-aarch64 support virtio-9p ?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Recently I have tried to use qemu remapped the fil=
e from host to<br>
&gt; guest. As I know, Qemu has supported this so long as guest kernel has<=
br>
&gt; support 9p(virtfs). Reference to this link:<br>
&gt; <a href=3D"http://wiki.qemu.org/Documentation/9psetup" rel=3D"noreferr=
er" target=3D"_blank">http://wiki.qemu.org/<wbr>Documentation/9psetup</a><b=
r>
&gt; Fedora 24 AArch64 kernel has supported this:<br>
&gt; [root@sha-win-225 ~]# lsmod | grep 9p<br>
&gt; 9p=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A056273=C2=A0 0<br>
&gt; fscache=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 87449=
=C2=A0 1 9p<br>
&gt; 9pnet_virtio=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 9122=C2=A0 0<br>
&gt; 9pnet=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 83=
564=C2=A0 2 9p,9pnet_virtio<br>
&gt; virtio_ring=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 13866=C2=A0 5 vir=
tio_net,virtio_pci,9pnet_<br>
&gt; virtio,virtio_mmio,virtio_scsi<br>
&gt; virtio=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 9=
467=C2=A0 5 virtio_net,virtio_pci,9pnet_<br>
&gt; virtio,virtio_mmio,virtio_scsi<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Now I use virsh to launch the VM, and the correspon=
ding qemu command I<br>
&gt; have pasted here:<br>
&gt; <a href=3D"http://paste.openstack.org/show/549225/" rel=3D"noreferrer"=
 target=3D"_blank">http://paste.openstack.org/<wbr>show/549225/</a>.<br>
&gt;=C2=A0 =C2=A0 =C2=A0You can see that:<br>
</span>&gt; * -fsdev<br>
&gt; local,security_model=3Dmapped,<wbr>id=3Dfsdev-fs0,path=3D/var/lib/<wbr=
>libvirt/images/coreos<br>
&gt; -device<br>
&gt; virtio-9p-pci,id=3Dfs0,fsdev=3D<wbr>fsdev-fs0,mount_tag=3Dshare,bus=3D=
<wbr>pci.2,addr=3D0x1*<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0 Here is the command that remapped=
 the directory from host to guest.<br>
&gt; After VM launched, I use the command to mount:<br>
</span>&gt; * mount -t 9p -o trans=3Dvirtio share /tmp/shared/<br>
&gt; -oversion=3D9p2000.L,posixacl,<wbr>cache=3Dloose*<br>
<span class=3D"">&gt; But mount command will be blocked and output nothing.=
<br>
<br>
</span>Try using=C2=A0 version=3D9p2000.u instead - I&#39;ve noticed other =
versions have<br>
been buggy in various kernel version/qemu version combinations. The<br>
9p2000.u version is what i use in libvirt-sandobx and so I know it will<br>
work in general.<br>
<span class=3D""><br>
&gt;=C2=A0 =C2=A0 =C2=A0 The Qemu version is QEMU emulator version 2.5.0 (D=
ebian<br>
&gt; 1:2.5+dfsg-5ubuntu10.2). Besides test fedora24 guest, I have got the s=
ame<br>
&gt; problem in Debian jessie.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Kindly need your help~You will be really app=
reciated.<br>
<br>
</span>Regards,<br>
Daniel<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
|: <a href=3D"http://berrange.com" rel=3D"noreferrer" target=3D"_blank">htt=
p://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http:/=
/www.flickr.com/photos/dberrange/" rel=3D"noreferrer" target=3D"_blank">htt=
p://www.flickr.com/photos/<wbr>dberrange/</a> :|<br>
|: <a href=3D"http://libvirt.org" rel=3D"noreferrer" target=3D"_blank">http=
://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -o-=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://virt-manager=
.org" rel=3D"noreferrer" target=3D"_blank">http://virt-manager.org</a> :|<b=
r>
|: <a href=3D"http://autobuild.org" rel=3D"noreferrer" target=3D"_blank">ht=
tp://autobuild.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0<a href=3D"http://search.cpan.org/~danberr/" rel=3D"noreferrer=
" target=3D"_blank">http://search.cpan.org/~<wbr>danberr/</a> :|<br>
|: <a href=3D"http://entangle-photo.org" rel=3D"noreferrer" target=3D"_blan=
k">http://entangle-photo.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0=
 =C2=A0 =C2=A0<a href=3D"http://live.gnome.org/gtk-vnc" rel=3D"noreferrer" =
target=3D"_blank">http://live.gnome.org/gtk-vnc</a> :|<br>
</font></span></blockquote></div><br></div>

--94eb2c1259066b12070539503fdc--
--94eb2c1259066b12080539503fdd
Content-Type: image/png; name="image.png"
Content-Disposition: inline; filename="image.png"
Content-Transfer-Encoding: base64
Content-ID: <ii_1565a23ea85d3680>
X-Attachment-Id: ii_1565a23ea85d3680

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
AAAASUVORK5CYII=
--94eb2c1259066b12080539503fdd--
