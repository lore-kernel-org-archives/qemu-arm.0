Received: by 10.25.21.96 with SMTP id l93csp858046lfi;
        Thu, 23 Jun 2016 21:58:40 -0700 (PDT)
X-Received: by 10.55.16.27 with SMTP id a27mr620321qkh.34.1466744320255;
        Thu, 23 Jun 2016 21:58:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 5si143298qki.184.2016.06.23.21.58.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 21:58:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40782 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGJCR-00037d-NT
	for alex.bennee@linaro.org; Fri, 24 Jun 2016 00:58:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bGJCM-00034Z-MQ
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 00:58:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bGJCL-0001A7-1u
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 00:58:34 -0400
Received: from mail-qk0-x22b.google.com ([2607:f8b0:400d:c09::22b]:32933)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bGJCK-000192-H0
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 00:58:32 -0400
Received: by mail-qk0-x22b.google.com with SMTP id a186so133217672qkf.0
	for <qemu-arm@nongnu.org>; Thu, 23 Jun 2016 21:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gdnlox+J0XKYU//kPW1U1V69F6mn2GWoNycoBdL1pMg=;
	b=Yx/lwHNkhP/q5XoO32W4ftNxoYENJkPErcbODJ/6hgdjAGHY+h+HMPqUIilST2ipjE
	oDPhdwrXaMNMaNZ0sXSB2aW6Y5B1YeCv4zmjmY0A4oo7Sd/LfgwyD6LE4BEpo9vKKfDp
	H1UinSD1FS6jHsWY6xdxC57Nv9C9C/XrNcj7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gdnlox+J0XKYU//kPW1U1V69F6mn2GWoNycoBdL1pMg=;
	b=cJcbZqXHYfkhJ/Pch+3akHqK6AossE1UzT6rUC41BJCmGtYaismEF3Mq2r/JlVbUei
	FBFkOR1BpNCO3iRXqmE4r2xl/ZDSamIn15pe1SV8dVl87GdgGQB71jqZpn6OGbqQChvM
	efJHJB/56l96+nY2AQ7ktwATOZh/m9E+u9JX3who+V5k+JeUkog5hWkbUlb0E64hIWG3
	rh6GJc0FCeyWdjxDPAuRXkkaFAYZOh28IDbjp8w/5MMe6FnpcmaqVxnnCaQWqzPJIPxS
	H2+7cwvaNNxqFCdJQcbrcBhKK1cFHMFC3Vlk5/SnhDC/vcSzVsDEbEHLfOH0X3noTHnU
	MCSg==
X-Gm-Message-State: ALyK8tIFGru8X07wtf7QU5gEaJMPtXzVaJrGUJogEIkPjPt77DQIJ+KrsAmZKQu57SZe/5ANH1nOLwC0ogx3BMFE
X-Received: by 10.55.137.71 with SMTP id l68mr2408902qkd.17.1466744311625;
	Thu, 23 Jun 2016 21:58:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.46.25 with HTTP; Thu, 23 Jun 2016 21:58:31 -0700 (PDT)
In-Reply-To: <CAN76PtRjHq3NPetkobdT_e5O=OvuJ=Q+q+WKHggHo-ShfQAGCg@mail.gmail.com>
References: <CAN76PtRzf2qAwkMi9PMCUCaUha+6EpFnA_TiBB_oWLVFEQ8yyw@mail.gmail.com>
	<CAFEAcA_SRt+uDMy=bAqktW=cGErYkMiAsNGBT7Jbyd1KRGtjxA@mail.gmail.com>
	<CAN76PtRjHq3NPetkobdT_e5O=OvuJ=Q+q+WKHggHo-ShfQAGCg@mail.gmail.com>
From: Kevin Zhao <kevin.zhao@linaro.org>
Date: Fri, 24 Jun 2016 12:58:31 +0800
Message-ID: <CAN76PtTSxkNDT+QQ3VicgyLC0LPYuo-7BaEp2AHkQXCfRLTUGg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/mixed; boundary=94eb2c072ed0ac55620535ff0563
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::22b
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nE1nIJXeTC6q

--94eb2c072ed0ac55620535ff0563
Content-Type: multipart/alternative; boundary=94eb2c072ed0ac555e0535ff0561

--94eb2c072ed0ac555e0535ff0561
Content-Type: text/plain; charset=UTF-8

Hi Peter,
     Follow your advice, I have complied the Qemu v2.6.
stack@u202158:~$ kvm --version
QEMU emulator version 2.6.50 (v2.6.0-1280-g6f1d2d1-dirty), Copyright (c)
2003-2008 Fabrice Bellard
     With this newest version, I use virt-manager to create the guest , the
xml file is in the attachment. But the Qemu return error when creating:
     *error: internal error: process exited while connecting to monitor:
