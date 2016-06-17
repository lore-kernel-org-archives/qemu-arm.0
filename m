Received: by 10.25.21.96 with SMTP id l93csp169136lfi;
        Fri, 17 Jun 2016 02:22:45 -0700 (PDT)
X-Received: by 10.237.50.199 with SMTP id z65mr1050567qtd.24.1466155364921;
        Fri, 17 Jun 2016 02:22:44 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k33si30077593qtb.119.2016.06.17.02.22.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 02:22:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55108 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDpzA-000469-Bx
	for alex.bennee@linaro.org; Fri, 17 Jun 2016 05:22:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57836)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tsunghan.tw@gmail.com>) id 1bDpyK-0003ma-94
	for qemu-devel@nongnu.org; Fri, 17 Jun 2016 05:21:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tsunghan.tw@gmail.com>) id 1bDpyJ-0003YX-24
	for qemu-devel@nongnu.org; Fri, 17 Jun 2016 05:21:52 -0400
Received: from mail-oi0-x232.google.com ([2607:f8b0:4003:c06::232]:33558)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tsunghan.tw@gmail.com>)
	id 1bDpyE-0003X7-Sg; Fri, 17 Jun 2016 05:21:47 -0400
Received: by mail-oi0-x232.google.com with SMTP id u201so108825381oie.0;
	Fri, 17 Jun 2016 02:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5NbI0sCfo79QKIbWijtBxn61M/yITCObBu6CgcXujT4=;
	b=tDjkHlZZ+5bbohOApGjTF0a6WEbze+5E5s68dVRhZJlfQA/Q24lE6OC3MRDsyT9KHE
	vgahtuQgbXxXwnOnONKEpIbQzx3YFPuWgHXX172r9bd6cWUViGDz2wAmrxA0yn0Gt9Fb
	eX6GVyRN9BdBPiLPLybWDQGI7j5Q3yHeO25QBv3prvyy7X66Wkg4ansyiMqNPR4W6riw
	enz96x/ViFTnIfvaquiQqTFnrWfLGgezSxpg9z7A4ccbuD505Ed0F2ylrd61AD6+0Ee+
	cJ8hUuxSy8Xs1VqHaUosty3j73uIZLpxlKyfXmi+G8kpioiOiXPxB/Aa41/3Xm2TH/mb
	OLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5NbI0sCfo79QKIbWijtBxn61M/yITCObBu6CgcXujT4=;
	b=Yb/P0lb236rAiztqA7mqXdya5owqJDYvCGnAkBOCjKJRpY1xGSLf4J65uk1dRG6Ysa
	x/d9AcdHWqMQu8Yg+y5lwkzoVXbRCEpE6eq3Xb9Cd1DYg9YDnyS8/5Zolur9iwOwNc4a
	kQKGHl+Y52F2pwmmqqANb7vKLAiPRbrUxhp0P5u5vi1rVzzn6ByMOxa7o3Vh60jOTXok
	13cuE7Tx7WnKIVFqfU72lLrMs1sBxVE/zKskf/DDDH3DJD7QppcNhTB93lMsSu7lneHk
	6bAnHXIzyPQbEgk7NPi4wxAl3umzNL7VKNcbYmcQZjnfMqjJhTUntyBXawPI9MuPxo30
	s3Ww==
X-Gm-Message-State: ALyK8tKPGms4QLQVFhZvLwZzEI+ikyGBac0an4UKHq81qO2TybTisMD+kGE+NZdWxQtt2UrJ9Y3B05USov15HA==
X-Received: by 10.202.59.133 with SMTP id i127mr570985oia.14.1466155303959;
	Fri, 17 Jun 2016 02:21:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.24.58 with HTTP; Fri, 17 Jun 2016 02:21:43 -0700 (PDT)
In-Reply-To: <CAFEAcA_7peAWc0Xop8pQ8meik=Gs-o_MmPuFDJwA-hU2YE=LPw@mail.gmail.com>
References: <1466131046-25516-1-git-send-email-tsunghan.tw@gmail.com>
	<CAFEAcA_7peAWc0Xop8pQ8meik=Gs-o_MmPuFDJwA-hU2YE=LPw@mail.gmail.com>
From: Tsung-Han Lin <tsunghan.tw@gmail.com>
Date: Fri, 17 Jun 2016 18:21:43 +0900
Message-ID: <CA+BS1oFVjbYNsyjhp6ihtknHRmgdMCPLwJ_8ZF+hNEVjCcVf-A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::232
Content-Type: text/plain; charset=UTF-8
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [RFC] target-arm: fix semihosting ram base issue
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XyzDcd0uF3FY

2016-06-17 17:43 GMT+09:00 Peter Maydell <peter.maydell@linaro.org>:

> On 17 June 2016 at 03:37, Tsung-Han Lin <tsunghan.tw@gmail.com> wrote:
> > Hi, I made some changes to TRY TO fix the ARM semihosting issue in
> > SYS_HEAPINFO handling.
> > This problem has been bothering me for quite a while.
> >
> > A new global variable 'main_ram_base' is added while a new memory
> > API, memory_region_add_subregion_main, is also provided to let
> > SoC/board creator to initialize this variable.
> > I am not sure if this is a good idea (to add a new API)
> > or maybe we just let SoC/board creator to simply
> > set 'main_ram_base' in their 'xxx_realize' functions?
> >
> > As for Cortex-M series, 'main_ram_base' is set during cpu initialization.
> > A64 semihosting handling is also added and use zynqmp as an example.
>
> Could you explain what the bug is you're trying to fix, please?
>
>
I was trying to use semihosting on different configs.
Each of them have different ram base values, which is assumed to be 0x0 in
qemu.
However, this may not be true for every SoC/boards.
(e.g., Cortex-M's ram addr is started on 0x20000000)
https://lists.gnu.org/archive/html/qemu-devel/2012-08/msg04641.html

So in order to use semihosting in different configs,
I have to change ram base value every time which is a bit inconvenience.
Also I added semihosting support for ARMv8 devices.

I am not sure my changes is legit or not and need some advices/comments
from you all.
Thanks.



> thanks
> -- PMM
>



-- 
Tsung-Han "*Johnny*" Lin

Page: http://tsunghanlin.github.com/
Email: tsunghan.tw@gmail.com
