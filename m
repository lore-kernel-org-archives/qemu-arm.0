Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3334704wrt;
        Sun, 14 Oct 2018 09:22:02 -0700 (PDT)
X-Google-Smtp-Source: ACcGV635l78ZqcUZbCSf9R7Zt/7pHI+8qLqNurWu+C3/Y4Bp+5k2XV0e3SQGHNp7eTWkT8/1tIwZ
X-Received: by 2002:a37:1625:: with SMTP id g37-v6mr12501841qkh.185.1539534122756;
        Sun, 14 Oct 2018 09:22:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539534122; cv=none;
        d=google.com; s=arc-20160816;
        b=K7AjwmXl6ckObltdRADoc84ejuy+4rBbQO3zZTRp2Nfz07dEMjg7wjw0/y9bPCaoEQ
         do3qPel7GopSMI5shpC4HoiYUNdWKiWf3kUL4/6vY+LkLxIVpVCkSXhHlmJCrn8zxq0w
         tlWYWhmkhMDQwxqMAi2esiUkWpRFm2OCWNQ1KzyMc0sP/MiELZHhUEtg1rlvW1648Mo1
         zgjrSS9OVn2kPzARHD82MoFGWmvqcg0iOAHJCVebL31FBAtshOF3LBvXL27Nbp6BK8l+
         65pe8bvyOln7CemJiFRNdtNZuXVy877qCyBxvpEsMrvd0R7euH74idNrGQAYNJFbkuqJ
         PYqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=Wle9rpJ4xoRrIVaUPXOAmdc1K+GGl09D8/zKjF1n8jw=;
        b=lrgTe42RfvaXVG0XzDTLgO+3Rl4ZtQ6jP9SfF5ANFGjL/llUWHZ/pBi0+yCJSO2ZL9
         12qC87/jMwGwIWp/HClvThFhoSc7eqi/Tdu7stYJ1ic11VUr9iyeL7hGp2f6Ulp9/wqJ
         slaVBqdQ0AScgpRrjjSuTt5KS3YRcse5g3LelHhSvDG/bvgAD0vPLsxPmNNeyLp5GhiS
         EHcvHqhpkUp7PjXC+hJ5DmRSk3NCgAxt4r2v1CJKDB1fBgGheHzOR684O2j1xJK9gfUw
         /h7ZZkl7L3oIA07qyn1fax0iOJ37IGDonoqsG/9awHPX9KZOpRCsGRiyd+sRKQIytCh9
         hP5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R12CwlUs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b25-v6si3896270qtc.147.2018.10.14.09.22.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 14 Oct 2018 09:22:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R12CwlUs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48949 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gBj9W-00038b-6r
	for alex.bennee@linaro.org; Sun, 14 Oct 2018 12:22:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gBj9K-00037l-21
	for qemu-arm@nongnu.org; Sun, 14 Oct 2018 12:21:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gBj9F-0003hY-RH
	for qemu-arm@nongnu.org; Sun, 14 Oct 2018 12:21:49 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:41971)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gBj9F-0003gs-AG
	for qemu-arm@nongnu.org; Sun, 14 Oct 2018 12:21:45 -0400
Received: by mail-pf1-x441.google.com with SMTP id m77-v6so8457005pfi.8
	for <qemu-arm@nongnu.org>; Sun, 14 Oct 2018 09:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Wle9rpJ4xoRrIVaUPXOAmdc1K+GGl09D8/zKjF1n8jw=;
	b=R12CwlUs8ZHbs7M4S8HntKKo3bPEumgBWf+t4hhzSQtpzVb2iGafJOujVe7zRGy+13
	Y/h4BB8EPnfsJ8Q0WuIbS5qvmNNqcKGZWkWtYMN1ILjdRe74nv2G7ifFP8thycO3fI0h
	7fGOxrqjCkofhLmmDWRycNF2fF/Hdxf0uHL9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Wle9rpJ4xoRrIVaUPXOAmdc1K+GGl09D8/zKjF1n8jw=;
	b=i/Zrx+pyFHwBfO6eTl6PiLEPXfOyiGl+/t8QEhXHcjMwdbo7kRtSaV2Za5GJOwd89a
	nl+Ubt7o/MSsJJxNw3Hm2UQX2201oOkp+zmvLYCoK+2Ouz+gUGjvH0MHrXjAOaCTA5cO
	M9m5DG8cbo57bGffQOjmOt0qNZrJ6HU1ZXK2+f8niowvkn95IZz1b7XVTn0h9IWNfI5l
	dq1JmXlYRi1bHKKjOnzTVVXnDszphaysqsKn6XmlU8uhy0JQDV2Fv+aAdY1C9Y6FgnSA
	jAc46Wj/I1/MUVFXL9SBjY+RNbp9TmKudyuEc67mckmRT9zJ8aw697vskSDfNCB6aNCH
	GwKQ==
X-Gm-Message-State: ABuFfohKXFzDrK2ijsYkJQSqmwSqm92Z5PVKSS20TD4GSlEAtOFOoi8H
	vHPuVldZBa0wjuETLVM/pyNlTQ==
X-Received: by 2002:a62:9f11:: with SMTP id
	g17-v6mr14012955pfe.144.1539534103690; 
	Sun, 14 Oct 2018 09:21:43 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-8-179.tukw.qwest.net.
	[97.113.8.179]) by smtp.gmail.com with ESMTPSA id
	r81-v6sm13415373pfa.110.2018.10.14.09.21.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 14 Oct 2018 09:21:42 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181012144235.19646-1-peter.maydell@linaro.org>
	<20181012144235.19646-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0a7c5c0d-0027-38c4-26b3-322cf9ffb42f@linaro.org>
Date: Sun, 14 Oct 2018 09:21:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181012144235.19646-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 03/10] target/arm: Implement
 HCR.FB
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /1b/EA3pP0BT

On 10/12/18 7:42 AM, Peter Maydell wrote:
> The HCR.FB virtualization configuration register bit requests that
> TLB maintenance, branch predictor invalidate-all and icache
> invalidate-all operations performed in NS EL1 should be upgraded
> from "local CPU only to "broadcast within Inner Shareable domain".
> For QEMU we NOP the branch predictor and icache operations, so
> we only need to upgrade the TLB invalidates:
>  AArch32 TLBIALL, TLBIMVA, TLBIASID, DTLBIALL, DTLBIMVA, DTLBIASID,
>          ITLBIALL, ITLBIMVA, ITLBIASID, TLBIMVAA, TLBIMVAL, TLBIMVAAL
>  AArch64 TLBI VMALLE1, TLBI VAE1, TLBI ASIDE1, TLBI VAAE1,
>          TLBI VALE1, TLBI VAALE1
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 191 +++++++++++++++++++++++++++-----------------
>  1 file changed, 116 insertions(+), 75 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

