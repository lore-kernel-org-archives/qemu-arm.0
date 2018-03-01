Received: by 10.28.91.67 with SMTP id p64csp1878788wmb;
        Thu, 1 Mar 2018 06:14:01 -0800 (PST)
X-Google-Smtp-Source: AG47ELuo9Kgq0/of42w+j+fBZiG7pn72Qu4w/puon5VwhnXvN99KK2n8vtoGjmlb8x3sHCnZWCxd
X-Received: by 10.129.46.2 with SMTP id u2mr1128461ywu.309.1519913641623;
        Thu, 01 Mar 2018 06:14:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519913641; cv=none;
        d=google.com; s=arc-20160816;
        b=A6KzENQH1V3RD57qvMq+3kAbmZ777iCdGsLop40af4nrZ5hQtmYA+31QoDgoB81AYJ
         Fp8gAd3yKvjXvkN6h/ZUqPJ3FubQ4IeTVJhCrXdQ/J9Wlcn82OGXpg1pnnVUN99DcViL
         xJndjGLp2REJuWt5Nzy7WlIGGgkn3bZ68xv32mfW0snEaWT7GK8bZzK8oSOqbtJHQH0n
         dUU70F7uvjgoDGV7PDfHMt3b2elwWIQc5sjYCWU9HDj6ayxW4JZ5UiVLTr7J5+DWxc5P
         GTd9SK5zMeV/Mt+gOEQjHBneLHIPcCVEb1bCnhVpFYSyPQUEUeiCgCQecY85AuRPB4Rn
         AOnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=u4P+9yIP8UIvh3Q1ZYHkBBI2UfZ9R2EN/fRMyM0zj3g=;
        b=HyGp1tl5kQf4Aao7VC1hXtJusFAyAEqrlvDqsRixdB6d4hvRxA/VlKhs12LtNczMh+
         NaKRPyI8I9r5iba2oQVd7TJsVSNVKtKs27pSfbyReNHd6JN1uQ40OeOXXYnQTQTjWUbt
         Dz6vWJYQLu7hUUWqnQGjCWsnu5JOhPQpH8m7JikYt56LD5hu7keA3oVw0hDPU7Ods2QF
         les3H72RoqLBKj3XQUroBg4oGZcfw2LNMHhb0DOkYfLrboKU1ediCWid3+MvcCKPfAlS
         8gADAsGOVX3sE56uu+GKUuOIYBLMTxUTGbMw/kDT8Tgoda9thiCXAB5Kvuo3FO29Kt5Q
         7GGA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p62si661907ywp.128.2018.03.01.06.14.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 06:14:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57162 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erOy9-00068E-2k
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 09:14:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1erOxp-00063C-T7
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 09:13:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1erOxl-0006uh-Sv
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 09:13:41 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:45304 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1erOxl-0006tf-No; Thu, 01 Mar 2018 09:13:37 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD809402291E;
	Thu,  1 Mar 2018 14:13:33 +0000 (UTC)
Received: from [10.36.116.91] (ovpn-116-91.ams2.redhat.com [10.36.116.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F315BAFD61;
	Thu,  1 Mar 2018 14:13:28 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1519883168-22092-1-git-send-email-thuth@redhat.com>
	<CAFEAcA9Q9+sK5S1BREuCAVp4J5tU_mexDZU9nBuett3W7bQp-Q@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8459fa75-826e-b42b-a002-e45b309d9e4b@redhat.com>
Date: Thu, 1 Mar 2018 15:13:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Q9+sK5S1BREuCAVp4J5tU_mexDZU9nBuett3W7bQp-Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Thu, 01 Mar 2018 14:13:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Thu, 01 Mar 2018 14:13:33 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH] hw/arm: Use more CONFIG switches to decide
 which object files should be linked
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
X-TUID: ln+AEDa00oHu

On 01.03.2018 14:03, Peter Maydell wrote:
> On 1 March 2018 at 05:46, Thomas Huth <thuth@redhat.com> wrote:
>> A lot of ARM object files are linked into the executable unconditional=
ly,
>> even though we have corresponding CONFIG switches like CONFIG_PXA2XX o=
r
>> CONFIG_OMAP. We should make sure to use these switches in the Makefile=
 so
>> that the users can disable certain unwanted boards and devices more ea=
sily.
>> Also introduce the new switch CONFIG_STRONGARM to be able to disable t=
he
>> "Collie" machine if it is not wanted.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  default-configs/arm-softmmu.mak |  2 ++
>>  hw/arm/Makefile.objs            | 26 +++++++++++++++++---------
>>  2 files changed, 19 insertions(+), 9 deletions(-)
>>
>> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-sof=
tmmu.mak
>> index ca34cf4..43f382a 100644
>> --- a/default-configs/arm-softmmu.mak
>> +++ b/default-configs/arm-softmmu.mak
>> @@ -133,3 +133,5 @@ CONFIG_GPIO_KEY=3Dy
>>  CONFIG_MSF2=3Dy
>>  CONFIG_FW_CFG_DMA=3Dy
>>  CONFIG_XILINX_AXI=3Dy
>> +
>> +CONFIG_STRONGARM=3Dy
>> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
>> index 1c896ba..5e1e0a9 100644
>> --- a/hw/arm/Makefile.objs
>> +++ b/hw/arm/Makefile.objs
>> @@ -1,15 +1,23 @@
>> -obj-y +=3D boot.o collie.o exynos4_boards.o gumstix.o highbank.o
>> -obj-$(CONFIG_DIGIC) +=3D digic_boards.o
>> -obj-y +=3D integratorcp.o mainstone.o musicpal.o nseries.o
>> -obj-y +=3D omap_sx1.o palm.o realview.o spitz.o stellaris.o
>> -obj-y +=3D tosa.o versatilepb.o vexpress.o virt.o xilinx_zynq.o z2.o
>> +obj-y +=3D boot.o virt.o sysbus-fdt.o
>>  obj-$(CONFIG_ACPI) +=3D virt-acpi-build.o
>> -obj-y +=3D netduino2.o
>> -obj-y +=3D sysbus-fdt.o
>> +obj-$(CONFIG_ARM_V7M) +=3D highbank.o netduino2.o vexpress.o
>=20
> This is definitely wrong -- highbank and vexpress are not V7M
> platforms.

Ooops, sorry, seems like I mixed up V7M with v7-A :-(

> Netduino2 is a v7M platform, but I don't think we
> should be making it conditional on ARM_V7M -- we have per-board
> configs for other boards, so you'd have a CONFIG_NETDUINO2 here
> if you wanted it.

OK, I think I'll simply introduce proper config switches for all three
boards.

>> +obj-$(CONFIG_ASPEED_SOC) +=3D integratorcp.o musicpal.o versatilepb.o
>=20
> This is wrong too -- none of these are aspeed-based devices.

*facepalm* ... looks like I grep'ed that wrong (I was searching for
"arm926" IIRC) ... I'll add proper config switches for those boards, too.

 Thomas
