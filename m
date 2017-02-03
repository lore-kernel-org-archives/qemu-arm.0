Received: by 10.25.77.65 with SMTP id a62csp616636lfb;
        Fri, 3 Feb 2017 05:32:20 -0800 (PST)
X-Received: by 10.55.73.211 with SMTP id w202mr12841129qka.321.1486128740050;
        Fri, 03 Feb 2017 05:32:20 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s63si19237156qkc.208.2017.02.03.05.32.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Feb 2017 05:32:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34802 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cZdyN-00058Y-G4
	for alex.bennee@linaro.org; Fri, 03 Feb 2017 08:32:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cZdyE-00056V-WB
	for qemu-arm@nongnu.org; Fri, 03 Feb 2017 08:32:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cZdyE-0008Ai-7f
	for qemu-arm@nongnu.org; Fri, 03 Feb 2017 08:32:11 -0500
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:34967)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cZdyE-00089t-2B
	for qemu-arm@nongnu.org; Fri, 03 Feb 2017 08:32:10 -0500
Received: by mail-wm0-x22b.google.com with SMTP id b65so29225741wmf.0
	for <qemu-arm@nongnu.org>; Fri, 03 Feb 2017 05:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Jq2X6Cm0AqaljgeyNBOmA7yYbDgAvuezlbTxtGBZHak=;
	b=STZWQggBcUXZn4bANDUqrkoz2FrgZGAkGdyUbetM4HH4R1PTG6ug7aJ19AoYSAUhUJ
	njFpRFlJk9pEknkG1+l5/l33c0Kd9vhP2XouP7yKEiG0fQ0XscvrwweMSdgKh0nmfTin
	rZ4xSclFiZCGnNtyxmX/M/j0hEFm55DyjO/Rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Jq2X6Cm0AqaljgeyNBOmA7yYbDgAvuezlbTxtGBZHak=;
	b=qwx/rTWH6ykFaZq9LCLYCx9sf2JqjCsG+Wyt+JL2HUVgMAlAif43qMdE0u9AErWZlY
	Zv8rDTGRpTL9qP4cDiTXxph5YV/ZtZg+bHIPvuJ49oS37rsnN4PvQb5zkTJlRyHw5S08
	P9I9Hio5HbKplsaw6bHNxQ4vUnjUKZNsH1r7ld+tS4sUHR3Yu8DmzxrcjJmfT/VgOkdC
	g8w/mU9kTJUS6BkIwZAf8N3iRdfdQk8m9fkMeTwPFAuj3XL9pplRkPDa3KVDM9SWFYu4
	9EL4vgoBOlsRuWjqxxAh+8CIcMfJw2KDFjjc1aELsHCBSYXiYmP/FoDgJU+ItW9RXTHA
	Y5ww==
X-Gm-Message-State: AMke39lk4/pTra4O0JtLDvnMX48jnnhGGf57/ZhslQuvI9lsKYzvdemmGpryEg9zf35R80gG+wKLto/wXMFCM0iV
X-Received: by 10.28.11.135 with SMTP id 129mr1403579wml.111.1486128728983;
	Fri, 03 Feb 2017 05:32:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 3 Feb 2017 05:31:48 -0800 (PST)
In-Reply-To: <1485875745-27741-6-git-send-email-wei@redhat.com>
References: <1485875745-27741-1-git-send-email-wei@redhat.com>
	<1485875745-27741-6-git-send-email-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2017 13:31:48 +0000
Message-ID: <CAFEAcA_6u1wA1Fdyozor4FLwsb73PHocXOacBc-zxwmB8NVD2g@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22b
Subject: Re: [Qemu-arm] [PATCH V2 5/5] target-arm: Enable vPMU support under
 TCG mode
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3blAx7z2voCI

On 31 January 2017 at 15:15, Wei Huang <wei@redhat.com> wrote:
> This patch contains several fixes to enable vPMU under TCG mode. It
> first removes the checking of kvm_enabled() while unsetting
> ARM_FEATURE_PMU. With it, the .pmu option can be used to turn on/off vPMU
> under TCG mode. Secondly the PMU node of DT table is now created under TCG.
> The last fix is to disable the masking of PMUver field of ID_AA64DFR0_EL1.
>
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
