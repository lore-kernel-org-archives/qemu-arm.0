Received: by 10.25.208.137 with SMTP id h131csp712062lfg;
        Thu, 5 May 2016 05:48:44 -0700 (PDT)
X-Received: by 10.194.158.69 with SMTP id ws5mr14051447wjb.17.1462452524922;
        Thu, 05 May 2016 05:48:44 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id qn6si11271491wjc.143.2016.05.05.05.48.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 May 2016 05:48:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53377 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ayIhf-0000eD-Ph
	for alex.bennee@linaro.org; Thu, 05 May 2016 08:48:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ayIhX-0000Qr-50
	for qemu-arm@nongnu.org; Thu, 05 May 2016 08:48:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ayIhC-00018W-Es
	for qemu-arm@nongnu.org; Thu, 05 May 2016 08:48:13 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:32770)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ayIhB-00011I-8K
	for qemu-arm@nongnu.org; Thu, 05 May 2016 08:47:58 -0400
Received: by mail-vk0-x235.google.com with SMTP id o133so23697690vka.0
	for <qemu-arm@nongnu.org>; Thu, 05 May 2016 05:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tyZrT+gQMxE+HZZV8QtmA5+il+MX6fuML1Q4EleeBag=;
	b=eeQycDEaH8/bx0BLGE0ODUL/zlUCPvEuCCgB/W0/Ahb1OvBG1ZL97Ww8EJckhFcoEm
	t8nhvMXcF+6sFpFIiwpjgmBbZw/Recdz6UiFufIY2205gBtxhqo9ObZ0Y5qoQZP+tbnH
	qaI56PUs87YbcoX2Xh1apW94v7T0LjYmrnuvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tyZrT+gQMxE+HZZV8QtmA5+il+MX6fuML1Q4EleeBag=;
	b=MRbhCQDnUfrqPsPh1qiOdxg4Z5Msnw0xcICP6XRhz4Z+ETD2cPus/xMPSawGy33JWt
	UHntjB06OxEHH8TWk9SSHPNx5Utmslkrt0NOM4+EvpJHoNtxU1QHvv25qfRkdfOjrUb4
	/YZIvUtpsJ6VApblVT8VjljczB9B5I6P8+vfzt6ByFPoM38iEjxo+Tu17/5D/3JilDuU
	mhM3yFsehE4RULUjWtS5Pux2ottV3jhQl1esvZj1qYTXnr0Y8GKrkGdtrxT+wC4qSVT9
	b3Qft48umFtpFHare/G+R3VE5WiJyF410RmNNIBHJ8k8b5L9H8NK1LhKBdj4cc3sGLHo
	iILw==
X-Gm-Message-State: AOPr4FX1Abrk0Ktd6HUMx44CjVgGSE/6cM3KI0d4jY6ikKMs2osunpu6kGr7Rdoeb3hEo0emcMMr9ltDT0gqCjBp
X-Received: by 10.176.0.204 with SMTP id 70mr9544781uaj.4.1462452455350; Thu,
	05 May 2016 05:47:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 5 May 2016 05:47:15 -0700 (PDT)
In-Reply-To: <1462417489-28603-4-git-send-email-zxq_yx_007@163.com>
References: <1462417489-28603-1-git-send-email-zxq_yx_007@163.com>
	<1462417489-28603-4-git-send-email-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 May 2016 13:47:15 +0100
Message-ID: <CAFEAcA8io8mxvragDfEDiEkysfbceP_ebE=ExSX1RzdwvrogXg@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RESEND 3/5] hw/display: QOM'ify
 milkymist-tmu2.c
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Michael Walle <michael@walle.cc>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	hirofumi@mail.parknet.co.jp
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5EiiUouI7sS1

On 5 May 2016 at 04:04, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> * Drop the old SysBus init function and use instance_init
> * Move tmu2_glx_init into realize stage
>
> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

> +static void milkymist_tmu2_realize(DeviceState *dev, Error **errp)
> +{
> +    MilkymistTMU2State *s = MILKYMIST_TMU2(dev);
> +
> +    if (tmu2_glx_init(s)) {
> +        error_setg(errp, "tmu2_glx_init failed.");
> +    }
>  }

The milkymist maintainer might have a suggestion for a
more informative error message here.

thanks
-- PMM
