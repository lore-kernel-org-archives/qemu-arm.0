Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp281956wrx;
        Fri, 12 Apr 2019 01:33:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxlssO1t8W6gV9rwjKouSIr1qe4Y21gg8HUu1h7/zrMTR9+kTuIMoORhd2czlE8CeiPSUjN
X-Received: by 2002:adf:f3ce:: with SMTP id g14mr33875404wrp.129.1555058017189;
        Fri, 12 Apr 2019 01:33:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555058017; cv=none;
        d=google.com; s=arc-20160816;
        b=xLSt0XMFARunT+F1pBzdieEjl0FFQSXjnLhx4yxIkN1SHGRTpiCSeDh+0C+2/1FrG0
         UDl0RbmyPzyPhlPzz9KXO/bZwq/k/V1WUPsE8q1ZowQjBO5/ujiV3Q5A/F3ie5BCPALF
         wASSrm3qaS6BVxbLzYRETZtHnVMyiJDjGxkuUhnmuD19tv2uu6uZ3767aPXWpIPKH+Pg
         ITJJJMxdqeCXsv+3IxwV6ddP7EANbVXBLdP7uvEf+ppzd4pw3NrVWv1DOe/hX3eyqI0i
         oU9RR5Z68JrW3pH0dLmgJfeu9SrYYlUVpD67qMT7T/2uQYaM6LiPNaSsQli3hps7fkTw
         aKhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5Kpo5adyFixlUGIM6m6ndorhrikg3t7PotjxeaE/lxA=;
        b=BzM3FVlkswoAD8Y4NCSWgw9JFmRmeFdpm40lM7c/nZqJTdO3pQuHBAzj1NBuhT9+JB
         ZAlIIA1FIYhCEn7/qN2FlV09chxENZIJNx013qwTMe7TpY0I2Z9Zg0tir1PS8eJMmQnU
         aYApHXGUG9jN4xCPdnURgmne+P9Ju+MwubKsjoRMCWRQTObH6JcpGVWJ8GnbrN2G99hz
         5GUoR3ASmARCFPDKTWaOG5jQNgLvRUpXtt+E0HFKl/e1K+pwGp0oEzF5ml+E68IGKPaD
         kDyIy6X9Mnwvyfp6yf2euaZ/4AlCnYELkY1dYAKZoqksIAGztFAHpAPazqkOnVA1OfNw
         H1JQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=r2VpJ3D8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s80si4909052wme.55.2019.04.12.01.33.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 01:33:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=r2VpJ3D8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:60832 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hErcu-0000h1-94
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 04:33:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46707)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hErcg-0000d3-1U
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 04:33:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hErcc-0002T1-2S
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 04:33:21 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:34653)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hErcZ-0002P0-Be
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 04:33:15 -0400
Received: by mail-ot1-x32a.google.com with SMTP id k21so7713575otf.1
	for <qemu-arm@nongnu.org>; Fri, 12 Apr 2019 01:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5Kpo5adyFixlUGIM6m6ndorhrikg3t7PotjxeaE/lxA=;
	b=r2VpJ3D8077Vw5YXT6diyH00n6+ZUYUYRQJykGHrTyRm8FPLDbDbiptneFVwC5lsLD
	or6skTPjg6y1KNFWM+08beNUDoVJxLOax0h2R9QNiIL7a3Soedv5YrKUaGj1EbwIWHlS
	tYqAYtlolWo72/vTquFdPWPwtMlzGp2vQ6D05p/dMyOTWUnuQEK7p13dUCMTi8/67cFi
	tbd+swVoQBZjC0aHSSLxDD0KuBrglMBnXd27W2xGfReKzMyXUzF++n3J8t91TTFTc7S0
	e/a59ZTp2MP6jCJvfCLNPeaMThZL37+RFNZ6X/WscwaaJW3/Ya6u4qolik7NWAVzNMsy
	1AnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5Kpo5adyFixlUGIM6m6ndorhrikg3t7PotjxeaE/lxA=;
	b=gWyZB/wQfOm2MKNcejNvlxx+9/SJD+d8p556r9mztWD+aicHS9udn2h7JkInrSyhY8
	jZcEt8kmDeBTu+W9nnglrxa8rjPyBfTTdUsjxNtQNRg2tcsXC0T3ny8i6A9AAdkk4VCy
	LE5L87VGjTp4ZihuayiBQ9WB1uyMyaWwkcOt0g8S3ycbz88SIlooB3meyiAguNJ8mFl7
	d/HtE4+opxQi39WLSDAUaTrxuo7rfNIGy/QHmBtFO8rMafChhMKiNXXBnoPR4dqN7XZn
	lNroPz3KujDFR6pHJRM+lpQFX/2+Ats30EdZhCKbz+vvlG6MhlErZEp/4dLkxldcs1sW
	9Ppw==
X-Gm-Message-State: APjAAAUSCD7PqNOXQRSkUVUZ5pd0km/k5h21ZYTv2I6RIo3qJRMCbEeJ
	oBvZNC99x7DMRK/B0RIUepEn4TmY+IoAbtjgCWfY4Q==
X-Received: by 2002:a05:6830:1cb:: with SMTP id
	r11mr30510453ota.302.1555057992430; 
	Fri, 12 Apr 2019 01:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <CANY2w+3iU1m9exqE2qMJj+OXcHThm2Q3jxFdDn9FWwKC6JhKUg@mail.gmail.com>
In-Reply-To: <CANY2w+3iU1m9exqE2qMJj+OXcHThm2Q3jxFdDn9FWwKC6JhKUg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Apr 2019 09:33:01 +0100
Message-ID: <CAFEAcA9B-7j9ws-vaChqx1uZOA_QDzQYPixNeGDmonLXeZ9vNQ@mail.gmail.com>
To: Da Zhang <daz3@vt.edu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::32a
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
X-TUID: URGUq2q0yzz/

On Thu, 11 Apr 2019 at 23:16, Da Zhang <daz3@vt.edu> wrote:
>
> Hi guys,
>
> I am trying to create an Ubuntu ARM disk image for my gem5 ARM experiments. The installation always shows "No network interfaces detected".
> This is my command for running qemu:
>
> qemu-system-aarch64 \
>     -cpu host \
>     -device virtio-scsi-device \
>     -device scsi-cd,drive=cdrom \
>     -device virtio-blk-device,drive=hd0 \
>     -drive "file=ubuntu-16.04.5-server-arm64.iso,id=cdrom,if=none,media=cdrom" \
>     -drive "if=none,format=qcow2,file=ubuntu-16.04.5-server-arm64.img,id=hd0" \
>     -pflash "ubuntu-16.04.5-server-arm64-flash0.img" \
>     -pflash "ubuntu-16.04.5-server-arm64-flash1.img" \
>     -m 1G \
>     -machine virt \
>     -enable-kvm \
>     -nographic \
>     -net nic,netdev=n1 \
>     -netdev user,id=n1 \
>     ;

This command line doesn't specify any ethernet device
interfaces, which is why you have no networking.
I would recommend
 -netdev user,id=mynet -device virtio-net-pci,netdev=mynet

though other kinds of network device will work too,
like the rtl8139 that Narcis suggests. virtio-net will
give the best performance.

PS: I have suggested virtio-net-pci because we recommend
the PCI virtio over the virtio-mmio that your command
line is using for virtio-blk. Your guest OS will need to
have the PCI support enabled, though. There is also a
virtio-net-device which will use virtio-mmio. If PCI
works for you I would suggest switching your virtio-blk-device
use to virtio-blk-pci, and similarly for virtio-scsi-pci.

thanks
-- PMM
