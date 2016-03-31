Received: by 10.25.208.211 with SMTP id h202csp278978lfg;
        Thu, 31 Mar 2016 10:24:35 -0700 (PDT)
X-Received: by 10.140.93.79 with SMTP id c73mr17766465qge.101.1459445075332;
        Thu, 31 Mar 2016 10:24:35 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y98si8216741qgd.112.2016.03.31.10.24.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Mar 2016 10:24:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33533 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1algKg-0002Nq-Rf
	for alex.bennee@linaro.org; Thu, 31 Mar 2016 13:24:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42760)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1algKB-0001qd-4P
	for qemu-devel@nongnu.org; Thu, 31 Mar 2016 13:24:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1algKA-0006aN-7N
	for qemu-devel@nongnu.org; Thu, 31 Mar 2016 13:24:03 -0400
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:34670)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1algKA-0006Zo-4D
	for qemu-devel@nongnu.org; Thu, 31 Mar 2016 13:24:02 -0400
Received: by mail-vk0-x229.google.com with SMTP id e185so111984346vkb.1
	for <qemu-devel@nongnu.org>; Thu, 31 Mar 2016 10:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ILVZ8HmUcopZu0NJNPsDxKhyyEg1UxxP621ri9846t0=;
	b=ar0KoVqSe2G6hm0BXNhm+IEXJCbsk7HX7+vKCn0EtH9xOcrwl3OVgIA0CIiMlj1fLK
	9yuve8HRXenMlS9b0G/w3T/SasHfEQR7BlmsAbFWcwSVMIQx4Kymm1MP50bpOC5ZmXB6
	T7QgxDwSG30uyH0U9luoaHeoAyACosy2znfsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ILVZ8HmUcopZu0NJNPsDxKhyyEg1UxxP621ri9846t0=;
	b=BHTvrSsWS6dZqghrgDJi2kNGT7pg0zhn6xl9ruzn+0/78ER/Tifckp8/kW4zidI0lp
	p6JjeoaJi7Stn3l6whfLLe0JPyyGqpQZ4hPwuPHt3AqtQK8H7xrdJ+yTeGCTx++pX9Dl
	WWOYLRCWkV19lN5sj7gwHQW7VGvQPNTNwAJy6FenKOFgsx9TkxjkQikGuQE+4ZN/cWt3
	Fk9bROMSNdm7eBA/xVmDusGhu1+zf92vnc4FD+aFdtNLojKEAaYvrDx2LoiyMfsdJdyW
	08gH+MeXRnqPX+1OMiIxtAISqxlgKVwz1ZAn8xcFzIN56yjsGTHoUSSaGRGpqTV4pxey
	Ahag==
X-Gm-Message-State: AD7BkJIjffLyO9151aotAz3AVHwE24Azb4T7Y2E8ZrkOmuKbFV+3y7pXi93MFPxoOrAmCSHENd5RxQJ0jYWHHfPT
X-Received: by 10.31.8.210 with SMTP id 201mr58580vki.90.1459445040302; Thu,
	31 Mar 2016 10:24:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 31 Mar 2016 10:23:40 -0700 (PDT)
In-Reply-To: <1459341140-16892-1-git-send-email-thuth@redhat.com>
References: <1459341140-16892-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Mar 2016 18:23:40 +0100
Message-ID: <CAFEAcA9HYw0f=tt6VQVX90w=tPLfgQre+TwWt4ke6y-wxrUcOw@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Cc: Evgeny Voevodin <e.voevodin@samsung.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Dmitry Solodkiy <d.solodkiy@samsung.com>,
	Maksim Kozlov <m.kozlov@samsung.com>
Subject: Re: [Qemu-devel] [PATCH] MAINTAINERS: Delete invalid maintainer
 entries of the Exynos section
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3LySmXNAL6OL

On 30 March 2016 at 13:32, Thomas Huth <thuth@redhat.com> wrote:
> Mails to these e-mail addresses are rejected by the mail server
> of Samsung with "User unknown" messages, so it seems like these
> Exynos maintainers are no longer available.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index afbe845..12eb3fd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -357,10 +357,7 @@ F: include/hw/timer/a9gtimer.h
>  F: include/hw/timer/arm_mptimer.h
>
>  Exynos
> -M: Evgeny Voevodin <e.voevodin@samsung.com>
> -M: Maksim Kozlov <m.kozlov@samsung.com>
>  M: Igor Mitsyanko <i.mitsyanko@gmail.com>
> -M: Dmitry Solodkiy <d.solodkiy@samsung.com>
>  L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/*/exynos*
> --
> 1.8.3.1

Applied to master, thanks.

-- PMM
