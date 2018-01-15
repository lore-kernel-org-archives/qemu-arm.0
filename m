Received: by 10.28.173.206 with SMTP id w197csp2998485wme;
        Mon, 15 Jan 2018 09:53:56 -0800 (PST)
X-Google-Smtp-Source: ACJfBotAhOb/nCfea12kV5oSBnnajg989BqyvqcZjKN3EWsP05NXNtRSKmYd4b+04KPdyBjRKtDE
X-Received: by 10.13.237.69 with SMTP id w66mr16107500ywe.313.1516038836154;
        Mon, 15 Jan 2018 09:53:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516038836; cv=none;
        d=google.com; s=arc-20160816;
        b=iSbysNyE6G2J8jD5B12DxcUiFPha0Q/Y7n32NOq8fDKd47+DFJCycfs3J2l78KG2gZ
         QIKgRCvz5v1la0PFPXpWyfZo9mfAT2Mu92Mk1AUp4XprgIt3zLYkBVJFcWl7RNKpMkyg
         FRuWN+X4G1LAeohkEYULNkze2zvBoab1/bpdgoKoH/Xyvdsu5oRNalvhokKy59W7Jxif
         x5ONj1594BC1JM2eSvPa6+8gYD+48pPLjo1cuqHvVYzdsEWegzEEn21bdQs3xlL51IoV
         hNmGjqv7+mNvKAmD0nHJIIu2HQn65w9kzyHw0TCrWp5b3ukYFJSJtVXeqjgh6VcJcXil
         EAtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=95Mh9XumhtiTnlXw1xmK8WoHnYaJkEgIxviOSazQo5M=;
        b=IYSNd4ZH5JMESS35j3ne3g6t4s3HCmQoyo+Gj7SECQgwPdfjfkDv/rauBTodw+jBR2
         behgaoGuMVSM4QFTBh/rqMchZnLlXIfXKQDpropaV+aKtHrZ32Qnymq4Z9bxdw68Y7t9
         rm1wNdQ4V/WuBZ9ORT6BJhsJZCaMh1J+H6UIGg9BX+nQyVjKupzcvgJzBXrs54H3IDPh
         nqGpjzwP+cjClcW0bNtOyXrDazNZFXmOqjSzbaylDbvJokNahp7LmseXFKShEJHjX3FK
         Mt4XpPRK9mCLZF26vIpnn8CDNXUhvgvDysrXMTrBKVt2LhWgsyWHID5NMoqE5M2THdJQ
         oJkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X835o5LQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i21si36577ybg.594.2018.01.15.09.53.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 09:53:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X835o5LQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51179 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eb8xH-00074y-Kp
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 12:53:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eb8x7-00073r-Oe
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 12:53:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eb8x7-00058g-4O
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 12:53:45 -0500
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:35783)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eb8x6-00058M-VV
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 12:53:45 -0500
Received: by mail-ot0-x244.google.com with SMTP id 53so11333440otj.2
	for <qemu-arm@nongnu.org>; Mon, 15 Jan 2018 09:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=95Mh9XumhtiTnlXw1xmK8WoHnYaJkEgIxviOSazQo5M=;
	b=X835o5LQcFHveUADDbS2l9qWXLbkGARfFPg3MmTH6GjV23n8oA606aqKRG0i5bKGzr
	uW7iAW0lavlFtVPDXMuRBJ2+qswCy8zHH7AQWl5Zz7VQCIGySy2Kezi26NmsVVSv/lLa
	NB7YJLIw4MYH+C8ATjXoFWnd3zJJAkzyDzfZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=95Mh9XumhtiTnlXw1xmK8WoHnYaJkEgIxviOSazQo5M=;
	b=tRHXIoO2l9zi/ZaOXab3G1NeE6QWxPFKVlfoIe3KkBpluyhdt4OXKEkE1xSInLncKy
	9Slck9OM0Ycv8ly0xtIjCkYLVXdj9LlVAV5YrjKaMlscFNMo7qDxbaPyiK6F8KmZgtBf
	YkUtWlG41a1s5mQmb2IS1WeVtRA4e8m3AV9UsEGuEGEEPhdLA2zkG73dMD83GgERAmO3
	EEdEMnuTFsW5azcM6wSIIEifzr4FT9oShVfQK1cuExtuWS+pul1SDpTvPB5AmkvNScLL
	OLmZaOWSIYa75ZGgCILe7WLMM1odN7sYstVZAtsH03+24jH+W2+vCQEx3z179v1eIOXA
	GFlw==
X-Gm-Message-State: AKwxytfwXqkbQtq4bfN978JFbwjxSFPct6ucj/oPMDgt+FJ0zI5u7oP3
	4DlKkrBX1SCe/FVfjSIAw5pIeljXmlD51e//Y2Ob/Q==
X-Received: by 10.157.52.215 with SMTP id t23mr12512435otd.54.1516038824156;
	Mon, 15 Jan 2018 09:53:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Mon, 15 Jan 2018 09:53:23 -0800 (PST)
In-Reply-To: <20171218172425.18200-8-richard.henderson@linaro.org>
References: <20171218172425.18200-1-richard.henderson@linaro.org>
	<20171218172425.18200-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2018 17:53:23 +0000
Message-ID: <CAFEAcA-NAGcEba2ik__xirZxrtbNw4wsiWDtiqsLfLdG4jyKpw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH v2 07/11] target/arm: Add ARM_FEATURE_V8_FCMA
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
X-TUID: aNlodKLHOeBd

On 18 December 2017 at 17:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Enable it for the "any" CPU used by *-linux-user.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h     | 1 +
>  linux-user/elfload.c | 1 +
>  target/arm/cpu.c     | 1 +
>  target/arm/cpu64.c   | 1 +
>  4 files changed, 4 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index e047756b80..7a705a09a1 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1353,6 +1353,7 @@ enum arm_features {
>      ARM_FEATURE_JAZELLE, /* has (trivial) Jazelle implementation */
>      ARM_FEATURE_V8_1_SIMD, /* has ARMv8.1-SIMD */
>      ARM_FEATURE_V8_FP16, /* implements v8.2 half-precision float */
> +    ARM_FEATURE_V8_FCMA, /* has complex number part of v8.3 extensions. =
 */

This is a bit inconsistent. If we're going with the architectural
feature names this is "ARMv8.3-CompNum", so ARM_FEATURE_V8_3_COMPNUM.
If we're going with the ID_AA64ISARn_EL1 field names then
ARM_FEATURE_V8_1_SIMD should be ARM_FEATURE_V8_RDM...

>  };

thanks
-- PMM
