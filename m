Received: by 10.28.173.206 with SMTP id w197csp873661wme;
        Thu, 11 Jan 2018 10:48:37 -0800 (PST)
X-Google-Smtp-Source: ACJfBovKekqF6rHPY1FLNAj+t5NN4awLXZCIzSTNjHJ6KtWFVp06fBnYrPHbjnz3dHq9GnmNtc7x
X-Received: by 10.129.76.141 with SMTP id z135mr20598329ywa.42.1515696517418;
        Thu, 11 Jan 2018 10:48:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515696517; cv=none;
        d=google.com; s=arc-20160816;
        b=IfX6VMuRKchmVpi8kWSFwjIfJejHC2Svgdaao/dNL3g4WIZO+NPkm+2gYnrD+Dowah
         Tf8upxtqeVpKfnvqhKydzyIyGR0+R1R8PEFPCeTl7g73/p8TcUQTebqXz44VjFLQI8yQ
         jbi3xdVPRQ+91QTt/N2IPmbZQwio6ctpFTngDRqbm8nMX5epSXuyQZ2nrlD30Er6ZruT
         eSKyNOzE59ErTnH1UpMNk3z35V1g3iZYLVTJTD2C0GWEp/nHVTf/YLfPxD8vBB2VrZvN
         izTFSiJkErGI+Waym3VyTy0nmTbOcOp/mKmsFSKv07pJUrrK/fG4auirB76ee8LYEAKW
         22GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=T/e58t4N0E7v/5PZ4Cygq7C+dfFdVKFJZ6A80AN2f9Y=;
        b=YF/qiMRkb4d+/rHSwY7JhP8wVVqo9LbQmxHnhlAdejc9l43aRddU8ieHVhcKVbOjZH
         RTChIv0d6VTON+GmtZdrAGmGAyH4kW+GTIatCnI+gu4LV9F7tJkhHXRiv3swvy9fr9j7
         vtknzRflDeuzRcfIIB66pRE85WzhplURnD/X8TSQjF3T9i7O7pPGmA7Ot+nSADRDcG18
         EYlTepKZkTHCgTArECDtHr1Di9SESDkAyJd6TKWsIA5hVlm7ZOMvVn/HbWmSQ88FCCE4
         Eb7Rb4GVkWP2oXTqvROYMd0yDnODFmbqdrb7jFnSNLhK5HEn0vRzyc84OdGOp1HW1XL8
         OEXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XQtQ0aEE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f4si2042648ybg.632.2018.01.11.10.48.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 10:48:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XQtQ0aEE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33922 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZhu0-0007it-Sr
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 13:48:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZhsc-0006gn-9S
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 13:47:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZhsb-0008Bm-Gv
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 13:47:10 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:44944)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eZhsb-0008BM-Bi
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 13:47:09 -0500
Received: by mail-oi0-x243.google.com with SMTP id g128so2288323oib.11
	for <qemu-arm@nongnu.org>; Thu, 11 Jan 2018 10:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=T/e58t4N0E7v/5PZ4Cygq7C+dfFdVKFJZ6A80AN2f9Y=;
	b=XQtQ0aEELroSenLDFlLx3Ws6hkbLl6iw27QJQVPtmd1FnVePEZRRipsHWmvrmDLztg
	83VXVn7GTI8e9y5A34XYtfpuwqLdgf/bqhYxrvkmKnjTsJib4/8pwcHR2oOqgXV3Tc58
	o83jgkYvxYP+mw7B+cU2ABJAF7GEmMM6njrzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=T/e58t4N0E7v/5PZ4Cygq7C+dfFdVKFJZ6A80AN2f9Y=;
	b=J7Ofk86tx1im6eZpSymt7E7a8vmMrzk9DGINWBamCr+nCtHfFp1GwYOUFpGoWcARKD
	vMB9IJkOX5PzuaSV7Y7U3J2pNvfzQG/B1OhPOyBMsumX3oyPLN9UL0XcL+P8CDOlUy2d
	TzAntXmGQvEill6rgdbqKmf+r4TO2Cyu7mB0IP0gBwCf4nnr5dota/pmZjHbX60C/GpC
	mMlp/1EESjXOf18IV8AqZKsRRLDJXOuXsxbZGpFRuZPbIpIaE4R+HpBlxTXd7Y0H/peu
	Gl924Wq0DjxEBMjW6N6rXZ0Kza1m2ZC2Q0t3YWkJz3wqtTdWpj0J6rUKTo45H/MM/Q38
	sA1A==
