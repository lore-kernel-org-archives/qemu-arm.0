Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp146985wrw;
        Thu, 8 Nov 2018 05:45:21 -0800 (PST)
X-Google-Smtp-Source: AJdET5exUbZggjnS4feO5HoT51xWqRYN6owbN5PlaMxlxG27qug3w5i+dCfT3HN8Jxos5ZA5aijS
X-Received: by 2002:a0c:aff9:: with SMTP id t54mr4352697qvc.93.1541684721039;
        Thu, 08 Nov 2018 05:45:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541684721; cv=none;
        d=google.com; s=arc-20160816;
        b=eM78GO7EkgV/VlBB2mIIbbrq0q9ZTeo9+DUAKUWTS+T4SJ+hjwRIvzPV/178pErNXK
         OGI+HeiZGb+zcOiXK9QY8z8rzsopzg+VEiAnGhG7e8jiMjdE/QzsFZrd9wF0AUa+Kf0r
         dRlYuKkwQtPlIu28Ro3SR6dBOznHFMNK/DG/SDyc3opYHDUS2nVaOfQnpp2ymqPGKytp
         C6J7/rIa06at9stoOpjGjWrgMbbXZRpEFqiYUDQM9vDO/QEDLmyfRj9Pe+SSYilMhIxm
         G0jptdjL7mOS3DaIyY4L5IRSvFVK/QzQbAXjYgiHycsKJEDpSbpfPz2E0W2YV0rV78v1
         QC/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=5at51GgcraKo2IxwR36ilv2o6GMwgl/OFPqs/WTSnIc=;
        b=FFifVMaANhBEoY2jG7YAqattrpTlSQeQyhhtcnSpleTTi3dKi/7pTMhN1cT2LPVXaH
         RSYKCHXZYo2lU1RsWXqDztHI2StfT/RXBZrF6aT4xAkMVqjVHMOEq+F/lgEgTss0Rauj
         MldxcN7sKU+P6Cq48GkxkFuhH9AUHmn9ou1tCEkU4IhAsa834dcwfljpsa+bTU/LZeID
         RmY6Aj3GeFC3dgrU4ATqwFGjjEycleWZpkfgyhRqUuZYXXPgO3sV/+ui/0YZkmLScKZT
         cQOc1DxakRr+TAMJMwfD5lcdIxDwfBOFpoJLfAL7i1NP5AoZhvVkpss+2OxbPcyjMCu/
         Rdfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aOKMEQAt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w2si37447qta.292.2018.11.08.05.45.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Nov 2018 05:45:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aOKMEQAt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56858 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKkca-0001tx-Da
	for alex.bennee@linaro.org; Thu, 08 Nov 2018 08:45:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39921)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gKkcN-0001pW-6x
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 08:45:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gKkcL-00019Q-FG
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 08:45:07 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:37093)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gKkcL-000198-7Z
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 08:45:05 -0500
Received: by mail-ot1-x342.google.com with SMTP id 40so17907562oth.4
	for <qemu-arm@nongnu.org>; Thu, 08 Nov 2018 05:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5at51GgcraKo2IxwR36ilv2o6GMwgl/OFPqs/WTSnIc=;
	b=aOKMEQAtNlLB330HCFKbgVetePvXSORA1sw34gw44xtaMEUNwFnjWsRuidqB7cjYE8
	Tmms8LalekLvePRWZ09rxiGK03KfheTxrxWg/ux9wW09Rdy02gM8px3UGHr/gTNj6nSg
	UghX9WbXItLhtVkSgFc2XCAOLL1N5fH7ydUUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5at51GgcraKo2IxwR36ilv2o6GMwgl/OFPqs/WTSnIc=;
	b=Py9BgZsJtT5wLqBPVMqV6NfH1yp9TLHjuIrpYv/Y7uvt13MzuZIif4HQiWacOMmSoD
	GWMq5j8XUaIIVpBFQlohok15vPNmB4MeoIivsAOacaVVjJKH0OhbAEmFexBRACa1gmGv
	wFy8IVvz6ngoMuZCpHvnxFNLOPSAo7q/KpBLiSqxhW29h99RsVOqj+xcrr2a06Kqpybe
	U0ueafSWrCdzT2K3ZJ4GFOZB+buTRyT3yOPETM39tzQQHQcsYOZAuoSaV1nBPelWUjB/
	K75s+EnfFImd/Lag/6rvTWdfVSGnlOcq7iBoDySYflWNGZ9JNs4UsGVb9PX2/R2N/O4a
	dvLg==
X-Gm-Message-State: AGRZ1gJOjIiPhhLVwXfBFWeRMZRfTj+WTQaEsqPRtO02LyQtZ1pRZaxe
	qFI4hwML7Gofpcd1ZO7ge+YJgqFf9x8PrAaGNbKi1w==
X-Received: by 2002:a9d:582e:: with SMTP id r46mr2820930oth.238.1541684704410; 
	Thu, 08 Nov 2018 05:45:04 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Thu, 8 Nov 2018 05:44:43 -0800 (PST)
In-Reply-To: <1541528230-31817-1-git-send-email-thuth@redhat.com>
References: <1541528230-31817-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Nov 2018 13:44:43 +0000
Message-ID: <CAFEAcA9D6uGgppP3o3Jq_DvqWGNkNF8UXgRk_4yWfKS++ExMmg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH] MAINTAINERS: Add an entry for the 'collie'
 machine
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
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2tOM3vvfeAEt

On 6 November 2018 at 18:17, Thomas Huth <thuth@redhat.com> wrote:
> There is no active maintainer, but since Peter is picking up
> patches via qemu-arm@nongnu.org, I think we could at least use
> "Odd Fixes" as status here.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0499e11..471cf72 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -592,6 +592,12 @@ F: hw/*/pxa2xx*
>  F: hw/misc/mst_fpga.c
>  F: include/hw/arm/pxa.h
>
> +Sharp SL-5500 (Collie) PDA
> +L: qemu-arm@nongnu.org
> +S: Odd Fixes
> +F: hw/arm/collie.c
> +F: hw/arm/strongarm*
> +
>  Stellaris
>  M: Peter Maydell <peter.maydell@linaro.org>
>  L: qemu-arm@nongnu.org

Applied to target-arm.next with myself added as an M: contact, thanks.

-- PMM
