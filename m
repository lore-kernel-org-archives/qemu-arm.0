Received: by 10.223.188.70 with SMTP id a6csp6202236wrh;
        Tue, 29 Aug 2017 09:33:14 -0700 (PDT)
X-Received: by 10.55.27.96 with SMTP id b93mr6333888qkb.282.1504024394437;
        Tue, 29 Aug 2017 09:33:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504024394; cv=none;
        d=google.com; s=arc-20160816;
        b=F0NWakUQ3z9lrnjMcamU4Rjy/xhswL3rMHsvoTad1z8/OIJEn4/vO2zYwkJaD/CEKP
         fZPT9XTiLDA+mZ0bWjHuSpARFrJIQU9I3GjV2l7BdkRl0lf+S1U+PbKXgGt/Klg8wAyq
         Q91XomyjDnoh3ZSQcleoES914XZvl39KSbZJ4iG6ylxAT4HLd3AiwMan5XYdo2s/Mvql
         6fvLoIgma6Yder4fjaFUiJhp5i//lEuMoJJMeBl9l7+UcIZ7ldInxDfwQRwayNIDMZHP
         BMiUDS2HK0b+3wR+Lx0gA1v4hrKO+iGDbLDia7ceEvX41mmiCfiH2GFRdxz0bnIyrfVd
         oGUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=Fvqp4ys7VgciDinI6si6BGnKGD8DLWuR6r4pQSVpgnc=;
        b=zaF/OQOLouM41fWL3KfyVJabyYRmSnHPHpnZAm7QoMe9jB/yjCRi1qepT6zrzWtENi
         rwlwWvLiCnGR2Yl4PGgi7M0PRDcVCe8IYySOQEDW2DChAYRrxRwpIyVujBXK/6NwHVR1
         7b7nzAsKRHLLowzfXZ05ooF18vTQGAWTne0CzGYQr5Re4HUhyq/QbxWxgO8VaRZc0XdC
         xm68MQe8odcIXW4FK34sBjmRf7YzZZqxbm6GNE4ELa+52ji3jsE6FcbhXtIvmgxmdtP2
         cG8VLj2izogh3CdaHGwIGeWcwZF3YSytQaxMoEHHQJufDhRkeHun9bhly5uMsYB1XTYA
         +mjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jknWT1g/;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j188si3453739qka.366.2017.08.29.09.33.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Aug 2017 09:33:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jknWT1g/;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46002 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmjRw-0000NA-06
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 12:33:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40391)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmjQV-000835-CG
	for qemu-devel@nongnu.org; Tue, 29 Aug 2017 12:31:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmjQQ-0008Ra-Co
	for qemu-devel@nongnu.org; Tue, 29 Aug 2017 12:31:43 -0400
Received: from mail-pg0-x231.google.com ([2607:f8b0:400e:c05::231]:34656)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dmjQQ-0008QR-5W
	for qemu-devel@nongnu.org; Tue, 29 Aug 2017 12:31:38 -0400
Received: by mail-pg0-x231.google.com with SMTP id y15so12309525pgc.1
	for <qemu-devel@nongnu.org>; Tue, 29 Aug 2017 09:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Fvqp4ys7VgciDinI6si6BGnKGD8DLWuR6r4pQSVpgnc=;
	b=jknWT1g/P+joOrHAZqL9BGsEwZADRI/59AF8wGYWkL/6eRRYbW6YmMlQvZrN1xOdJP
	B8mq/HWSTtIxPWP3UvJpomz7ARz4Kj8K5D1nLgoIypnLyvhMuJ1Kk4YQTzpAnn38K8Ar
	Q6OqxmeeFl1C4glfkEvCFFfi83/XLvo/841r8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Fvqp4ys7VgciDinI6si6BGnKGD8DLWuR6r4pQSVpgnc=;
	b=dusNuT4dFaVwt6OqKnkMG1NybI/YsvnPSaaupReP5eGnsomudAtFgiH+p+DilyBdk8
	mhZGT2IiVZs4++lTfhqMJnsRrcFpKQD28ZNjyOiN+8EyjNwwyXEqedF+VcGELvBU/s1v
	fakdbOdFXCKMpStnCaTrZ+2AKsxhitbmjoDTTyGFYtyvbJETCM9QXb20x3DxRDDXmD6T
	9YPBDIZByOdtODizFfETQXL38nihPOMd1ARGAzf/Wq6lFtTl7IbIWqmpp2OT5wH/hM7h
	FYTNHPVyIM3eF07j+E27WMV6guiCScgsYeMLhuVFqg2Eq+A/ItViV+RDQeieuR5yjvkJ
	bAXw==
X-Gm-Message-State: AHYfb5i/RyGn7auENzMA66xV9BvcAnOg9R40BkTUyefOMa57gQ1hZBMu
	BaCxQdGKARCRM6FF
X-Received: by 10.84.232.6 with SMTP id h6mr1171900plk.70.1504024297042;
	Tue, 29 Aug 2017 09:31:37 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.gmail.com with ESMTPSA id
	m68sm5891011pfk.15.2017.08.29.09.31.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Aug 2017 09:31:36 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-21-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7cdc8025-089e-2a02-24cf-e8a02ae42bb6@linaro.org>
Date: Tue, 29 Aug 2017 09:31:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503414539-28762-21-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::231
Subject: Re: [Qemu-devel] [PATCH 20/20] target/arm: Implement BXNS,
 and banked stack pointers
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QWEmoyDN1pdY

On 08/22/2017 08:08 AM, Peter Maydell wrote:
> Implement the BXNS v8M instruction, which is like BX but will do a
> jump-and-switch-to-NonSecure if the branch target address has bit 0
> clear.
> 
> This is the first piece of code which implements "switch to the
> other security state", so the commit also includes the code to
> switch the stack pointers around, which is the only complicated
> part of switching security state.
> 
> BLXNS is more complicated than just "BXNS but set the link register",
> so we leave it for a separate commit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h       | 13 +++++++++
>  target/arm/helper.h    |  2 ++
>  target/arm/translate.h |  1 +
>  target/arm/helper.c    | 79 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/machine.c   |  2 ++
>  target/arm/translate.c | 42 ++++++++++++++++++++++++++-
>  6 files changed, 138 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
