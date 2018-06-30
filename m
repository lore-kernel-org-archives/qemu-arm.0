Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2083655wrq;
        Sat, 30 Jun 2018 13:11:16 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe9B7DBeKT+/g8cwG5gVpRkmyyDDGyeYR/x2a0nh11piLX79Yl8pY7hu2odW8cw8g3mn38P
X-Received: by 2002:ac8:2541:: with SMTP id 1-v6mr7225098qtn.248.1530389475975;
        Sat, 30 Jun 2018 13:11:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530389475; cv=none;
        d=google.com; s=arc-20160816;
        b=mEh7xuk6ynhDYtFAH7KwNioZnTXBoW1rTnLCiM+OiNM25wNjASqkigRYlEitWit4r/
         BTxvIHeshckIIT7Vs77D7PfuvROMfK4AkTw22RIuUhHGi6dtdLnPDX6N6HxRAb1lCCuT
         ZnA4uH7verp23WJV0QqbSzLZazKNCz9ohv1ElwbanPxJt0TACIMvY6+b2eh20uZnSPtG
         jqzLa0ByyH0YgUr5mYFWJ13ndnqeWnAfCUDAkJA5Jytq/rmT4EM7SyRkFExZYnpdiM6E
         ZHegFLoVCCyX52G6/Tw9AfdSzaVVOYCJrbb075xlTC5+psnz8A3pCk4pVuFhhiO2d4SG
         Ra9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=bHIuBmGI2e70Mr66MAgRJAXMzXtMsZ9voCEr0SJlLvc=;
        b=PW42FkLTe0W0Gjyk6MfJG3LODUz6kZLKKBSuFGJzAXaDF8BkfCCk16fFBc7cvRpLRu
         al5O243DvNvxYh1nMIlbNoQRWKPK4NiOntzU+bv2imWAl+jP0doguK0LnFwQDCfQlJby
         RxjQE6DqdRIbPbe0NgHj/ikhiEmCSP0lCslLhQR/w9ej2Q3jHU4DuQT5ac1wPnm9wQYh
         xGDB3x6RMoN1EsSCnZy57/efHoCptBYPRxe2E1xwDbBSo8I6UkRSPWmLWjL64j8kJNhY
         S9FMHBL8SbKf2woROFb9BbIF8GPBkLBWJfzG3Y9+dRu4FcWYbtoP10N3pbEzP/5mcaGh
         PWJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AGCrSHsP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d5-v6si2380994qtn.268.2018.06.30.13.11.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 30 Jun 2018 13:11:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AGCrSHsP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47866 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fZMDD-0002Gh-Gi
	for alex.bennee@linaro.org; Sat, 30 Jun 2018 16:11:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fZMCR-0001uS-LW
	for qemu-arm@nongnu.org; Sat, 30 Jun 2018 16:10:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fZMCN-0002Qh-W1
	for qemu-arm@nongnu.org; Sat, 30 Jun 2018 16:10:24 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:47006)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fZMCN-0002PL-R5
	for qemu-arm@nongnu.org; Sat, 30 Jun 2018 16:10:23 -0400
Received: by mail-oi0-x242.google.com with SMTP id y207-v6so11405137oie.13
	for <qemu-arm@nongnu.org>; Sat, 30 Jun 2018 13:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bHIuBmGI2e70Mr66MAgRJAXMzXtMsZ9voCEr0SJlLvc=;
	b=AGCrSHsPfmfmncsZIFQNWgeZeanCk1Oq/0qjmfxhj76akjUZ7yDkXfsdG2UXquz3ss
	AQD2ah2ZDAUYlGG0ZAYO9Ca4q5acWMk3unyvGHWr5s6bQwLpeOe1t6amSGXfIcikIws0
	DeB1/0MA4qnbeBC+PiJM7to3E5UIqVYFB6SqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bHIuBmGI2e70Mr66MAgRJAXMzXtMsZ9voCEr0SJlLvc=;
	b=lghD/Qehvr4oOnuCVhtctWZmuwMGBK6VW7wWNjeARlvqM6mblkKPogcSKGSJvFY13s
	2ITFRFZEMgi4vIUhiB9Ej8TbGoESRgFqdcQCaMOnQb6njVm5tGWyzXVAGKv0go9MXrI/
	741Fe8yt0/1yANeew9++9EQhTcp5uX8mh8/jumZ/tCh1AkOFH8ZDCyosBc6o2U8/Atm3
	aOlR39bUYaNyktGYV1tAuxdxZ+1vmgET8U8YGowg/BNA8c7nuWmRjxGEkd8L9rUcY+WI
	v6vhVIQV3bMlDD131+E2Y7QzaQ1Hv1wt2e/k1B1vdVdHbdSzeqpLJphHiGBaeIFs32BW
	TiTA==
X-Gm-Message-State: APt69E39o+qGw6w8MK0dazFme1OS8UXPCyXfzqeNYHD1/Xpg/qyHY9jK
	Z96vt/B1C9FJ7+T1VrKlk53UkYW9uboC1Z1uih7R9Q==
X-Received: by 2002:aca:7247:: with SMTP id
	p68-v6mr10921124oic.252.1530389423334; 
	Sat, 30 Jun 2018 13:10:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Sat, 30 Jun 2018 13:10:02 -0700 (PDT)
In-Reply-To: <CAFEAcA-dNr76uh_x98Uz_7h3xWxgd2Q_WdB5OSZVo6K9kruB=w@mail.gmail.com>
References: <20180620130619.11362-1-peter.maydell@linaro.org>
	<20180620130619.11362-2-peter.maydell@linaro.org>
	<CAMo8BfLRr16q4_nj0vacK4N4fb0EBymXZB6SHon72h7BJ9M5jw@mail.gmail.com>
	<CAMo8Bf+iV3fTRtSKx8Y-Y4_e16i21shLOch2PS3v_xR_c+L0ww@mail.gmail.com>
	<CAFEAcA-dNr76uh_x98Uz_7h3xWxgd2Q_WdB5OSZVo6K9kruB=w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 30 Jun 2018 21:10:02 +0100
Message-ID: <CAFEAcA8u=R_wCbnuiAbzHCm_6r+Q7zMij-tCEDkNnLcaoi9jBw@mail.gmail.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/3] tcg: Support MMU protection
 regions smaller than TARGET_PAGE_SIZE
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
Cc: Patch Tracking <patches@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
	qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iSmVjeroc0dS

On 30 June 2018 at 21:08, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 30 June 2018 at 20:42, Max Filippov <jcmvbkbc@gmail.com> wrote:
>> On Sat, Jun 30, 2018 at 12:20 PM, Max Filippov <jcmvbkbc@gmail.com> wrote:
>>> I'm observing the following failure with xtensa tests:
>>>
>>> (qemu) qemu: fatal: Unable to handle guest executing from RAM within a
>>> small MPU region at 0xd0000804
>>>
>>> Bisection points to this patch. Any idea what happened?
>>
>> Ok, I think I've found the issue: the following check in the
>> get_page_addr_code does not work correctly when -1 is in the
>> addr_code in the QEMU TLB:
>>
>> if (unlikely(env->tlb_table[mmu_idx][index].addr_code & TLB_RECHECK))
>
> Yes, Laurent ran into that and I sent a fix out on Friday:
> http://patchwork.ozlabs.org/project/qemu-devel/list/?series=52914

...oh, no, wait, you've hit the other bug I sent a fix for:
http://patchwork.ozlabs.org/patch/937029/

thanks
-- PMM
