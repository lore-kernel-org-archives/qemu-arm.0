Received: by 10.223.161.27 with SMTP id o27csp845741wro;
        Tue, 24 Oct 2017 10:53:55 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+Qj6FBqaMnEoWR9BH8YZyhDt7bGhGyHK1rbArbRxTpsZ98PcPE6nFepoyy+ZdUOfL+0q4Y0
X-Received: by 10.129.87.81 with SMTP id l78mr11707198ywb.12.1508867634970;
        Tue, 24 Oct 2017 10:53:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508867634; cv=none;
        d=google.com; s=arc-20160816;
        b=INrYt/yWvx/J3sVRK8TyF0XxuX/VWvyUpr78+tXtFAEBP5mDEibZNPR0AR2E5hmyVX
         Em9x48PoruQsqPFFYfK5IAASDoKUVs2V1beu5d2OHi4pmZ6s+pQ4x3UwZQqhKMn50BVW
         XycTIgF0zrFNCBV9L6xY65PGYsFSPMNrUooy0gXy+Bhc4wlQP/hJLtiDLhC4AoacmpYe
         h1j1GFOzdA81ArobMH/sHp5wG+ky7VskNqcevDXOe5Uq2FwDx+x6cGi6qPUegLSHosJh
         SGvTJ3/9Lg0xM0KesZkkFdkwPo6JcABB6pUEP+3YpsvvrdstI37orNGGS55Y9wEIeIxp
         YQpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :references:message-id:in-reply-to:to:from:date:dmarc-filter
         :arc-authentication-results;
        bh=ajWFsw73pBcHqFE7P/J+x5ykrqfVRwXw2Ysrvb4/QnA=;
        b=AZJw6PI7iOskL3s4pEXdp7NWx/jtH9jnYPSsIMuoaXs1lPeYnDGA8JDH4w7TdNa2p8
         YSQTtJaa1Lmf2Tj/jn03OOn0yktH1NLoFXQEgjvOBcekFa4YOdPzm3VPSEAZYYIBz6y6
         LCxiv8fW8W++mOLzCCBEFC9uP7Sa12aKA1cyQvDtIc0f5jM/N5e2mYC+mEeG6qWcJOvj
         O7jrUOIqkzwX2DVVpQiFptSQ9VfteKLBhT2edmttBnqaq6KVlTnbikZtaOjSM336XkZ+
         Gp1Vb9vDSMIZQJjh/Ye1f/2SaFdjAHnAlC8efTR/HlWIkXyhQLyvuBdU+ybJIjkb0sHT
         j81g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l21si124701ywh.714.2017.10.24.10.53.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Oct 2017 10:53:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44999 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e73Ok-00078D-G9
	for alex.bennee@linaro.org; Tue, 24 Oct 2017 13:53:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43253)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e73Oc-000786-HT
	for qemu-arm@nongnu.org; Tue, 24 Oct 2017 13:53:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e73OZ-0002c3-T4
	for qemu-arm@nongnu.org; Tue, 24 Oct 2017 13:53:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:57374)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sstabellini@kernel.org>)
	id 1e73OZ-0002bj-Mk; Tue, 24 Oct 2017 13:53:43 -0400
Received: from [10.0.0.56] (c-24-130-70-9.hsd1.ca.comcast.net [24.130.70.9])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 3C34821913;
	Tue, 24 Oct 2017 17:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C34821913
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org;
	spf=none smtp.mailfrom=sstabellini@kernel.org
Date: Tue, 24 Oct 2017 10:53:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <alpine.DEB.2.10.1710241046350.574@sstabellini-ThinkPad-X260>
Message-ID: <alpine.DEB.2.10.1710241050310.574@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1710211105550.27209@sstabellini-ThinkPad-X260>
	<CAFEAcA_-b5kb=_jDeDbCGugmzvcuUGKvWV0myThVJuTDbg9jNA@mail.gmail.com>
	<CAFEAcA9Zcm4tEbYXJhsp=ZDCoQDZjd53XuM6T+cxfL7fj5QxCw@mail.gmail.com>
	<alpine.DEB.2.10.1710241046350.574@sstabellini-ThinkPad-X260>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: Re: [Qemu-arm] [PATCH v2] fix WFI/WFE length in syndrome register
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: les8OxxIp8es

On Tue, 24 Oct 2017, Stefano Stabellini wrote:
> On Tue, 24 Oct 2017, Peter Maydell wrote:
> > On 24 October 2017 at 16:53, Peter Maydell <peter.maydell@linaro.org> wrote:
> > > On 21 October 2017 at 19:09, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > >> diff --git a/target/arm/translate.c b/target/arm/translate.c
> > >> index 4da1a4c..a89518f 100644
> > >> --- a/target/arm/translate.c
> > >> +++ b/target/arm/translate.c
> > >> @@ -12325,12 +12325,15 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
> > >>              /* nothing more to generate */
> > >>              break;
> > >>          case DISAS_WFI:
> > >> -            gen_helper_wfi(cpu_env);
> > >> +        {
> > >> +            TCGv_i32 tmp = tcg_const_i32((dc->insn & (1U << 31)) ? 4 : 2);
> > >
> > > This won't work, because dc->insn is only populated by the translate-a64.c
> > > A64 translator, not by the A32/T32 code. I guess 'principle of least
> > > surprise' suggests we should populate it for Thumb and ARM too.
> > 
> > ...and also, this code path is used for both A32 and Thumb instruction
> > sets, so just looking at the top bit of dc->insn isn't sufficient, because
> > you might have the A32 encoding with a cond field with the top bit clear.
> > You can either look also at dc->thumb, or alternatively have a new
> > field is_16bit in DisasContext which you populate in arm_tr_translate_insn()
> > and thumb_tr_translate_insn().
> 
> Thank you for the explanation. I went for changing this line to:
> 
>   TCGv_i32 tmp = tcg_const_i32((dc->thumb &&
>                                (dc->insn & !(1U << 31))) ? 4 : 2);

Sorry, this should be:

   TCGv_i32 tmp = tcg_const_i32((dc->thumb &&
                                !(dc->insn & (1U << 31))) ? 2 : 4);


> and I have also added a call to tcg_temp_free_i32, and dc->insn = insn
> in arm_tr_translate_insn and thumb_tr_translate_insn.
> 
> I'll send another patch.
> 
