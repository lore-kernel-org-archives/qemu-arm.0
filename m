Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3746078wrt;
        Fri, 30 Nov 2018 08:08:00 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UzRI7zu2tkpW1qntRuACYxWeRcIrb+wWdrOAtbr2rdGagj9vdrunHs4MuYmCKtfgex8Xgm
X-Received: by 2002:a81:a1c2:: with SMTP id y185mr6058399ywg.323.1543594080855;
        Fri, 30 Nov 2018 08:08:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543594080; cv=none;
        d=google.com; s=arc-20160816;
        b=kRux1Fzp1SCrQvnbYPwgg60w+bDZ3ckgwGztOD7YYWtHq3mnQ+djSNo3zfInd7jNtw
         GlmuNCd07DHe+tbknlBGtgpdB3Ywi1i3x3UNN3OHQyHPRAplT6Aqyu/3JiiBgq/IOlpa
         uv7dTia+v+SDcnC4s/o7t1XLaX9uClZE6qioj8fvvam8R68tcpgu1i16nDRIDoaNlQDv
         SCal40jc+YdIV3Zenvygri9sNInOJCwVdiSIhcHuTX/VAVFOLj9sKdmwBFDtl0sZlqxq
         YW0CQ/sQntMFkv5DBi0lz2VlIoydRDZzUklHNdTjwDD5SwHl7u9KeRYx2bY0tuUzLDey
         d/uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pfIl6p+CrIkTyE1/z1rNc0+sLI5N0aVc/A2NYW+1uVo=;
        b=tcu9AgB2UuCmXvz6pBh3dHeGLik1xKKVI0MPnXtb26fv2hGCszw5+tZ9WDorjI8rh/
         DJboAxoZLK/oznIJ4FH8X0+Tj0+8ZMvaa2u9+6uAbUCvwhjP4XelwyWdg2MXeFTZECy+
         iM1mAZfQe5JSWvCPbILIPWTrXFAEHZdrg2hok9xIk35B5WRUSSRBTxA6T5RVeANkGKJz
         no9g35w14KKxj1LkrScJ2ZjUXCzzD3o5KY/kUyAHRG34RMyhwkfLr1/TStTpkXWU8/HW
         D3o0hGGAMZEbJlA8Prd+b78FywRdjOpL/CjpQSwkf8z2aOMCMogNZdMwNW2db0Cngd1R
         Nw2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Fx8j+evr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 185si3249880ywa.37.2018.11.30.08.08.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 08:08:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Fx8j+evr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33569 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSlKh-0001CJ-IK
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 11:07:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42011)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSlKV-0001AF-Cj
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 11:07:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSlKU-0002lU-Gc
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 11:07:47 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:37909)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gSlKU-0002ip-3p
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 11:07:46 -0500
Received: by mail-ot1-x342.google.com with SMTP id e12so5552203otl.5
	for <qemu-arm@nongnu.org>; Fri, 30 Nov 2018 08:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pfIl6p+CrIkTyE1/z1rNc0+sLI5N0aVc/A2NYW+1uVo=;
	b=Fx8j+evrERAvv+2IztuUzy1abWCFhIJGrAmtYQ8BEi2pyVcA1XqOxaA4RvkpFPF+LK
	n/InzhbZ0waDMco7YISOhyagFdwmvpbHj8aGxwtMDSYwpahoe3SWxsfKcWE+Sg6tKJsI
	I02hVPrVrPgTzILFSqLauYseM7oDyjpxbuBaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pfIl6p+CrIkTyE1/z1rNc0+sLI5N0aVc/A2NYW+1uVo=;
	b=oYkHgpMgF4mpPl/BS7OGozM5bixbJ3I3jqc5PBmoaQvpdgMIFQ81Vs0vWCCZdZ42Th
	o3QIozFtzP1LuSNtPDfiGydsrJ5Y9opRrB3eB7jq3ErI/9t60XD8oiow6ohOAGlwfrx0
	jFRA7b2LBwAbinuRKM042xFLhG8hqddG8PownORphOQ5dDkNufIMPef1nxkAh6/2eTVg
	djlGHJfo6cPUWN8LTud+bi+K8HOl99gLzcnm2bB5MfenTDYD1VlQKyxVGfg0yTBKGrbN
	wh4ebNjkbYfw8CxnyFYVDqHvvWa/YAh40w1DBm8mgGB1uZkmgqxElObt5CoCjk4W3MhU
	pJ1A==
X-Gm-Message-State: AA+aEWbgOZFFJ8et1BP2jxgXaN/hEsCEHGIdIIquGJWYb/FiV/0HtU+h
	ltzeFKjUlxVXmrOZh1/kctlk1qA6SGJuS2vSJaG8uA==
X-Received: by 2002:a9d:12d:: with SMTP id 42mr3715626otu.352.1543594062227;
	Fri, 30 Nov 2018 08:07:42 -0800 (PST)
MIME-Version: 1.0
References: <20181120212553.8480-1-aaron@os.amperecomputing.com>
	<20181120212553.8480-4-aaron@os.amperecomputing.com>
In-Reply-To: <20181120212553.8480-4-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Nov 2018 16:07:31 +0000
Message-ID: <CAFEAcA8GwNrZd5kL+Zxk-v8YsNdy04zO5ZeaRA9QXmMJCeVH=A@mail.gmail.com>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH v8 03/13] target/arm: Swap PMU values
 before/after migrations
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
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +3Z3+nMRfFrT

On Tue, 20 Nov 2018 at 21:26, Aaron Lindsay
<aaron@os.amperecomputing.com> wrote:
>
> Because of the PMU's design, many register accesses have side effects
> which are inter-related, meaning that the normal method of saving CP
> registers can result in inconsistent state. These side-effects are
> largely handled in pmu_op_start/finish functions which can be called
> before and after the state is saved/restored. By doing this and adding
> raw read/write functions for the affected registers, we avoid
> migration-related inconsistencies.
>
> Signed-off-by: Aaron Lindsay <aclindsa@gmail.com>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
