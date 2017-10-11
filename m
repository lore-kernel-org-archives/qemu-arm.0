Received: by 10.223.197.9 with SMTP id q9csp428484wrf;
        Wed, 11 Oct 2017 02:56:50 -0700 (PDT)
X-Received: by 10.55.134.70 with SMTP id i67mr19207339qkd.22.1507715810520;
        Wed, 11 Oct 2017 02:56:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507715810; cv=none;
        d=google.com; s=arc-20160816;
        b=K75/G8tP3pEk+afL7FtQhyRf+BTak/Moy+RKmgFux0rfnzknhpkCBP36ajki3GKmMB
         U14vbuOfgYf30KNwJ84omNyP0XXR2uNGqLmfZ3HayvOD7wP8WSO+frYpIfehcb/n8D5V
         IMU8ObGkHnoQrQITDIbUdApAN6oAOdwgwfph2ApMfkUbSSfJeVDp7fIO+IK2p9MptBTy
         HLPG+//GCvzLkjRePiXz5aBHuXT75f/OkdhC5Gy1qIfVceAVixdVJmhco9eWkAwY5nLM
         y/vJzBTU01anipgWf7NyDnFLn5upNFT3p0z6V63E9ll9W7DPAjlyGngkmzvnDtWkb76U
         j0Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=JKhAC0CUl0/UlW8BujKXSqprZ6drOBgw2bK+4PUwfTI=;
        b=gBbqUOk1N3y+kJy7MLP9A0o3wRdITeXdmE2rCE/EWV92b3TP1wG0kE5hc4oQMeXdqu
         6wZJDdz+0w4/HBw9qau5Ow4B2lklUo8nGirAe5e1Tncv2qHL6dpXj9IDFCdLH41cczVm
         PYPI2iZKr9n6PLxELY+87mUbKTcd5sVWHO7Hyk437v7JRV2hgNisfAAaPfsMwZ4s7PBE
         D/lEHUnnG3yeZLNpue6t166L8TfpWYMFTty5A3oJ7TeOI9QHlyyqb9NTqI3iqkhjJpNR
         GkkHWmuT44+OIuUYmLtFfXnqLVLGCJcALVHKuj7RnyWVY0iGgFNAzoSNcbnoCT3cchIs
         FpFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HfmFcVaR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j10si2011642qtb.554.2017.10.11.02.56.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Oct 2017 02:56:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HfmFcVaR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39940 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e2Dkt-00020e-PZ
	for alex.bennee@linaro.org; Wed, 11 Oct 2017 05:56:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56398)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e2Dk2-0001gR-Jd
	for qemu-devel@nongnu.org; Wed, 11 Oct 2017 05:55:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e2Dk1-0006v8-Q7
	for qemu-devel@nongnu.org; Wed, 11 Oct 2017 05:55:54 -0400
Received: from mail-wr0-x22e.google.com ([2a00:1450:400c:c0c::22e]:55129)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e2Dk1-0006sH-Io
	for qemu-devel@nongnu.org; Wed, 11 Oct 2017 05:55:53 -0400
Received: by mail-wr0-x22e.google.com with SMTP id o44so833351wrf.11
	for <qemu-devel@nongnu.org>; Wed, 11 Oct 2017 02:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JKhAC0CUl0/UlW8BujKXSqprZ6drOBgw2bK+4PUwfTI=;
	b=HfmFcVaRIaxEApt9tufpqFqMr2ZFZPhQhOCoiGPgsyOtSl+NWFs1H2inIWCsrxmSI6
	Pqs0GpFo6gfmNKuA+FQc9HhkH4eoDkpJDZUwUWTWEulvK60kxViXa8Duc/COi4Vn87V5
	6C1MCrcMBcO3XoyqqucEHxOFv9YW7khsKngEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JKhAC0CUl0/UlW8BujKXSqprZ6drOBgw2bK+4PUwfTI=;
	b=rpZvQ1zULYmxsUVwk3tJD3Igs+VfBxBukzKcbIbiW3kKStT2CEQwd/zjeJYPLQB68D
	bsSQI96g63iRyVqTAWIevERK1dRZkAnGBrCbIbLueTdu6B5VjSAnrl90/6e/fcWr2VvI
	jkxgOlkL3qKUcZ5y/rNqTrxxMtQgdJGc0+kXnhrJ5tUk8KOjpn6CioNspALlNYcTjVOQ
	Id+0LG4o1Ugaxl3U34dpqDaQIkPeSgcAkDcii1iv4rMmb9HzVMTr+87rN6n+21OkgT36
	GmpvqSTCeGQXiAOgV17iZYAvQIZL0pYgkWxDbTVlfUnlYqSalrK0L1ut6+ejg0CJWVrQ
	e7tA==
X-Gm-Message-State: AMCzsaXIub9DOeAR5IAouZcjIUXnlhXaRpVzFiMljAU7UeWc431+Dz5v
	uiu+OQFYutd7I0THrKabD30eYRhOVBkTb3+RSI4fGPp2
X-Google-Smtp-Source: AOwi7QDEiixTqMAo9Dl4MskT5ikZqJhy00aiK9ZGe+r3i0+TMWeLS0LN5Fm+RePHql8epyRUyqCr+7y9/IoDkHdZ2oE=
X-Received: by 10.223.147.166 with SMTP id 35mr17339832wrp.90.1507715751123;
	Wed, 11 Oct 2017 02:55:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Wed, 11 Oct 2017 02:55:30 -0700 (PDT)
In-Reply-To: <520fa164-103e-c09d-67af-5d0e9d8ebb9b@linaro.org>
References: <1507556919-24992-1-git-send-email-peter.maydell@linaro.org>
	<1507556919-24992-7-git-send-email-peter.maydell@linaro.org>
	<520fa164-103e-c09d-67af-5d0e9d8ebb9b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Oct 2017 10:55:30 +0100
Message-ID: <CAFEAcA_ttfHBZpneED7C7tv=p958XooRMMFE1rnCt=fTAgtQZA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22e
Subject: Re: [Qemu-devel] [PATCH 6/9] target/arm: Pull Thumb insn word loads
 up to top level
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zUzQCDSq2x2Z

On 11 October 2017 at 03:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 10/09/2017 06:48 AM, Peter Maydell wrote:
>> +    if ((insn >> 11) == 0x1e && (s->pc < s->next_page_start - 3)) {
>> +        /* 0b1111_0xxx_xxxx_xxxx : BL/BLX prefix, and the suffix
>> +         * is not on the next page; we merge this into a 32-bit
>> +         * insn.
>> +         */
>> +        return false;
>> +    }
>> +    /* 0b1110_1xxx_xxxx_xxxx : BLX suffix (or UNDEF);
>> +     * 0b1111_1xxx_xxxx_xxxx : BL suffix;
>> +     * 0b1111_0xxx_xxxx_xxxx : BL/BLX prefix on the end of a page
>> +     *  -- handle as single 16 bit insn
>> +     */
>
> I really had to search to find docs for this.  I suspect it's quite clear in v5
> manuals, but I didn't have one handy and arm.com seems to have dropped
> everything before v6M.  However, I did see a footnote in v7M that explained.

Yes, it's in the ARMv5 and v6 ARM, which you can get from here:
https://developer.arm.com/docs/ddi0100/latest/armv5-architecture-reference-manual

thanks
-- PMM
