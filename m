Received: by 10.223.188.70 with SMTP id a6csp6133107wrh;
        Tue, 29 Aug 2017 08:38:24 -0700 (PDT)
X-Received: by 10.200.36.48 with SMTP id c45mr6004312qtc.263.1504021104638;
        Tue, 29 Aug 2017 08:38:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504021104; cv=none;
        d=google.com; s=arc-20160816;
        b=MXeBMfq636+qQWLQaursGdTkOTOusQW+UjUEN59o8KA0Xx6VaorSeIgk0wtSoVbnxZ
         c9jxj0iNKyivnU9cd5OmFtKCecGjMcwV8ePfKsnP7/FRdt1sY11+U7Bu2Ek9tClF1foa
         WMflxW1VL1ilMieIPTCWspJrksMMoLV7v+s9dXJVtbafPUyWul0YMHJb9rycW7Ax60bg
         Zs46rJdcpg9BLetN3j02coqdJtUCINcVRYH8ot2z55wWQz8xbux6IzY5YZRALOZuTfPN
         VgQJiT+20PVTq0Jw3KxrHMFJ2MC8us4bA4t3zr7h8cGkp8WXJTdQ/g73sfjSx93oCxxb
         dM0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=t8VSKlByIYGuqNpJUT1NlBKJCWnKklAfxtKjj4qfaB4=;
        b=PRfGbEu84cwN5hEU/LOnnHO5a5qos9ajLP90rC20bAUubhLP42wAhWFsmWTjJaMYzp
         OWmatvU0SH37Hylcj7GTxA6CGwCrE47CpLNJuXz4C6EObDSpCTWXi5zQ+Tp9w/aPK4LH
         04rGCDiiO2X/NyW3ivl4i5tpFKHG2RErXN+JNGrNpYxEU43dKdsyYElgchwAdUsbpnuB
         cZQM7pw8pgF5MfjxWvj3A7BRekwTvtNNHxxMeD7vgqb4DfcyIqRSmQp6w1S/hwBRmnV0
         jT8GjzMJFHxZTUe4xdmpnbMXAG/nPkrGmde9mKX6/3Bl85vlEFvt0Ogrcdg4JgPFxep+
         0sVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LksY/OfG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r40si3043929qtj.352.2017.08.29.08.38.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Aug 2017 08:38:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LksY/OfG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45550 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmias-0007pF-CX
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 11:38:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmiYu-0006VB-0r
	for qemu-devel@nongnu.org; Tue, 29 Aug 2017 11:36:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmiYr-0006EH-OM
	for qemu-devel@nongnu.org; Tue, 29 Aug 2017 11:36:20 -0400
Received: from mail-pf0-x230.google.com ([2607:f8b0:400e:c00::230]:36365)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dmiYr-0006DB-IR
	for qemu-devel@nongnu.org; Tue, 29 Aug 2017 11:36:17 -0400
Received: by mail-pf0-x230.google.com with SMTP id z87so11224893pfi.3
	for <qemu-devel@nongnu.org>; Tue, 29 Aug 2017 08:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=t8VSKlByIYGuqNpJUT1NlBKJCWnKklAfxtKjj4qfaB4=;
	b=LksY/OfGNTqIX33guFy8UNnd+M7BiB6m5/dRLMOEA9oUaLj3qMHmv6neq0KVz+v2r+
	aaxNYeR9ld5atBPqt2xp6ZyvzPUzpRil6vO9egjkR/EYKe60tk8jT/LP48t4NPD3OMVv
	KFs4Sh5k2yDsXszyeRouaiw8PWqmia6SdNi7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=t8VSKlByIYGuqNpJUT1NlBKJCWnKklAfxtKjj4qfaB4=;
	b=bIY4284W7DJ4xN1C7ndzXnjDL9o5ryUx9nJfWOljmhYiN9mbm4VVGRy9Eu73jx0l89
	SgQ8RfJQf09ND9h4xgFGuSNNCCRa86sIskpbn4N+o16knWq7SFuDAI5QmG47z3O/Yf55
	u0MrpQdInTrPxIewNFxxg3PP8lhRkfjsEvB/Q/kwt2heWYw3+iAaINSDWn3kGnCwlTFN
	f+s2B2XVIy0DJxb4aroG+pIM+SMsCe+b3jek1ZpBQwXm8cyfgEFqqK/7T2A8KGTo4BIf
	DKchB0lgygl6k+Mew2IU4anoFtHh/bjmy6Q0gWnpW8FdBI/Y9ftnIE3fSQjmYr/uHnet
	1aXg==
X-Gm-Message-State: AHYfb5iyJf0o1u5rWAq3eVt+TciZ9kvhKyqmCnwRmHA+3gSV0lTICwBU
	WvMOeU+EaTGrzbji
X-Received: by 10.98.13.28 with SMTP id v28mr741453pfi.174.1504020976542;
	Tue, 29 Aug 2017 08:36:16 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.gmail.com with ESMTPSA id
	l67sm5633053pfb.178.2017.08.29.08.36.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Aug 2017 08:36:15 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-6-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <472c8319-b1d3-c91c-c9eb-6e138d8ba82f@linaro.org>
Date: Tue, 29 Aug 2017 08:36:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503414539-28762-6-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::230
Subject: Re: [Qemu-devel] [PATCH 05/20] target/arm: Add MMU indexes for
 secure v8M
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +qZw8twdV5bV

On 08/22/2017 08:08 AM, Peter Maydell wrote:
> Now that MPU lookups can return different results for v8M
> when the CPU is in secure vs non-secure state, we need to
> have separate MMU indexes; add the secure counterparts
> to the existing three M profile MMU indexes.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h    | 19 +++++++++++++++++--
>  target/arm/helper.c |  9 ++++++++-
>  2 files changed, 25 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

