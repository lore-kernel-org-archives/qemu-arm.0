Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2721088wru;
        Tue, 17 Jul 2018 07:16:00 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcgzOPS62EqnoJRN9W1pjNo2K8bBabJon8zAMIVxChl0mf28+fPGEWtLSgjOdF0drV6qHmk
X-Received: by 2002:ac8:460b:: with SMTP id p11-v6mr1730900qtn.418.1531836960227;
        Tue, 17 Jul 2018 07:16:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531836960; cv=none;
        d=google.com; s=arc-20160816;
        b=eI6uAOAU9keu7gsi+DDR4gsaAsc3BtwPa/TNhP/qF+iRNf2XVBeP3+vQycWjBfdA8P
         zwy8Czy8kj+QIfCSu0jHDAhiOMyAA3mw1/HeHC/C6/ZbNvTacn65UOw01+MPOLRpl8mF
         j+RB9TM/fHOnVeAW5lHVQ7S9ctxXnr0Y+1x3StpFpPunnudr2AiSX1sM6KklWy4Z0yXD
         9fEJSk0LMIK8RQURRiImsiy1tb02ySQOwRjR2MhHc/CBtwTaIvJaLCoZx+N1nw9wJ/Cb
         QR1M4xk20XAbNgLW7p+BWYDzIdt7H6DsRj5dkYt5qOVvVBsBY/5j3Uf1zF5DzlJoG52D
         +rSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=xuW/Q5lp7W2zVLP6GnHGkSSiRKiW9s+npZU+aCrTkt4=;
        b=LWDPxuweF5RH+R0lmTa9ZzTsIx98LEx/Ki/QcV3eWZtRLQdHqNhHdPT+KgvPtDPoPs
         SgFxfFFeE4Vonq/TYORnUq8xZOzIjKHCVK28m6uxCxttvR/hl+M1Yf30Gl0VSQ+jgCN1
         vAgdhzDubFfgMV8n5ylPG+OXJ8zUttWB2pQri1yviDZQNloTScYDOs+YNBYNfjCrbFQj
         9h6InAhF1RSXN/+HZCbapIlTW0inE5uLGb7irg1Q5Ap6GAZsYp0U8jpTdViceaLHYwcu
         Qy8793e3JYNVmgIy7nqBSuxMJaro7evNexFpPwhGeDwARplFczRa4/MwVCdSOjaMCVjc
         S4TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="jL3Khw/Y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n57-v6si988759qtf.327.2018.07.17.07.16.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jul 2018 07:16:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="jL3Khw/Y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59604 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffQlj-0006f5-N4
	for alex.bennee@linaro.org; Tue, 17 Jul 2018 10:15:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60440)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffQlX-0006ex-2b
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 10:15:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffQlW-0003NN-89
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 10:15:47 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:35509)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ffQlW-0003Mv-0I
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 10:15:46 -0400
Received: by mail-oi0-x243.google.com with SMTP id i12-v6so2304508oik.2
	for <qemu-arm@nongnu.org>; Tue, 17 Jul 2018 07:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xuW/Q5lp7W2zVLP6GnHGkSSiRKiW9s+npZU+aCrTkt4=;
	b=jL3Khw/YYPvdwB4noRGLeVD/7vQ5ONnivf9ukW7/jEf+5aGxZnHpIP5S/tJC63qafe
	+a+w3ghbi4oMIchEnOhs7bgauKB+wziAUsumyAmMvjOeEBMhgSVyVGRDoZmGDbCd3r1t
	fFmKLb4hW2RJWs3ChcSVvV8CNyg4c0UsUrgcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xuW/Q5lp7W2zVLP6GnHGkSSiRKiW9s+npZU+aCrTkt4=;
	b=NtRjlDACyUQrPcNvo3MEOaTMwx67rQZYZ0dSGE1a8lmQG86HXI36IlupEmwBThxlGM
	SLXy/lw7aQ+WkGBfuGdYm1/dvdSzOzi6itR5YKPQLYlAuvA93qQdw6eqmFiuNND389Jt
	TaG0S5SZicKQKosrpLV5ZEtDE9TANqosN7OuJTb90sVoYXEyWZnxMeqolZTz7mPoeVUz
	Ng//vnZBRZ3J2PgyULenFNjfkU3rBf33rxxnnL0euCR3Qk3o/bnX2XfUwG3Iv23SPEX1
	42T+FAiDX7KylPJxEvqtg4noMSYqD5/zV6T+9SwgL0bYC/84YK7EHVRjjRzrMNspWMu2
	3Z6w==
X-Gm-Message-State: AOUpUlGr+8XGQgfHvhVm52HK8bMFd92Kg6zifot2InpivYad8lI6p/3T
	NJ5VJaGyZzkceN6hjLHVlYva8IBejjQlEZYi9HvDaQ==
X-Received: by 2002:aca:4a49:: with SMTP id
	x70-v6mr1695235oia.11.1531836945225; 
	Tue, 17 Jul 2018 07:15:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Tue, 17 Jul 2018 07:15:24
	-0700 (PDT)
In-Reply-To: <20180714171601.5734-3-luc.michel@greensocs.com>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
	<20180714171601.5734-3-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jul 2018 15:15:24 +0100
Message-ID: <CAFEAcA_qp5vF4DghFThBmOJ5HvfPdZWhi7cDOR98nUWgBvyOYQ@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH v4 02/20] intc/arm_gic: Implement
 GICD_ISACTIVERn and GICD_ICACTIVERn registers
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
X-TUID: bBswhaATBxX1

On 14 July 2018 at 18:15, Luc Michel <luc.michel@greensocs.com> wrote:
> Implement GICD_ISACTIVERn and GICD_ICACTIVERn registers in the GICv2.
> Those registers allow to set or clear the active state of an IRQ in the
> distributor.
>
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> ---
>  hw/intc/arm_gic.c | 61 +++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 57 insertions(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
