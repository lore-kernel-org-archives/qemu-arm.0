Received: by 10.80.163.71 with SMTP id 65csp535654edn;
        Fri, 23 Sep 2016 12:40:05 -0700 (PDT)
X-Received: by 10.55.162.13 with SMTP id l13mr10008027qke.72.1474659605030;
        Fri, 23 Sep 2016 12:40:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q67si6183462qkq.261.2016.09.23.12.40.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Sep 2016 12:40:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50480 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bnWKK-0004yu-En
	for alex.bennee@linaro.org; Fri, 23 Sep 2016 15:40:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48331)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1bnWKD-0004wR-Eh
	for qemu-arm@nongnu.org; Fri, 23 Sep 2016 15:39:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1bnWKA-0001ZH-9Z
	for qemu-arm@nongnu.org; Fri, 23 Sep 2016 15:39:57 -0400
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34837)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>)
	id 1bnWKA-0001ZA-0Y; Fri, 23 Sep 2016 15:39:54 -0400
Received: by mail-lf0-f66.google.com with SMTP id s64so6179262lfs.2;
	Fri, 23 Sep 2016 12:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=to:from:subject:message-id:date:user-agent:mime-version;
	bh=L70LooZo0ZY8Er5lxsbn4xNGKhjPliy7QQJ9Zu6yY0Y=;
	b=P9AhG9JkR4Vp/I8JDA2H8P6LaWRlJc0pNyzLsst3CR50S/2ah4xa+12PrNJPGdCuw4
	IE+Vux/YJJlLtkoqDClIMowonilvGuCyoa0EPCxVlLIS+SYjMuAbWrtOOCAEyTYhrhbo
	37vRGsxYpNcAD1qrhDjxFedqBYu3CW2DqmOjUsdxDJPyn+Uv2u9xQbhmXYpbk2uAq9Wl
	7ndbbNGi5XE+E1iUkuT3+eyM2zKVWAaWDGXQrDJYfirj7rMiyFuEXvjc79Rxx5pVZoGe
	gU+MowO9b9rf44QMe5oPNT/QD3QI/P8y0LiohzaF8hBcyOl7U71zcGJmGb9kKQw7wWyM
	Piww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version;
	bh=L70LooZo0ZY8Er5lxsbn4xNGKhjPliy7QQJ9Zu6yY0Y=;
	b=S8i9RYqkJFem7iKIl8w0RycaYwHAfg+CTLqYgX5e03EZY8x2OJ6KJZOQtMbBZ3S4T/
	D7IJupaNUtxldgn2/yQ9dPw29rWOfmsttN2v7nLKnTuMdye4pgNZC1bqWhYqOCTuIZrj
	eDIxtpsm4CQPgpfnNfU24glFnhXgOyPg2XjM8s04q3KnwOkWUOPNubXKe0VS/kPaLNgJ
	v1Vk/Zvre9lLvuSmVWgtxhx1zsjOFa7YfA4FyWkxbY7rhkUZl/Eg6p4bXX2uRUjrRXqL
	3sucekuR4g6mQBgY6AUcXX0Gm1cjVw2LzSnzJVld657EPT6LyxvEnDQz0pnhhHOeDerZ
	SSJw==
X-Gm-Message-State: AE9vXwOUgGFxCgQLYCzEk0uCJrniIQ47nG+GcV8Qlwxk+eQjolLPZXff0kJkhX9rXKLx5Q==
X-Received: by 10.25.170.76 with SMTP id t73mr3105359lfe.70.1474659532539;
	Fri, 23 Sep 2016 12:38:52 -0700 (PDT)
Received: from [192.168.75.104] (89-70-149-145.dynamic.chello.pl.
	[89.70.149.145]) by smtp.gmail.com with ESMTPSA id
	x131sm1486470lff.44.2016.09.23.12.38.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Sep 2016 12:38:51 -0700 (PDT)
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>
From: "mar.krzeminski" <mar.krzeminski@gmail.com>
Message-ID: <6f7cd004-06b6-0ee5-86bc-082aa593ea64@gmail.com>
Date: Fri, 23 Sep 2016 21:38:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="------------0D1046E4280CE07391980867"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.66
Subject: [Qemu-arm] 9p as rootfs
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
X-TUID: +3+RRjnIxE6g

This is a multi-part message in MIME format.
--------------0D1046E4280CE07391980867
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I have a problem in my custom arm machine to use 9p fs as a rootfs.

9p command line i qemu:

/-device virtio-9p-device,fsdev=host_fs,mount_tag=hostfs -fsdev 
local,id=host_fs,security_model=none,path=/work/rootfs/

Kernel cmd line:

/--append "root=hostfs rootfstype=9p rootflags=trans=virtio noinitrd 
console=ttyS3,115200"

/Device tree entry:

/        virtio: virtio_mmio@ff0a4000 {//
//            compatible = "virtio,mmio";//
//            reg = <0xff0a4000 0x200>;//
//            interrupts = <0 72 1>;//
//            status = "okay";//
//        };


/ I can mount this fs from kernel using fstab entry:
/hostfs               /mnt/host            9p trans=virtio          0  0

/Do you have any idea what am I doing wrong?

Thanks,
Marcin/
/

--------------0D1046E4280CE07391980867
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <font size="-1">Hello,<br>
      <br>
      I have a problem in my custom arm machine to use 9p fs as a
      rootfs.<br>
      <br>
      9p command line i qemu:<br>
      <br>
      <i>-device virtio-9p-device,fsdev=host_fs,mount_tag=hostfs -fsdev
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
      </i></font>
  </body>
</html>

--------------0D1046E4280CE07391980867--
