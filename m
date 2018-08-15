Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp563613wru;
        Wed, 15 Aug 2018 04:13:49 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwA5GpJrfpfQ5CTIn56vIKQFM+a10VLT9OKHG9y2aWCYM3vZsEGjbYGJnok8VGlV1meb5O3
X-Received: by 2002:ac8:31d0:: with SMTP id i16-v6mr25614174qte.12.1534331629210;
        Wed, 15 Aug 2018 04:13:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534331629; cv=none;
        d=google.com; s=arc-20160816;
        b=vaXcTFBN5/8nrCQE4RAg91eecGvcZW77JEo3k2Wt0q6BRILcaYuIWFsgC8T7+oYtkl
         c4N/GMPiQDcn2Xpb7hE7tExCN8D+dutgL7/WXUk8rnesx1puMAweDOdsQvqJyswcnsEa
         kfJYB7vKnjW6RtDz7tmz6MmKm3wCTqmQ5yV8argk4xdfekn0bK1QrNncF2xzdOLKLF9l
         EFngfjcRHv44rAnrTahzSFpfckxm8JT12epqLYMkbOcek9HUm/gg6Do1cokzqM45LztI
         iy72chE6cHJOpTEROd1PdRq6OCD0AsSGqjvbmfVzF0tGlb4H5H0HgAfwztzJzfrPBhVU
         TxiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=PuONizm0apXcwovIVu5Je+iSlARwq/3LCleqkabQD3Q=;
        b=U1aGDXfRfFYPN/ftL8zW8ZD6+TOBQUtszLdC9L/gS7vYitBVWmFWyndSX9mpkDUKhb
         OGyrVVOaO7GpTyJrckkqKJmZKuUGAomWgP2qhuIda0iQ5C3yrf/OnaKmd6D9XJps7F+j
         gEpbkDSv4ujy9OYrfCL19nUODul9sAjvvrF+I8hFFu+ckT0FuzlDu68dfT9oOk8SNQMr
         GRlYzAGLzkkITA1McwbeUTp8kUeDefsfSXyD6HkMYuMEH9i5qQqBF1C+3XCygKfN9drI
         XCmRaxAY1Vc6Kt4q1ZVJ7hqT6IGmPTT+9l/j97fnweP01a+2T56tcNakWNSeXXyqEEO2
         ccEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y3ksyvqr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a63-v6si11672059qkh.63.2018.08.15.04.13.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Aug 2018 04:13:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y3ksyvqr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48611 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fptkK-0004SP-NJ
	for alex.bennee@linaro.org; Wed, 15 Aug 2018 07:13:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36034)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fptk9-0004QT-Ud
	for qemu-arm@nongnu.org; Wed, 15 Aug 2018 07:13:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fptk8-0006Ro-Uo
	for qemu-arm@nongnu.org; Wed, 15 Aug 2018 07:13:37 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:38558)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fptk8-0006QB-Ib
	for qemu-arm@nongnu.org; Wed, 15 Aug 2018 07:13:36 -0400
Received: by mail-oi0-x242.google.com with SMTP id v8-v6so1319912oie.5
	for <qemu-arm@nongnu.org>; Wed, 15 Aug 2018 04:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PuONizm0apXcwovIVu5Je+iSlARwq/3LCleqkabQD3Q=;
	b=Y3ksyvqrUr/V85jLBbihctg+6cAVEvw3SLwcUabagKhekRi5WCYzoJFcEhVRp0CgDa
	FNFDxhZwh8V7wU5V7zabTmjgq1Kd9ARJVARbwn4dugQEZMeWS2xqHaotzcn1bxef3iNr
	zTd5s3yxyxYDP58V1RiPQ+jpHw+2a7JPO56Eo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PuONizm0apXcwovIVu5Je+iSlARwq/3LCleqkabQD3Q=;
	b=VXvKGTDBY/YXkGRY4gcqY+mZCzvDUmmkIWvZkWO1CKf4CM+r0/ZopAzfg2pa8IWbLc
	In9AMqFOoutOlOu0tsEPjeDLiwZ0XWWCSMEN/fKS5LvZfs81I4UAFNCkS0X2pHwwCqX+
	vvIhbo7WVspP+sc92iJPtoQn5BKjrpLG2AecjtNbx9IsZAajPAlpVmoQNnv5TbJZTbvk
	R4LVqjP4+U2FN7q5hKrIybA84XLX3IM4MUbpb/exBL7t6K+kI7dCFfNZnquqwlflMn/6
	I3Cf1ilOGCkK6LGsH1WUOQpHLcHP5V1kUQxFc/QRJS4IhfjOrPj9Nl7VvcNSObxJYuHc
	dhBw==
X-Gm-Message-State: AOUpUlEZOLBCQpqBEr9RbXnHT2HJEF2EGNPtRek8OSqvsounAVROB3+n
	EdnYqk0kdmKAQIvP5ZmXGChs4t9NMGiLnhW+ZKMZtQ==
X-Received: by 2002:aca:4c14:: with SMTP id
	z20-v6mr24323810oia.164.1534331615232; 
	Wed, 15 Aug 2018 04:13:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Wed, 15 Aug 2018 04:13:14
	-0700 (PDT)
In-Reply-To: <20180815110434.z7skzr6riz3dmnan@toto>
References: <20180814124254.5229-1-peter.maydell@linaro.org>
	<20180815110434.z7skzr6riz3dmnan@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Aug 2018 12:13:14 +0100
Message-ID: <CAFEAcA84FSv1nptP76pcQdO-xZzf7ZVTs1GwUQBECPezGQCpcQ@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH 00/10] target/arm: Some pieces of support for
 32-bit Hyp mode
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
Cc: Edgar Iglesias <edgari@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Luc Michel <luc.michel@greensocs.com>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b1F6dN4BDWVA

On 15 August 2018 at 12:04, Edgar E. Iglesias <edgar.iglesias@xilinx.com> wrote:
> On Tue, Aug 14, 2018 at 01:42:44PM +0100, Peter Maydell wrote:
>> I also noticed that we fail to implement really quite a lot
>> of the HCR_EL2 trap semantics for either AArch64 or AArch32,
>> to the extent that I'm surprised that nested guests work
>> under AArch64 :-)
>
> Yes, we've have an entry for a while in our TODO list to improve
> HCR trapping but haven't gotten around to it. IIRC, at the time
> when we where bringing the EL2 stuff up, quite little was actually
> being used by KVM/Xen.

We're also I think not correctly implementing some of
the required upgrades of TLB maintenance ops to inner-shareable,
so I suspect that operation in SMP configs will be flaky.

thanks
-- PMM
