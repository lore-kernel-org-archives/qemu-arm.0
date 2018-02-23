Received: by 10.28.71.27 with SMTP id u27csp598223wma;
        Fri, 23 Feb 2018 05:35:18 -0800 (PST)
X-Google-Smtp-Source: AG47ELs4rkkV228L1KS3ntOvoOzP8G8rO7Kf2oY8ga7zLXWVRwpWr4WfCoKOF0jjtlVcZtc4Mz9b
X-Received: by 2002:a25:a349:: with SMTP id d67-v6mr981558ybi.455.1519392918224;
        Fri, 23 Feb 2018 05:35:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519392918; cv=none;
        d=google.com; s=arc-20160816;
        b=N75+i4La7dGlvBzRATy9G8OYP4P15/Ji3AaqkwVIyjrKU0GlV/UpPdD7+ELvkHuSss
         QAAGvD7XzdMg70pMGSu6tDPD2DytKh0nwDFt2KJBXPZCfbwb+5hftVVONhKqb0CsFQw2
         p6JFPRbHyRag7W0nbLwamPp5/uVlfrjUd9cyV9gm1d6Ot+2nv588NACf3dN97c72FHDB
         vhopIlBJVNMDBIE6O8n+oP7U806oJaWTyOJ3kjRmitj+0jv5MJvaYYdDZaeABh0l7k7+
         SngawUxRnGwjnLLHi7KOoXhSaVErLxQI4e08WBBAOP29ZXla8NZUJOFno0ukeEucWYV9
         pB3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Lotu2nRSiA+pLNneRASu1Xn8Cj0IwNhfcLKOH7AhK6w=;
        b=mQ5Fc5QqsRvbhcayav4aecTFfI7jbcCmM+uC72ARJPlKr1sfApoHyhVod6yp8wC9oo
         VFCcELlwiLyuH0bmgehnwPkVxoGMDudFroITUsuDTdv68wIhrtHwdYMSLpjNkre9ZGjL
         HGf0sduB9/bZH5LV2qLTz1h4zVAxCbihGnEc/5nubmA69StgLXYWnGeLF0GUmvKTNemn
         KRfsBThqjxnYTZAu79r3pEF+97tol3np0bK6f+wvSGUEoQM8dbPlyhQf6b1eWFHFUklW
         /YCOhAYXseFouu/XiJwiih0EFMV8jXK7H9/Yrdv861Kz6MDJX4GJ6ChiZfV1Mp9xLKAJ
         J23w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jcmd5lbc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z191-v6si397492yba.616.2018.02.23.05.35.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 05:35:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jcmd5lbc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44608 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epDVN-0004vg-CU
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 08:35:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38708)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epDVB-0004tq-Ec
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 08:35:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epDVA-0007B3-LR
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 08:35:05 -0500
Received: from mail-pl0-x234.google.com ([2607:f8b0:400e:c01::234]:39633)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epDVA-00079Y-Co
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 08:35:04 -0500
Received: by mail-pl0-x234.google.com with SMTP id s13so4904210plq.6
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 05:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Lotu2nRSiA+pLNneRASu1Xn8Cj0IwNhfcLKOH7AhK6w=;
	b=jcmd5lbcDYClAwgUvARGccXYTByuifLOKQBrd/exH+zrkycmdG2crND/B6DlEKsdHi
	PQXk8NNQvC2FadO/f24Log/OJN8/N2oZAnnkEevqyxX2pjCQZY6dTx0xfpnPq48003/S
	yTN7eGN2otFGL7YV+UvWoIX9g+4qRXbx0W6xM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Lotu2nRSiA+pLNneRASu1Xn8Cj0IwNhfcLKOH7AhK6w=;
	b=P68s+ubi84KuZKLg1g2+J2ZwL0bSb4zWFH1J80ZtRTfwJ8epiTCGSnQOeiG6GJ9AVr
	E2TR+Z290J31uDdA33PmDLI0X5htUSMqOqprRUzm+8NyDF2KyV5+AJLgsSRVY7cYrdiw
	40/FGdZ0l/ou0FLvsHqPQRv9Z8Osww9Kh/asYe9okDLDH5o4vNEPFC8j73y+OCC4x7br
	onB1m+sDcHjeSrm+rJzBB12+hsbTXZX+gWpZ4H2Qcu2toZmrx1FZJEYmVI+tNgKGe/qx
	+xJq8jAluIcTmtsF72N42LJI1gr8NxNLfTswISMWtUlQXNUbYBxH11Ppwpc2zDHfPgVH
	2bxQ==
X-Gm-Message-State: APf1xPAxhC+CxpdmSbgP4pq5lVOqy6RwumrvBlts9rwnozgT6o1+h55P
	xgVoIiHTnAyxt7PW6xNaYFkxpc357/ZR4nnjuYvZRw==
X-Received: by 2002:a17:902:bc41:: with SMTP id
	t1-v6mr1791460plz.436.1519392903414; 
	Fri, 23 Feb 2018 05:35:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 05:34:42 -0800 (PST)
In-Reply-To: <20180217182323.25885-21-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 13:34:42 +0000
Message-ID: <CAFEAcA9nmk2Ca4nVeK+N2hy6ke6_E8LieAdJFrd-ZvwZsiNphA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::234
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 20/67] target/arm: Implement
 SVE Compute Vector Address Group
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
X-TUID: Vp18kdrF09y8

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  5 +++++
>  target/arm/sve_helper.c    | 40 ++++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 33 +++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      | 12 ++++++++++++
>  4 files changed, 90 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
