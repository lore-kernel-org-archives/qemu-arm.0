Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2732667wru;
        Tue, 17 Jul 2018 07:26:48 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd8WYrLckYw8qqGncdzxi/1NRYp0H3q4cCFg7sUZ5XFL8MT4VphrITXA6U9X3CIssIsswf9
X-Received: by 2002:a0c:c176:: with SMTP id i51-v6mr2016547qvh.40.1531837607983;
        Tue, 17 Jul 2018 07:26:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531837607; cv=none;
        d=google.com; s=arc-20160816;
        b=T1RPvdAIcwnh8SH2974ULv39XOvXup45T3Lo+WqxLkXTEr0qaqMyn4XXmhS5Vykn+5
         A4HPg0+J6SWa5QATiRLRGEUtd9bxQ1SX08CKsrFsEPRPG458eqoCGrKW24vEe7VxApqh
         upgbkSWw0gBnfW0ZiAu0QQB+7YLwA9GCve3LkOnFRNnDBQHmdg3mHDZS6W2RPP0cAPFv
         QfrMjdm8voYEtPhUgpZw634Ezo9jiVIUtWvKvhm6NnRJOlEP6DFK31aRsq+H5uJp1McE
         ZUR7Xj8vf0nutXey3Vj6qmwwI75I4P/RytA4OapxFS6NAH1OybnFdM7/eAElK8YrQ4+E
         Vwjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=/pAIxdVhNxoeOgZ98Z7e9YeJZWTYkkPIQ0Vpx1XazKY=;
        b=UxQc7jlQkIo1TewQaGRkUqVa4JNpMrRQ0sZUev+FY9q61EnzEGiEzcKApbbfminFgs
         deYXQMDAtVf9IwIozF+jm9AFGsioOk1fjCP7gWSgipPOxfRP/RFh0eHyoIL295kGydpf
         3bnc1SPLWIj65963jopArD+2DtMlMWJWGdgkx9hnrNv8wZHag3e3APLgiqJBcOkzjhZf
         Cgbyz8ecEz3tM1qZEyu4rv4aqE+qYc0HxwVIXBRwl9pAonp/bN8kcp+GqeDIlnHIVMZN
         Fd8qnYehiI/bQFSdkcZQBU8dZE1lL637KwCVV9alZsWrTSS/p4JecjKu8k9O96mLjeJ2
         Xmng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=awR80hvG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 35-v6si1147418qvn.76.2018.07.17.07.26.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jul 2018 07:26:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=awR80hvG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59669 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffQwB-0002JV-GC
	for alex.bennee@linaro.org; Tue, 17 Jul 2018 10:26:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35675)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffQw2-0002IW-U2
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 10:26:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffQw2-0001Rv-4q
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 10:26:38 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:36180)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ffQw1-0001Rg-Mu
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 10:26:38 -0400
Received: by mail-oi0-x242.google.com with SMTP id r16-v6so2378717oie.3
	for <qemu-arm@nongnu.org>; Tue, 17 Jul 2018 07:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/pAIxdVhNxoeOgZ98Z7e9YeJZWTYkkPIQ0Vpx1XazKY=;
	b=awR80hvGGPx+LvcE/2Qcu23LLRj5wVK8auSMVg68GUX1YBS+2o8gegieYN424RC1hb
	NBmZSWQVJ1SzesLsI5w924fEVgpZgZmiYwXwYPRT5+gZ6OwasmEHsJ3nc1PGmyepfocX
	AvsyhmgT81+agh5laIV6oeBNc42kWwy/m+Mqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/pAIxdVhNxoeOgZ98Z7e9YeJZWTYkkPIQ0Vpx1XazKY=;
	b=SFJc2HlG7j9ORgW7bUziu1BFhdUjnZ6cHmvBZIvq5RNkKG0UAyf3wS2UM3xOrzyQ9P
	GB95FBlFnO62+3r9BdTuCf13dRWN9d7l0hPMb2mNHqFoPYMnTYa6C0/WX/AU3nirVFkV
	WquKSzEPqls+Z+LVXd8pTI8k6ZTvshGXj1TE6vlmLF0SN6ylkleK2ECrJN60E+n8k9ma
	B7J1mdXo0FC42bPhLctXTueVRmMO3fpQZ0p0ORoUiao8tUhEfAI+7Y+yiqjHrOzJV/CR
	CHVUsMw0BNXEGsvF1KyhPZWhHS2fEZQ1PfAbExaIgIK2craHMcnUHqbPCwj9IexJxY63
	C4dQ==
X-Gm-Message-State: AOUpUlG9CKGleZ3iNoB6PHUnnorp1tZHv9Fr6+b3NA5bWeeAtOuByf9y
	4G8nhKJV2Pniw485UVQcA8UsNhDqhvUCNCpDQl9tZFxy
X-Received: by 2002:aca:ce0f:: with SMTP id
	e15-v6mr2005430oig.13.1531837597130; 
	Tue, 17 Jul 2018 07:26:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Tue, 17 Jul 2018 07:26:16
	-0700 (PDT)
In-Reply-To: <20180714171601.5734-15-luc.michel@greensocs.com>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
	<20180714171601.5734-15-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jul 2018 15:26:16 +0100
Message-ID: <CAFEAcA__GVdga=VDuwiVq9XW4gBRxMECd2Xm_U8fDzH+aTkzOQ@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH v4 14/20] intc/arm_gic: Wire the vCPU
 interface
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
Cc: Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XqixBaQc88z/

On 14 July 2018 at 18:15, Luc Michel <luc.michel@greensocs.com> wrote:
> Add the read/write functions to handle accesses to the vCPU interface.
> Those accesses are forwarded to the real CPU interface, with the CPU id
> being converted to the corresponding vCPU id (vCPU id = CPU id +
> GIC_NCPU).
>
> As for the CPU interface, we create a base region for the vCPU interface
> that fetches the current vCPU id using the current_cpu global variable, and
> one mirror region per vCPU which maps to that specific vCPU id. This is
> required by the GIC architecture specification.

Is it? The spec says the GICH registers need to be accessible
like this, but not the vCPU (GICV) registers...

thanks
-- PMM
