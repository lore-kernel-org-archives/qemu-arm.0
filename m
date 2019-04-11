Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp7699017wrx;
        Thu, 11 Apr 2019 15:16:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzEJ2op6liHyglm+tw8qnV10RPu6yAdWVzRhikThjAByfsxzE7kypllgPivP5hlhVr5DTaP
X-Received: by 2002:a05:6000:2:: with SMTP id h2mr15556081wrx.76.1555020984689;
        Thu, 11 Apr 2019 15:16:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555020984; cv=none;
        d=google.com; s=arc-20160816;
        b=yaWij+6+ahCKXwluSF0qCSK19zhZ7BN9/1KFPd08vVafFrk7/ur0UTNHR6ECy7NmI4
         WS9oR/tQ3tBNOiVMYbzb06e6IBf/SUegrd6+KDWbDPqzNnq6mv+HJVHEZY8Wbj2/q4aK
         gs7WAmhaJGW5rDwwjLU16hH7IlzuF6HDvmqPT/ARai5E1Kc5Fc19aSOU48C9wgW60vH/
         xwo8g2qM6KFr2aUbpSCKYeyZsQOOc8FfjU3mYdB5TOMcL+kSda2iOx5eMmLoR92L5d7m
         bM9w5kL1am46y1VxUyodtnl6yMNG5ag02vym6UEaHz0G4ct7nlxm5ag+HmkQBsRWJYx5
         MtKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version;
        bh=sGYAYtOgoP53edHEJvrt+xZApFTb6pQnUEk06xmn75E=;
        b=lD3bCpa7pH/zW5p4Ivsk1/d8CRw2A2QErAQSTwdJg+O/dtLD6jE3yYlv89NFhFrO4A
         5EmY5Ni7W7rQ+zEKiuOITb7mQmEabyiPp3THgvEvvCiwLJwFRu3uxDSq6EjSi011qVig
         uE53Ki0SJpBi/JiAQPaEDO2Ejf9dCra5dVvlXeIyCPZ6mgpVP4ygVvkPG6hJOnF7c5zI
         XHD3Aqpmk7W1QGjPftJGOcKFhtcH0LNuxvjUC1R3mSruTNixEgCgDBPafAMPH5EwJ1xQ
         a6e3X8/ecDPmmU2TWNgjNtJuC+5ctN1QUwjQmZ5L2Q5Ui0O8aXChvaCmjyMEGvQw9OI9
         ZrvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=vt.edu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s74si3894828wme.116.2019.04.11.15.16.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Apr 2019 15:16:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=vt.edu
Received: from localhost ([127.0.0.1]:55630 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEhzb-0003xA-NN
	for alex.bennee@linaro.org; Thu, 11 Apr 2019 18:16:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59559)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from <daz3@vt.edu>)
	id 1hEhXu-0005NW-Rx
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 17:47:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <daz3@vt.edu>) id 1hEhXm-0004ci-13
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 17:47:42 -0400
Received: from omr2.cc.ipv6.vt.edu ([2607:b400:92:8400:0:33:fb76:806e]:45058
	helo=omr2.cc.vt.edu)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <daz3@vt.edu>) id 1hEhXe-0004UE-4D
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 17:47:30 -0400
Received: from mr1.cc.vt.edu (mr1.cc.ipv6.vt.edu
	[IPv6:2607:b400:92:8300:0:31:1732:8aa4])
	by omr2.cc.vt.edu (8.14.4/8.14.4) with ESMTP id x3BLlLvw011206
	for <qemu-arm@nongnu.org>; Thu, 11 Apr 2019 17:47:21 -0400
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
	[209.85.128.69])
	by mr1.cc.vt.edu (8.14.7/8.14.7) with ESMTP id x3BLlGG6004628
	for <qemu-arm@nongnu.org>; Thu, 11 Apr 2019 17:47:21 -0400
Received: by mail-wm1-f69.google.com with SMTP id f67so4989192wme.3
	for <qemu-arm@nongnu.org>; Thu, 11 Apr 2019 14:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=sGYAYtOgoP53edHEJvrt+xZApFTb6pQnUEk06xmn75E=;
	b=Ct5LGtusgEXTiBNwNSaSVMv1/N0d3XdTllP8Jx7WjFTcesHBMrU+0+fzRNMQ6DtwgS
	hzpj8bsae1oL3pEWKhrYi+IKjyY+cGoIOvwB0+kaZTK/w2zFxfFxj2sRjVSeNIngHo8Z
	ejMSk/gLF+Cgd5o/wx1+JcReQTPZU68vGkl8aGRokyC/eaKaSlTF5dOyA5Brj+PEQm51
	SmAUe+H7jrTW9fCupxwPquIoKdfIxJesHMSF09qsGVM5UDLewHHcrZm6xo6a6x6G2NHM
	7ue8hj66l/ouiylQ88zrl6xD1b4a1CqOrSg+lcFBpaWvDnnKSs8wmYwp++eAe+DLHjRu
	ctFA==
