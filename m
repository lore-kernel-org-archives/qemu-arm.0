Received: by 10.80.163.71 with SMTP id 65csp536423edn;
        Fri, 23 Sep 2016 12:42:50 -0700 (PDT)
X-Received: by 10.55.184.2 with SMTP id i2mr8985704qkf.48.1474659770704;
        Fri, 23 Sep 2016 12:42:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x4si6189931qke.212.2016.09.23.12.42.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Sep 2016 12:42:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50525 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bnWMz-00077O-UD
	for alex.bennee@linaro.org; Fri, 23 Sep 2016 15:42:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1bnWMt-00075w-I7
	for qemu-arm@nongnu.org; Fri, 23 Sep 2016 15:42:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1bnWMo-0002pH-Kg
	for qemu-arm@nongnu.org; Fri, 23 Sep 2016 15:42:43 -0400
Received: from mail-lf0-f50.google.com ([209.85.215.50]:34498)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>)
	id 1bnWMo-0002p2-8L; Fri, 23 Sep 2016 15:42:38 -0400
Received: by mail-lf0-f50.google.com with SMTP id y6so101121403lff.1;
	Fri, 23 Sep 2016 12:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=NwlfJMCyy49OJ7vIuTOxPWBFvcJzMa/ERrLnBRc2ykE=;
	b=ktxwF2wIyjhzjUhzQHo4IcA3uuZimXCTpd5Pw9yFlaZvAmqmlKqLGsSZ7Qtuwxs5B4
	3RxFMHIAK/UgHaUnN5LoWGYTp9HLaKIbUp7gThdK5W5oYz3K6TWf2pvyFrwrfZ8OpMqA
	skfg1oQpn9Hwi2wyhyDop3mAd0oXjsNLJe6kLeb8QEIJSS/9sB1VF/LU/WguY/GHdno6
	UQPOArsA1dgyqA0EuL02Yk2m/nOQ26qYkEtqlPvP5SBvuNPt0UicrSL21EX5WazGEpca
	htrISpQfEPUDucZJ5xtoDQzGBNg8Tc+lnky/7YzsdIdSDUdPmORDjYqNBZypQcksHJ46
	MDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=NwlfJMCyy49OJ7vIuTOxPWBFvcJzMa/ERrLnBRc2ykE=;
	b=a6iuJ+NBq2W2QWIZLDqTOorWpSSilzk0EjzO08x766u+w6UBnG32w8F2PN8PKb/GhN
	vni/hMFYsoul+Vux0wyEUz2gPwJdc3Sc3cO+WxfL07IaRhzVsob2U+vfXv4samrel0w+
	QCGFeo+Zh6nPsIHjsOX2mdCLvcH/R8dxs8K/and1U0tK2ofItYFh/L81ePDJK0CwlROd
	23KCNc0NsEaQARXmDRKcMmABgT7Z6wVSUMyRcnJgE4jLIeWuLhQzHMYdeIzk+AitXpYU
	xG9AapizJWnHFjePIgKrXraqnb+z6lrzOJkd2uWwiK3d72kg3Nzj/ROWoFa82OxBDwZc
	XohQ==
X-Gm-Message-State: AE9vXwNcAeazHDi8dbucL/6IxBgbqm7rYKCQnQn3Y01Hh4i5e683vHj7QefKfHDsHNmsNQ==
X-Received: by 10.25.74.194 with SMTP id x185mr3588968lfa.146.1474659697054;
	Fri, 23 Sep 2016 12:41:37 -0700 (PDT)
Received: from [192.168.75.104] (89-70-149-145.dynamic.chello.pl.
	[89.70.149.145])
	by smtp.gmail.com with ESMTPSA id a6sm1445170lfb.24.2016.09.23.12.41.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Sep 2016 12:41:36 -0700 (PDT)
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>
References: <6f7cd004-06b6-0ee5-86bc-082aa593ea64@gmail.com>
From: "mar.krzeminski" <mar.krzeminski@gmail.com>
Message-ID: <fcd86bbd-f730-9a52-314e-fb582511673e@gmail.com>
Date: Fri, 23 Sep 2016 21:41:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <6f7cd004-06b6-0ee5-86bc-082aa593ea64@gmail.com>
Content-Type: multipart/alternative;
	boundary="------------26DBD2BD217EA18FDB08BD34"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.50
