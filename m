Received: by 10.25.85.209 with SMTP id j200csp1161832lfb;
        Mon, 13 Jun 2016 05:04:48 -0700 (PDT)
X-Received: by 10.200.50.237 with SMTP id a42mr14073878qtb.80.1465819488755;
        Mon, 13 Jun 2016 05:04:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s10si15001910qgs.44.2016.06.13.05.04.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 05:04:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55896 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCQbo-0005Up-4v
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 08:04:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCQaJ-0004Mw-Fu
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 08:03:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCQaE-00011s-71
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 08:03:14 -0400
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:36482)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCQaE-00011h-32
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 08:03:10 -0400
Received: by mail-vk0-x230.google.com with SMTP id u64so64093256vkf.3
	for <qemu-arm@nongnu.org>; Mon, 13 Jun 2016 05:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1dCsyIs9yrNYXMsstBTAgzPmg/iMZEz824ZQeMh2FpI=;
	b=ZIm/Jof5pcp+yDsH0FfHrDeYXUV9jDzvFq/9VUjxxeqngGk/UBqvsP8DJh60bhM09l
	SR0zF47atKSHs00jX6SlT7yuHv1jLwZdWDqVveouhodLoc0ei9r87CwS9UZos6cC7+dZ
	xO27nawtyyiusSp14PnddXPLytnePHsqqBj/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1dCsyIs9yrNYXMsstBTAgzPmg/iMZEz824ZQeMh2FpI=;
	b=Ffo5uN7qqNtz1a/RiFoeXn1qQbns8LA9hhnXko7ubB+PpyAUJWZcEsxUNBBmVIls1B
	Ss79mP2el7NyrXmM3+qpuCIOzOhbjtozOLnEG9LnIGpJJDSq7Ub4759jGl5Rm7Ris5Us
	GZHMCpNIijYpglD+1JSHO7OOnGoYLYG0CF+hi49N4KFaGfulbTKBmhv500WIrC+RGQqY
	Q2sPitsvO9WBerxv6FByOKI+zTFLIY7N+O5QByTQV3k+LA7il++DSwh/sSZVVZVTQazF
	xlaDrg7cExH+HEuHHlBzssM3IPXBmRDEeC4hb488D5o1f1El/W/9dBVY0yRiHphLPRjq
	S9Uw==
X-Gm-Message-State: ALyK8tJDrTOtzd8XMmRAKj2j7bWlaMRMvS7mdq31D9zFLz469Npv53gI+VZOXcN5s2nw5gCO9ALfRmw7JSBLq4wM
X-Received: by 10.176.0.146 with SMTP id 18mr5929589uaj.17.1465819389580; Mon,
	13 Jun 2016 05:03:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Mon, 13 Jun 2016 05:02:50 -0700 (PDT)
In-Reply-To: <575E9E28.3070208@huawei.com>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
	<1464274540-19693-22-git-send-email-peter.maydell@linaro.org>
	<575E9E28.3070208@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jun 2016 13:02:50 +0100
Message-ID: <CAFEAcA-Pqq3b0gXa9CUbxZrgF3gobtmP0SptOj_HMNpNJ8JMJQ@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 21/22] NOT-FOR-UPSTREAM:
 kernel: Add definitions for GICv3 attributes
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
Cc: Patch Tracking <patches@linaro.org>,
	Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TiZbnmunupAI

On 13 June 2016 at 12:51, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>
>
> On 2016/5/26 22:55, Peter Maydell wrote:
>> From: Pavel Fedin <p.fedin@samsung.com>
>>
>> This temporary patch adds kernel API definitions. Use proper header update
>> procedure after these features are released.
>>
>> FIXME: not-for-upstream
>
> Peter, What's your plan for this patch and next one? GICv3 emulation
> doesn't depend on them, right? If so, you can consider put them into
> another series. So this series could not be blocked by them.

Yes, I provide them in this series as a sort of FYI/RFC, but
won't put them into master as part of this series.

thanks
-- PMM
