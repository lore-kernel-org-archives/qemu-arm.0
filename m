Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp286426lfb;
        Mon, 4 May 2020 03:21:37 -0700 (PDT)
X-Google-Smtp-Source: APiQypL3XDiSrWk8OhXgBcfYXH4edFRhT31r7wuuRYuO7fNaGDQgswvHiThMYR2sLfmDhPXNZMCm
X-Received: by 2002:a05:620a:22cb:: with SMTP id o11mr4613710qki.469.1588587697465;
        Mon, 04 May 2020 03:21:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588587697; cv=none;
        d=google.com; s=arc-20160816;
        b=hsxlGchIUxlqUangGoHYdJ99hbNrGQEOt0uIzJIn5OwKW0b7e5pLIt5ApvUN7Ek+Ws
         Vo8YO8Sch7hKo6kuXRy3lAiOulf6Jxkxt0s1fIJfTxW0r1olN5sbHxMzk/OvxoCK4CD1
         4YSS4qxp0NLyzFXXUah924EJEMxest7roqEMkk7/bG2j+KBFpt+L3YUtbIl8GCZHkp2k
         kp2sja4t4SPuosZpC/gPNn/EOypAmKPwO2WgHx91IhB3kS7DffNSVn1Uy4RJgh1jt00W
         SVf8OgAGgq6PsJagAv4qGW1oh4gWZrLyfhrmeSXI9ofXKk1mEQf4+Pqv7C1iVXa9ryFc
         GRig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=bAay7sHF5UAuLC5K3PGUp3iLEXMVE/Vr87IM8AUWwC4=;
        b=a4nmS7zY7icUIVwpvRLezUcDF7Aj7eo0wGykYXZ0RQ3ctC+iCxW8S5+SidJAAArqg6
         KO63jH6gul05uZTPuvrWctvV9cq9PLQVfpfgQnMEdG5EWMueHtdhsOKoY+IEHi2uTpRX
         em0s0Vy3ALRXIGj6JXq+Afj0EU56urb/pqO4QeQFs8iPCGAJ5uh2FYeCmmiseknFqWRr
         6Yo8Wwg0HQ4xcyl0SdnNQROi4Ek8mIlLqgQeqWL6IunwLkT27HUSxI9likHiHBmMguwn
         gO+a0y2Yma6YExjab5RYYJdd2DHMW1k1S2zvx6WX2CjIwk8bLUmhKZDEOLfe1gZZeMHT
         dWCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=P5PvWZok;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id e15si6086143qkm.171.2020.05.04.03.21.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 03:21:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=P5PvWZok;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:39490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVYEC-0002AQ-Tt
	for alex.bennee@linaro.org; Mon, 04 May 2020 06:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jVYE1-0002A7-Tt; Mon, 04 May 2020 06:21:25 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:40813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jVYE1-00039D-88; Mon, 04 May 2020 06:21:25 -0400
Received: by mail-wm1-x341.google.com with SMTP id u16so8380979wmc.5;
 Mon, 04 May 2020 03:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bAay7sHF5UAuLC5K3PGUp3iLEXMVE/Vr87IM8AUWwC4=;
 b=P5PvWZoksifcRarY1/qYOt2Rte/DxXJYwem5h8yr/OEelyXIB+UN8plufsDUTj0yIk
 Hqrs5zMz2g1vZDJtwQjN9unM2ma5jlBiu4wyaLRzMTpJYfgehaDg3K7aX9qAvs7hVSUG
 ywJ7vyZkLrkGAIPicQmYtBmV1shqAV102pW30i7ox48WUcsNJrvqXRBvcQKsfmOCBfWO
 7u9UYldlNPP35PZyVprWIswBOM1QlUbuTzWElTdX6Cw74skrcS4B5U3mJKBRaGjTlhjm
 cQJSyEQABM6PO3ivDSM9f5wXEW8Q9/DZxMJ11bjU/ph6DmQy9UK4FFai5Enx8Xp9USd7
 RYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bAay7sHF5UAuLC5K3PGUp3iLEXMVE/Vr87IM8AUWwC4=;
 b=gFOvZLCH4ouq5GrhZze0M7ZkXO13AsHLRs1Ls8Y+idGJAB9lOX/AY+Fbs5ibuI0U+s
 4/oxuo8y/qBmLct2i7oJfrJ3SIMapKZXJVV1ADMCPt9cgA/9oNBJvASfytp1ql0GSONi
 1n3Fq8aiSQt1q9dScrA4KGvedIjBQYZSHTzpuhrpTQEJpDLClxAxKlQLDyYZsG/WXL4J
 0PD2xd0104DI5eJinvaSsDN+mGyELHNH5/+j8eMoSZFCBlBlWDheNvBb38xDTd3ctiDg
 +kkjFqppLde/SUyHLyT+bP46B0KKbnKpWQEU2gOCbhKFQdttHDWQVHGGVcwUGhvr/zUD
 ovDA==
X-Gm-Message-State: AGi0PuZpQEbyfGtfgfTV7FkkmOMczqPo35TSS8u0/28G+1BC8ytVi75d
 QrEFBXjX2d/kEBLTkwIJliI=
X-Received: by 2002:a1c:35c3:: with SMTP id c186mr14683203wma.66.1588587682879; 
 Mon, 04 May 2020 03:21:22 -0700 (PDT)
Received: from [192.168.1.39] (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id 17sm12247523wmo.2.2020.05.04.03.21.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 03:21:22 -0700 (PDT)
Subject: Re: [PATCH] hw/usb: Make "hcd-ehci.h" header public
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20200504082238.16655-1-f4bug@amsat.org>
 <alpine.BSF.2.22.395.2005041044550.59496@zero.eik.bme.hu>
 <0de65ed7-37b0-8916-2ccb-bbb524934351@amsat.org>
Message-ID: <0ffd398d-5585-e7f4-85f7-20e9c001428e@amsat.org>
Date: Mon, 4 May 2020 12:21:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0de65ed7-37b0-8916-2ccb-bbb524934351@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BGCRJo+1dYo2

On 5/4/20 12:12 PM, Philippe Mathieu-Daudé wrote:
> On 5/4/20 10:48 AM, BALATON Zoltan wrote:
>> On Mon, 4 May 2020, Philippe Mathieu-Daudé wrote:
>>> As target-specific code use this header, move it to the publicly
>>> accessible include/ folder.
>>>
>>>  $ git grep hw/usb/hcd-ehci.h
>>>  hw/arm/allwinner-h3.c:31:#include "hw/usb/hcd-ehci.h"
>>>  hw/arm/exynos4210.c:38:#include "hw/usb/hcd-ehci.h"
>>>  hw/ppc/sam460ex.c:38:#include "hw/usb/hcd-ehci.h"
>>>  include/hw/arm/allwinner-a10.h:13:#include "hw/usb/hcd-ehci.h"
>>>  include/hw/arm/aspeed_soc.h:29:#include "hw/usb/hcd-ehci.h"
>>
>> All of these only need either the type #define or EHCISysBusState so 
>> splitting only those off to a public header should be enough and 
>> better than making public all of ehci's internal header.
> 
> Ah you mean forward-declare EHCISysBusState in "qemu/typedefs.h", OK.

It won't work because AspeedSoCState and AwA10State use the full 
structure (not a pointer to it).

>>
>> Regards,
>> BALATON Zoltan
> 
