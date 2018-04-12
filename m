Received: by 10.28.71.155 with SMTP id m27csp2159062wmi;
        Thu, 12 Apr 2018 10:21:35 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49EeJeA8haw94QOC7a9+3hyLiuBcBvAOMzaM9hQiHbTdtvJmYIYDY6Av0BpG9AFMfytY2wP
X-Received: by 10.237.33.231 with SMTP id m36mr2645284qtc.154.1523553695838;
        Thu, 12 Apr 2018 10:21:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523553695; cv=none;
        d=google.com; s=arc-20160816;
        b=auTWtOitADZqJygU0ciKPC7eXBVwduZboLUfs5sDvet5k70OaZkZSXeMJtV95c4wBE
         ZsYcyJ2SNn9I5pYYQvElep6ulX27wvnIszTTP6PXsfcwAZ/ZghxPkWsoOsruxEpeHHaS
         RGBPc45zTO2ZiuunIj0ARCiIy1F6/ucZLmriz2dTG8hpM8raGOZ6NA1CveftnS6KkQ5p
         JP6U5czJsJBEGjVKLbvUcDBTY/V81wWCizVwszcrgsEs/o/ylY1Y6pbXJpldYosP/vg8
         kzTsSyOz3thjcEdPLrLozyscw3PP1T+fp4aapLKN6NQTsT2/vdjPK2iKl+uYa4GXfsnt
         QWfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=VQ5Mz8rughnItRUSUuyDWImTOoQ1ZgEn2Zla0AA0Yw8=;
        b=KYEs+TW4ziKAUq+DSlIxdwdqF0fuWR3Hnn4+AQbVNzyTpJ64sW/ELHgsSxNlQUYuW+
         E17VW8RyFCbuWIA4wxGE0Jfp4JlKCt64ouAiSSbVP8po5T/mwGUgGHRz4Vaa6r8qibIR
         t0lRI77yDA/FIrOgRDoqYB65HLFqRcerEGh5DDogXhwVBv2+pkkcLhll4WGh28jPt6Fh
         aeLAGmmVY+Oo7W3jYNhglhf++EsN+hLfWPUPKIGKbY9iqpS4dpIOdKpXq9tZt+aqpEFp
         g46OCzQd7QKCporKx0vRDUVNLV7qE/mqFTIfxo3EyPnGuPOj/YfmxZjIYABi0mIG1q+5
         dGwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MzRS6WXE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n37si3754934qkh.139.2018.04.12.10.21.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 10:21:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MzRS6WXE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56482 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6fuh-0000bq-AK
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 13:21:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35138)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6fuW-0000XE-GE
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 13:21:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6fuV-00038e-Kg
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 13:21:24 -0400
Received: from mail-ot0-x22b.google.com ([2607:f8b0:4003:c0f::22b]:34873)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f6fuV-00038F-Fz
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 13:21:23 -0400
Received: by mail-ot0-x22b.google.com with SMTP id f47-v6so6876684oth.2
	for <qemu-arm@nongnu.org>; Thu, 12 Apr 2018 10:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VQ5Mz8rughnItRUSUuyDWImTOoQ1ZgEn2Zla0AA0Yw8=;
	b=MzRS6WXEZPCO0Dmd6UDsuH97jVWn1yry1b/bdIQtS5Tv6RnXW4pb/+ZGrmCnnLN6r+
	gqgFzFhXndDRwaV6qtUYdk73FfLrEjC2dw8cgiyD96C9oGZ7wgOeYG3Fis5vPdauligv
	jADQMAFbx4s9Gsh87KR81vhDqRZ3QGzfTbvhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VQ5Mz8rughnItRUSUuyDWImTOoQ1ZgEn2Zla0AA0Yw8=;
	b=MQ1Ioz/wU6DeTrDkblVmXgmZA8J02xviXQLAaVn+1fgZmMtSiVqLwIBuOm+oQsxZ5o
	AUTvYJN+z9+eW00NF2S2m9ozlDlI2QY4wzJmyyFgcmeYxvfvc8ONO7WhVV2Fc4C2F2Mg
	3y2O16UkhD2IFXYnczr2hVNQDMn4SuAB9LbfbCYuhxy+QT2QAFXaPwNSqppYoMDtBUIJ
	gh6R8bFeuxQTJ7RkkKLo9xYGzpmv6xnCpOIg211tKXfKMAfEkU1arPDb0T8p6m8lc+Jx
	KY+xrMnu/OaJoTmlRR0ptmXsTwW5JRPy2+715H3cgBIqiRPsWpacUnabadIO7iSScoKp
	fzXg==
X-Gm-Message-State: ALQs6tBI6RMJveZjRZWggY/h13xe/q2fLyqnFo0FLEY36/BnZrP81iMw
	B+2sRmdHsoEETieCX9oh+w/Vm9iOP4l94uW6jbvk6A==
X-Received: by 2002:a9d:285d:: with SMTP id
	h29-v6mr1224522otd.205.1523553682862; 
	Thu, 12 Apr 2018 10:21:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 12 Apr 2018 10:21:02
	-0700 (PDT)
In-Reply-To: <20180412170139.GH24561@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-10-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA9UpNW8q+vBKDskhAMVxHh4QUOJ5diP8AR6mpMRk+enBQ@mail.gmail.com>
	<20180412170139.GH24561@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Apr 2018 18:21:02 +0100
Message-ID: <CAFEAcA-TQ-mihXqEZUe1AsWeDu8d7Yq3BeZbmnRgO-UCKeRgYw@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22b
Subject: Re: [Qemu-arm] [PATCH v3 09/22] target/arm: Add pre-EL change hooks
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
X-TUID: CLonSQ3/D5YG

On 12 April 2018 at 18:01, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> On Apr 12 17:49, Peter Maydell wrote:
>> Do we make the guarantee that if we call the pre-change hook
>> then we will definitely subsequently call the post-change hook?
>> (ie does the PMU hook rely on that?)
>
> Yes, the PMU relies on the pre- and post- hooks being called in pairs
> since they drive the state machine of sorts that exists in the variables
> holding the counter values/deltas. And unless I've really screwed up the
> implementation, I believe the change hooks in my patchset make that
> guarantee.

Yes, I think I agree. We should document in the comment that
this is a guarantee that we make.

thanks
-- PMM
