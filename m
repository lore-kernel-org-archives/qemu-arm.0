Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2727906wru;
        Tue, 17 Jul 2018 07:22:03 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcO1TVFoFB0l3toJR1QMjKeFQMG8mm4us4gn+19rnC/PblgeBbbPORQSIiSAXTPrwKltSi7
X-Received: by 2002:a0c:86b3:: with SMTP id 48-v6mr1962097qvf.64.1531837323795;
        Tue, 17 Jul 2018 07:22:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531837323; cv=none;
        d=google.com; s=arc-20160816;
        b=j0lnxeOB4qq5TadUAKsiW+/bevJl00bC7lvc/UPb/8zjRcxmmZYQQ79dr8dPNjklL9
         lBy315IMC1+GTDoXehfezz3BZ+uau13TOjLVYKkWdsg1zwNCHamS1wu8Bgra0ac9J2Dk
         6ma2T+7wgIzPcL3/R2khCaHxEkEIXe1UnXFqS/ANtCtg3ojnog3vW43j5yr6nZ06ABze
         /RYml8BtBDlYbt7/vH6DkKUs1ELfjEh5Aq1mH7fKGfNq4gBAJOGKd/mbLN5c3AIXhvaW
         8etfvId9gPQwEyMU1O5HnQ1Y6LvOaAQAy8qhqJoz+w+RtgNVyrgcTGDd926PNOTSoPle
         0X+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=hcfB8Pmn3chtIQCtYa0zWTB+Qq9e41SPDkwBcm8FYM8=;
        b=uKXxhk+QKFcJ6ujnk1cQFOydEJpohmDabPjcTtaDjP8rR9ZOk2pXSZZH2Wd5+Juc2d
         lLLJMd7keyVfh/4rysl6oQxNVx3qMNSOzebRKGvqGwcyQ9q7zNkMtoH61Rmlnb2R3+76
         vnnULnSewO9XHqMXu7QpapVrt7tlD9NKma7X7XuUnJ3nWUpC4+rHllSuJsD3ATh2Xe25
         DQfLCjICuOlkaOCkjqr1VFMybNE5SQoJKL3kzYptJShbbNEP+MLH0nl01Foh3fSS/bo1
         JBc33mqszT/K7ARMkSDbw2pFp2EuDFHV3l62vX0i946FUVmBdFI7fpt4VQkzCXrU0msE
         rpPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WlI8S1lF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x18-v6si993711qvn.14.2018.07.17.07.22.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jul 2018 07:22:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WlI8S1lF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59647 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffQrb-0001GZ-30
	for alex.bennee@linaro.org; Tue, 17 Jul 2018 10:22:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34150)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffQrN-0001Du-D7
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 10:21:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffQrM-00071X-Ex
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 10:21:49 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:34134)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ffQrM-00070T-AF
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 10:21:48 -0400
Received: by mail-oi0-x243.google.com with SMTP id 13-v6so2359612ois.1
	for <qemu-arm@nongnu.org>; Tue, 17 Jul 2018 07:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hcfB8Pmn3chtIQCtYa0zWTB+Qq9e41SPDkwBcm8FYM8=;
	b=WlI8S1lFPaIYFhSQ9MBwdB58M0u/9v7nXukJf0mJtTwSrylFBA+nKL2XQeK2KrI2nR
	VSJCAac1An2qQ+Qq7yoFSkWxN6NuAehbf0SBsQjEEnTbRRYJ6FDcVDnqO2rqgYWOSbmd
	EKhIX53h44L7ul4sh82nsYiokSHOCxzLT15t4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hcfB8Pmn3chtIQCtYa0zWTB+Qq9e41SPDkwBcm8FYM8=;
	b=FolZqvpcJVEI6lI5EBSgTG8SGgyIABMeR39z2ubuaL1cljhZcyBJFApv8jv8FbGbkG
	QAbiu7I9BLVgYKQaQTxaULkKZZFLyIZq2h9tP+JY7zI/FYEOLLM9O5vFThO9FgDPn+ze
	dO7i0q91u0Y8UsfYoh7JEtWAIBr01fQIdmclBLrmT5EPNfVRyw4bbyGYI63yBQEgro1p
	ej4ioRk0ZuY5GQp5nPF0do2d7GK4nTnHSn6ySWKJKF38RPrnQdjw0xWGtSpgUz8ZKsT2
	AzMYE5NZhSCT2J6wUB7FgXtwrhlY+tP7X5GPhHqmOL+PDeqAo+gHA+f+pwVfesWLBFyx
	gqGA==
X-Gm-Message-State: AOUpUlFdjt8MjzIu4b8gBOWD3ty0NGZsVa8h5tc8+JTwcDmUE7z+3ZDs
	PrNpxB+3H+hUd/nkGVQRoKcsdvWpSBGtegByhywi3Q==
X-Received: by 2002:aca:ce0f:: with SMTP id
	e15-v6mr1984443oig.13.1531837307699; 
	Tue, 17 Jul 2018 07:21:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Tue, 17 Jul 2018 07:21:27
	-0700 (PDT)
In-Reply-To: <20180714171601.5734-11-luc.michel@greensocs.com>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
	<20180714171601.5734-11-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jul 2018 15:21:27 +0100
Message-ID: <CAFEAcA-_EXpj+G=eoW5wptnkU6s3OfeT25Kadzr_mWP7hf6x4A@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH v4 10/20] intc/arm_gic: Implement
 virtualization extensions in gic_(activate_irq|drop_prio)
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
X-TUID: vzpp107iTVBp

On 14 July 2018 at 18:15, Luc Michel <luc.michel@greensocs.com> wrote:
> Implement virtualization extensions in gic_activate_irq() and
> gic_drop_prio() and in gic_get_prio_from_apr_bits() called by
> gic_drop_prio().
>
> When the current CPU is a vCPU:
>   - Use GIC_VIRT_MIN_BPR and GIC_VIRT_NR_APRS instead of their non-virt
>   counterparts,
>   - the vCPU APR is stored in the virtual interface, in h_apr.
>
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
