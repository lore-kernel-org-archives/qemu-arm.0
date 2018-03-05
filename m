Received: by 10.28.91.67 with SMTP id p64csp2682578wmb;
        Mon, 5 Mar 2018 07:43:07 -0800 (PST)
X-Google-Smtp-Source: AG47ELvOI+rME74NZVqDcBlZdvExa6wZ82ukR2VkoJkK0OTY18JIMSMNVFzPkmQWtPZxbVfsU3Gs
X-Received: by 10.129.134.197 with SMTP id w188mr9693313ywf.293.1520264587087;
        Mon, 05 Mar 2018 07:43:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520264587; cv=none;
        d=google.com; s=arc-20160816;
        b=JDLLlVrw8I88z40el3Kb5gXnHgL7xZewxvMZvYMPCRcxEieNEua0Pflq6MTTbioFpt
         HZztrVhl4/wPYdJgExKncYsFUdAH4I1HaNq1wuvluV5rt6u593uK7dSLRmlRpVb21ugc
         q7j8HluPibMryTC3POAdi9lfQnPF/qLLpq5PFqmLB8RTZu2ePgXcfIcaRRaKDteY9NOE
         x3Q6W/esebMa5hpfQkhAnK+X6vv8++z3GflJQAETrBbNZg4O8SRAl2esBCq3GEp68bO3
         DC3Tcs6R9qAaMHcT/Jr5J/apjvrl9DTZO8qiPgfsjMwqfjccYIYlPT33XwD7wwmRetYC
         g21Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Xs88rHuJY0SFm256NyAz4k/2s0a+FF+ZNme1Ih05hIc=;
        b=OKKqOL78VgifC4erGYr0m4Vkx1h6lq+Y/hml/7oQeu6DnFX+NBJfJ8dXNjy/FuR1N9
         AhrwkoYGVXmAv5Gk76zlDg+66igYTJWBvqKMwVN76Js+1yvt5WiEjPGfIHg/0Zx40g6x
         tjnJZiK5NPlJu6SkOpzOZxb5RIqnPLYoD/z942aszoQJGPdv0vtgD15AE/FfZpdTnzTZ
         tdw04cOgnBo+NeIncod1kdhQkCYGR2ez/P7JVYYcXkdpaBTM5TkflLSO+iIHMZY3z2da
         IEHKafHkK1YChSc584l1zmP5nfJilhaDyYn79O4jBeUdOkPzzZp/QaSII24WdqGjerEE
         SFqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a37Xh6PJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r194-v6si2187089ybc.183.2018.03.05.07.43.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Mar 2018 07:43:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a37Xh6PJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50039 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1essGY-000052-HA
	for alex.bennee@linaro.org; Mon, 05 Mar 2018 10:43:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44170)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1essGN-0008W5-Nl
	for qemu-arm@nongnu.org; Mon, 05 Mar 2018 10:42:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1essGN-0007BU-0M
	for qemu-arm@nongnu.org; Mon, 05 Mar 2018 10:42:55 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:38200)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1essGM-0007BB-PN
	for qemu-arm@nongnu.org; Mon, 05 Mar 2018 10:42:54 -0500
Received: by mail-oi0-x241.google.com with SMTP id h23so2391656oib.5
	for <qemu-arm@nongnu.org>; Mon, 05 Mar 2018 07:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Xs88rHuJY0SFm256NyAz4k/2s0a+FF+ZNme1Ih05hIc=;
	b=a37Xh6PJTM6TeXVGv4Xfyz4SBKhUJ+YgqNarGtyBigWFwacLmCUU3cgrmNZqClsWlc
	o/FtGKND3Nkll1vkD7s+RfVzVB/l3Iq32PMMXLLKrZFeH2nXMFR0OE0HzD5L49Fwa60T
	lhfwi8inJHaBL856dpk9yljPfg0hyMC2ZNCS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Xs88rHuJY0SFm256NyAz4k/2s0a+FF+ZNme1Ih05hIc=;
	b=cb19uz7VxXDLNN3x/IQQFhwoUs73nYAsoVonhTfobzogfdiMSepwyfEknrqqJV99IU
	BMSrOaYkPnRxj00tnkpN8azHODS7l+5RiJnzXPXBfv3muDNbqhcLsUcvy3DXv0sBwABw
	ZIzGLcCCZRWh16A4vWxExucNYQ1GDiDrI7iqx2zw7k1zWfm8y91qqDj+UqOL5gJq5CKw
	7yx7AnIkLqyWZK0t8S3dlC4nk9Qu32VNng74veP4qzmKJ+f53jjBAMgKHh+KhEKbePwN
	pGr72ZC2dLxinlF+DVRhcjsrQKacv+ZE+qvoC1XqEBDomfyn98AJ7WKNkP7TI7IUHy6z
	82uw==
X-Gm-Message-State: APf1xPA2HkL/7330aB+k9suqC0cFcAYq3QIaxRYGwzOtCQlVLok+z9Q/
	9cVYTU6HjWB/3Yuyiy+kRaYtVdyBEEWCiUb1yEol1w==
X-Received: by 10.202.90.138 with SMTP id o132mr9047356oib.11.1520264573958;
	Mon, 05 Mar 2018 07:42:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Mon, 5 Mar 2018 07:42:33 -0800 (PST)
In-Reply-To: <20180303143823.27055-1-richard.henderson@linaro.org>
References: <20180303143823.27055-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Mar 2018 15:42:33 +0000
Message-ID: <CAFEAcA_8ApwsKgMVSgUfhXZychQGWxRUZfj1f__cppGK5un8fA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 0/5] target/arm linux-user
 changes for sve
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
X-TUID: 7xdn9sTywEec

On 3 March 2018 at 14:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Changes since v3:
>   * Review comments applied.
>   * Frame allocation generalized in patch 5; hopefully this
>     eliminates some of the confusion seen during review.
>
> Changes since v2:
>   * 5 patches merged,
>   * The PR_SVE_SET/GET_VL patch is more specifically user-only.
>   * Split the signal frame patch into 4 parts.
>



Applied to target-arm.next, thanks.

-- PMM
