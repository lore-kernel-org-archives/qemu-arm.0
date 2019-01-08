Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4878125wrt;
        Tue, 8 Jan 2019 10:16:18 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5sGuoPu9XJeQvNKU5NzDzxf6aQwIyY0bC0fJMG0KfareB7VxAya3iFMw9Xw0hjURW8J10u
X-Received: by 2002:a1c:d14d:: with SMTP id i74mr2448715wmg.100.1546971378863;
        Tue, 08 Jan 2019 10:16:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546971378; cv=none;
        d=google.com; s=arc-20160816;
        b=uWUUoL3vQ6rqQqPQ08o2zG9ThqkPhL/YDUstSSOh7G7B9wf5yI6czXpGho6comRewg
         9kbbgEd9c38AleNz2veOTyrE9kejzZSBCwo8gbyyU4b82p4Nk2fW0Asko9o2XioT+Xm3
         7cbVBrbwRTAQ1yjD/NAjTTNcUFRLlb5ef3Dm7mReaJBRxUzH0KPtfMjzcC7QuT21ayxs
         KM8LP4vU0GJifS1qa+GAzeLj2HrPUkl7CTPlpIrkY4FfliLa317TBecwib+YjjbLAjzM
         0ryHS4ybjxVAd9GGRYqJedAW6amxzbA4KkG1euGGfNIkxq3Tx0S3H69B/eMQabLxf/as
         7kvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9tuVYnXNGsWokif1kN37F8vTQUJVExBuKqoWR6+pay0=;
        b=LaenVdaE9c6OBlZy0uKxB5biOQkjXiV5CIgDs/NmEKAQLyxwDl0Ka+a1YOQfMragye
         QCRMFRSuYohsW4+XlxVQ0aVtr7xl3oXBydDgYEFWzVvSs26moXh35+YnVskca+HHKy2K
         9R83b+88C0nNxrlPhfFMhkwSnB0UKD1f5J5B/M1MUbhgXvSDjCYoMcmKUJQTsorf8gAr
         01WXhaqd0Smp42unp7q/2jCy4XNHhxVa6JiE1dEdhu6nnrwNDn0ufZo5/Xu5ZQA0oZe/
         CYW5Auq2wUT1lu41+SVK6VH+svt0SlMLToI8lk3EhNWzObVDMCjfITP0G3kY10mDTbt7
         7IxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=f97vT6HY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b13si37212984wrw.102.2019.01.08.10.16.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Jan 2019 10:16:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=f97vT6HY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:39298 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggvvF-00030Y-09
	for alex.bennee@linaro.org; Tue, 08 Jan 2019 13:16:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43616)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ggvut-0002vT-Js
	for qemu-arm@nongnu.org; Tue, 08 Jan 2019 13:15:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ggvun-0008N6-Kq
	for qemu-arm@nongnu.org; Tue, 08 Jan 2019 13:15:55 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:43020)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ggvun-0007rZ-8S
	for qemu-arm@nongnu.org; Tue, 08 Jan 2019 13:15:49 -0500
Received: by mail-oi1-x242.google.com with SMTP id u18so4088241oie.10
	for <qemu-arm@nongnu.org>; Tue, 08 Jan 2019 10:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9tuVYnXNGsWokif1kN37F8vTQUJVExBuKqoWR6+pay0=;
	b=f97vT6HY4BLpESB69+yNBQZ+zj31VoaAHUwZQi7kRVj2CZfAcVnqCHuqd6C1TadVHA
	pGOsPN5Vt6OPBjJh+1MJdZ0T0a6Xt3hFtQGixxnNvsOoHmXALQ2w0inuj++K3alSmOJX
	VoqjOBWe8TYy/uflrTOBhnXB9sNBiE/Ik6Qb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9tuVYnXNGsWokif1kN37F8vTQUJVExBuKqoWR6+pay0=;
	b=nGS14Te5JDYCCz+kgRcKjiwR9vUS+mudVYPl2xEPyduqBffFLP/vMyCfOounlKFrLD
	MuouDwmTnZJdiIHXX01etdMfhHRIFlvTwpypD/XYsWEV0oSgBwzp56kdCb6lniPwIv1g
	e+Ex2V2U/TzUZwxEB9t9GInBwGtGEG5yRMdkCeYpem3fv0DWiJvVwBW2c6anknA9zQ4R
	zm810+blYVXTErl2yWSN0BPIOeRIYdx1TWBAfNL3+qPvzDlPznzQgJBEukuor32Kv6nz
	/RCzgyEewyshhSKJ7KXfGp0Vdn9gbUvwIwjHMo+0JfN0tT+oMHbO6pjiAl77QO2waq48
	eL1Q==
X-Gm-Message-State: AJcUukdOhqIlShFbDJCzCSvfLWQr+bSkR6aCcomp0tAyWGzHoMWh8vl1
	snBKuM7bpH4EtAbC6qbRKSuH0bQCoqOBc9CrmbtnZg==
X-Received: by 2002:aca:2dc9:: with SMTP id t192mr1868805oit.325.1546971336229;
	Tue, 08 Jan 2019 10:15:36 -0800 (PST)
MIME-Version: 1.0
References: <20190106225035.5671-1-richard.henderson@linaro.org>
	<20190106225035.5671-3-richard.henderson@linaro.org>
In-Reply-To: <20190106225035.5671-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jan 2019 18:15:25 +0000
Message-ID: <CAFEAcA-E1xW7BnD-zA2XAJ2N4925aOsmBjxf0pEmaWeRizadTg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH 2/3] target/arm: Use vector minmax expanders
 for aarch64
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
X-TUID: Gzyw5yOEA0T2

On Sun, 6 Jan 2019 at 22:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 35 ++++++++++++++---------------------
>  1 file changed, 14 insertions(+), 21 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
