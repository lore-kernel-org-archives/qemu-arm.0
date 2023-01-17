Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2133543ejc;
        Mon, 16 Jan 2023 23:43:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsJ6iC/qs4Q5GLUyyHxbISNRcAbVVBMN9ryAYnQXFMW9ReWuGbYX0RHzj32zDboly6BUr+/
X-Received: by 2002:a05:6214:5883:b0:532:2c56:8f63 with SMTP id md3-20020a056214588300b005322c568f63mr3464118qvb.13.1673941392220;
        Mon, 16 Jan 2023 23:43:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673941392; cv=none;
        d=google.com; s=arc-20160816;
        b=N3qz67xGT/PYm+nXb7nN4EZwpNoVwXH4a28jX1rvdbgjHSsBAVGkY8P6bjrfJOnUY8
         aX09Q57qjzXDctBRR8S8xXAIEmp9mS5aS395cgZqe21HQHTMpzhQ8iRVffefSxqDkVoZ
         VGjqwQ6XDIzWseRg7Rp6RDlDUHi53vwfq0Gek94fjTR8nHOQRS61Wuawt+e/OfrZNzAR
         6UmmbDvzLDwNWx4hXQ3G+IIKZ8waNr4U+yRwVIS/AYzqk9mf6KAMxBt5rcDOax1E+9rh
         GHNWju+O0aon2x8QcWaEpT+auCh2TdnbA6ZaXUUefIVC0NMxq5k41n8s3O9pWH4BC9u6
         yfKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=cQRATWGUR+MiaJshLyeFpWwPoXdvblzcxoIuKyAEMKw=;
        b=LRnZWfB9exEyrJOS+FN2QzapqAs282PwA3STAciUajLB+U8xKCzLHUIw4XtlB4k1bx
         lBnbH0Wf4QVYFeDut8XiOSbCtjsH6Q+J50u//D/aeTUHHvvT9g12LCnGo2fEVe0PnRgR
         KVD08neph9ravzyp5Jwgw0Pdt0xZ/qKvCCkW0Ti3FMfmKqLbAjaH8f5OD8ikam9oouUt
         8V6/vsXR3Q3t8qiqvwRPdFCUKywtYQh8BVX0NDVh4cXaeJAb76EEqtUq8UbXphfHwLE9
         eBz/lVFIS/MFPFMSJ+sip0adVpmHh2wW0fqhUA9YuZmh2XQk9gZj+u4Xd9NO/1YDRdVu
         AmVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jk8-20020ad45d48000000b004c778634ff4si19018289qvb.197.2023.01.16.23.43.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jan 2023 23:43:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHgcW-0005Md-6Y; Tue, 17 Jan 2023 02:43:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pHgcU-0005M5-L4
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 02:42:58 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pHgcS-00054Y-Dy
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 02:42:58 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.98])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 1FA3C1550A7AA;
 Tue, 17 Jan 2023 08:42:52 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 17 Jan
 2023 08:42:51 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R00177359bff-15a9-43e9-ae11-1eb77a248ec2,
 80E99EE0A2DD913C679298F6DB2E78D5E583611C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <356419e3-339d-b45e-c8d2-2e3679e701f4@kaod.org>
Date: Tue, 17 Jan 2023 08:42:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 5/5] hw/nvram/eeprom_at24c: Make reset behavior more
 like hardware
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
CC: <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <hskinnemoen@google.com>, <kfting@nuvoton.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20230116235604.55099-1-peter@pjd.dev>
 <20230116235604.55099-6-peter@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230116235604.55099-6-peter@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 782a0eef-f78e-4458-9159-b580f2d8ea21
X-Ovh-Tracer-Id: 5871568017067510636
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedruddthedguddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepuedutdetleegjefhieekgeffkefhleevgfefjeevffejieevgeefhefgtdfgiedtnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhesphhjugdruggvvhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdgrnhgurhgvfiesrghjrdhiugdrrghupdhjohgvlhesjhhmshdrihgurdgruhdphhhskhhinhhnvghmohgvnhesghhoohhglhgvrdgtohhmpdhkfhhtihhnghesnhhuvhhothhonhdrtghomhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ar1gumz0rLHa

On 1/17/23 00:56, Peter Delevoryas wrote:
> EEPROM's are a form of non-volatile memory. After power-cycling an EEPROM,
> I would expect the I2C state machine to be reset to default values, but I
> wouldn't really expect the memory to change at all.


> 
> The current implementation of the at24c EEPROM resets its internal memory on
> reset. This matches the specification in docs/devel/reset.rst:
> 
>    Cold reset is supported by every resettable object. In QEMU, it means we reset
>    to the initial state corresponding to the start of QEMU; this might differ
>    from what is a real hardware cold reset. It differs from other resets (like
>    warm or bus resets) which may keep certain parts untouched.
> 
> But differs from my intuition. For example, if someone writes some information
> to an EEPROM, then AC power cycles their board, they would expect the EEPROM to
> retain that information. It's very useful to be able to test things like this
> in QEMU as well, to verify software instrumentation like determining the cause
> of a reboot.

Yes. should we take into account the "writable" property  ? It is not set to
false in any model but it could.

Thanks,

C.

> Fixes: 5d8424dbd3e8 ("nvram: add AT24Cx i2c eeprom")
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> ---
>   hw/nvram/eeprom_at24c.c | 22 ++++++++++------------
>   1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> index bb9ee75864fe..6bcded7b496c 100644
> --- a/hw/nvram/eeprom_at24c.c
> +++ b/hw/nvram/eeprom_at24c.c
> @@ -185,18 +185,6 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
>       }
>   
>       ee->mem = g_malloc0(ee->rsize);
> -
> -}
> -
> -static
> -void at24c_eeprom_reset(DeviceState *state)
> -{
> -    EEPROMState *ee = AT24C_EE(state);
> -
> -    ee->changed = false;
> -    ee->cur = 0;
> -    ee->haveaddr = 0;
> -
>       memset(ee->mem, 0, ee->rsize);
>   
>       if (ee->blk) {
> @@ -214,6 +202,16 @@ void at24c_eeprom_reset(DeviceState *state)
>       }
>   }
>   
> +static
> +void at24c_eeprom_reset(DeviceState *state)
> +{
> +    EEPROMState *ee = AT24C_EE(state);
> +
> +    ee->changed = false;
> +    ee->cur = 0;
> +    ee->haveaddr = 0;
> +}
> +
>   static Property at24c_eeprom_props[] = {
>       DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, 0),
>       DEFINE_PROP_BOOL("writable", EEPROMState, writable, true),