X-Gm-Message-State: AKwxyteZlu/HEH1Ecu8GFlEfOsxJiKEvmyO7GMWrGDzDax7MlJfwxO7t
	oYfouvEpVVD3EGBKJatRTDDxNQo/qChNWZRUUHMt8A==
X-Received: by 10.202.252.73 with SMTP id a70mr6215131oii.256.1515696428677;
	Thu, 11 Jan 2018 10:47:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Thu, 11 Jan 2018 10:46:48 -0800 (PST)
In-Reply-To: <20171218173022.18418-7-richard.henderson@linaro.org>
References: <20171218173022.18418-1-richard.henderson@linaro.org>
	<20171218173022.18418-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jan 2018 18:46:48 +0000
Message-ID: <CAFEAcA_rut+BFAi1Cppz97wajkb3zLCvvarZ=2j0tE3HxD01Lw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH 6/9] vmstate: Add VMSTATE_UINT64_SUB_ARRAY
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
X-TUID: Eouf9yBCzjjZ

On 18 December 2017 at 17:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
> At the same time, move VMSTATE_UINT32_SUB_ARRAY
> beside the other UINT32 definitions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/migration/vmstate.h | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index 88b55df5ae..8c3889433c 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -905,6 +905,9 @@ extern const VMStateInfo vmstate_info_qtailq;
>  #define VMSTATE_UINT32_ARRAY(_f, _s, _n)                              \
>      VMSTATE_UINT32_ARRAY_V(_f, _s, _n, 0)
>
> +#define VMSTATE_UINT32_SUB_ARRAY(_f, _s, _start, _num)                \
> +    VMSTATE_SUB_ARRAY(_f, _s, _start, _num, 0, vmstate_info_uint32, uint32_t)
> +
>  #define VMSTATE_UINT32_2DARRAY(_f, _s, _n1, _n2)                      \
>      VMSTATE_UINT32_2DARRAY_V(_f, _s, _n1, _n2, 0)
>
> @@ -914,6 +917,9 @@ extern const VMStateInfo vmstate_info_qtailq;
>  #define VMSTATE_UINT64_ARRAY(_f, _s, _n)                              \
>      VMSTATE_UINT64_ARRAY_V(_f, _s, _n, 0)
>
> +#define VMSTATE_UINT64_SUB_ARRAY(_f, _s, _start, _num)                \
> +    VMSTATE_SUB_ARRAY(_f, _s, _start, _num, 0, vmstate_info_uint64, uint64_t)
> +
>  #define VMSTATE_UINT64_2DARRAY(_f, _s, _n1, _n2)                      \
>      VMSTATE_UINT64_2DARRAY_V(_f, _s, _n1, _n2, 0)
>
> @@ -932,9 +938,6 @@ extern const VMStateInfo vmstate_info_qtailq;
>  #define VMSTATE_INT32_ARRAY(_f, _s, _n)                               \
>      VMSTATE_INT32_ARRAY_V(_f, _s, _n, 0)
>
> -#define VMSTATE_UINT32_SUB_ARRAY(_f, _s, _start, _num)                \
> -    VMSTATE_SUB_ARRAY(_f, _s, _start, _num, 0, vmstate_info_uint32, uint32_t)
> -
>  #define VMSTATE_INT64_ARRAY_V(_f, _s, _n, _v)                         \
>      VMSTATE_ARRAY(_f, _s, _n, _v, vmstate_info_int64, int64_t)
>
> --
> 2.14.3

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
