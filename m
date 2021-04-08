Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp188044lfr;
        Thu, 8 Apr 2021 00:40:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymhG9ABaGrfWjdfVKV3RbdN3F+tQzkm5Gu2Elq7ufWeiG3E0D6J8psoiXVLgI2p8qTYY/S
X-Received: by 2002:a05:622a:549:: with SMTP id m9mr6212035qtx.359.1617867648018;
        Thu, 08 Apr 2021 00:40:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617867648; cv=none;
        d=google.com; s=arc-20160816;
        b=dvpHDmrauuL/1CdjZYv4MGlyhAIcljYN8iUxw9Wue3Rwpkk1zdCzdNM3klweNCtEdH
         14ttmz5+aNdnOto7+Q5AhmzevW2CROCbGBmV6NOPEBl4GwSu8e9cwJtPQHHBDGEH++4+
         r7K2Q7xzcvOCme8WRtylvsM9ESNFCHrpToKbThaF9MNE+3/tyQUmkFgduuJfov3xZBdI
         IH1d37Nx+A/sP/QO5V1TJs3umTbgV7OhBlfh3//dScVbILMu4jEn8yu8jt3Fgi4C4bKx
         AAfMagJiK8OARTkyu7zi7NFBQqslkiII8hQKpTrLaAi3dZ+EY55KicFF9u3RedTel/jH
         8otw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=HL/Kd0VlqeVxImhP2BzGnVR5sUpdA7G91H8Iasdc7ss=;
        b=osA1OFyGXYQtbMpQWgxZdfR8i+B8Ho+KZbdZhGV4Mm0gHkaibiZ9krsz5PxazeGmOI
         Ij4/m6zuDssMWHxLkhm8xGscTfbKosogKfE6//5AK7eFy6q709WHYOeTMqaBQxP7m6Z9
         0MCzqMsOxnLpvZFbiBARRCPJMtP+pjhbVN2Ve0H/KoeybnjE3VYfGrlxWXJT+r9edKWH
         m4Tk8aIXCgmrWDnYn5OR5+QvclBb5WckkJY/UVEWDXPOnNL1PtSZgNYgFiSN6TrKwiWW
         pSdRU3MYRaTGe+h56j3BN6q/nRoe8IEwmtJkgatLRojEUOi2tFv+eq6/pGF2u0hCR7to
         qJOw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p23si1802171qtn.394.2021.04.08.00.40.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Apr 2021 00:40:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUPHT-0007pe-BZ
	for alex.bennee@linaro.org; Thu, 08 Apr 2021 03:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lUPHL-0007pO-Mz
 for qemu-arm@nongnu.org; Thu, 08 Apr 2021 03:40:39 -0400
Received: from 4.mo51.mail-out.ovh.net ([188.165.42.229]:33108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lUPHJ-0003Oi-SU
 for qemu-arm@nongnu.org; Thu, 08 Apr 2021 03:40:39 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.148])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id B100427C9E9;
 Thu,  8 Apr 2021 09:40:25 +0200 (CEST)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 8 Apr 2021
 09:40:21 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0037ac3072b-0b78-4921-ad8d-45f17b3bb2be,
 A36169EE3079FEED08DC2049B229DAFE10CEC3BC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 88.167.138.64
Subject: Re: [PATCH 17/24] aspeed: Remove swift-bmc machine
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210407171637.777743-1-clg@kaod.org>
 <20210407171637.777743-18-clg@kaod.org>
 <CAFEAcA9LEO2BzghgCvp5hfFvRx1YyL5XZxY70FHPGwHeHxZZhA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <016cb78c-ece3-15b6-20ed-29436595f621@kaod.org>
Date: Thu, 8 Apr 2021 09:40:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9LEO2BzghgCvp5hfFvRx1YyL5XZxY70FHPGwHeHxZZhA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d5065776-0c58-4d82-8057-4d3977946e52
X-Ovh-Tracer-Id: 12926738306315488038
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudejkedguddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrgh
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Adriana Kobylak <anoo@us.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R0n0ne6ue6it

On 4/7/21 8:29 PM, Peter Maydell wrote:
> On Wed, 7 Apr 2021 at 18:17, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> The SWIFT machine never came out of the lab and we already have enough
>> AST2500 based OpenPower machines. Remove it.
>>
>> Cc: Adriana Kobylak <anoo@us.ibm.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> We've had QEMU releases with this machine in them, right?
> If so, then we need to go through the usual deprecate-and-delete
> cycle, we can't just drop it immediately.

You are right. Instead, I will add : 

    mc->deprecation_reason = "redundant system. Please use a similar "
        "OpenPOWER BMC, Witherspoon or Romulus.";

And we will drop the swift machine in QEMU 6.3

Thanks,

C.
