Received: by 10.25.44.15 with SMTP id s15csp519062lfs;
        Mon, 3 Jul 2017 22:09:59 -0700 (PDT)
X-Received: by 10.55.23.106 with SMTP id i103mr44042589qkh.197.1499144998898;
        Mon, 03 Jul 2017 22:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499144998; cv=none;
        d=google.com; s=arc-20160816;
        b=ogFD3uFdeTphSFOzDgLzPzffaS+0uwUX/6x9SyLseCiXXSk5q5ryDsXVgiyFlYLJwl
         byziL49W2cHQiv7s5rGvqlCWb1EPQkq0vpTyzpqge0iYjKkAq++ZeYkjzN+YLB76kHhH
         QvjPT/M/RJ9qW/3ln2rEUXipsZrKXvGXzE0qV2VGVtKQ+7eWIIw/EZOl8O1jLkaEJJb0
         y6GFhfkf3Q7xhIldCe+ak74Y9JCDZilnpD6g3dqrKHd0ODlw+AIvFDqTWrGWHszh+LbP
         e4RMeKl1SkOeyX9DWBcDCc3Ma0dLiQcOdSceVXJI+32USU8GoNaJeIobgFSvxj/1gDq+
         1AMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=nIhcy8Z5Me9SL+cSW0vJa1C/mpVWkacKLl6yLAUkTyM=;
        b=n9E5E75VTrhG2csUOxUov7fx4RQPiA1R30dzNGHnWo3Nr4F6ppcrFOd/MMYb4j6d1V
         CqZVcGzuWscPfeJr5QkSqG3yYDTYuCkJJZwiGMfcjlRWhkHd6FiT+5hUdCxzE5F/l1L6
         qvBu/ag+6AoBfOV7ViUTFde8B6ljYwDEikiFEsxRHo97rmNg59gldcXJErC32XdhxEyv
         JWVHo2ioZ85Nr6UZZdpgEEJolmESB3CpBt4wPnq3+wdUUm8ko4dCJx0xJ7kCDRZDv1Ql
         IpaenbreZwqCkdtmxeoiWd8+q/grC8BpHsi6X5OKnAk+D3jvGqX5azEkiAVpf+hdnhCd
         jwQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=ABiftxOY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m18si17265600qkh.52.2017.07.03.22.09.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Jul 2017 22:09:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=ABiftxOY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38639 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dSG60-0001Jx-4v
	for alex.bennee@linaro.org; Tue, 04 Jul 2017 01:09:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55894)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dSG5w-0001Jf-BN
	for qemu-arm@nongnu.org; Tue, 04 Jul 2017 01:09:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dSG5v-00036m-4r
	for qemu-arm@nongnu.org; Tue, 04 Jul 2017 01:09:52 -0400
Received: from mail-io0-x243.google.com ([2607:f8b0:4001:c06::243]:34342)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dSG5v-00036D-0N
	for qemu-arm@nongnu.org; Tue, 04 Jul 2017 01:09:51 -0400
Received: by mail-io0-x243.google.com with SMTP id r70so4342300ioe.1
	for <qemu-arm@nongnu.org>; Mon, 03 Jul 2017 22:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=nIhcy8Z5Me9SL+cSW0vJa1C/mpVWkacKLl6yLAUkTyM=;
	b=ABiftxOYGvwQHFLKIxtmwbmg7iyVRd5Wf3hUkpI61rvv7ZW4wjepoXl2S+ZxK+fT/L
	rSLN4cGNiTURfY7Q5ku8IipJMg9prk62EB8SuSnYPFeTQnJFStfC3IEgEBNst/2caW/s
	9sh7gwoRQIaG10xPuhg9BI44F4YXewTY/s1U0plG5BQ+MFKhvw70pw8NO5awkT5UL7wm
	nqbCtsf/uW+MKe35gSer0FFa5eLBjyb85FKTfdJNbslWAA77wZO1F1aWKqyUd7Rxr868
	0sRkX9dCzRT/3uFdYYA/+z6ajkEsV0rInDECgCxK+A5QNlAVs1GxZ5MJyRhECA4mBIqU
	9Dxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=nIhcy8Z5Me9SL+cSW0vJa1C/mpVWkacKLl6yLAUkTyM=;
	b=YD5vrG+mSElAF2PyfyFdeC4QM2/vtHc6/Wx28yYfOl5dthRL7kWmaSOsC6wX/8Z7L8
	x+l9MF35H7UoCGox9k1eMRHoOOHBA9RQjFosbBWwbYVyAMNa8cBkclZVJbmUlmRivLqm
	2twjzHOkElRi267qIqDBW5iRVbbPcjeORF/kYnLlE8yAhxd6yX1Ow8ClToCfooW+LZZB
	R1ecZj3uVNsen/hfdSeH41BavTbzd2vWr++dL3lEQDmxhyAum4rq1GwjFurFO2RKuyBN
	xVADx+UD4uLSLhRLIUTYp8B87YqvdfSFjK6qHCuKEq7ferVh+pYnT6SRfJDQmhfI7/5P
	Qljw==
