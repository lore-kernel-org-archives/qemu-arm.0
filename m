Received: by 10.25.21.156 with SMTP id 28csp1575177lfv;
        Thu, 4 Aug 2016 19:24:09 -0700 (PDT)
X-Received: by 10.55.101.71 with SMTP id z68mr10516645qkb.189.1470363849424;
        Thu, 04 Aug 2016 19:24:09 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n185si7560007qkd.242.2016.08.04.19.24.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Aug 2016 19:24:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42440 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bVUnv-0002n9-Rp
	for alex.bennee@linaro.org; Thu, 04 Aug 2016 22:24:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42211)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bVUnr-0002ln-0Z
	for qemu-arm@nongnu.org; Thu, 04 Aug 2016 22:24:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bVUno-0004qZ-IY
	for qemu-arm@nongnu.org; Thu, 04 Aug 2016 22:24:01 -0400
Received: from mail-ua0-x22c.google.com ([2607:f8b0:400c:c08::22c]:35111)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bVUno-0004qF-3N
	for qemu-arm@nongnu.org; Thu, 04 Aug 2016 22:24:00 -0400
Received: by mail-ua0-x22c.google.com with SMTP id i31so42704725uai.2
	for <qemu-arm@nongnu.org>; Thu, 04 Aug 2016 19:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=sEh0mIbNAabwmeQE4tSNnL/T0fW/7Mh669v5kb0T+qk=;
	b=YPYhTXlvoF40LRSf5slaPHpVAiZSRFtI0XysNk58MgTtuaj+dbGvAtXK6bRkwhMT4N
	OHn6xInAXz3UTHneaYda3IeuU8qT+7U10g9UpYjtMbDHviqpjBM/Pws8cvia5+ZHIR2Q
	1mS3BJRgXCEN0SDby1+HKbJ+gYJyRWIKHat84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=sEh0mIbNAabwmeQE4tSNnL/T0fW/7Mh669v5kb0T+qk=;
	b=m6T0+5IL9noKZQ7NdQ607O6W4yRmdsrugqhM4zZyzdxGdbirFJ8u8sDiba8dEiVwO5
	MvrIJxV6Zyj/HivjpEZ+W7MZf/wKAmkUbIygtGwWliRA7O/BtlrTQHn5h3my94wcZlhe
	SZ5loWu79MJx1G7AOfcWkHWYkOtuSp5EtvDwHVW/mDKaV//ELLtE5J/2xfalem5DNDOe
	MHBa3cui5L0HXXiyFbwOIjv2pXfIoQgj8W0Bg0U2DBxEuaUJ9mfzFPNt4GHtX1CnRrfX
	9r++sowODv6U22EKv1kqi38CqWl9yXylYklyE4Ccsgg3283zmsHtR2F7jkQZ24BJKEO7
	uBww==
X-Gm-Message-State: AEkoousoO6mLJ8FeYsiNBCIKVZS3MAaVOLKaf+IP3+nlviAgU8bnwLkA0xY9drdxrHR/V1HlXqY5hSSw2aFGAkr/
X-Received: by 10.176.1.245 with SMTP id 108mr38873172ual.45.1470363838957;
	Thu, 04 Aug 2016 19:23:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.41.34 with HTTP; Thu, 4 Aug 2016 19:23:58 -0700 (PDT)
From: Kevin Zhao <kevin.zhao@linaro.org>
Date: Fri, 5 Aug 2016 10:23:58 +0800
Message-ID: <CAN76PtTfrRFDNDXHFiOvavk4EkOqdXvfKOYJh5AmZPzErxmOkw@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary=001a113e4b764fe2e1053949c2ff
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22c
Subject: [Qemu-arm] [Help]: Does qemu-system-aarch64 support virtio-9p? I
 got a problem when remap host file to guest in AArch64.
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ceNBjQaODZ2R

--001a113e4b764fe2e1053949c2ff
Content-Type: text/plain; charset=UTF-8

Hi All,
     I have a problem may about Qemu and kindly need your help. Does
qemu-system-aarch64 support virtio-9p ?
     Recently I have tried to use qemu remapped the file from host to
guest. As I know, Qemu has supported this so long as guest kernel has
support 9p(virtfs). Reference to this link:
http://wiki.qemu.org/Documentation/9psetup
Fedora 24 AArch64 kernel has supported this:
[root@sha-win-225 ~]# lsmod | grep 9p
9p                     56273  0
fscache                87449  1 9p
9pnet_virtio            9122  0
9pnet                  83564  2 9p,9pnet_virtio
virtio_ring            13866  5 virtio_net,virtio_pci,9pnet_
virtio,virtio_mmio,virtio_scsi
virtio                  9467  5 virtio_net,virtio_pci,9pnet_
virtio,virtio_mmio,virtio_scsi

    Now I use virsh to launch the VM, and the corresponding qemu command I
have pasted here:
http://paste.openstack.org/show/549225/.
    You can see that:
* -fsdev
local,security_model=mapped,id=fsdev-fs0,path=/var/lib/libvirt/images/coreos
-device
virtio-9p-pci,id=fs0,fsdev=fsdev-fs0,mount_tag=share,bus=pci.2,addr=0x1*
     Here is the command that remapped the directory from host to guest.
