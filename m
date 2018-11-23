Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1732649wrt;
        Fri, 23 Nov 2018 01:02:09 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Uemxip+gddEv0xUCSRFPZhrQ+e44yHOVA8fl8eGWhb0DnFzqlF/fIcGcgQfMEwAKRjEkG5
X-Received: by 2002:a37:d91:: with SMTP id 139mr13296506qkn.26.1542963729579;
        Fri, 23 Nov 2018 01:02:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542963729; cv=none;
        d=google.com; s=arc-20160816;
        b=aafcnKlGSVvT+8g450/AMD6su/0MmTgSQtcEALrKbu2R0bThFKWBiIWNEmfWdNcbHC
         GT6e2UB4qpUyOK7aUooDBf+PWjdmV4NbBSUg1t0dgcfGcRUIXPNDgwJ5Ndo6s3JwmiQm
         GCYcBxbK0zJqvwf92GQXP3kYvoDaRFcS6x/7qCYsaComqh53nrycfjxrOQmsukl+fZeb
         s+ppKayneLgqyj7y127qoSWZErh1dx3Nus5jKp1EvkHTdvk4AynDMc4kFe8/EjTZ47Lq
         xToLf1xH8KgVoR82wLjX/rEfhFtHcJwXEGOb5DjEHxx+FxSoPGkfXCJVTu67wXBBWuIT
         yAjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=9GgdJNcmb/r6okYc58WejmCW1uu64o0N3gk1WrBNbCo=;
        b=SDypuQkj6LFdBTzguPBFC4t+861kvoaXb/dPqc8gnjoa/z/bxepzXxeEnWQXzEBtNh
         Nge2BnKKNxQhFl1EgW3OkNuvq75P+MfbMU/rWkPj1I8oMmlH0kYzxjpKH/AzEXuhDZX8
         97yDAgHQR2XztWh6BAqNoEk4nnw+Om9oE/qocQNDRv6SyMlZT63Yg9VjgKKaxxIh6cj6
         AcKjTeuIxkQiVbn3bB3kPfPrcrmAew8yOpjuqZmylvNz+S3LnUt9fpcK661vbGzL3/sz
         uXymDYLxLhLcAuDXQTKnFNdqNv9qdmIyUijjvWv1N6rkUgskeqDamLOh5aiTB7ASdzrH
         8HZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G4nLfLGj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s80si143610qka.18.2018.11.23.01.02.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 01:02:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G4nLfLGj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51074 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQ7Ll-0008IP-0u
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 04:02:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51696)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gQ7Jp-0007bp-W4
	for qemu-devel@nongnu.org; Fri, 23 Nov 2018 04:00:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gQ7Jn-0004Wc-U2
	for qemu-devel@nongnu.org; Fri, 23 Nov 2018 04:00:09 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:41717)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gQ7Jn-0004VC-Ly
	for qemu-devel@nongnu.org; Fri, 23 Nov 2018 04:00:07 -0500
Received: by mail-oi1-x236.google.com with SMTP id j21so9390406oii.8
	for <qemu-devel@nongnu.org>; Fri, 23 Nov 2018 01:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9GgdJNcmb/r6okYc58WejmCW1uu64o0N3gk1WrBNbCo=;
	b=G4nLfLGjO4O2V6GZdk8/KAV3dM/VAz7v+29tA7v9OvpmhAEWzmVGNw+rwC94vUvlyl
	9eKucSrBMB03aaiLM71TQpXupta+xfUbL3wxcdLdq3tZL0p92akMUfgeAwi/5V4UJGrb
	+iX3XnPJWn+wO2bLFI+TKBQ+njZBlDFIkdh5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9GgdJNcmb/r6okYc58WejmCW1uu64o0N3gk1WrBNbCo=;
	b=O1Quf0ns60iVXfhrSgE07xaykEmK/xMI/0Lk+jhrgTXy1mOknVRCAy7qku8hkOOXgG
	X/ioodUQJ8CJScKCtBKiOO/N0z2JrMEGeUStMGYI7nV+Ik0TDzGC4SOUKBVEy09lHyx/
	CFh075hPyz3qYr64Z2sgiMQfyQObSmSJwOjrmwK6AfZxBm3/cFCpzOCMSpA892Xtw12t
	yQz97YUHyKHiH1gy8Lr4dzAm8CVj3iW5TZ7CYyHmWLjGXckfJLVBhVqanUno2tFu2AVd
	yBFFAdyOEuQ9wOa1nqyKKpP38ptALWSloKqkOwJrwt9DB3jw5aq8tT/fbByZXgUE6zhH
	L6lQ==
X-Gm-Message-State: AGRZ1gIoJCPHX5SGc5K/H9RSTvlyFpbpD6mauzNTJwbTY+MS5gzOdunM
	S+Y7BtAoyvMeEZGpMj4NLlqdR/iFjAtAg6VnwiMdFw==
X-Received: by 2002:aca:2dc9:: with SMTP id t192mr8385501oit.325.1542963606890;
	Fri, 23 Nov 2018 01:00:06 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Fri, 23 Nov 2018 00:59:46
	-0800 (PST)
In-Reply-To: <e8dae726-8853-4e44-1eb8-b9cfb0bc44f2@mentor.com>
References: <e8dae726-8853-4e44-1eb8-b9cfb0bc44f2@mentor.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Nov 2018 08:59:46 +0000
Message-ID: <CAFEAcA_EM39P8HFoC=B=XP3Ax8NgNSotn=wMJJsG05P8Ywdruw@mail.gmail.com>
To: mbilal <muhammad_bilal@mentor.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::236
Subject: Re: [Qemu-devel] [Qemu-discuss] How to select specific qemu net
 'nic' device
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair@alistair23.me>,
	qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GKdh2VXo5nIN

On 23 November 2018 at 04:13, mbilal <muhammad_bilal@mentor.com> wrote:
> Hi,
>
> I'm using qemu emulation for xilinx zcu102 platform, this board have four
> networking GEM0, GEM1, GEM2 and GEM3 devices.
>
> To run network demo on this board *only* require GEM3 device to be configure
> while other GEM devices don't need to be configure, that's why u-boot and
> other RTOS only configure GEM3 device.
>
>
> QEMU is enabling these GEM devices  with networking '-net nic' option and
> QEMU consider first '-net nic' option for GEM0 and second '-net nic' option
> for GEM1 and so on. that's why if need to enable GEM3 network device we must
> need to give following full command line options
>
> -net nic -net nic -net nic -net nic -net user, ...
>
> In this way all four GEM devices would be enable but first three GEM0-GEM2
> devices are un-configured and useless. In our case QEMU is being *crashed*
> due to trying to use these un-configured GEM devices to o send/receive GDB
> breakoint/interrupt cause. IIUC QEMU uses first device in the -nic loop
> i.e
>
> qemu-system-aarch64: hw/net/cadence_gem.c:921: gem_receive: Assertion
> `!first_desc' failed.

If QEMU asserts like this, this is a bug in QEMU. I've cc'd
the maintainers of the Xilinx board.

Could you provide a complete set of instructions to reproduce
this bug, please ? (full command line, guest image, etc)

Could you also tell us which version of QEMU you are using?
If possible, try with the current git master or
with the 3.1 rc2 release candidate we've just put out, to
see if it's already been fixed.

thanks
-- PMM
