Received: by 10.28.71.27 with SMTP id u27csp4952976wma;
        Tue, 27 Feb 2018 07:34:43 -0800 (PST)
X-Google-Smtp-Source: AH8x2261quxkkGntD5w/R7yZ3Ik+g0QW4mH00PpRGKU+TfFBfDS9D+URSylbB9b8tfRHB5qXqqoc
X-Received: by 10.13.234.200 with SMTP id t191mr9754338ywe.97.1519745683364;
        Tue, 27 Feb 2018 07:34:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519745683; cv=none;
        d=google.com; s=arc-20160816;
        b=RC5Fh60CJBA06Lp42vuWbngWDaUM+XnymAW3okJRderdTvwDizDLcYpN08hPS9LkQL
         wsD5e5efUcTxfDQbekM/JQlkzjXkefWB6w8qg19konlXWt+7vLwWNpAiA+wuMuWv7kdi
         CGNM9U17lpcDq5XyNsGgi4RMUMNeebJIzjpqmPgidu2s4/9ouzTRHoudDaJ23lKLSVSs
         5lpYnEgmpRa5nR3/oVpB3GbB6JO5JKqnagcIyVutaDb3zcNbD6UouZJfjJv+wArpZEdf
         wC07phQrN4+xUwib3SS8G7pCDxLvwH+9hdrJHounKLdE3RUtMhFGSO9wBV08VpSFxUbf
         7tKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=BDp1QiIqrjEx+PlU/OF76oVJoIUxpUEW3CGCVGEiRJQ=;
        b=xv/HN6Ns1+7BVKdeYdvAE+IDh8pCbjPNTXX2Dd0LLz8ugUJL45Qyei24zHpI+9rgC/
         Y8eBgwhEpr4hMvkKBa11TfnbPsUvvae6U5kao0WU+fvh+2NfINqZ7XEtyR67XlAMWGsX
         iO/xJvJmBmO9WPT3lJcOBx+xC99aOJB32u6g1EKqD4b++IYagT8ZIgj3HGXA+YTCiZct
         aRmhzywWF/AEVfP8ecfPPqX6TI7zOZnFMY2YMRnIvVhhaeOIKWh7i0SQazYMMcOtqf0c
         fJLIt2GS//Gb18qHUVTE8lgfTaWWA31tnqp/TKxnR36NJLo1UsdT1/GmRSKPDgAcVf38
         Cmmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T+6p0QpQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p184-v6si1955191ybc.649.2018.02.27.07.34.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 07:34:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T+6p0QpQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38096 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqhH8-0003WM-LY
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 10:34:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqhGu-0003TW-NH
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 10:34:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqhGt-0007wz-R1
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 10:34:28 -0500
Received: from mail-ot0-x22b.google.com ([2607:f8b0:4003:c0f::22b]:44091)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqhGt-0007wg-Lp
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 10:34:27 -0500
Received: by mail-ot0-x22b.google.com with SMTP id 79so4119767oth.11
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 07:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BDp1QiIqrjEx+PlU/OF76oVJoIUxpUEW3CGCVGEiRJQ=;
	b=T+6p0QpQB5PX/PSn5QBg1WYRFc67cHURy82kceXz0ncexUte+aQXffNyGRxsX6bo0F
	PYze+lkB1jY29OGXBnX/pcXb3lk9Xke9xTS+VrBWhpIK/Ph2XCRGP2Si+p1Ke3StRxkK
	vp+n1yzd/CXSU3krTK/vGWQaNvms3Qi2Rikig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BDp1QiIqrjEx+PlU/OF76oVJoIUxpUEW3CGCVGEiRJQ=;
	b=D7zsTDs3T25FhDZzROtCXT6UdTeyy49bT3QYI0l/1P6KA2TDmc4TFb6j0aHvlUwAFg
	r2EESmlTsy6drRZSBwvjHXKTvjhYzKWZ1SlSCIWg+Q8uGYgHDWpn6zCw5IutmiXiq7Tz
	UQ97EskQKMrMw5T3J+/B9d7bYBq5xO+sgw3vOTiB1OdqhCOAO5doLMa3xRSlOTWRMBQN
	dpYuY4fx2eg+boPyg97adI1tR6hJFNKF1wDeKKTAmgKeZ59McJuU6csXk7YdxjscwKLh
	gklMGceQtmQGOL0ittiiFPc4JdYi2CG8EvnoeDv1njOUStCYLAtFHTAGKWwT591wVHPk
	LvOg==
X-Gm-Message-State: APf1xPC0uwxdy0Clg9oVNnC8cFlzwS1dSdzpfZVnivy80/Iq+kOEPtw3
	MRi+8J2vncI2RKk4RoFM+MCr+DqB3ZPi2FXZX4fz8A==
X-Received: by 10.157.34.2 with SMTP id o2mr10986671ota.316.1519745667014;
	Tue, 27 Feb 2018 07:34:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 07:34:06 -0800 (PST)
In-Reply-To: <20180217182323.25885-64-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-64-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 15:34:06 +0000
Message-ID: <CAFEAcA_+j5Fsi6eqhgnrMmExwgvORhpH3hdb=C9DH3ZLQ8VmYA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22b
Subject: Re: [Qemu-arm] [PATCH v2 63/67] target/arm: Implement SVE
 floating-point trig multiply-add coefficient
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
X-TUID: b0uYEa59d7mY

On 17 February 2018 at 18:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  4 +++
>  target/arm/sve_helper.c    | 70 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 26 +++++++++++++++++
>  target/arm/sve.decode      |  3 ++
>  4 files changed, 103 insertions(+)

> +/* FP Trig Multiply-Add. */
> +
> +void HELPER(sve_ftmad_h)(void *vd, void *vn, void *vm, void *vs, uint32_t desc)
> +{
> +    static const float16 coeff[16] = {
> +        0x3c00, 0xb155, 0x2030, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
> +        0x3c00, 0xb800, 0x293a, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
> +    };

Comment that these are constants from the pseudocode, or whatever
we agreed for the earlier patch with constant tables...

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
