Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7418689wrx;
        Fri, 22 Feb 2019 13:59:59 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZOh2ry+cHSV8Arq+pBjjFLWMdg4LE3Uk/F9/Snl1KpaCL0XbzezyZpPe5aUDUFNECkE8Dy
X-Received: by 2002:a25:1909:: with SMTP id 9mr5125539ybz.420.1550872799509;
        Fri, 22 Feb 2019 13:59:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550872799; cv=none;
        d=google.com; s=arc-20160816;
        b=QkNCXhcFiBLGkLmVKKqXoEMJYSevLre3cufmE8Qcw1GX8cqI33r22RSyCRb7eCT0Nj
         RWwIfiZbROVz2wAUkeqozfWzZsMFkajwXacHIez/FahAcJlGzogSfCgz06n3+0BV5KQ3
         F68YQ63EUDhhLRozMYN98in6hauC4DN2KTPZ5SgTN1Ht1/yRVa8ZVMGBar3A5C5J3+mJ
         Ea6Qu/hlxoh2QmLCZl1ft23dk79eOMyjoFCWK6Gk7Z9d/GB0Tkv4AvtYoXAkTQlrhZnB
         ZOCFUhruIBK6i8SDN+YzJFvruKoPwCLYbCcoXwlwvaVKHV1z5IdBAmWiIFPh8tZog8a7
         u2HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=8tiM77kExDuQZF6Wru469FUEZf2wWHx2tIo+0GPgkyE=;
        b=CMvLD0SWRI2vnEN1Y0Iwh0glrU5KdNmFhEUTnHbcJQDCVQYmkmI15uJRgPs5fNZbrD
         30X1Q3oesF9I5H2hX/NhM/9LEho7diVohMbpWX6p+P8vCNsYeqO9y+qqDJMs7aizs+TS
         GMfozCTfcm+a0/iMz6Hfu/raOOw9qe2AElbk5a5EUbqQdYTZDa/52XE36nx7KBIk+rdZ
         Z7PYccXPt7jrhtJscNSvfOlVMFS8nL6vm8pxMGhCdIBrCEa1MHyXhGb/lnkZMThLS9L+
         ig0U3+lVmYfCGo4eMuO6Q1Ikkxlt6ZsLrbBp2W81IJBfXvvhsGiF8RCGSRHj4cH7eHlX
         fgSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pcqg8w+v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g85si1611179ywb.108.2019.02.22.13.59.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 13:59:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pcqg8w+v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:57489 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxIrP-0004Rv-35
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 16:59:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36993)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gxIr0-0004Rm-79
	for qemu-devel@nongnu.org; Fri, 22 Feb 2019 16:59:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gxIqy-00005q-Qh
	for qemu-devel@nongnu.org; Fri, 22 Feb 2019 16:59:33 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:35385)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gxIqy-0008KF-Cy
	for qemu-devel@nongnu.org; Fri, 22 Feb 2019 16:59:32 -0500
