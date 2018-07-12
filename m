Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1435829wrq;
        Thu, 12 Jul 2018 07:27:50 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfyQXeQ1r361RNOGsbXtODdPtQE5opkYKgcfvabkujL1Lp6pUTJBaHxs4tE4yuFrj+AAdjk
X-Received: by 2002:ac8:1c34:: with SMTP id a49-v6mr1981894qtk.16.1531405670866;
        Thu, 12 Jul 2018 07:27:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531405670; cv=none;
        d=google.com; s=arc-20160816;
        b=xXIFmzOfv5q6Ip64RPaZ2usXrm0aiv/7BKdAOoJfkFW8sGDsezU6ToCg0w9W5bVt4Z
         I7TorczleBldFqTwcF+2LxD76CigfUAErcoi78EA3qsYxnKnpJ9+BxGCVrxi/4WNqP13
         VCf9YwgMohejX3prIT4hBiqUUdQdsE72+NDmdrWbpQJJfkBT7lcSQVtgbZs+5BWIX41q
         s9Cb18yf4iqodBr1wpPjsdorvGIH1uNAqzREGND8QFQJjC4OiSUK0rPbXRZZ9nTvlGCH
         EFRcfB8nrNCuE2KGuOj9b5W2eAer5nX7JXPVVsk04Fg08j/k4nBcO9ZeJI9In9zWSP5z
         n/eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=4ZNM9+ZGn81EqOa1QX5wWzWkcwKge1rJ5EHxX3Dxv8g=;
        b=JlobtYsQU79pMtGDkP/Yg/c/isgrMr2+r3guG8XPiVa/bA7A8YpH/2li9LFnPX4imv
         4ghC3cZoJgrhJwYBBadATEWpqIZ87bxoZ2jtRtsoKm8zbmhMBNnC62NwqzPBYDNcdkyl
         ySbiGwJaYaWtX9RH+8DNkByeGFhr/hI5vcO6CSY6B3c32S6ResxRzcv/zBDVqt90r4nq
         xE5KZRzouo16qMkA7fr0YtVAdEyG6axqLwdyIquG5YzodxlAzfy8z9iGqubAKgR5dl3j
         SL60/Ovnq2eMz3z37pzwmNfbXPZOOcCaHmPkLaVEwo4ZrHXUNAFb7/DK4WqoODCy9b8t
         vpBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kMBsyajx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 9-v6si3283919qkl.30.2018.07.12.07.27.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 07:27:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kMBsyajx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60494 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdcZS-0000HN-Ci
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 10:27:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdcZJ-0000H4-OT
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 10:27:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdcZI-0007Fc-TK
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 10:27:41 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:32932)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fdcZI-0007F3-EM
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 10:27:40 -0400
Received: by mail-oi0-x243.google.com with SMTP id l10-v6so9431072oii.0
	for <qemu-arm@nongnu.org>; Thu, 12 Jul 2018 07:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4ZNM9+ZGn81EqOa1QX5wWzWkcwKge1rJ5EHxX3Dxv8g=;
	b=kMBsyajxs3mH45ixbyAmuGKDLqvI5/64pESLS8dFJQ87yKvojYwXHpmWqxHpDs68qC
	ivXo3X2OJBdl2dsGSvo7AmBaP+ddm6ljDRQunqncc2iJHeZ1n9L4+wEmOdnJPVQ67acj
	VBO4YewTPdt/jWwUf2e1udBUavILXnwKJR8I8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4ZNM9+ZGn81EqOa1QX5wWzWkcwKge1rJ5EHxX3Dxv8g=;
	b=aCYGOh7SBaMbzDEJ3dUg4KQgdXcGqrH0M+FXVQIZVYXKqOteIjf8XvbhMqdL5ePmaU
	mFWHDcLRaE7IEC980BVb/pjrKnpSNFiYxKfVpYz2dJFRynwp5T3UQNsz6D5N/KAuxR3p
	yzMyRa3Oc5q+dxo0BSAijHwOKiWbOWYRkW5aoNTZ+JOnJIwZGgvThKljHltkZfM/FAoT
	seJeJQuONH2JQeCb3Oj/2R8MjvtNrtk5y5tOZP1KbcOhF91hUxbG3l+OQsDV7mKsJ4kF
	ualHxlVL6Q7XwHtJ9AhFM3G3+azMYCnFX/LtQFBro4mgTarntUrji0I8mjOXi5Cok2rb
	cgpA==
X-Gm-Message-State: AOUpUlHM3kc4YuMF5MlfPHuQOo3cvJBDMFSYfNdgT7N4Jd9oOWXLyyvL
	Dr1lcbKFTE9wOauqYtH20zPK5SANWsBhIqSkoFqkww==
X-Received: by 2002:aca:4c14:: with SMTP id
	z20-v6mr2422864oia.164.1531405659580; 
	Thu, 12 Jul 2018 07:27:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 07:27:19
	-0700 (PDT)
In-Reply-To: <20180629132954.24269-18-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
	<20180629132954.24269-18-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jul 2018 15:27:19 +0100
Message-ID: <CAFEAcA8-Nf698hVObSyR=nNR2nNKpCcxOXYvaUux9PKX882-Pw@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH v3 17/20] intc/arm_gic: Implement maintenance
 interrupt generation
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
Cc: Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HR2n8fZPdpyt

On 29 June 2018 at 14:29, Luc Michel <luc.michel@greensocs.com> wrote:
> Implement the maintenance interrupt generation that is part of the GICv2
> virtualization extensions.
>
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> +static void gic_compute_misr(GICState *s, int cpu)
> +{
> +    int val;

This could be a bool.

> +    int vcpu = cpu + GIC_NCPU;
> +
> +    int num_eoi, num_valid, num_pending;
> +
> +    gic_extract_lr_info(s, cpu, &num_eoi, &num_valid, &num_pending);
> +
> +    /* EOI */
> +    val = (num_eoi != 0);
> +    s->h_misr[cpu] = FIELD_DP32(0, GICH_MISR, EOI, val);

Where you're starting with 0 and just ORing in bits, it's
probably clearer to use
     value = 0;
     if (something) {
         value |= R_GICH_MISR_EOI_MASK;
     }
     if (something) {
         value |= R_GICH_MISR_U_MASK;
     }
     etc...
     s->h_misr[cpu] = value;


All the logic here is fine though so
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
