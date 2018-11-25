Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4792886wrt;
        Sun, 25 Nov 2018 14:51:24 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VG/jfFf35x+eiKqjaQFOes+BVqTBThbPrKuDZeLSJbP5dzM+NQWlbk13QDLXq1bzi+UoRw
X-Received: by 2002:a25:428b:: with SMTP id p133-v6mr25989974yba.178.1543186283965;
        Sun, 25 Nov 2018 14:51:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543186283; cv=none;
        d=google.com; s=arc-20160816;
        b=dJHn6qGs7C5FNblpV5oASaTDm1Pq6JyBvIUP9XQwN8sKNGLPqcPGFI9GKhalbDJjCL
         2soNGg5uiyUmILr7du2gQjs2mwA5fP3vpam/QydwBCvHLJ3vEy2WMqBVQwzBkqwHEnPb
         IKocTczIHtL8J9ra1/4ef98cxOTPeYil5ZSdLl2qe/wgras7NMdCvE2CqPKhKA/v4brg
         gHwOt8lR3Gh3FZxnJVoH9ln9hla6idyTX9eisPaWfS6hBuK9FZO/6Go1KSq4RrSbfJ/V
         2NsjF+0blmI6fGi0ScOLFEoYDSCNDOrs7ZumIrRUHzuNTcskiTLryKhPfdHJkx5eCJ+Y
         /Naw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=F/zsxdFp/GNh/icUQkioxUABty2Na/KGNQ7ED4I3EuA=;
        b=uQiuKtvBGSW8yfvPOlyFuOJjVCRz38SJopZePHmwYNKmm9zCVdMF0tR6jNs9+ARxO/
         V2VYCDnxgQThtpMmT1dO1bDsr6DEDx+dep69yOm3TqrexZZX10IlSQqxTSAUxIXeDLx4
         rlgntXBvDhnk3E79kjmnQAx3b6ajsK6qdtqxgRW0I0qg8wP7oMB1hfdRx4KT6NAI3gfn
         fc16eSU+1XO1a5HpHAUFXiTCXGxnqC/ZHNS8+HYNB8URw/9Fqzi/ysoZJArbCGo7oLlP
         a7BfoEG1EJsqxCn0dqIU3rbzxbueSYhNKU1N7uJymwN/jrpELTXdxoo/5ZTClmwn44NB
         /w8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZRmL0GI2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 9-v6si11234977ybb.386.2018.11.25.14.51.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 25 Nov 2018 14:51:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZRmL0GI2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33351 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gR3FL-0000u7-6T
	for alex.bennee@linaro.org; Sun, 25 Nov 2018 17:51:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gR3F7-0000sp-Cv
	for qemu-arm@nongnu.org; Sun, 25 Nov 2018 17:51:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gR3F6-00010T-GL
	for qemu-arm@nongnu.org; Sun, 25 Nov 2018 17:51:09 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:36021)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gR3F6-0000zi-Bz
	for qemu-arm@nongnu.org; Sun, 25 Nov 2018 17:51:08 -0500
Received: by mail-ot1-x344.google.com with SMTP id k98so14929228otk.3
	for <qemu-arm@nongnu.org>; Sun, 25 Nov 2018 14:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=F/zsxdFp/GNh/icUQkioxUABty2Na/KGNQ7ED4I3EuA=;
	b=ZRmL0GI2f+46nypFuuOUnBpC2AL0EzsVYvfeBT4wQyVUYun0a3R369WwxVEZmmWSEL
	B/Hbxq0h5w7av1F/JNJDad3ogLWX2OxHN+omBerKsqaGds2WudNLi4S/DFIoaC7+99sH
	kjQnZ8y6GymRF5g1JaoJN/W768l+E86fdd908=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=F/zsxdFp/GNh/icUQkioxUABty2Na/KGNQ7ED4I3EuA=;
	b=pvbCL4S7tdVS9IL7S4IyPnLAWVPFuG9pam4H3K9430fjYhccKNVbFonilBs8uqsf9t
	5s8KSNsle1ODdN02AVY9ISKF4u9Z0UiUrGRVLBp6g9wH9a7K8+P33SiZnnt/M5mJOZ2i
	4wZUHSwwzT2fAg4vzy1leK+UDkPbpWcmWeeLJcO+z90bSEswaIiqetefbFYWelyQadow
	2uCZEWHZ3JOzq4FRqpN8g3iEuE0GeN01hqXUwq9KEPMG4KZD1zRr4jfd7qJJ1Hq+Igl7
	5TG4EXhZJvl6Akz9VNuHUPk3woe2Ibe5y5lOYTE3QROd3pdIgBrLDx1sgDCems8wc0/1
	CX3g==
X-Gm-Message-State: AA+aEWahGE3IUO0yeOVc2J7n9uTcdOxhp26fSoH42EXu8SByLu8GRij4
	wlbdjdUoOD5NTPw+fX9neiemv414JNgPe48Wqs/NPA==
X-Received: by 2002:a9d:5617:: with SMTP id e23mr12775843oti.151.1543186267893;
	Sun, 25 Nov 2018 14:51:07 -0800 (PST)
MIME-Version: 1.0
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-16-philmd@redhat.com>
In-Reply-To: <20181125205000.10324-16-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Nov 2018 22:50:56 +0000
Message-ID: <CAFEAcA8ynuCc3RGcGGLc=aKB-DRiVr2joo7BjDNHf_TvXmuRDg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH for-3.1 15/25] MAINTAINERS: Add missing
 entries for the Canon DIGIC machine
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Thomas Huth <thuth@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Antony Pavlov <antonynpavlov@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PLv28Z/wlx+v

On Sun, 25 Nov 2018 at 20:52, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> This pattern now also matches:
> - include/hw/timer/digic-timer.h
> - include/hw/char/digic-uart.h
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eab0fb9742..e04f2f1a44 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -527,6 +527,7 @@ L: qemu-arm@nongnu.org
>  S: Odd Fixes
>  F: include/hw/arm/digic.h
>  F: hw/*/digic*
> +F: include/hw/*/digic*
>
>  Gumstix
>  M: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
