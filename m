Received: by 10.25.21.156 with SMTP id 28csp1536094lfv;
        Tue, 19 Jul 2016 04:04:41 -0700 (PDT)
X-Received: by 10.37.192.200 with SMTP id c191mr25383693ybf.105.1468926281077;
        Tue, 19 Jul 2016 04:04:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v207si19280433qka.94.2016.07.19.04.04.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jul 2016 04:04:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54668 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bPSpM-00077y-Lt
	for alex.bennee@linaro.org; Tue, 19 Jul 2016 07:04:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bPSpG-000773-Lz
	for qemu-arm@nongnu.org; Tue, 19 Jul 2016 07:04:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bPSpF-0001xo-NH
	for qemu-arm@nongnu.org; Tue, 19 Jul 2016 07:04:34 -0400
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:36606)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bPSpE-0001xX-Gn
	for qemu-arm@nongnu.org; Tue, 19 Jul 2016 07:04:33 -0400
Received: by mail-vk0-x230.google.com with SMTP id g1so6763647vkb.3
	for <qemu-arm@nongnu.org>; Tue, 19 Jul 2016 04:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=l9bYT244hncSRVkS99EtwNYdUFyFBYWalEqU3FaSLXU=;
	b=hlDZL5RBJcVqI6/14x5LyXcgXwUlplKrxAUHDU1R/C2YUT0qRhpllsNPBPpjWm1z5O
	pUb16rCcs5WjJnC/GRZZFzSlQsjm7YPlfsYCVZ3a6AqkyG5UDooWhjyMSxmf/AcMSkTn
	+tNrNiywxuqSxQqjZ5zcsKEY/o4jq/yP53OGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=l9bYT244hncSRVkS99EtwNYdUFyFBYWalEqU3FaSLXU=;
	b=CqnRLfUtYbyoIm5O8KJu142Tj/iNjL8f1ortnMOpFhUHiLaqNRQaXBpqkch9aqQSKn
	IbrIuD3+jcNqhaC06rTynXzWLf0FC6elLwbZKgZExPONFWNovWggkfMQITcGHSQUH5Qu
	3sSAvvmxp/PbnFPz7ZE70JAm06iuBz5LQ/HvB/47JDLwP4GysGTqAT9kbj6tnnXlsAj9
	D3jX/XhnIXegeTg7kaT8BR66sqM+efSHSx2nB+tdBDQtGni0GoE+taTwTOXIJW5t9RXm
	fwiIxnyfgog6uEMcvthCj752ybYEcSSdMjJqLjAaVQnMSnTbh8953mQ81VU2HWDDMTLi
	T2Cw==
X-Gm-Message-State: ALyK8tKTPXfqNMoTmVUYGsPLjAIV8sC8kQ2OPiEUNR5EYiA6Gn5ug5AcD3I5HAf3wQ78o+LdZ2wKobWAqUAOgZq8
X-Received: by 10.176.65.71 with SMTP id j65mr20258726uad.103.1468926272041;
	Tue, 19 Jul 2016 04:04:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.69 with HTTP; Tue, 19 Jul 2016 04:04:12 -0700 (PDT)
In-Reply-To: <CALicx6tk2xkVf=Rz9KG-v-0xLb5=Tz1VidjuBDiqP0j-p+x=Pw@mail.gmail.com>
References: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA8iPStWP4Pcf6Bxmn8gL5SnBDFyrPNDUpi8syc7PC_QiQ@mail.gmail.com>
	<BLUPR0701MB1684CF1920D922BD00E93EE6F2230@BLUPR0701MB1684.namprd07.prod.outlook.com>
	<CALicx6tbpSZDBYYzA0Uk5dHGoW-4_CTFuUnUDDe+NGieakts+g@mail.gmail.com>
	<CALicx6tk2xkVf=Rz9KG-v-0xLb5=Tz1VidjuBDiqP0j-p+x=Pw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jul 2016 12:04:12 +0100
Message-ID: <CAFEAcA9wNtFSmoJD2jHOy2LWPNBa_f1WyG1VBO2d5pSD0LQjgA@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Subject: Re: [Qemu-arm] Fw:  [PATCH v2 0/6] Runtime pagesize computation
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
Cc: "prasun.kapoor" <prasun.kapoor@cavium.com>,
	Patch Tracking <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, "Kumar,
	Vijaya" <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zWEbj8KxkUOe

On 19 July 2016 at 12:01, Vijay Kilari <vijay.kilari@gmail.com> wrote:
> Hi Peter,
>
>   Any update on this patch set. Is it merged?

No. It's an RFC patchset really, and it was posted during softfreeze,
so I never expected or intended it to be merged before the 2.7
release. It also needs a respin to address some of the review comments
I got on it.

What would be useful in getting it further forward would be
some good performance benchmarking of more than just migration.
In particular whether it improves the speed in TCG emulation
mode of aarch64 guests and whether that assert in the definition
of TARGET_PAGE_BITS is particularly performance-draining.

thanks
-- PMM