qemu-system-aarch64: -device
pci-bridge,chassis_nr=2,id=pci,bus=pci,addr=0x1: Duplicate ID 'pci' for
device*

     The guest xml file in in attachment. But the XML worked when Qemu is
v2.4.0.
      Also I delete the items in the xml :
  -  <controller type='pci' index='0' model='pcie-root'/>
  -  <controller type='pci' index='1' model='dmi-to-pci-bridge'>
  -    <model name='i82801b11-bridge'/>
  -    <address type='pci' domain='0x0000' bus='0x00' slot='0x01'
function='0x0'/>
  -  </controller>
  -  <controller type='pci' index='2' model='pci-bridge'>
  -    <model name='pci-bridge'/>
  -    <target chassisNr='2'/>
  -    <address type='pci' domain='0x0000' bus='0x01' slot='0x01'
function='0x0'/>
  -  </controller>
      Using virsh create guest.xml, got the error too :
      *error: internal error: process exited while connecting to monitor:
qemu-system-aarch64: -device
pci-bridge,chassis_nr=2,id=pci,bus=pci,addr=0x1: Duplicate ID 'pci' for
device.*
My test machine is Softiron, with AMD* ARM64 *server CPU. The  libvirt
version is 1.3.1

     Kindly need your help. You will be really appreciated :-)
     Big Thanks~

Best Regards,
Kevin Zhao


On 22 June 2016 at 20:34, Kevin Zhao <kevin.zhao@linaro.org> wrote:

> Hi Peter,
>    Should I use the newest version v 2.6.0 ?
>
> On 22 June 2016 at 20:04, Peter Maydell <peter.maydell@linaro.org> wrote:
>
>> On 22 June 2016 at 12:51, Kevin Zhao <kevin.zhao@linaro.org> wrote:
>> > Hi All,
>> >        Greetings from Linaro. This is Kevin from Linaro, and recently I
>> > have met a problem of qemu-system-aarch64 when I am working on
>> virt-manager.
>> >        I have reported a bug here:
>> > https://bugs.launchpad.net/qemu/+bug/1594239
>> >
>> >        It's mainly bout adding several SCSI disks to Aarch64 guests.
>> >        If you have a moment, pls kindly give some advice about
>> this.Thanks
>>
>> Can you reproduce the bug with a newer version of QEMU?
>>
>> thanks
>> -- PMM
>>
>
>

--94eb2c072ed0ac555e0535ff0561
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Peter,<div>=C2=A0 =C2=A0 =C2=A0Follow your advice, I ha=
ve complied the Qemu v2.6.=C2=A0</div><div><div>stack@u202158:~$ kvm --vers=
ion</div><div>QEMU emulator version 2.6.50 (v2.6.0-1280-g6f1d2d1-dirty), Co=
pyright (c) 2003-2008 Fabrice Bellard</div></div><div>=C2=A0 =C2=A0 =C2=A0W=
ith this newest version, I use virt-manager to create the guest , the xml f=
ile is in the attachment. But the Qemu return error when creating:</div><di=
v>=C2=A0 =C2=A0 =C2=A0<b>error: internal error: process exited while connec=
ting to monitor: qemu-system-aarch64: -device pci-bridge,chassis_nr=3D2,id=
=3Dpci,bus=3Dpci,addr=3D0x1: Duplicate ID &#39;pci&#39; for device</b><br><=
/div><div><b><br></b></div><div><b>=C2=A0 =C2=A0 =C2=A0</b>The guest xml fi=
le in in attachment. But the XML worked when Qemu is v2.4.0.</div><div>=C2=
=A0 =C2=A0 =C2=A0 Also I delete the items in the xml :=C2=A0</div><div><div=
>=C2=A0 - =C2=A0&lt;controller type=3D&#39;pci&#39; index=3D&#39;0&#39; mod=
el=3D&#39;pcie-root&#39;/&gt;</div><div>=C2=A0 - =C2=A0&lt;controller type=
=3D&#39;pci&#39; index=3D&#39;1&#39; model=3D&#39;dmi-to-pci-bridge&#39;&gt=
;</div><div>=C2=A0 - =C2=A0 =C2=A0&lt;model name=3D&#39;i82801b11-bridge&#3=
9;/&gt;</div><div>=C2=A0 - =C2=A0 =C2=A0&lt;address type=3D&#39;pci&#39; do=
main=3D&#39;0x0000&#39; bus=3D&#39;0x00&#39; slot=3D&#39;0x01&#39; function=
=3D&#39;0x0&#39;/&gt;</div><div>=C2=A0 - =C2=A0&lt;/controller&gt;</div><di=
v>=C2=A0 - =C2=A0&lt;controller type=3D&#39;pci&#39; index=3D&#39;2&#39; mo=
del=3D&#39;pci-bridge&#39;&gt;</div><div>=C2=A0 - =C2=A0 =C2=A0&lt;model na=
me=3D&#39;pci-bridge&#39;/&gt;</div><div>=C2=A0 - =C2=A0 =C2=A0&lt;target c=
hassisNr=3D&#39;2&#39;/&gt;</div><div>=C2=A0 - =C2=A0 =C2=A0&lt;address typ=
e=3D&#39;pci&#39; domain=3D&#39;0x0000&#39; bus=3D&#39;0x01&#39; slot=3D&#3=
9;0x01&#39; function=3D&#39;0x0&#39;/&gt;</div><div>=C2=A0 - =C2=A0&lt;/con=
troller&gt;</div></div><div>=C2=A0 =C2=A0 =C2=A0 Using virsh create guest.x=
ml, got the error too :</div><div>=C2=A0 =C2=A0 =C2=A0=C2=A0<b>error: inter=
nal error: process exited while connecting to monitor: qemu-system-aarch64:=
 -device pci-bridge,chassis_nr=3D2,id=3Dpci,bus=3Dpci,addr=3D0x1: Duplicate=
 ID &#39;pci&#39; for device.</b><br></div><div>My test machine is Softiron=
