Received: by 10.25.208.211 with SMTP id h202csp2736722lfg;
        Thu, 25 Feb 2016 02:53:13 -0800 (PST)
X-Received: by 10.140.21.229 with SMTP id 92mr32623390qgl.89.1456397593843;
        Thu, 25 Feb 2016 02:53:13 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d21si7527300qkb.86.2016.02.25.02.53.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Feb 2016 02:53:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:42085 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYtXl-0005kI-Ek
	for alex.bennee@linaro.org; Thu, 25 Feb 2016 05:53:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYtXi-0005fo-0u
	for qemu-arm@nongnu.org; Thu, 25 Feb 2016 05:53:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYtXh-0006fP-6t
	for qemu-arm@nongnu.org; Thu, 25 Feb 2016 05:53:09 -0500
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:34757)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYtXg-0006de-03
	for qemu-arm@nongnu.org; Thu, 25 Feb 2016 05:53:09 -0500
Received: by mail-vk0-x22e.google.com with SMTP id e185so43768133vkb.1
	for <qemu-arm@nongnu.org>; Thu, 25 Feb 2016 02:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=33HwxscxNuv/WYdOoy7ZNPhyKdg/LLg1UW8hDAqZ7CY=;
	b=V0K5CYAjMO3M6o1VFySi3iSOKtW4jhvtmbM49v4LvH7M5cYqY1u87dNQn3AMptTyIt
	KNeJkegpFKwekKVCz8PFS67MeXuOt9ZD619DfI53utdyd4vCYLh3Brax/1MwX/LMMTVo
	UT317foSH3SE0rkh1Tt77UVCWbi12flMrxxEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=33HwxscxNuv/WYdOoy7ZNPhyKdg/LLg1UW8hDAqZ7CY=;
	b=Vkl+oFpAHSq+BwOtbqqL2AmQUUSgo6JqwyrnpBr1ndWqiHWXoYYqHuA06C49lEYonJ
	Y053hKyacSJEobnILstcTTcb7Iddlh54HppvvfdyXGVzjf6dqLSlLSiBN1ramGYj+nK4
	Y6GVrUv53k1fACV8sCYlg4fSpFO9NYKKsjRZe3XFDGg8pqlwbomLm295UpSCHrC6CyQl
	ipiS7IhEMCCrbxFTiPMzMfyVG2Uwmjk6WIsRdr8A+ebKEw2IF4CMC0KWDyPG53Ba2aKe
	Rga4rPTUzalY3UlDlv89NJ8el0Dg+pWpVqJvIAty2bEkv98MLFCmoMFSbB7/91TJUxXX
	dr9Q==
X-Gm-Message-State: AG10YOQ7UF1WcONXp7Ep0agMa8ADJReMnWXgUgQIBb+NwVbWEf/Ni+PtTIX77nAf35a2HKnCBSj4ReXA0sc4iOcU
X-Received: by 10.31.52.147 with SMTP id b141mr36354017vka.82.1456397587509;
	Thu, 25 Feb 2016 02:53:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 25 Feb 2016 02:52:48 -0800 (PST)
In-Reply-To: <1456396236-2759-5-git-send-email-zxq_yx_007@163.com>
References: <1456396236-2759-1-git-send-email-zxq_yx_007@163.com>
	<1456396236-2759-5-git-send-email-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Feb 2016 10:52:48 +0000
Message-ID: <CAFEAcA_nMFNx43_82otsKUM3os=Py+oWARCvN0NAt=+_mv4OoQ@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-arm] [PATCH v5 4/8] hw/timer: QOM'ify m48txx_sysbus (pass
	2)
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
X-TUID: lzopeyWmkw5l

On 25 February 2016 at 10:30, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> assign DeviceClass::vmsd instead of using vmstate_register function
>
> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
> ---
>  hw/timer/m48t59.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)

So, did you test this, and if so what did you do?

thanks
-- PMM
