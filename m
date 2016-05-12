Received: by 10.25.208.137 with SMTP id h131csp743039lfg;
        Thu, 12 May 2016 08:24:23 -0700 (PDT)
X-Received: by 10.55.159.75 with SMTP id i72mr10151941qke.29.1463066663110;
        Thu, 12 May 2016 08:24:23 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 22si4885484qky.108.2016.05.12.08.24.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 May 2016 08:24:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58362 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b0sTO-0000hu-Jq
	for alex.bennee@linaro.org; Thu, 12 May 2016 11:24:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b0sSA-0007OY-8p
	for qemu-arm@nongnu.org; Thu, 12 May 2016 11:23:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b0sS4-0007tR-Qv
	for qemu-arm@nongnu.org; Thu, 12 May 2016 11:23:06 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:34543)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b0sS4-0007tJ-Mc
	for qemu-arm@nongnu.org; Thu, 12 May 2016 11:23:00 -0400
Received: by mail-vk0-x22b.google.com with SMTP id m188so101901196vka.1
	for <qemu-arm@nongnu.org>; Thu, 12 May 2016 08:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=QSw34vPJhlIjioInzQLZ8NtJCK7kH9o1/woZn0rfaNA=;
	b=Oi01/BJ6oMl0ZajtcTCdVtKl8JEk3LUfG0hfG52xcoxPjEvwmADY8jx/QRFPVuwcrq
	ppZymUvNfGOTEL6pV3DlTwZ1ySdy6Sv04Vc/EwZrf3KIV1Kf05F5N7RM9IDeBo0n5rqO
	1Ozd+z7kGZx04Far5B3Bmac43Q4f1monEo49Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=QSw34vPJhlIjioInzQLZ8NtJCK7kH9o1/woZn0rfaNA=;
	b=VwC9OabDvwpOpwKMiiwj3MRJiQslxblq7oNTcDg4FnFYgyvo1tdFUOCbl9jjtwxb3d
	oydUi9N/jIuDP0oZfWeSv8CZ1NspuF+fuixSLn77N39aHUfGKDbvJj9W6tPsSX0mwIgD
	0VXHYff3opYtfJh0vxBKqywSYAy07wkezYOK/aMLd3mmfoM8j7ENyS1GdhhZ3wqzpBWp
	eFEz8ttqfQk8A3ZcaJBnqQouzUOzgBf+KIJ0Ha62Ufnq1nfc4BwahoCOWY4oIzuzqub8
	RE/rKXYFcRiePd6nZkRaexh+hTcQyHh+AB7xSAIJvVfRLztYVPw3PgTpDRWG/j6LJeha
	V0tQ==
X-Gm-Message-State: AOPr4FXktB8ijvDvJ/NwDJSi3UCjhn2vPMIxhrSZjEid7KXOlW1HcFNT+xfyQuWHMHT38ZhGbxk1CR6n35iFEAqG
X-Received: by 10.176.68.162 with SMTP id n31mr5143083uan.26.1463066579988;
	Thu, 12 May 2016 08:22:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 12 May 2016 08:22:40 -0700 (PDT)
In-Reply-To: <57349AC9.5070407@linaro.org>
References: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
	<5732D667.3040105@huawei.com>
	<CAFEAcA_ptjAd-hLUmfVr=47KD9w8-cyZJuWHgSvkwZKfgU+jaw@mail.gmail.com>
	<573493A7.3030604@linaro.org>
	<CAFEAcA8BeETRW_Rm5HwGX6_y6sBez86p5-WYUZoPdin54KoTxw@mail.gmail.com>
	<57349AC9.5070407@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 May 2016 16:22:40 +0100
Message-ID: <CAFEAcA9xXO6GA3MkLEprWNSUW8ayWZkT4xcY01ek6zOvm0GP3A@mail.gmail.com>
To: Shannon Zhao <shannon.zhao@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 00/23] GICv3 emulation
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
Cc: Patch Tracking <patches@linaro.org>,
	Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <zhaoshenglong@huawei.com>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m2/WqpQvq//l

On 12 May 2016 at 16:01, Shannon Zhao <shannon.zhao@linaro.org> wrote:
> On 2016=E5=B9=B405=E6=9C=8812=E6=97=A5 22:35, Peter Maydell wrote:
>> Can you put the Image file somewhere I can download it, please?
> I just upload it to
> http://people.linaro.org/~shannon.zhao/ACPI_ARM/Image

OK, I can reproduce with that, and I think I know what this is.
If we boot a "-bios" image then we don't apply the QEMU workaround
for booting buggy Linux images which puts all the interrupts into
Group 1, and it looks like a no-TZ-support UEFI doesn't
configure the interrupt groups either. So Linux ends up hanging
because the interrupt is group 0 but group 0 is disabled.

If you apply this patch to your guest kernel you should find
it boots OK I think:
https://lkml.org/lkml/2016/5/10/297

(I'm not sure why the images I was running worked OK; I must
have been testing with an image that had that bugfix in it,
though I could have sworn I wasn't.)

I don't really want to apply the QEMU workaround when we're
booting firmware images as well as raw kernels, but on the
other hand via-UEFI is kind of supposed to be the normal way
to boot in future. Perhaps we should drop the QEMU workaround
altogether, putting everybody on the same playing field...

thanks
-- PMM
