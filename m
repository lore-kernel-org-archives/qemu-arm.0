Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6254233lfg;
        Thu, 4 Mar 2021 05:53:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCgSZBZ7BqazJ2XnMrrqLjbfxXfNUOTKiEpeP6NTCcjMBObbynGL8UvncB5puGDPisccH/
X-Received: by 2002:a02:ccb2:: with SMTP id t18mr4137732jap.123.1614866002079;
        Thu, 04 Mar 2021 05:53:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614866002; cv=none;
        d=google.com; s=arc-20160816;
        b=jCILO5d+PZWoFcGUl4EwIerVYOmdfTtd/0w9SHzMVx9NERlYYGpeZLzOigYVZlOt9G
         dtGs1kY8Cv58ix+RV4QgvYXtV7RpmYFtEVEUGWz7MTHjz54JjJEGb5iV/D2otSD0mjG/
         nQoiguj98DMzpATSF1Ic6t6pI1nYvk7+88P79UWLsd2ZwKSu/TbiZIqZ33sylKQuBb5a
         Jov/19YxJ5LMIrAWuTCXGAk03HRTDpCISINOEjOk5ZZP5f/cqiVGS9ILQWHJqLYBOTS0
         3NvTmw14hsLudt/9kDDD1JQodq4jJ3zQnA5PTsS4c6hW8DguH8NZDUJMNcwqXEgJmP/u
         e7Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=178lDzTU8Fg9PkZrtSkHmNqiMYCqT0yScQdGig+K3b4=;
        b=F47al/o8A3bZkgiFn+7aQbBO1ZkoudftBvx6TJ75mvy8xHfZZDTLGLnlsP/l8iZrif
         jNRHQzZQDVVUP3X+0jyo5KmKX9uwXya+5IV/OlDDCUFNRdzGZPiTF7kWcJHi6spuqIPN
         /usDizGsSwniSVYwBVWRo9Bh8yqQp97iEAfK2Z9SkCM4UTzVFybMgpHIt5emLBEJCuxk
         mSSjpgRJAB4fs/X4T14O9vSnqZO55jaiX6dDUmUY5QR2nXW41MtcD2jUT6l3qDJSeoph
         h0Wb6OHt3z606C+8taLd/cgSoppBzY1UB63JSi6YQZUSig3Nn+wEVpK2wDf+O9vu4qmn
         siVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=XQpVob8Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11si23255811ild.98.2021.03.04.05.53.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 05:53:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=XQpVob8Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHoPp-0000V0-CK
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 08:53:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1lHoPf-0000RN-7b
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 08:53:11 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:36585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1lHoPc-0007XB-4N
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 08:53:10 -0500
Received: by mail-wm1-x334.google.com with SMTP id k66so9776923wmf.1
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 05:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=178lDzTU8Fg9PkZrtSkHmNqiMYCqT0yScQdGig+K3b4=;
 b=XQpVob8YdibhQvmKjddi1JL8PmnoSZ2MIG8L1I/01f6Xf33yrBXCSNvE+sf5sm9IkN
 kr2AXd7caFso9aFGA10T+m5Otjur/zhqGak5fmluxz/+Fk0ufffm89+3oSGNZ+bIJvAw
 wK+1isV+Z9Ng3VKwTOh5KTqC8vF55aUEZpjhubUJwyvCdbe45OHF/htWMtIzo8SdzVuB
 2quRij7qAxnql+1vVSTj8cTQfiio8FFlfOzvcMSU2CABgp8kPOeskn7LsAm34a++ayw+
 uWrIWu0KwC5WLLJ9NIqAcVibVqiDvs6LdGnKqWu4+lOwCi9iniOxA04ahfnSLiVQxwIP
 2xww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=178lDzTU8Fg9PkZrtSkHmNqiMYCqT0yScQdGig+K3b4=;
 b=A6E6qqRf3JtMZTmaMnIickoOxDiL6YrLAoKEPltw24fG+S4xt79N8jiab0e3Aon3Pd
 MlZqIwqfWJkmuBzMV2CvaNa6hd6AfWOUpJ996VR92c7r4XVdUwXEsBO4WzCwWqHTPlWL
 bHnLigsMKAhvfBMC5BkbBU+Uw682Tvs6k+IZFjUxzPij7bC8Vzj1qyk4YYyyOFN9ChfL
 nel/ruZVcrXqH+dU7fQXJvnfYPXapG+9Xt6HEfCZHXEtI3qvNK9Ch9pYVQxSvBTOyju6
 TsKiJMD4I8MukrH6ePFxMVjLODfFxUwbPOKyEPbXVgQYioCt3o2HiQKge+94pG1C32NV
 u/qQ==
X-Gm-Message-State: AOAM532/J6tJOxHbn2cz3lCWMtMHmMGdqt8d1gCHo8WrjeykPhKNMSnG
 9LZdmdabGbNY51bMdnMVUlcWfA==
X-Received: by 2002:a7b:c407:: with SMTP id k7mr4213070wmi.136.1614865986417; 
 Thu, 04 Mar 2021 05:53:06 -0800 (PST)
Received: from vanye (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net.
 [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id t14sm38170567wru.64.2021.03.04.05.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 05:53:06 -0800 (PST)
Date: Thu, 4 Mar 2021 13:53:04 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] arm: bump amount of PMU counters to pass SBSA ACS
Message-ID: <20210304135304.GI1664@vanye>
References: <20210303151634.3421880-1-marcin.juszkiewicz@linaro.org>
 <20210303174849.GF1664@vanye>
 <CAFEAcA-KFF_An50h8JKy68_Y3J4j=kQCOFyGoySKyh53E7KGYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-KFF_An50h8JKy68_Y3J4j=kQCOFyGoySKyh53E7KGYg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=leif@nuviainc.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: egzV2Z0GO6TT

On Wed, Mar 03, 2021 at 18:06:46 +0000, Peter Maydell wrote:
> On Wed, 3 Mar 2021 at 17:48, Leif Lindholm <leif@nuviainc.com> wrote:
> > It would be good if we could get 6.0 closer to SBSA compliance.
> 
> How far away are we at the moment ?
> 
> > Would it be worth the effort to make this controllable per cpu model?
> 
> I don't have a strong opinion on whether we should, but if we do then the
> right way to implement that would be to have the PMCR reset value
> as a reset_pmcr_el0 field in struct ARMCPU (like the existing reset_fpsid,
> reset_sctlr, etc) that gets set per-CPU to whatever the CPU's value for
> it is; and then instead of using a PMCR_NUM_COUNTERS value,
> extract the PMCR.N field when needed. The hardest part would be
> going through all the CPU TRMs to find out the correct reset value.

That makes sense.

I guess we could also phase the transition by using the default value
if zero?

Regards,

Leif
