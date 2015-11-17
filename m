Received: by 10.182.158.201 with SMTP id ww9csp877884obb;
        Tue, 17 Nov 2015 10:00:57 -0800 (PST)
X-Received: by 10.129.39.216 with SMTP id n207mr41733887ywn.181.1447783257166;
        Tue, 17 Nov 2015 10:00:57 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s187si27518788ywb.285.2015.11.17.10.00.57
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Tue, 17 Nov 2015 10:00:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:60074 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZykYq-0005Sw-Nm
	for alex.bennee@linaro.org; Tue, 17 Nov 2015 13:00:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZykYo-0005RY-6p
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 13:00:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZykYm-0002pJ-UA
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 13:00:54 -0500
Received: from mail-yk0-x22a.google.com ([2607:f8b0:4002:c07::22a]:33419)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZykYm-0002oR-HQ
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 13:00:52 -0500
Received: by ykdv3 with SMTP id v3so19693458ykd.0
	for <qemu-arm@nongnu.org>; Tue, 17 Nov 2015 10:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=me1yj6WaWf89q4xQYAi1CwkLzRt/gCqLpaKmvdAaSh4=;
	b=tlDo2WJXnRlJLazOc1Sw6fLA1NOrwifs9ihGUwnuT2U1NMV52mfB2H62nTlXpw3OIg
	nFxcxPeSguljJVWQZEQAm73+D98HEQypffmslxanM2a6s4Up2d54EzylQqPAXKbfAIED
	LO4PfM3Vbkch3dm2zSsym9huyW7eePOnt+/V2ROb+1SVsHJmYat4hmzc5wiGDZ6JsQta
	25GWxF509d8pB90o2vHMHqEMN8s1OJcGTDCRcdFCpHoblbF7NiIdUZPb3l0FJCmlm7Yd
	kBPPoAsUv7rBLEWQ6wth0HeROqLgtHxbW50XLAYauuCBcjQ2SAJ1j8o5EGqFIF/Qdotg
	670w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=me1yj6WaWf89q4xQYAi1CwkLzRt/gCqLpaKmvdAaSh4=;
	b=ZmznucRqdu0uQaKtRDms8l37YuGzBGFNeFgtk3Uf918SXGIyxl65JAl4UqXjwVwOy+
	+qDQu6YWrlaKxVaJizA2Fig/EwoJCwmsH4RkomLVTcveLogGbC5nnQyaOnLLzO58nY/3
	aNQZ9IOMrwS5qIX8rdEMQxq4ltkV967r5paBpinEzbiPZe2KHWR+RhVmhnDLFLc5dErm
	QNd+SPfZ82FeTthglujM9rpcp5BqTlJpV4HZnv8Veybaq64PXfNCdaGQ5Y3XRpMhhfHq
	pzv/ydxvqLihHit9xGzR8XeiMqgXgkZP0ziKFvgomSSttKifvTZ2hMTdCM4D6Z/0VBMG
	1bgg==
X-Gm-Message-State: ALoCoQmLKV0lpfIwOaSdEk1GZexsCWNwW8v0TsMYUcBNGuCJFPuLGkPKbCo8jio7tLbs+gGyiLKs
X-Received: by 10.129.98.5 with SMTP id w5mr26408017ywb.333.1447783252061;
	Tue, 17 Nov 2015 10:00:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 17 Nov 2015 10:00:32 -0800 (PST)
In-Reply-To: <1447031505-12477-16-git-send-email-mdavidsaver@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
	<1447031505-12477-16-git-send-email-mdavidsaver@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Nov 2015 18:00:32 +0000
Message-ID: <CAFEAcA_4tdukYg+D4DivnTUXsWAzr983sKskvrnDYN9Y8NU2yQ@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c07::22a
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 15/18] arm: gic: Remove references to NVIC
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
X-TUID: E1Szfnmy1pdB

On 9 November 2015 at 01:11, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> armv7m_nvic.c no longer relies on the GIC.
> Remove REV_NVIC and conditionals which use it.
>
> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
> ---
>  hw/intc/arm_gic.c        | 14 +++++++-------
>  hw/intc/arm_gic_common.c | 23 ++++++++---------------
>  hw/intc/gic_internal.h   |  7 ++-----
>  3 files changed, 17 insertions(+), 27 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
