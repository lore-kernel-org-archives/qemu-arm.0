Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1006001lfb;
        Wed, 6 May 2020 06:46:37 -0700 (PDT)
X-Google-Smtp-Source: APiQypLIohX8APkulJMb3HpJzTcDKv1U0gtmSJmIAVnfV7eEcwacgsyoTBKd0gRKONWV2P5Rf5iq
X-Received: by 2002:ac8:6c6:: with SMTP id j6mr8247119qth.194.1588772797157;
        Wed, 06 May 2020 06:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588772797; cv=none;
        d=google.com; s=arc-20160816;
        b=HRH6x+AGMYe5DlPxXJWnS78HBYVVEDtofR3YiuRWjK1e+uFxLqIz5IVdJNEJa9E6HW
         ZKe6Ec6QM6tEAc+wILilmJCrPzkPpBQceq/+b09XrHkJPQ/BVdJekexc1wKADdqGUYwH
         +hc/VNqPrwpYQIRSvY+bAAL+/bUAuko2+nUnmC+pLWjGunhRLOeB9eC79KerzHXhLD/x
         y8vNNLr0KpIpZ1dxoaAgzTHKjCRPxvUBvYRJ5GkljMaHAVn6xjT8RHrgoDf+baeIP/Nf
         6QQWWFRwdYQ3nK4pPZgWVuT4SH5L/09pp7bLELKxPzFhhiDUBEgxCDSIV9EglmJjOgOB
         BcZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=TrYoM+eJht0zSS/2W5IbFc4LihAnRZro/Vb+wwL3SvU=;
        b=HtxGux0VbIeAE50v+cStQBUSG62EcD3u9McgcFSrXIZDHHq84GvTHDefRr8oKeenxK
         0yzxgaA2wG/6uiA3j52RyVRoWAjliSJ+S6uGHr11mpNGTtKc8BCZL1r2tdfhBKrKJEJZ
         ArdCQTnXyD94QVEKnP0NejhChifaEF6CRFXARNnvYatuagzXzMcyq31B62VG+8uOaLW6
         HacbhON2CxNZms00s2GLG1cMtVYN9i+6omsCEYm0fBOCDnYsT3atMEF5mxoVqr/a5dJX
         XO6h8NY5y7onsyn2LD66eIOsAj45CxcIc80o6sqoUeLMj+gP4jOoJ1yfcdeX1Ib5ziF6
         ZnJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id p20si938109qtn.133.2020.05.06.06.46.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 May 2020 06:46:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWKNg-0007E9-Jk
	for alex.bennee@linaro.org; Wed, 06 May 2020 09:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jWKNY-0007Cn-Qq
 for qemu-arm@nongnu.org; Wed, 06 May 2020 09:46:28 -0400
