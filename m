Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp322172lfg;
        Fri, 30 Apr 2021 10:22:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZUbhWByj2FxQnQ+M4SM9qW4qnhm9Sw/67NseyOcnL2Xpl7tyFOZR697HbFmqfJ05I+B1U
X-Received: by 2002:a17:907:2cc2:: with SMTP id hg2mr5317137ejc.62.1619803373559;
        Fri, 30 Apr 2021 10:22:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619803373; cv=none;
        d=google.com; s=arc-20160816;
        b=cnXRp7zWWhyfxmFTlKziYC6vJvR6KkAVJ/0WqjjHM7so3Voqd00pCjrg+d3EAmhMMq
         Kpc7r8VOtY67Sf8EjMZyYvxrS0nvFQC59zAy9FtOSb3MfiHdXWA3LCic2WJA4XkUEDa+
         FAwq0RzGYe0KXOqFKMyeQKTbQhG4xPZ+9wEK/uXVydTgKI2C+HkS6BKVFZuSrE0ioNto
         GWRJ606NAssnTNneDs5kj02AW0vauMxsSjwmuCyr2nwetGOaauQHtYgPtfmnj9VL7ktW
         P0q2Rvl5FecWzfkgCCLznTcM5OlRJO264kT6KOl3J/wcTuwDGmAJ6XHIOOUpcvU/pDnx
         Sdrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=2zx4276vBHV79nQrXiFkuwA8zf9iCBUNEvr09wbArlE=;
        b=k9CIvnP9Yhs6+Au3LR7k6g++ifOiGeJaGsaiIepGbaWI9VYhvNXPgiRMAcVd9Sgxie
         Nh7N3pdQaYYUjmtOcVEGbdDE97WKBE2lsxwDBHdAo9xqDTL2Yb6VUjjqXNH3lSrsJ5Po
         G8dKLA0ccgIn8I9js5MbgHyFOebKzg9A4YjHA18EM2jaXzCno+KnzVsLkKUyWmlfJqnZ
         w2oe5JubjKfTsbow+D0t0ZfytXoqepLOHkBSMfjrnT2GN87yHhQttIYJkvFwaz/5caxZ
         d2qBPA+y5JSSz4I+qww580sArlf0dCa0ehD7v99WzQiz7YIOUdL5kyW/m0qrHI5q8W+0
         5Gbw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7si3645597ejx.527.2021.04.30.10.22.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 10:22:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcWqq-0001sT-BV
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 13:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lcWZ2-0002W5-Ql; Fri, 30 Apr 2021 13:04:28 -0400
Received: from smtpout2.3005.mail-out.ovh.net ([46.105.54.81]:42673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lcWZ0-000337-PP; Fri, 30 Apr 2021 13:04:28 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.89])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 458CE13B21F;
 Fri, 30 Apr 2021 17:04:24 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 30 Apr
 2021 19:04:23 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006a7d3ee33-784e-45c9-83d4-9f028c9638da,
 9A331A41C0BF42F629797A62CE73732E2E9A8538) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PULL 00/18] aspeed queue
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430163309.4182922-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6ce25b08-1329-9578-1be1-902f3460fbcb@kaod.org>
Date: Fri, 30 Apr 2021 19:04:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210430163309.4182922-1-clg@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 02c4a9d2-b5a4-4106-8d49-3c34c0066f9b
X-Ovh-Tracer-Id: 4078009463558147037
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvddviedguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehuedtheeghfdvhedtueelteegvdefueektdefiefhffffieduuddtudfhgfevtdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrgh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout2.3005.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OSyfqxZA/oPw

Peter,

On 4/30/21 6:33 PM, Cédric Le Goater wrote:
> The following changes since commit 609d7596524ab204ccd71ef42c9eee4c7c338ea4:
> 
>   Update version for v6.0.0 release (2021-04-29 18:05:29 +0100)
> 
> are available in the Git repository at:
> 
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20210430
> 
> for you to fetch changes up to 1401dcd8aac9039797b995bfab078877a820c9c5:
> 
>   aspeed: Add support for the quanta-q7l1-bmc board (2021-04-30 10:30:42 +0200)
> 
> ----------------------------------------------------------------
> Aspeed patches :
> 
> * Fixes for the DMA space
> * New model for ASPEED's Hash and Crypto Engine (Joel and Klaus)
> * Acceptance tests (Joel)
> * A fix for the XDMA  model
> * Some extra features for the SMC controller.
> * Two new boards : rainier-bmc and quanta-q7l1-bmc (Patrick)

I sent the patchset in two rounds: 0-9 and 10-18, so the threading 
is broken :/ Sorry about that.

Thanks,

C.
