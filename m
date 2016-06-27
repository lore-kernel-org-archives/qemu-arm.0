Received: by 10.25.21.96 with SMTP id l93csp1106360lfi;
        Mon, 27 Jun 2016 06:05:50 -0700 (PDT)
X-Received: by 10.55.127.130 with SMTP id a124mr12457728qkd.66.1467032750591;
        Mon, 27 Jun 2016 06:05:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p133si17049438qka.32.2016.06.27.06.05.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Jun 2016 06:05:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58609 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHWEX-0001ab-UW
	for alex.bennee@linaro.org; Mon, 27 Jun 2016 09:05:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60056)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bHWER-0001Z1-MV
	for qemu-arm@nongnu.org; Mon, 27 Jun 2016 09:05:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bHWEM-0000bi-Og
	for qemu-arm@nongnu.org; Mon, 27 Jun 2016 09:05:43 -0400
Received: from mail-qk0-x229.google.com ([2607:f8b0:400d:c09::229]:35586)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bHWEM-0000bN-DM
	for qemu-arm@nongnu.org; Mon, 27 Jun 2016 09:05:38 -0400
Received: by mail-qk0-x229.google.com with SMTP id a125so4379976qkc.2
	for <qemu-arm@nongnu.org>; Mon, 27 Jun 2016 06:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GzI0zQ4NH/os5LFHmO+Yfl24CG80bAHpF6f78j/adQU=;
	b=jylI/Q0EfytzGLlErYNo18xmEN5hwd4Gw5DfN5WYQKhN/qMB1sGE4ECB+i0nNfEzVU
	ItjecVNT4uKzmbTNfP0Z/IiL+5bDojm/Ab8OwokupVgws/iS4yYmgNKjC5fp2yp6SDSf
	ASBOrOGyrI+IMYVvksgRhLPp6AZttpcpRD6P8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GzI0zQ4NH/os5LFHmO+Yfl24CG80bAHpF6f78j/adQU=;
	b=FozmMxSFC3aLwwVBtKLc1s5SZ/G+NKgVSsMP+QDMwudsrNFLGdKoSyFfS/kJsig5dg
	6SC9/aT++aXNmp0hOmG9hgkgc9xWm5orV3PB+Xew0TNFzBnqow7umqvWjvO6DuezRk4P
	cpYOmokbP6c/wMSNT/XZ1//ATFSznJeKYkEgkcmZeDYpsm/l3sbrCUU4j/lpMTGfskaY
	mMiPIRR/KU8SW4jWAAt6Kca0vnDBb4UqYl5HhK5FhXO88hkl/qdHOGuS6h9lFpR7n3sw
	gSq1LswRSdRIhRb8EMlOluApRSsHS6BPfiUpAVfcBKECX4AhSXhQdQIkWDaNjeIMdU/I
	tqeQ==
X-Gm-Message-State: ALyK8tKV443BOToqqJ15Hpo228wpBXhpP9CaXnRoIHAAP2StMY7gCU913Bb+rAZ0MNGumlle96xw9DCDL7e2VIqu
X-Received: by 10.55.33.138 with SMTP id f10mr16162299qki.86.1467032737208;
	Mon, 27 Jun 2016 06:05:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.46.25 with HTTP; Mon, 27 Jun 2016 06:05:36 -0700 (PDT)
In-Reply-To: <2431b67a-8602-4400-bdd8-d597ff62a13b@redhat.com>
References: <CAN76PtRzf2qAwkMi9PMCUCaUha+6EpFnA_TiBB_oWLVFEQ8yyw@mail.gmail.com>
	<CAFEAcA_SRt+uDMy=bAqktW=cGErYkMiAsNGBT7Jbyd1KRGtjxA@mail.gmail.com>
	<CAN76PtRjHq3NPetkobdT_e5O=OvuJ=Q+q+WKHggHo-ShfQAGCg@mail.gmail.com>
	<CAN76PtTSxkNDT+QQ3VicgyLC0LPYuo-7BaEp2AHkQXCfRLTUGg@mail.gmail.com>
	<2431b67a-8602-4400-bdd8-d597ff62a13b@redhat.com>
