Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2283650wrx;
        Sun, 14 Apr 2019 22:28:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz+QS3Nwsbq8K3Vman8g8fvOTkUCrpGJCnvwjTCJdye91DeE2NdelwR1T4mhm/InB0iZAL5
X-Received: by 2002:adf:cf05:: with SMTP id o5mr44341196wrj.8.1555306081840;
        Sun, 14 Apr 2019 22:28:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555306081; cv=none;
        d=google.com; s=arc-20160816;
        b=TNcJKCMf2MRoeV5BCQALQScAiO//a8dkTRDeCKnITblkpjLVLLeTddtxbX4lGvd+LQ
         laTSytM3criKpYHjyij6JNLtATMGb+6lq+p1WfKuDYAmLMNnSDRNkzSC8fjrkphzcBCf
         MHBOC5j4drIQ7v5C6PzMFTtMEYSmXtqp7E3F/TTSAWrsQ78ZTZIXglVITO4/j5E7xes3
         Hra04QhZilf8SPOw2KNSoiA4pwBrwUOCi5oRnO/fcq5bk1vw56XNaa6EEnwQwcs4xeiL
         nHmkIwwIEVqYLBQfs0xJsS1IBJ/9lmEtvLA6syQ+AhAMuGkhwjbD8q4AdWgxCTEmYOc4
         bW5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=Iw5MubQBB2FURn+e+mUH0InHOL/iXyKZ0mTdXGHe7QU=;
        b=LDAqxIuyu48DwUeoi0jBYWf0gYpLFftYo33Sag6ZG6dYWse5I4XMkQrbAgCVtUkohE
         HRJwCL91cYHOx3y9l5rV1QRXv7ICWacLAMMcoyiW4MirdvihQWAG9Z+hlSojyZ1BXE9c
         tX4yDVX/eL3dxxu6QQVHO6i9i+XtXnXSr3dgBt6k24bw6cxCFv1M0BjZSqa10Au9E/be
         tCWdEV0ievqwhZ1nJqjFOq/VPD1+slFvhuExt4D+WfDtW4sOJC1PoCiQCzp/AJ3zOnSa
         SfCApnR4NY0NdHo7mlqeYMV7d3DI6k79qecy2VEFe2Kh3IiqawvveXn51Uy6DjBTN882
         KwbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=vt.edu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11si33229424wrm.263.2019.04.14.22.28.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 14 Apr 2019 22:28:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=vt.edu
Received: from localhost ([127.0.0.1]:44927 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hFu9w-00087q-TU
	for alex.bennee@linaro.org; Mon, 15 Apr 2019 01:28:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37021)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from <daz3@vt.edu>)
	id 1hFu9p-00085g-9j
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 01:27:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <daz3@vt.edu>) id 1hFu9o-0000gJ-4l
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 01:27:53 -0400
Received: from omr2.cc.ipv6.vt.edu ([2607:b400:92:8400:0:33:fb76:806e]:49896
	helo=omr2.cc.vt.edu)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <daz3@vt.edu>) id 1hFu9n-0000dG-UG
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 01:27:52 -0400
Received: from mr3.cc.vt.edu (mr3.cc.ipv6.vt.edu
	[IPv6:2607:b400:92:8500:0:7f:b804:6b0a])
	by omr2.cc.vt.edu (8.14.4/8.14.4) with ESMTP id x3F5RhGB006674
	for <qemu-arm@nongnu.org>; Mon, 15 Apr 2019 01:27:43 -0400
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72])
	by mr3.cc.vt.edu (8.14.7/8.14.7) with ESMTP id x3F5Rbsq025843
	for <qemu-arm@nongnu.org>; Mon, 15 Apr 2019 01:27:43 -0400
Received: by mail-wm1-f72.google.com with SMTP id f11so13702963wmc.8
	for <qemu-arm@nongnu.org>; Sun, 14 Apr 2019 22:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Iw5MubQBB2FURn+e+mUH0InHOL/iXyKZ0mTdXGHe7QU=;
	b=WQ1bUPsuFh2saY5Yni9ggoTKIpZA+YGaslik06fVPww/k/MxlARxhLzTP1TfTMvLLi
	6FhUTUDKj50WwWaRzrA88DEIez/fIwhGZM+MP6YfkuOGQaQOH0hGS2PnmIj4bTBNm1k+
	HGY5SUcqwLKyuXlQuzmJr4f07MIsddnFXwr46lpEE+cnK7SyukTqaydZyYBskmqjEpV3
	cUIZFBlcYatfiRYA0ozPnwx1lwysQWwLnDJJzt/wu363CMXd1NBAaa23Ug2ZxcC65oxk
	v6mNe39vofoFd1hL7F4vxZjayvuorWQlf3sB4Ne5TdBjT4fjTa06RGvh0IMO7Sm3YtRs
	TO9Q==
X-Gm-Message-State: APjAAAW8HUurgMBc/FXzszVuza/bojSgbIOkItyGJXEATeUoWHstjZMl
	BK8jaAnjOTaIR6aJOKeCJ50qss4uQWC9+SirOycA+QfiKpXvde4/ehAVywSmHQSDl2XXVJzmqSG
	cXp4PgWXsR69XPw/w5qo2Jc/RGaGVpM99mbVMn8U=
X-Received: by 2002:a1c:ac07:: with SMTP id v7mr21655300wme.49.1555306057565; 
	Sun, 14 Apr 2019 22:27:37 -0700 (PDT)
