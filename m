Received: by 10.28.173.206 with SMTP id w197csp2395081wme;
        Mon, 8 Jan 2018 04:09:54 -0800 (PST)
X-Google-Smtp-Source: ACJfBosE6ndV208SBX1AxOk991KUxXkTojRnzgbXSunx9SgsAaTk32YzXQmcCOKGVbPCjcDWBMN3
X-Received: by 10.37.244.84 with SMTP id p20mr9510506ybe.52.1515413394704;
        Mon, 08 Jan 2018 04:09:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515413394; cv=none;
        d=google.com; s=arc-20160816;
        b=snQEgeuu+vkp+l0lcCyaJH1QRzOsigvuN/NtlFz17yuSQwVsTDQ5/LaeS6ulOHlfB1
         zhBBRXCXZNXVWAIPFi3n32kWLmq5vPhY6dLSOovXC+HvCA0PcdQoumTBS5nuAuDYamUw
         pAZtHa7CnQGlCYDcNSeU2Pby9m7rjobf0HMmDZY1KCV7IvWX2orWXg930oi0SxKS5hdA
         LYUvnVdzmLyxXiXhWxErbF7LOVvH+1x8hAR+Rv01GRrK2LlPbsJXzDj0F3DKhoLnBAZ6
         eciY7TjiqRyWB8G7Ya8ul5Xk2mOgEEmPLhHMdXnkyMrwPQSBthMKOnMBpbmRgiQAbOtX
         bqmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=E9qElUQnl2fi7avQWCBAyoP2Ph9Cu8xegpd9ehzVUCQ=;
        b=BwbRuSppqOo0NyO2QEFx3Jn65bkkINvp7JBcvSnjj1Rs2IocepE3+vlGVgDCZCnKFL
         4O9SOy0/odwy5fsvTv261jKxq8jwqHsVIeHf8SElfGMInlqlTxSsXW+qhhOtQYTKy2Gc
         pNEO8j5zWMUKEqzC2bzyrDRdpTdkfHnrxjRGCK0srmUT1MTSzAIXbZEAKIU1TmRjNy7X
         wCclJG2Lqs6l67VRQlwKfvvxGibd/2aPy+A65bUpAyy58ahinB7VQfmDH4zaDCC1oynz
         YXNMrXCDRFeXnHud+5otzlyNhSyzS9eSJWYPi6u6nJ2iD3zIrFAkJLshG3lZRxGUTHe8
         2Z4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L+0lTyn3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b3si2389586ywb.764.2018.01.08.04.09.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 04:09:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L+0lTyn3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58845 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYWFW-0001my-3H
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 07:09:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39190)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYWFK-0001m3-2i
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 07:09:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYWFJ-00069j-8w
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 07:09:42 -0500
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:36054)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eYWFJ-00069B-4f
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 07:09:41 -0500
Received: by mail-ot0-x243.google.com with SMTP id w4so9023232otg.3
	for <qemu-arm@nongnu.org>; Mon, 08 Jan 2018 04:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=E9qElUQnl2fi7avQWCBAyoP2Ph9Cu8xegpd9ehzVUCQ=;
	b=L+0lTyn3ar7hlWocX6UvKqGtt+/33ymFLGCR2TUKzoveLvImm+liL4sh3U9GorpXY1
	ImXeu2WOKqFoNXKXosB09NzR8Yj919HOOjjPFzFNLIV9AOlF3OhryB9feHPRstZ+w0aq
	KtPFKjADxfKuNlUrahQBsKuNORYVBjzXCE1tI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=E9qElUQnl2fi7avQWCBAyoP2Ph9Cu8xegpd9ehzVUCQ=;
	b=SpHRfdA/LiSgiGJohENRy0mFrdIWuqGSlW+Nwg/2FBmsHoIGlSpXbV9V02ljAcgTrY
	wBjCkZwXb38QDPOBugtCGw8jH8jOtgMO3KYSojkrFLkuxhXFFJ9FxQhsNW+y4RlOfif4
	kcQCFLAIlb8ABmBL4AsVLV7b5jT0m2fhZ0+Z2wvGDiimNwfY3A81sVDEJGOHhgigYu1Q
	UPxOWE3qORTMUdHPNQ2fLhQRPwbRI3e32BbEHPNcUkbJOxrLzHzekri27dhoOf/1kYf1
	NhBHTSjLTIaXJ4NzfNUw6f99TJzvr6rcI54EFzrisxUEYuAQReLvg35NqBbTDlH32SAV
	9BPQ==
X-Gm-Message-State: AKwxytfHR+fcuS9Fv8KW/dbRvUxOzVrKISc9VQfoHacx28HgBQV/QVRm
	W4SMHm2CG1E2Fi48j1o7h8d0TtIA+OF9bWjdcqaELQ==
X-Received: by 10.157.2.175 with SMTP id 44mr5892360otl.335.1515413380561;
	Mon, 08 Jan 2018 04:09:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Mon, 8 Jan 2018 04:09:20 -0800 (PST)
In-Reply-To: <20171230225622.97409-1-michael.weiser@gmx.de>
References: <20171230225622.97409-1-michael.weiser@gmx.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jan 2018 12:09:20 +0000
Message-ID: <CAFEAcA8GgbFnbr0yNkVyrBK6TciTMEk_EZuw4_gvfZ+eEii3Qw@mail.gmail.com>
To: Michael Weiser <michael.weiser@gmx.de>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [PATCH v2] target/arm: Fix stlxp for aarch64_be
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
X-TUID: gUuRemijIoLw

On 30 December 2017 at 22:56, Michael Weiser <michael.weiser@gmx.de> wrote:
> ldxp loads two consecutive doublewords from memory regardless of CPU
> endianness. On store, stlxp currently assumes to work with a 128bit
> value and consequently switches order in big-endian mode. With this
> change it packs the doublewords in reverse order in anticipation of the
> 128bit big-endian store operation interposing them so they end up in
> memory in the right order. This makes it work for both MTTCG and !MTTCG.
> It effectively implements the ARM ARM STLXP operation pseudo-code:
>
> data = if BigEndian() then el1:el2 else el2:el1;
>
> With this change an aarch64_be Linux 4.14.4 kernel succeeds to boot up
> in system emulation mode.
>
> Signed-off-by: Michael Weiser <michael.weiser@gmx.de>

Thanks, applied to target-arm.next (with the typo rth pointed out
fixed).

-- PMM