From: Kevin Zhao <kevin.zhao@linaro.org>
Date: Mon, 27 Jun 2016 21:05:36 +0800
Message-ID: <CAN76PtSMP_cdWXrbWOvchUDJMXNDwg5LjCxCHVTPEBTomS_ysw@mail.gmail.com>
To: Cole Robinson <crobinso@redhat.com>
Content-Type: multipart/mixed; boundary=001a113a0d162e25c00536422d8c
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::229
Subject: Re: [Qemu-arm] [Qemu-devel] Question about a qemu Aarch64 error
 when adding several SCSI disks
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
	Gema Gomez-Solano <gema.gomez-solano@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wH4PA4RYhkO/

--001a113a0d162e25c00536422d8c
Content-Type: multipart/alternative; boundary=001a113a0d162e25b70536422d8a

--001a113a0d162e25b70536422d8a
Content-Type: text/plain; charset=UTF-8

Hi Cole,

On 24 June 2016 at 19:35, Cole Robinson <crobinso@redhat.com> wrote:

> On 06/24/2016 12:58 AM, Kevin Zhao wrote:
> > Hi Peter,
> >      Follow your advice, I have complied the Qemu v2.6.
> > stack@u202158:~$ kvm --version
> > QEMU emulator version 2.6.50 (v2.6.0-1280-g6f1d2d1-dirty), Copyright (c)
> > 2003-2008 Fabrice Bellard
> >      With this newest version, I use virt-manager to create the guest ,
> the
> > xml file is in the attachment. But the Qemu return error when creating:
> >      *error: internal error: process exited while connecting to monitor:
> > qemu-system-aarch64: -device
> > pci-bridge,chassis_nr=2,id=pci,bus=pci,addr=0x1: Duplicate ID 'pci' for
> > device*
> >
>
> That's probably this libvirt issue fixed in 1.3.4 and later:
>
> https://www.redhat.com/archives/libvirt-users/2016-April/msg00030.html
>
> I suggest testing with libvirt.git as well, there's been aarch64 related
> patches trickling in regularly
>
> - Cole
>
>      Thanks for your valuable advice. Follow your advice, I have build the
upstream vesion
of libvirt. The libvirt  version is :
        root@u202158:/opt/stack/kevin/libvirt/daemon# ./libvirtd
        2016-06-27 12:11:03.501+0000: 28044: info : libvirt version: 2.0.0
I stopped the system libvirtd-bin and libvirt-guests , then using libvirtd
above.

Also I have replace the system Qemu with the Qemu 2.6.50 which I have built
from upstream :
        root@u202158:/opt/stack/kevin/libvirt# qemu-system-aarch64 --version
        QEMU emulator version 2.6.50 (v2.6.0-1280-g6f1d2d1-dirty),
Copyright (c) 2003-2008 Fabrice Bellard
Using this XML in the attachment:
        Then Run virsh command to create guest:
        root@u202158:/opt/stack/kevin/libvirt/tools# ./virsh create
/opt/stack/f23.xml --console
        error: Failed to create domain from /opt/stack/f23.xml
        error: internal error: process exited while connecting to monitor:
2016-06-27T12:45:23.807405Z qemu-system-aarch64: -drive
file=/var/lib/libvirt/qemu/nvram/f23_VARS.fd,if=pflash,format=raw,unit=1:
Could not open         '/var/lib/libvirt/qemu/nvram/f23_VARS.fd':
Permission denied

Here I met the permission problem and I'm not sure where is wrong. If I use
origin qemu-system-aarch64(installed by apt-get),I will not meet the
problem of permission..Kindly need your help, you will be really
appreciated,,,   :D
$ls -l /usr/bin/qemu-system-aarch64
-rwxr-xr-x 1 root root 26935520 Jun 27 10:56 /usr/bin/qemu-system-aarch64
 $ls -l /var/lib/libvirt/qemu/nvram/f23_VARS.fd
-rw------- 1 root root 67108864 Jun 20 07:27
/var/lib/libvirt/qemu/nvram/f23_VARS.fd