Subject: Re: [Qemu-arm] 9p as rootfs
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
X-TUID: 9baXdmW0TwXI

This is a multi-part message in MIME format.
--------------26DBD2BD217EA18FDB08BD34
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

And most important, while mounting as roots, error is:

[    1.086235] device: '9p-1': device_add
[    1.087859] 9pnet_virtio: no channels available
[    1.091619] device: '9p-1': device_unregister
[    1.092783] device: '9p-1': device_create_release
[    1.093534] VFS: Cannot open root device "host" or 
unknown-block(0,0): error -2

Thanks,
Marcin

W dniu 23.09.2016 o 21:38, mar.krzeminski pisze:
> Hello,
>
> I have a problem in my custom arm machine to use 9p fs as a rootfs.
>
> 9p command line i qemu:
>
> /-device virtio-9p-device,fsdev=host_fs,mount_tag=hostfs -fsdev 
> local,id=host_fs,security_model=none,path=/work/rootfs/
>
> Kernel cmd line:
>
> /--append "root=hostfs rootfstype=9p rootflags=trans=virtio noinitrd 
> console=ttyS3,115200"
>
> /Device tree entry:
>
> /        virtio: virtio_mmio@ff0a4000 {//
> //            compatible = "virtio,mmio";//
> //            reg = <0xff0a4000 0x200>;//
> //            interrupts = <0 72 1>;//
> //            status = "okay";//
> //        };
>
>
> / I can mount this fs from kernel using fstab entry:
> /hostfs               /mnt/host            9p trans=virtio          0  0
>
> /Do you have any idea what am I doing wrong?
>
> Thanks,
> Marcin/
> / 


--------------26DBD2BD217EA18FDB08BD34
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    And most important, while mounting as roots, error is:<br>
    <br>
    [    1.086235] device: '9p-1': device_add<br>
    [    1.087859] 9pnet_virtio: no channels available<br>
    [    1.091619] device: '9p-1': device_unregister<br>
    [    1.092783] device: '9p-1': device_create_release<br>
    [    1.093534] VFS: Cannot open root device "host" or
    unknown-block(0,0): error -2<br>
    <br>
    Thanks,<br>
    Marcin<br>
    <br>
    <div class="moz-cite-prefix">W dniu 23.09.2016 o 21:38,
      mar.krzeminski pisze:<br>
    </div>
    <blockquote
      cite="mid:6f7cd004-06b6-0ee5-86bc-082aa593ea64@gmail.com"
      type="cite">
      <meta http-equiv="content-type" content="text/html; charset=utf-8">
      <font size="-1">Hello,<br>
        <br>
        I have a problem in my custom arm machine to use 9p fs as a
        rootfs.<br>
        <br>
        9p command line i qemu:<br>
        <br>
        <i>-device virtio-9p-device,fsdev=host_fs,mount_tag=hostfs
          -fsdev local,id=host_fs,security_model=none,path=/work/rootfs</i><br>
        <br>
        Kernel cmd line:<br>
        <br>
        <i>--append "root=hostfs rootfstype=9p rootflags=trans=virtio
          noinitrd console=ttyS3,115200"<br>
          <br>
        </i>Device tree entry:<br>
        <br>
        <i>        virtio: virtio_mmio@ff0a4000 {</i><i><br>
        </i><i>            compatible = "virtio,mmio";</i><i><br>
        </i><i>            reg = &lt;0xff0a4000 0x200&gt;;</i><i><br>
        </i><i>            interrupts = &lt;0 72 1&gt;;</i><i><br>
        </i><i>            status = "okay";</i><i><br>
        </i><i>        };<br>
          <br>
          <br>
        </i> I can mount this fs from kernel using fstab entry:<br>
        <i>hostfs               /mnt/host            9p        
          trans=virtio          0  0<br>
          <br>
        </i>Do you have any idea what am I doing wrong?<br>
        <br>
        Thanks,<br>
        Marcin<i><br>
        </i></font> </blockquote>
    <br>
  </body>
</html>

--------------26DBD2BD217EA18FDB08BD34--
