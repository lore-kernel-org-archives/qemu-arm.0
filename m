Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp378223lfb;
        Mon, 4 May 2020 05:13:49 -0700 (PDT)
X-Google-Smtp-Source: APiQypJbtkHPUzpkDEqIXjMNiH2+t/8AHnATSjvQqPGXVAg2rVLtg6LBKUDzmKSu5yMeNqydlMo8
X-Received: by 2002:a05:6214:1804:: with SMTP id o4mr16271119qvw.10.1588594428909;
        Mon, 04 May 2020 05:13:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588594428; cv=none;
        d=google.com; s=arc-20160816;
        b=GsomV6P/jenjPmlWbb6CsvxC+3eRJV++ZDv5rowr0cPtQWjnrRlKMeR9C03Jo4oOAl
         vYb4BVYBh9HSCtiW3Dt5XVFNBLkgEosBVpmNNe2W84kB75U/+QkRyHyMNtIt9pSRN/D9
         CwKYz3Cp/ouWfmebWf6FKy58wjablFf8TUndkEYWrnp42e5oR/CjfvgisTJQ2YjYb21U
         +CU3D5i3+izqJFdBBsJ1krmQPGBvHB6e2SIa14zHFJ9ApKjWcv0Qiyww56vKoS792+AE
         j8zkyxuckHWV1cHHvHThpDfLUxJVLBh/33cWRPAFuc0c7CQUieX4SFVZq6B/EiSt2DfZ
         +ULg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:message-id:in-reply-to:subject:to:from:date;
        bh=2JNFMEn/E7tlWx0vfDIzyMSTZ2MQoQmWf06ZhxWJJFA=;
        b=PQuBLL1jAyef3EHYrvEWeNXmgQqEA5AfmpF7a3QsxIgi/FUn4gFQ5zf5R9K4LU5iR6
         B//6bfQWYt6zsGpGmE3u1W1GQTfwWE0bozs2x6R+y9ifw+yKVmhqYWTWZfYhicANZSJK
         OaloSbAMB8Z/pbgxdsqM8ZVXbeN8Qs0C3GuhbtuN4PvRc7ib9fHZZdPWnPAYRA8okFyW
         6VJTBFgM6iAzpb+CvlBe+nnQt8QvzFwgS0dG+N2Mgr/ZVVUaPnMTmZeoIu/zCxFxGJLS
         nCG/Zcf6KQhCK9JLIMbo7R5chE4A2eBgQ08eL42RPNbSnfLeaX1pfV5W1A8ZQGKQuw08
         ifMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id k22si6383053qkh.316.2020.05.04.05.13.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 05:13:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVZym-0007g0-Bb
	for alex.bennee@linaro.org; Mon, 04 May 2020 08:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jVZy8-0006yt-7V; Mon, 04 May 2020 08:13:08 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:56632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jVZy4-00048F-UI; Mon, 04 May 2020 08:13:07 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6771B746357;
 Mon,  4 May 2020 14:12:59 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 44248746324; Mon,  4 May 2020 14:12:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 420FE746354;
 Mon,  4 May 2020 14:12:59 +0200 (CEST)
Date: Mon, 4 May 2020 14:12:59 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH] hw/usb: Make "hcd-ehci.h" header public
In-Reply-To: <0ffd398d-5585-e7f4-85f7-20e9c001428e@amsat.org>
Message-ID: <alpine.BSF.2.22.395.2005041400320.22079@zero.eik.bme.hu>
References: <20200504082238.16655-1-f4bug@amsat.org>
 <alpine.BSF.2.22.395.2005041044550.59496@zero.eik.bme.hu>
 <0de65ed7-37b0-8916-2ccb-bbb524934351@amsat.org>
 <0ffd398d-5585-e7f4-85f7-20e9c001428e@amsat.org>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-470502501-1588594379=:22079"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-devel@nongnu.org,
 Beniamino Galvani <b.galvani@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Joel Stanley <joel@jms.id.au>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-trivial@nongnu.org,
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9Kg5jfOIQMOU

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-470502501-1588594379=:22079
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 4 May 2020, Philippe Mathieu-Daudé wrote:
> On 5/4/20 12:12 PM, Philippe Mathieu-Daudé wrote:
>> On 5/4/20 10:48 AM, BALATON Zoltan wrote:
>>> On Mon, 4 May 2020, Philippe Mathieu-Daudé wrote:
>>>> As target-specific code use this header, move it to the publicly
>>>> accessible include/ folder.
>>>> 
>>>>  $ git grep hw/usb/hcd-ehci.h
>>>>  hw/arm/allwinner-h3.c:31:#include "hw/usb/hcd-ehci.h"
>>>>  hw/arm/exynos4210.c:38:#include "hw/usb/hcd-ehci.h"
>>>>  hw/ppc/sam460ex.c:38:#include "hw/usb/hcd-ehci.h"
>>>>  include/hw/arm/allwinner-a10.h:13:#include "hw/usb/hcd-ehci.h"
>>>>  include/hw/arm/aspeed_soc.h:29:#include "hw/usb/hcd-ehci.h"
>>> 
>>> All of these only need either the type #define or EHCISysBusState so 
>>> splitting only those off to a public header should be enough and better 
>>> than making public all of ehci's internal header.
>> 
>> Ah you mean forward-declare EHCISysBusState in "qemu/typedefs.h", OK.
>
> It won't work because AspeedSoCState and AwA10State use the full structure 
> (not a pointer to it).

I've meant splitting the internal header into a public one only containing 
the EHCISysBusState struct definition and TYPE_* #defines (or those could 
be replaced with string value where used as done at several other places 
to reduce dependence on this header). These are the only parts which used 
outside hcd-ehci. All other internal stuff would remain in internal 
header where they belong.

AwA10State also uses OHCISysBusState, why doesn't that have the same 
problem? Why no other models need this? could this be really a problem 
with these two models?

Regards,
BALATON Zoltan
--3866299591-470502501-1588594379=:22079--
