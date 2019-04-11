Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp6980200wrx;
        Thu, 11 Apr 2019 02:52:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxqgQo1fCkjnf4tDfCf+l7WWC21FjWz70cNZLhefBdcMZERcPbmznWtbjmSnoTcDK7kus0z
X-Received: by 2002:a5d:6406:: with SMTP id z6mr7356162wru.266.1554976322935;
        Thu, 11 Apr 2019 02:52:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554976322; cv=none;
        d=google.com; s=arc-20160816;
        b=x5I1i8zh7zFsu9BVxI+7DQHX9D3HefRcFxm5zN+B46oDNdSL/21HEP994VAFndxq3l
         nEZYcgHSH/mZk6FlwYElmZJv9e24JTfY93+cSOJkss3Q+DOHFXPvxbku9dtXX0/WLs+6
         /tHGAwNX9+wLh110+1iygJMOSznrn4lUnqScIxpsX2XbjO2NczAMQM9XDWMZXigcE64z
         /0p3DBRdI4XC8ZjiEqDzCOzwNksz7jBi9zgONE+0S9N4GB3Gp640f0KoZASBc57Xm22x
         hus3VSySLERB6lcBoNAsTdNSFsx5fZDYKWMgOnn+ioB/jf/enTOI0AB596ckAuZNqQD3
         Fsnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=Mp30IB44MiPLuhouHlkUWN/YLA9o/SrFfSccwHJCheU=;
        b=aIvffDlIj4puCJp85+G4gzersUqkj0oZ4KG0cqUAsn9VI5fcUr34HyK/A/0Ye9ttAt
         I/O6fr0skzX3HO1pkJcFkKHiuBSSYN7PDOYb8p32EoeXm3I7XVQcyYIT3l5RSaTG8fHe
         0XP20AYxVzPi7+yebi7p8TBL0wsA+q3QFkRf8ulp1Ht5224nbBGtPaw2dvP4hajQVLy8
         kZk2Y8nv1gJCMMi6AoZqZOIal8lSDk9aw+Z1TyrgodETPLUJe5X3cGuZQGxE9fWqi1iu
         Km0/Tpd6fsMFoC1URw6SvZv3fiwd7RQA+ipztxcd46e5sMq2M2YZe46xFhmCOPD0Tk1z
         IHvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3si25659071wri.171.2019.04.11.02.52.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Apr 2019 02:52:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45302 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEWNG-0002FC-1C
	for alex.bennee@linaro.org; Thu, 11 Apr 2019 05:52:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47630)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEWN1-0002DW-KD
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 05:51:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEWN0-0006Dg-IR
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 05:51:47 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53854)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hEWN0-0006DQ-A1
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 05:51:46 -0400
Received: by mail-wm1-f66.google.com with SMTP id q16so5878420wmj.3
	for <qemu-arm@nongnu.org>; Thu, 11 Apr 2019 02:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Mp30IB44MiPLuhouHlkUWN/YLA9o/SrFfSccwHJCheU=;
	b=n1tapSMoLeDH3cJxe4fpJuiw+AZpFmadf9I1QFYt8Ct3t9ypWF7HncffDfxqWk4KEp
	e/ck3OuqYQRHtLdiC/o2yp2y3u7JdjqpW4wG10S/iVVLJHuw+xe1v41jS9IgiMEm5Rdq
	nbrbj0EgADFhn8DJygl1J4lv51l5v9wdVEH+dUHPko3DSVZqpIjq4UxPjf0T/GYX0zXR
	37UWqWJxbnZDi9IOsxOIcxAHzMRgBhhENXSSWZFFYRSCP8YLvQfHz+qqswzXzm7b/Xx0
	AHzIhBofA8Ncyy4wtr/iaXpzjmWzoyH5Vnpo6gN+AQC/8Hrm2lGobxB2lRU9VV05SrPg
	jNYQ==
X-Gm-Message-State: APjAAAVaPazDrUu/7yO5+l6GIYHAqQuzQoajkttw1c03zC4cXH+t6Fok
	CJlLON1yWwThuKlInI+2IyebIA==
X-Received: by 2002:a7b:c155:: with SMTP id z21mr6022648wmi.1.1554976305402;
	Thu, 11 Apr 2019 02:51:45 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193])
	by smtp.gmail.com with ESMTPSA id d3sm9586088wmf.46.2019.04.11.02.51.44
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Apr 2019 02:51:44 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190315032629.21234-1-richard.henderson@linaro.org>
	<20190315032629.21234-17-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <cd584bda-744e-f25f-a35d-cda8dcbeec09@redhat.com>
Date: Thu, 11 Apr 2019 11:51:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190315032629.21234-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 16/23] aspeed/scu: Use
 qemu_guest_getrandom_nofail
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nc36aWYyOk5C

On 3/15/19 4:26 AM, Richard Henderson wrote:
> The random number is intended for use by the guest.  As such, we should
> honor the -seed argument for reproducibility.  Use the *_nofail routine
> instead of rolling our own error handling locally.
> 
> Cc: qemu-arm@nongnu.org
> Cc: Cédric Le Goater <clg@kaod.org>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/misc/aspeed_scu.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index c8217740ef..ab1e18ed4b 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -16,7 +16,7 @@
>  #include "qapi/visitor.h"
>  #include "qemu/bitops.h"
>  #include "qemu/log.h"
> -#include "crypto/random.h"
> +#include "qemu/guest-random.h"
>  #include "trace.h"
>  
>  #define TO_REG(offset) ((offset) >> 2)
> @@ -157,14 +157,8 @@ static const uint32_t ast2500_a1_resets[ASPEED_SCU_NR_REGS] = {
>  
>  static uint32_t aspeed_scu_get_random(void)
>  {
> -    Error *err = NULL;
>      uint32_t num;
> -
> -    if (qcrypto_random_bytes((uint8_t *)&num, sizeof(num), &err)) {
> -        error_report_err(err);
> -        exit(1);
> -    }
> -
> +    qemu_guest_getrandom_nofail(&num, sizeof(num));
>      return num;
>  }
>  
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
