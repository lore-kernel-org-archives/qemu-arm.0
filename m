Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3567904wrq;
        Mon, 25 Jun 2018 02:07:02 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdPXKOVy3dMt1xWRqQNI3Nqkyt8j8HEVGlUvq0kaisvimz2rVPgMrpP3Z9pKsdLknRB8jvZ
X-Received: by 2002:a0c:93b3:: with SMTP id f48-v6mr835227qvf.151.1529917622111;
        Mon, 25 Jun 2018 02:07:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529917622; cv=none;
        d=google.com; s=arc-20160816;
        b=YxPIjf6THmd//SgK3KRrRYV3ks100Xoss9+t1DqDcHz0JzrevGOpYs2L0t1+jNOzhq
         phcGTw/6n4lAirdwy7CgfcBQTQAunSnvcaUfVw9fN11NDBvZnIOfdzvcpWKyVTJBlQt7
         I3c++8w+G70+FXNX7V4/qsLDqF4hvvXwrthFxTpng+9YOYk7Ez0bF6Fq1gTfuZYQ0vtG
         jwLBo9hBiuZPHGzPBOi4rBQA0n39QKHsMcbI517TR0A8YuimuwmijufZHH/b44J89AL4
         BComHPbRbU0g7KmLONFHj7wufGaiek3VEcYP55TqfOkmd3+xksK4pQ57U/xLMdSnA2/3
         lnBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=dyZdZhTW0gmNK/X41nUgC8fRWwdTSh/kMcFEyuVRyLU=;
        b=HEL1ndQpEB/axkr31XTn99lGAmjpS5cBkdicFgoqV8wWbGVjlyFDXSBxR+y5QrvPZA
         AAwezGDtsVIXcfGjSbTIpELVvDFs2lKrLj/1W0QSGpCm1Z6cKCLkXh5PlFXnnPDd8n0+
         iMMqJ1Cvlzf/4CMG1lSKZKpBBTR23DJn0RhjIUsWASS5d2et2YFF9azzOEOFNFschUMn
         HFuHZI1znNU3tVxBG3kUxDET+gjEKuq0cP7dJUKWcuFMfhsysNDqFAr+rG5Y37UsFqZ+
         b42tvxfxlhfzMvqfnSfWekI1L/besCatX+wH8wGP7kA4/OIxqmtPXqMPcaK9K49p0cU8
         9Fcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Tg+UOogH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i16-v6si10262883qti.255.2018.06.25.02.07.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jun 2018 02:07:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Tg+UOogH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44953 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXNSe-0004FO-Dx
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 05:07:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXNSD-0004DD-QV
	for qemu-devel@nongnu.org; Mon, 25 Jun 2018 05:06:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXNSC-0003T4-Nk
	for qemu-devel@nongnu.org; Mon, 25 Jun 2018 05:06:33 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:34308)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fXNSC-0003Sc-Ia
	for qemu-devel@nongnu.org; Mon, 25 Jun 2018 05:06:32 -0400
Received: by mail-ot0-x244.google.com with SMTP id i17-v6so3380107otl.1
	for <qemu-devel@nongnu.org>; Mon, 25 Jun 2018 02:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dyZdZhTW0gmNK/X41nUgC8fRWwdTSh/kMcFEyuVRyLU=;
	b=Tg+UOogHcz/yMQnK/eWThQDRoTDlr4rcvqP5LC7Cf1GG3efZuC7a0bL7up641iYI/V
	MV5A0NiVEv06kawGRrQPTbQMCbbJSfSOHFtnLRwXNqTA7cNJFtRqEYXUbo44LRhdktqd
	A5+9F/B+yyyKVn4vZ6yOXXJxPg4Ah4gtzGVX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dyZdZhTW0gmNK/X41nUgC8fRWwdTSh/kMcFEyuVRyLU=;
	b=uSsq3w+0VM9jLxKvltcEGIS6NZZbdJJSWYQgkYia58AlfsgCpfrywf6kqhiY5TZRI7
	QP7EL+X4cGF6LJg6fSZ0Ts/W+aSNqiGAbp6LNRnS1uwElG1MVoWGG6FxQx/fmuoKh1bQ
	LRfWNRIdujgxfTeGHEteKmgw3xee5WDxlwAHEMqQMLto6+1nxUkZSam5mE1EfBe6ttTR
	VuYXUVlLn9J9kvT3vIbldk+Hx0GXqYPPXHmkteKrC5fJyn6Ww+jjS0YHrNCT5qof/DaR
	6/65Q9M6zB/FW/FEaVCmVgszUY8uXOxz4174Sz4BXPFq6xOzpApO2cVBvQpMOU9Y2Wsx
	Terw==
X-Gm-Message-State: APt69E1QyEEC8FSObje7nt8peeRdA3I7gZwRTRMArU+WiO54WebnHFcZ
	RxJ3+2iu/OlkAUuFutUPNDFWWkwX3Iw4mnbnlYKn3g==
X-Received: by 2002:a9d:34db:: with SMTP id
	t27-v6mr7451690otd.316.1529917591705; 
	Mon, 25 Jun 2018 02:06:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Mon, 25 Jun 2018 02:06:11
	-0700 (PDT)
In-Reply-To: <CAHmQWvCczwh0Yto=9s2j7d00ULokZ0=VrxykAyXBvvHzQaUEMA@mail.gmail.com>
References: <1529663827-28854-1-git-send-email-hongbo.zhang@linaro.org>
	<CAFEAcA8Bx7b_0zUxbdxFgtANFycVkUiSiemAwHpr0wpyxuLKmw@mail.gmail.com>
	<CAHmQWvCczwh0Yto=9s2j7d00ULokZ0=VrxykAyXBvvHzQaUEMA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jun 2018 10:06:11 +0100
Message-ID: <CAFEAcA90hDS17L64YZ5H_B-kYkMaMV+ofBtdD=TEKgsnT+wUqA@mail.gmail.com>
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-devel] [PATCH] hw/arm/virt: fix psci conduit in acpi when
 el3 enabled
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
X-TUID: fHwmi7OLnzZb

On 25 June 2018 at 05:06, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> Hi Peter,
> Yes, your considerations reasonable.
> But in practice of hardware platforms, programmer checks that Arm TF
> is using SMC for PSCI call conduit, then fix it manually in the ACPI
> table, reason may be that Arm TF is lack of ACPI support, if device
> tree used, there should be no such thing because Arm TF can support
> it.
> On QEMU, I just mimic the situation, if a complete reasonable
> solution, further efforts are needed to figure it out.

I'm afraid I don't really understand what you're saying
here. Could you try rephrasing it?

If we're running at EL3 and booting firmware, then QEMU doesn't
provide PSCI. The firmware we're booting is the only thing that
can know if that firmware has implemented PSCI. So only it can
decide whether the ACPI tables and DTB should say that PSCI is
present.

thanks
-- PMM
