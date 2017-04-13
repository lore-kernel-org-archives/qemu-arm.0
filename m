Received: by 10.25.0.144 with SMTP id 138csp675481lfa;
        Thu, 13 Apr 2017 03:33:55 -0700 (PDT)
X-Received: by 10.55.11.21 with SMTP id 21mr2028833qkl.78.1492079635856;
        Thu, 13 Apr 2017 03:33:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i60si18587904qtd.46.2017.04.13.03.33.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Apr 2017 03:33:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48443 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cyc4X-0007Xi-4t
	for alex.bennee@linaro.org; Thu, 13 Apr 2017 06:33:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1cyc4T-0007VP-A0
	for qemu-arm@nongnu.org; Thu, 13 Apr 2017 06:33:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1cyc4S-0006uS-KA
	for qemu-arm@nongnu.org; Thu, 13 Apr 2017 06:33:49 -0400
Received: from mail-yb0-x242.google.com ([2607:f8b0:4002:c09::242]:35954)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1cyc4Q-0006tP-An; Thu, 13 Apr 2017 06:33:46 -0400
Received: by mail-yb0-x242.google.com with SMTP id l201so2173573ybf.3;
	Thu, 13 Apr 2017 03:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=44855MEU+9MzlZCdgjlmOd7+OVqKPDsS7/SEwEsHESM=;
	b=GlR1cBAUnZWMpq1u5jLhAcYAs1vgeQqoLSW6uCGDmIFmnVx1GB+/wE5pLe1VxEAI4D
	vlV5Ty3UOdYQNbkrXwGO+QoWb7DQwPnCSXgz9f4DdUOQXUSwrDIDIIHB4Tg0IoIGELOw
	ZgZM60zcin5AcxbY9ONwSXswGtDATk1w19MIMO5cHgUKIJwIyE9O83m3W8lNTx1fkOv2
	lmKddKWNQprdsEKIaiTbllW4OGFCmhJ+XS6lb9LiqP6GVAdWRJodhxJsWH/BrkDz4+Z1
	tuZwXkpVX9f4199t1d3v87Xtw6tkGuvHsjRW+a+0EVFUbZQADWc1Z7F/0Cul5TH3fCkN
	nNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=44855MEU+9MzlZCdgjlmOd7+OVqKPDsS7/SEwEsHESM=;
	b=gzv6HGfnwAegSxo8Q/9hSpc/BrUBh3URCNj3mzRgk/v7ySVzlrzt2tOIiYtJ69jS9L
	R4n0d8NHGuQyHo5tNRbFbriTT+wfyBM1OVziorwliGWEQcGm0BAHypxlhmyOuuywwvX5
	ajA0RN9M6ghJo0twgjT1ACjcLGi8X6nSay2z7jA4hcKF2Z+Wzcos4r/Xn6pfiMS0QlQE
	MLADN1XT30dnVs1/N+n5AUd64c4mt6LJSZ1c8kOLgRhyo6AvozC12L+Cr+GFVhMUzIch
	Cm308d2H1VE97XFVacKqXV78oT30vwpof0V3Asab5YGk/XwXoZSvcx7x/ZvzZiZSQrhd
	b76g==
X-Gm-Message-State: AN3rC/4tf965MPAiPNfv7ZUuQnlvo15eSsr9SHBpAeSkdxVH+uInZozp
	I0LvE5NzgN+2he90M7JHCWLVbM/THg==
X-Received: by 10.37.172.100 with SMTP id r36mr1678889ybd.107.1492079625715;
	Thu, 13 Apr 2017 03:33:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.244.1 with HTTP; Thu, 13 Apr 2017 03:33:45 -0700 (PDT)
In-Reply-To: <CAFEAcA9V0A9XvjtXHkq4RKmPDwRPuUgqwncy_hXMzv_FyVrD_w@mail.gmail.com>
References: <1491736758-19540-1-git-send-email-sundeep.lkml@gmail.com>
	<CALHRZurSfOAt53Sf=aGdGe7cHCxNggjUrt6pPDEQLRcvfX_cDA@mail.gmail.com>
	<CAFEAcA9V0A9XvjtXHkq4RKmPDwRPuUgqwncy_hXMzv_FyVrD_w@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Thu, 13 Apr 2017 16:03:45 +0530
Message-ID: <CALHRZuqYCgJ7PBFv1Wh+WCf2wzNS+V72400qkP7BQO5DM-D6xA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c09::242
Subject: Re: [Qemu-arm] [Qemu-devel RFC v2 0/4] Add support for Smartfusion2
 SoC
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gxsrEDkUkzXr

Hi,

On Thu, Apr 13, 2017 at 3:14 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 13 April 2017 at 04:21, sundeep subbaraya <sundeep.lkml@gmail.com> wrote:
>> Hi Qemu-devel,
>>
>> This is my first attempt in Qemu.
>> Please let me know am doing correct or not.
>> SoC is cortex M3 based so no bootrom stuff and unlike other
>> SoCs Qemu need not load dtb and kernel in DDR. Hence am using
>> u-boot (supplied with -kernel) as bootloader in eNVM and it loads
>> kernel from SPI flash to DDR same like real hardware scenario.
>> Also let me know any other Maintainers need to be CCed.
>
> Hi -- thanks for the patchset. I've put it onto my queue of
> patches to review, but it may be a little while until I
> can get to it (especially since it's the Easter holiday
> in the UK right now).

Thanks Peter. Happy holiday :)

Sundeep
>
> -- PMM
