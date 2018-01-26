Received: by 10.28.71.27 with SMTP id u27csp459103wma;
        Fri, 26 Jan 2018 00:55:51 -0800 (PST)
X-Google-Smtp-Source: AH8x227Nm6ytP1YVQqeKoS14iGKkS2K0ld7w1BxR51isSvtGJxW5T3yVk2AM+m0V3JXXkBRsp5pn
X-Received: by 10.13.201.65 with SMTP id l62mr10384283ywd.331.1516956951684;
        Fri, 26 Jan 2018 00:55:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516956951; cv=none;
        d=google.com; s=arc-20160816;
        b=06Z0W2q7uKAmLJwbI5X8hmKCpaSIJFNlj6VX2L26yKpg2SBpvenRbKytG8+1I63QI3
         HbA8QAaI+ukFI3yHfT8DWAqbN0oNdoOaarvWyvPr0QLhOKbR6rWD0T+07j0QqjYb+C9r
         KS1s/8EHiEgTFWIqjWfLpnl3xcy3DLReD1cDrEpPD4hhqUBZ3CwQhJsERC9VgWJVk7L8
         8iBmKfjI09j4E9QI4xUax+2Xhf7iCNb36k365xnGtR6P/sDUKe+tieSgtZmeeHWrlfea
         Wf1IZJDW6PcE4PxILaVD9VzKEawS3b3Auc6F+VXIn8fCpYYOAyW6WSZBZK9p6Zc5D8Hv
         FCEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=FTWje60tqkdmoSeYWkHefYuqq51wWWuix5ip+iondok=;
        b=p3xsznaWL3ZTgdu7cBlgpjcJEuimo5RFFGv8xYabyFZgoooGiv7zSMKOMPVTwEiTSr
         /mroxR8XA/OqkC/5A8ZdrNcJewMcBtO1PxZp6lDBwCingytbNYZjliyCVqWyuTT5G34b
         lckMLafTx6eHkbn/O6fJQ2x25NzbNa+ElAKh1egDfmfx6kqstbnI7xIAfJPbWMQM2Ia8
         oy2ps8sAMpyz9nXV0Xf8VLH9jCmNQykwK3c/e6P5Zr8ciuYNul33xGS+R8qfSVhBCglq
         Q/qc1Zcja8iz8CaX+LMyVFdptqiKJV1tLZbca+VxxMcyOwyt6YIMQORpv3LVKi+jHwEN
         IiRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Uy1Bal49;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f73si841145ywb.323.2018.01.26.00.55.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Jan 2018 00:55:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Uy1Bal49;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41706 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eeznb-0007Sy-6b
	for alex.bennee@linaro.org; Fri, 26 Jan 2018 03:55:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eeznI-0007Sk-4d
	for qemu-devel@nongnu.org; Fri, 26 Jan 2018 03:55:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eeznF-00032n-1Z
	for qemu-devel@nongnu.org; Fri, 26 Jan 2018 03:55:32 -0500
Received: from mail-pg0-x22e.google.com ([2607:f8b0:400e:c05::22e]:41967)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eeznE-00032L-RV
	for qemu-devel@nongnu.org; Fri, 26 Jan 2018 03:55:28 -0500
Received: by mail-pg0-x22e.google.com with SMTP id 136so6876513pgd.8
	for <qemu-devel@nongnu.org>; Fri, 26 Jan 2018 00:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=FTWje60tqkdmoSeYWkHefYuqq51wWWuix5ip+iondok=;
	b=Uy1Bal49uB/xc+sKtq2qxjvUsvktwq9LeBdE63z/vEBwDdSCPPYx7/6QAtAIhwK4Me
	K+RhCopMSdrBy0feo01Xnkp33CscOdPUBLFIJItq3ZbaQd44YR24ygLPMyz8K9032sPO
	JUBogCoGNA7kI5EwZCaGQONpjPDPvcdQ1+q2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FTWje60tqkdmoSeYWkHefYuqq51wWWuix5ip+iondok=;
	b=mTOPhaEMvOmVxQqXOySKbU1fRO0rUpOcemnLo6h4gjHi29SVOKCSrwaiWimhk1OvjY
	Z3kLzHmhhIELM7d5tCqjLuhyFL6p4aiqradGWUXa6qGRYhmjmHXulRudrqV6tJN5fZWq
	0rVhhdYNeWeW7TycKyuQa/asaEVxfXi765Jf5QdM8g1kWR9ROyrsYWk5gi13knOJBUR1
	7mdPt623Hzbep5DimnoLt+X5VDwot/3o++CPawJYHXeEoWNJmAnj36fpv+hWl4GhZzDT
	4xa9MQbmruLS3ayj3bq6vDRFprbM32oIFdTB6iT3bRCdNaPy3iSih2aBHaQYRLRm/149
	rH9w==
