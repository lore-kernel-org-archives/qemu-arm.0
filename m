Received: by 10.25.77.65 with SMTP id a62csp2491425lfb;
        Thu, 16 Feb 2017 06:20:57 -0800 (PST)
X-Received: by 10.200.51.199 with SMTP id d7mr2504827qtb.67.1487254857171;
        Thu, 16 Feb 2017 06:20:57 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q94si5321893qtd.118.2017.02.16.06.20.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Feb 2017 06:20:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46947 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ceMvY-0000HY-Gd
	for alex.bennee@linaro.org; Thu, 16 Feb 2017 09:20:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47406)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ceMtA-00063y-JE
	for qemu-arm@nongnu.org; Thu, 16 Feb 2017 09:18:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ceMt9-0000u3-Mg
	for qemu-arm@nongnu.org; Thu, 16 Feb 2017 09:18:28 -0500
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229]:35237)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ceMt9-0000tV-GF
	for qemu-arm@nongnu.org; Thu, 16 Feb 2017 09:18:27 -0500
Received: by mail-wm0-x229.google.com with SMTP id v186so67527170wmd.0
	for <qemu-arm@nongnu.org>; Thu, 16 Feb 2017 06:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hOaDTFP2ENq9JHe4RTYHF5pObGrOs6orwFFi4GhyLXU=;
	b=JCyXgSZIr8jJpGf50B+p/uEVAulQ7WXwbuD/WlkhU5nHljk1b6LwwmzUiIw36+fvJ/
	5H4qDUr22KqYRClO/xSv1lgPJweXU8nSvWN+pSV0QDi/4siaO4JsuOB4HJzcWUwjksG9
	LSOA/GEtt5b8JhAOA4/SgnjkUPpgkUSvkN42M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hOaDTFP2ENq9JHe4RTYHF5pObGrOs6orwFFi4GhyLXU=;
	b=CBgpmcmknCoNyAQqF1Pfyaw7tvpDZGs82bH92rIr6kO6CfEViFqIwSxbPvddgtv03W
	mhhLSVrO3pbNNvpBFxcLBHgogoWwSeyCbTE6SER/p9oGnR1Ht8a1D2N5D8toAy3sZBlk
	9C8qhM6TBIK2CA4lPqU81x9/W1hwG8wOCU2gPDHtWAhxhxgwG++VDCkYbJIR2e/WpFic
	gLERVJ01Dz3M2wcVWk9UTcBFPw7hgcbu9bwJFu7awfuc8M7NYgFvM8Q+TuXdx24F3FFw
	HYvYSLyUEPg7GicMg4iq0GEPFheDBYRcpadk5D4p1EW7tD2VhfoFcfo3nnQXLO6SXjhW
	ENYg==
X-Gm-Message-State: AMke39ng020i/oqthU86jdKBKip/FTQJG/f7j6fpM+l6+lsGqVPe9jrzghfPVDgemopdhI0W5bhXWj+6ibGbYG5U
X-Received: by 10.28.55.199 with SMTP id e190mr12214227wma.92.1487254706349;
	Thu, 16 Feb 2017 06:18:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 16 Feb 2017 06:18:05 -0800 (PST)
In-Reply-To: <1487253461-269218-1-git-send-email-imammedo@redhat.com>
References: <1487253461-269218-1-git-send-email-imammedo@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2017 14:18:05 +0000
Message-ID: <CAFEAcA_NgmdDCfbPy+DnHQBmNGmQ4tj1z4ci+OP7+x4tHLLCxg@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::229
Subject: Re: [Qemu-arm] [PATCH] hw/arm/virt: fix cpu object reference leak
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E3CQ25nDIuil

On 16 February 2017 at 13:57, Igor Mammedov <imammedo@redhat.com> wrote:
> object_new(FOO) returns an object with ref_cnt == 1
> and following
>   object_property_set_bool(cpuobj, true, "realized", NULL)
> set parent of cpuobj to '/machine/unattached' which makes
> ref_cnt == 2.
>
> Since machvirt_init() doesn't take ownership of cpuobj
> returned by object_new() it should explicitly drop
> reference to cpuobj when dangling pointer is about to
> go out of scope like it's done pc_new_cpu() to avoid
> object leak.

I've always found the object reference semantics somewhat
confusing (why does realizing a device add a reference,
for instance?). Do we document them anywhere?

thanks
-- PMM
