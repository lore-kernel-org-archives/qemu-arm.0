Received: by 10.25.134.130 with SMTP id i124csp1475070lfd;
        Sun, 10 Jan 2016 06:21:24 -0800 (PST)
X-Received: by 10.55.21.163 with SMTP id 35mr25955642qkv.45.1452435683947;
        Sun, 10 Jan 2016 06:21:23 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w82si99966161qka.3.2016.01.10.06.21.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Jan 2016 06:21:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47058 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aIGrz-0005UZ-IC
	for alex.bennee@linaro.org; Sun, 10 Jan 2016 09:21:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xumeng1901@gmail.com>) id 1aI8fK-00082q-2v
	for qemu-arm@nongnu.org; Sun, 10 Jan 2016 00:35:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xumeng1901@gmail.com>) id 1aI8fG-0001CE-QV
	for qemu-arm@nongnu.org; Sun, 10 Jan 2016 00:35:46 -0500
Received: from mail-yk0-x235.google.com ([2607:f8b0:4002:c07::235]:33348)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xumeng1901@gmail.com>) id 1aI8fG-0001Bk-M7
	for qemu-arm@nongnu.org; Sun, 10 Jan 2016 00:35:42 -0500
Received: by mail-yk0-x235.google.com with SMTP id k129so379631517yke.0
	for <qemu-arm@nongnu.org>; Sat, 09 Jan 2016 21:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=SVD2D3n3VFgFHg9qDG+Ng5i4NrBHBHu5p4Rram77Osc=;
	b=t2KBPQJuKCd1DOHRSbMjqYJ694cyU5SOG9EkiZJ/qnIdEI5tTAyyGHfhju4DSlwB2z
	HoLUJ0ACMSMUG+faXEsUxvgj6y1jdzh24q3eFkw2VAAMNwIyv2VvJyNol3exJNVp4DDi
	K1pDlKweNw3t0mALrtsCLPGSQiAIOe3eAPMIAHS4TJ2i4alCTgBY8zorMqyWrCvfOczq
	oDUH74CSyW+lLzT+ZBK8CzOhjkPaLwdcRKyPeW86iaiafeJVYKNnsEHDYeRldhODTWOw
	uI2O6f7aybqBg0g/zv8+n7ZTLYZ4FLgZCNmoaxxHWGcRZks1SYvNFtJz+QsZNb6EO9x5
	UBWA==
X-Received: by 10.129.89.6 with SMTP id n6mr86852393ywb.102.1452404142058;
	Sat, 09 Jan 2016 21:35:42 -0800 (PST)
Received: from [192.168.0.103] (c-76-17-123-49.hsd1.ga.comcast.net.
	[76.17.123.49]) by smtp.gmail.com with ESMTPSA id
	b131sm69755735ywc.50.2016.01.09.21.35.41 for <qemu-arm@nongnu.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 09 Jan 2016 21:35:41 -0800 (PST)
From: Meng Xu <xumeng1901@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-Id: <8536B0ED-6417-4F65-99F7-1D49F950E24B@gmail.com>
Date: Sun, 10 Jan 2016 00:35:40 -0500
To: qemu-arm@nongnu.org
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c07::235
X-Mailman-Approved-At: Sun, 10 Jan 2016 09:21:22 -0500
Subject: [Qemu-arm] aarch64 ivshmem issues
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2XCVq0wl5Pp5

Hi All,

I am using the ivshmem device to create shared memory between an x86_64 =
host and aarch64 guest.
The guest has ubuntu server 14.04 installed with kernel version 3.13.0. =
I wrote a kernel driver to
drive the ivshmem device (as a pci driver) however, the driver was never =
registered:

Can anyone help me point out what is wrong?=20

My qemu launch script looks like this:
qemu-system-aarch64 -machine virt,highmem=3Doff -cpu cortex-a57 -m 1024M =
\
	-drive file=3D<path-to-img>,id=3Dhd0,if=3Dnone,format=3Dqcow2 \
	-device virtio-blk-device,drive=3Dhd0 \
	-device ivshmem,shm=3Dvshmtest,size=3D16M \
	-kernel <path-to-kernel> \
	-initrd <path-to-initrd> \


The skeleton of the kernel driver is like this:
static struct pci_device_id vshmem_id_table[] =3D {
	{ 0x1af4, 0x1110, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
	{ 0 },
};

static struct pci_driver vshmem_driver =3D {
	.name 	=3D =E2=80=9Cvshmtest=E2=80=9D,
	.id_table	=3D vshmem_id_table,
	.probe	=3D vshmem_probe_device,
	.remove	=3D vshmem_remove_device,
};

somewhere in module init:
	pci_register_driver(&vshmem_driver);

The same driver code works well with x86_64 and ppc64.

Best Regards,=
