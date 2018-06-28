Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7390715wrq;
        Thu, 28 Jun 2018 05:55:53 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcV1QEu1+M2M0cramnAzXJpMk9DoYH02pybDjc9Jr9K525HsyIkGp1W2pNILWYCRTlm6eR9
X-Received: by 2002:aed:3766:: with SMTP id i93-v6mr9449527qtb.277.1530190553555;
        Thu, 28 Jun 2018 05:55:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530190553; cv=none;
        d=google.com; s=arc-20160816;
        b=PpFkYgsNbnI0Wm5EIOBqdkruIWa+91UcbE47mHjbx2mQysmiqlaVsiSFsq4eoUz0MT
         TcIX2NfdkEWOeXwzcd9rZAu/p+rwy18Tsw6uGoMuGp38pyHcctVMAmHVsWWUTtdEFHyV
         CJtCug2lY8DRKPSiEqERQGss/OG+vqzxfkKwrD8nJff0ckA+uThl8FHC2Yzig8P5zXfV
         HwcwIkkqA157TtcUppZW4Ueqbyre2TSyIVdTSHTSBM2ZfN5izmedBWHLHzQ3hpzHJWKc
         VzFz6LXNEIiSJBf9TBWIXSpxtL18Ae0QZAOdx5dkM/uUmq63LBuL+Evva6aeMNvdrLgF
         VAaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=bx/sqp94WdePBRRca0ziU7AvQ8Y8huAFmytis92tVf4=;
        b=AYjWWqBI6TMS9M3GnNjxiGwCnUZczWSZRWqaNAcu9LIn5wJzHCqEkd9gWY5pnIkvuB
         TqIifU2+3kdq8t+t9JHGAf3oUX4x6e275Dw5Cmf2KyofJPbje2STwfx6Rs5xaABOFMt8
         J4z/gNb5883EAobw+2irO43Y3mADWEL5wnRxuyMBnQMiSRhgGZVKibM/INsTn8hR9YyW
         MdtXYlfhVWDTh101VXY3QVi4zgFS7DwlzDPak9tAqTiFJW1KB00ji8eFVm3aj6zK9ynU
         N3WWv0RhyzS4jLI1QX2HFTh//oAHgla5VrND/y/Apf+KvSosdS+IWq8ArFK39UZkPmAs
         K95A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c9ZvLei+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a16-v6si3169377qvo.280.2018.06.28.05.55.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jun 2018 05:55:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c9ZvLei+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36515 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYWSn-0005B1-1d
	for alex.bennee@linaro.org; Thu, 28 Jun 2018 08:55:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYWSe-00059e-SH
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 08:55:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYWSe-0005i4-5X
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 08:55:44 -0400
Received: from mail-ot0-x236.google.com ([2607:f8b0:4003:c0f::236]:37263)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fYWSd-0005gz-Vt
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 08:55:44 -0400
Received: by mail-ot0-x236.google.com with SMTP id q11-v6so3787943otk.4
	for <qemu-arm@nongnu.org>; Thu, 28 Jun 2018 05:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bx/sqp94WdePBRRca0ziU7AvQ8Y8huAFmytis92tVf4=;
	b=c9ZvLei+sbdF4WbHdziWCgvvy+6PSSeFvrhdXwBdhjcN/UT0d1xhS5thX8S/KixL7w
	ezGYEL6m1IvYCcmo9QMj32ZwDpfUAO0aSUAYP+ybW90FVqH0/uEC/R6cIDi/sJIytPmw
	/XE+EPKreMsb0ZQHPlLMZp0opNRgcxGn92kTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bx/sqp94WdePBRRca0ziU7AvQ8Y8huAFmytis92tVf4=;
	b=rJzUCQGVDAi2DW8U6TGCePevpeGTE3ZPo28KLnW9wTzAwkGwTbU0IMn3jvf8XTBPMv
	XX8U163kks0i63r6zMLWfDxGUTgDOF+etg8zchuuJ2WDZ3xplAKYF4g0a6ks6RABQmYG
	oZVmUHexhQ7Co8at6Ccbw1c0bj13rzm8Pk/hQnn0r8kJWYlemnJyZwqgHgsNsPOlEbyW
	u9nqIIdwRnjrL968ursWqS+z8MEn6pFBgqplNXsdzdr/Umd3jcxHdbdpC2Iw3TpZAZ6C
	2QpE6lb+RY+jAKZCjRC6sG705qfEuXm8zEcLzZBY/M+OzdOGoAL3qSJIXWwRXKNXw2aF
	HjSQ==
X-Gm-Message-State: APt69E31+pzdOfeIPSt1C10sfsFvviw94GlmQIx6GP11ft7P9I88qmmr
	802Wn57MreHZE07NJw2cvzUNys9L49UfCt00LLBGkg==
X-Received: by 2002:a9d:64c3:: with SMTP id
	n3-v6mr6397832otl.210.1530190543077; 
	Thu, 28 Jun 2018 05:55:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Thu, 28 Jun 2018 05:55:22 -0700 (PDT)
In-Reply-To: <20180627043328.11531-24-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
	<20180627043328.11531-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jun 2018 13:55:22 +0100
Message-ID: <CAFEAcA8wC2UCu=iwDrBwb5kkjKcrgD0KP=rzYiyK1hqFmfgP-Q@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::236
Subject: Re: [Qemu-arm] [PATCH v6 23/35] target/arm: Implement SVE
 floating-point convert precision
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
X-TUID: uhJ+qY4wouQG

On 27 June 2018 at 05:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>
> ---
> v6: Squish fz16 a-la vfp_fcvt_f16_to_f32
> ---

I hadn't actually reviewed the v5 patch, but I have now :-)

thanks
-- PMM
