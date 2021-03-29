Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3422151lfg;
        Mon, 29 Mar 2021 00:05:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpzqHrTc5MXBW9yXczWRetAXXePl9T0H+WtU8KbGanvEEM0z4evjbTXXibzwO6+nkaasWy
X-Received: by 2002:a6b:4e01:: with SMTP id c1mr19063355iob.61.1617001546408;
        Mon, 29 Mar 2021 00:05:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617001546; cv=none;
        d=google.com; s=arc-20160816;
        b=JobCj2SCbQMbWZP6YP7d18zOvw5sy9a4HAjknXs5OifMib3X7pMCXQ6WNlcskw2UUE
         sqWxiyANPlEBW/QAp3PigCwGlexX5fgV3AC4t2qoiHTlZLPnRNbQmVoiSrZZ9j+rjNTU
         0MELwHlnZTGPYfsu8juExMm0exDFEXLAZfEEZDHzeGH9WR+GkdomcAPaVrdXPJsziBmd
         h5zQjSdwg8vtzzDzIOTuiwbshvTfzpYW3QBnbkIdJx1NVMNDvl3PLBVreV05L41m9o/d
         3uLF47jJeBR097/ZpAvT8y+1g0YachzOk/u/OpLynbpGQm9/MghdAEBbHxz0m0BKlROd
         WkgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=26Z9UCcCCNSdO3wxHe9ekIVm6qph8SgG9+QNaj415Lo=;
        b=ZcoJSd3jJZiGOQwt9vjxHjzuRO37GnAkwhJ8/cnX3/PPwJ73HiYfG94tkzukWvsP3R
         75CuSLXsPeKed17ARnmOAdmIYu+JZaSU5EcBy535OAvzAa+RPMKq4kpWekTSz9ICmH3i
         ickeLJu9fInjCEz/xMoxzRvhDy19zSqKAAQf3KWfGtGTyu8SxMyIoBkqW6v3v8oPnBCm
         CbM1QQXXSbIqysZ+MP7gz2D4APf8xvHz4Ktj7O1rhY5a1iSfjiUGxhmpVKQIBQLVyIUk
         GrHjuowZCP3OWl8AwLKoizFXdiEbAqRywPoefuxTNSQnbN2rBhgJHFJMyzlA0MXCwzKB
         Wrdg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h23si2292255iob.7.2021.03.29.00.05.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Mar 2021 00:05:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lQly5-0004AV-NX
	for alex.bennee@linaro.org; Mon, 29 Mar 2021 03:05:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lQlxm-00049u-O2; Mon, 29 Mar 2021 03:05:26 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:58291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lQlxi-0005SC-Sd; Mon, 29 Mar 2021 03:05:26 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.180])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id C588E957029F;
 Mon, 29 Mar 2021 09:05:14 +0200 (CEST)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 29 Mar
 2021 09:05:14 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002b276da51-074d-44ab-a182-8a9c73b2660e,
 8BF819BD6DA5614ACA9E0FB600EB83BC0C5CC0F8) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v3 2/2] tests: Aspeed HACE Scatter-Gather tests
To: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20210326193745.13558-1-klaus@linux.vnet.ibm.com>
 <20210326193745.13558-3-klaus@linux.vnet.ibm.com>
 <77ed0e65-471c-abde-3e80-cc90a6d0a666@linux.vnet.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <26d15840-3c90-225f-0186-f7cd432f63d5@kaod.org>
Date: Mon, 29 Mar 2021 09:05:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <77ed0e65-471c-abde-3e80-cc90a6d0a666@linux.vnet.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e779308a-561b-48b1-88b4-850f0c9eb440
X-Ovh-Tracer-Id: 8946963612304968495
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudehjedgudduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehklhgruhhssehlihhnuhigrdhvnhgvthdrihgsmhdrtghomh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qNmmlHXcYlNn

On 3/26/21 8:48 PM, Klaus Heinrich Kiwi wrote:
> 
>>
>>   static const struct masks ast2600_masks = {
>> -    .src  = 0x7fffffff,
>> -    .dest = 0x7ffffff8,
>> -    .len  = 0x0fffffff,
>> +    .src         = 0x7fffffff,
>> +    .dest        = 0x7ffffff8,
>> +    .len         = 0x0fffffff,
>>   };
> 
> Apologies for that - Need to proof-read my patches better,
> even if it's Friday evening :-(
> 
> But I'm guessing this can be fixed on merge or if a (real)
> next version is necessary. Let me know otherwise.

I will drop the white space changes.

Thanks,

C.