, with AMD<b> ARM64 </b>server CPU. The =C2=A0libvirt version is 1.3.1</div=
><div>=C2=A0 =C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0Kindly need =
your help. You will be really appreciated :-)</div><div>=C2=A0 =C2=A0 =C2=
=A0Big Thanks~</div><div><br></div><div>Best Regards,</div><div>Kevin Zhao<=
/div><div><br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmai=
l_quote">On 22 June 2016 at 20:34, Kevin Zhao <span dir=3D"ltr">&lt;<a href=
=3D"mailto:kevin.zhao@linaro.org" target=3D"_blank">kevin.zhao@linaro.org</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi =
Peter,<div>=C2=A0 =C2=A0Should I use the newest version v 2.6.0 ?</div></di=
v><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"><br><d=
iv class=3D"gmail_quote">On 22 June 2016 at 20:04, Peter Maydell <span dir=
=3D"ltr">&lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">=
peter.maydell@linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><span>On 22 June 2016 at 12:51, Kevin Zhao &lt;<a href=3D"mailto:kevi=
n.zhao@linaro.org" target=3D"_blank">kevin.zhao@linaro.org</a>&gt; wrote:<b=
r>
&gt; Hi All,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Greetings from Linaro. This is Kevin from L=
inaro, and recently I<br>
&gt; have met a problem of qemu-system-aarch64 when I am working on virt-ma=
nager.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 I have reported a bug here:<br>
&gt; <a href=3D"https://bugs.launchpad.net/qemu/+bug/1594239" rel=3D"norefe=
rrer" target=3D"_blank">https://bugs.launchpad.net/qemu/+bug/1594239</a><br=
>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 It&#39;s mainly bout adding several SCSI di=
sks to Aarch64 guests.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 If you have a moment, pls kindly give some =
advice about this.Thanks<br>
<br>
</span>Can you reproduce the bug with a newer version of QEMU?<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--94eb2c072ed0ac555e0535ff0561--
--94eb2c072ed0ac55620535ff0563
Content-Type: text/xml; charset=US-ASCII; name="guest.xml"
Content-Disposition: attachment; filename="guest.xml"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ipt9jhqi0

