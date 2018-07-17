Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2924849wru;
        Tue, 17 Jul 2018 10:30:01 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc5gz2KEn0RRjAHBAI+LsJC/riA5MnzWIV8A1WwwwZkrpjNxY2sDDaNQeLM+9YORgBUNDqg
X-Received: by 2002:a37:90c3:: with SMTP id s186-v6mr2353912qkd.436.1531848601257;
        Tue, 17 Jul 2018 10:30:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531848601; cv=none;
        d=google.com; s=arc-20160816;
        b=SUBE2QFKenwWOLLVFt4zfjX/PpOTBsU1H09jxZ3RPwuwHIScZE2NmXXXW52H8dpuXD
         qV9nMOFby5KmoR9G4qQ+a2HM6nqnY5nnVeyasMZOWoJCC7HNZznIlcjo6cAc6owJnBUS
         +tVweaK5q7o2/5PJ9X4izsAH6B5Q00L/F0l/9vQn+6uBGkzeWbJealsyMjw92DW3lm9G
         UaON1qzLiCyfbZ1oSDDnMC71MsLPIsLS/1G12UO81LrkxGxCEETA8pL+K079tLjorbb4
         PzeDrW0kgEu0f8UixsN/k2TF3dZL9bkCPy5/eVbNmHnvurJ7tizsJrCecgr88yHisM1C
         J2kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=tVJirMraARv7ve9aePP2lFmh5xes/VhxAPJRNybRiLA=;
        b=y05SCJxmLtOvfoexrAHgfk62Z33lk9zOHiN5nmntPvZDOu/ZeYFAKRXkg+urfrmh9Y
         Xvz5+wNg9mlaXePAzeJxzThz7mMQDyxFoLdfR8tYKH3/96RQ9unq/NrIZ6ZJX5IfdfIY
         G6lixbxObOyhwkNu0RMNbapTAgot11zD/J1zYYjPq7Y/VqMrSPkGczHTdEXMJm/DXbG4
         U0Ga2IibaVBJhObPFb8m4DsYOAleNeSegRTeuUazJbv3Yi764/RTG9sCK9U7KeOoLq/9
         dM37R24PRZlv3Qhwosnb5/ZmAlLsq0v71KMKazJ1WDy1TPhT95M/bLxdSkwB7ND3bKPD
         ptZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ihGas47S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e64-v6si1712707qva.267.2018.07.17.10.30.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jul 2018 10:30:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ihGas47S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60669 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffTnU-0005Z3-SL
	for alex.bennee@linaro.org; Tue, 17 Jul 2018 13:30:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37491)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ffTnG-0005YX-KK
	for qemu-devel@nongnu.org; Tue, 17 Jul 2018 13:29:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ffTnC-0002FR-LB
	for qemu-devel@nongnu.org; Tue, 17 Jul 2018 13:29:46 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:36916)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ffTnC-0002EP-60
	for qemu-devel@nongnu.org; Tue, 17 Jul 2018 13:29:42 -0400
Received: by mail-pg1-x541.google.com with SMTP id n7-v6so741271pgq.4
	for <qemu-devel@nongnu.org>; Tue, 17 Jul 2018 10:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=tVJirMraARv7ve9aePP2lFmh5xes/VhxAPJRNybRiLA=;
	b=ihGas47SaGr0aldHfpzCHIM9Qju7Ah8NjRVlCX8pBLTH3FmZMmj0azXu/WFD3287/2
	biqEGfBPPrRWiEgZvFvbp9VC9mNMiP8kFJ408VJFFico0kKCEb6psouHTuVjA8pSDLdT
	CXie5Y3qaFsk5LcqJwcGimvR1/z9i7fcvZapI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tVJirMraARv7ve9aePP2lFmh5xes/VhxAPJRNybRiLA=;
	b=c8dKgnUDiSyp3W94PqBqzPkjz/wkY9r2DJiXsqDcUEqeMHT59It95NeU3x48/pXASc
	++i2N/Q6D+B672K5PR3j1IQ4gUL5HRGI84IoPgeRoXnFHBY59FSDzNZJGCcc6o7LLjD3
	Wf3ZvjnxCdGYOkXayw1feT2i0wBhIHrGF8khWNJkBJfKYviJpf5BVChERQj+RKSoMMLx
	9V9i4VgaOqxY7/0hNSgwd1DE9Tv0By2wTZtuxEbIKZZ0nRYkxboFFKWCvKvudNtV2kbb
	7uZ7ekFd6YDf2UdFb5K9rrxzrHZ8pvuu6v+cQeel9azqGFu4Q7cRA0eI3DKzgX7mHsv4
	SgnA==
X-Gm-Message-State: AOUpUlHFnCxLv/7tSWCqhz24ECVW/K1ySEQaGYUuN9KgM3dKYA24i6Ov
	gAF0RQTyPJxx4GI/lmNX21GqTg==
X-Received: by 2002:a62:3c4f:: with SMTP id
	j76-v6mr1590053pfa.119.1531848581167; 
	Tue, 17 Jul 2018 10:29:41 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	g15-v6sm5003435pfg.98.2018.07.17.10.29.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jul 2018 10:29:40 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180716133302.25989-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <57aa2f3f-aa32-bcdb-f971-32709e717833@linaro.org>
Date: Tue, 17 Jul 2018 10:29:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180716133302.25989-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-devel] [PATCH for-3.0] target/arm: Correctly handle
 overlapping small MPU regions
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
Cc: Adithya Baglody <adithya.nagaraj.baglody@intel.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mEj5sYbsObdd

On 07/16/2018 06:33 AM, Peter Maydell wrote:
> @@ -9963,6 +9994,21 @@ static bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
>              }
>  
>              if (address < base || address > limit) {> +                /*> +                 * Address not in this region. We must
check whether the> +                 * region covers addresses in the same page
as our address.> +                 * In that case we must not report a size
that covers the> +                 * whole page for a subsequent hit against a
different MPU> +                 * region or the background region, because it
would result in> +                 * incorrect TLB hits for subsequent accesses
to addresses that> +                 * are in this MPU region.> +
  */> +                if (limit >= base &&> +
ranges_overlap(base, limit - base + 1,> +
addr_page_base,> +                                   TARGET_PAGE_SIZE)) {> +
                *is_subpage = true;> +                }
I don't understand why this is necessary in the v8m case.

               AP                 APL
    <----B1----|----L1-B2-A-------|---L2--->


Your comment posits two regions [B1,L1] and [B2,L2], that A is not within
[B1,L1] but is within [B2,L2] (otherwise we would not report a hit at all).
Further, that [B1,L1] intersects [AP,APL] but does not intersect [B2,L2]
(otherwise we would report a fault for overlapping regions).

Surely this combination of ranges implies that [B2,L2] must itself set
IS_SUBPAGE (otherwise the first region would not overlap the page of A, or
would not overlap the second region).

Because of the non-fault for region overlap in v7m, I can see that the test is
required in get_phys_addr_pmsav7, but AFAICS only there.


r~
