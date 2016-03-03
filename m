Received: by 10.25.208.211 with SMTP id h202csp2736045lfg;
        Thu, 3 Mar 2016 06:48:31 -0800 (PST)
X-Received: by 10.140.152.78 with SMTP id 75mr3549423qhy.22.1457016511014;
        Thu, 03 Mar 2016 06:48:31 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f68si7358050qge.89.2016.03.03.06.48.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 06:48:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35596 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abUYI-0001Ut-Lg
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 09:48:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1abUYG-0001Sm-84
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 09:48:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1abUYD-0005AT-2V
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 09:48:28 -0500
Received: from mail-lb0-x22d.google.com ([2a00:1450:4010:c04::22d]:34911)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1abUYC-0005AM-RA; Thu, 03 Mar 2016 09:48:25 -0500
Received: by mail-lb0-x22d.google.com with SMTP id bc4so26040394lbc.2;
	Thu, 03 Mar 2016 06:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=iyJo0G8asHKKcwUe1Vdpd/NbFbZFT5mZSA7Ba+SVw9s=;
	b=spbKKyIYwP5hVpXtS6ClHrqNrH3U1VpzMVR7bPhP0k6uG7+NE+c6hiRxCqxE/xSRRE
	CXmJ6zsnNEkjIuBCPv5s/fD5Gc0smwvZTG9ONqRpcHjeR1WV2xvRK6t4MJNV/gWfh7i/
	yCpY6GNsYyy2xT7n8n0gR8/kOIWEcBBDIIUiKy5MM5NdZqm76kSaG5psVmJIDSYzeIlB
	AkuCrkAY0gh6MpUopIQprEKvQjMMKr517sRiQ8O6fHHmQDGo5Fg7y1gN0hwprwF7mQ1F
	lz8+auKrc7l0K2nUGTb3GWEdA+Mt8LrqbzM17TBJjezWzu+EaKDrWv+FObelrSBXBfLS
	Gcpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=iyJo0G8asHKKcwUe1Vdpd/NbFbZFT5mZSA7Ba+SVw9s=;
	b=T4a4kwE3VErd2zMb7OFqwH8xcVKGjktQzBowFdKpSIWbexQZ9ARekCw1yPMMiMygdl
	FB0WPv6vQ1lEgjaZRIh/v53MNCbTenrI12vvAs5yqSuWT3vY+a80/q2kPuAJBxiztMo5
	8wspvaDAdwo0yGrWjSbnPmfz0pYSqtn9et5l724YZPhj3dPxiotqwS6abZO+xxjJiTKQ
	omsWahZRGCCJy2K+c3vqhi4KG2rIF/MC04hiAovEhjbXEXtlPA54AmXr3fdppcXauxX4
	VwoqAVRPRycb3RKD457vNuKfYZdllLXx4xLOjDef7pBksQ8erzx19ppCDJKTOqjYSjJt
	pxPw==
X-Gm-Message-State: AD7BkJKZTD9rE8DLDb3ziZml2dnmePPRD8Q3KaUfBsATVFkYHPOzMc5poKb5D7Pnts6O4A==
X-Received: by 10.25.16.80 with SMTP id f77mr1183949lfi.80.1457016503882;
	Thu, 03 Mar 2016 06:48:23 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	rd3sm6242381lbb.2.2016.03.03.06.48.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Mar 2016 06:48:22 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1456941872-8791-1-git-send-email-afarallax@yandex.ru>
	<56D73CB6.7040702@gmail.com>
	<CAFEAcA9gPrmcn3TNUueei1f5V0QMr-Nox9JHEE23EsQxbEO9qQ@mail.gmail.com>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56D84EB5.30808@gmail.com>
Date: Thu, 3 Mar 2016 17:48:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9gPrmcn3TNUueei1f5V0QMr-Nox9JHEE23EsQxbEO9qQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::22d
Cc: Sergey Sorokin <afarallax@yandex.ru>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target-arm: Fix translation
 level on early translation faults
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
X-TUID: 8hywzSrsTr2B

On 03.03.2016 16:49, Peter Maydell wrote:
> On 2 March 2016 at 19:19, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
>> On 02.03.2016 21:04, Sergey Sorokin wrote:
>>> Qemu reports translation fault on 1st level instead of 0th level in case of
>>> AArch64 address translation if the translation table walk is disabled or
>>> the address is in the gap between the two regions.
>> It's probably not a very clear description in the commit message. IIUC,
>> level 0 fault is reported in case of any fault from TTBR in AArch64 state.
> Yes (though you mean "under an AArch64 translation regime"). Conversely, the
> only fault reported at level 0 under an AArch32 translation regime is
> the AddressSize fault (for bad addresses in TTBR0/1), which we don't
> currently implement.
>
> There's also a code path later in the function that does
>     level = va_size == 64 ? 0 : 1;
>
> but I'm not sure it's worth rearranging that code to avoid the
> duplication of "what level do we report this kind of fault at?".

Right, but actually I think this patch is going to fix the two "goto
do_fault" cases which can happen before this "level = va_size == 64 ? 0
: 1", namely the EDP check and the check for virtual address which is in
the gap between TTBR0 and TTBR1 regions.

Best regards,
Sergey
