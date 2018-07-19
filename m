Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1813313wru;
        Thu, 19 Jul 2018 09:31:25 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeao+6dbnRpKHRT7ptqb20vxJC1hJYNSocM9fmDL3E5U7kbMLDN22jWGzLPMzRm6i310i3Z
X-Received: by 2002:a37:b5c7:: with SMTP id e190-v6mr9710913qkf.384.1532017885878;
        Thu, 19 Jul 2018 09:31:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532017885; cv=none;
        d=google.com; s=arc-20160816;
        b=ifmCDLVTKsni3d4nvjEXAKDKQgkh3oBv+o80Hs+SaNSqk5jw/TQCFLikAGnFdZoViL
         HdqLF6Yhaqr1fO3thLUed5LpHKd1z7ssUlOOYFBQPnpAw+GIjJdrLlPtbCOwSzsd4Vgt
         h71oJZNBOIUzhx0e7ntcMB+CnAwYbyMPG2XPQnk3L7rhD9cEqBkcYqR4dtvcysWdWT7v
         nbEyu4j7WUKxD/7s6ztC9IXZ2hfvPqQv8gEz0lrUX56n5l1W6u7yLUaJQ/+ZCziEwpWI
         cYUD0qTGVYBqqt1glwjepGbKI00v/d495X0R7RrT5fmFSw6D/Atn2mgvek33ACkVvQy7
         ndlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=guNfC9Pc5wMIAxpQ3btLMDFl0l44hw7HB5kBa4nn8+w=;
        b=md0sem14/oToWQKU4sogyXMASKJNJESgWQXueYqAHgs5aI2/rKW+aCmQvqUA9unor3
         QzHz/N+/Js0gOFGQlDpobJorHvSAwEbS4i7w26f/uaHen9fENshrFEnDKNSI9NPpeNcS
         SC1Y2ZhIJreYfOI3Azths94y+qzgbWjR7UMR2HOThIN1wYCG1ckGG3Bij7zd+Gm/y351
         BpZ90Qldnri8PhIsuz6wzFQ5IBL5m4/TAMkmyxAIGft2f0ELAPBMxZrEmNxok+lTiDhs
         tjAN5oO+8S9PFhG28DQ8gewwMCk0X1x/WvvFGwBaR8cf+3YZa9EPA2Eh1RN0oNaImBxh
         fB3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Q0o20bt/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i27-v6si3670132qte.47.2018.07.19.09.31.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Jul 2018 09:31:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Q0o20bt/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44177 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fgBpt-0004xS-6V
	for alex.bennee@linaro.org; Thu, 19 Jul 2018 12:31:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fgBpS-0004wo-2f
	for qemu-devel@nongnu.org; Thu, 19 Jul 2018 12:30:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fgBpR-0008LE-60
	for qemu-devel@nongnu.org; Thu, 19 Jul 2018 12:30:58 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:39706)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fgBpP-0008Ko-Tl
	for qemu-devel@nongnu.org; Thu, 19 Jul 2018 12:30:56 -0400
Received: by mail-oi0-x241.google.com with SMTP id d189-v6so16080455oib.6
	for <qemu-devel@nongnu.org>; Thu, 19 Jul 2018 09:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=guNfC9Pc5wMIAxpQ3btLMDFl0l44hw7HB5kBa4nn8+w=;
	b=Q0o20bt/WGPj11GgxVQZCTpjFYOMRCJu1jb9qooI68Wiqir+Bu06PIEri7h0LUbL19
	wBgk3eLVf5q+lToDXdCMWCuvfhs3P3MDm3+4SlUlmjFoXxG5adFUGeBaCvenZ147T/II
	Wbg+DrNFikG4sFYQk/A+Wvz+3B1dyizG+pYZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=guNfC9Pc5wMIAxpQ3btLMDFl0l44hw7HB5kBa4nn8+w=;
	b=Jeq5lO3ZvndyWMBnpnAIS0DSjvbxmyzT/2MQ7Nrfi4ICozTi2yCE0f9RCrrlbxRIiF
	GI0PG9ujpjEw9zneaRrDXnzwcr10hJNfvA/Con3NbEyW67bn+T17RYOvT37N6w500kRM
	OmLk82fDQG023f2Ep6NEa/1vpRpAUiBbPdLM85J1n87hnvOLTh7H9KBIRgOhiO7iNuhm
	ejy2PCPtuOtP3Q/jGWO4jsrT9izNxcyMqQ7IBvMXmTlt4Gx+8cA+IIKSAJdfAIcnz1Hw
	yP8vHF0Ka8nYl1aWMXiT+Ln5r9etbu9V3pYaUd1LuAv5O4Ky3TSjJowMDFA0QSIOzQHo
	5WQA==
X-Gm-Message-State: AOUpUlGGvckzFIBVr4VrbRwH59vEaWXd6f1WZZnvgU87OtGr2MuBI6uV
	GnjDzmz45ZJT7t7dGrAXSNMRZUQhO8ogtsztRiEkmw==
X-Received: by 2002:aca:f5d1:: with SMTP id
	t200-v6mr11846211oih.12.1532017855179; 
	Thu, 19 Jul 2018 09:30:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 19 Jul 2018 09:30:34
	-0700 (PDT)
In-Reply-To: <1f26dbe0-9999-f9ea-103f-d5dde6c52dc0@linaro.org>
References: <20180716133302.25989-1-peter.maydell@linaro.org>
	<57aa2f3f-aa32-bcdb-f971-32709e717833@linaro.org>
	<CAFEAcA8FnSP35scTZmLG6_qFOBsu1wRC0mLq5isz+Y_r907i5w@mail.gmail.com>
	<1f26dbe0-9999-f9ea-103f-d5dde6c52dc0@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Jul 2018 17:30:34 +0100
Message-ID: <CAFEAcA-5bunCefm4qKANOqsz1k1vss+tt7y3Y6Gi28hjXorYYA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Adithya Baglody <adithya.nagaraj.baglody@intel.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KRe1VcHTR0eM

On 18 July 2018 at 05:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 07/17/2018 12:40 PM, Peter Maydell wrote:
>> On 17 July 2018 at 18:29, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>> I don't understand why this is necessary in the v8m case.
>>>
>>>                AP                 APL
>>>     <----B1----|----L1-B2-A-------|---L2--->
>>>
>>>
>>> Your comment posits two regions [B1,L1] and [B2,L2], that A is not within
>>> [B1,L1] but is within [B2,L2] (otherwise we would not report a hit at all).
>>> Further, that [B1,L1] intersects [AP,APL] but does not intersect [B2,L2]
>>> (otherwise we would report a fault for overlapping regions).
>>>
>>> Surely this combination of ranges implies that [B2,L2] must itself set
>>> IS_SUBPAGE (otherwise the first region would not overlap the page of A, or
>>> would not overlap the second region).
>>
>> (a) the overlap fault is only for addresses which are actually in the
>> overlap (ie "you asked about address X and it hits in R1 and R2"); it
>> doesn't imply that other addresses which are only in R1 fault just
>> because some part of R1 overlaps with R2.
>
> Ah, that wasn't clear from the manual.

R_DCHP is the text rule that defines this bit of behaviour
(generate fault for "an access to an address that matches in more
than one region"); MPUCheck() is the pseudocode function.

thanks
-- PMM
