Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp7109122wrt;
        Thu, 27 Dec 2018 09:26:41 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7TgfFb6n4Amm0gGWKe4U5FPK1BmaVDzeZFWnTUAWB7YqHlao4Mc0YC/DVPcYiylmMU1HBu
X-Received: by 2002:a37:a1c1:: with SMTP id k184mr22602583qke.155.1545931601868;
        Thu, 27 Dec 2018 09:26:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545931601; cv=none;
        d=google.com; s=arc-20160816;
        b=EWaidoVRX5uiliVaKq/M70ywacEgF581KGYz2phgqh++Evo1UzI0KS6JDezOeDseyO
         yA6hj9dAWl4eba8jMnP4Q4cmePgnSuu55A2bSoB60rptaNhOlms0Io5BRVR6hXPmAoJ5
         fz+PmJyjDVMfRbxQpfRCi+oYJ3JzpfL2/BsnMyE0y0QiM4f8MMhUCOj/TjZs/Q79XxO1
         CStSLmwIZghAynDFaF6V4ABGKKF/UJv8wg9MSt56zgF3LzuP+ydpRZMnJZsVaW6+axlF
         yxlE3gC3szua09ud2JPUGgcFEEHOPT3JCvckzTfMLRIBfNj6eIMITRsHuphTe5vB1fYo
         Dt5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=d05vNy3/CUVQ5bvkweIK1loz/adjVNc7XAJvXvdZ+us=;
        b=uptV8fbU5uMbKluqtDt/aj7/9mHyR0GWWignjEEtbO3pcooK7eT23XrGjZClXLE3Jo
         RzBs8+Kco5CVvBRSr1Eyq2uCWzLkThO9e64sd4wyt8CQqHSK4vPy8yxv5/j9e5ZhzDDJ
         A7oWETMz5nRIlz0OZ1zFFl7qGG05XArYY1BjhRMck2e4I3OEvSgUTV0+ImEkOgi/Q5Hl
         tL8uoERPrOgDTigeuEjiAW55mVMcZz8kn3WQCXEozXsWJ6N0DM/qDH0CudNLhyVh1HuW
         0Q6hhewBXMY+K96jjd/OTYOKMo6fJNBcyVYChmZ/gx0AotVkPvrQy3AT98o/SjL/o1ph
         IQMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NqnChSmm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id s30si6704241qtj.60.2018.12.27.09.26.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Dec 2018 09:26:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NqnChSmm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54439 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gcZQf-000140-EL
	for alex.bennee@linaro.org; Thu, 27 Dec 2018 12:26:41 -0500
Received: from eggs.gnu.org ([208.118.235.92]:58512)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gcZQV-00013v-0X
	for qemu-arm@nongnu.org; Thu, 27 Dec 2018 12:26:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gcZQT-0006uJ-AD
	for qemu-arm@nongnu.org; Thu, 27 Dec 2018 12:26:30 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:46714)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gcZQS-0006tS-Tc
	for qemu-arm@nongnu.org; Thu, 27 Dec 2018 12:26:29 -0500
Received: by mail-ot1-x343.google.com with SMTP id w25so16755572otm.13
	for <qemu-arm@nongnu.org>; Thu, 27 Dec 2018 09:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=d05vNy3/CUVQ5bvkweIK1loz/adjVNc7XAJvXvdZ+us=;
	b=NqnChSmmvxoep2Qak51I8JJ2fm5qRKNGNTLxsO/XzZloBSos5wJr9hkpUft2W5NU+5
	4jpJ6Hier1bHl3bMEIt2h+LwDr8LHpPKSBa3UImk1ldZd8guDCXevcWdYgevKzPK5iHF
	voMkRfyF2cZtVNBR4layfKWH4Q5qYFkuSHm3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=d05vNy3/CUVQ5bvkweIK1loz/adjVNc7XAJvXvdZ+us=;
	b=oxbprrjZAohM6YEuOjzH/S8cYwicl5FFnPJ7FS7DEulGoY7nRWydC5+eAIH5zDnhNH
	WGJDZnrYdHTmMQmOtPPE4Vn0a2Dg40+kueea2iGn9hh3F1zDVRtimhfiI3H+xlk7e+5v
	ZcdUwAFaBmtjba7f4A+2dTUXn70NFaaPVxZnxM8VxEgUb2iE3qtXjv/lUCRchLyHwwf1
	179KP2SE83CPV5aHGwgu/Lqo8jSKk8UETZe8AgCeetZn4sBs2IpPlqsRVhazX40kRlp9
	j4kHODJNGtaDWxVWwfIxwvAKP7PuSzJMm/VhSkd1PxAxkYTMrjkjhtasTvzfusaxicxH
	A/WA==
