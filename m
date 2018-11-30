Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3501704wrt;
        Fri, 30 Nov 2018 04:13:53 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WSmJLIcRXGJzCAEcnwL82+wWbqoAQeJ3Kd0Emon7wLkCVo5UgciQBmYvzvSiE92aj8++hu
X-Received: by 2002:a25:a08a:: with SMTP id y10-v6mr5031085ybh.378.1543580033201;
        Fri, 30 Nov 2018 04:13:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543580033; cv=none;
        d=google.com; s=arc-20160816;
        b=NwSjoluG7onY++vcLMjR8DC2UNFQ6L9rGWO1bXaPmed443E4Fg2GlYIxG1WypIqw69
         zbl3Dks+ldmReB3VWQ24nv2NRoircvS5POyLjjnSL7Vmxkqez2Peunq330Ap6CaJodn/
         JAuVBh6cZknlzXx9jY+lmwI7iJnsQkVKppehJNZB6+6UYjyJ8dTm95+KaT4MWoH2ujBO
         CbSEWDjh9W+I0UoJ52K/sxTffs/tenoZCPkqGWK718Uw3fUOvD/dFw43wolKnpTfe+GM
         8YlFRwbiXRG7wX+g9XHSSZR4kMOcqsDUa4QrWhyrPYXDzuRilr62dRGvu9ZQdCY0G8Ql
         WdoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EwkOFf5P8Mi+vRrloQ/BrheXqB/hVJDA8/x6f78m2zI=;
        b=UxuhgUHujAGkuPRIukF7NPj1a+WlKMNNSzrNXT8Eb7WnN7ac/r7MfEsk9q+hJkTW8m
         v1VH7hTVt16xIELzas0P2Oot7UGQ2iL9MwpI+YHCzZ/aNPjNtzy2QjYqWaxTmD8B5KVt
         28OAdvWcjps/L3LeIJIER6nwETR2B8tfCdMQRj9ZxIrqNyz4S0Z08qFzMnJowOZAziAH
         1a5okY7qfl+qaVY/UGf2gOx6qcwPEyGZrOao2Zk3FjVk8N5J1rS3EuMNn/UZTaHFX3oX
         0oNICOvkIh3lCwpzvIjroQHRtIXFfmBogt7uR+2v8bPIJhYDKdPJLQ0/iQrtEji7H0Au
         m+rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Lahbs+9j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f128si3047710ywd.83.2018.11.30.04.13.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 04:13:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Lahbs+9j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59582 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gShg8-0008Mu-JE
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 07:13:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51831)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSheO-0006Oi-PN
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 07:12:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSheN-0000hT-S1
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 07:12:04 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:35653)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gSheN-0000hA-KQ
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 07:12:03 -0500
Received: by mail-oi1-x241.google.com with SMTP id v6so4534256oif.2
	for <qemu-arm@nongnu.org>; Fri, 30 Nov 2018 04:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EwkOFf5P8Mi+vRrloQ/BrheXqB/hVJDA8/x6f78m2zI=;
	b=Lahbs+9j1+1/exxvEPm+eo/ZsP+yCTJgI8m/k7IwdJOwZ2CiIXkpTmFqnH7vJkt6np
	Qerj0ftPy/W0qLFcOkGMJU4sh2hk+qLZNANEUV8Fy2igcytHXkLbsrM84RoMbfWOWNW8
	duZniTIVL5uycWZpndwEdC3/VhHyAuFYJu3T8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EwkOFf5P8Mi+vRrloQ/BrheXqB/hVJDA8/x6f78m2zI=;
	b=TlJUCcCxumeRdEoov1VFpnqmGHAJmJqysFk6rQe4uTHeIBT34q8OKIwjyrMVjgiixo
	gm5S1bBLuqBNARR8lptS92be+/p8b+158rKI0DoVhfUm1UWXq3cECaJLTaXMJkheyxto
	ITyiVkypIU2s4ZY9iKxv5zAMm/CnwkfgUBqD6nTh6mcwIgG6Sjndf+Wog9j77jxbrYYQ
	OqeCyNofAtUivv97jnL8Tf/l0JyriM5IvA2ycXSgKaSaYmTwohgm4SYjmrLY9wAG916d
	2htsVb7YYCdvnh5KZ28mI108TXDyo3z5/EeGCfLeRhCMuMSMBec0lmx7p4jhUB1wtTOc
	nF+Q==
X-Gm-Message-State: AA+aEWYST1hsmLu1kuuDUUC8dKCkkYgoBOjZwGcfJNpEt5rxLYFen0DJ
	/SLefYP/J/RpbJveBmPDa5KwNKEqJSh+8wzRsznTFg==
X-Received: by 2002:aca:bcc6:: with SMTP id m189mr3336315oif.337.1543579922953;
	Fri, 30 Nov 2018 04:12:02 -0800 (PST)
MIME-Version: 1.0
References: <1542880825-2604-1-git-send-email-liq3ea@gmail.com>
In-Reply-To: <1542880825-2604-1-git-send-email-liq3ea@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Nov 2018 12:11:51 +0000
Message-ID: <CAFEAcA96KgoQJHcqToKO43yEpiH50CW-_6zRU+BYDRpB82cJNA@mail.gmail.com>
To: Li Qiang <liq3ea@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH] hw: arm: musicpal: drop TYPE_WM8750 in
 object_property_set_link()
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y7ZA4qIgE3Aj

On Thu, 22 Nov 2018 at 10:00, Li Qiang <liq3ea@gmail.com> wrote:
>
> The third argument of object_property_set_link() is the name of
> property, not related with the QOM type name, using the constant
> string instead.
>
> Signed-off-by: Li Qiang <liq3ea@gmail.com>
> ---
>  hw/arm/musicpal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
> index 9648b3af44..726ae29394 100644
> --- a/hw/arm/musicpal.c
> +++ b/hw/arm/musicpal.c
> @@ -1696,7 +1696,7 @@ static void musicpal_init(MachineState *machine)
>      dev = qdev_create(NULL, TYPE_MV88W8618_AUDIO);
>      s = SYS_BUS_DEVICE(dev);
>      object_property_set_link(OBJECT(dev), OBJECT(wm8750_dev),
> -                             TYPE_WM8750, NULL);
> +                             "wm8750", NULL);
>      qdev_init_nofail(dev);
>      sysbus_mmio_map(s, 0, MP_AUDIO_BASE);
>      sysbus_connect_irq(s, 0, pic[MP_AUDIO_IRQ]);
> --



Applied to target-arm.next for 4.0, thanks.

-- PMM