> >      The guest xml file in in attachment. But the XML worked when Qemu is
> > v2.4.0.
> >       Also I delete the items in the xml :
> >   -  <controller type='pci' index='0' model='pcie-root'/>
> >   -  <controller type='pci' index='1' model='dmi-to-pci-bridge'>
> >   -    <model name='i82801b11-bridge'/>
> >   -    <address type='pci' domain='0x0000' bus='0x00' slot='0x01'
> > function='0x0'/>
> >   -  </controller>
> >   -  <controller type='pci' index='2' model='pci-bridge'>
> >   -    <model name='pci-bridge'/>
> >   -    <target chassisNr='2'/>
> >   -    <address type='pci' domain='0x0000' bus='0x01' slot='0x01'
> > function='0x0'/>
> >   -  </controller>
> >       Using virsh create guest.xml, got the error too :
> >       *error: internal error: process exited while connecting to monitor:
> > qemu-system-aarch64: -device
> > pci-bridge,chassis_nr=2,id=pci,bus=pci,addr=0x1: Duplicate ID 'pci' for
> > device.*
> > My test machine is Softiron, with AMD* ARM64 *server CPU. The  libvirt
> > version is 1.3.1
> >
> >      Kindly need your help. You will be really appreciated :-)
> >      Big Thanks~
> >
>
>

--001a113a0d162e25b70536422d8a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Cole,<div class=3D"gmail_extra"><br><div class=3D"gmail=
_quote">On 24 June 2016 at 19:35, Cole Robinson <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:crobinso@redhat.com" target=3D"_blank">crobinso@redhat.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-co=
lor:rgb(204,204,204);padding-left:1ex"><span class=3D"">On 06/24/2016 12:58=
 AM, Kevin Zhao wrote:<br>
&gt; Hi Peter,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Follow your advice, I have complied the Qemu v2.6.=
<br>
&gt; stack@u202158:~$ kvm --version<br>
&gt; QEMU emulator version 2.6.50 (v2.6.0-1280-g6f1d2d1-dirty), Copyright (=
c)<br>
&gt; 2003-2008 Fabrice Bellard<br>
&gt;=C2=A0 =C2=A0 =C2=A0 With this newest version, I use virt-manager to cr=
eate the guest , the<br>
&gt; xml file is in the attachment. But the Qemu return error when creating=
:<br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0 *error: internal error: process exited whil=
e connecting to monitor:<br>
<span class=3D"">&gt; qemu-system-aarch64: -device<br>
&gt; pci-bridge,chassis_nr=3D2,id=3Dpci,bus=3Dpci,addr=3D0x1: Duplicate ID =
&#39;pci&#39; for<br>
</span>&gt; device*<br>
&gt;<br>
<br>
That&#39;s probably this libvirt issue fixed in 1.3.4 and later:<br>
<br>
<a href=3D"https://www.redhat.com/archives/libvirt-users/2016-April/msg0003=
0.html" rel=3D"noreferrer" target=3D"_blank">https://www.redhat.com/archive=
s/libvirt-users/2016-April/msg00030.html</a><br>
<br>
I suggest testing with libvirt.git as well, there&#39;s been aarch64 relate=
d<br>
patches trickling in regularly<br>
<br>
- Cole<br>
<span class=3D""><br></span></blockquote><div>=C2=A0 =C2=A0 =C2=A0Thanks fo=
r your valuable advice. Follow your advice, I have build the upstream vesio=
n</div><div>of libvirt. The libvirt =C2=A0version is :=C2=A0</div><div><div=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 root@u202158:/opt/stack/kevin/libvirt/daemon# =
./libvirtd</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 2016-06-27 12:11:03.501+00=
00: 28044: info : libvirt version: 2.0.0</div></div><div>I stopped the syst=
em libvirtd-bin and libvirt-guests , then using libvirtd above.</div><div><=
br></div><div>Also I have replace the system Qemu with the Qemu 2.6.50 whic=
h I have built from upstream :</div><div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 r=
oot@u202158:/opt/stack/kevin/libvirt# qemu-system-aarch64 --version</div><d=
iv>=C2=A0 =C2=A0 =C2=A0 =C2=A0 QEMU emulator version 2.6.50 (v2.6.0-1280-g6=
f1d2d1-dirty), Copyright (c) 2003-2008 Fabrice Bellard</div></div><div>Usin=
g this XML in the attachment:</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Then Ru=
n virsh command to create guest:=C2=A0</div><div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 root@u202158:/opt/stack/kevin/libvirt/tools# ./virsh create /opt/sta=
ck/f23.xml --console</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 error: Failed to=
 create domain from /opt/stack/f23.xml</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 error: internal error: process exited while connecting to monitor: 2016=