After VM launched, I use the command to mount:
* mount -t 9p -o trans=virtio share /tmp/shared/
-oversion=9p2000.L,posixacl,cache=loose*
But mount command will be blocked and output nothing.
     The Qemu version is QEMU emulator version 2.5.0 (Debian
1:2.5+dfsg-5ubuntu10.2). Besides test fedora24 guest, I have got the same
problem in Debian jessie.
      Kindly need your help~You will be really appreciated.

Best Regards,
Kevin Zhao

--001a113e4b764fe2e1053949c2ff
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"font-size:12.8px">Hi All,<span style=3D"font=
-size:12.8px">=C2=A0 =C2=A0 =C2=A0</span></div><div style=3D"font-size:12.8=
px">=C2=A0 =C2=A0 =C2=A0I have a problem may about Qemu and kindly need you=
r help. Does qemu-system-aarch64 support virtio-9p ?</div><div style=3D"fon=
t-size:12.8px">=C2=A0 =C2=A0 =C2=A0Recently I have tried to use qemu remapp=
ed the file from host to guest. As I know, Qemu has supported this so long =
as guest kernel has support 9p(virtfs). Reference to this link:</div><div s=
tyle=3D"font-size:12.8px"><a href=3D"http://wiki.qemu.org/Documentation/9ps=
etup" rel=3D"noreferrer" target=3D"_blank" style=3D"font-size:12.8px">http:=
//wiki.qemu.org/<wbr>Documentation/9psetup</a><br></div><div style=3D"font-=
size:12.8px">Fedora 24 AArch64 kernel has supported this:</div><div style=
=3D"font-size:12.8px"><span style=3D"background-color:rgb(204,204,204)">[ro=
ot@sha-win-225 ~]# lsmod | grep 9p</span></div><div style=3D"font-size:12.8=
px"><span style=3D"background-color:rgb(204,204,204)">9p =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 56273 =C2=A00</span></=
div><div style=3D"font-size:12.8px"><span style=3D"background-color:rgb(204=
,204,204)">fscache =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A08=
7449 =C2=A01 9p</span></div><div style=3D"font-size:12.8px"><span style=3D"=
background-color:rgb(204,204,204)">9pnet_virtio =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A09122 =C2=A00</span></div><div style=3D"font-size:12.8px"><spa=
n style=3D"background-color:rgb(204,204,204)">9pnet =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A083564 =C2=A02 9p,9pnet_virtio</spa=
n></div><div style=3D"font-size:12.8px"><span style=3D"background-color:rgb=
(204,204,204)">virtio_ring =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A013866 =
=C2=A05 virtio_net,virtio_pci,9pnet_<wbr>virtio,virtio_mmio,virtio_scsi</sp=
an></div><div style=3D"font-size:12.8px"><span style=3D"background-color:rg=
b(204,204,204)">virtio =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A09467 =C2=A05 virtio_net,virtio_pci,9pnet_<wbr>virtio,virtio_mmio,=
virtio_scsi</span></div><div style=3D"font-size:12.8px"><br></div><div styl=
e=3D"font-size:12.8px">=C2=A0 =C2=A0 Now I use virsh to launch the VM, and =
the corresponding qemu command I have pasted here:</div><div style=3D"font-=
size:12.8px"><a href=3D"http://paste.openstack.org/show/549225/" target=3D"=
_blank">http://paste.openstack.org/<wbr>show/549225/</a>. =C2=A0</div><div =
style=3D"font-size:12.8px">=C2=A0 =C2=A0 You can see that:<br></div><div st=
yle=3D"font-size:12.8px"><span style=3D"background-color:rgb(204,204,204)">=
<font color=3D"#000000"><b>=C2=A0-fsdev local,security_model=3Dmapped,<wbr>=
id=3Dfsdev-fs0,path=3D/var/lib/<wbr>libvirt/images/coreos -device virtio-9p=
-pci,id=3Dfs0,fsdev=3D<wbr>fsdev-fs0,mount_tag=3Dshare,bus=3D<wbr>pci.2,add=
r=3D0x1</b></font></span><br></div><div style=3D"font-size:12.8px">=C2=A0 =
=C2=A0 =C2=A0Here is the command that remapped the directory from host to g=
uest. After VM launched, I use the command to mount:</div><div style=3D"fon=
t-size:12.8px"><span style=3D"background-color:rgb(204,204,204)"><b>=C2=A0m=
ount -t 9p -o trans=3Dvirtio share /tmp/shared/ -oversion=3D9p2000.L,posixa=
cl,<wbr>cache=3Dloose</b></span><br></div><div style=3D"font-size:12.8px">B=
ut mount command will be blocked and output nothing.</div><div style=3D"fon=
t-size:12.8px">=C2=A0 =C2=A0 =C2=A0The Qemu version is QEMU emulator versio=
n 2.5.0 (Debian 1:2.5+dfsg-5ubuntu10.2). Besides test fedora24 guest, I hav=
e got the same problem in Debian jessie.=C2=A0</div><div style=3D"font-size=
:12.8px">=C2=A0 =C2=A0 =C2=A0 Kindly need your help~You will be really appr=
eciated.</div><div style=3D"font-size:12.8px"><br></div><div style=3D"font-=
size:12.8px">Best Regards,</div><div style=3D"font-size:12.8px">Kevin Zhao<=
/div></div>

--001a113e4b764fe2e1053949c2ff--