X-Gm-Message-State: APjAAAVeCy83ImIFnZfL+ODvg1flgD2TkhxkfKj/jHdcq/iRvV2vzkNw
	ZAgCqAU99BUaXDbBynV7Xc70s2ufa0RkxS+mvu8irto6UNMxANV8pV5AQSpiCjh8aje8ii4aZT6
	JokUBznA1RfKJjeDJg4Y1T+oBDmqgMhQ/9ntDnlE=
X-Received: by 2002:adf:fc47:: with SMTP id e7mr28296656wrs.100.1555019235574; 
	Thu, 11 Apr 2019 14:47:15 -0700 (PDT)
X-Received: by 2002:adf:fc47:: with SMTP id e7mr28296637wrs.100.1555019235216; 
	Thu, 11 Apr 2019 14:47:15 -0700 (PDT)
MIME-Version: 1.0
From: Da Zhang <daz3@vt.edu>
Date: Thu, 11 Apr 2019 17:46:39 -0400
Message-ID: <CANY2w+3iU1m9exqE2qMJj+OXcHThm2Q3jxFdDn9FWwKC6JhKUg@mail.gmail.com>
To: qemu-discuss@nongnu.org, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000226d0d0586482186"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2607:b400:92:8400:0:33:fb76:806e
X-Mailman-Approved-At: Thu, 11 Apr 2019 18:16:06 -0400
Subject: [Qemu-arm] Ubuntu installation shows "No network interfaces
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rV77J2TbviTC

--000000000000226d0d0586482186
Content-Type: text/plain; charset="UTF-8"

Hi guys,

I am trying to create an Ubuntu ARM disk image for my gem5 ARM experiments.
The installation always shows "No network interfaces detected".
This is my command for running qemu:

qemu-system-aarch64 \
    -cpu host \
    -device virtio-scsi-device \
    -device scsi-cd,drive=cdrom \
    -device virtio-blk-device,drive=hd0 \
    -drive
"file=ubuntu-16.04.5-server-arm64.iso,id=cdrom,if=none,media=cdrom" \
    -drive
"if=none,format=qcow2,file=ubuntu-16.04.5-server-arm64.img,id=hd0" \
    -pflash "ubuntu-16.04.5-server-arm64-flash0.img" \
    -pflash "ubuntu-16.04.5-server-arm64-flash1.img" \
    -m 1G \
    -machine virt \
    -enable-kvm \
    -nographic \
    -net nic,netdev=n1 \
    -netdev user,id=n1 \
    ;

I ran it on a "ROCKPro64 64-bit Hexa-Core Computer" ARM borad with KVM
enabled. Any suggestions to fix "No network interfaces detected"?

best,
Da Zhang

--000000000000226d0d0586482186
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r">Hi guys,<div><br></div><div>I am trying to create an Ubuntu ARM disk ima=
ge for my gem5 ARM experiments. The installation always shows=C2=A0&quot;No=
 network interfaces detected&quot;.</div><div>This is my command for runnin=
g qemu:</div><div><br></div><div><div>qemu-system-aarch64 \</div><div>=C2=
=A0 =C2=A0 -cpu host \</div><div>=C2=A0 =C2=A0 -device virtio-scsi-device \=
</div><div>=C2=A0 =C2=A0 -device scsi-cd,drive=3Dcdrom \</div><div>=C2=A0 =
=C2=A0 -device virtio-blk-device,drive=3Dhd0 \</div><div>=C2=A0 =C2=A0 -dri=
ve &quot;file=3Dubuntu-16.04.5-server-arm64.iso,id=3Dcdrom,if=3Dnone,media=
=3Dcdrom&quot; \</div><div>=C2=A0 =C2=A0 -drive &quot;if=3Dnone,format=3Dqc=
ow2,file=3Dubuntu-16.04.5-server-arm64.img,id=3Dhd0&quot; \</div><div>=C2=
=A0 =C2=A0 -pflash &quot;ubuntu-16.04.5-server-arm64-flash0.img&quot; \</di=
v><div>=C2=A0 =C2=A0 -pflash &quot;ubuntu-16.04.5-server-arm64-flash1.img&q=
uot; \</div><div>=C2=A0 =C2=A0 -m 1G \</div><div>=C2=A0 =C2=A0 -machine vir=
t \</div><div>=C2=A0 =C2=A0 -enable-kvm \</div><div>=C2=A0 =C2=A0 -nographi=
c \</div><div>=C2=A0 =C2=A0 -net nic,netdev=3Dn1 \</div><div>=C2=A0 =C2=A0 =
-netdev user,id=3Dn1 \</div><div>=C2=A0 =C2=A0 ;</div></div><div><br></div>=
<div>I ran it on a &quot;ROCKPro64 64-bit Hexa-Core Computer&quot; ARM bora=
d with KVM enabled. Any suggestions to fix &quot;No network interfaces dete=
cted&quot;?</div><div><br></div><div>best,</div><div>Da Zhang</div><div><br=
></div></div></div></div></div></div></div></div></div></div>

--000000000000226d0d0586482186--
