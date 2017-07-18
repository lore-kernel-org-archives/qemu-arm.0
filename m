Received: by 10.25.44.15 with SMTP id s15csp6460104lfs;
        Tue, 18 Jul 2017 13:21:14 -0700 (PDT)
X-Received: by 10.55.220.193 with SMTP id v184mr4512560qki.74.1500409274580;
        Tue, 18 Jul 2017 13:21:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500409274; cv=none;
        d=google.com; s=arc-20160816;
        b=DrAub9ToXSaWyGWMQFKKCp11E/GYenvO5aM/A23frDe1jBCK4ibp1W+Z6yNyrmYTyq
         m1yLTuz/H1oCdhTxPQqzVlMiFalGDmfWSjQg79FnygFJJlm84SWSt3/h4dWnceMSE7IA
         kW6jFbTRJtCINOjnKYaMeu3EZNFJUr+yM035jHdYC/I3sTF8EwzC0fM7EiF64ftZMBzo
         ICT56BgD6m6//hHYfesbCHVAFf2ELL3d4UnOXyRAmN5dxoSaL0HmET3rEUeTxxSjpJ9+
         9renmw3T6sl1ZNxdwn4BBMxt9/FdX+brj2V5b/rFrJttokM+OOysKWFWVjUSKmYycsq7
         R1Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=Zpf9euO8+6GKTiyUynhPCfTbEo08PQ85f7ApjAT0l7o=;
        b=xNOHzXZ2tMhF+GUxOwsUettKEjwSu063RDV0+tEBVMMd/SddlvNLEjq0xU8DR/AAAr
         UrYcriIqb/Ch+0XQ2lcHcFm2fZStpxNe+tNZMEBbv3YVF+vXHtHv+b2aOEaW793Uf71t
         QLnfdmZP5BCPdh4vVjYIm8Fb+fcGRjdPFMV4QrLu8DLdouXrigvgrhG8k7K2gDfem58S
         VGsZmTERKxIi1pwcHFngSbcikJBkzXRNC0OXuox5wr+WhyN3UsfhvxX46z0B7vNlkbfB
         sr4RPA1c7KuE0o7BRvfSasC/s+llS/uUrczrBYRCl+SclVNrds3ucZHaWjIocY3qZmrd
         mSmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=aR6cHZ29;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x5si3183762qkx.185.2017.07.18.13.21.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Jul 2017 13:21:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=aR6cHZ29;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58428 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dXYzX-0006q8-Up
	for alex.bennee@linaro.org; Tue, 18 Jul 2017 16:21:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50590)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dXYlM-0000kK-T4
	for qemu-arm@nongnu.org; Tue, 18 Jul 2017 16:06:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dXYlH-0006N2-Uj
	for qemu-arm@nongnu.org; Tue, 18 Jul 2017 16:06:32 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:35338)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dXYlH-0006Mo-Ph; Tue, 18 Jul 2017 16:06:27 -0400
Received: by mail-qt0-x244.google.com with SMTP id p25so2586744qtp.2;
	Tue, 18 Jul 2017 13:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Zpf9euO8+6GKTiyUynhPCfTbEo08PQ85f7ApjAT0l7o=;
	b=aR6cHZ29BZaeKICTtbcZfcqwVgPa5r0UTTtMf6INJlWEsrGSWJTgf3ID4fy2JUcAQ0
	a/HG3Ds5xIUkGqjtjcUr14+KiMFd3SsPX8YV62BCVOfZknFgj22s/8re6Iytt7GsYSw1
	sWlliKuutA6vTJBodTspBhP6z2u5zoyKxxZTdzFPXtMoE2zzPznerRf2IydOzvbF6yNR
	a/yLWoY6u6MzcBTjAEPocEnCQxXHx85CXQS8AEmXAMQeRIeT6DRbpCjLGzEW+bJnpDDk
	qcCYjwm2DOayyCZOVJzomP0pOQ/FOSTohF0OQH9U/TOtSWqt0RdzzyU0JoNWiWPBam+k
	Ht5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Zpf9euO8+6GKTiyUynhPCfTbEo08PQ85f7ApjAT0l7o=;
	b=Qqxr7GHYTVK0Nte0+QX2cWzdQNoDmjiWKm8VdF+ZPcUxhuJoqZVRs03xXqFlZVO0EN
	8XwdqEa+kJiHw5/c1OYptdNqVvvvW41UlCnZBSG470NTPsEZGaRgbcgKfQgE1YkgL8vk
	Tm4pCTjVix0l/qBi3Tbor8WeXu/j3ak4/pSEfJPImDFniYVY/Uz5Iri1eSlvShkuTJce
	BHvwxQ4GU8oA2oBq/dvEKCL4hjN1LbHR2DjH4VlH0UusEEVmvJEFFTKsJX0Q7fktY0DJ
	BuNOArfg5thnPzRhKPr8okAicjSPmGHEvn5AkQl+eBGn6PNQz8hHkP4H1a70+8y+gBvD
	2Vvg==
X-Gm-Message-State: AIVw113MXJscNoAhGZlQW4IIVOwMJkhyHl+oSs8u9A8abRz9ZwQ8g3Dz
	0PXGFZ2ou5deST8/cTU=
X-Received: by 10.200.11.65 with SMTP id m1mr4389741qti.229.1500408387331;
	Tue, 18 Jul 2017 13:06:27 -0700 (PDT)
Received: from bigtime.twiddle.net ([101.165.234.197])
	by smtp.googlemail.com with ESMTPSA id
	d14sm1591410qtd.21.2017.07.18.13.06.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jul 2017 13:06:26 -0700 (PDT)
To: Aurelien Jarno <aurelien@aurel32.net>
References: <20170718045540.16322-1-f4bug@amsat.org>
	<20170718045540.16322-4-f4bug@amsat.org>
	<628617ba-12f6-97ad-6818-1d7d0c63f558@twiddle.net>
	<20170718071452.4hlhpelfposv6eye@aurel32.net>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <3290e6b0-a5ec-e5bd-e911-1ace6a401e61@twiddle.net>
Date: Tue, 18 Jul 2017 10:06:20 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170718071452.4hlhpelfposv6eye@aurel32.net>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [PATCH v5 03/10] target/arm: optimize aarch64
 rev16() using extract op
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>,
	qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C+4UJTkdqM8V

On 07/17/2017 09:14 PM, Aurelien Jarno wrote:
> On 2017-07-17 20:25, Richard Henderson wrote:
>> On 07/17/2017 06:55 PM, Philippe Mathieu-Daudé wrote:
>>> Aurelien Jarno denoted this function could be implemented more effectively using
>>> the aarch32 rev16() pattern.
>>>     [http://lists.nongnu.org/archive/html/qemu-devel/2017-05/msg03180.html]
>>>
>>> Done with the Coccinelle semantic patch from commit 58daf05d07dd
>>>       (see scripts/coccinelle/tcg_gen_extract.cocci)
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> I'm dropping this patch and replacing it with the much smaller code
>> mentioned in the message quoted above.
> 
> In that case, could you also get the corresponding aarch32 patch:
> http://lists.nongnu.org/archive/html/qemu-devel/2017-05/msg03887.html
> 
> It has already been reviewed.
> 
Done.


r~
