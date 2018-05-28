Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2495180wre;
        Mon, 28 May 2018 06:48:47 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKKPBW7va06yEgLVHFZWVt1peQgcUe41o1+x7b80HrNu+zlL+gKEhi/1O/8ipww8EBE5HE3
X-Received: by 2002:ac8:2724:: with SMTP id g33-v6mr12222283qtg.37.1527515327282;
        Mon, 28 May 2018 06:48:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527515327; cv=none;
        d=google.com; s=arc-20160816;
        b=Ldr3opW5lZejdnT8GMALlaCvrkh/7rCFq6Swo7iOgcKGkL64fC8IxD2i7jvAX4G350
         0nNS6K6MkA651bWy4yX76dmPF83xHq4bzoyNRlqvOMi2aR8WcBfM+xqeU4PqAIUdWbxU
         1V+MfFrVZyPAFYXxU3p5kYudkZ3LWKAZ+DxRLag2uibJC/KmTCNNmVgO3mVu5+3wnw0c
         hvSmzOCdIcdtkN8Hqg0EZ/bAYbLVLqySl7Yt0wX/6gvwZViAobZW8lwf53zlKRZgPBoQ
         uzOehEXaLH8RYze05+H63AdwVaYFOPyCRg2zD5TNVXoqpiVN6CI2J0OUvDXQf64pHCBS
         k/Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from
         :arc-authentication-results;
        bh=MrXl9RURvPYTzCQ8/CsDOERhy9m93oxk/U4+bb/r2Hk=;
        b=CHS5iY/01NuJafzAb3kRtpOWt85iCGdzrHtRNuFHofXMsxvmjDQvtFCXx8YjKXq8lQ
         cgxcOGYaO3xbHk25eQjhCFGpGtQ6qt604MZ/YhJdkXgnaVKQ8xjvlS7kNqjO//Mq1p1o
         3hshDMe94tHPthCg5/jPbVIkngUrpZbVaogblBWI8alSZaNM5rXb0HJmuakVoik9PpZB
         XSIuXrtfqS54GlJqqz4nF7faZlwC3E4ozGbrFvfkFp9ETxuTJgdwaNAs6FCIL165W4Df
         IDZPi0HSTjqZnQYV0NOyOgxM1J40k4zid7B2N/0KitSaX/YxwXYygVhJqllum2ryZkXQ
         aWuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p10-v6si1896170qvn.220.2018.05.28.06.48.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 06:48:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56348 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNIVy-00070h-Rc
	for alex.bennee@linaro.org; Mon, 28 May 2018 09:48:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34433)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNIUe-0006fr-Fi
	for qemu-devel@nongnu.org; Mon, 28 May 2018 09:47:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNIUZ-0008Al-Fb
	for qemu-devel@nongnu.org; Mon, 28 May 2018 09:47:24 -0400
Received: from 17.mo3.mail-out.ovh.net ([87.98.178.58]:34227)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fNIUZ-00089W-8j
	for qemu-devel@nongnu.org; Mon, 28 May 2018 09:47:19 -0400
Received: from player729.ha.ovh.net (unknown [10.109.108.70])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 7A2BE1B999A
	for <qemu-devel@nongnu.org>; Mon, 28 May 2018 15:47:16 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: postmaster@kaod.org)
	by player729.ha.ovh.net (Postfix) with ESMTPSA id 591A65E00E0;
	Mon, 28 May 2018 15:47:11 +0200 (CEST)
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20180528124621.22977-1-joel@jms.id.au>
Message-ID: <9959794d-6d3b-b797-bfc8-b548d54378ad@kaod.org>
Date: Mon, 28 May 2018 15:47:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180528124621.22977-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 604608251877034923
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrheeigdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.178.58
Subject: Re: [Qemu-devel] [PATCH] aspeed_scu: Implement RNG register
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8+6G2CC+hlOP

Hello Joel, 

On 05/28/2018 02:46 PM, Joel Stanley wrote:
> The ASPEED SoCs contain a single register that returns random data when
> read. This models that register so that guests can use it.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  hw/misc/aspeed_scu.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index 5e6d5744eeca..8fa0cecf0fa1 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -16,6 +16,7 @@
>  #include "qapi/visitor.h"
>  #include "qemu/bitops.h"
>  #include "qemu/log.h"
> +#include "crypto/random.h"
>  #include "trace.h"
>  
>  #define TO_REG(offset) ((offset) >> 2)
> @@ -154,6 +155,18 @@ static const uint32_t ast2500_a1_resets[ASPEED_SCU_NR_REGS] = {
>       [BMC_DEV_ID]      = 0x00002402U
>  };
>  
> +static uint32_t aspeed_scu_get_random(void)
> +{
> +    Error *err = NULL;
> +    uint32_t num;
> +
> +    if (qcrypto_random_bytes((uint8_t *)&num, sizeof(num), &err)) {
> +        error_report_err(err);
> +    }
> +
> +    return num;
> +}
> +
>  static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsigned size)
>  {
>      AspeedSCUState *s = ASPEED_SCU(opaque);
> @@ -167,6 +180,9 @@ static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsigned size)
>      }
>  
>      switch (reg) {
> +    case RNG_DATA:
> +        return aspeed_scu_get_random();

may be we could test bit 1 of RNG_CTRL to check if it is enabled or not.

> +        break;
>      case WAKEUP_EN:
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "%s: Read of write-only offset 0x%" HWADDR_PRIx "\n",
> @@ -287,6 +303,9 @@ static void aspeed_scu_realize(DeviceState *dev, Error **errp)
>                            TYPE_ASPEED_SCU, SCU_IO_REGION_SIZE);
>  
>      sysbus_init_mmio(sbd, &s->iomem);
> +
> +    if (qcrypto_random_init(errp))
> +        return;
>  }

Isn't this routine called from main() already ? 

C. 

>  
>  static const VMStateDescription vmstate_aspeed_scu = {
> 