-06-27T12:45:23.807405Z qemu-system-aarch64: -drive file=3D/var/lib/libvirt=
/qemu/nvram/f23_VARS.fd,if=3Dpflash,format=3Draw,unit=3D1: Could not open =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;/var/lib/libvirt/qemu/nvram/f23_VARS.fd&#3=
9;: Permission denied</div></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</di=
v><div>Here I met the permission problem and I&#39;m not sure where is wron=
g. If I use origin qemu-system-aarch64(installed by apt-get),I will not mee=
t the problem of permission..Kindly need your help, you will be really appr=
eciated,,, =C2=A0 :D</div><div><div>$ls -l /usr/bin/qemu-system-aarch64</di=
v><div>-rwxr-xr-x 1 root root 26935520 Jun 27 10:56 /usr/bin/qemu-system-aa=
rch64</div></div><div><div>=C2=A0$ls -l /var/lib/libvirt/qemu/nvram/f23_VAR=
S.fd</div><div>-rw------- 1 root root 67108864 Jun 20 07:27 /var/lib/libvir=
t/qemu/nvram/f23_VARS.fd</div></div><div><br></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wi=
dth:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-=
left:1ex"><span class=3D"">
&gt;=C2=A0 =C2=A0 =C2=A0 The guest xml file in in attachment. But the XML w=
orked when Qemu is<br>
&gt; v2.4.0.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Also I delete the items in the xml :<br>
&gt;=C2=A0 =C2=A0-=C2=A0 &lt;controller type=3D&#39;pci&#39; index=3D&#39;0=
&#39; model=3D&#39;pcie-root&#39;/&gt;<br>
&gt;=C2=A0 =C2=A0-=C2=A0 &lt;controller type=3D&#39;pci&#39; index=3D&#39;1=
&#39; model=3D&#39;dmi-to-pci-bridge&#39;&gt;<br>
&gt;=C2=A0 =C2=A0-=C2=A0 =C2=A0 &lt;model name=3D&#39;i82801b11-bridge&#39;=
/&gt;<br>
&gt;=C2=A0 =C2=A0-=C2=A0 =C2=A0 &lt;address type=3D&#39;pci&#39; domain=3D&=
#39;0x0000&#39; bus=3D&#39;0x00&#39; slot=3D&#39;0x01&#39;<br>
&gt; function=3D&#39;0x0&#39;/&gt;<br>
&gt;=C2=A0 =C2=A0-=C2=A0 &lt;/controller&gt;<br>
&gt;=C2=A0 =C2=A0-=C2=A0 &lt;controller type=3D&#39;pci&#39; index=3D&#39;2=
&#39; model=3D&#39;pci-bridge&#39;&gt;<br>
&gt;=C2=A0 =C2=A0-=C2=A0 =C2=A0 &lt;model name=3D&#39;pci-bridge&#39;/&gt;<=
br>
&gt;=C2=A0 =C2=A0-=C2=A0 =C2=A0 &lt;target chassisNr=3D&#39;2&#39;/&gt;<br>
&gt;=C2=A0 =C2=A0-=C2=A0 =C2=A0 &lt;address type=3D&#39;pci&#39; domain=3D&=
#39;0x0000&#39; bus=3D&#39;0x01&#39; slot=3D&#39;0x01&#39;<br>
&gt; function=3D&#39;0x0&#39;/&gt;<br>
&gt;=C2=A0 =C2=A0-=C2=A0 &lt;/controller&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Using virsh create guest.xml, got the error =
too :<br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*error: internal error: process exite=
d while connecting to monitor:<br>
<span class=3D"">&gt; qemu-system-aarch64: -device<br>
&gt; pci-bridge,chassis_nr=3D2,id=3Dpci,bus=3Dpci,addr=3D0x1: Duplicate ID =
&#39;pci&#39; for<br>
</span>&gt; device.*<br>
&gt; My test machine is Softiron, with AMD* ARM64 *server CPU. The=C2=A0 li=
bvirt<br>
<div class=3D""><div class=3D"h5">&gt; version is 1.3.1<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Kindly need your help. You will be really apprecia=
ted :-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Big Thanks~<br>
&gt;<br>
<br>
</div></div></blockquote></div><br></div></div>

