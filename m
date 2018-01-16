Received: by 10.28.173.206 with SMTP id w197csp4061887wme;
        Tue, 16 Jan 2018 07:11:54 -0800 (PST)
X-Google-Smtp-Source: ACJfBotBzCy+0c0zL5tfVHfNBPuYB4WSepK0VDL+H0v14aarwxwsuMYUnZ+jeBa4h/F2/HWOPEG1
X-Received: by 10.129.55.209 with SMTP id e200mr29961816ywa.306.1516115514327;
        Tue, 16 Jan 2018 07:11:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516115514; cv=none;
        d=google.com; s=arc-20160816;
        b=mhBC74UfLID9Q6RvNYu8UYlNNZptqepIPiQP/DkVXwW4JjRtXHxu8lKig66ACHfXoG
         RLJ1GOxTZ+VS0+IvLzYXg4bUbZMxCoxZLUCA8hpG3zsiJqEeCaGjOhImfGtogLd4zrdd
         L2oHWH2Vh/xFWpbENgLI8+dQDo+OG23CAzkINLbCOQZ9aquEpl0XRHmrfzBPIYhhLbm1
         lUD/sXispNX9x1RulroV8cJFncT+MfB/uxFQlfDPC1Mk68hYb74IW3lKVQEPFSb/OFax
         UnUr4VUauXHWTwXAPFRWRORDdWu5IAPfKbMJSxliX0pO3GPUzTXd8z/10RvFJYcF/xPB
         DAmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=DTO2bLGHJ30J3etc8VqK/cNoBbQLFWIxqdmYLGbai2U=;
        b=NX/TB76HcMhg02KeufKdoBhM6Hzfk0rgvybgmm2ETRAJP0mQW7bzGeKUFOD6Tr4784
         ewkCDnhwyya8Sw9KGjktOmiijriVqWetBHOcyHNgt/3YHPyqk8QYGpdkFz2aiL0IVG7x
         m3d0Yz/xxRoIqafAgqupsEStAlNAR3ZSj2nekce9F50tUiYUhUeiVbsgzAdf6CZvUhJ0
         e8YbVo2WfFoLRJD3XnhXs2KfI5cwJ5f7tcNcQSA8700MF2FBK+11qIEv4dlUkV0dciL8
         6X+u9JtJbMX6kBWfujVIhciBzW9NKgQdnNuKWTZhTXEglTwQ+hi9U+38C3x4C8d6l+MP
         pyHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d1SfUTgk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o199si542471ywd.178.2018.01.16.07.11.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2018 07:11:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d1SfUTgk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39808 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebSu1-0006Oc-K9
	for alex.bennee@linaro.org; Tue, 16 Jan 2018 10:11:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54398)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ebSF6-0004fL-I4
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 09:29:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ebSF0-00021z-US
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 09:29:36 -0500
Received: from mail-oi0-x229.google.com ([2607:f8b0:4003:c06::229]:39739)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ebSF0-00021h-Ge
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 09:29:30 -0500
Received: by mail-oi0-x229.google.com with SMTP id t8so10726787oie.6
	for <qemu-arm@nongnu.org>; Tue, 16 Jan 2018 06:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=DTO2bLGHJ30J3etc8VqK/cNoBbQLFWIxqdmYLGbai2U=;
	b=d1SfUTgkMUVPO980M84Ltp2xXh63cOazD5H7Ay7pnxsWwAy4+vjxTXfQynfw4/XHRu
	hkeE5lh9kiLBvYO/yELJOSim+cDavbmfTTNnGSdO7bCWd6Znfs9q/wA+1iKo/L/bj2ys
	2NzQ7c184Igwtz6Nf9wTTo65yuQMIRX06bR6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=DTO2bLGHJ30J3etc8VqK/cNoBbQLFWIxqdmYLGbai2U=;
	b=eUb/qCYLaTcSEnJjDVI+AUGHrvrmQJqDpvUYp2FF9wTtAPKfWbnZHr2IvpEbSPXYSj
	tAodi9Hyg0BAdaHpjAsebBbvPUV2xurKPMK57s/yK3+5eI5l8whUXKxMm6Wd7VXkao+i
	/YoQTeneTcZoKp6IeY72iH6bCapymF4opuKUlsKpPR8AHifChFj8TSo5zae2EAr89nhh
	ahSdD8ZK2weQNsGJRPtIlXE5saldNwa/BOvjD/lvswC5dcZcryVXzBqQSLNLol9c/vaP
	AjSCdsK8eBmA55A/m07TBz5jErylFW0nSI1FhKPJqABVKVQGWOFx/ubGeYSQqmRLLDFj
	6+jA==
X-Gm-Message-State: AKwxytcTinourtTrKTqjNNwMLXgows07Mjg6KcO6z06Wc8JbfqVyhpQs
	uQFvuwI6aGhVTDgRKeOhtqol7DdNbFuK7OqLBS5Sjw==
X-Received: by 10.202.105.82 with SMTP id e79mr3768669oic.305.1516112969804;
	Tue, 16 Jan 2018 06:29:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Tue, 16 Jan 2018 06:29:09 -0800 (PST)
In-Reply-To: <20180116013709.13830-8-andrew.smirnov@gmail.com>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
	<20180116013709.13830-8-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jan 2018 14:29:09 +0000
Message-ID: <CAFEAcA9h+mnkZrC7A=jxX7+X+ggjzCSPaUVWHc1Aj4UZd6HCuw@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::229
Subject: Re: [Qemu-arm] [PATCH v4 07/14] i.MX: Add i.MX7 GPT variant
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SerHtjr5e4vc

On 16 January 2018 at 01:37, Andrey Smirnov <andrew.smirnov@gmail.com> wrot=
e:
> Add minimal code needed to allow upstream Linux guest to boot.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
