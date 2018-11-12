Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2890056wrw;
        Mon, 12 Nov 2018 01:06:01 -0800 (PST)
X-Google-Smtp-Source: AJdET5d5d1WUJ42/0zxad+SEuV4F2uqlYJUGjaEGheAhu7H2gjwQjk95x0Fu/omvKwghR3kJ0JR8
X-Received: by 2002:ac8:2585:: with SMTP id e5mr90942qte.233.1542013561324;
        Mon, 12 Nov 2018 01:06:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542013561; cv=none;
        d=google.com; s=arc-20160816;
        b=gp/7ZpQakvfFatTuNnAn2I1IjUuOWA6KQ7iz+JZVQGS7othdPdAD4qFiO+W6v9K5+4
         f0yYZ7EDkWMg3O7Qm5p3/C5p82x2EoUl5RRJnS0OGv8uOOFIb4YPHuIY/5ysiiZPg45q
         DOlAamcTA/4vZ4jZGQhxg/jEH4HvZZH6lN5KI2fb+rkZGWNRyoA+6gTYX2/qqEcSkkq3
         I1u7xgPqAVHuXpR85D1NEDWWh8wyqns4y+ygougzEti5tWn2/yUnSlnQEyd6aiBHir/r
         yKoIK4FywSPQKJKcQ2bGFst0K0ywtbszCrScgGPFN8CrEXlGzSFYKGhWhvDFQ87+7eCS
         HWhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=t4+6r1WIHZD2CA8U8o0UK6wpZIWUfUsqC1eAsBXqJxk=;
        b=JYdc38n8jDBzVqa37rS/xzUconTlVWvTJMsMeATz2CgdJTwh/amH9uHlk7cxXbZu7A
         wAKfzBHErS8R2T41y/Dlcq0Ic969ZE4qbQV677/qxfjkAHcw+BmwyOEZMMUfR5u6fKnB
         p4W3Eb0fiykbZwMPM9ylEwMmvAcaDOMBVA4jodkZxLTDqvavDgNmgwAZjRwe0l6FFDrk
         jWPuxprAK92GDrmAz5rdTJQcrB0x7IxESEl6G7UGpMeqhGvK9B1hDck55YdbFvSXga7t
         gDoTAsqAMw4ncURminoTE8CcrL8AGbVVuV1wGVBptWxpKcJx85Jerj3+IzcfUPN68VRX
         +7kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DnnlnVcB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 55si2072716qvx.1.2018.11.12.01.06.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Nov 2018 01:06:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DnnlnVcB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47260 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gM8AS-0007Ph-FV
	for alex.bennee@linaro.org; Mon, 12 Nov 2018 04:06:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gM8AM-0007Pb-Fu
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 04:05:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gM8AE-0000TD-Mi
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 04:05:52 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:37531)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gM8AA-0000Aj-FO
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 04:05:44 -0500
Received: by mail-wm1-x344.google.com with SMTP id p2-v6so7308097wmc.2
	for <qemu-arm@nongnu.org>; Mon, 12 Nov 2018 01:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=t4+6r1WIHZD2CA8U8o0UK6wpZIWUfUsqC1eAsBXqJxk=;
	b=DnnlnVcB3sEMCZAfwzKIdJRlFbggbBnT1Vc6TF+ETpso8S5SuEVMnUBnKQRPHkteu7
	7EItiXYs7FnYMmuMDFBCEnIMORHQGGRtBqhA5Ll87f4UsAeFFELQHERdJdFDZDse4T0B
	RQSU0A61+8HlCyXGvrviHeK7hUNv/osE30Ydc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=t4+6r1WIHZD2CA8U8o0UK6wpZIWUfUsqC1eAsBXqJxk=;
	b=F1Yx8r2Yeiub9Tp6hoNPveUu77L5o1XMudPklIdTjUou5LPiNkTERbPjIURaGwnTw+
	xiGABaQ3esByAjMG56janI2+s+vkDyDdDiV5R20crx70y8OFTLxCzfZChkmgrsPCqMxP
	HFJAAG+aYFhf4c5SrrWZRsacqJLZl4Er7DO0p7b5JUzACu6uI0qrWjyIjjLnaAWBd1r7
	CL9ZH96GtYYv844Oa+BbvPpWthODEJX6nNwib1DfVBfpPtoACY3jUwBe8AgOZKq9+gyY
	e7PW+Vrq8euTW+XJoHYNwUu/PxuCS+ddlZ5pnSjPaDYXiWlHOQgyMI196vuLoBvnBaM5
	lVmA==
X-Gm-Message-State: AGRZ1gJoXaR8BU9iOa6UeShNQrg2wF7KahvoaulVKlLixM2MKuFJDKDk
	etbpIxJXUC8LtGQJuS+PRD8ytA==
X-Received: by 2002:a1c:84cb:: with SMTP id
	g194-v6mr5954122wmd.24.1542013521170; 
	Mon, 12 Nov 2018 01:05:21 -0800 (PST)
Received: from cloudburst.twiddle.net
	(178.red-213-99-154.dynamicip.rima-tde.net. [213.99.154.178])
	by smtp.gmail.com with ESMTPSA id
	y81-v6sm5391617wmd.11.2018.11.12.01.05.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Nov 2018 01:05:20 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181109173553.22341-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <66ed45c3-65c6-37b6-71ab-6469b1a8e34c@linaro.org>
Date: Mon, 12 Nov 2018 10:05:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181109173553.22341-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/2] Fix the last Hyp mode bug
 and turn it on for A7, A15
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
Cc: Adam Lackorzynski <adam.lackorzynski@kernkonzept.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /g//nlYILFIT

On 11/9/18 6:35 PM, Peter Maydell wrote:
> Not entirely sure what to do about this for 3.1 -- maybe
> put in the bugfix patch but hold off on actually setting
> the feature bit til 4.0?

I would put them both in for 3.1.


r~