X-Gm-Message-State: AKS2vOwz9gNiwbao8vcN99xPSn9KhLw1amaECvPwwUW1569p2Dwjrg1R
	A73NFcrtTLxedfAj3gsPfQ3eQNhA9A==
X-Received: by 10.107.161.208 with SMTP id k199mr41004240ioe.145.1499144990375;
	Mon, 03 Jul 2017 22:09:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.139.135 with HTTP; Mon, 3 Jul 2017 22:09:49 -0700 (PDT)
In-Reply-To: <41CFADD7-21D1-4893-955A-503A6C464AC2@juniper.net>
References: <41CFADD7-21D1-4893-955A-503A6C464AC2@juniper.net>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 4 Jul 2017 02:09:49 -0300
X-Google-Sender-Auth: Ka8AF0mtmOo0Q4nWZNJC1gsFytU
Message-ID: <CAAdtpL5RtZ606Q06nBd4N7DkBOR9mwdwGOwQYXanXanmDQ7p5A@mail.gmail.com>
To: Daniel Chang <dchang@juniper.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::243
Subject: Re: [Qemu-arm] [Query]: Does QEMU support SMSC LAN9514 chip for
 Raspberry Pi2(raspi2)?
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FUeMKNtOv0sn

Hi Daniel,

On Mon, Jul 3, 2017 at 3:56 AM, Daniel Chang <dchang@juniper.net> wrote:
> Recently I=E2=80=99m trying to emulate a Raspberry Pi 2 system on QEMU(ho=
st is
> X86-64 ubuntu server 17.04).
[...]
> Raspberry Pi 2 Model B has a build-in USB Ethernet adapter using the SMSC
> LAN9514 chip. But I didn=E2=80=99t see it in the device list for raspi2.

As you noticed on the Raspberry Pi 2 the Ethernet adapter is connected
to the BCM2836 cpu via the USB bus.
On this cpu the USB controller is implemented with the "DWC USB2.0
OTG" IP core from Synopsys. This user manual is protected and only
available for Synopsys customers.
I believe this is the reason why there is no USB modeled for the raspi2.

See:
https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2836/READ=
ME.md
https://www.synopsys.com/dw/ipdir.php?ds=3Ddwc_usb_2_0_digital_controllers

> The idea is to use host tap device as backend and connected it with guest
> frontend interface(virtual NIC).
>
> But the problem is, which virtual NIC should I use?

With the announce of Docker running on ARM with the Raspberry Pi 2
example, I see few people trying to emulate the raspi2 to run ARM
containers and they have your problem for network access.

If you don't care about which ARM board emulate, I recommend you the
"virt" board which is probably the most complete and performant.

See Peter Maydell post:
https://translatedcode.wordpress.com/2016/11/03/installing-debian-on-qemus-=
32-bit-arm-virt-board/

Now if you really need to emulate a Raspberry Pi 2 you can connect it
to an IP network using the SLIP or PPP (recommended) protocol thru the
UART (ttyAMA0). You will need to disable the console login shell
(install sshd first).

See:
http://www.tldp.org/HOWTO/PPP-HOWTO/direct.html

Regards,

Phil.
