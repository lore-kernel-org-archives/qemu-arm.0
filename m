Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3583333wre;
        Tue, 29 May 2018 06:39:54 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIPDV3U32D/T26/3nA3sODkmmcKCU5S9EzMkAlhDeREfwrpvyN918OXURnzq+PUND9KFj7r
X-Received: by 2002:a37:38cf:: with SMTP id f198-v6mr15248830qka.156.1527601194247;
        Tue, 29 May 2018 06:39:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527601194; cv=none;
        d=google.com; s=arc-20160816;
        b=ObPUDRat6slHz8yzUukPwWt3sIlJ+PeSJLQfEOP0mXo/LsSo9Yv72VlBxP0ftBJP/m
         FVAKGphxGdv+OT8EjwB0GL0VBJ5hjRNgJPuhiTNNBpX8F3ATPDZQCq2MQn/6+IQWddBR
         t46+mMSm9vHADeoxJSN7nWrr0JEUUYCJGWJ118JQULkv5yleGydPilCVQ1bzOGQnNzsH
         uW8rUcgJzobVMhi/NydFDDASBRu791H5S4gpe0YNiBKjDLgaZsLGyJG5Ny7BCw+eskjP
         JHoyWMnnODfc6UQRoUzKBR8SzX7zalXZJEm5p6XzC0DZwOw6I9xjMiRoRmv5i7OjFQ0E
         tolQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=MMgAlszWoxCepnk6zJF8wqy8sSw+X26q37bUZ5nf31Q=;
        b=uGuypy3Xt6ubOSbbjAXL82LIjb5f66hfL7vthDBS0aVBp87Uuy2dKotsgbEfnBjgX8
         T15Vh4GkEUOz8xTnCcjnYYBS1eKzZOVKPbI7zqB+GPrHZ6C5LntRnxaDwPm41wPMF4Ba
         rCS86u1oTHvH9qOuhMccdwRekH2PlaG/mKmv/CRd/4j2TTFX6bn9WhIMQUo/uuwUGoFc
         9Lt6cFk0I7R2owFjyJfUnVervy72Nz9KsBt0+zalZLYLH92WQqFcnRpahkRih1nIrMqu
         1p1UAsh+8XonVu/JCPZcdhkNT5O7wY1zet125/k2/9+zO867FeQmAlYJCx40zdA3q1OS
         GM0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VQRmM3DA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k91-v6si7337985qte.363.2018.05.29.06.39.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 06:39:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VQRmM3DA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33092 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNeqv-0004Tq-QI
	for alex.bennee@linaro.org; Tue, 29 May 2018 09:39:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54337)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNeql-0004TU-9w
	for qemu-arm@nongnu.org; Tue, 29 May 2018 09:39:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNeqi-00056T-5u
	for qemu-arm@nongnu.org; Tue, 29 May 2018 09:39:43 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:44135)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNeqi-00055r-1K; Tue, 29 May 2018 09:39:40 -0400
Received: by mail-qk0-x243.google.com with SMTP id 185-v6so11447224qkk.11;
	Tue, 29 May 2018 06:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=MMgAlszWoxCepnk6zJF8wqy8sSw+X26q37bUZ5nf31Q=;
	b=VQRmM3DAUY88pXmJja1C5V336X9iLzvgmXEeRz3n4Ki4ZC4p1hckjb7bloGSk5Xljl
	QIQs0oLgEXIse+cISaUmQX2POLH37MHMgswiLqWXEdxIP9SXHGTGHh9jwkOQeHXrWMxb
	UecJHb7z/vp4yckFdp0SJuSDDw7rHVF2t6G26Yvm1dnTUXg4JgbInfk9MZhIECPrm+8e
	YoXGTMTu+FRlvfHmg3qTQfwAfrJEFtfm5Njs/3MwmSsJ80F4THzQgh+oW35//cjr/FB0
	YSZNbo0H1OafkTsAXEeKbxN5m3tCLFI1c/6Vl/O38/MgeuvXE8zOzPY0SiT1GOawxN3r
	s5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=MMgAlszWoxCepnk6zJF8wqy8sSw+X26q37bUZ5nf31Q=;
	b=BtJ9Jsiv9siU06gCdJQQW7EY0u9II/z6oF4GNvbMPXmbSMqNYf+dhVB2rlk7Ho5wih
	9gaDlsaOpYAzGO0KkRIMSWE7KoksFdmD0NyYvr3a5SacB9L7f2Yfa0OAESQnDRxjL/vI
	6w+3WAwX6Yoz4j1q8H7MHEb8qeR/TpF3Q5e9Gt0Sv6q3L6b5MQMF6WOaZnZxXal2lODL
	LNX5TKSFut+kUzXx3nMYpL+XQZVUd6dftP2u/+4xFi7jIsP1iSy1BFDdh3p1cVqDz3It
	WjpCjkNo2HQo73axyDvL0qs2fWIhuOT6seYpdvLjOZwOeBDLBq/jcFQqX6Q/0eJnZk3N
	oGoA==
X-Gm-Message-State: ALKqPwcENfH9iitR7xLdSeq3IBZ0hREm8jHnPzhs2Y93lq+3dTx78WFZ
	8fvQ/wt5pDrCwopzp/GGMEg=
X-Received: by 2002:a37:a441:: with SMTP id
	n62-v6mr7445850qke.125.1527601179404; 
	Tue, 29 May 2018 06:39:39 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	x4-v6sm5357545qti.7.2018.05.29.06.39.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 06:39:38 -0700 (PDT)
To: Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20180529041946.9481-1-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <c953d1dd-8e43-c781-9c4e-434ad1f9c084@amsat.org>
Date: Tue, 29 May 2018 10:39:35 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180529041946.9481-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [PATCH v3] aspeed_scu: Implement RNG register
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zJFWGPhERbtZ

On 05/29/2018 01:19 AM, Joel Stanley wrote:
> The ASPEED SoCs contain a single register that returns random data when
> read. This models that register so that guests can use it.
> 
> The random number data register has a corresponding control register,
> however it returns data regardless of the state of the enabled bit, so
> the model follows this behaviour.
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
> v2:
>  - Remove call to qcrypto_random_init as this is done in main()
> v3:
>  - Add Cédric's reviewed-by
>  - Add a comment about why we don't check for the rng enable bit
> ---
>  hw/misc/aspeed_scu.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index 5e6d5744eeca..96db052389cc 100644
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
> @@ -167,6 +180,12 @@ static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsigned size)
>      }
>  
>      switch (reg) {
> +    case RNG_DATA:
> +        /* On hardware, RNG_DATA works regardless of
> +         * the state of the enable bit in RNG_CTRL
> +         */
> +        s->regs[RNG_DATA] = aspeed_scu_get_random();
> +        break;
>      case WAKEUP_EN:
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "%s: Read of write-only offset 0x%" HWADDR_PRIx "\n",
> 
