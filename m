Received: by 10.28.91.67 with SMTP id p64csp1741922wmb;
        Thu, 1 Mar 2018 04:00:09 -0800 (PST)
X-Google-Smtp-Source: AG47ELvu8DP609zx4+tWY/OhF6lUNKxjZgQ0fQXVa9jZQBO1lPk/7Hm7vdMezN+/RC6slYoBso76
X-Received: by 2002:a25:7a45:: with SMTP id v66-v6mr845191ybc.63.1519905609530;
        Thu, 01 Mar 2018 04:00:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519905609; cv=none;
        d=google.com; s=arc-20160816;
        b=P2UB+eOxBQheHo5AF/0R5oBeTgCRsiNaMW1s5+C+uWiGswWXUfjx3hqDpbmPxEip6W
         rztSfkuWzlgS1NV0cb/pkCfQcfmw6fu4G33MDcOt8zCryoVRKtsOraUmh6Y273aau6DV
         +wT+5pktEyUZrdG9/DaHnigVuefalu4+WIAUPUyWYk9a0HXawMqUrUOZbwqIhCRgR2rk
         mStVxVaH2MTb0dsUar9I6LhSuB7I9slKilKdHLLV/vQs7fKXtdDHPYf1pcY5QqWNjB8l
         wG0o+tLr5rrgqCVy8wo62M6tX5hvuj1kMYTOKU/DTyaOsWZ3wbC0wLIrrQtF4rkOabqS
         PBAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=zrFwWy6M2SZqRV9L5wcqIIZ9nM4aCS0OtRkH+X2TbmA=;
        b=eMzgnsh9JOj/Em8ylV3TI01bxDL73VksOTdiGc5OSpMND0sNCHWQOWeqtNQx5RdCkE
         G2hW/TP0aEMd4MhEcIj11ccWDomYFvVstg/pCBCwM2Pm9GtuEVePFD12C/wMMT492Fc8
         91Dq/mAYxf2dSQUV/G74pzSxelZEZ9guZPWCrnc3hNa08M2OEVbvD9JPLnUM2oInAc0+
         eyf64rAb8MUw6WIcueb+GzSj8/aPI65q9ApKzXLseCTSb35pJbhy3i3aI4DYP+fxPqSP
         ZRItI6cWpsqL/hEMFz9Dj30Tc97sj9Hh+xjn6xaN0wPEvymUSYiJqXcwacgjX5siMGau
         EVlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CAXaoioe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t1-v6si604060ybc.823.2018.03.01.04.00.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 04:00:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CAXaoioe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55915 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erMsa-00063C-UO
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 07:00:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43894)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erMsO-00060z-JD
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 06:59:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erMsN-0003Cv-SJ
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 06:59:56 -0500
Received: from mail-ot0-x235.google.com ([2607:f8b0:4003:c0f::235]:45843)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1erMsN-0003CW-Mq
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 06:59:55 -0500
Received: by mail-ot0-x235.google.com with SMTP id f11so5287839otj.12
	for <qemu-arm@nongnu.org>; Thu, 01 Mar 2018 03:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zrFwWy6M2SZqRV9L5wcqIIZ9nM4aCS0OtRkH+X2TbmA=;
	b=CAXaoioe+KCgfc3/Txq044UT9PrupWisi/qeNXXk/zlLAl9YXxtL2rZnhegIqlkzdU
	Ryu9pKl8EhCzma3rD4KrqFxynj2oVW/9yW95WlB8XnCg64bA40Sqiax1hjKDcUnSeBrW
	g4+2T59ISYFdWRe05jDJiVuCH40+pojqdfQsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zrFwWy6M2SZqRV9L5wcqIIZ9nM4aCS0OtRkH+X2TbmA=;
	b=KC7FiXDqQ2ybN0fofN3DPvjjBlaa4wgjgS5z1iGHrlJnNc0U/4qsa8Wmubs91OrIB9
	lAh/djMYBCaqFgojj1M8hVQa9gzXs0OKetzyFRCk03W5BDlVdvT56/ldfXxcOj00yNpN
	awUFbv3JHYubDi6Au2llrCND4T+gLKpnbHxFkDhGxJRZO+7GU31mRGo8aMHULJGWGGZD
	r7x3F9ump7YRi2TM39uO8O/j3B56aEnTUg3DceXrOX1IlKeyOxuz/TX1SgyA5NBq5+c1
	tFIGkpC0ijyxVKmkeHNf6up0MJprqn21jGkWsxHz6jszj/Ke2yc+JiZBCQTmyrpPKxnt
	taSA==
X-Gm-Message-State: AElRT7FpIUecx6tXsLND38BwZNcnynsj4twsuPLDmcuC2yzOMblKq2sR
	OXsZsdAHzhAf5UBBmxMD9xhoHqfuoy2TlKepCuls1w==
X-Received: by 10.157.23.34 with SMTP id i34mr1126801ota.210.1519905594890;
	Thu, 01 Mar 2018 03:59:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 1 Mar 2018 03:59:34 -0800 (PST)
In-Reply-To: <20180228164816.24110-3-richard.henderson@linaro.org>
References: <20180228164816.24110-1-richard.henderson@linaro.org>
	<20180228164816.24110-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Mar 2018 11:59:34 +0000
Message-ID: <CAFEAcA_SsRZAsTvUjSYHQcGMUYUDFvr0jdVBdjdczssDmExPgg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::235
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] decodetree: Propagate return
 value from translate subroutines
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
X-TUID: 5xn8rla/xpm9

On 28 February 2018 at 16:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Allow the translate subroutines to return false for invalid insns.
>
> At present we can of course invoke an invalid insn exception from within
> the translate subroutine, but in the short term this consolidates code.
> In the long term it would allow the decodetree language to support
> overlapping patterns for ISA extensions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>
> Since this makes an ABI change to the translate functions called by the
> decode function, let's make it now before there are any in-tree users.
>
> My SVE branch over-decodes in quite a lot of cases -- e.g. things like
> the 2-bit size field must be 1-3 for fp operands, and so size==0 is
> unallocated.  Returning false for these cases allows the actual call
> to unallocated_encoding to be done in one place instead of hundreds.
>
> Longer term, I'm thinking of how to handle decode of overlapping ISA
> extensions.  One could allow (specific) overlapping patterns and
> prioritize them in some way (e.g. first in file is first matched).
> My thought is that trans_insn_a would check a cpu feature bit and
> return false if not enabled.  Then trans_insn_b would be given its
> chance to handle the insn.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I'll put this into target-arm.next, unless you'd prefer it to go
in via some other route.

thanks
-- PMM
