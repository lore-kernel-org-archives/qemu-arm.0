Received: by 10.28.71.27 with SMTP id u27csp4928524wma;
        Tue, 27 Feb 2018 07:11:47 -0800 (PST)
X-Google-Smtp-Source: AG47ELtKLZtYonVpMr5iCqeolRUTBygUJpbi1eeJJkDFfenm0Vn/JRXz8QSE6Siz3eiHR185EgCB
X-Received: by 10.129.94.68 with SMTP id s65mr1419794ywb.142.1519744307226;
        Tue, 27 Feb 2018 07:11:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519744307; cv=none;
        d=google.com; s=arc-20160816;
        b=Jk6QWzTXL9SbtlMFO9m6URc2fqC4TjUuL7TaUKKXrHzgqCxxpn7Fm5qWZB7k3kKV07
         OwvyUqMy24YuMMg3ZbqoDODERzSNt7sc6mkhyvZd5hckA/Ohv7zC27EFN9zLB6JtwQSV
         EZDTgmW+9RB8h5kxYt51byI9AbIy+dNtYQU8ipHFi9JokkPMuTikgXTbbJmhivCZa/u6
         gTf7bgslEfLG58o5hjyg3bR9sltV2yuDBFer1I+KXSZqOPM28ljYE14IskarfqedRWNp
         JkaS45Sirya2zJXqMUw8kOGX18I8fTE/8AWcNzHYfLYJSVtlmcBwAAH4/jowiLfTFOJJ
         Pa6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=RDlJrIKtku6RbKbqqzdJkfDIpg3o4sXBsObxeJxdCGE=;
        b=PXfIqlp+81f3pa/1k6zi7umDKgzsm0ZxyXKD+3uh/t6wY524H7KDCbeCrALZEnfFPL
         sgp5/XZ7VuGqN8Ah1vAYfIUv4T5BLSSmbXMqLbXLRNBFmkgCyba+UBo0iVxehN/14EGm
         JS+62/P+1W9vzdmmonwVZAN9Jt0Gw6bwAeqk9oW/UDUYYHoTgHrYuBTnkHZ1litbqo5r
         g33E6goBVk37EWBrBQ5vgCqCDBJgDl9udG74GjMprWMJEX7wywaJHy55ztBqDOakS4zf
         MMhrl5hUpF14WjsIdYkVaxsWymV91eCzhpkHkgCREJCEqi2AybqSkX0fi3razZVlVpzt
         A2pA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XtTUtbqE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h62si1947237ywd.450.2018.02.27.07.11.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 07:11:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XtTUtbqE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37905 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqguw-0006wr-J9
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 10:11:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36190)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqgug-0006uj-Cs
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 10:11:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqguf-00030u-Fn
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 10:11:30 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:45776)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqguf-0002zx-9z
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 10:11:29 -0500
Received: by mail-oi0-x243.google.com with SMTP id j79so13082515oib.12
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 07:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RDlJrIKtku6RbKbqqzdJkfDIpg3o4sXBsObxeJxdCGE=;
	b=XtTUtbqE/L6E8FL5Z/E9yupnYF0pikx3pGMneKHBjehmvTIj7X3yoTJbsGDUGqg+cP
	U+AObt7ozsfB6t7KUsbUWNeBnAavfcJG6h2qpebo/OaSMtP4mE1CWldpmZwyJKzXlgfn
	1INzObyhYhOXykfXatQHL7AYulc1CNc9a7MI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RDlJrIKtku6RbKbqqzdJkfDIpg3o4sXBsObxeJxdCGE=;
	b=Y9gxVpu6eTXxUQ3bHQ5pUeiZBsCszQMxv7q4VJRihUCEyJHYirgC++DMU6jS15FFdG
	Tvy3qe5Z27yv8XyXXsDuy98h+7lghu3i3GAoUF6IhpQCLgKFCuuURlNwB325Qo5tilE1
	cTU27y/WUyVi7xKJq2LCQv+zvD1mEKOrD2LOGmindSgRxNX/PatCdbCzRk11zxoqfZXT
	ZoBGybsrRnE/BVWpgT3TWJKgVJJ0dXYm/IgDKP/4QO4E1Y1Lgo5O0darrYRvmJe2lT7r
	AaKdNfNj/2LV/nkZ21dVsoHIV/Wwlg5RvX38suMgHkLgnWHrOl1T+jZijXHho+CxCpNW
	+r/g==
X-Gm-Message-State: APf1xPAPF1Pp7Z3KkBgu1GRnKyIOMDt4q7NzCGNmC5idp7dwnzNM8Lnu
	jL8WKS3kaYxBXDBQ69uRqucsChT7TdR/6NR5Z19DoQ==
X-Received: by 10.202.95.68 with SMTP id t65mr9610937oib.102.1519744288649;
	Tue, 27 Feb 2018 07:11:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 07:11:08 -0800 (PST)
In-Reply-To: <20180217182323.25885-59-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-59-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 15:11:08 +0000
Message-ID: <CAFEAcA8PGMrnXzdz7=DrC=qtvzognTKAp_EDVhDkkTboeKzhPQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 58/67] target/arm: Implement
 SVE floating-point arithmetic with immediate
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
X-TUID: ReClm4R4KaAO

On 17 February 2018 at 18:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 56 +++++++++++++++++++++++++++++++++++
>  target/arm/sve_helper.c    | 68 ++++++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 73 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      | 14 +++++++++
>  4 files changed, 211 insertions(+)

> +#define float16_two  make_float16(0x4000)
> +#define float32_two  make_float32(0x40000000)
> +#define float64_two  make_float64(0x4000000000000000ULL)

I think Alex's softfloat series puts these in the common
header now ?

Anyway
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
