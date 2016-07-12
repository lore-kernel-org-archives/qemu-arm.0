Received: by 10.25.21.156 with SMTP id 28csp484860lfv;
        Tue, 12 Jul 2016 10:10:55 -0700 (PDT)
X-Received: by 10.55.18.86 with SMTP id c83mr4504945qkh.187.1468343455075;
        Tue, 12 Jul 2016 10:10:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a81si2970429qkg.57.2016.07.12.10.10.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jul 2016 10:10:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42288 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bN1Cw-0005XH-I2
	for alex.bennee@linaro.org; Tue, 12 Jul 2016 13:10:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59725)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bN1Cs-0005TG-Ed
	for qemu-arm@nongnu.org; Tue, 12 Jul 2016 13:10:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bN1Cq-000517-Dd
	for qemu-arm@nongnu.org; Tue, 12 Jul 2016 13:10:49 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:33819)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bN1Cq-00050x-2s
	for qemu-arm@nongnu.org; Tue, 12 Jul 2016 13:10:48 -0400
Received: by mail-vk0-x22b.google.com with SMTP id o63so31049242vkg.1
	for <qemu-arm@nongnu.org>; Tue, 12 Jul 2016 10:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=2ADkbZtwb6QsYjJbLNcvTeIbWvM+GTh67f0rCnTy7iM=;
	b=ZQ5tHPAqQ4G4FuCG5AHrxkVKelGGrqj0E0bV/h5JL500qOvtRSqAcxMW00btTnTO7Z
	c0NGD1ZQQV8IYe+215LqRnEC2A/5DLwIVhTWSZgwHQHp45IDJzH3O8sWtyP1Ek7kx2fT
	p4CiPiAEeJQRvmPGHk41uZfWt2UfKQpXvf3MA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=2ADkbZtwb6QsYjJbLNcvTeIbWvM+GTh67f0rCnTy7iM=;
	b=EKbwRQ4NUeoH6I0WxbEpLHUSxmnWaH5qQq2Dkdkc99SUYk38Bnh2FXC8uA8eJycCcK
	Y9pdxtNxnm1bV80A8buvTt6TkGphMPwnHij0cFBD2pX3ClbrhhyQ+jFWeqRo+cpGlYVl
	Ca7/4SmE30IBcLukHcHUTGwwyNwIRGU6ujDfKZhvVqWdakAC5sKamyoXPlz378EXHHjT
	rTDAGRajFqCEDFTQlLjQ1MwVVLTO7tbhBiPftapq56xBU4MzIiCwseJkHNGLt8q3GsvM
	/0y9rxc0omKVc3u0Ouu+oWVCu1jjHX9BKAWDKtAz9kFEiVb5hj3icEPduF6E77kWtsLl
	mnCQ==
X-Gm-Message-State: ALyK8tL0MXWORKL90/WGRdWa8CyowilFxwItgk54am10YOBJxPlRTtjUByrkNTWRUdtsn4AmqWPttkmMfDr2x4kq
X-Received: by 10.176.69.180 with SMTP id u49mr1704519uau.24.1468343447642;
	Tue, 12 Jul 2016 10:10:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.69 with HTTP; Tue, 12 Jul 2016 10:10:28 -0700 (PDT)
In-Reply-To: <08ab3354-d97f-2f80-b6d5-d8169b46e199@kaod.org>
References: <1467994016-11678-1-git-send-email-clg@kaod.org>
	<CAFEAcA_pvYaFuo=U_LjnD6-+2iHzbaAahjTMxf_X41+BGDR0vA@mail.gmail.com>
	<08ab3354-d97f-2f80-b6d5-d8169b46e199@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jul 2016 18:10:28 +0100
Message-ID: <CAFEAcA_PyFHsgsPQ_gsqDaigAGMUVX0SYS54c9YzFg5TMpHK_w@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Subject: Re: [Qemu-arm] [PATCH 0/5] ast2400: some cleanups and a simple
 memory controller model
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VAP3x7vIlqVg

On 12 July 2016 at 17:20, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 07/12/2016 04:19 PM, Peter Maydell wrote:
>> Hi; the release process is now at the point where I wouldn't really
>> want to put this into 2.7; I can be persuaded if you have a solid
>> justification, though.
>
> Here is my take to it  :
>
> * 1/5 hw/misc: fix typo in Aspeed SCU hw-strap2 property name
>
>   That's a minor fix
>
> * 2/5 ast2400: replace aspeed_smc_is_implemented()
>
>   That is not a fix but it removes some ugliness in the code, which
>   you had noticed, and which prevents us from fixing possible issues
>   nicely. So this is a preventive cleanup :)
>
> * 3/5 ast2400: pretend DMAs are done for U-boot
>
>   This is a work around fix. U-boot[1] uses DMAs to calibrate the
>   SPI flash module. It will spin until the DMA transfers are done.
>
> * 4/5 ast2400: externalize revision numbers
>
>   This is minor fix de-duplicating code and a prereq for the next
>   patch.
>
> * 5/5  ast2400: add a memory controller device model
>
>   That's an enhancement. It adds a basic device model for the memory
>   controller. This is needed by some version of the SDK relying on
>   the configuration register to know how much RAM the SOC has. Older
>   versions used a hardcoded value.
>
>
> The first patches should not be too much of a problem regarding the
> soft freeze. The last can wait 2.8 if you prefer, we need more work
> to fully support u-boot anyhow. I would be happy to have review
> though :) The model is very much like the SCU.

Thanks for the explanation. Patches 1-4 look straightforward
and I have put them in my target-arm.next tree. Since patch
5 isn't sufficient to get u-boot to work I think we should
defer it to 2.8. It is still on my to-review list.

-- PMM