X-Gm-Message-State: AJcUukenFprmZXZ+8fFWz8xFkDutad3exqhRyuUSG0N6c2QgnPy7UcPu
	gTxtoB2dDxh3nbDQfCBG3A9IYfGwkkq32hY0OFKDNQ==
X-Received: by 2002:a9d:5a81:: with SMTP id w1mr17473404oth.317.1545931587170; 
	Thu, 27 Dec 2018 09:26:27 -0800 (PST)
MIME-Version: 1.0
References: <CAC-7+Cg5EX1qb11kwRprSE8_E2SMtEm1Cgh0OzFMCuiBhh+3BQ@mail.gmail.com>
	<CAFEAcA8qqzPxwYmjGG1Y940RFyuf0AccNy+N51HODnoKEuYSfQ@mail.gmail.com>
	<CAC-7+Cix_s3xdzqre8r4c8f2djDBi42k4oOvyG6C4VCC29Ww6g@mail.gmail.com>
	<CAC-7+CidVH8KGBaCKxeEricWKhago1w+-j7fDB88gnN1bXVy1A@mail.gmail.com>
	<CAC-7+Cg-VJ9wivBYM+15mUs6cPUZ-Zu1Q818KieyjEVz02eLig@mail.gmail.com>
	<CAC-7+Cg2muWTajKd-nSEz37oHPug6AD-WGyXJ8E7yASGc9p-dA@mail.gmail.com>
In-Reply-To: <CAC-7+Cg2muWTajKd-nSEz37oHPug6AD-WGyXJ8E7yASGc9p-dA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Dec 2018 17:26:15 +0000
Message-ID: <CAFEAcA-a4zhmhkzT8OqCkEwwJH89G+u3FL=CZGnUp9Mw4_WNLw@mail.gmail.com>
To: =?UTF-8?B?0KHRgtCw0L3QuNGB0LvQsNCyINCi0YPQvNCw0YHQvtCy?=
	<stast.3vium@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] Run Kernel+rootfs for ARM Cortex-A72 on QEMU
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0imugIYMBc93

On Tue, 25 Dec 2018 at 07:30, =D0=A1=D1=82=D0=B0=D0=BD=D0=B8=D1=81=D0=BB=D0=
=B0=D0=B2 =D0=A2=D1=83=D0=BC=D0=B0=D1=81=D0=BE=D0=B2 <stast.3vium@gmail.com=
> wrote:
> Although there is no big difference now. I really want to see the logs.
> If the board is not suitable for the kernel, the logs will not be display=
ed?

If the kernel is not suitable for the board, then typically the
kernel will just crash very early in bootup, before it has
been able to output logs. (In particular, because the serial
port location depends on the board, the kernel needs to be
able to work with the board to be able to output anything at all.)

This is the same as with real hardware -- if you boot the wrong
kernel or a badly configured kernel or a kernel with the wrong
device tree on a real hardware board, it will generally crash with
no output. The process for debugging this in QEMU is the same as
for real hardware (ie use a known-good config, trial and error,
if all else fails use a debugger to see what's happening).

thanks
-- PMM