PGRvbWFpbiB0eXBlPSdrdm0nPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQogIDxuYW1lPmdl
bmVyaWM8L25hbWU+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCiAgPHV1aWQ+M2U1NDEzOTUtMjhj
MS00MWY2LWJhN2EtMTRiNjQ4ZjgyZDg0PC91dWlkPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIA0KICA8bWVtb3J5IHVuaXQ9J0tpQic+MTA0ODU3Njwv
bWVtb3J5PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgDQogIDxjdXJyZW50TWVtb3J5IHVuaXQ9J0tpQic+MTA0ODU3NjwvY3Vy
cmVudE1lbW9yeT4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICANCiAgPHZjcHUgcGxhY2VtZW50PSdzdGF0aWMnPjE8L3ZjcHU+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KICA8
b3M+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQogICAgPHR5cGUgYXJj
aD0nYWFyY2g2NCcgbWFjaGluZT0ndmlydC0yLjcnPmh2bTwvdHlwZT4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCiAgICA8bG9hZGVyIHJlYWRvbmx5PSd5
ZXMnIHR5cGU9J3BmbGFzaCc+L3Vzci9zaGFyZS9BQVZNRi9BQVZNRl9DT0RFLmZkPC9sb2FkZXI+
ICAgICAgICAgICAgICAgICAgICAgIA0KICAgIDxudnJhbT4vdmFyL2xpYi9saWJ2aXJ0L3FlbXUv
bnZyYW0vZ2VuZXJpY19WQVJTLmZkPC9udnJhbT4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgDQogICAgPGJvb3QgZGV2PSdoZCcvPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICANCiAgPC9vcz4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KICA8Y3B1
IG1vZGU9J2hvc3QtcGFzc3Rocm91Z2gnLz4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQogIDxjbG9jayBvZmZzZXQ9
J3V0YycvPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCiAgPG9uX3Bvd2Vyb2ZmPmRlc3Ryb3k8L29u
X3Bvd2Vyb2ZmPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIA0KICA8b25fcmVib290PnJlc3RhcnQ8L29uX3JlYm9vdD4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgDQogIDxvbl9jcmFzaD5yZXN0YXJ0PC9vbl9jcmFzaD4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAN
CiAgPGRldmljZXM+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KICAgIDxlbXVs
YXRvcj4vdXNyL2Jpbi9rdm08L2VtdWxhdG9yPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQogICAgPGRpc2sgdHlwZT0nZmls
ZScgZGV2aWNlPSdkaXNrJz4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICANCiAgICAgIDxkcml2ZXIgbmFtZT0ncWVtdScgdHlw
ZT0ncWNvdzInLz4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIA0KICAgICAgPHNvdXJjZSBmaWxlPScvdmFyL2xpYi9saWJ2aXJ0L2lt
YWdlcy9mMjMucWNvdzInLz4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgDQogICAgICA8dGFyZ2V0IGRldj0nc2RhJyBidXM9J3Njc2knLz4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCiAg
ICAgIDxhZGRyZXNzIHR5cGU9J2RyaXZlJyBjb250cm9sbGVyPScwJyBidXM9JzAnIHRhcmdldD0n
MCcgdW5pdD0nMCcvPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KICAgIDwvZGlzaz4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIA0KICAgIDxjb250cm9sbGVyIHR5cGU9J3Njc2knIGluZGV4PScwJyBtb2RlbD0n
dmlydGlvLXNjc2knPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
DQogICAgICA8YWRkcmVzcyB0eXBlPSd2aXJ0aW8tbW1pbycvPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCiAgICA8L2Nv
bnRyb2xsZXI+IA0KICAgIDxjb250cm9sbGVyIHR5cGU9J3BjaScgaW5kZXg9JzAnIG1vZGVsPSdw
Y2llLXJvb3QnLz4NCiAgICA8Y29udHJvbGxlciB0eXBlPSdwY2knIGluZGV4PScxJyBtb2RlbD0n
ZG1pLXRvLXBjaS1icmlkZ2UnPg0KICAgICAgPG1vZGVsIG5hbWU9J2k4MjgwMWIxMS1icmlkZ2Un
Lz4NCiAgICAgIDxhZGRyZXNzIHR5cGU9J3BjaScgZG9tYWluPScweDAwMDAnIGJ1cz0nMHgwMCcg
c2xvdD0nMHgwMScgZnVuY3Rpb249JzB4MCcvPg0KICAgIDwvY29udHJvbGxlcj4NCiAgICA8Y29u
dHJvbGxlciB0eXBlPSdwY2knIGluZGV4PScyJyBtb2RlbD0ncGNpLWJyaWRnZSc+DQogICAgICA8
bW9kZWwgbmFtZT0ncGNpLWJyaWRnZScvPg0KICAgICAgPHRhcmdldCBjaGFzc2lzTnI9JzInLz4N
CiAgICAgIDxhZGRyZXNzIHR5cGU9J3BjaScgZG9tYWluPScweDAwMDAnIGJ1cz0nMHgwMScgc2xv
dD0nMHgwMScgZnVuY3Rpb249JzB4MCcvPg0KICAgIDwvY29udHJvbGxlcj4NCiAgICAgPGludGVy
ZmFjZSB0eXBlPSJuZXR3b3JrIj4NCiAgICAgIDxzb3VyY2UgbmV0d29yaz0iZGVmYXVsdCIvPg0K
ICAgICAgPG1hYyBhZGRyZXNzPSI1Mjo1NDowMDoyNzphYTplNSIvPg0KICAgICAgPG1vZGVsIHR5
cGU9InZpcnRpbyIvPg0KICAgIDwvaW50ZXJmYWNlPg0KICAgIDxzZXJpYWwgdHlwZT0ncHR5Jz4N
CiAgICAgIDx0YXJnZXQgcG9ydD0nMCcvPg0KICAgIDwvc2VyaWFsPg0KICAgIDxjb25zb2xlIHR5
cGU9J3B0eSc+DQogICAgICA8dGFyZ2V0IHR5cGU9J3NlcmlhbCcgcG9ydD0nMCcvPg0KICAgIDwv
Y29uc29sZT4NCiAgPC9kZXZpY2VzPg0KPC9kb21haW4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAg
--94eb2c072ed0ac55620535ff0563--