X-Received: by 2002:a1c:ac07:: with SMTP id v7mr21655278wme.49.1555306057190; 
	Sun, 14 Apr 2019 22:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <CANY2w+3iU1m9exqE2qMJj+OXcHThm2Q3jxFdDn9FWwKC6JhKUg@mail.gmail.com>
	<CAFEAcA9B-7j9ws-vaChqx1uZOA_QDzQYPixNeGDmonLXeZ9vNQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9B-7j9ws-vaChqx1uZOA_QDzQYPixNeGDmonLXeZ9vNQ@mail.gmail.com>
From: Da Zhang <daz3@vt.edu>
Date: Mon, 15 Apr 2019 01:27:01 -0400
Message-ID: <CANY2w+0ZULuVgJTu3M+--rC01biqS=y1V4tAbgjHfyKRd6X79A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000000e67e505868ae925"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2607:b400:92:8400:0:33:fb76:806e
Subject: Re: [Qemu-arm] Ubuntu installation shows "No network interfaces
 detected"
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
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L83LvlsCtu8g

--0000000000000e67e505868ae925
Content-Type: text/plain; charset="UTF-8"

Thanks for the suggestions. Unfortunately, neither virtio-net-pci nor
rtl8139 works for me. Yet, I haven't figured it out why. But, I found
that virtio-net-device works for me.

Thanks,
-- Da

On Fri, Apr 12, 2019 at 4:33 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 11 Apr 2019 at 23:16, Da Zhang <daz3@vt.edu> wrote:
> >
> > Hi guys,
> >
> > I am trying to create an Ubuntu ARM disk image for my gem5 ARM
> experiments. The installation always shows "No network interfaces detected".
> > This is my command for running qemu:
> >
> > qemu-system-aarch64 \
> >     -cpu host \
> >     -device virtio-scsi-device \
> >     -device scsi-cd,drive=cdrom \
> >     -device virtio-blk-device,drive=hd0 \
> >     -drive
> "file=ubuntu-16.04.5-server-arm64.iso,id=cdrom,if=none,media=cdrom" \
> >     -drive
> "if=none,format=qcow2,file=ubuntu-16.04.5-server-arm64.img,id=hd0" \
> >     -pflash "ubuntu-16.04.5-server-arm64-flash0.img" \
> >     -pflash "ubuntu-16.04.5-server-arm64-flash1.img" \
> >     -m 1G \
> >     -machine virt \
> >     -enable-kvm \
> >     -nographic \
> >     -net nic,netdev=n1 \
> >     -netdev user,id=n1 \
> >     ;
>
> This command line doesn't specify any ethernet device
> interfaces, which is why you have no networking.
> I would recommend
>  -netdev user,id=mynet -device virtio-net-pci,netdev=mynet
>
> though other kinds of network device will work too,
> like the rtl8139 that Narcis suggests. virtio-net will
> give the best performance.
>
> PS: I have suggested virtio-net-pci because we recommend
> the PCI virtio over the virtio-mmio that your command
> line is using for virtio-blk. Your guest OS will need to
> have the PCI support enabled, though. There is also a
> virtio-net-device which will use virtio-mmio. If PCI
> works for you I would suggest switching your virtio-blk-device
> use to virtio-blk-pci, and similarly for virtio-scsi-pci.
>
> thanks
> -- PMM
>

--0000000000000e67e505868ae925
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thanks for the suggestions. Unfortunately=
, neither virtio-net-pci nor rtl8139 works for me. Yet, I haven&#39;t figur=
ed it out why. But, I found that=C2=A0virtio-net-device works for me.</div>=
<div dir=3D"ltr"><br></div><div>Thanks,</div><div>-- Da</div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 12=
, 2019 at 4:33 AM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.=
org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On Thu, 11 Apr 2019 at 23:16, Da Zhang &lt;<a =
href=3D"mailto:daz3@vt.edu" target=3D"_blank">daz3@vt.edu</a>&gt; wrote:<br=
>
&gt;<br>
&gt; Hi guys,<br>
&gt;<br>
&gt; I am trying to create an Ubuntu ARM disk image for my gem5 ARM experim=
ents. The installation always shows &quot;No network interfaces detected&qu=
ot;.<br>
&gt; This is my command for running qemu:<br>
&gt;<br>
&gt; qemu-system-aarch64 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-cpu host \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-device virtio-scsi-device \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-device scsi-cd,drive=3Dcdrom \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-device virtio-blk-device,drive=3Dhd0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-drive &quot;file=3Dubuntu-16.04.5-server-arm64.iso=
,id=3Dcdrom,if=3Dnone,media=3Dcdrom&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-drive &quot;if=3Dnone,format=3Dqcow2,file=3Dubuntu=
-16.04.5-server-arm64.img,id=3Dhd0&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-pflash &quot;ubuntu-16.04.5-server-arm64-flash0.im=
g&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-pflash &quot;ubuntu-16.04.5-server-arm64-flash1.im=
g&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-m 1G \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-machine virt \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-enable-kvm \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-nographic \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-net nic,netdev=3Dn1 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-netdev user,id=3Dn1 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0;<br>
<br>
This command line doesn&#39;t specify any ethernet device<br>
interfaces, which is why you have no networking.<br>
I would recommend<br>
=C2=A0-netdev user,id=3Dmynet -device virtio-net-pci,netdev=3Dmynet<br>
<br>
though other kinds of network device will work too,<br>
like the rtl8139 that Narcis suggests. virtio-net will<br>
give the best performance.<br>
<br>
PS: I have suggested virtio-net-pci because we recommend<br>
the PCI virtio over the virtio-mmio that your command<br>
line is using for virtio-blk. Your guest OS will need to<br>
have the PCI support enabled, though. There is also a<br>
virtio-net-device which will use virtio-mmio. If PCI<br>
works for you I would suggest switching your virtio-blk-device<br>
use to virtio-blk-pci, and similarly for virtio-scsi-pci.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--0000000000000e67e505868ae925--
