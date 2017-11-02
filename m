Received: by 10.223.161.27 with SMTP id o27csp2209613wro;
        Thu, 2 Nov 2017 08:05:36 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+Rg4lPwPFxmg0F/8FnU8jd9bdPWj/okGkmRofLxxp+gniGLk1APULPVRaqwGK4XDZj3FfJA
X-Received: by 10.13.252.66 with SMTP id m63mr2202805ywf.293.1509635136662;
        Thu, 02 Nov 2017 08:05:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509635136; cv=none;
        d=google.com; s=arc-20160816;
        b=fjnFXFnyC/b9AIB+K3vcsw1LwHJ03oBAzCz3wHeaRx+fq0PoferEmBKy8WbnPWzG/6
         zh31qz/uUx2e21YEDZgZDOGtwJ44JBaZlrJtpTh0gXgURiWsU2IXeRF0m9KyTgV06dwi
         MFvQPAlLlDj5QBD0XicUa58YepXM8xWK8h0kxATw0c8NEWImhhNNZqVAqJClDQAGFRUu
         Gh5N5fhhUj4MnKhGisN1NZL0fF2HSQYuzUw9h691Dw+YD0S1P7KQHDnbzlrYbODpN7O/
         ML2GGqAmNOKKO2hZy1D360YCVjOiSZSYlo+e1jnXQ+Onrvs9y7Fb6PWbScvZmSjbdLx0
         GU2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=8VzUruXCsJt/GN42d9QulQNFgZoWGMaokpyoSLnxIr8=;
        b=abVmScuzydcU2wtdd5zRmoAAxV+2mwbDoSVHUjBcwOyUea6fJZccfahnYZQlCy1o/R
         v17QrCnGy7SX1oqvNl1bXuqHHkzWilcA8A+DLxVtfvM4NetwBji+n4C8aGblrkKA+15E
         898CjWFkbyNCcMhi4l4K64RUp+Rl1tnY3c8kMeSy7Kkat4DwVgkhLcSojD1shLxeaMug
         MhKc7pe6h2se8cyEeiUHhAcncaU8v58x4ot/DdgLjYLe+Ox+wU7aAcHrGwuysSDjzd+Z
         aPgaONdt1DPE1Dn/vQkua5hym15dF5Vm8gOKlRPxPrGzbjJWqn9OBttgfMzZ+oWOo5Xe
         2h1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VHHZ+DlF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f4si830335ybk.626.2017.11.02.08.05.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Nov 2017 08:05:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VHHZ+DlF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60674 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eAH3o-0004Pg-55
	for alex.bennee@linaro.org; Thu, 02 Nov 2017 11:05:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eAH3Z-0004Nd-Uk
	for qemu-arm@nongnu.org; Thu, 02 Nov 2017 11:05:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eAH3W-0002oy-31
	for qemu-arm@nongnu.org; Thu, 02 Nov 2017 11:05:21 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:50363)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eAH3V-0002mm-T7
	for qemu-arm@nongnu.org; Thu, 02 Nov 2017 11:05:18 -0400
Received: by mail-wm0-x244.google.com with SMTP id s66so11684942wmf.5
	for <qemu-arm@nongnu.org>; Thu, 02 Nov 2017 08:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8VzUruXCsJt/GN42d9QulQNFgZoWGMaokpyoSLnxIr8=;
	b=VHHZ+DlFPueUpjB4R8ujrrHGXjeQudsvlCIxM2ahscOt0PkNghbmI1l1Z4cOyjbJys
	g2DVF293BeTr1MT1uOv86lFc+Xkz8TtBX/4ZrErK2FR1tVznrBSEUPdm1vUtJYWSkgGE
	4bSHDDwA9ajwXRko00vW9lpd5b4zDK6VTr0Mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8VzUruXCsJt/GN42d9QulQNFgZoWGMaokpyoSLnxIr8=;
	b=slbjq+EZcHkwvfWa1mPGA2r7/j/rcUs2+3S/4TsyP7q8fWhGfa45C7XtM0z6ahwiFu
	xPVPkwnFvVcMlpOycMvd7i3FwvXRu8ptWB/tJ1NIJWrdlpBzlDB8Hz4kPCmo1osfkBpJ
	J6K7M1O3GdztWw/cBRwrDDVbmIZT26cN0J/SnhPwb+O5RbsqWFskholcyaObyOiKuaxG
	K0B7hs6SVVlFNDbcjvpwn5n8iYKBvRD23WOY82/x+CmiqMPldUhUXYL3g1MhWlYr9Gv2
	au4JHci3O2Jkvmyi56UJeiDM4WXovt8QACn0iTbOKayIqF+EtX9V5eXc9Y3bizS4NS24
	lYzQ==
X-Gm-Message-State: AMCzsaXQi+fHeBRbaA1JTojmRMgSR+svjh8RKuVxLGs37pbw22Q7clcA
	QBkjAGSqn3rzjAa0hGIKTuApGy9bW9byd/b8lHPHFw==
X-Received: by 10.28.14.195 with SMTP id 186mr1928172wmo.56.1509635116593;
	Thu, 02 Nov 2017 08:05:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Thu, 2 Nov 2017 08:04:55 -0700 (PDT)
In-Reply-To: <20171031223830.4608-1-Andrew.Baumann@microsoft.com>
References: <20171031223830.4608-1-Andrew.Baumann@microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Nov 2017 15:04:55 +0000
Message-ID: <CAFEAcA9rbXTwts2bfWmbT8sL91zCgL6u6D8xxdWgAh+06eef6Q@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-arm] [PATCH v4] arm: implement cache/shareability
 attribute bits for PAR registers
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
X-TUID: 5mJARWn6GsOV

On 31 October 2017 at 22:38, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> On a successful address translation instruction, PAR is supposed to
> contain cacheability and shareability attributes determined by the
> translation. We previously returned 0 for these bits (in line with the
> general strategy of ignoring caches and memory attributes), but some
> guest OSes may depend on them.
>
> This patch collects the attribute bits in the page-table walk, and
> updates PAR with the correct attributes for all LPAE translations.
> Short descriptor formats still return 0 for these bits, as in the
> prior implementation.
>
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
> v2:
>  * return attrs via out parameter from get_phys_addr, rather than MemTxAttrs
>  * move MAIR lookup/index inline, since it turned out to be simple
>  * implement attributes for stage 2 translations
>  * combine attributes from stages 1 and 2 when required
>
> v3:
>  * implement S2 allocation hints and check for cache-disabled
>  * fix stage 2 shareability bits
>  * fix combined allocation hints (always use stage 1 hints)
>  * remove LOG_UNIMP message
>
> v4:
>  * fix hihint shift buglet in convert_stage2_attrs
>  * remove TODO comment (what was there is complete)
>  * mention relevant pseudocode procedures in comments
>



Applied to target-arm.next, thanks.

-- PMM
