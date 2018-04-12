Received: by 10.28.71.155 with SMTP id m27csp2169444wmi;
        Thu, 12 Apr 2018 10:32:57 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+iywTn/NAucdmWgsOt08N7xpOCTBmMBkTOPLyGBVfT0Vsq/S0WBFdLhf1EHIXd/t/JAIvD
X-Received: by 10.200.67.22 with SMTP id z22mr2505606qtm.252.1523554377591;
        Thu, 12 Apr 2018 10:32:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523554377; cv=none;
        d=google.com; s=arc-20160816;
        b=jyxBOQR5AiFNjMly5jA5SwnGnsuucChcVCd71or+QFRFqSDR2kcvmPZCrRqZZDCyev
         SUmLW2hPDE9kIqHBWQtwlZEPs4hg9lF+tZ1K40ACrDQ0M65CwGZOwlOLthhqx6z5rGp9
         Hl0+8L1NKVRxqy7XhwGBsN6ti482gsYJlS8FCxK7nYc/CezBezXGrjQPXT++kwRW3Ko5
         BKiDzNIAVtb0H7HAGZ0PaO1sSMBhQhGx9YXXV8T52byp5FKDGE1Xg30b9MgSvmTO/jwX
         mCNEux0trleCfSQSnL4GTqY+szlJj7j+41rfI0LB/a/tNLA1j4FxsAYKK9pD9SoOpVyR
         36sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=dfcw4a2UpPQ+TtggRoh1ZZ6tarz58Cu7xPXTnSsOEos=;
        b=uLImYOtChoYKq2NEmwdc2Dj4TcaCk0YSBJaHxd1fXXOICf7NXogA+S6whrt2VhfhLO
         o2UwU/JMW7/rghAUSsFb4c1O9cOf+Qn5MG9DKBTg6thk0zbR5uWcL3JKkteInfQBVucE
         FTv4x9ZMzrPO+bUqHYMT5yJw2Xsv4o7F4XvLq31YnQS1SCfWqrYSGH3TisHGPVA/jWaw
         b57UpKlLYbxIqgCoyIUODfGHX7j2T8fKrr6DPyw/93dfS2av8Cm2sLbqUQTEScFNVykM
         4DMrmAMrtBefLZohr4jA0S1m9zphRPyNQMWUiAETibRNjGQmCcuu6KQ1fLkKnU912Zym
         hDwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Njfj3byZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t2si276389qkd.167.2018.04.12.10.32.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 10:32:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Njfj3byZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57202 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6g5h-0007uH-3V
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 13:32:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43034)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6g5J-0007qv-B8
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 13:32:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6g5I-00025i-5I
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 13:32:33 -0400
Received: from mail-oi0-x229.google.com ([2607:f8b0:4003:c06::229]:36648)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f6g5I-00025I-0c
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 13:32:32 -0400
Received: by mail-oi0-x229.google.com with SMTP id t16-v6so5943492oih.3
	for <qemu-arm@nongnu.org>; Thu, 12 Apr 2018 10:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dfcw4a2UpPQ+TtggRoh1ZZ6tarz58Cu7xPXTnSsOEos=;
	b=Njfj3byZAvKP50KbD1UioGRxgc1gw995Wh1YtT8EgWLjgp7+eKEC5rwhBIlwYMGSrV
	Yc3zwEnxA7ZACyUbOvqxsN2d+iwqbP8MyeCkCzvj/8iNMIkcp89sN3e9ES6qBRp77Ku4
	sRQlIsC9RxjNG7YlfARk+anjldW7ZYRv0eZBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dfcw4a2UpPQ+TtggRoh1ZZ6tarz58Cu7xPXTnSsOEos=;
	b=jhItiiK5yHARAGNfTym5+ufxvlpK4O6F/xLzUeNY0rKXgX7FaQDMpq0QohFNJTu4In
	UgwCF4n0zH+mEDyf8Xau3zBVjpqJHf2xYER5HDkKLpGiRnO02QKr2ywO1BI2XzENoarq
	H/Er9epl5y00dXwWZ1SQk5Y4xpW1Alfo2Dp1F2YQnL0W2TYy59VzQR8PO4lKqvwm37e0
	X51ODn9mwoJJnee/SwN5PSD6+RRgt+VtrSO17o4w5xIqgeJO/Ui3GhjfB3VTjO0pHgXe
	WlwzgBRbZRSkGUbYYlANmp2sVofflYsE6wVmNVOv9Q9Uyg7Up4N5wErdZgjJtGsXbTOY
	t2ug==
X-Gm-Message-State: ALQs6tAMXkT+oENI6/6AOZe+oqaDdw02EyKOhdib0SRm3UrqUYv1vuu+
	9lJaIAg0b1yLMBd++hOVDtRSdxcyZ37YJNcGSV/A8w==
X-Received: by 2002:aca:4acc:: with SMTP id
	x195-v6mr5941064oia.11.1523554351369; 
	Thu, 12 Apr 2018 10:32:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 12 Apr 2018 10:32:10
	-0700 (PDT)
In-Reply-To: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Apr 2018 18:32:10 +0100
Message-ID: <CAFEAcA8G-WD2U4+NUzWYk_gwM51-mmDNj6o9CeeAjW+USSW=uw@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::229
Subject: Re: [Qemu-arm] [PATCH v3 00/22] More fully implement ARM PMUv3
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RSfHeq4qXn5Q

On 16 March 2018 at 20:30, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> The ARM PMU implementation currently contains a basic cycle counter, but it is
> often useful to gather counts of other events and filter them based on
> execution mode. These patches flesh out the implementations of various PMU
> registers including PM[X]EVCNTR and PM[X]EVTYPER, add a struct definition to
> represent arbitrary counter types, implement mode filtering, and add
> instruction, cycle, and software increment events.

Hi; sorry it's taken me a while to get to this (I've been focusing
on for-2.12 work). I've now reviewed most of the patches in this
set. My suggestion is that you fix the stuff I've commented on
and send out a v4, and then I can take some of the patches from
the start of that into target-arm.next, and I'll review the tail
end of the set then.

thanks
-- PMM
