Received: by 10.28.71.27 with SMTP id u27csp551979wma;
        Fri, 23 Feb 2018 04:51:16 -0800 (PST)
X-Google-Smtp-Source: AG47ELvZoOKfhFcbGqqt0rgcY8pPN19V+98a/6vHbEPR7ulCwrVrs81Wfc9rqirzNuNMbbiotS7B
X-Received: by 2002:a25:b98e:: with SMTP id r14-v6mr840157ybg.173.1519390275954;
        Fri, 23 Feb 2018 04:51:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519390275; cv=none;
        d=google.com; s=arc-20160816;
        b=Rt9p4xqxFPUKsPjPZ477TML0qODdUqqlPfe+9teBz5/jx8C6lfn4d0mo7DtyWE0mvc
         RjHfKh8xGP5orjNnOM026e+jctrQLWEhJwnmyhLjTsBRfPI/eg+ZLcVKyYN/znLLHdJ/
         U59PkqCr/2slNPZ+UvhGHT3XwIjUztFCV1fsuP6PN9m0ATbDEE6kGTBSSOVyM9FsNXf8
         5m+akhnoEleDxGFydEJU0xlVfzwucZDu28wf58kKI3zVtWQeGQgTB3egLi4JRQta8tNb
         gMmiK6JDB5PQiNlC2dF4hJFpIkbdvb2ZMk7pQOcfoS5i9TDBTD+DjMgZDpkg3maYwKhV
         x+ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=d4rCNhWF4pWFH1lcx8IDSSZgEuf0duDZSOoebc7whDI=;
        b=XBEmEN61LJxLA5hLJMCR/d95GdidprDMyPTJYanQKf447yf80Vm/0MHkp+xgZ75gs3
         NPghTG5PgnFDvTSWfntSUyuQng+Tes6QrSNLlyHUsaiEHvuzZtIV+VjN+kXDsluDuet2
         D63VD/uQ5L5yYqn0jTw1dCOyMSu9iVtk6mMumUYWxbrOHnOhpSTTRGJadoCc+OjvTtYH
         U9zmILSI60O4T/QWRL6bXQoj7ajCPLfaSxXm3qmqJWw3pT/2Rb6Ed0uCKdpLjv+THmaK
         8a1RhUd6B3XB1NwiNN/zb/u62MvhyMqxuz09iR6kgqFoQrNEbugGX82B57WE/wJhe51C
         Fuyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AxI+xIWa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x64si382833ywx.674.2018.02.23.04.51.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 04:51:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AxI+xIWa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44116 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epCol-0007cG-Ds
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 07:51:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52858)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epCoc-0007bx-Cv
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 07:51:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epCob-00082W-Ji
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 07:51:06 -0500
Received: from mail-pg0-x234.google.com ([2607:f8b0:400e:c05::234]:45145)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epCob-00080y-DO
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 07:51:05 -0500
Received: by mail-pg0-x234.google.com with SMTP id e11so3314295pgq.12
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 04:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d4rCNhWF4pWFH1lcx8IDSSZgEuf0duDZSOoebc7whDI=;
	b=AxI+xIWaMxj7UGDVJ3TbWnmRHAyrFTSr64bYuQ+jYe/GPcvOESr+58/LbjCO5ngaBS
	y87XKj53Z79Yj/b3Ssi6K9AIxsGaLoU4zCYgNHne2iXO8I9rOVKrZvAorofCM4CXecZs
	BgvbmPN8EDq5xQLJaXfxfFdj0Cdvdd0ZIiDR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d4rCNhWF4pWFH1lcx8IDSSZgEuf0duDZSOoebc7whDI=;
	b=XWJoJyznt+HUYEIwzBx6MxDFQmLzD29GYztUTTe/CycCAqPsV7EHCptvyh9xdw5a0n
	wUC3jxS7xzYD08tHU/KhyTiD33HppopTcQDaM8KcfLpawobfbZn54gZDggUEMGGpFISP
	tHGReJ2DG8/upFCyTzKA4c334bYDJDmMwJEW/lekzCRsEKqfii7Hf0TubnN7vI+Joe8P
	UObzQem7wDWuLbV/ogMQmU/FrMXOCNc043y8SgA5MY8cXGvnFSTJJymkERly8PFg4rIn
	a1KWvvihp9VSoeMNtAcHvsOTO97KDZkJHTuAzAq8otfYlVp6sK9Ssu0vpT4poK970Inv
	hc9A==
X-Gm-Message-State: APf1xPCImSGTmsed0Fb2ZR20fIjfC+8Z3XWLvnT+DXX03PKwerGaEAKc
	GSek28xzhFohJI9Tfz+VGyBSEJw8VJajx1lUo+RYIg==
X-Received: by 10.99.120.13 with SMTP id t13mr1391285pgc.35.1519390264280;
	Fri, 23 Feb 2018 04:51:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 04:50:43 -0800 (PST)
In-Reply-To: <20180217182323.25885-13-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 12:50:43 +0000
Message-ID: <CAFEAcA-x8DgwS4m_3tXjYhxunfi6-fmkkfOX65V4kujm+eXZrg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::234
Subject: Re: [Qemu-arm] [PATCH v2 12/67] target/arm: Implement SVE bitwise
 shift by vector (predicated)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z5EAvCzXg3Zq

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