Received: from 19.mo3.mail-out.ovh.net ([178.32.98.231]:45583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jWKNW-0000Wo-MP
 for qemu-arm@nongnu.org; Wed, 06 May 2020 09:46:28 -0400
Received: from player772.ha.ovh.net (unknown [10.108.54.203])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id DF5CF24F005
 for <qemu-arm@nongnu.org>; Wed,  6 May 2020 15:46:14 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player772.ha.ovh.net (Postfix) with ESMTPSA id C5DAE12254ADE;
 Wed,  6 May 2020 13:46:09 +0000 (UTC)
Subject: Re: [PATCH] aspeed: sdmc: Implement AST2600 locking behaviour
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20200505090136.341426-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <46a86f01-0e46-f96f-c1d7-d4ffc9f2974d@kaod.org>
Date: Wed, 6 May 2020 15:46:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200505090136.341426-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13809725309549906752
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrjeekgdeigecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeffvddtudegieefudeugffhjefgieegieegleettdehgfeiieevueeihfegfefgnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeejvddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=178.32.98.231; envelope-from=clg@kaod.org;
 helo=19.mo3.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/06 09:46:15
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ezdhpCd7MtR8

On 5/5/20 11:01 AM, Joel Stanley wrote:
> The AST2600 handles this differently with the extra 'hardlock' state, so
> move the testing to the soc specific class' write callback.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  hw/misc/aspeed_sdmc.c | 55 +++++++++++++++++++++++++++++++++++--------
>  1 file changed, 45 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
> index 02940e7c2a76..7c688becf8c7 100644
> --- a/hw/misc/aspeed_sdmc.c
> +++ b/hw/misc/aspeed_sdmc.c
> @@ -23,7 +23,12 @@
>  
>  /* Protection Key Register */
>  #define R_PROT            (0x00 / 4)
> +#define   PROT_UNLOCKED      0x01
> +#define   PROT_HARDLOCKED    0x10  /* AST2600 */
> +#define   PROT_SOFTLOCKED    0x00
> +
>  #define   PROT_KEY_UNLOCK     0xFC600309
> +#define   PROT_KEY_HARDLOCK   0xDEADDEAD /* AST2600 */
>  
>  /* Configuration Register */
>  #define R_CONF            (0x04 / 4)
> @@ -130,16 +135,6 @@ static void aspeed_sdmc_write(void *opaque, hwaddr addr, uint64_t data,
>          return;
>      }
>  
> -    if (addr == R_PROT) {
> -        s->regs[addr] = (data == PROT_KEY_UNLOCK) ? 1 : 0;
> -        return;
> -    }
> -
> -    if (!s->regs[R_PROT]) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: SDMC is locked!\n", __func__);
> -        return;
> -    }
> -
>      asc->write(s, addr, data);
>  }
>  
> @@ -291,6 +286,16 @@ static uint32_t aspeed_2400_sdmc_compute_conf(AspeedSDMCState *s, uint32_t data)
>  static void aspeed_2400_sdmc_write(AspeedSDMCState *s, uint32_t reg,
>                                     uint32_t data)
>  {
> +    if (reg == R_PROT) {
> +        s->regs[reg] = (data == PROT_KEY_UNLOCK) ? PROT_UNLOCKED : PROT_SOFTLOCKED;
> +        return;
> +    }
> +
> +    if (!s->regs[R_PROT]) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: SDMC is locked!\n", __func__);
> +        return;
> +    }
> +
>      switch (reg) {
>      case R_CONF:
>          data = aspeed_2400_sdmc_compute_conf(s, data);
> @@ -339,6 +344,16 @@ static uint32_t aspeed_2500_sdmc_compute_conf(AspeedSDMCState *s, uint32_t data)
>  static void aspeed_2500_sdmc_write(AspeedSDMCState *s, uint32_t reg,
>                                     uint32_t data)
>  {
> +    if (reg == R_PROT) {
> +        s->regs[reg] = (data == PROT_KEY_UNLOCK) ? PROT_UNLOCKED : PROT_SOFTLOCKED;
> +        return;
> +    }
> +
> +    if (!s->regs[R_PROT]) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: SDMC is locked!\n", __func__);
> +        return;
> +    }
> +
>      switch (reg) {
>      case R_CONF:
>          data = aspeed_2500_sdmc_compute_conf(s, data);
> @@ -395,7 +410,27 @@ static uint32_t aspeed_2600_sdmc_compute_conf(AspeedSDMCState *s, uint32_t data)
>  static void aspeed_2600_sdmc_write(AspeedSDMCState *s, uint32_t reg,
>                                     uint32_t data)
>  {
> +    if (s->regs[R_PROT] == PROT_HARDLOCKED) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: SDMC is locked until system reset!\n",
> +                __func__);
> +        return;
> +    }
> +
> +    if (reg != R_PROT && s->regs[R_PROT] == PROT_SOFTLOCKED) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: SDMC is locked!\n", __func__);
> +        return;
> +    }
> +
>      switch (reg) {
> +    case R_PROT:
> +        if (data == PROT_KEY_UNLOCK)  {
> +            data = PROT_UNLOCKED;
> +        } else if (data == PROT_KEY_HARDLOCK) {
> +            data = PROT_HARDLOCKED;
> +        } else {
> +            data = PROT_SOFTLOCKED;
> +        }
> +        break;
>      case R_CONF:
>          data = aspeed_2600_sdmc_compute_conf(s, data);
>          break;
> 