--001a113a0d162e25b70536422d8a--
--001a113a0d162e25c00536422d8c
Content-Type: text/xml; charset=US-ASCII; name="f23.xml"
Content-Disposition: attachment; filename="f23.xml"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ipy1eja80

PGRvbWFpbiB0eXBlPSdrdm0nIGlkPSc2Jz4KICA8bmFtZT5mMjM8L25hbWU+CiAgPHV1aWQ+ODc0
NjBhYzItOTkwMy00NDE4LTllNTQtZTcxM2JmMjhlMTJlPC91dWlkPgogIDxtZW1vcnkgdW5pdD0n
S2lCJz4yMDk3MTUyPC9tZW1vcnk+CiAgPGN1cnJlbnRNZW1vcnkgdW5pdD0nS2lCJz4yMDk3MTUy
PC9jdXJyZW50TWVtb3J5PgogIDx2Y3B1IHBsYWNlbWVudD0nc3RhdGljJz4yPC92Y3B1PgogIDxy
ZXNvdXJjZT4KICAgIDxwYXJ0aXRpb24+L21hY2hpbmU8L3BhcnRpdGlvbj4KICA8L3Jlc291cmNl
PgogIDxvcz4KICAgIDx0eXBlIGFyY2g9J2FhcmNoNjQnIG1hY2hpbmU9J3ZpcnQtMi42Jz5odm08
L3R5cGU+CiAgICA8bG9hZGVyIHJlYWRvbmx5PSd5ZXMnIHR5cGU9J3BmbGFzaCc+L3Vzci9zaGFy
ZS9BQVZNRi9BQVZNRl9DT0RFLmZkPC9sb2FkZXI+CiAgICA8bnZyYW0+L3Zhci9saWIvbGlidmly
dC9xZW11L252cmFtL2YyM19WQVJTLmZkPC9udnJhbT4KICAgIDxib290IGRldj0naGQnLz4KICA8
L29zPgogIDxjcHUgbW9kZT0naG9zdC1wYXNzdGhyb3VnaCcvPgogIDxjbG9jayBvZmZzZXQ9J3V0
YycvPgogIDxvbl9wb3dlcm9mZj5kZXN0cm95PC9vbl9wb3dlcm9mZj4KICA8b25fcmVib290PnJl
c3RhcnQ8L29uX3JlYm9vdD4KICA8b25fY3Jhc2g+cmVzdGFydDwvb25fY3Jhc2g+CiAgPGRldmlj
ZXM+CiAgICA8ZW11bGF0b3I+L3Vzci9iaW4va3ZtPC9lbXVsYXRvcj4KICAgIDxkaXNrIHR5cGU9
J2ZpbGUnIGRldmljZT0nZGlzayc+CiAgICAgIDxkcml2ZXIgbmFtZT0ncWVtdScgdHlwZT0ncWNv
dzInLz4KICAgICAgPHNvdXJjZSBmaWxlPScvdmFyL2xpYi9saWJ2aXJ0L2ltYWdlcy9mMjMucWNv
dzInLz4KICAgICAgPGJhY2tpbmdTdG9yZS8+CiAgICAgIDx0YXJnZXQgZGV2PSdzZGEnIGJ1cz0n
c2NzaScvPgogICAgICA8YWxpYXMgbmFtZT0nc2NzaTAtMC0wLTAnLz4KICAgICAgPGFkZHJlc3Mg
dHlwZT0nZHJpdmUnIGNvbnRyb2xsZXI9JzAnIGJ1cz0nMCcgdGFyZ2V0PScwJyB1bml0PScwJy8+
CiAgICA8L2Rpc2s+CiAgICA8ZGlzayB0eXBlPSdmaWxlJyBkZXZpY2U9J2Nkcm9tJz4KICAgICAg
PGRyaXZlciBuYW1lPSdxZW11JyB0eXBlPSdyYXcnLz4KICAgICAgPGJhY2tpbmdTdG9yZS8+CiAg
ICAgIDx0YXJnZXQgZGV2PSdzZGInIGJ1cz0nc2NzaScvPgogICAgICA8cmVhZG9ubHkvPgogICAg
ICA8YWxpYXMgbmFtZT0nc2NzaTAtMC0wLTEnLz4KICAgICAgPGFkZHJlc3MgdHlwZT0nZHJpdmUn
IGNvbnRyb2xsZXI9JzAnIGJ1cz0nMCcgdGFyZ2V0PScwJyB1bml0PScxJy8+CiAgICA8L2Rpc2s+
CiAgICA8Y29udHJvbGxlciB0eXBlPSdzY3NpJyBpbmRleD0nMCcgbW9kZWw9J3ZpcnRpby1zY3Np
Jz4KICAgICAgPGFsaWFzIG5hbWU9J3Njc2kwJy8+CiAgICAgIDxhZGRyZXNzIHR5cGU9J3ZpcnRp
by1tbWlvJy8+CiAgICA8L2NvbnRyb2xsZXI+CiAgICA8Y29udHJvbGxlciB0eXBlPSdwY2knIGlu
ZGV4PScwJyBtb2RlbD0ncGNpZS1yb290Jz4KICAgICAgPGFsaWFzIG5hbWU9J3BjaWUuMCcvPgog
ICAgPC9jb250cm9sbGVyPgogICAgPGNvbnRyb2xsZXIgdHlwZT0ncGNpJyBpbmRleD0nMScgbW9k
ZWw9J2RtaS10by1wY2ktYnJpZGdlJz4KICAgICAgPG1vZGVsIG5hbWU9J2k4MjgwMWIxMS1icmlk
Z2UnLz4KICAgICAgPGFsaWFzIG5hbWU9J3BjaS4xJy8+CiAgICAgIDxhZGRyZXNzIHR5cGU9J3Bj
aScgZG9tYWluPScweDAwMDAnIGJ1cz0nMHgwMCcgc2xvdD0nMHgwMScgZnVuY3Rpb249JzB4MCcv
PgogICAgPC9jb250cm9sbGVyPgogICAgPGNvbnRyb2xsZXIgdHlwZT0ncGNpJyBpbmRleD0nMicg
bW9kZWw9J3BjaS1icmlkZ2UnPgogICAgICA8bW9kZWwgbmFtZT0ncGNpLWJyaWRnZScvPgogICAg
ICA8dGFyZ2V0IGNoYXNzaXNOcj0nMicvPgogICAgICA8YWxpYXMgbmFtZT0ncGNpLjInLz4KICAg
ICAgPGFkZHJlc3MgdHlwZT0ncGNpJyBkb21haW49JzB4MDAwMCcgYnVzPScweDAxJyBzbG90PScw
eDAxJyBmdW5jdGlvbj0nMHgwJy8+CiAgICA8L2NvbnRyb2xsZXI+CiAgICA8c2VyaWFsIHR5cGU9
J3B0eSc+CiAgICAgIDxzb3VyY2UgcGF0aD0nL2Rldi9wdHMvNycvPgogICAgICA8dGFyZ2V0IHBv
cnQ9JzAnLz4KICAgICAgPGFsaWFzIG5hbWU9J3NlcmlhbDAnLz4KICAgIDwvc2VyaWFsPgogICAg
PGNvbnNvbGUgdHlwZT0ncHR5JyB0dHk9Jy9kZXYvcHRzLzcnPgogICAgICA8c291cmNlIHBhdGg9
Jy9kZXYvcHRzLzcnLz4KICAgICAgPHRhcmdldCB0eXBlPSdzZXJpYWwnIHBvcnQ9JzAnLz4KICAg
ICAgPGFsaWFzIG5hbWU9J3NlcmlhbDAnLz4KICAgIDwvY29uc29sZT4KICA8L2RldmljZXM+Cjwv
ZG9tYWluPgoK
--001a113a0d162e25c00536422d8c--
