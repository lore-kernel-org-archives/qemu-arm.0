Received: by 10.25.15.165 with SMTP id 37csp925555lfp;
        Tue, 20 Jun 2017 08:48:16 -0700 (PDT)
X-Received: by 10.159.58.74 with SMTP id r10mr19393675uag.124.1497973696421;
        Tue, 20 Jun 2017 08:48:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497973696; cv=none;
        d=google.com; s=arc-20160816;
        b=ToQC33dqAzLRJuu8Dtizg/cwscbY2f0Knnre0TEpZ5tUl2Et32hJcSStfjDhMBVc7w
         6XnFRNC7y/WDjf7t6ZEaIluz4p5OIWfDZdjAETUDxTNjiwSvdcWMjbxVMrcazkssUjej
         3ZCzSpuGk9iACGWJ8jNa5LKCWB3qiygABPdPnXgskIPnXeDqaaV8UKcqzphTVdpsxbeP
         Iqe+YkEzRyudua1PnsLReNHtr/hRLg9xEJymORzp5u9Ila4+SCSMrjPHu9DZSuBggizQ
         1+1MU1jQLMYAPKHOLQFVUy4HZq2ZCW/FlJyljl/zQLPb58xsq+r4+UuvhMImZn6vPT8A
         LqtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=EGcuOG6EOBfHNOi18KQUEaBNfw3tR7tNMhZ4HOXxRxo=;
        b=EOwzHlyAlvuaLZsU0mu/3W+EQhBsw8yQkmt+StrHWK0WebLtXD5LQdmXqA0cHLYVPl
         Nd0es6Hzd+LrRyBto8ns+hvnmXOAyRwhowsnvmCrGjyJjc11lGKBI+VeOFcYrqoUpnVu
         7d0qEwGQA0ncE5bCDIu/fENJ22mkUw7T6FHaW46EWqcE7fIYg5MHi7e4VCFbO82mCxp5
         gAyNpp6NzHPzhoKZNKhifEY3irfpryGK9uSaCzd19bp+w/MUGQli2Qenf0Q2rgUIaouq
         VXkTvlkJ7BN9i35wqpraEYpNEI2yWr8TB86kpnn2L1n3r5CMY8YllVTpgTsKJWufdO/h
         ZPHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=H0CdVuWh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g194si6282205vkd.229.2017.06.20.08.48.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Jun 2017 08:48:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=H0CdVuWh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49404 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dNLO3-0003Zc-Su
	for alex.bennee@linaro.org; Tue, 20 Jun 2017 11:48:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dNLNz-0003Xm-EI
	for qemu-arm@nongnu.org; Tue, 20 Jun 2017 11:48:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dNLNy-0002jS-Ke
	for qemu-arm@nongnu.org; Tue, 20 Jun 2017 11:48:11 -0400
Received: from mail-wr0-x22b.google.com ([2a00:1450:400c:c0c::22b]:33715)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dNLNy-0002iW-Ey
	for qemu-arm@nongnu.org; Tue, 20 Jun 2017 11:48:10 -0400
Received: by mail-wr0-x22b.google.com with SMTP id r103so96395720wrb.0
	for <qemu-arm@nongnu.org>; Tue, 20 Jun 2017 08:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EGcuOG6EOBfHNOi18KQUEaBNfw3tR7tNMhZ4HOXxRxo=;
	b=H0CdVuWhgYOLZHT/V/E0/JTnFurbym97UJnzuFpqQt8L3gy6Z2eHfPLb57nuED69kV
	tn2mRbnuoxzoRl0n+HMOwzIWNTHeT6y3uK4Tsb8c0wDlszQ9CbyNjYdskXJVFAs9W7DH
	yoqJTRKS18U8LVPUtICI4es0zVNf+BjnYJzwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EGcuOG6EOBfHNOi18KQUEaBNfw3tR7tNMhZ4HOXxRxo=;
	b=DpWJuKojxyTDomUQ1agZCCM29ha28NBE2hUyXQXTmKndqJ2o5tCjGoOwSVwoE2oq2o
	9ZxG+VgH4UbP0GIZ42/qH7wwoTzGzk+KuM2pLUay0lB8ucSqG0KyTUS9FBgCBqGeBoFZ
	s+FWZSTMyg/irJz4lzCxkpa8IP+InDpu6oZFgq2j3YRu78Xdyh/i0qiCi/mXOQwVGyDu
	EOriC9xSNWf/4paa6+q40+GxMJ2o74uwOyI1Nbnyld3o3tWeUq+dPLpMRvxrGI0Z/yVT
	ujz7pWPYiiRwUqfBo3vKbtkd9Z+ROpMaRA/+WG+M7GIARc78XGx/8zF4w08rsbV+ggMc
	gHXw==
X-Gm-Message-State: AKS2vOz5VitSsHQIrmnW7DN3DbT3VOcqGxujqA8hDfH6UEqXIf4DCCbM
	9jupyCG0dw5cCmw+w+tVxWvxCRg5RzPs
X-Received: by 10.223.144.69 with SMTP id h63mr19561831wrh.187.1497973689126; 
	Tue, 20 Jun 2017 08:48:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Tue, 20 Jun 2017 08:47:48 -0700 (PDT)
In-Reply-To: <20170620154453.fmcixyow3e54u7li@kozik-lap>
References: <20170425180609.11004-1-krzk@kernel.org>
	<CAFEAcA8PjjUk6QrAE6ppgyYsYAyh+0uqd=_EgH-g4K=--utdoA@mail.gmail.com>
	<20170620154453.fmcixyow3e54u7li@kozik-lap>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jun 2017 16:47:48 +0100
Message-ID: <CAFEAcA-VNkST949KirR_4v+7=1O7vgBsf3wvo_rx=zfqmJyYEA@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22b
Subject: Re: [Qemu-arm] [PATCH v3] hw/misc: Add Exynos4210 Pseudo Random
 Number Generator
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uSISWPKeGIEn

On 20 June 2017 at 16:44, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Tue, Jun 20, 2017 at 04:34:57PM +0100, Peter Maydell wrote:
>> Some of these lines are slightly overlong.
>
> Breaking lines does not make much sense, so I could just get rid of
> EXYNOS4210 prefix. It is a local define so maybe there is no need of
> prefixing it?

I just pulled the indent of the relevant lines in a bit:
https://git.linaro.org/people/peter.maydell/qemu-arm.git/commit/?h=target-arm.next&id=a61a64a322e8cc4a25f023e63b2924cca309e7f3

thanks
-- PMM
