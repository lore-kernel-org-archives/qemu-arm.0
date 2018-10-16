Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5641478wrt;
        Tue, 16 Oct 2018 02:55:46 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63E1ZdNwmctth+1Dmc4/JZa42wNG/INbNSc3G4FowDp69IWxaO/51N4/usiXYOYbjIfoytK
X-Received: by 2002:aed:29c5:: with SMTP id o63-v6mr19993566qtd.264.1539683746163;
        Tue, 16 Oct 2018 02:55:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539683746; cv=none;
        d=google.com; s=arc-20160816;
        b=ZosLi3WRirg6MA0dKCGshPOqbkTsuM8Oxmw6+NT5KAY0Fn1EiRCLhQlN2JXaSq5hLy
         nQfQPJSRhFmCzJ38/VO6bf/U9J4WpjOrzCIgdRjRlGdDGTKvP5mDZ4DUB7lHFCMq02VO
         1XVjA1bEn9IrsKcBJYG9eHwinVyh0VyOdMf3/PYpeuT08M1J8J0ZfciZLB9OKVI28t0s
         tloFmTe2w2UIDVieN5bNlBs2prpzuIrk0wVlDQu5pPWSte6Hdqx5X4zeLFIjbCCrTFfc
         aMNMgG0o8j1rO94FQz8SshimjYVQo/X+oyGVuePREAVHH3zACHx/7gr4nr4VeEdkD2cy
         s+dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=ahRHdTzgvfp1kcm8aSm4OMlBlVu1yq1JHj1aEiqFydE=;
        b=TU2FYROwRJmDOBq+6FzdW6LUF9paNQUqkyYSgHdB70gb2vJxXAGsx9jPbN+tj4lvI6
         r00/G8R/HbnBD+QKB3UGml9xD1HaKsPyWm4GwhicDdcwYgAlatyJCBBsibec102AKgJF
         yjqdh1qQ9yMZ33PNONcaHkKKtVYM2DSaDe4Ev/K53B2jA8kKMVijgn5UnNc8uU4cbEfu
         duEujcCTtjeJ2NVM165HySyRHPVZjxHm699vJ4YwgFOzgXdBBRUh+1BZ57bMG3zDVhRH
         HSPXFoAbuk3wNp4FeGnI/Ue28wASw59V2QJhU2H8WpUgh7+4P2/fwwE/w7EetrfIghmp
         w8fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Aq/FwD4I";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x17-v6si8448484qto.135.2018.10.16.02.55.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 02:55:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Aq/FwD4I";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56931 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCM4n-0006oa-Ib
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 05:55:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gCM4c-0006nj-JB
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 05:55:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gCM4a-0006hk-Dt
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 05:55:34 -0400
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:36467)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aclindsa@gmail.com>)
	id 1gCM4U-0006OH-NW; Tue, 16 Oct 2018 05:55:28 -0400
Received: by mail-qt1-x844.google.com with SMTP id u34-v6so24902444qth.3;
	Tue, 16 Oct 2018 02:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ahRHdTzgvfp1kcm8aSm4OMlBlVu1yq1JHj1aEiqFydE=;
	b=Aq/FwD4IGcOXcseRHUUGDUoRRGQba3T3nye1MPEduiFLDWnwxbulDY0c+4BtcO3zNw
	h+lEWytUf14xL21QmIJE84u1JQeMssTKIN5SCWoeTMqYC9dCNLBstFkyy+7DYOQytU5v
	KiOw48lO0LAUpkDx7mbCz8382qwEQq6QOksQgtT3Ak0D42/jvuRy557suUc4EetdSGQ8
	nqFIpVGOY0M3WzmoNZBuN+Aytto/tlwboVsHyxeNl2kuBD2bGSk5kngJI7aCz5a6gpgn
	a+DmU2+D0AdJQdiJVjBh89h3ZtUf+M3Lz4bp2C0UiJlbEQbTzfFFEixPI2mY/fK20O0Z
	3Ung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ahRHdTzgvfp1kcm8aSm4OMlBlVu1yq1JHj1aEiqFydE=;
	b=Ey/7OGPopzBfWf38l5LvhR5P6Cctx/YJHzv1it6ixCxZ37jqRavUE6ABj0ocsIogJo
	XuC6a7TsTPI5wMMZrv+apiiVfCHOLhe7dEbYblHnRHIiuIAsqqwcdSZyEJwwyzYHS8Td
	UBPAdwGxjjmHDeibWpDVnxng5cLh1MdK9li5TaTTuYnpaASrUtCmhEjQSxb/kaHiFo3U
	8lE7w5b40K5FfgM2hEoPrku3POrRBZGrOGMujy2hRQcih4h7UV3Wy9uApHAyjR1QzsNU
	+YM0rslbccLfzh+Xl5/BcbTb2SL7F7bwonuZarGDrfXnexPyp3qFjU3ZYKq201imJEr/
	4Jug==
X-Gm-Message-State: ABuFfogKbhRsQfqs1AHUYe6EJPmqZYvoShhobgtlD0ub9JvVvd6ktFl6
	xxy4RYv2+KMP4pt97/ZsXt4=
X-Received: by 2002:ac8:2963:: with SMTP id
	z32-v6mr19291072qtz.143.1539683719238; 
	Tue, 16 Oct 2018 02:55:19 -0700 (PDT)
Received: from okra.localdomain ([2600:3c03::f03c:91ff:febb:cdda])
	by smtp.gmail.com with ESMTPSA id
	72-v6sm2234331qkc.32.2018.10.16.02.55.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 16 Oct 2018 02:55:18 -0700 (PDT)
Date: Tue, 16 Oct 2018 05:55:18 -0400
From: Aaron Lindsay <aclindsa@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20181016095517.GL3671@okra.localdomain>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-10-aclindsa@gmail.com>
	<4001b651-754e-de03-bfe3-f865bebaed48@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4001b651-754e-de03-bfe3-f865bebaed48@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::844
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 09/14] target/arm: Add array
 for supported PMU events, generate PMCEID[01]
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W2wg/XhL3/j1

On Oct 15 14:35, Richard Henderson wrote:
> On 10/10/18 1:37 PM, Aaron Lindsay wrote:
> > +static const pm_event pm_events[] = {
> > +};
> > +#define MAX_EVENT_ID 0x0
> 
> Is this going to be ARRAY_SIZE(pm_events) - 1 in the end?

No, this ends up being a 'sparse' array. It maps the ARM architected PMU
event numbers to their implementations. So, MAX_EVENT_ID ends up being
the maximum architected event number we implement when my later patches
add those.

-Aaron