X-Gm-Message-State: AKwxytfydUboBuLAqz7u8Wp4ZXpVQMWf5W2+yPPaZldrGMGDlC7+LWmq
	R2+viz4ZD/TzTXclpgxWSj3FXG/xTtY=
X-Received: by 2002:a17:902:6a16:: with SMTP id
	m22-v6mr14198212plk.142.1516951750087; 
	Thu, 25 Jan 2018 23:29:10 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	f72sm20019259pff.145.2018.01.25.23.29.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jan 2018 23:29:08 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20171218172425.18200-1-richard.henderson@linaro.org>
	<20171218172425.18200-10-richard.henderson@linaro.org>
	<CAFEAcA9Dmdh+u7AZHhjEkS3zc6i4yf+Eo1-NuksgVdo1cqmKFQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <707306d7-8ee4-ab6b-2154-290647a72779@linaro.org>
Date: Thu, 25 Jan 2018 23:29:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Dmdh+u7AZHhjEkS3zc6i4yf+Eo1-NuksgVdo1cqmKFQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22e
Subject: Re: [Qemu-devel] [PATCH v2 09/11] target/arm: Decode aa64 armv8.3
 fcmla
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2fgYpi3BAFYx

On 01/15/2018 10:18 AM, Peter Maydell wrote:
>> +void HELPER(gvec_fcmlah)(void *vd, void *vn, void *vm,
>> +                         void *vfpst, uint32_t desc)
>> +{
>> +    uintptr_t opr_sz = simd_oprsz(desc);
>> +    float16 *d = vd;
>> +    float16 *n = vn;
>> +    float16 *m = vm;
>> +    float_status *fpst = vfpst;
>> +    intptr_t flip = extract32(desc, SIMD_DATA_SHIFT, 1);
>> +    uint32_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
>> +    uint32_t neg_real = flip ^ neg_imag;
>> +    uintptr_t i;
>> +
>> +    neg_real <<= 15;
>> +    neg_imag <<= 15;
>> +
>> +    for (i = 0; i < opr_sz / 2; i += 2) {
>> +        float16 e0 = n[H2(i + flip)];
>> +        float16 e1 = m[H2(i + flip)] ^ neg_real;
>> +        float16 e2 = e0;
>> +        float16 e3 = m[H2(i + 1 - flip)] ^ neg_imag;
> 
> This is again rather confusing to compare against the pseudocode.
> What order are your e0/e1/e2/e3 compared to the pseudocode's
> element1/element2/element3/element4 ?

The SVE pseudocode for the same operation is clearer than that in the main ARM
ARM, and is nearer to what I used:

  for e = 0 to elements-1
    if ElemP[mask, e, esize] == '1' then
        pair = e - (e MOD 2);  // index of first element in pair
        addend = Elem[result, e, esize];
        if IsEven(e) then  // real part
            // realD = realA [+-] flip ? (imagN * imagM) : (realN * realM)
            element1 = Elem[operand1, pair + flip, esize];
            element2 = Elem[operand2, pair + flip, esize];
            if neg_real then element2 = FPNeg(element2);
        else  // imaginary part
            // imagD = imagA [+-] flip ? (imagN * realM) : (realN * imagM)
            element1 = Elem[operand1, pair + flip, esize];
            element2 = Elem[operand2, pair + (1 - flip), esize];
            if neg_imag then element2 = FPNeg(element2);
        Elem[result, e, esize] = FPMulAdd(addend, element1, element2, FPCR);

In my version, e0/e1 are element1/element2 (real) and e2/e3 are
element1/element2 (imag).


r~
