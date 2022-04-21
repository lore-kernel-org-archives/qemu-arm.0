Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp153797lfk;
        Thu, 21 Apr 2022 00:33:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOPaBjrQrh/RYhcjFtyqagpUW7n68WCDIgugNwc/ODZp7s9TYg8GFDtzDNs3iT7u7qsBfa
X-Received: by 2002:ac8:5c0a:0:b0:2f3:4536:9bc9 with SMTP id i10-20020ac85c0a000000b002f345369bc9mr3120850qti.533.1650526430334;
        Thu, 21 Apr 2022 00:33:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650526430; cv=none;
        d=google.com; s=arc-20160816;
        b=0pzz2j4/olzxw0Qvlzs9r9hci8L6YvR8uMulKR0krQIhyDi1CcIU7P9Rj7+13Z6x9d
         kRmgijbn/imqzBw9FAMyKLrt42ZGQK+c7QmCLXRxSbhrpYlJiziah5fHl/bnMfwbasRA
         zQP+nO3RknwaXaiK8f+S/MfrdUro3RHep/lYkVYBjkBJainJgnnSgZwc1sprkCEAAnd/
         BbHjtPFXKAEkqYbKPaqFifMUBmKsasIUUWwta6FdFWwNgGtg2M9hxQa9ZXrYqYkhRKzj
         l0CxbCfjGk9hsbw7eogWrWeP/Wsm5KxGzh4WSSnzlB/322I8SnXAK6/q8ncvmSk+W89e
         umhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=8PaFk4jPGsNG+wMpsyqBaEPbKYcll6ZKK7Ai1rK9tgo=;
        b=efk96EzoJFprZA6ekWaa3e54Iyt3aNh6nZ9jGWJQha9EQLsMaEKo4Z8bKKGF3fbzMx
         pMRooo7x7eExyS+QGKg1gkbYL+xKiZ9DAfT5/+Z3y47hX8ncDXAuBsepbqgyWViCFd1P
         bTS1ThwcfAeOn10nxOS72gGYDfU1hGsbjEtoyS+3bdpUPP5VLNaGEb2pF2KN6ZxrwQyB
         VFBvP/AVVO6iblHiKIbNx/FlMXgomVd+GY/s5A9ln9ZahyQaZbxu4METelyMw/3m1vwh
         aX9hHVRHTADsbd10LbyiHkmyOs/gNugat4rtlFCIIeGSo37xh15o1VcVdQz9HpaRfBXQ
         2bqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13-20020a05621421ad00b004443f45e056si1138591qvc.218.2022.04.21.00.33.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 00:33:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhRK0-0003G5-RN
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 03:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nhQoy-0003Kx-Aj
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 03:01:44 -0400
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:39639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nhQow-0002t0-KJ
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 03:01:43 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.66])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 9326C2251A;
 Thu, 21 Apr 2022 07:01:36 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 21 Apr
 2022 09:01:35 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003fe26116d-691d-4f3a-888b-d1700d0e4d48,
 FFC778467988C6DD564F10F4CBD504D71298CE84) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d273123c-e547-2823-51f9-793bf0a4923d@kaod.org>
Date: Thu, 21 Apr 2022 09:01:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 2/3] aspeed/hace: Support AST2600 HACE
Content-Language: en-US
To: Steven Lee <steven_lee@aspeedtech.com>
References: <20220331074844.30065-1-steven_lee@aspeedtech.com>
 <20220331074844.30065-3-steven_lee@aspeedtech.com>
 <eaef19a7-53f3-fbc8-c5a3-f7693b7d67eb@kaod.org>
 <20220421020734.GA2850@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220421020734.GA2850@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c38d544d-c3fe-4165-b487-608fba96e854
X-Ovh-Tracer-Id: 94575595014032373
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrtddugdduudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhm
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
 Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 Troy Lee <troy_lee@aspeedtech.com>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LdQu9xVC1NTX

Hello Steven,

>>> +static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
>>> +                              bool acc_mode)
>>>    {
>>>        struct iovec iov[ASPEED_HACE_MAX_SG];
>>>        g_autofree uint8_t *digest_buf;
>>>        size_t digest_len = 0;
>>> +    int niov = 0;
>>>        int i;
>>> +    static struct iovec iov_cache[ASPEED_HACE_MAX_SG];
>>> +    static int count;
>>> +    static uint32_t total_len;
>>
>> Why static ? Shouldn't these be AspeedHACEState attributes instead ?
>>
> 
> will add these static variables in AspeedHACEState.

When you do, please update the reset handler and the vmstate.

Thanks,

C.
