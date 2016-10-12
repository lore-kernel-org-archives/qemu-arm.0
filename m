Received: by 10.80.166.35 with SMTP id d32csp504204edc;
        Wed, 12 Oct 2016 05:27:33 -0700 (PDT)
X-Received: by 10.55.53.68 with SMTP id c65mr768606qka.182.1476275252985;
        Wed, 12 Oct 2016 05:27:32 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 47si3706226qtz.106.2016.10.12.05.27.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Oct 2016 05:27:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33231 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1buId9-00088I-NN
	for alex.bennee@linaro.org; Wed, 12 Oct 2016 08:27:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buId4-00085Q-Ux
	for qemu-arm@nongnu.org; Wed, 12 Oct 2016 08:27:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buId3-0002io-6M
	for qemu-arm@nongnu.org; Wed, 12 Oct 2016 08:27:25 -0400
Received: from mail-ua0-x231.google.com ([2607:f8b0:400c:c08::231]:36280)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buId3-0002if-1V
	for qemu-arm@nongnu.org; Wed, 12 Oct 2016 08:27:25 -0400
Received: by mail-ua0-x231.google.com with SMTP id j12so5238996uab.3
	for <qemu-arm@nongnu.org>; Wed, 12 Oct 2016 05:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NnDeiUrilv2ls8b2M8gGwHIrsybDVlxYwbXLW9Fz2NE=;
	b=OjRnAg97tF2nHQQlLqtejY54X0R96GPX66m7Ob6BiGoOq0XPg1gJf3mdXhyarxzuL0
	sG7/HPa7C3S11xGMCHxCxp3+8qpvqvHvNTFeYEnFdTm++EOk1SQt9V7XxWnrL/ndex8/
	Mr0m6E96N5iqbWOobdI74qH2x5pYUMDaUOtlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NnDeiUrilv2ls8b2M8gGwHIrsybDVlxYwbXLW9Fz2NE=;
	b=JdVqz8Myzw0dvY4CUy88TDEiFGIeSEoLU7xy5NNQ1zFGldPRdNbbQU0IvwgevHhFXE
	glB5o1HFep6rZ92kALwVFz9a2NmJDQ28jlP7wWy6cQ+GukJ8dUnAPbSpa2Ew3JQUfKvl
	c+ADu1/QDMS76aPJuDHANgx25ogLpTLuMDZ8WaU7nm6u8mN5I9xYAARSa3livGoWdljN
	r5wc1atj45oq99XdGblz3pJoqECcPzUsbwZSGF0j++kUtUqS4iNPHIGmP0uZRFl2vGMx
	zGhmQCbAyVXLLI4Z8fXux2D67+ZaBrEtYV/pdyI/RySUMPv60HvcRRDyAovWKxwVFQGj
	KJqg==
X-Gm-Message-State: AA6/9RlZSjwYTa2bw1vSI9lH9Pkw6Bn6pPLk+IagMo5op/88E2K75x2RbXzcxAIB3Dr+X7lEkVsF8V44GW9rtHGE
X-Received: by 10.176.0.72 with SMTP id 66mr395785uai.8.1476275244557; Wed, 12
	Oct 2016 05:27:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Wed, 12 Oct 2016 05:27:04 -0700 (PDT)
In-Reply-To: <1476117341-32690-1-git-send-email-drjones@redhat.com>
References: <1476117341-32690-1-git-send-email-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Oct 2016 13:27:04 +0100
Message-ID: <CAFEAcA9wdv-Us7B2xEpoK8oP9K2vEhAQyOqP43UtjKMkgeObwA@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::231
Subject: Re: [Qemu-arm] [PATCH 0/2] couple ITS support fixups
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 615Orr3cWkXb

On 10 October 2016 at 17:35, Andrew Jones <drjones@redhat.com> wrote:
>
> Andrew Jones (2):
>   hw/arm/virt-acpi-build: fix MADT generation
>   hw/arm/virt: no ITS on older machine types
>
>  hw/arm/virt-acpi-build.c         | 14 ++++++--------
>  hw/arm/virt.c                    | 15 +++++++++++----
>  include/hw/arm/virt-acpi-build.h |  1 +
>  3 files changed, 18 insertions(+), 12 deletions(-)



Applied to target-arm.next, thanks.

-- PMM