Received: by mail-pf1-x443.google.com with SMTP id j5so1700908pfa.2
	for <qemu-devel@nongnu.org>; Fri, 22 Feb 2019 13:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=8tiM77kExDuQZF6Wru469FUEZf2wWHx2tIo+0GPgkyE=;
	b=Pcqg8w+vT+xods2dXAM4RHv1fQHkt5x3gWkOVjEYSF/V7rk91oQzhv1MTXHVZ7ZSku
	8zj9/74y88J2DclgEbTZQauTUOdQSQHn3szkfDAakFa940Xxu5eurpLZ11Z5b5haL7nV
	/W55pl9/nmYgQ/PEBgAkREx28o7KlU4NAX8H3Gf9C5RzcpToRfxsWli2CdETc++YD7pm
	h2sQH+6QNMbgt5xSMunQI7jHxhnRWWfmNxtbWTZgzrwo6uo1Uw/P0k2vRNXZ2lJj//Ry
	vO0z+F0C0rfmdk3HrFaPelH2+8W2UgFfCRUY9NJoPFkLOuj/19p8sMpywN0MFBtYbtwQ
	3jBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8tiM77kExDuQZF6Wru469FUEZf2wWHx2tIo+0GPgkyE=;
	b=KLsuRov5OQjJlSEUQ6g+KCDeGIlcWN1lHGnJwv4patZthvVYcyvpdSDb45gEh8i0EX
	8T9wBfYPiUAoQdzGJAEv1Fg6oXeag4mCgPyzSCEb9TcJ9WsKjlR3UzCEmbFsuLokTHU9
	+C1MWOlsCPMX+E6eta1x/98XqmmFYI6bce1XPsaE9ovhjL/dmkH/jcexMAkB4vCLVSS7
	jRnCKyQW74Hr9WG1sdasY0+zvurQ9N7Xoo1/TYtPJkCdU7n2MehkSficmS1TVFqKzCej
	9ipA7kkVLWg7u6mOafFnrXvo3YQ2scXoNNE1rxKS1ePIf/JG6IyL/DW6XNbs1Wnb8q/H
	WUKQ==
X-Gm-Message-State: AHQUAuaAjuYhTYBmFGiGr6dWmoNHAtBLG9O3wj9d/dorb61aXZ+pITZe
	rPlAyshd7PVsxbW44zMP+wLYeA==
X-Received: by 2002:aa7:8249:: with SMTP id e9mr6317080pfn.93.1550872756213;
	Fri, 22 Feb 2019 13:59:16 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	j4sm3407143pfn.132.2019.02.22.13.59.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 13:59:15 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
References: <20190222170936.13268-1-peter.maydell@linaro.org>
	<20190222170936.13268-3-peter.maydell@linaro.org>
	<CAFEAcA-YCosZjWEiLC6cc8Z7rfOUQMLYZJX48MKOYuZNQQVR_A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <de513053-6406-4389-5ad8-da113e02ca48@linaro.org>
Date: Fri, 22 Feb 2019 13:59:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-YCosZjWEiLC6cc8Z7rfOUQMLYZJX48MKOYuZNQQVR_A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-devel] [PATCH 2/2] target/arm: Gate "miscellaneous FP"
 insns by ID register field
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
Cc: "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ibmZHjbXIJ+N

On 2/22/19 9:36 AM, Peter Maydell wrote:
> On Fri, 22 Feb 2019 at 17:09, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> There is a set of VFP instructions which we implement in
>> disas_vfp_v8_insn() and gate on the ARM_FEATURE_V8 bit.
>> These were all first introduced in v8 for A-profile, but in
>> M-profile they appeared in v7M. Gate them on the MVFR2
>> FPMisc field instead, and rename the function appropriately.
> 
>> diff --git a/target/arm/translate.c b/target/arm/translate.c
>> index b7702fb49f7..af8f9e669b8 100644
>> --- a/target/arm/translate.c
>> +++ b/target/arm/translate.c
>> @@ -3357,7 +3357,7 @@ static const uint8_t fp_decode_rm[] = {
>>      FPROUNDING_NEGINF,
>>  };
>>
>> -static int disas_vfp_v8_insn(DisasContext *s, uint32_t insn)
>> +static int disas_vfp_misc_insn(DisasContext *s, uint32_t insn)
>>  {
>>      uint32_t rd, rn, rm, dp = extract32(insn, 8, 1);
>>
> 
> Oops, I forgot to commit this part of the change:
> 
> @@ -3361,10 +3361,6 @@ static int disas_vfp_misc_insn(DisasContext *s,
> uint32_t insn)
>  {
>      uint32_t rd, rn, rm, dp = extract32(insn, 8, 1);
> 
> -    if (!arm_dc_feature(s, ARM_FEATURE_V8)) {
> -        return 1;
> -    }
> -
>      if (dp) {
>          VFP_DREG_D(rd, insn);
>          VFP_DREG_N(rn, insn);

With the addition,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
