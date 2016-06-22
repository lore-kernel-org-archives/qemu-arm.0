Received: by 10.25.21.96 with SMTP id l93csp2432101lfi;
        Wed, 22 Jun 2016 05:06:29 -0700 (PDT)
X-Received: by 10.55.120.5 with SMTP id t5mr9901926qkc.131.1466597186451;
        Wed, 22 Jun 2016 05:06:26 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l4si27576827qtc.12.2016.06.22.05.06.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Jun 2016 05:06:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57690 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFgvJ-0003My-MU
	for alex.bennee@linaro.org; Wed, 22 Jun 2016 08:06:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44158)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bFgu1-0002eQ-G2
	for qemu-devel@nongnu.org; Wed, 22 Jun 2016 08:05:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bFgtt-0005hQ-F1
	for qemu-devel@nongnu.org; Wed, 22 Jun 2016 08:05:04 -0400
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:36033)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bFgtt-0005hD-BK
	for qemu-devel@nongnu.org; Wed, 22 Jun 2016 08:04:57 -0400
Received: by mail-vk0-x229.google.com with SMTP id u64so58832243vkf.3
	for <qemu-devel@nongnu.org>; Wed, 22 Jun 2016 05:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jZct3G541WYZKCX7P2ybbFeXPRzYokk4FDsi6WspjKk=;
	b=PBxmpFBCw2/duHIgBkqyajdOMp3Ff3w0wpeuebMKXRIZsLMfMzM5yXTzUt9fVGgNvh
	C1sE6jBfz6r8AxZemV0FIUoeX9vU0bxan1XAI2EBYAzW52SZpPnKSXZZ+vlpVSfV7QRT
	056KFPfRCadsmw7oaMlTeQqTTBv171tqVpS1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jZct3G541WYZKCX7P2ybbFeXPRzYokk4FDsi6WspjKk=;
	b=DI0OWJYOMbLxopCt7gM2scEWNUzJGOrA9YcCNGVH3batGvubwI+OP+MxvVOFe9zaJl
	fu518EonTCINqe8wywFDnCpm6rchF3YvDlH1IHqxiLfgPKr6Y35IH4X6zr9KcnA8bexh
	9SpwNWkGt1oVyKO8tjTEQMA79fAulJPDXUNR3QhJ5zNyxhczewa1nuDuvCOzXxA08429
	s24DdjG6JlUsY84aWC3KmQ7fB4TrG2iNnCExrbizGW3CB1cDaHdIeBwAgLbWqk1mtpzU
	BKuoP8s+ONPlANQg70waM1CWaYTCkUntGs0lA9IYsLYdECz91EDa6E6mpdgpmGkff584
	bE5A==
X-Gm-Message-State: ALyK8tKqQBvC6UTE2/NDDwRgqyFnfvV4mb18pU6fgcgMwrLpvBPAkhlwzQ0iJYn4XV7DhngiRiWAgapUI/rz24Gz
X-Received: by 10.176.65.106 with SMTP id j97mr12105776uad.64.1466597096918;
	Wed, 22 Jun 2016 05:04:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Wed, 22 Jun 2016 05:04:37 -0700 (PDT)
In-Reply-To: <CAN76PtRzf2qAwkMi9PMCUCaUha+6EpFnA_TiBB_oWLVFEQ8yyw@mail.gmail.com>
References: <CAN76PtRzf2qAwkMi9PMCUCaUha+6EpFnA_TiBB_oWLVFEQ8yyw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 22 Jun 2016 13:04:37 +0100
Message-ID: <CAFEAcA_SRt+uDMy=bAqktW=cGErYkMiAsNGBT7Jbyd1KRGtjxA@mail.gmail.com>
To: Kevin Zhao <kevin.zhao@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Subject: Re: [Qemu-devel] Question about a qemu Aarch64 error when adding
 several SCSI disks
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U5ALt2lSI9w5

On 22 June 2016 at 12:51, Kevin Zhao <kevin.zhao@linaro.org> wrote:
> Hi All,
>        Greetings from Linaro. This is Kevin from Linaro, and recently I
> have met a problem of qemu-system-aarch64 when I am working on virt-manager.
>        I have reported a bug here:
> https://bugs.launchpad.net/qemu/+bug/1594239
>
>        It's mainly bout adding several SCSI disks to Aarch64 guests.
>        If you have a moment, pls kindly give some advice about this.Thanks

Can you reproduce the bug with a newer version of QEMU?

thanks
-- PMM
