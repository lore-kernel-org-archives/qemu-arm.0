Received: by 10.80.163.71 with SMTP id 65csp22083edn;
        Tue, 27 Sep 2016 12:34:01 -0700 (PDT)
X-Received: by 10.55.154.135 with SMTP id c129mr2998319qke.304.1475004841024;
        Tue, 27 Sep 2016 12:34:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d67si2282933qkh.88.2016.09.27.12.34.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Sep 2016 12:34:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53119 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1boy8e-0004cG-4I
	for alex.bennee@linaro.org; Tue, 27 Sep 2016 15:34:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1boy8b-0004cB-9I
	for qemu-arm@nongnu.org; Tue, 27 Sep 2016 15:33:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1boy8V-0006mq-99
	for qemu-arm@nongnu.org; Tue, 27 Sep 2016 15:33:56 -0400
Received: from mail-lf0-x22e.google.com ([2a00:1450:4010:c07::22e]:36616)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>)
	id 1boy8U-0006m5-T5; Tue, 27 Sep 2016 15:33:51 -0400
Received: by mail-lf0-x22e.google.com with SMTP id g62so32982064lfe.3;
	Tue, 27 Sep 2016 12:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=7YNz2ahbe20XTDCMLQX/9cXOp4ozVVEsdNVD/htON+A=;
	b=xQP44zVkHigV/B2gpJZ50a+mJPwHJo++xUPJgZtObfb2TXNPZssOw8vl+61xDyjxob
	pAaIMATdv8+9S91WnHF/gsIwL9JinIuDU/ncgL/0QSiVZTGxB5PAX9vVUz+3AJ21IaG6
	xTIA3cT827x/jD9B0C+nm55UDjMSNd9y7Sr9Zkn0TBYaxt18xCH7EGtBXuais5eGxc+x
	22PiGReMb/XleOaS6/8gi6NDex2zcZVtxBGjMcoL/gt4skle3ubgm7idu6RE0MjCO6c8
	XjZGhodj9TaUoP+d+TB5hu6lY5OdicXXHV5K6pO0b3HwXAGxjXV/ARIbLwOK/it03w46
	2A2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=7YNz2ahbe20XTDCMLQX/9cXOp4ozVVEsdNVD/htON+A=;
	b=QKaCgtg7RVvcl4iZtT4CLsLwIUBg0HqSH6/Hf1I6ahr49rzs+2JRMX7Aos2W9NnPxP
	ziPeno2ViD6l5gKjE5eas9qMSD4ZjCb0UuenrqS0NpQWh1Yt4ibTNu+qgLjwG8vFCgE6
	tkrhllOYTA8tgg84sGO+eXBADefyFwCTjk4PASqW2bsAEZXmRTOCe5i/oS+bBZ+toyIc
	Ef9MpndHulakWTbLfpqk4D2G/71iLvk10RBfZKoX/mCGRdArVH5w1BG7/mGMOvuzZEJ5
	z1nxqysk4AZN8mKOAknGpe5ZKsjUEdODaF3uCiiEAFvS7UKWZ9yFud9Pk5Ex2OvuPBJq
	P+dA==
X-Gm-Message-State: AE9vXwN7wpMKvYqifQZ0CFGTmKIb0AEKkinuQ/88ipxHIAAF41tOUKhkgnKrBxT5QJMFYQ==
X-Received: by 10.46.69.214 with SMTP id s205mr9610368lja.7.1475004829564;
	Tue, 27 Sep 2016 12:33:49 -0700 (PDT)
Received: from [192.168.75.104] (89-70-175-65.dynamic.chello.pl.
	[89.70.175.65])
	by smtp.gmail.com with ESMTPSA id 77sm163332lfp.26.2016.09.27.12.33.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Sep 2016 12:33:49 -0700 (PDT)
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>
References: <6f7cd004-06b6-0ee5-86bc-082aa593ea64@gmail.com>
	<fcd86bbd-f730-9a52-314e-fb582511673e@gmail.com>
From: "mar.krzeminski" <mar.krzeminski@gmail.com>
Message-ID: <f9aa10e5-0f7a-241d-f772-7c34e7d8c448@gmail.com>
Date: Tue, 27 Sep 2016 21:33:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <fcd86bbd-f730-9a52-314e-fb582511673e@gmail.com>
Content-Type: multipart/alternative;
	boundary="------------A1C3D05751D1758F3C10CE03"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::22e
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
X-TUID: rEM5msaTxmFN

This is a multi-part message in MIME format.
--------------A1C3D05751D1758F3C10CE03
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

So for some reason kernel expect that 9pfs channel will be named 
/dev/root (root= seem to be ignored).
Working command line:

Kernel: /root=/dev/root rootfstype=9p rootflags=trans=virtio rw/
Qemu: /-device virtio-9p-device,fsdev=host_fs,mount_tag=/dev/root -fsdev 
local,id=host_fs,security_model=none,path=////work/rootfs/
/
Thanks,
Marcin/
/
W dniu 23.09.2016 o 21:41, mar.krzeminski pisze:
> And most important, while mounting as roots, error is:
>
> [    1.086235] device: '9p-1': device_add
> [    1.087859] 9pnet_virtio: no channels available
> [    1.091619] device: '9p-1': device_unregister
> [    1.092783] device: '9p-1': device_create_release
> [    1.093534] VFS: Cannot open root device "host" or 
> unknown-block(0,0): error -2
>
> Thanks,
> Marcin
>
> W dniu 23.09.2016 o 21:38, mar.krzeminski pisze:
>> Hello,
>>
>> I have a problem in my custom arm machine to use 9p fs as a rootfs.
>>
>> 9p command line i qemu:
>>
>> /-device virtio-9p-device,fsdev=host_fs,mount_tag=hostfs -fsdev 
>> local,id=host_fs,security_model=none,path=/work/rootfs/
>>
>> Kernel cmd line:
>>
>> /--append "root=hostfs rootfstype=9p rootflags=trans=virtio noinitrd 
>> console=ttyS3,115200"
>>
>> /Device tree entry:
>>
>> /        virtio: virtio_mmio@ff0a4000 {//
>> //            compatible = "virtio,mmio";//
>> //            reg = <0xff0a4000 0x200>;//
>> //            interrupts = <0 72 1>;//
>> //            status = "okay";//
>> //        };
>>
>>
>> / I can mount this fs from kernel using fstab entry:
>> /hostfs               /mnt/host            9p trans=virtio          0  0
>>
>> /Do you have any idea what am I doing wrong?
>>
>> Thanks,
>> Marcin/
>> / 
>


--------------A1C3D05751D1758F3C10CE03
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    So for some reason kernel expect that 9pfs channel will be named
    /dev/root (root= seem to be ignored).<br>
    Working command line:<br>
    <br>
    Kernel: <i>root=/dev/root rootfstype=9p rootflags=trans=virtio rw</i><br>
    Qemu: <i>-device virtio-9p-device,fsdev=host_fs,mount_tag=/dev/root
      -fsdev local,id=host_fs,security_model=none,path=</i><i><font
        size="-1"><i>/work/rootfs</i></font><br>
    </i><br>
    Thanks,<br>
    Marcin<i><br>
    </i><br>
    <div class="moz-cite-prefix">W dniu 23.09.2016 o 21:41,
      mar.krzeminski pisze:<br>
    </div>
    <blockquote
      cite="mid:fcd86bbd-f730-9a52-314e-fb582511673e@gmail.com"
      type="cite">
      <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
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
        <meta http-equiv="content-type" content="text/html;
          charset=utf-8">
        <font size="-1">Hello,<br>
          <br>
          I have a problem in my custom arm machine to use 9p fs as a
          rootfs.<br>
          <br>
          9p command line i qemu:<br>
          <br>
          <i>-device virtio-9p-device,fsdev=host_fs,mount_tag=hostfs
            -fsdev
            local,id=host_fs,security_model=none,path=/work/rootfs</i><br>
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
    </blockquote>
    <br>
  </body>
</html>

--------------A1C3D05751D1758F3C10CE03--
